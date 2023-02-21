part of layout;

class _LayoutDelegate extends MultiChildLayoutDelegate {
  _LayoutDelegate(this.sizes);

  final void Function(Size appbarSize, Size bottomNavigationSize,
      Size bottomSheet, Size body, Size spaceSize)? sizes;

  @override
  void performLayout(Size size) {
    double maxHeight = size.height;
    double maxWight = size.width;

    Size appbarSize = Size.zero;
    Size bottomNavigationSize = Size.zero;
    Size bottomSheet = Size.zero;
    Size body = Size.zero;

    if (hasChild(_LayoutPostion.appbar)) {
      appbarSize =
          layoutChild(_LayoutPostion.appbar, BoxConstraints.loose(size));
      maxHeight -= appbarSize.height;
      positionChild(
        _LayoutPostion.appbar,
        const Offset(1, 1),
      );
    }
    if (hasChild(_LayoutPostion.bottonNavigation)) {
      bottomNavigationSize = layoutChild(
          _LayoutPostion.bottonNavigation, BoxConstraints.loose(size));
      maxHeight -= bottomNavigationSize.height;
      positionChild(
        _LayoutPostion.bottonNavigation,
        Offset(0, (size.height - bottomNavigationSize.height)),
      );
    }
    if (hasChild(_LayoutPostion.bottomSheet)) {
      bottomSheet = layoutChild(_LayoutPostion.bottomSheet,
          BoxConstraints.loose(Size(maxWight, maxHeight)));
      positionChild(
        _LayoutPostion.bottomSheet,
        Offset(0,
            size.height - (bottomNavigationSize.height + bottomSheet.height)),
      );
    }
    if (hasChild(_LayoutPostion.body)) {
      body = layoutChild(
          _LayoutPostion.body, BoxConstraints.tight(Size(maxWight, maxHeight)));
      positionChild(
        _LayoutPostion.body,
        Offset(0, size.height - (maxHeight + bottomNavigationSize.height)),
      );
    }
    sizes?.call(appbarSize, bottomNavigationSize, bottomSheet, body, size);
  }

  @override
  bool shouldRelayout(covariant _LayoutDelegate oldDelegate) {
    return true;
  }
}
