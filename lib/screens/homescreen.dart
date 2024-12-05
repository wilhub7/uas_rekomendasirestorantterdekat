import 'dart:math';
import 'package:nihfirebase/providers/data.dart';
import 'package:nihfirebase/screens/deliveryscreen.dart';
import 'package:nihfirebase/screens/favoritescreen.dart';
import 'package:nihfirebase/screens/restoscreen.dart';
import '../providers/auth_provider.dart' as ap;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    }
  }

  String angkarandom() {
    var intValu = Random().nextInt(35) + 1;
    return "https://randomuser.me/api/portraits/men/$intValu.jpg";
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ap.AuthProvider>(context).user;
    final dataProviderController = Provider.of<DataProvider>(context);

    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Welcome, ${user?.displayName ?? 'User'}!'),
        actions: [
          IconButton(icon: const Icon(Icons.check_circle), onPressed: null),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text('${user?.email}'),
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Provider.of<ap.AuthProvider>(context, listen: false).logout();
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "new added resto",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              physics: AlwaysScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: dataProviderController.datas.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  // Get the selected contact
                  final selectedContact = dataProviderController.datas[index];

                  // Navigate to Deliveryscreen with the selected contact
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Deliveryscreen(contact: selectedContact),
                      settings: const RouteSettings(),
                    ),
                  );
                },
                child: Container(
                  child: Center(
                    child: Center(
                      child: Image.asset(
                        dataProviderController.datas[index].image,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            "famous people who joined my app",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return CircleAvatar(
                    backgroundImage: NetworkImage(angkarandom()),
                    radius: 30,
                  );
                }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lime,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.near_me), label: 'Near Me'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone), label: 'Contact Resto'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedLabelStyle: TextStyle(fontSize: 10),
      ),
    );
  }
}
