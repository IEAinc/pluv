import 'package:cloud_firestore/cloud_firestore.dart';

class CommentReportVo {


  String?	commentReportKey; // 댓글신고key
  String?	reportedCommentUid; // 신고된댓글uid
  String?	reporterUid; // 신고자uid
  String?	reportedCommentWriterUid; // 신고댓글작성자uid
  String?	rootPostKey; // 루트게시글key
  String?	reportCode; // 댓글신고코드
  String?	detailedReport; // 상세신고내역
  num?	reportStatus; // 신고상태
  Timestamp? reportCreateDate; //신고들어온날짜
  Timestamp?	reportProcessedDate; // 처리완료날짜

  CommentReportVo({
    this.commentReportKey,
    this.reportedCommentUid,
    this.reporterUid,
    this.reportedCommentWriterUid,
    this.rootPostKey,
    this.reportCode,
    this.detailedReport,
    this.reportStatus,
    this.reportCreateDate,
    this.reportProcessedDate,

  });

  CommentReportVo.fromSnapshot(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    commentReportKey = data['commentReportKey']??"";
    reportedCommentUid = data['reportedCommentUid']??"";
    reporterUid = data['reporterUid']??"";
    reportedCommentWriterUid = data['reportedCommentWriterUid']??"";
    rootPostKey = data['rootPostKey']??"";
    reportCode = data['reportCode']??"";
    detailedReport = data['detailedReport']??"";
    reportStatus = data['reportStatus']??1;
    reportCreateDate = data['reportCreateDate']??Timestamp.now();
    reportProcessedDate = data['reportProcessedDate']??Timestamp.now();

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['commentReportKey'] = commentReportKey??"";
    data['reportedCommentUid'] = reportedCommentUid??"";
    data['reporterUid'] = reporterUid??1;
    data['reportedCommentWriterUid'] = reportedCommentWriterUid??"";
    data['rootPostKey'] = rootPostKey??"";
    data['reportCode'] = reportCode??"";
    data['detailedReport'] = detailedReport??1;
    data['reportStatus'] = reportStatus??1;
    data['reportCreateDate'] = reportCreateDate??Timestamp.now();
    data['reportProcessedDate'] = reportProcessedDate??Timestamp.now();


    return data;
  }






}
