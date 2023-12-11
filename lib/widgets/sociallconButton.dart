
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconButtons extends StatefulWidget {

  const SocialIconButtons();

  @override
  _SocialIconButtonsState createState() => _SocialIconButtonsState();
}

class _SocialIconButtonsState extends State<SocialIconButtons> {
  // ignore: unused_field
  late Future<void> _launched;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            socialIconButton(
              icon: FontAwesomeIcons.instagram,
              url: 'https://l.messenger.com/l.php?u=https%3A%2F%2Finstagram.com%2Fmahdiibrahim691%3Figshid%3DNGVhN2U2NjQ0Yg%253D%253D%26utm_source%3Dqr&h=AT2QUww_wpkDPbyqPec_6Zm95AClIfDWhO_Z1FfiV5HMlyuiuVVb3HgYXCzIftj0MvpTMpMdYyG357eNEN21Vx6J8pkXy5yxfni8yfLAcdKzKtMBDcEnRxiSPAXGZJJGL8DrQDrMFV4',

            ),
            socialIconButton(
                icon: FontAwesomeIcons.youtube,
                url: 'https://l.messenger.com/l.php?u=https%3A%2F%2Fyoutube.com%2F%40chef_Mehdi53%3Fsi%3DgklcuEJwqLD2SMrK&h=AT2QUww_wpkDPbyqPec_6Zm95AClIfDWhO_Z1FfiV5HMlyuiuVVb3HgYXCzIftj0MvpTMpMdYyG357eNEN21Vx6J8pkXy5yxfni8yfLAcdKzKtMBDcEnRxiSPAXGZJJGL8DrQDrMFV4',
                ),
            socialIconButton(
                icon: FontAwesomeIcons.tiktok,
                url: 'https://l.messenger.com/l.php?u=https%3A%2F%2Fwww.tiktok.com%2F%40chefmehdi2%3F_t%3D8hXsZ1lhmXI%26_r%3D1&h=AT2QUww_wpkDPbyqPec_6Zm95AClIfDWhO_Z1FfiV5HMlyuiuVVb3HgYXCzIftj0MvpTMpMdYyG357eNEN21Vx6J8pkXy5yxfni8yfLAcdKzKtMBDcEnRxiSPAXGZJJGL8DrQDrMFV4',
                ),
         //   socialIconButton(
          //      icon: FontAwesomeIcons.globe,
         //       url: 'https://www.google.com', ),
          ],
        ),
      ),
    );
  }

  IconButton socialIconButton({icon, url}) {
    return IconButton(
        icon: Icon(icon,color: Colors.black,),
        onPressed: () {
          setState(() {
            _launched = _launchInBrowser(
              url: url,

            );
          });
        });
  }

  Future<bool> _launchInBrowser({required String url}) async {
    try {
      await launch(
        url,
        forceWebView: true,
        forceSafariVC: true,
        enableJavaScript: true,

      );
      return true;
    } catch (e) {
      log(e.toString() as num);
      return false;
    }
  }

}


