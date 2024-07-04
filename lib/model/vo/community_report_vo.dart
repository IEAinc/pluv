import 'package:cloud_firestore/cloud_firestore.dart';

class CommunityReportVo {


  String? communityReportKey; //커뮤니티신고key
  String? reportedCommunityKey; //신고된 커뮤니티key
  num? communityType; //커뮤니티종류
  String? reporterUid; //신고자uid
  String? communityReportCode; //커뮤니티신고코드
  String? detailedReport; //상세신고내역
  num? reportStatus; //신고상태
  Timestamp? reportCreateDate; //신고들어온날짜
  Timestamp? reportProcessedDate; //처리완료날짜

  CommunityReportVo({
    this.communityReportKey,
    this.reportedCommunityKey,
    this.communityType,
    this.reporterUid,
    this.communityReportCode,
    this.detailedReport,
    this.reportStatus,
    this.reportCreateDate,
    this.reportProcessedDate,

  });

  CommunityReportVo.fromSnapshot(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    communityReportKey = data['communityReportKey']??"";
    reportedCommunityKey = data['reportedCommunityKey']??"";
    communityType = data['communityType']??1;
    reporterUid = data['reporterUid']??"";
    communityReportCode = data['communityReportCode']??"";
    detailedReport = data['detailedReport']??"";
    reportStatus = data['reportStatus']??1;
    reportCreateDate = data['reportCreateDate']??"";
    reportProcessedDate = data['reportProcessedDate']??"";

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['communityReportKey'] = communityReportKey??"";
    data['reportedCommunityKey'] = reportedCommunityKey??"";
    data['communityType'] = communityType??1;
    data['reporterUid'] = reporterUid??"";
    data['communityReportCode'] = communityReportCode??"";
    data['detailedReport'] = detailedReport??"";
    data['reportStatus'] = reportStatus??1;
    data['reportCreateDate'] = reportCreateDate??Timestamp.now();
    data['reportProcessedDate'] = reportProcessedDate??Timestamp.now();

    return data;
  }






}
