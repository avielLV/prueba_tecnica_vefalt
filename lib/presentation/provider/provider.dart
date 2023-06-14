import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

final posicionProvider = StateProvider<LatLng>((ref) {
  return LatLng(0, 0);
});

final pointSelectProvider = StateProvider<int>((ref) {
  return 0;
});

final mapControllerProvider = StateProvider((ref) => MapController());
