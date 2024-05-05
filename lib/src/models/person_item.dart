enum PersonType { family, friend, acquaintance, other }

class PersonItem {
  const PersonItem(this.name, this.type,
      {this.phoneNumber, this.email, this.address});

  final String name;

  final PersonType type;

  displayType() {
    switch (type) {
      case PersonType.family:
        return 'Family';
      case PersonType.friend:
        return 'Friend';
      case PersonType.acquaintance:
        return 'Acquaintance';
      case PersonType.other:
        return 'Other';
    }
  }

  final String? phoneNumber;

  final String? email;

  final String? address;
}
