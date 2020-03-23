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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid19mobile/ui/assets/colors.dart';

mixin SvgIcons {
  static Widget phoneSvg = SvgPicture.asset(
    'assets/icon_action_phone.svg',
    color: Covid19Colors.green,
  );

  static Widget emailSvg = SvgPicture.asset(
    'assets/icon_action_email.svg',
    color: Covid19Colors.green,
  );

  static Widget linkSvg({Color color = Covid19Colors.green, double size = 24.0}) => SvgPicture.asset(
    'assets/icon_action_link.svg',
    color: color,
    width: size,
    height: size,
  );
}
