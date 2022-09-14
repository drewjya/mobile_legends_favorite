import 'package:flutter/material.dart';
import 'package:mobile_legends_favorite/src/pages/favorited_page.dart';
import 'package:mobile_legends_favorite/src/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild");
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: const [
          HomePage(),
          FavoritePage(),
        ],
      ),
      bottomNavigationBar: StatefulBuilder(
        builder: (context, setVal) => NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.explore),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.bookmark),
              icon: Icon(Icons.bookmark_border),
              label: 'Favorite',
            ),
          ],
          onDestinationSelected: (value) {
            tabController.index = value;
            setVal(() {});
          },
          selectedIndex: tabController.index,
        ),
      ),
    );
  }
}
