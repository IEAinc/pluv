import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluv/component/d_day_tag.dart';
import 'package:pluv/pages/main/member_profile_page.dart';

import '../global/text_styles.dart';

///ProfileCard
///담당자 : ---

class ProfileCard extends StatefulWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {

  @override
  void initState() {
    super.initState();
  }


  String sample = "https://media.istockphoto.com/id/1827291486/ko/%EC%82%AC%EC%A7%84/%EC%A0%84%EB%8B%B4-%EB%A9%98%ED%86%A0%EA%B0%80-%ED%9A%8C%EC%82%AC-%ED%9A%8C%EC%9D%98%EC%8B%A4%EC%97%90-%EC%95%89%EC%95%84-%EB%A9%98%ED%8B%B0%EB%93%A4%EC%97%90%EA%B2%8C-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%EC%9D%98-%EC%A4%91%EC%9A%94%EC%84%B1%EC%9D%84-%EC%84%A4%EB%AA%85%ED%95%98%EA%B3%A0-%EC%9E%88%EC%8A%B5%EB%8B%88%EB%8B%A4.jpg?s=1024x1024&w=is&k=20&c=-5zIBAjhFs34gMPafx5iQ-QhFP8IfQ8OUQrweW7c4tM=";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        Get.to(()=>MemberProfilePage());
      },
      child: Container(
        width: (Get.width-20-20)/3,
        child:Column(
          children: [
            Stack(
              children: [
                Container(

                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(sample,fit: BoxFit.cover,)),
                    )),
                Positioned(
                  right: 5,
                  top: 5,
                  child: DDayTag(),
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
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("주지훈 입니다",style: TextStyles.sub_title14_b,maxLines: 2,overflow: TextOverflow.ellipsis,),
              
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
