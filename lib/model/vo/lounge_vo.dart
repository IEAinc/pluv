import 'package:cloud_firestore/cloud_firestore.dart';

class LoungeVo {

  String? loungeKey; // 라운지key
  String? registrationMemberUid; // 등록자uid
  String? loungeCategoryCode; // 라운지카테고리코드
  String? loungeTitle; // 제목
  String? loungeDescription; // 내용
  num? viewCount; //조회수
  List<String>?	loungeImageList; //	이미지리스트
  List<String>?	loungeKeywordList; //	키워드리스트
  Timestamp? loungeCreateDate; //	라운지생성날짜
  bool? test;

  LoungeVo({

    this.loungeKey,
    this.registrationMemberUid,
    this.loungeCategoryCode,
    this.loungeTitle,
    this.loungeDescription,
    this.viewCount,
    this.loungeImageList,
    this.loungeKeywordList,
    this.loungeCreateDate,
    this.test,

  });

  LoungeVo.fromSnapshot(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    loungeKey = data['loungeKey']??"";
    registrationMemberUid = data['registrationMemberUid']??"";
    loungeCategoryCode = data['loungeCategoryCode']??"";
    loungeTitle = data['loungeTitle']??"";
    loungeDescription = data['loungeDescription']??"";
    viewCount = data['viewCount']??0;
    loungeImageList = data['loungeImageList']??[];
    loungeKeywordList = data['loungeKeywordList']??[];
    loungeCreateDate = data['loungeCreateDate']??"";
    test = data['test']??false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['loungeKey'] = this.loungeKey??"";
    data['registrationMemberUid'] = this.registrationMemberUid??"";
    data['loungeCategoryCode'] = this.loungeCategoryCode??"";
    data['loungeTitle'] = this.loungeTitle??"";
    data['loungeDescription'] = this.loungeDescription??"";
    data['viewCount'] = this.viewCount??0;
    data['loungeImageList'] = this.loungeImageList??[""];
    data['loungeKeywordList'] = this.loungeKeywordList??[""];
    data['loungeCreateDate'] = this.loungeCreateDate??"";
    data['test'] = this.test??false;

    return data;
  }

}
