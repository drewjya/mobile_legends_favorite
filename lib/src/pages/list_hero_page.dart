// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobile_legends_favorite/src/controller/favorite_controller.dart';
import 'package:mobile_legends_favorite/src/controller/hero_controller.dart';
import 'package:mobile_legends_favorite/src/pages/detail_hero_page.dart';

class ListHeroPage extends StatefulWidget {
  const ListHeroPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  final String category;

  @override
  State<ListHeroPage> createState() => _ListHeroPageState();
}

class _ListHeroPageState extends State<ListHeroPage> {
  final instance = HeroControl.instance;
  final favoritInstance = FavoriteController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return GridView.builder(
            itemCount: instance.allHero.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              bool isFavorited =
                  favoritInstance.heroId.contains(instance.allHero[index]);
              final hero = instance.allHero[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailHeroPage(heroModel: hero),
                        ));
                    isFavorited = favoritInstance.heroId
                        .contains(instance.allHero[index]);
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                              hero.heroAvatar,
                            ),
                            fit: BoxFit.cover)),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 5),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  hero.heroName,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                if (!isFavorited) {
                                  favoritInstance.addFavorite(hero);
                                } else {
                                  favoritInstance.removeFavorite(hero);
                                }
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.star,
                                color:
                                    isFavorited ? Colors.yellow : Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
