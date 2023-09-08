import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:pokemon/product/constants/locale/local_keys.g.dart';
import 'package:pokemon/product/init/navigation/navigation_router.dart';

@RoutePage()
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        PokemonsRoute(),
        FavoritesRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) =>
          _buildBottomNavigationBar(tabsRouter),
    );
  }

  Widget _buildBottomNavigationBar(TabsRouter tabsRouter) {
    return BottomNavigationBar(
      currentIndex: tabsRouter.activeIndex,
      onTap: tabsRouter.setActiveIndex,
      items: [
        _buildBottomNavigationBarItem(
          LocaleKeys.dashboard_dashboard_view_bottom_navigation_item_pokemons,
          Icons.home,
        ),
        _buildBottomNavigationBarItem(
          LocaleKeys.dashboard_dashboard_view_bottom_navigation_item_favorites,
          Icons.favorite,
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    String text,
    IconData icon,
  ) {
    return BottomNavigationBarItem(
      label: text.tr(),
      icon: Icon(icon),
    );
  }
}
