import 'package:cloud_firestore/cloud_firestore.dart';

class CommentVo {

  String? commentKey; //	댓글key
  String? targetCommunityKey; //	대상커뮤니티key
  num? replyDepth; //	댓글레벨
  String? upperReplyKey; //	상위댓글key
  String? writerUid; //	댓글작성자uid
  String? commentDescription; //	댓글내용
  num? commentStatus; //	댓글상태
  Timestamp? commentCreateDate; //	댓글생성날짜
  bool? test; // 테스트 여부

  CommentVo({
    this.commentKey,
    this.targetCommunityKey,
    this.replyDepth,
    this.upperReplyKey,
    this.writerUid,
    this.commentDescription,
    this.commentStatus,
    this.commentCreateDate,
    this.test,
  });


}
