class Contact {
  String name;
  String email;
  String phone;
  bool isFavorite;

  Contact({
    required this.name,
    required this.email,
    required this.phone,
    this.isFavorite = false,
  });
}