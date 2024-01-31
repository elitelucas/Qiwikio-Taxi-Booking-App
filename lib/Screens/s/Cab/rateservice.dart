import 'dart:collection';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:qwikio_driver/Components/authbutton.dart';
import 'package:qwikio_driver/Res/Constant.dart';


class RateService extends StatefulWidget {
  static String id = "rateservice";

  final LocationData location;
  RateService({this.location});
  @override
  _RateServiceState createState() => _RateServiceState();
}

class _RateServiceState extends State<RateService> {
  double _panelHeightOpen = 0;

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
    return Scaffold(
      floatingActionButton:

      polygonLatLngs.length > 0 && _isPolygon ? _fabPolygon() : null,

      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(9.0820, 8.6753),
              zoom: 12,
            ),
            mapType: MapType.normal,
            markers: _markers,
            circles: _circles,
            polygons: _polygons,
            myLocationEnabled: true,
            padding: EdgeInsets.only(top: 40.0,),
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
                children: <Widget>[
                  RaisedButton(
                      color: Colors.black54,
                      onPressed: () {
                        _isPolygon = true;
                        _isMarker = false;
                        _isCircle = false;
                      },
                      child: Text(
                        'Polygon',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                  RaisedButton(
                      color: Colors.black54,
                      onPressed: () {
                        _isPolygon = false;
                        _isMarker = true;
                        _isCircle = false;
                      },
                      child: Text('Marker',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                  RaisedButton(
                      color: Colors.black54,
                      onPressed: () {
                        _isPolygon = false;
                        _isMarker = false;
                        _isCircle = true;
                        radius = 50;
                        return showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.grey[900],
                                title: Text(
                                  'Choose the radius (m)',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                content: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Material(
                                      color: Colors.black,
                                      child: TextField(
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                        decoration: InputDecoration(
                                          icon: Icon(Icons.zoom_out_map),
                                          hintText: 'Ex: 100',
                                          suffixText: 'meters',
                                        ),
                                        keyboardType:
                                        TextInputType.numberWithOptions(),
                                        onChanged: (input) {
                                          setState(() {
                                            radius = double.parse(input);
                                          });
                                        },
                                      ),
                                    )),
                                actions: <Widget>[
                                  FlatButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        'Ok',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                ],
                              );
                            });
                      },
                      child: Text('Circle',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                  RaisedButton(onPressed: (){
                    _rate();
                  },
                    color: Colors.black54,
                    child: Text('RateExp',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white),

                    ),
                  ),
                ]
            ),
          ),

          // the fab
          Positioned(
            left: 20.0,
            top: 52.0,
            child: IconButton(
              onPressed: (){Navigator.pop(context);},
              icon: Icon(
                FontAwesome.cancel,
                color: Colors.black,
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
                      )))
          ),


        ],
      ),
    );


  }

  Widget _rate() {
    showModalBottomSheet(
        isDismissible: true,
        enableDrag: true,
        isScrollControlled: false,
        context: context,
        builder: (context) {
          return  SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 60,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.all(Radius.circular(12.0))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  Text(
                    "Rate Your Experience",
                    style: Textt2.textStyle(kPrimaryfont, 18),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/man.jpg'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Arthur Douglas",
                    style: Textt2.textStyle(kPrimaryfont, 18),
                  ),
                  Text(
                    "Islamabad, PK",
                    style: Textt1.textStyle(kPrimaryfont, 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 12,
                        color: Colors.grey,
                      ),
                      Text(
                        "Add to favorite",
                        style: Textt1.textStyle(Colors.grey, 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 22,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: kPrimarycolor,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Row(
                      children: [
                        RaisedButton(
                          onPressed: () {},
                          focusElevation: 10,
                          highlightElevation: 10,
                          hoverElevation: 10,
                          color: kPrimarycolor,
                          elevation: 4,
                          child: SizedBox(
                            width: 142,
                            height: 55,
                            child: Center(
                                child: Text(
                                  'Amazing',
                                  style: Textt1.textStyle(Colors.white, 15),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RaisedButton(
                          onPressed: () {},
                          focusElevation: 10,
                          highlightElevation: 10,
                          hoverElevation: 10,
                          color: Colors.white,
                          elevation: 4,
                          child: SizedBox(
                            width: 145,
                            height: 55,
                            child: Center(
                                child: Text(
                                  'Bad Experince',
                                  style: Textt1.textStyle(kPrimarycolor, 15),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        RaisedButton(
                          onPressed: () {},
                          focusElevation: 10,
                          highlightElevation: 10,
                          hoverElevation: 10,
                          color: Colors.white,
                          elevation: 4,
                          child: SizedBox(
                            width: 142,
                            height: 55,
                            child: Center(
                                child: Text(
                                  'Nice Ride',
                                  style: Textt1.textStyle(kPrimarycolor, 15),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RaisedButton(
                          onPressed: () {},
                          focusElevation: 10,
                          highlightElevation: 10,
                          hoverElevation: 10,
                          color: Colors.white,
                          elevation: 4,
                          child: SizedBox(
                            width: 145,
                            height: 55,
                            child: Center(
                                child: Text(
                                  'Good Behaviour',
                                  style: Textt1.textStyle(kPrimarycolor, 15),
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
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextFormField(
                      focusNode: FocusNode(),
                      decoration: InputDecoration(
                        hintText: 'Write Comment',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10, bottom: 8),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AuthButton(
                    colorr: kPrimarycolor,
                    textt: 'Rate Now',
                    textStyle: Textt1.textStyle(Colors.white, 15),
                    onchanged: () {
                      Navigator.pop(context);
                    },
                  ),
                  Container(height: 50.0,),

                ],
              ),
            ),
          );
        });
  }


}
