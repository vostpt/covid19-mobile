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

/// Post types
enum PostTypes { measures, remoteWork, videos, faq, initiatives }

class PostType {
  final PostTypes postTypes;

  PostType(this.postTypes);

  String getRequestType() {
    switch (postTypes) {
      case PostTypes.measures:
        return '/measures';
      case PostTypes.remoteWork:
        return '/remote_work';
      case PostTypes.videos:
        return '/videos';
        break;
      case PostTypes.videos:
        return '/videos';
        break;
      case PostTypes.faq:
        return '/faqs';
        break;
      case PostTypes.videos:
        return '/videos';
      case PostTypes.initiatives:
        return '/measures?categories=6';
      default:
        return '';
    }
  }
}
