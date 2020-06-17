import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapOrg extends StatefulWidget {
  @override
  _MapOrgState createState() => _MapOrgState();
}

class _MapOrgState extends State<MapOrg> {
  @override
  Widget build(BuildContext context) {
    return MapboxMap(
      accessToken:
          'pk.eyJ1Ijoic3F1YWR0cnkiLCJhIjoiY2tiaGo1ZmZ0MDRvNzJzbXl0MDlvb25pbCJ9.O0AIQlSKhX2ZxLilIeQ2EQ',
      styleString: MapboxStyles.DARK,
      compassEnabled: true,
      zoomGesturesEnabled: true,
      myLocationEnabled: true,
      initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
    );
  }
}
