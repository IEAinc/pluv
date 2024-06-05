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

  CommentVo.fromSnapshot(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    commentKey = data['commentKey']??"";
    targetCommunityKey = data['targetCommunityKey']??"";
    replyDepth = data['replyDepth']??1;
    upperReplyKey = data['upperReplyKey']??null;
    writerUid = data['writerUid']??"";
    commentDescription = data['commentDescription']??"";
    commentStatus = data['commentStatus']??1;
    commentCreateDate = data['commentCreateDate']??Timestamp.now();
    test = data['test']??true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['commentKey'] = this.commentKey??"";
    data['targetCommunityKey'] = this.targetCommunityKey??"";
    data['replyDepth'] = this.replyDepth??1;
    data['upperReplyKey'] = this.upperReplyKey??null;
    data['writerUid'] = this.writerUid??"";
    data['commentDescription'] = this.commentDescription??"";
    data['commentStatus'] = this.commentStatus??1;
    data['commentCreateDate'] = this.commentCreateDate??Timestamp.now();
    data['test'] = this.test??true;

    return data;
  }



  CommentVo.sample() {

    commentKey = "";
    targetCommunityKey = "targetCommunityKey";
    replyDepth = 1;
    upperReplyKey = "";
    writerUid = "writerUid";
    commentDescription = "commentDescription";
    commentStatus = 1;
    commentCreateDate = Timestamp.now();
    test = true;
  }


}
