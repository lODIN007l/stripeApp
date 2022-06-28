import 'package:flutter/material.dart';
import 'package:flutter_credit_card_new/flutter_credit_card.dart';

import '../models/tarjeta_credito.dart';
import '../widget/total_pay_button.dart';

class Tarjeta_Page extends StatelessWidget {
  const Tarjeta_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tarjeta = TarjetaCredito(
        cardNumberHidden: '4242',
        cardNumber: '4242424242424242',
        brand: 'visa',
        cvv: '213',
        expiracyDate: '01/25',
        cardHolderName: 'Wilson Armando');

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Pagar')),
      ),
      body: Stack(
        children: [
          Container(),
          Positioned(
            top: 25,
            left: 25,
            width: size.width,
            height: size.height,
            child: Hero(
              tag: tarjeta.cardNumber,
              child: CreditCardWidget(
                  width: size.width * 0.91,
                  cardNumber: tarjeta.cardNumber,
                  expiryDate: tarjeta.expiracyDate,
                  cardHolderName: tarjeta.cardHolderName,
                  isHolderNameVisible: true,
                  cvvCode: tarjeta.cvv,
                  showBackView: false,
                  onCreditCardWidgetChange: (brand) => tarjeta.brand),
            ),
          ),
          const Positioned(
            bottom: 0,
            child: TotalPayButton(),
          ),
        ],
      ),
    );
  }
}
