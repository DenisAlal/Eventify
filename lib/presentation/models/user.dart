part of presentation;

class UserUIModel {
  final int id;
  final String? name;
  final String? surname;
  final String? aboutMe;
  final String? email;
  final String? phone;
  final String? emailVerifiedAt;
  final double? lat;
  final double? long;
  final String? avatarURL;

  const UserUIModel({
    required this.id,
    this.name,
    this.surname,
    this.aboutMe,
    this.email,
    required this.phone,
    this.emailVerifiedAt,
    this.lat,
    this.long,
    this.avatarURL,
  });

  String getName() {
    return (name != null || surname != null)
        ? '${name ?? ''} ${surname ?? ''}'
        : 'Пользователь №$id';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserUIModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          surname == other.surname &&
          email == other.email &&
          phone == other.phone &&
          avatarURL == other.avatarURL;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ surname.hashCode ^ email.hashCode ^ phone.hashCode ^ avatarURL.hashCode;
}