library search_appbar;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ValueChanged<String?> query;
  final String? typeName;
  final Widget title;
  final List<Widget>? actions;
  final Clip? clipBehavior;
  final bool primary;
  final Widget? leading;
  final Color? backgroundColor;
  final IconThemeData? actionsIconTheme;
  final bool automaticallyImplyLeading;
  final Color? surfaceTintColor;
  final PreferredSizeWidget? bottom;
  final double bottomOpacity;
  final bool? centerTitle;
  final double? elevation;
  final bool excludeHeaderSemantics;
  final Widget? flexibleSpace;
  final bool forceMaterialTransparency;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final double? leadingWidth;
  final ScrollNotificationPredicate notificationPredicate;
  final double? scrolledUnderElevation;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final double? titleSpacing;
  final TextStyle? titleTextStyle;
  final double? toolbarHeight;
  final double toolbarOpacity;
  final TextStyle? toolbarTextStyle;

  const SearchAppBar(
      {super.key,
      required this.title,
      this.actions,
      required this.query,
      this.typeName,
      this.clipBehavior,
      this.primary = true,
      this.leading,
      this.backgroundColor,
      this.actionsIconTheme,
      this.automaticallyImplyLeading = true,
      this.surfaceTintColor,
      this.bottom,
      this.bottomOpacity = 1.0,
      this.centerTitle,
      this.elevation,
      this.excludeHeaderSemantics = false,
      this.flexibleSpace,
      this.forceMaterialTransparency = false,
      this.foregroundColor,
      this.iconTheme,
      this.leadingWidth,
      this.notificationPredicate = defaultScrollNotificationPredicate,
      this.scrolledUnderElevation,
      this.shadowColor,
      this.shape,
      this.systemOverlayStyle,
      this.titleSpacing,
      this.titleTextStyle,
      this.toolbarHeight,
      this.toolbarOpacity = 1.0,
      this.toolbarTextStyle});

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _SearchAppBarState extends State<SearchAppBar> {
  TextEditingController? _controller;

  @override
  Widget build(BuildContext context) => AppBar(
        clipBehavior: widget.clipBehavior,
        primary: widget.primary,
        leading: widget.leading,
        backgroundColor: widget.backgroundColor,
        actionsIconTheme: widget.actionsIconTheme,
        automaticallyImplyLeading: widget.automaticallyImplyLeading,
        surfaceTintColor: widget.surfaceTintColor,
        bottom: widget.bottom,
        bottomOpacity: widget.bottomOpacity,
        centerTitle: widget.centerTitle,
        elevation: widget.elevation,
        excludeHeaderSemantics: widget.excludeHeaderSemantics,
        flexibleSpace: widget.flexibleSpace,
        forceMaterialTransparency: widget.forceMaterialTransparency,
        foregroundColor: widget.foregroundColor,
        iconTheme: widget.iconTheme,
        leadingWidth: widget.leadingWidth,
        notificationPredicate: widget.notificationPredicate,
        scrolledUnderElevation: widget.scrolledUnderElevation,
        shadowColor: widget.shadowColor,
        shape: widget.shape,
        systemOverlayStyle: widget.systemOverlayStyle,
        titleSpacing: widget.titleSpacing,
        titleTextStyle: widget.titleTextStyle,
        toolbarHeight: widget.toolbarHeight,
        toolbarOpacity: widget.toolbarOpacity,
        toolbarTextStyle: widget.toolbarTextStyle,
        title: _controller != null
            ? TextField(
                autofocus: true,
                onSubmitted: (v) => widget.query(v),
                onChanged: (v) => widget.query(v),
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Search ${widget.typeName}",
                  border: InputBorder.none,
                ),
              )
            : widget.title,
        actions: [
          if (_controller == null)
            IconButton(
              icon: const Icon(Icons.search_rounded),
              onPressed: () {
                setState(() {
                  widget.query(null);
                  _controller = TextEditingController();
                });
              },
            ),
          if (_controller != null)
            IconButton(
              icon: const Icon(Icons.close_rounded),
              onPressed: () {
                widget.query(null);
                setState(() => _controller = null);
              },
            ),
          if (widget.actions != null) ...widget.actions!,
        ],
      );
}
