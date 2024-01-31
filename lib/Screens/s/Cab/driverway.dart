import 'dart:collection';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:qwikio_driver/Components/authbutton.dart';
import 'package:qwikio_driver/Res/Constant.dart';
import 'package:qwikio_driver/Screens/s/Cab/chatbox.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:qwikio_driver/Screens/s/Cab/driverway2.dart';
import 'package:qwikio_driver/Screens/s/Cab/safetytoolkit.dart';
import 'package:qwikio_driver/Screens/s/Cab/rateservice.dart';



class DriverWay extends StatefulWidget {
  static String id = "driverway";

  final LocationData location;

  DriverWay({this.location});

  @override
  _DriverWayState createState() => _DriverWayState();
}

class _DriverWayState extends State<DriverWay> {
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Row(
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
                            "89 Elgin St. celina, Delaware 10299",
                            style: Textt2.textStyle(kPrimaryfont, 14),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DriverWay2()));
                        },
                        child: Container(
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Text(
                              '30 min',
                              style: Textt1.textStyle(Colors.white, 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 250,
              child: Column(
                children: [
                  Container(
                    height: 90,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          child: Center(
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/images/man.jpg'),
                            ),
                          ),
                        )),
                        Expanded(
                            flex: 5,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '  Arthur Douglas',
                                    style: Textt2.textStyle(kPrimaryfont, 15),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RateService ()));
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: kPrimarycolor,
                                        ),
                                        Text(
                                          '  4.2',
                                          style:
                                              Textt2.textStyle(kPrimaryfont, 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatBox()));
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatBox()));
                            },
                            child: Container(
                              width: 280,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: TextField(
                                focusNode: AlwaysDisabledFocusNode(),
                                decoration: InputDecoration(
                                  hintText: 'Message Arthur',
                                  hintStyle: Textt2.textStyle(kPrimaryfont, 15),
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(left: 10, bottom: 8),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                color: Colors.blue),
                            child: Icon(Icons.phone, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AuthButton(
                    colorr: kPrimarycolor,
                    onchanged: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SafetyToolkit()));
                    },
                    textt: 'End Ride',
                    textStyle: Textt1.textStyle(Colors.white, 15.0),
                  ),
                ],
              ),
            ),
          ],
        ));
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

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
