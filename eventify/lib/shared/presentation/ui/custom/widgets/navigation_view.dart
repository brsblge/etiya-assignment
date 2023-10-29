import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../extensions/build_context_ext.dart';
import 'custom_icon.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({
    super.key,
    required this.items,
    this.controller,
    this.initialPage = 0,
    this.navBarRadius = 0,
    this.extendBody = false,
  });

  final List<NavigationItem> items;
  final NavigationController? controller;
  final int initialPage;
  final double navBarRadius;
  final bool extendBody;

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  late NavigationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? NavigationController();
    _controller._navBarController = _BottomNavBarController(
      initialIndex: widget.initialPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _PageView(
        items: widget.items,
        controller: _controller,
        initialPage: widget.initialPage,
      ),
      bottomNavigationBar: _BottomNavBar(
        items: widget.items,
        controller: _controller._navBarController,
        navBarRadius: widget.navBarRadius,
        onItemTapped: (i) => _controller.navigateToPage(i),
      ),
      extendBody: widget.extendBody,
    );
  }
}

class _PageView extends StatefulWidget {
  const _PageView({
    required this.items,
    this.controller,
    required this.initialPage,
  });

  final List<NavigationItem> items;
  final NavigationController? controller;
  final int initialPage;

  @override
  State<_PageView> createState() => _PageViewState();
}

class _PageViewState extends State<_PageView> {
  late List<NavigationItem> _items;
  late PageController _pageController;
  NavigationController? _navController;

  @override
  void initState() {
    super.initState();
    _items = widget.items;
    _pageController = PageController(
      initialPage: widget.initialPage,
    );
    _navController = widget.controller;
    _navController?._onPageChange = _onPageChange;
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      scrollBehavior: const CupertinoScrollBehavior(),
      physics: const ClampingScrollPhysics(),
      allowImplicitScrolling: true,
      onPageChanged: (page) {
        _navController?._navBarController?.changeSelectedIndex(page);
      },
      children: _items.map((e) => e.pageBuilder()).toList(),
    );
  }

  // Helpers
  void _onPageChange(int page) {
    _pageController.jumpToPage(page);
  }
  // - Helpers
}

class _BottomNavBar extends StatefulWidget {
  const _BottomNavBar({
    required this.items,
    this.controller,
    required this.navBarRadius,
    this.onItemTapped,
  });

  final List<NavigationItem> items;
  final _BottomNavBarController? controller;
  final double navBarRadius;
  final void Function(int)? onItemTapped;

  @override
  State<_BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<_BottomNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.controller?.initialIndex ?? 0;
    widget.controller?._onIndexChange = _onIndexChange;
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.navBarRadius;

    return Container(
      height: MediaQuery.of(context).padding.bottom + 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(borderRadius),
          topLeft: Radius.circular(borderRadius),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 0,
            blurRadius: 16,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
        child: _buildNavBar(),
      ),
    );
  }

  // Helpers
  Widget _buildNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: widget.items
          .map(
            (e) => BottomNavigationBarItem(
              icon: CustomIcon(
                size: 24,
                icon: e.icon,
                imageIcon: e.imageIcon,
              ),
              activeIcon: _ActiveIcon(
                icon: e.icon,
                imageIcon: e.imageIcon,
              ),
              label: e.label,
              tooltip: e.label,
            ),
          )
          .toList(),
      currentIndex: _selectedIndex,
      onTap: (i) {
        widget.onItemTapped?.call(i);
        setState(() => _selectedIndex = i);
      },
    );
  }

  void _onIndexChange(int index) {
    setState(() => _selectedIndex = index);
  }
  // - Helpers
}

class _ActiveIcon extends StatelessWidget {
  const _ActiveIcon({
    this.icon,
    this.imageIcon,
  });

  final IconData? icon;
  final String? imageIcon;

  @override
  Widget build(BuildContext context) {
    const fullSize = 40.0;
    const iconSize = 27.0;
    const padding = (fullSize - iconSize) / 2;

    return Container(
      padding: const EdgeInsets.all(padding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colorScheme.secondaryDisabled,
        border: Border.all(
          color: context.colorScheme.primaryDefault,
          width: 1,
        ),
      ),
      child: CustomIcon(
        icon: icon,
        imageIcon: imageIcon,
        size: iconSize,
        color: context.colorScheme.primaryDefault,
      ),
    );
  }
}

class _BottomNavBarController {
  _BottomNavBarController({this.initialIndex = 0});

  final int initialIndex;
  void Function(int)? _onIndexChange;

  void changeSelectedIndex(int index) {
    _onIndexChange?.call(index);
  }
}

class NavigationController {
  _BottomNavBarController? _navBarController;
  void Function(int)? _onPageChange;

  void navigateToPage(int page) {
    _navBarController?.changeSelectedIndex(page);
    _onPageChange?.call(page);
  }
}

class NavigationItem {
  NavigationItem({
    required this.label,
    this.icon,
    this.imageIcon,
    required this.pageBuilder,
  });

  final String label;
  final IconData? icon;
  final String? imageIcon;
  final Widget Function() pageBuilder;
}
