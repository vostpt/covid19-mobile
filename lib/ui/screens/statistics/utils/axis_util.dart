///    This program is free software: you can redistribute it and/or modify
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

import 'dart:math' as math;

double findInterval(int value) {
  if (value < 1) {
    return 1;
  }
  if (value < 5) {
    return 5;
  }

  double power = 1;
  double interval = 10.0;

  while (value > interval) {
    interval = math.pow(10, power);

    if (value <= interval) {
      return interval;
    }

    if (value <= interval * 5) {
      return interval * 5;
    }

    power += 1;

    if (power > 15) {
      // Ok, enough!
      return interval;
    }
  }

  return interval;
}

///
/// Determines the best divider value,
///   useful for the YY axis in the plots
///
/// :Description:
/// The goal is to find a divider that makes sense for the YY axis,
///   the meaning of "make sense" is subjetive, here we are trying to
///   aproximate the divider to values as 5000, 1000, 500, 100, 50, 10 or others
///   so that we can avoid having dividers in our plots that are these bad example
///   5030, 1111, 745, 85, 39, 7 or others
///
/// :assumptions:
/// - [maxValue] - The max possible YY value the plot gets
/// - All are between 0 and [maxValue]
///
///
///
double calculateDividerInterval(double minValue, double maxValue) {
  double delta = maxValue - minValue;

  /// Determine how many digits (non decimal) the max value has
  /// Substract 2 to have a better division
  ///
  /// Example, if [delta] is 134_402 we would get 100_000 with -1
  int power = delta.truncate().toString().length - 1;
  power = power < 1 ? 1 : power;

  /// [multiplier] is the value in which we will determine
  int multipiler = math.pow(10, power);
  multipiler = (multipiler.isNaN || multipiler.isInfinite) ? 1 : multipiler;

  /// Using ~/ because we want to get an `int` out of the division
  /// [multiplier] at this point will be a value power of 10
  ///
  /// We multiply the result with same multipier so that we get back the
  ///   left most number, example with `[delta] = 134_402` we will have
  ///   [interval] of 100_000 then we divide by 10 to end up with a
  ///   interval as 10_000
  int interval = ((delta ~/ multipiler) * multipiler ~/ 10);

  // checking == 0 since it can give NaN and Infinite double (?)
  return findInterval(interval == 0 ? 1 : interval);
}

/// Rounds down the value to the lowest value given the interval.
///
/// example
/// interval =   1000
/// minValue = 785342
/// result =   785000
///
/// Used for the max & min values of the YY plots
double roundToNearestIntervalValue(double interval, double value) {
  int cut = interval.truncate().toString().length;
  cut = cut < 1 ? 1 : cut;

  return (value / interval).truncateToDouble() * interval;
}
