import 'dart:collection';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:qwikio_driver/Components/authbutton.dart';
import 'package:qwikio_driver/Res/Constant.dart';
import 'package:qwikio_driver/Screens/s/Cab/cabpickup.dart';
import 'package:qwikio_driver/Screens/s/Cab/cabpickup2.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';
import 'package:qwikio_driver/Screens/s/Cab/driverway.dart';

class CabPickup3 extends StatefulWidget {
  static String id = "cabpickup3";

  final LocationData location;

  CabPickup3({this.location});

  @override
  _CabPickup3State createState() => _CabPickup3State();
}

class _CabPickup3State extends State<CabPickup3> {
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
            top: 52.0,
            child: Container(
              padding: EdgeInsets.all(12.0),
              height: 210,
              width: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  Container(
                    height: 35,
                    width: 130,
                    decoration: BoxDecoration(
                      color: kPrimarycolor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'USD 2500.00 ',
                            style: Textt2.textStyle(Colors.white, 12.0),
                          ),
                          Expanded(
                              child: IconButton(
                                  icon: Icon(
                                    Icons.keyboard_arrow_up,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {})),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CabPickup()));
                        },
                        child: Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(color: Colors.grey)),
                          child: Center(
                            child: Text(
                              'Day',
                              style: Textt1.textStyle(Colors.grey, 12.0),
                            ),
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CabPickup2()));
                        },
                        child: Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(color: Colors.grey)),
                          child: Center(
                            child: Text(
                              'Week',
                              style: Textt1.textStyle(Colors.grey, 12.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          color: kPrimarycolor,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Center(
                          child: Text(
                            'Month',
                            style: Textt1.textStyle(Colors.white, 12.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 270,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              '50',
                              style: Textt2.textStyle(kPrimaryfont, 15.0),
                            ),
                            Text(
                              'Delivery',
                              style: Textt1.textStyle(kPrimaryfont, 15.0),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '200',
                              style: Textt2.textStyle(kPrimaryfont, 15.0),
                            ),
                            Text(
                              'Hours',
                              style: Textt1.textStyle(kPrimaryfont, 15.0),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '\$5000.00',
                              style: Textt2.textStyle(kPrimaryfont, 15.0),
                            ),
                            Text(
                              'Earned',
                              style: Textt1.textStyle(kPrimaryfont, 15.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
              Stack(
                children: [
                  Center(
                    child: Text(
                      'You’re Online',
                      style: Textt2.textStyle(Colors.green, 15.0),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Switcher(
                          value: false,
                          colorOff: Colors.black26.withOpacity(0.3),
                          colorOn: Colors.grey,
                          onChanged: (bool state) {
                            //
                          },
                          size: SwitcherSize.small,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Package Delivery',
                    style: Textt1.textStyle(kPrimaryfont, 15.0),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Switcher(
                    value: false,
                    colorOff: Colors.black26.withOpacity(0.3),
                    colorOn: Colors.grey,
                    onChanged: (bool state) {
                      //
                    },
                    size: SwitcherSize.small,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              AuthButton(
                textt: 'Check Incoming Ride',
                textStyle: Textt1.textStyle(Colors.white, 15.0),
                onchanged: () {
                  _accept();
                },
                colorr: kPrimarycolor,
              )
            ],
          ),
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
      padding: EdgeInsets.only(top: 30),
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

  _accept() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Incoming Ride',
                  style: Textt2.textStyle(kPrimaryfont, 15.0),
                ),
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/women.jpg'),
                ),
              ],
            ),
            content: Container(
              height: 70,
              child: Column(
                children: [
                  Text(
                    'Jenny Wilson',
                    style: Textt2.textStyle(kPrimaryfont, 12.0),
                  ),
                  Text(
                    '10 mins away',
                    style: Textt2.textStyle(kPrimaryfont, 15.0),
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel',
                          style: Textt1.textStyle(Colors.redAccent, 15.0),
                        )),
                    SizedBox(
                      width: 16,
                    ),
                    RaisedButton(
                      onPressed: () {
                        _confirm();
                      },
                      focusElevation: 10,
                      highlightElevation: 10,
                      hoverElevation: 10,
                      color: kPrimarycolor,
                      elevation: 4,
                      child: SizedBox(
                        width: 150,
                        height: 55,
                        child: Center(
                            child: Text(
                              'Accept',
                              style: Textt1.textStyle(Colors.white, 15),
                              textAlign: TextAlign.center,
                            )),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  _confirm() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            title: Stack(
              children: [
                Container(
                  height: 150,
                  child: Image.asset(
                    'assets/images/ok.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    right: 2.0,
                    child: IconButton(
                        icon: Icon(FontAwesome.cancel, color: Colors.grey),
                        onPressed: () {
                          Navigator.pop(context);
                        }))
              ],
            ),
            content: Container(
              height: 70,
              child: Column(
                children: [
                  Text(
                    'Ride Accepted!',
                    style: Textt2.textStyle(kPrimaryfont, 15.0),
                  ),
                  Text(
                    'Everythings seems perfect. You are ready to move.',
                    style: Textt1.textStyle(kPrimaryfont, 12.0),
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DriverWay()));

                      },
                      focusElevation: 10,
                      highlightElevation: 10,
                      hoverElevation: 10,
                      color: kPrimarycolor,
                      elevation: 4,
                      child: SizedBox(
                        width: 265,
                        height: 55,
                        child: Center(
                            child: Text(
                              'Continue',
                              style: Textt1.textStyle(Colors.white, 15),
                              textAlign: TextAlign.center,
                            )),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
