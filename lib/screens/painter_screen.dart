import 'package:flutter/material.dart';

class PainterScreen extends StatefulWidget {
  const PainterScreen({Key? key}) : super(key: key);

  @override
  State<PainterScreen> createState() => _PainterScreenState();
}

class _PainterScreenState extends State<PainterScreen> {
  List<Offset> _points = <Offset>[];
  List<Offset> _historyPoints = <Offset>[];
  List<int> _backHistory = <int>[0];
  int historyCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            RenderBox renderBox = context.findRenderObject() as RenderBox;
            Offset localPosition =
                renderBox.globalToLocal(details.globalPosition);
            _points = List.from(_points)..add(localPosition);
            _historyPoints = List.from(_historyPoints)..add(localPosition);
          });
        },
        onPanEnd: (details) => {
          setState(
            () => {
              _points.add(Offset.infinite),
              _historyPoints.add(Offset.infinite),
              _backHistory.add(_points.length),
              historyCount += 1,
            },
          )
        },
        child: CustomPaint(
          painter: DrawingPainter(_points, context),
          size: Size.infinite,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: historyCount > 0
            ? () => {
                  setState(
                    () => {
                      historyCount -= 1,
                      _points = _points.sublist(0, _backHistory[historyCount]),
                    },
                  )
                }
            : null,
        child: Icon(
          Icons.history_outlined,
          size: 40,
        ),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  List<Offset> points;
  BuildContext context;

  DrawingPainter(this.points, this.context);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) {
    return oldDelegate.points != points;
  }
}
