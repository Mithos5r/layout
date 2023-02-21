library layout;

import 'package:flutter/material.dart';

part 'layout_delegate.dart';
part 'layout_position.dart';

class Layout extends StatelessWidget {
  const Layout({
    super.key,
    this.appbar,
    this.body,
    this.bottonNavigation,
    this.bottomSheet,
    this.sizes,
    this.backgroundColor = Colors.grey,
  });
  final Widget? appbar;
  final Widget? body;
  final Widget? bottonNavigation;
  final Widget? bottomSheet;
  final Color backgroundColor;

  final void Function(Size appbarSize, Size bottomNavigationSize,
      Size bottomSheet, Size body, Size spaceSize)? sizes;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: SafeArea(
        child: CustomMultiChildLayout(
          delegate: _LayoutDelegate(sizes),
          children: [
            if (appbar != null)
              LayoutId(id: _LayoutPostion.appbar, child: appbar!),
            if (body != null)
              LayoutId(
                  id: _LayoutPostion.body,
                  child: SizedBox(height: double.infinity, child: body!)),
            if (bottonNavigation != null)
              LayoutId(
                  id: _LayoutPostion.bottonNavigation,
                  child: bottonNavigation!),
            if (bottomSheet != null)
              LayoutId(id: _LayoutPostion.bottomSheet, child: bottomSheet!),
          ],
        ),
      ),
    );
  }
}
