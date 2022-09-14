import 'package:flutter/material.dart';
import 'package:mobile_legends_favorite/src/controller/favorite_controller.dart';
import 'package:mobile_legends_favorite/src/model/hero_model.dart';
import 'package:mobile_legends_favorite/src/pages/detail_hero_page.dart';
import 'package:mobile_legends_favorite/widgets/badge.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final favoritInstance = FavoriteController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: favoritInstance.heroId.length,
        itemBuilder: (BuildContext context, int index) {
          final data = favoritInstance.heroId[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailHeroPage(heroModel: data),
                    ));
              },
              title: Text(data.heroName),
              leading: CircleAvatar(
                foregroundImage: NetworkImage(data.heroAvatar),
              ),
              subtitle: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ListView.builder(
                  itemCount: data.toRole().length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Badge(value: data.toRole()[index].data),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
