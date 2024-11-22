import 'package:nihfirebase/screens/deliveryscreen.dart';
import 'package:nihfirebase/screens/favoritescreen.dart';
import 'package:nihfirebase/screens/homescreen.dart';
import 'package:nihfirebase/screens/loginscreen.dart';
import 'package:flutter/material.dart';

class Restoscreen extends StatefulWidget {
  const Restoscreen({super.key});

  @override
  State<Restoscreen> createState() => _RestoscreenState();
}

class _RestoscreenState extends State<Restoscreen> {
  int _selectedIndex = 0;

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
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Deliveryscreen()),
      );
      //   }
      //  else if (index == 4) {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const Loginscreen()),
      //   );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(''),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.location_on, color: Colors.white),
                ),
                Expanded(
                  child: Text(
                    'your location',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.cloud, color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
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
                    icon: const Icon(Icons.filter_list, color: Colors.blue),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: '',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.blue),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Center(
            child: Text(
              "Resto near you",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          const Divider(thickness: 1, color: Colors.grey),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.blue, width: 1.5),
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Buka Peta"),
                ),
              ),
            ),
          ),
          const Center(
            child: Text("use 2 fingers to zoom the map",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey)),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.near_me), label: 'Near Me'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.delivery_dining), label: 'Delivery'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
