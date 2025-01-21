import 'package:contact_app/data/contact.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'widgets/contact_tile.dart';

class ContactListPage extends StatefulWidget {
  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  late List<Contact> _contacts;

  @override
  void initState() {
    super.initState();
    _contacts = List.generate(50, (index) {
      return Contact(
        name: faker.person.firstName(),
        email: faker.internet.freeEmail(),
        phone: faker.randomGenerator.integer(1000000000).toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        title: Text('Contacts'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _contacts.length,
          itemBuilder: (BuildContext context, int index) {
            return ContactTile(contact: _contacts[index], onFavoritePressed: (){
              setState(() {
              _contacts[index].isFavorite = !_contacts[index].isFavorite;
              _contacts.sort((a, b) {
                if (a.isFavorite) {
                  return -1;
                } else if (b.isFavorite) {
                  return 1;
                } else {
                  return 0;
                }
              });
            });
            },);
          },
        ),
      ),
    );
  }
}
