class UserModel {
  String? email;
  String? wrool;
  String? uid;

  UserModel({this.uid, this.email, this.wrool});

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      wrool: map['wrool'],
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'email': email,
      'wrool': wrool,
    };
  }
}
