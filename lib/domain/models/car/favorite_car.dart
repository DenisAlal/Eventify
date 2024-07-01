part of domain;

class FavoriteCarModel {
  final int id;
  final String number;
  final int? likeCount;
  final int? dislikeCount;
  final int? commentsCount;
  final String? createTime;
  final List<MediaModel> photos;
  final String? pinTime;

  final bool like;
  final bool dislike;
  final bool favorite;
  final bool comment;

  const FavoriteCarModel({
    required this.id,
    required this.number,
    required this.likeCount,
    required this.dislikeCount,
    required this.commentsCount,
    required this.createTime,
    required this.pinTime,
    this.like = false,
    this.dislike = false,
    this.favorite = false,
    this.comment = false,
    this.photos = const [],
  });
}