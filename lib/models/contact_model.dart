class ContactModel {
  String name;

  ContactModel({required this.name});

  static List<ContactModel> listContacts() => [
        ContactModel(name: 'New Group'),
        ContactModel(name: 'New Contact'),
        ContactModel(name: 'Dev'),
        ContactModel(name: 'Bairam'),
        ContactModel(name: 'Saket'),
        ContactModel(name: 'Testin'),
      ];
}
