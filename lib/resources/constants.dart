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

import 'dart:ui';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:intl/intl.dart';

const String bundle = 'com.vost.covid19mobile';

const String routeSplash = "/";
const String routeHome = "home";
const String routeStatistics = "statistics";
const String routeContacts = "contacts";
const String routeFaqs = "faqs";
const String routeFaqsDetails = "faqs/details";
const String routeAbout = "about";
const String routeVideos = "videos";
const String routeVideoPlayer = "videos/player";
const String routeRemoteWork = "remoteWork";
const String routeRemoteWorkDetails = "remoteWork/details";
const String routeNotifications = "notifications";
const String routeMeasures = "measures";
const String routeMeasuresDetails = "measures/details";
const String routeInitiatives = "initiatives";
const String routeLicences = "licences";
const String routeStatisticsConfirmed = "statistics/confirmed";
const String routeStatisticsDeaths = "statistics/deaths";
const String routeStatisticsRecovered = "statistics/recovered";
const String routeStatisticsHospitalized = "statistics/hospitalized";

/// DSSG Source Date Time format
final DateFormat formatDSSGDateTime = DateFormat("DD-MM-yyyy HH:mm");

/// First day of DSSG Data
final DateTime firstDayOfData = DateTime(2020, 2, 26);

/// Gradient for the Plots
const List<Color> gradientColors = [
  Covid19Colors.white,
  Covid19Colors.green,
];
