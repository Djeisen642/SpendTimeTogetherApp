enum PersonType { family, friend, acquaintance, other }

class PersonItem {
  const PersonItem(this.name, this.type);

  final String name;

  final PersonType type;
}
