part of domain;

class UserModel implements EntityConverter<UserEntity> {
  final int id;
  final String? name;
  final String? surname;
  final String? aboutMe;
  final String? email;
  final String? phone;
  final String? emailVerifiedAt;
  final double? lat;
  final double? long;
  final MediaModel? avatar;

  const UserModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.aboutMe,
    required this.email,
    required this.phone,
    this.emailVerifiedAt,
    required this.lat,
    required this.long,
    required this.avatar,
  });

  @override
  UserEntity convertEntity() {
    return UserEntity(
      id: id,
      name: name,
      surname: surname,
      aboutMe: aboutMe,
      email: email,
      phone: phone,
      lat: lat,
      long: long,
      emailVerifiedAt: emailVerifiedAt,
      avatar: avatar?.convertEntity(),
    );
  }

  UserUIModel convertToPresentation() {
    return UserUIModel(
      id: id,
      name: name,
      surname: surname,
      aboutMe: aboutMe,
      email: email,
      phone: phone,
      lat: lat,
      long: long,
      emailVerifiedAt: emailVerifiedAt,
      avatarURL: avatar?.previewUrl,
    );
  }

  UserModel copyWith({
    String? name,
    String? surname,
    String? aboutMe,
    String? email,
    String? phone,
    String? emailVerifiedAt,
    double? lat,
    double? long,
    MediaModel? avatar,
  }) =>
      UserModel(
        id: id,
        name: name ?? this.name,
        surname: surname ?? this.surname,
        aboutMe: aboutMe ?? this.aboutMe,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        avatar: avatar ?? this.avatar,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          surname == other.surname &&
          aboutMe == other.aboutMe &&
          email == other.email &&
          phone == other.phone &&
          emailVerifiedAt == other.emailVerifiedAt &&
          lat == other.lat &&
          long == other.long &&
          avatar == other.avatar;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      surname.hashCode ^
      aboutMe.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      emailVerifiedAt.hashCode ^
      lat.hashCode ^
      long.hashCode ^
      avatar.hashCode;
}
