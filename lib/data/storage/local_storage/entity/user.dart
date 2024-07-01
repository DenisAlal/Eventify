part of data;

@HiveType(typeId: 0)
class UserEntity implements HiveEntity<UserModel> {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? surname;
  @HiveField(3)
  final String? aboutMe;
  @HiveField(4)
  final String? email;
  @HiveField(5)
  final String? phone;
  @HiveField(6)
  final String? emailVerifiedAt;
  @HiveField(7)
  final double? lat;
  @HiveField(8)
  final double? long;
  @HiveField(9)
  final MediaEntity? avatar;

  UserEntity({
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
  UserModel convertModel() {
    return UserModel(
      id: id,
      name: name,
      surname: surname,
      aboutMe: aboutMe,
      email: email,
      phone: phone,
      lat: lat,
      long: long,
      avatar: avatar != null
          ? MediaModel(
              id: avatar!.id,
              originUrl: avatar!.originUrl,
              previewUrl: avatar!.previewUrl,
              creatorId: avatar!.creatorId)
          : null,
    );
  }
}
