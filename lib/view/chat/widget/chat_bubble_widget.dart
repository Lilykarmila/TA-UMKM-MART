import 'package:flutter/material.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';

class TChatBubble extends StatelessWidget {
  const TChatBubble({Key? key, this.text = '', this.isSender = false}) : super(key: key);

  final String text;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                  color: isSender ? TColors.accent : TColors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(isSender ? 12 : 0),
                    topRight: Radius.circular(isSender ? 0 : 12),
                    bottomLeft: const Radius.circular(12),
                    bottomRight: const Radius.circular(12),
                  )),
              child: Text(text),
            ),
          )
        ],
      ),
    );
  }
}
