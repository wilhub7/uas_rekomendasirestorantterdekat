import 'package:flutter/material.dart';
import 'package:nihfirebase/models/contactresto.dart';
import 'package:provider/provider.dart';
import 'package:nihfirebase/providers/data.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Deliveryscreen extends StatelessWidget {
  final Data contact; // Assuming your data model is called Contact

  const Deliveryscreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(''),
        actions: [
          IconButton(icon: const Icon(Icons.reviews), onPressed: null),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(contact.name),
            subtitle: Row(
              children: [
                const Icon(
                  Icons.phone_android_rounded,
                  size: 16,
                ),
                const SizedBox(width: 3),
                Text(
                  contact.phone,
                ),
              ],
            ),
            leading: CircleAvatar(
              child: Text(contact.name[0].toUpperCase()),
            ),
            trailing: RatingBarIndicator(
              rating: contact.rating,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 22,
              direction: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
