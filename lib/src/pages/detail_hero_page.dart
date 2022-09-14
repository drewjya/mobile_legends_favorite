// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobile_legends_favorite/src/controller/favorite_controller.dart';
import 'package:mobile_legends_favorite/src/model/hero_model.dart';
import 'package:mobile_legends_favorite/widgets/badge.dart';

class DetailHeroPage extends StatefulWidget {
  const DetailHeroPage({
    Key? key,
    required this.heroModel,
  }) : super(key: key);

  final HeroModel heroModel;

  @override
  State<DetailHeroPage> createState() => _DetailHeroPageState();
}

class _DetailHeroPageState extends State<DetailHeroPage> {
  final favInstance = FavoriteController.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.heroModel.heroName),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 500,
                  width: 300,
                  margin: const EdgeInsets.only(top: 40),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onDoubleTap: () {
                      if (favInstance.heroId.contains(widget.heroModel)) {
                        favInstance.removeFavorite(widget.heroModel);
                      } else {
                        favInstance.addFavorite(widget.heroModel);
                      }
                      setState(() {});
                    },
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.network(
                          widget.heroModel.heroAvatar,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 530,
                  width: 300,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        onPressed: () {
                          if (favInstance.heroId.contains(widget.heroModel)) {
                            favInstance.removeFavorite(widget.heroModel);
                          } else {
                            favInstance.addFavorite(widget.heroModel);
                          }
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.star,
                          color: favInstance.heroId.contains(widget.heroModel)
                              ? Colors.yellow
                              : Colors.white,
                        )),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text("Role"),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.heroModel.toRole().length,
                        itemBuilder: (BuildContext context, int index) {
                          final role = widget.heroModel.toRole()[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Badge(value: role.data),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: Column(
                    children: [
                      const Text("Role"),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.heroModel.toSpeciality().length,
                        itemBuilder: (BuildContext context, int index) {
                          final role = widget.heroModel.toSpeciality()[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Badge(value: role.data),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
