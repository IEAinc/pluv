import 'package:flutter/material.dart';

import '../../global/global.dart';
import '../../global/text_styles.dart';

///LikeParty
///담당자 : ---

class LikeParty extends StatefulWidget {
  const LikeParty({Key? key}) : super(key: key);

  @override
  State<LikeParty> createState() => _LikePartyState();
}

class _LikePartyState extends State<LikeParty> {

  @override
  void initState() {
    super.initState();
    logger.i("LikeParty");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 그리드 열 수
            childAspectRatio: 3/5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20
        ),
        itemBuilder: (BuildContext context, int index) {
          // index에 따라 각 아이템을 생성
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [

                  GestureDetector(
                    onTap: (){},
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://cdn.pixabay.com/photo/2023/01/03/16/00/dog-7694676_1280.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                              return Container(
                                color: appColorGray1,
                              );
                            },
                          )
                      ),
                    ),
                  ),
                  Positioned(
                    left: 5,
                    top: 5,
                    child: Container(
                      height: 18,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1,),
                          color: Colors.white ,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(child: Text("2:2 미팅",style: TextStyle(fontSize: 10,height: 1),)),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 5,
                    child: Container(
                      height: 18,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.supervisor_account,size: 14,color: Colors.white,),
                          SizedBox(width: 5,),
                          Text("1",style: TextStyle(color: Colors.white,fontSize: 10),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Text("파티제목 텍스트파티제목목목",style: TextStyles.title24_b,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("19분 전"),
                  Container(
                    width: 16,height: 16,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color:appColorPrimary2),
                    child: Center(child: Text("남",style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,height: 1,color: Colors.white),)),
                  )
                ],
              ),
            ],
          ); // 여기서 YourGridItemWidget은 각 그리드 아이템을 나타내는 위젯입니다.
        },
        itemCount: 6, // 그리드에 표시할 전체 아이템 수
      ),
    );
  }
}
