import 'package:flutter/material.dart';

import 'package:flutter_credit_card_new/credit_card_widget.dart';
import 'package:pagos_app/data/list_tarjeta_credito.dart';
import 'package:pagos_app/helpers/alertas.dart';
import 'package:pagos_app/helpers/navegar_fadeIn.dart';
import 'package:pagos_app/pages/tarjeta_page.dart';
import 'package:pagos_app/widget/total_pay_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Pagar')),
          actions: [
            IconButton(
              onPressed: () async {
                mostrarDialogo(context);
                await Future.delayed(
                  const Duration(seconds: 1),
                );
                Navigator.pop(context);
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              top: 200,
              left: 25,
              width: size.width,
              height: size.height,
              child: PageView.builder(itemBuilder: (_, index) {
                final tarjeta = tarjetas[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, navegarFadeIn(context, const Tarjeta_Page()));
                    // print(tarjeta.cardHolderName);
                  },
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
                );
              }),
            ),
            const Positioned(
              bottom: 0,
              child: TotalPayButton(),
            ),
          ],
        ));
  }
}
