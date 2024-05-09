import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const LatLng _kMapCenter = LatLng(22.2842993, 70.7968951);

  static const CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

  late GoogleMapController _controller;

  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    _controller.setMapStyle(value);
  }

  Set<Marker> _createMarker() {
    return {
      const Marker(
          markerId: MarkerId("marker_1"),
          position: _kMapCenter,
          infoWindow: InfoWindow(title: 'Marker 1'),
          rotation: 90),
      // const Marker(
      //   markerId: MarkerId("marker_2"),
      //   position: LatLng(22.2842993, 70.7968951),
      // ),
    };
  }

  Set<Circle> _createCircle() {
    return {
      // Circle(
      //   circleId: const CircleId('1'),
      //   consumeTapEvents: true,
      //   strokeColor: Colors.teal,
      //   fillColor: Colors.blue.withOpacity(0.2),
      //   strokeWidth: 2,
      //   center: _kMapCenter,
      //   radius: 5000,
      // ),
      Circle(
        circleId: const CircleId('2'),
        consumeTapEvents: true,
        strokeColor: Colors.teal,
        fillColor: Colors.blue.withOpacity(0.2),
        strokeWidth: 2,
        center: const LatLng(22.2842993, 70.7968951),
        radius: 6000,
      ),
    };
  }

  Set<Polygon> _createPolygon() {
    return {
      Polygon(
          polygonId: const PolygonId('2'),
          consumeTapEvents: true,
          strokeColor: Colors.black,
          strokeWidth: 2,
          fillColor: Colors.teal,
          points: _createPoints())
    };
  }

  List<LatLng> _createPoints() {
    final List<LatLng> points = <LatLng>[];
    points.add(const LatLng(19.03434603366356, 72.8464128479929));
    points.add(const LatLng(19.039546951601157, 72.86191217766304));
    points.add(const LatLng(18.9648299877223, 72.84281511964726));
    //points.add(LatLng(19.03434603366356, 72.8464128479929));
    points.add(const LatLng(18.93089678860969, 72.82178660269335));
    return points;
  }

  Set<Polyline> _createPolyline() {
    return {
      Polyline(
        polylineId: PolylineId('1'),
        consumeTapEvents: true,
        color: Colors.green,
        width: 5,
        points: _createPoints(),
      ),
    };
  }

  void onCameraMove(CameraPosition cameraPosition) {
    debugPrint('$cameraPosition');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Demo'),
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        // onMapCreated: onMapCreated,
        mapType: MapType.satellite,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        compassEnabled: true,
        markers: _createMarker(),
        mapToolbarEnabled: false,
        buildingsEnabled: true,
        onTap: (latLong) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  'Tapped location LatLong is (${latLong.latitude},${latLong.longitude})')));
        },
        rotateGesturesEnabled: true,
        scrollGesturesEnabled: true,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        tiltGesturesEnabled: true,
        liteModeEnabled: false,
        // circles: _createCircle(),
        // polygons: _createPolygon(),
        polylines: _createPolyline(),
        trafficEnabled: false,
        onCameraMove: onCameraMove,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.gps_fixed),
      // ),
    );
  }

}
