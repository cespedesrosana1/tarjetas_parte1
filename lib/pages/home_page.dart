import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:tarjetas_parte1/pages/tarjeta_page.dart';

import '../data/tarjetas.dart';
import '../helpers/helpers.dart';
import '../widgets/total_pay_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagar'),
        leading: IconButton(
            //desactivar tarjeta
            // para actualizar desactivar la tarjeta
            icon: Icon(Icons.arrow_back),
            onPressed: () async {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () async {
                // mostrarLoading(context);
                // await Future.delayed(Duration(seconds: 1));
                // Navigator.pop(context);
                mostrarAlerta(context, 'Hola', 'Mundo');
              })
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            width: size.width,
            height: size.height,
            top: 200,
            child: PageView.builder(
                controller: PageController(viewportFraction: 0.9),
                physics: BouncingScrollPhysics(),
                itemCount: tarjetas.length,
                itemBuilder: (_, i) {
                  final tarjeta = tarjetas[i];

                  return GestureDetector(
                    onTap: () {
                      //Aca estamos tomando la tarjeta para verla
                      //Evento de seleccionar la tarjeta
                      Navigator.push(
                          context, navegarFadeIn(context, TarjetaPage()));
                    },
                    child: Hero(
                      tag: tarjeta.cardNumber,
                      child: CreditCardWidget(
                        cardNumber: tarjeta.cardNumberHidden,
                        expiryDate: tarjeta.expiracyDate,
                        cardHolderName: tarjeta.cardHolderName,
                        cvvCode: tarjeta.cvv,
                        showBackView: false,
                        onCreditCardWidgetChange: (tarjeta) {},
                      ),
                    ),
                  );
                }),
          ),
          Positioned(
            bottom: 0,
            child: TotalPayButton(),
          )
        ],
      ),
    );
  }
}
