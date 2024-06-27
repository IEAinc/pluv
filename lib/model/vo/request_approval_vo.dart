import 'package:cloud_firestore/cloud_firestore.dart';

class RequestApprovalVo {

  String? memberUid;	//요청자 key
  String? memberName;	//요청자 이름
  bool? memberGender;	//요청자 성별
  String? memberPhone;	//요청자 폰
  num? screeningDivision;	//심사구분
  bool? approval;	//승인여부
  Timestamp? requestDate;	//요청일자
  Timestamp? approvalDate;	//승인일자
  String? assignedAdminUid;	//담당관리자 uid
  String? approvalAdminUid;	//승인관리자 uid

  
  RequestApprovalVo({
    this.memberUid,
    this.memberName,
    this.memberGender,
    this.memberPhone,
    this.screeningDivision,
    this.approval,
    this.requestDate,
    this.approvalDate,
    this.assignedAdminUid,
    this.approvalAdminUid,
  });

  //이건 사실 필요없음. 앱에서는 안사용하고 어드민에서 사용하는 부분이기 때문에
  RequestApprovalVo.fromSnapshot(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    memberUid = data['memberUid']??"";
    memberName = data['memberName']??"";
    memberGender = data['memberGender']??false;
    memberPhone = data['memberPhone']??"";
    screeningDivision = data['screeningDivision']??1;
    approval = data['approval']??false;
    requestDate = data['requestDate']??Timestamp.now();
    approvalDate = data['approvalDate'];
    assignedAdminUid = data['assignedAdminUid']??"";
    approvalAdminUid = data['approvalAdminUid']??"";

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['memberUid'] = memberUid??"";
    data['memberName'] = memberName??"";
    data['memberGender'] = memberGender??false;
    data['memberPhone'] = memberPhone??"";
    data['screeningDivision'] = screeningDivision??1;
    data['approval'] = approval??false;
    data['requestDate'] = requestDate??Timestamp.now();
    data['approvalDate'] = approvalDate;
    data['assignedAdminUid'] = assignedAdminUid??"";
    data['approvalAdminUid'] = approvalAdminUid??"";

    return data;
  }



}
