import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:prueba_tecnica_veflat/presentation/widgets/card_site.dart';

import '../../core/constant.dart';
import '../provider/provider.dart';
import '../widgets/bar_botton.dart';
import '../widgets/map_flutter_background.dart';
import '../widgets/search.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> titulos = ['Bluebird Coffe', 'Pizza royal', 'Casa Blanca'];
    List<String> images = [
      '$carpImagen/image1.png',
      '$carpImagen/image2.png',
      '$carpImagen/image3.png',
    ];

    return Scaffold(
        body: Stack(
      children: [
        const MapFlutterBackground(),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 47, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Center(
                  child: Search(),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 86,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        scrollDirection: Axis.horizontal,
                        itemCount: titulos.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              ref
                                  .read(pointSelectProvider.notifier)
                                  .update((state) => index + 1);
                            },
                            child: CardSite(
                              imagen: images[index],
                              titulo: titulos[index],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 26),
                    const BarBotton(),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
