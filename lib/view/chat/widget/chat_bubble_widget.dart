// import 'package:flutter/material.dart';
// import 'package:ta_ecommerce/utils/constans/colors.dart';
//
// class TChatBubble extends StatelessWidget {
//   const TChatBubble({Key? key, this.text = '', this.isSender = false}) : super(key: key);
//
//   final String text;
//   final bool isSender;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       margin: EdgeInsets.only(top: 20, left: 20, right: 20),
//       child: Row(
//         mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
//         children: [
//           Flexible(
//             child: Container(
//               constraints: BoxConstraints(
//                 maxWidth: MediaQuery.of(context).size.width * 0.7,
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               decoration: BoxDecoration(
//                   color: isSender ? TColors.accent : TColors.grey,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(isSender ? 12 : 0),
//                     topRight: Radius.circular(isSender ? 0 : 12),
//                     bottomLeft: Radius.circular(12),
//                     bottomRight: Radius.circular(12),
//                   )),
//               child: Text(text),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
///
import 'package:flutter/material.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class TChatBubble extends StatelessWidget {
  const TChatBubble({Key? key, this.text = '', this.isSender = false, required this.timestamp}) : super(key: key);

  final String text;
  final bool isSender;
  final Timestamp timestamp; // Tambahkan field ini

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                      color: isSender ? TColors.accent : TColors.grey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(isSender ? 12 : 0),
                        topRight: Radius.circular(isSender ? 0 : 12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      )),
                  child: Text(text),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, right: isSender ? 20 : 0, left: isSender ? 0 : 20),
            child: Text(
              DateFormat('hh:mm a').format(timestamp.toDate()), // Format waktu
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
