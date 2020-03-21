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

import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/model/contact_model.dart';
import 'package:covid19mobile/resources/icons_svg.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/screens/contacts/components/contact_card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final List<ContactModel> _contacts = <ContactModel>[];

  @override
  Widget build(BuildContext context) {
    if (_contacts.isEmpty) {
      _initContacts();
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme:
            Theme.of(context).iconTheme.copyWith(color: Covid19Colors.darkGrey),
        title: Text(
          S.of(context).contactsPageTitle.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .display2
              .copyWith(color: Covid19Colors.darkGreyLight),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.all(12.0),
        child: ListView.builder(
            itemCount: _contacts.length,
            itemBuilder: (context, index) {
              var contact = _contacts[index];

              return ContactCard(
                contact: contact,
                onTap: _onContactTap,
              );
            }),
      ),
    );
  }

  _initContacts() {
    _contacts
      ..add(ContactModel(
          contactType: ContactType.phone,
          title: S.of(context).contactsPageSNSNumber,
          description: S.of(context).contactsPageSNSNumberText,
          icon: SvgIcons.phoneSvg))
      ..add(ContactModel(
          contactType: ContactType.phone,
          title: S.of(context).contactsPageSSNumber,
          description: S.of(context).contactsPageSSNumberText,
          icon: SvgIcons.phoneSvg))
      ..add(ContactModel(
          contactType: ContactType.phone,
          title: S.of(context).contactsPageMNENumber,
          description: S.of(context).contactsPageMNENumberText,
          icon: SvgIcons.phoneSvg))
      ..add(ContactModel(
          contactType: ContactType.link,
          title: S.of(context).contactsPageMSWeb,
          description: S.of(context).contactsPageMSWebText,
          icon: SvgIcons.linkSvg,
          textSize: 18))
      ..add(ContactModel(
          contactType: ContactType.email,
          title: S.of(context).contactsPageSNSEmail,
          description: S.of(context).contactsPageSNSEmailText,
          icon: SvgIcons.emailSvg,
          textSize: 18))
      ..add(ContactModel(
          contactType: ContactType.email,
          title: S.of(context).contactsPageMNEEmail,
          description: S.of(context).contactsPageMNEEmailText,
          icon: SvgIcons.emailSvg,
          textSize: 18));
  }

  _onContactTap(ContactModel contact) {
    print(contact.title);

    switch (contact.contactType) {
      case ContactType.phone:
        _launch("tel: ${contact.title}");
        break;
      case ContactType.link:
        _launch(contact.title);
        break;
      case ContactType.email:
        _launch("mailto: ${contact.title}");
        break;
    }
  }

  _launch(String url) async {
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
