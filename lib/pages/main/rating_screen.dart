import 'package:flutter/material.dart';

import '../../global/global.dart';

///RatingScreen
///담당자 : ---

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {

  @override
  void initState() {
    super.initState();
    logger.i("RatingScreen");
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              child: GridView.builder(
                physics: ClampingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GridItem(
                    imageUrl: 'https://via.placeholder.com/150',
                    title: 'Item $index',
                  );
                },
              ),
            ),
          ),
        ];
      },
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Bottom content 1',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Bottom content 2',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Bottom content 3',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 200), // 예시로 추가한 콘텐츠 높이
          ],
        ),
      ),
    );
  }
}





class GridItem extends StatelessWidget {
  final String imageUrl;
  final String title;

  GridItem({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}