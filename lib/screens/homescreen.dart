import 'package:provider/provider.dart';
import 'package:uas_rekomendasirestorantterdekat/models/contactresto.dart';
import 'package:uas_rekomendasirestorantterdekat/providers/data.dart';
import 'package:uas_rekomendasirestorantterdekat/screens/deliveryscreen.dart';
import 'package:uas_rekomendasirestorantterdekat/screens/favoritescreen.dart';
import 'package:uas_rekomendasirestorantterdekat/screens/loginscreen.dart';
import 'package:uas_rekomendasirestorantterdekat/screens/restoscreen.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Homescreen()),
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
      // } else if (index == 4) {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const Loginscreen()),
      //   );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dataProviderController = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(''),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Deliveryscreen(),
                      settings: const RouteSettings(),
                    ),
                  );
                },
                child: Container(
                  color: Colors.deepPurple,
                  child: Center(
                    child: Center(
                      child: Image.asset(
                          dataProviderController.datas[index].image),
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
          Container(
            child: Row(
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://example.com/userAvatarUrl'),
                    radius: 30,
                  ),
                ),
              ),
            ),
          )
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
              icon: Icon(Icons.delivery_dining),
              label: 'Delivery/Contact Resto'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
