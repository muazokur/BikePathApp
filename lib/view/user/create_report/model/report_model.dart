import 'package:bike_path_app/core/base/model/base_model.dart';

class ReportModel extends BaseModel {
  String? address;
  int? commentCount;
  CommentModel? commentModel;
  String? date;
  String? description;
  int? likeCount;
  List<double>? location;
  String? photo;
  String? title;
  String? id;
  bool? state;
  String? key;
  String? comments;
  String? userName;
  String? userSurName;

  ReportModel({
    this.userName,
    this.userSurName,
    this.comments,
    this.key,
    required this.address,
    this.commentCount = 0,
    this.commentModel,
    required this.date,
    required this.description,
    this.likeCount = 0,
    required this.location,
    required this.photo,
    required this.title,
    required this.id,
    this.state = false,
  });

  ReportModel.empty();

  ReportModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    commentCount = json['commentCount'];
    //comments = json['comments'] != null ? CommentModel.fromJson(json['comments']) : null;
    date = json['date'];
    description = json['description'];
    likeCount = json['likeCount'];
    location = json['location'].cast<double>();
    photo = json['photo'];
    title = json['title'];
    id = json['id'];
    state = json['state'];
    key = json['key'];
    userName = json['userName'];
    userSurName = json['userSurName'];

    //commentColumn = json['commentColumn'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['commentCount'] = commentCount;
    if (commentModel != null) {
      data['comments'] = commentModel!.toJson();
    }
    data['date'] = date;
    data['description'] = description;
    data['likeCount'] = likeCount;
    data['location'] = location;
    data['photo'] = photo;
    data['title'] = title;
    data['id'] = id;
    data['state'] = state;
    data['key'] = key;
    data['commentModel'] = commentModel;
    data['comments'] = comments;
    data['userName'] = userName;
    data['userSurName'] = userSurName;

    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return ReportModel.fromJson(json);
  }
}

class CommentModel extends BaseModel {
  CommentId? commentId;

  CommentModel({this.commentId});

  CommentModel.fromJson(Map<String, dynamic> json) {
    commentId = json['commentId'] != null ? CommentId.fromJson(json['commentId']) : null;
  }
  CommentModel.empty();

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (commentId != null) {
      data['commentId'] = commentId!.toJson();
    }
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return CommentId.fromJson(json);
  }
}

class CommentId extends BaseModel {
  String? comment;
  String? id;
  String? userName;
  String? userSurname;
  String? userPhotoUrl;
  List<CommentId> commentList = [];

  CommentId({this.comment, this.id, this.userName, this.userSurname, this.userPhotoUrl});

  CommentId.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    id = json['id'];
    userName = json['userName'];
    userSurname = json['userSurname'];
    userPhotoUrl = json['userPhotoUrl'];
  }

  CommentId.empty();

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comment'] = comment;
    data['id'] = id;
    data['userName'] = userName;
    data['userSurname'] = userSurname;
    data['userPhotoUrl'] = userPhotoUrl;

    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return CommentId.fromJson(json);
  }
}
