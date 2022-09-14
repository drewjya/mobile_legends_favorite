// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobile_legends_favorite/src/config/role_mobile_legends.dart';
import 'package:mobile_legends_favorite/widgets/grid_button.dart';
import 'package:mobile_legends_favorite/widgets/list_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:
                      constraints.maxWidth / constraints.maxHeight,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              children: [
                const GridButton(
                  role: null,
                ),
                ...roleMobileLegend.map((e) => GridButton(
                      role: e,
                    ))
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const ListButton(
                role: null,
              ),
              ...roleMobileLegend.map((e) => ListButton(
                    role: e,
                  ))
            ],
          ),
        );
      }),
    );
  }
}
