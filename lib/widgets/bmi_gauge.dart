import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiGauge extends StatelessWidget {
  final double bmiScore;

  const BmiGauge({Key? key, required this.bmiScore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 40,
          showLastLabel: true,
          interval: 5,
          ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0, endValue: 18.5, color: const Color(0xff4aafa3)),
            GaugeRange(
                startValue: 18.5, endValue: 25, color: const Color(0xff5dcec4)),
            GaugeRange(
                startValue: 25, endValue: 30, color: const Color(0xfff9d438)),
            GaugeRange(
                startValue: 30, endValue: 40, color: const Color(0xfff9415b)),
          ],
          pointers: <GaugePointer>[
            NeedlePointer(
              value: bmiScore.toDouble(),
              needleColor: const Color(0xff313851),
              needleLength: 0.7,
              enableAnimation: true,
              animationDuration: 1000,
              needleStartWidth: 1,
              needleEndWidth: 4,
              knobStyle: const KnobStyle(
                knobRadius: 0.07,
                color: Colors.black,
              ),
            )
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Text(
                bmiScore.toStringAsFixed(1),
                style: const TextStyle(fontSize: 40, color: Color(0xff313851)),
              ),
              angle: 90,
              positionFactor: 0.5,
            )
          ],
        )
      ],
    );
  }
}
