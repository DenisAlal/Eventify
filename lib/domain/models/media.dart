part of domain;

class MediaModel implements EntityConverter<MediaEntity> {
  final int id;
  final int? creatorId;
  final String originUrl;
  final String previewUrl;

  MediaModel({
    required this.id,
    required this.creatorId,
    required this.originUrl,
    required this.previewUrl,
  });

  @override
  MediaEntity convertEntity() {
    return MediaEntity(
      id,
      originUrl,
      previewUrl,
      creatorId
    );
  }

  MediaUIModel convertToPresentation() {
    return MediaUIModel(
      id: id,
      creatorId: creatorId,
      originUrl: originUrl,
      previewUrl: previewUrl,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          creatorId == other.creatorId &&
          originUrl == other.originUrl &&
          previewUrl == other.previewUrl;

  @override
  int get hashCode => id.hashCode ^ originUrl.hashCode ^ previewUrl.hashCode;
}
