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

import 'package:covid19mobile/model/measures_model.dart';
import 'package:flutter/material.dart';

/// Creates a [MeasuresModel] Provider for updating UI for
class MeasuresProvider extends ChangeNotifier {
  int _id;
  int get id => _id;

  String _author;
  String get author => _author;

  String _date;
  String get date => _date;

  String _postDateGmt;
  String get postDateGmt => _postDateGmt;

  String _postContent;
  String get postContent => _postContent;

  String _postTitle;
  String get postTitle => _postTitle;

  String _postExcerpt;
  String get postExcerpt => _postExcerpt;

  String _postStatus;
  String get postStatus => _postStatus;

  String _commentStatus;
  String get commentStatus => _commentStatus;

  String _pingStatus;
  String get pingStatus => _pingStatus;

  String _postPassword;
  String get postPassword => _postPassword;

  String _postName;
  String get postName => _postName;

  String _toPing;
  String get toPing => _toPing;

  String _pinged;
  String get pinged => _pinged;

  String _postModified;
  String get postModified => _postModified;

  String _postModifiedGMT;
  String get postModifiedGMT => _postModifiedGMT;

  String _postContentFiltered;
  String get postContentFiltered => _postContentFiltered;

  int _postParent;
  int get postParent => _postParent;

  String _guid;
  String get guid => _guid;

  int _menuOrder;
  int get menuOrder => _menuOrder;

  String _postType;
  String get postType => _postType;

  String _postMimeType;
  String get postMimeType => _postMimeType;

  String _commentCount;
  String get commentCount => _commentCount;

  String _filter;
  String get filter => _filter;

  bool _documents;
  bool get documents => _documents;

  bool _links;
  bool get links => _links;

  setMeasures(MeasuresModel measures) {
    _id = measures.id;
    _author = measures.author;
    _date = measures.date;
    _postDateGmt = measures.postDateGmt;
    _postContent = measures.postContent;
    _postTitle = measures.postTitle;
    _postExcerpt = measures.postExcerpt;
    _postStatus = measures.postStatus;
    _commentStatus = measures.commentStatus;
    _pingStatus = measures.pingStatus;
    _postPassword = measures.postPassword;
    _postName = measures.postName;
    _toPing = measures.toPing;
    _pinged = measures.pinged;
    _postModified = measures.postModified;
    _postModifiedGMT = measures.postModifiedGMT;
    _postContentFiltered = measures.postContentFiltered;
    _postParent = measures.postParent;
    _guid = measures.guid;
    _menuOrder = measures.menuOrder;
    _postType = measures.postType;
    _postMimeType = measures.postMimeType;
    _commentCount = measures.commentCount;
    _filter = measures.filter;
    _documents = measures.documents;
    _links = measures.links;
    notifyListeners();
  }
}
