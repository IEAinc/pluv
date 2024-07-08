import 'package:cloud_firestore/cloud_firestore.dart';

class CommentVo {

  String? commentKey; //	댓글key
  String? targetCommunityKey; //	대상커뮤니티key
  num? replyDepth; //	댓글레벨
  String? upperReplyKey; //	상위댓글key
  List<dynamic>?underCommentList; //	하위댓글리스트
  String? writerUid; //	댓글작성자uid
  bool?	writerGender;	// 댓글작성자성별
  String? commentDescription; //	댓글내용
  num? commentStatus; //	댓글상태
  Timestamp? commentCreateDate; //	댓글생성날짜
  Timestamp? commentUpdateDate; //	댓글생성날짜
  bool? test; // 테스트 여부

  CommentVo({
    this.commentKey,
    this.targetCommunityKey,
    this.replyDepth,
    this.upperReplyKey,
    this.underCommentList,
    this.writerUid,
    this.writerGender,
    this.commentDescription,
    this.commentStatus,
    this.commentCreateDate,
    this.commentUpdateDate,
    this.test,
  });

  CommentVo.fromSnapshot(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    commentKey = data['commentKey']??"";
    targetCommunityKey = data['targetCommunityKey']??"";
    replyDepth = data['replyDepth']??1;
    upperReplyKey = data['upperReplyKey']??null;
    underCommentList = data['underCommentList']??[];
    writerUid = data['writerUid']??"";
    writerGender = data['writerGender']??false;
    commentDescription = data['commentDescription']??"";
    commentStatus = data['commentStatus']??1;
    commentCreateDate = data['commentCreateDate']??Timestamp.now();
    commentUpdateDate = data['commentUpdateDate']??commentCreateDate;
    test = data['test']??true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['commentKey'] = commentKey??"";
    data['targetCommunityKey'] = targetCommunityKey??"";
    data['replyDepth'] = replyDepth??1;
    data['upperReplyKey'] = upperReplyKey??"";
    data['underCommentList'] = underCommentList??[];
    data['writerUid'] = writerUid??"";
    data['writerGender'] = writerGender??false;
    data['commentDescription'] = commentDescription??"";
    data['commentStatus'] = commentStatus??1;
    data['commentCreateDate'] = commentCreateDate??Timestamp.now();
    data['commentUpdateDate'] = commentUpdateDate??commentCreateDate;
    data['test'] = test??true;

    return data;
  }


}
