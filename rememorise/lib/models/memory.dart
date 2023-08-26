class GetMemoriesResponse {
  String? status;
  String? message;
  List<Memory>? data;

  GetMemoriesResponse({this.status, this.message, this.data});

  GetMemoriesResponse.fromJson(json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Memory>[];
      json['data'].forEach((v) {
        data!.add(Memory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Memory {
  String? id;
  String? email;
  String? subject;
  String? description;
  List<String>? tags;
  bool? notify;
  bool? isDeleted;
  String? lastNotified;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Memory(
      {this.id,
      this.email,
      this.subject,
      this.description,
      this.tags,
      this.notify,
      this.isDeleted,
      this.lastNotified,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Memory.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    subject = json['subject'];
    description = json['description'];
    if (json['tags'] != null) {
      tags = <String>[];
      json['tags'].forEach((v) {
        tags!.add(v);
      });
    }
    notify = json['notify'];
    isDeleted = json['isDeleted'];
    lastNotified = json['last_notified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['email'] = email;
    data['subject'] = subject;
    data['description'] = description;
    if (tags != null) {
      data['tags'] = tags;
    }
    data['notify'] = notify;
    data['isDeleted'] = isDeleted;
    data['last_notified'] = lastNotified;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
