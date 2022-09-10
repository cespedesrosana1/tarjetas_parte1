part of 'pagar_bloc.dart';

@immutable
abstract class PagarState {
  final double montoPagar;
  final String moneda;
  final bool tarjetaActiva;
  final TarjetaCredito? tarjeta;

  const PagarState({
    this.montoPagar = 380,
    this.moneda = 'USd',
    this.tarjetaActiva = false,
    this.tarjeta,
  });
}

class PagarInitial extends PagarState {}
