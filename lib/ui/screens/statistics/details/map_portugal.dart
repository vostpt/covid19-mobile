import 'package:covid19mobile/resources/icons_svg.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_container.dart';
import 'package:covid19mobile/ui/widgets/border_decorator.dart';
import 'package:flutter/material.dart';

class PortugalMapStatistics extends StatelessWidget {
  final int acores;
  final int madeira;
  final int north;
  final int center;
  final int lvt;
  final int alentejo;
  final int algarve;

  const PortugalMapStatistics({
    Key key,
    this.acores,
    this.madeira,
    this.north,
    this.center,
    this.lvt,
    this.alentejo,
    this.algarve,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatisticsContainer(
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PortugalIslandsStatistics(
                  island: SvgIcons.portugalAcores(),
                  name: "Açores",
                  number: acores,
                ),
                _PortugalIslandsStatistics(
                  island: SvgIcons.portugalMadeira(),
                  name: "Madeira",
                  number: madeira,
                ),
              ],
            ),
          ),
          SizedBox(width: 38),
          Expanded(
            flex: 6,
            child: Stack(
              children: <Widget>[
                SvgIcons.portugalContinental(),
                // Norte
                Positioned(
                  top: 22.0,
                  left: 35.0,
                  child: _StatisticsLabel(
                    number: north,
                  ),
                ),
                // Centro Norte
                Positioned(
                  top: 68.0,
                  left: 32.0,
                  child: _StatisticsLabel(
                    number: center,
                  ),
                ),
                // Lisboa
                Positioned(
                  top: 118.0,
                  left: 6.0,
                  child: _StatisticsLabel(
                    number: lvt,
                  ),
                ),
                // Alentejo
                Positioned(
                  top: 152.0,
                  left: 32.0,
                  child: _StatisticsLabel(
                    number: alentejo,
                  ),
                ),
                // Algarve
                Positioned(
                  top: 193.0,
                  left: 24.0,
                  child: _StatisticsLabel(
                    number: algarve,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _PortugalIslandsStatistics extends StatelessWidget {
  final Widget island;
  final String name;
  final int number;

  const _PortugalIslandsStatistics({
    Key key,
    this.island,
    this.name,
    this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Covid19StatsBorderDecorator(),
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Covid19Colors.textGrey),
                ),
              ),
              SizedBox(
                width: 4.0,
              ),
              Text(
                number.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
              )
            ],
          ),
          SizedBox(
            height: 12.0,
          ),
          Container(
            margin: EdgeInsets.all(
              8.0,
            ),
            child: island,
          ),
        ],
      ),
    );
  }
}

class _StatisticsLabel extends StatelessWidget {
  final int number;

  const _StatisticsLabel({
    Key key,
    this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(2.0),
        ),
      ),
      margin: EdgeInsets.symmetric(
        vertical: 2.0,
        horizontal: 4.0,
      ),
      child: Text(
        number.toString(),
        style: Theme.of(context).textTheme.bodyText2.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 14.0,
            ),
      ),
    );
  }
}

int getTotalConfirmed(Map<int, double> map) {
  if (map == null) {
    return 0;
  }
  return map.values.last.toInt();
}
