part of data;

@HiveType(typeId: 1)
class MediaEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String originUrl;
  @HiveField(2)
  final String previewUrl;
  @HiveField(3)
  final int? creatorId;

  MediaEntity(this.id, this.originUrl, this.previewUrl, this.creatorId);
}
