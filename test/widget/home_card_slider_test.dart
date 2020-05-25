///     This program is free software: you can redistribute it and/or modify
///    it under the terms of the GNU General Public License as published by
///    the Free Software Foundation, either version 3 of the License, or
///    (at your option) any later version.
///
///    This program is distributed in the hope that it will be useful,
///    but WITHOUT ANY WARRANTY; without even the implied warranty of
///    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
///    GNU General Public License for more details.
///
///    You should have received a copy of the GNU General Public License
///    along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:covid19mobile/model/slider_model.dart';
import 'package:covid19mobile/providers/slider_provider.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/screens/home/components/card_home_slider.dart';
import 'package:covid19mobile/ui/screens/home/components/card_home_slider_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'widget_test_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Widget: Home Card Slider Widget', () {
    var path = "";
    var slides;
    var sliderProvider;

    getSliderWidget(tester, toLookUp) {
      var finder =
          find.descendant(of: toLookUp, matching: find.byType(Material));

      return tester.widget(finder) as Material;
    }

    setUp(() {
      slides = [
        SliderModel(image: path, order: 0),
        SliderModel(image: path, order: 1),
        SliderModel(image: path, order: 2),
        SliderModel(image: path, order: 3),
      ];
    });

    testWidgets('Create Slider with pages', (tester) async {
      sliderProvider = SliderProvider();
      expect(sliderProvider, isInstanceOf<SliderProvider>());

      expect(sliderProvider.slider, isNull);

      sliderProvider.setSlider(slides);

      expect(sliderProvider.slider, isNotNull);
      expect(sliderProvider.slider.length, slides.length);

      await tester.pumpWithEnvironment(MultiProvider(
        child: HomeSlider(),
        providers: [
          ChangeNotifierProvider<SliderProvider>.value(value: sliderProvider)
        ],
      ));

      // find HomeSlider Widget
      expect(find.byType(HomeSlider), findsOneWidget);

      expect(find.byType(CardHomeSliderIndicator), findsOneWidget);
    });

    testWidgets('Create Slider with pages - Validate Line Indicators',
        (tester) async {
      if (sliderProvider == null) {
        sliderProvider = SliderProvider();
        sliderProvider.setSlider(slides);
      }

      await tester.pumpWithEnvironment(MultiProvider(
        child: HomeSlider(
          transitionTime: 10,
        ),
        providers: [
          ChangeNotifierProvider<SliderProvider>.value(value: sliderProvider)
        ],
      ));

      var slider1 = find.byKey(Key("Card-Home-Slider-0"));
      var slider2 = find.byKey(Key("Card-Home-Slider-1"));
      var slider3 = find.byKey(Key("Card-Home-Slider-2"));
      var slider4 = find.byKey(Key("Card-Home-Slider-3"));

      expect(slider1, findsOneWidget);
      expect(slider2, findsOneWidget);
      expect(slider3, findsOneWidget);
      expect(slider4, findsOneWidget);

      /// Check if Slide have indicator color: Covid19Colors.green
      var slider1MaterialWidget = getSliderWidget(tester, slider1);
      expect(slider1MaterialWidget.color, Covid19Colors.green);

      /// Check if other slides have indicator color: Covid19Colors.grey
      var slider2MaterialWidget = getSliderWidget(tester, slider2);
      expect(slider2MaterialWidget.color, Covid19Colors.grey);

      var slider3MaterialWidget = getSliderWidget(tester, slider3);
      expect(slider3MaterialWidget.color, Covid19Colors.grey);

      var slider4MaterialWidget = getSliderWidget(tester, slider4);
      expect(slider4MaterialWidget.color, Covid19Colors.grey);

      /// Click on Indicator
      var finder = find.descendant(of: slider2, matching: find.byType(InkWell));

      await tester.tap(finder);
      await tester.pumpAndSettle(Duration(milliseconds: 10));

      /// Now Slide 1 Line Indicator should be grey
      slider1MaterialWidget = getSliderWidget(tester, slider1);
      expect(slider1MaterialWidget.color, Covid19Colors.grey);

      /// Now Slide 2 Line Indicator should be green
      slider2MaterialWidget = getSliderWidget(tester, slider2);
      expect(slider2MaterialWidget.color, Covid19Colors.green);
    });
  });
}
