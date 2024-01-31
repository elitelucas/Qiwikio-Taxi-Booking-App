import 'dart:collection';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:qwikio_driver/Components/authbutton.dart';
import 'package:qwikio_driver/Res/Constant.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:qwikio_driver/Screens/s/Truck Driver/safety.dart';


class Arrived extends StatefulWidget {
  static String id = "arrived";

  final LocationData location;

  Arrived ({this.location});

  @override
  _ArrivedState createState() => _ArrivedState();
}

class _ArrivedState extends State< Arrived  > {
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;

  // Location
  LocationData _locationData;

  // Maps
  Set<Marker> _markers = HashSet<Marker>();
  Set<Polygon> _polygons = HashSet<Polygon>();
  Set<Circle> _circles = HashSet<Circle>();
  GoogleMapController _googleMapController;
  List<LatLng> polygonLatLngs = List<LatLng>();
  double radius;

  //ids
  int _polygonIdCounter = 1;
  int _circleIdCounter = 1;
  int _markerIdCounter = 1;

  // Type controllers
  bool _isPolygon = true; //Default
  bool _isMarker = false;
  bool _isCircle = false;

  // This function is to change the marker icon

  // Draw Polygon to the map
  void _setPolygon() {
    final String polygonIdVal = 'polygon_id_$_polygonIdCounter';
    _polygons.add(Polygon(
      polygonId: PolygonId(polygonIdVal),
      points: polygonLatLngs,
      strokeWidth: 2,
      strokeColor: Colors.red,
      fillColor: Colors.yellow.withOpacity(0.15),
    ));
  }

  // Set circles as points to the map
  void _setCircles(LatLng point) {
    final String circleIdVal = 'circle_id_$_circleIdCounter';
    _circleIdCounter++;
    print(
        'Circle | Latitude: ${point.latitude}  Longitude: ${point.longitude}  Radius: $radius');
    _circles.add(Circle(
        circleId: CircleId(circleIdVal),
        center: point,
        radius: radius,
        fillColor: kPrimarycolor.withOpacity(0.5),
        strokeWidth: 3,
        strokeColor: kPrimarycolor));
  }

  // Set Markers to the map
  void _setMarkers(LatLng point) {
    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    setState(() {
      print(
          'Marker | Latitude: ${point.latitude}  Longitude: ${point.longitude}');
      _markers.add(
        Marker(
          markerId: MarkerId(markerIdVal),
          position: point,
        ),
      );
    });
  }

  // Start the map with this marker setted up

  Widget _fabPolygon() {
    return FloatingActionButton.extended(
      onPressed: () {
        //Remove the last point setted at the polygon
        setState(() {
          polygonLatLngs.removeLast();
        });
      },
      icon: Icon(Icons.undo),
      label: Text('Undo point'),
      backgroundColor: Colors.orange,
    );
  }

  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
    // If I want to change the marker icon:
    // _setMarkerIcon();
    _locationData = widget.location;
    _fabHeight = _initFabHeight;
  }

  // Check Location Permissions, and get my location
  void _checkLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
  }
  String _verticalGroupValue = "";

  List<String> _status = [''];
  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;

    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: _body(),
            panelBuilder: (sc) => _panel(sc),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
            }),
          ),

          // the fab
          Positioned(
            left: 20.0,
            top: 52.0,
            child: IconButton(
                icon: Icon(
                  FontAwesome.cancel,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),

          Positioned(
            top: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).padding.top,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),

          //the SlidingUpPanel Title
        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0,right: 25.0),
          child: ListView(
            controller: sc,
            children: <Widget>[
              SizedBox(
                height: 12.0,
              ),
              Center(
                child: Container(
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "On the way to",
                        style: Textt2.textStyle(kPrimaryfont, 14),
                      ),
                      Text(
                        "New Wellington Alluminium Shop",
                        style: Textt2.textStyle(kPrimaryfont, 14),
                      ),
                    ],
                  ),
                  Container(
                    width: 60,
                    height: 25,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        '2 min',
                        style: Textt1.textStyle(Colors.white, 12),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xffF7FAFC),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                          child: Image.asset(
                            'assets/icons/container.png',
                            fit: BoxFit.fill,
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Medium",
                                style: Textt2.textStyle(
                                    kPrimaryfont, 15),
                              ),
                              Text(
                                "Between 2kg and 5kg",
                                style: Textt1.textStyle(Colors.grey, 14),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),

              SizedBox(
                height: 20.0,
              ),
              AuthButton(colorr: kPrimarycolor,
                textt: 'End',
                textStyle: Textt1.textStyle(Colors.white, 15.0),
                onchanged: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Safety()));
                },
              ),
            ],
          ),
        )
    );
  }

  Widget _body() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(9.0820, 8.6753),
        zoom: 12,
      ),
      mapType: MapType.normal,
      markers: _markers,
      circles: _circles,
      polygons: _polygons,
      myLocationEnabled: true,
      padding: EdgeInsets.only(
        top: 40.0,
      ),
      onTap: (point) {
        if (_isPolygon) {
          setState(() {
            polygonLatLngs.add(point);
            _setPolygon();
          });
        } else if (_isMarker) {
          setState(() {
            _markers.clear();
            _setMarkers(point);
          });
        } else if (_isCircle) {
          setState(() {
            _circles.clear();
            _setCircles(point);
          });
        }
      },
    );
  }
}

