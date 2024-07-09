import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:imei/config/routes/app_routes.dart';
import 'package:imei/config/themes/themes.dart';
import 'package:imei/presentation/pages/home.page.dart';
import 'package:imei/presentation/pages/profile.page.dart';
import 'package:imei/utils/navigation_util.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int pageIndex = 0;
  late final PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: pageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: GNavBar(
            selectedIndex: pageIndex,
            onTabChange: (index) {
              pageIndex = index;
              _pageController.jumpToPage(index);
              setState(() {});
            },
          ),
        ),
        appBar: AppBar(
          toolbarHeight: 80,
          actions: [
            IconButton(
              icon: const Icon(Iconsax.notification),
              onPressed: () {
                Navigation.pushNamed(routeName: AppRoutes.notifications);
              },
            ),
          ],
          title: const Text('Hola $name'),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (value) {
            pageIndex = value;
            setState(() {});
          },
          children: [
            HomePage(size: size),
            Container(
              child: Center(
                child: Text('Historial de servicios'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Servicios '),
              ),
            ),
            ProfilePage(),
          ],
        ));
  }
}

class GNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onTabChange;

  const GNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
        onTabChange: onTabChange,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        tabBackgroundColor: Colors.white,
        color: LightColors.primary,
        activeColor: LightColors.primary,
        tabs: const [
          GButton(
            icon: Iconsax.home,
            textColor: Colors.white,
            iconColor: Color.fromARGB(255, 160, 160, 160),
            hoverColor: Colors.grey,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          ),
          GButton(
            icon: Iconsax.clock,
            iconColor: LightColors.darkGrey,
            textColor: LightColors.primary,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          ),
          GButton(
            icon: Iconsax.shopping_bag4,
            iconColor: LightColors.darkGrey,
            textColor: LightColors.primary,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          ),
          GButton(
            icon: Iconsax.user,
            iconColor: LightColors.darkGrey,
            textColor: LightColors.primary,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          ),
        ],
        selectedIndex: selectedIndex);
  }
}
