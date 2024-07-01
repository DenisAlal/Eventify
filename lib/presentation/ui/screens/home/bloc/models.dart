import '../../../../presentation.dart';

class CarScreenModel {
  final int id;
  final String number;
  final String? imageURL;
  final List<MediaUIModel> photoURSs;
  final int likesCount;
  final int dislikesCount;
  final int commentCount;
  final DateTime? createTime;
  final DateTime? pinTime;
  final bool isLiked;
  final bool isDisliked;
  final bool isFavorite;
  final bool isComment;

  CarScreenModel({
    required this.id,
    required this.number,
    required this.imageURL,
    required this.photoURSs,
    required this.likesCount,
    required this.dislikesCount,
    required this.commentCount,
    required this.createTime,
    this.pinTime,
    required this.isLiked,
    required this.isDisliked,
    required this.isFavorite,
    required this.isComment,
  });

  CarScreenModel copyWith({
    int? id,
    String? number,
    required String? imageURL,
    List<MediaUIModel>? photoURSs,
    int? likesCount,
    int? dislikesCount,
    int? commentCount,
    DateTime? createTime,
    required DateTime? pinTime,
    bool? isLiked,
    bool? isDisliked,
    bool? isFavorite,
    bool? isComment,
  }) {
    return CarScreenModel(
      id: id ?? this.id,
      number: number ?? this.number,
      imageURL: imageURL,
      photoURSs: photoURSs ?? this.photoURSs,
      likesCount: likesCount ?? this.likesCount,
      dislikesCount: dislikesCount ?? this.dislikesCount,
      commentCount: commentCount ?? this.commentCount,
      createTime: createTime ?? this.createTime,
      pinTime: pinTime,
      isLiked: isLiked ?? this.isLiked,
      isDisliked: isDisliked ?? this.isDisliked,
      isFavorite: isFavorite ?? this.isFavorite,
      isComment: isComment ?? this.isComment,
    );
  }
}

// class