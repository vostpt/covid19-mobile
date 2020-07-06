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

///Possible intervals
const List<double> intervals = [
  1,
  5,
  10,
  100,
  500,
  1000,
  5000,
  10000,
  50000,
  100000,
  500000,
  1000000
];

double findInterval(int value) {
  for (int i = 0; i < intervals.length - 1; i++) {
    if (intervals[i] < value && intervals[i + 1] > value) {
      return intervals[i + 1];
    }
  }
  return 1.0;
}

///
/// Determines the best divider value,
///   useful for the YY axis in the plots
///
/// :Description:
/// The goal is to find a divider that makes sense for the YY axis,
///   the meaning of "make sense" is subjetive, however is a try to
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
double calculateDividerInterval(double maxValue) {
  /// Determine how many digits (non decimal) the max value has
  /// Substract 2 to have a better division
  ///
  /// Example, if [maxValue] is 134402 we would get 100000 with -1
  int power = maxValue.truncate().toString().length - 2;
  power = power < 1 ? 1 : power;

  /// [multiplier] is the value in which we will determine
  int multipiler = math.pow(10, power);
  multipiler = (multipiler.isNaN || multipiler.isInfinite) ? 1 : multipiler;

  /// Using ~/ because we want to get an `int` out of the division
  /// [multiplier] at this point will be a value power of 10
  ///
  /// We multiply the result with same multipier so that we get back the
  ///   left most number, example with `[maxValue] = 134402` we will have
  ///   [interval] of 100_000 then we divide by 10 to end up with a
  ///   interval as 10_000
  int interval = ((maxValue ~/ multipiler) * multipiler ~/ 10);

  // checking == 0 since it can give NaN and Infinite double (?)
  return findInterval(interval == 0 ? 1 : interval);
}
