import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:nihfirebase/screens/deliveryscreen.dart';
import 'package:nihfirebase/screens/favoritescreen.dart';
import 'package:nihfirebase/screens/homescreen.dart';
import 'package:flutter/material.dart';

class Restoscreen extends StatefulWidget {
  const Restoscreen({super.key});

  @override
  State<Restoscreen> createState() => _RestoscreenState();
}

class _RestoscreenState extends State<Restoscreen> {
  int _selectedIndex = 0;
  int index = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Restoscreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FavoriteScreen()),
      );
    }
  }

  late MapController controller;

  @override
  void initState() {
    super.initState();
    controller = MapController.withUserPosition(
      trackUserLocation: UserTrackingOption(
        enableTracking: true,
        unFollowUser: false,
      ),
    );
  }

  void _calculatedistance() async {
    GeoPoint pengguna = GeoPoint(
      latitude: -6.895497522199292,
      longitude: 107.6132877538262,
    );

    List<GeoPoint> lokasiresto = [
      GeoPoint(latitude: -6.895245214930886, longitude: 107.61317775055322),
      GeoPoint(latitude: -6.896023234477314, longitude: 107.61327752983941),
      GeoPoint(latitude: -6.895242450979035, longitude: 107.61383536395122),
      GeoPoint(latitude: -6.8947298313150505, longitude: 107.61278250976719),
      GeoPoint(latitude: -6.896731422760362, longitude: 107.6138006403037),
      GeoPoint(latitude: -6.896958657406274, longitude: 107.61260176437965),
      GeoPoint(latitude: -6.897406681128165, longitude: 107.61219469407918),
      GeoPoint(latitude: -6.897920918356079, longitude: 107.61351413184106),
      GeoPoint(latitude: -6.898147070857063, longitude: 107.6133201622886),
      GeoPoint(latitude: -6.899210676256314, longitude: 107.61351979902678),
    ];
    List<String> namaResto = [
      "KisahManisDago",
      "BosschaSpace",
      "Beckys",
      "RogersCafeAndLounge",
      "Grassroot",
      "BebekCarok",
      "MadameSariRestaurant",
      "MieGacoanDipatiukur",
      "AyamBakarPedasHDeno",
      "GyuKakuPangeranKornel",
    ];

    for (var resto in lokasiresto) {
      String nama = namaResto[index];
      double distanceEnMetres = await distance2point(pengguna, resto);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Distance to $nama: $distanceEnMetres meters'),
        ),
      );
      index++;
    }
  }

  void _drawRoads() async {
    await controller.drawRoad(
      GeoPoint(latitude: -6.89541979289061, longitude: 107.61336138633497),
      GeoPoint(latitude: -6.897394838558933, longitude: 107.61215238519068),
      roadType: RoadType.car,
      roadOption: RoadOption(
        roadWidth: 10,
        roadColor: Colors.blueAccent,
        zoomInto: true,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Resto Locations',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.map, color: Colors.white),
            onPressed: () {
              // Placeholder for map action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.my_location, color: Colors.white),
                ),
                Expanded(
                  child: Text(
                    'Your Location',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.satellite_alt, color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.blue, width: 1.5),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.multiple_stop, color: Colors.blue),
                    onPressed: _calculatedistance,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Search here',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.route, color: Colors.blue),
                    onPressed: _drawRoads,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Center(
            child: Text(
              "Nearby Restaurants",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const Divider(thickness: 1, color: Colors.white),
          Expanded(
            child: OSMFlutter(
              controller: controller,
              osmOption: OSMOption(
                zoomOption: ZoomOption(
                  initZoom: 19,
                  minZoomLevel: 3,
                  maxZoomLevel: 19,
                  stepZoom: 1.0,
                ),
                userLocationMarker: UserLocationMaker(
                  personMarker: MarkerIcon(
                    icon: Icon(Icons.person_pin_circle, color: Colors.red, size: 48),
                  ),
                  directionArrowMarker: MarkerIcon(
                    icon: Icon(Icons.navigation, size: 48, color: Colors.blue),
                  ),
                ),
                roadConfiguration: RoadOption(roadColor: Colors.yellow),
              ),
            ),
          ),
          const Center(
            child: Text(
              "Use two fingers to zoom in/out",
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.near_me), label: 'Near Me'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone), label: 'Contact Resto'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }
}
