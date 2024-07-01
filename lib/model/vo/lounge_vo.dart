import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../controller/status_controller.dart';
import '../../global/global.dart';

class LoungeVo {

  String? loungeKey; // 라운지key
  String? writerUid; // 등록자uid
  bool? writerGender; // 등록자성별
  String? loungeCategoryCode; // 라운지카테고리코드
  String? loungeTitle; // 제목
  String? loungeDescription; // 내용
  num? viewCount; //조회수
  List<dynamic>?	likeList; // 좋아요리스트
  List<dynamic>?	loungeImageList; //	이미지리스트
  List<dynamic>?	loungeKeywordList; //	키워드리스트
  List<dynamic>?	commentList; // 댓글리스트
  List<dynamic>?	comment2List; // 대댓글리스트
  Timestamp? loungeCreateDate; //	라운지생성날짜
  num? loungeStatus; // 라운지 상태 1:정상,2:어드민블록,3:삭제
  bool? best;
  bool? test;

  //계산값
  String? loungeCategoryCodeKorean;
  LoungeVo({

    this.loungeKey,
    this.writerUid,
    this.writerGender,
    this.loungeCategoryCode,
    this.loungeTitle,
    this.loungeDescription,
    this.viewCount,
    this.likeList,
    this.loungeImageList,
    this.loungeKeywordList,
    this.commentList,
    this.comment2List,
    this.loungeCreateDate,
    this.loungeStatus,
    this.best,
    this.test,

  });
  StatusController _statusController = Get.find<StatusController>();
  LoungeVo.fromSnapshot(DocumentSnapshot documentSnapshot) {

    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    loungeKey = data['loungeKey']??"";
    writerUid = data['writerUid']??"";
    writerGender = data['writerGender']??false;
    loungeCategoryCode = data['loungeCategoryCode']??"";
    loungeCategoryCodeKorean = _statusController.appInfo.loungeCategoryCode?[data['loungeCategoryCode']]??"기타";
    loungeTitle = data['loungeTitle']??"";
    loungeDescription = data['loungeDescription']??"";
    viewCount = data['viewCount']??0;
    likeList = data['likeList']??[];
    loungeImageList = data['loungeImageList']??[];
    loungeKeywordList = data['loungeKeywordList']??[];
    commentList = data['commentList']??[];
    comment2List = data['comment2List']??[];
    loungeCreateDate = data['loungeCreateDate']??"";
    loungeStatus = data['loungeStatus']??1;
    best = data['best']??false;
    test = data['test']??false;
  }

  LoungeVo.fromJson(Map<dynamic,dynamic> data) {
    loungeKey = data['loungeKey']??"";
    writerUid = data['writerUid']??"";
    writerGender = data['writerUid']??false;
    loungeCategoryCode = data['loungeCategoryCode']??"";
    loungeCategoryCodeKorean = _statusController.appInfo.loungeCategoryCode?[data['loungeCategoryCode']]??"기타";
    loungeTitle = data['loungeTitle']??"";
    loungeDescription = data['loungeDescription']??"";

    viewCount = data['viewCount']==null?0:int.parse(data['viewCount']);

    likeList = data['likeList']??[];
    loungeImageList = data['loungeImageList']??[];
    loungeKeywordList = data['loungeKeywordList']??[];
    commentList = data['commentList']??[];
    comment2List = data['comment2List']??[];
    if(data['loungeCreateDate']!=null){
      // millisecondsSinceEpoch로부터 DateTime 생성
      int millisecondsSinceEpoch = int.parse(data['loungeCreateDate'])*1000;
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
      // DateTime을 TimeStamp로 변환 (UTC 기준)
      Timestamp timestamp = Timestamp.fromDate(dateTime.toLocal());
      loungeCreateDate = timestamp;
    }else{
      loungeCreateDate = Timestamp.now();
    }

    loungeStatus = data['loungeStatus']==null?0:int.parse(data['loungeStatus']);

    best = data['best'] == "true"?true:false;
    test = data['test'] == "true"?true:false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['loungeKey'] = this.loungeKey??"";
    data['writerUid'] = this.writerUid??"";
    data['writerGender'] = this.writerGender??false;

    data['loungeCategoryCode'] = this.loungeCategoryCode??"";
    data['loungeCategoryCodeKorean'] = this.loungeCategoryCodeKorean??"";
    data['loungeTitle'] = this.loungeTitle??"";
    data['loungeDescription'] = this.loungeDescription??"";
    data['viewCount'] = this.viewCount??0;
    data['likeList'] = this.likeList??[""];
    data['loungeImageList'] = this.loungeImageList??[""];
    data['loungeKeywordList'] = this.loungeKeywordList??[""];
    data['commentList'] = this.loungeImageList??[];
    data['comment2List'] = this.loungeKeywordList??[];
    data['loungeCreateDate'] = this.loungeCreateDate??"";
    data['loungeStatus'] = this.loungeStatus??1;
    data['best'] = this.best??false;
    data['test'] = this.test??false;

    return data;
  }



  LoungeVo.sample() {

    loungeKey = "";
    writerUid = "tester";
    loungeCategoryCode = "CT_RO_00"; // 기타
    loungeTitle = generateKoreanText(3);
    loungeDescription = generateKoreanText(10);
    viewCount = 0;
    likeList = [];
    loungeImageList = [
      "https://cdn.pixabay.com/photo/2023/07/30/09/12/red-hair-girl-8158373_640.jpg",
      "https://cdn.pixabay.com/photo/2024/01/12/17/01/leaves-8504392_1280.jpg",
      "https://cdn.pixabay.com/photo/2023/08/17/17/03/dahlia-8197027_1280.jpg"
    ];
    loungeKeywordList = [];
    loungeCreateDate = Timestamp.now();
    loungeStatus = 1;
    best = false;
    test = true;
  }
}
