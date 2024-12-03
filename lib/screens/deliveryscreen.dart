import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nihfirebase/providers/data.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Deliveryscreen extends StatelessWidget {
  const Deliveryscreen({super.key});

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
      body: Consumer<DataProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.datas.length,
            itemBuilder: (context, index) {
              final contact = provider.datas[index];
              return ListTile(
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
              );
            },
          );
        },
      ),
    );
  }
}
