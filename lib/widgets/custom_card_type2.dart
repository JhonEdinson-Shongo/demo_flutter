import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

class CustomCardType2 extends StatelessWidget {
  final String imgUrl;
  final String? name;

  const CustomCardType2({Key? key, required this.imgUrl, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10.0,
      shadowColor: AppTheme.primaryColor.withOpacity(0.4),
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(imgUrl),
            width: double.infinity,
            height: 240,
            fit: BoxFit.cover,
            fadeInDuration: Duration(milliseconds: 400),
          ),
          if (name != null)
            Container(
              alignment: AlignmentDirectional.bottomEnd,
              padding: EdgeInsets.all(10),
              child: Text(name!),
            ),
        ],
      ),
    );
  }
}
