import 'package:bike_path_app/core/base/model/base_model.dart';

class ReportModel extends BaseModel {
  String? address;
  int? commentCount;
  Comments? comments;
  String? date;
  String? description;
  int? likeCount;
  List<int>? location;
  String? photo;
  String? title;

  ReportModel(
      {required this.address,
      this.commentCount = 0,
      this.comments,
      required this.date,
      required this.description,
      this.likeCount = 0,
      required this.location,
      required this.photo,
      required this.title});

  ReportModel.empty();

  ReportModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    commentCount = json['commentCount'];
    comments = json['comments'] != null ? Comments.fromJson(json['comments']) : null;
    date = json['date'];
    description = json['description'];
    likeCount = json['likeCount'];
    location = json['location'].cast<int>();
    photo = json['photo'];
    title = json['title'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['commentCount'] = commentCount;
    if (comments != null) {
      data['comments'] = comments!.toJson();
    }
    data['date'] = date;
    data['description'] = description;
    data['likeCount'] = likeCount;
    data['location'] = location;
    data['photo'] = photo;
    data['title'] = title;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return ReportModel.fromJson(json);
  }
}

class Comments {
  String? id1;
  String? id2;

  Comments({this.id1, this.id2});

  Comments.fromJson(Map<String, dynamic> json) {
    id1 = json['id1'];
    id2 = json['id2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id1'] = id1;
    data['id2'] = id2;
    return data;
  }
}
