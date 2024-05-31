import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluv/pages/main/party_detail_page.dart';

import '../global/global.dart';
import '../global/text_styles.dart';

///PartyCard
///담당자 : ---

class PartyCard extends StatefulWidget {
  final int type;
  const PartyCard({Key? key , required this.type}) : super(key: key);

  @override
  State<PartyCard> createState() => _PartyCardState();
}

class _PartyCardState extends State<PartyCard> {

  @override
  void initState() {
    super.initState();
  }

  String sample = "https://media.istockphoto.com/id/1827291486/ko/%EC%82%AC%EC%A7%84/%EC%A0%84%EB%8B%B4-%EB%A9%98%ED%86%A0%EA%B0%80-%ED%9A%8C%EC%82%AC-%ED%9A%8C%EC%9D%98%EC%8B%A4%EC%97%90-%EC%95%89%EC%95%84-%EB%A9%98%ED%8B%B0%EB%93%A4%EC%97%90%EA%B2%8C-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%EC%9D%98-%EC%A4%91%EC%9A%94%EC%84%B1%EC%9D%84-%EC%84%A4%EB%AA%85%ED%95%98%EA%B3%A0-%EC%9E%88%EC%8A%B5%EB%8B%88%EB%8B%A4.jpg?s=1024x1024&w=is&k=20&c=-5zIBAjhFs34gMPafx5iQ-QhFP8IfQ8OUQrweW7c4tM=";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>PartyDetailPage());
      },
      child: Container(
        //1 = big , 2 =small
        child:widget.type==1? Column(
          children: [
            Stack(
              children: [
                Container(
                    width: (Get.width-50)/2,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(sample,fit: BoxFit.cover,)),
                    )),
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
            Container(
              width: (Get.width-50)/2,
              child: Column(
                children: [
                  Text("파티제목파티제목파티제목파티제목파티제목",style: TextStyles.sub_title14_b,),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("19분 전",style: TextStyles.contenets12_g1,),
                      Container(
                        width: 24,height: 24,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color:appColorPrimary2),
                        child: Center(child: Text("남",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,height: 1,color: Colors.white),)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ):Column(
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
            Text("파티제목 텍스트파티제목목목",style: TextStyles.sub_title12_b,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
    Text("19분 전",style: TextStyles.contenets12_g1,),
                Container(
                  width: 16,height: 16,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color:appColorPrimary2),
                  child: Center(child: Text("남",style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,height: 1,color: Colors.white),)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
