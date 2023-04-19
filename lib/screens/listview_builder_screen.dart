import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  _ListViewBuilderScreenState createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  final List<int> imageIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      // print(
      //     '${scrollController.position.pixels} ${scrollController.position.maxScrollExtent}');
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  Future fetchData() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    add5();
    isLoading = false;
    setState(() {});
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(scrollController.position.maxScrollExtent + 120,
        duration: Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
  }

  void add5() {
    final lastId = imageIds.last;
    imageIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            ListView.builder(
              physics: BouncingScrollPhysics(),
              controller: scrollController,
              itemCount: imageIds.length,
              itemBuilder: (BuildContext context, int index) {
                return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/jar-loading.gif'),
                    image: NetworkImage(
                        'https://picsum.photos/500/300?image=${imageIds[index]}'));
              },
            ),
            if (isLoading)
              Positioned(
                bottom: 40,
                left: (size.width / 2 - 30),
                child: _LoadingIcon(),
              )
          ],
        ),
      ),
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
      child: CircularProgressIndicator(
        color: AppTheme.primaryColor,
      ),
    );
  }
}
