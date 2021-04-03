import 'package:flutter/material.dart';

import 'bottom_bar_column.dart';
import 'info_text.dart';
import 'responsive.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: Colors.blueGrey[900],
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'Quienes Somos',
                      s1: 'Contact Us',
                      s2: 'About Us',
                      s3: 'Careers',
                    ),
                    BottomBarColumn(
                      heading: 'Ayuda',
                      s1: 'Payment',
                      s2: 'Cancellation',
                      s3: 'FAQ',
                    ),
                    BottomBarColumn(
                      heading: 'Redes Sociales',
                      s1: 'Twitter',
                      s2: 'Facebook',
                      s3: 'YouTube',
                    ),
                  ],
                ),
                Divider(
                  color: Colors.blueGrey,
                ),
                SizedBox(height: 20),
                InfoText(
                  type: 'Email',
                  text: 'explore@gmail.com',
                ),
                SizedBox(height: 5),
                InfoText(
                  type: 'Desarrollado por',
                  text: 'Leonel Garcia, Carlos Mrtz, Isai Perez',
                ),
                SizedBox(height: 20),
                Divider(
                  color: Colors.blueGrey,
                ),
                SizedBox(height: 20),
                Text(
                  'Copyright © 2021 | Bicloud.click',
                  style: TextStyle(
                    color: Colors.blueGrey.shade300,
                    fontSize: 14,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'Quienes Somos',
                      s1: 'Contact Us',
                      s2: 'About Us',
                      s3: 'Careers',
                    ),
                    BottomBarColumn(
                      heading: 'Ayuda',
                      s1: '',
                      s2: 'Cancellation',
                      s3: 'FAQ',
                    ),
                    BottomBarColumn(
                      heading: 'Redes Sociales',
                      s1: 'Twitter',
                      s2: 'Facebook',
                      s3: 'YouTube',
                    ),
                    Container(
                      color: Colors.blueGrey,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoText(
                          type: 'Email',
                          text: 'gap.len@gmail.com',
                        ),
                        SizedBox(height: 5),
                        InfoText(
                          type: 'Desarrollado por',
                          text: 'Leonel Garcia, Carlos Alberto, Isai Perez',
                        )
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Colors.blueGrey,
                ),
                SizedBox(height: 20),
                Text(
                  'Copyright © 2020 | Bicloud.click',
                  style: TextStyle(
                    color: Colors.blueGrey.shade300,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
    );
  }
}
