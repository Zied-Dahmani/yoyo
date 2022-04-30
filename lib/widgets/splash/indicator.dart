import 'dart:math';
import 'package:flutter/material.dart';
import 'package:yoyo/utilities/constants.dart';

class Indicator extends StatefulWidget {

  const Indicator({Key? key, this.duration, this.size, this.function, this.progressValue}) : super(key: key);
  final duration,size,function,progressValue;
  @override
  _IndicatorState createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(size: Size(widget.size,widget.size),painter: ProgressPainter(widget.progressValue)),
    );
  }
}

class ProgressPainter extends CustomPainter{

  ProgressPainter(this.progress);
  final progress;

  @override
  void paint(Canvas canvas, Size size) {
    var _linePaint=Paint()..style=PaintingStyle.stroke..strokeWidth=2..color=kpink!;
    var _circlePaint=Paint()..style=PaintingStyle.fill..color=kpink!;
    final _radians = (progress/100)*2*pi;
    _drawShape(canvas,_linePaint,_circlePaint,-pi/2,_radians,size);
  }

  void _drawShape(canvas,linePaint,circlePaint,startRadian,sweepRadian,size)
  {
    final _centerX = size.width /2,
          _centerY= size.height/2;
    final _centerOffset =Offset(_centerX,_centerY);
    final double _radius = min(size.width,size.height) ;

    canvas.drawArc(Rect.fromCircle(center: _centerOffset, radius: _radius/2),startRadian,sweepRadian,false,linePaint);

    final  x=(_radius/2)*(1+sin(sweepRadian)),
           y=(_radius/2)*(1-cos(sweepRadian));
    final _circleOffset=Offset(x, y);
    if(progress!=0)
    canvas.drawCircle(_circleOffset,5.0,circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}