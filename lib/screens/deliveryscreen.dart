import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nihfirebase/providers/data.dart';

class Deliveryscreen extends StatelessWidget {
  const Deliveryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // final dataProviderController = Provider.of<DataProvider>(context);
      body: Consumer<DataProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.datas.length,
            itemBuilder: (context, index) {
              final contact = provider.datas[index];
              return ListTile(
                title: Text(contact.name),
                subtitle: Text(
                  contact.phone,
                ),
                leading: CircleAvatar(
                  child: Text(contact.name[0].toUpperCase()),
                ),
                // trailing: IconButton(
                //   icon: const Icon(Icons.delete),
                //   onPressed: () {
                //     provider.removeContact(contact);
                //   },
                // ),
              );
            },
          );
        },
      ),

      // return Scaffold(
      //   body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //     Text(
      //       "Reservation",
      //       style: TextStyle(
      //         fontSize: 18,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(16),
      //       child: DropdownButtonFormField(
      //         // value: _value,
      //         onChanged: (value) {
      //           // setState(() {
      //           //   _value = value;
      //           // });
      //         },
      //         items: List.generate(
      //           10,
      //           (index) => DropdownMenuItem(
      //             value: index.toString(),
      //             child: Text('Notify resto $index'),
      //           ),
      //         ),
      //       ),
      //     ),
      //     Text(
      //       "Delivery",
      //       style: TextStyle(
      //         fontSize: 18,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(16),
      //       child: DropdownButtonFormField(
      //         // value: _value,
      //         onChanged: (value) {
      //           // setState(() {
      //           //   _value = value;
      //           // });
      //         },
      //         items: List.generate(
      //           10,
      //           (index) => DropdownMenuItem(
      //             value: index.toString(),
      //             child: Text('on the way $index'),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      //   ),

      // );
    );
  }
}
