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
  @override
  Widget build(BuildContext context) {
    final pointSelect = ref.watch(pointSelectProvider);
    final positionUser = ref.watch(posicionProvider);
    final MapController controller = ref.watch(mapControllerProvider);
    return FlutterMap(
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
        // CircleLayer(
        //   circles: [
        //     CircleMarker(
        //       point: LatLng(51.5, -0.09), // center of 't Gooi
        //       radius: 8,
        //       useRadiusInMeter: true,
        //       color: Colors.red.withOpacity(0.3),
        //       borderColor: Colors.red.withOpacity(0.7),
        //       borderStrokeWidth: 2,
        //     )
        //   ],
        // ),
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
                    ref.read(pointSelectProvider.notifier).update((state) => 1);
                  },
                  icon: pointSelect == 1
                      ? SvgPicture.asset('$carpIcon/map_point_active.svg',
                          width: 42, height: 42)
                      : SvgPicture.asset('$carpIcon/map_point_desactive.svg',
                          width: 42, height: 42)),
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
                    ref.read(pointSelectProvider.notifier).update((state) => 2);
                  },
                  icon: pointSelect == 2
                      ? SvgPicture.asset('$carpIcon/map_point_active.svg',
                          width: 42, height: 42)
                      : SvgPicture.asset('$carpIcon/map_point_desactive.svg',
                          width: 42, height: 42)),
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
                    ref.read(pointSelectProvider.notifier).update((state) => 3);
                  },
                  icon: pointSelect == 3
                      ? SvgPicture.asset('$carpIcon/map_point_active.svg',
                          width: 42, height: 42)
                      : SvgPicture.asset('$carpIcon/map_point_desactive.svg',
                          width: 42, height: 42)),
            ),
          ],
        )
      ],
    );
  }
}
