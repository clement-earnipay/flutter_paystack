import 'package:flutter/material.dart';
import 'package:flutter_paystack/src/models/card.dart';
import 'package:flutter_paystack/src/widgets/base_widget.dart';
import 'package:flutter_paystack/src/widgets/buttons.dart';
import 'package:flutter_paystack/src/widgets/custom_dialog.dart';
import 'package:flutter_paystack/src/widgets/input/card_input.dart';

class CardInputWidget extends StatefulWidget {
  final PaymentCard? card;

  CardInputWidget(this.card);

  @override
  _CardInputWidgetState createState() {
    return new _CardInputWidgetState();
  }
}

class _CardInputWidgetState extends BaseState<CardInputWidget> {
  @override
  void initState() {
    super.initState();
    confirmationMessage = 'Do you want to cancel card input?';
  }

  @override
  Widget buildChild(BuildContext context) {
    return new CustomAlertDialog(
      title: new Text(
        'Add a New Card',
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
      ),
      titlePadding: EdgeInsets.all(12),
      fullscreen: false,
      content: new SingleChildScrollView(
        child: new Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          alignment: Alignment.center,
          child: new Column(
            children: <Widget>[
              new Text(
                'Please provide valid card details. You will be charged a one-time fee of N50.',
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              new SizedBox(
                height: 24.0,
              ),
              new CardInput(
                buttonText: 'Continue',
                card: widget.card,
                onValidated: _onCardValidated,
                buttonColor: Color(0xFF00535C),
              ),
              new SizedBox(
                height: 12.0,
              ),
              new WhiteButton(
                onPressed: onCancelPress,
                text: 'Cancel',
                flat: true,
                bold: true,
                textColor: Color(0xFFEF4444),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onCardValidated(PaymentCard? card) {
    Navigator.pop(context, card);
  }
}
