import 'dart:math';
import 'dart:developer' as x;

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:prueba_tecnica_veflat/core/constant.dart';

import '../provider/provider.dart';

class MapFlutterBackground extends ConsumerStatefulWidget {
  const MapFlutterBackground({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MapFlutterBackgroundState();
}

class _MapFlutterBackgroundState extends ConsumerState<MapFlutterBackground> {
  List<LatLng> getRandomPoints(LatLng start, LatLng end, int numPoints) {
    List<LatLng> points = [];
    points.add(start);

    double latMin = min(start.latitude, end.latitude);
    double latMax = max(start.latitude, end.latitude);
    double lngMin = min(start.longitude, end.longitude);
    double lngMax = max(start.longitude, end.longitude);

    for (int i = 0; i < numPoints; i++) {
      double latDiff = latMax - latMin;
      double lngDiff = lngMax - lngMin;

      double lat = latMin + (latDiff * Random().nextDouble());
      double lng = lngMin + (lngDiff * Random().nextDouble());

      points.add(LatLng(lat, lng));
    }

    points.add(end);
    points.map((e) => x.log(e.toJson().toString()));
    return points;
  }

  @override
  Widget build(BuildContext context) {
    final mostar = ref.watch(mostrarCard);
    final pointSelect = ref.watch(pointSelectProvider);
    final positionUser = ref.watch(posicionProvider);
    final MapController controller = ref.watch(mapControllerProvider);
    return mostar
        ? Image.asset(
            '$carpImagen/imagen_background.png',
            fit: BoxFit.cover,
            alignment: Alignment.centerLeft,
          )
        : FlutterMap(
            mapController: controller,
            options: MapOptions(
              center: positionUser.latitude == 0
                  ? LatLng(11.019870, -74.805144)
                  : LatLng(positionUser.latitude, positionUser.longitude),
              zoom: 17,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                      color: const Color(0xFFB6E13D),
                      strokeWidth: 4,
                      points:
                          //  positionUser.latitude == 0
                          //     ? getRandomPoints(
                          //         LatLng(positionUser.latitude,
                          //             positionUser.longitude),
                          //         LatLng(positionUser.latitude + 0.001,
                          //             positionUser.longitude + 0.0002),
                          //         3)
                          //     : positionUser.latitude == 2
                          //         ? getRandomPoints(
                          //             LatLng(positionUser.latitude,
                          //                 positionUser.longitude),
                          //             LatLng(positionUser.latitude - 0.0008,
                          //                 positionUser.longitude - 0.0011),
                          //             3)
                          //         :
                          getRandomPoints(
                              LatLng(positionUser.latitude,
                                  positionUser.longitude),
                              LatLng(positionUser.latitude - 0.0008,
                                  positionUser.longitude + 0.0002),
                              3))
                ],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: positionUser.latitude == 0
                        ? LatLng(11.019870, -74.805144)
                        : LatLng(positionUser.latitude, positionUser.longitude),
                    width: 80,
                    height: 80,
                    builder: (context) => IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('$carpIcon/map_point_user.svg',
                            width: 60, height: 60)),
                  ),
                  Marker(
                    point: positionUser.latitude == 0
                        ? LatLng(11.020870, -74.805344)
                        : LatLng(positionUser.latitude + 0.001,
                            positionUser.longitude + 0.0002),
                    width: 80,
                    height: 80,
                    builder: (context) => IconButton(
                        onPressed: () {
                          ref
                              .read(pointSelectProvider.notifier)
                              .update((state) => 1);
                        },
                        icon: pointSelect == 1
                            ? SvgPicture.asset('$carpIcon/map_point_active.svg',
                                width: 42, height: 42)
                            : SvgPicture.asset(
                                '$carpIcon/map_point_desactive.svg',
                                width: 42,
                                height: 42)),
                  ),
                  Marker(
                    point: positionUser.latitude == 0
                        ? LatLng(11.019070, -74.804044)
                        : LatLng(positionUser.latitude - 0.0008,
                            positionUser.longitude - 0.0011),
                    width: 80,
                    height: 80,
                    builder: (context) => IconButton(
                        onPressed: () {
                          ref
                              .read(pointSelectProvider.notifier)
                              .update((state) => 2);
                        },
                        icon: pointSelect == 2
                            ? SvgPicture.asset('$carpIcon/map_point_active.svg',
                                width: 42, height: 42)
                            : SvgPicture.asset(
                                '$carpIcon/map_point_desactive.svg',
                                width: 42,
                                height: 42)),
                  ),
                  Marker(
                    point: positionUser.latitude == 0
                        ? LatLng(11.019070, -74.805344)
                        : LatLng(positionUser.latitude - 0.0008,
                            positionUser.longitude + 0.0002),
                    width: 80,
                    height: 80,
                    builder: (context) => IconButton(
                        onPressed: () {
                          ref
                              .read(pointSelectProvider.notifier)
                              .update((state) => 3);
                        },
                        icon: pointSelect == 3
                            ? SvgPicture.asset('$carpIcon/map_point_active.svg',
                                width: 42, height: 42)
                            : SvgPicture.asset(
                                '$carpIcon/map_point_desactive.svg',
                                width: 42,
                                height: 42)),
                  ),
                ],
              )
            ],
          );
  }
}
