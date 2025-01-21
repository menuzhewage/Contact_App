import 'package:contact_app/data/contact.dart';
import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    Key? key,
    required this.contact,
    required this.onFavoritePressed,
  }) : super(key: key);

  final Contact contact;
  final void Function() onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.email),
        trailing: IconButton(
          onPressed: onFavoritePressed,
          icon: Icon(
            contact.isFavorite
                ? Icons.favorite
                : Icons.favorite_border_outlined,
            color: contact.isFavorite ? Colors.amber : Colors.grey,
          ),
        ),
        onTap: () {});
    ;
  }
}
