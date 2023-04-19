import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Widget'),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          children: [
            CustomCardPerson(),
            SizedBox(height: 15.0),
            Text('data'),
            CustomCardType2(
                imgUrl:
                    'https://predios.com.co/wp-content/uploads/2021/06/travel-landscape-01.jpg',
                name: 'Mi laguito bello'),
            SizedBox(height: 20.0),
            CustomCardType2(
              imgUrl:
                  'https://img.freepik.com/fotos-premium/paisaje-bosque-verde-al-amanecer_31965-3505.jpg?w=2500',
            ),
            SizedBox(height: 20.0),
            CustomCardType2(
              imgUrl:
                  'https://www.nationalgeographic.com.es/medio/2021/12/30/kunming-provincia-de-yunnan-china_d575b3ff_2000x1125.jpg',
            ),
            SizedBox(height: 20.0),
            CustomCardType2(
              imgUrl:
                  'https://mott.pe/noticias/wp-content/uploads/2019/03/los-50-paisajes-maravillosos-del-mundo-para-tomar-fotos-1280x720.jpg',
            ),
            SizedBox(height: 20.0),
            CustomCardType2(
              imgUrl:
                  'https://images.unsplash.com/photo-1549556289-9706946b9c56?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGFpc2FqZXxlbnwwfHwwfHw%3D&w=1000&q=80',
            ),
            SizedBox(height: 70.0),
          ],
        ),
      ),
    );
  }
}
