import 'package:cloud_firestore/cloud_firestore.dart';

class AdminVo {

  String?	adminUid; //	관리자uid
  String?	adminNickName; //	관리자닉네임
  String?	adminThumbnail; //	관리자썸내일
  String?	contactNumber; //	연락처
  String?	adminEmail; //	이메일

  AdminVo({
    this.adminUid,
    this.adminNickName,
    this.adminThumbnail,
    this.contactNumber,
    this.adminEmail,

  });

  AdminVo.fromSnapshot(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    adminUid = data['adminUid']??"";
    adminNickName = data['adminNickName']??"";
    adminThumbnail = data['adminThumbnail']??"";
    contactNumber = data['contactNumber']??"";
    adminEmail = data['adminEmail']??"";

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['adminUid'] = adminUid;
    data['adminNickName'] = adminNickName;
    data['adminThumbnail'] = adminThumbnail;
    data['contactNumber'] = contactNumber;
    data['adminEmail'] = adminEmail;

    return data;
  }



}
