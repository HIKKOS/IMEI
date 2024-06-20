// ignore_for_file: constant_identifier_names

enum StatusPaquete {
  ENTREGADO,
  NO_ENTREGADO,
}

enum TipoEvidencia {
  CARGA,
}

Map<TipoEvidencia, String> nombresTipoEvidencia = {
  TipoEvidencia.CARGA: 'Carga',
};

enum EstadoViaje {
  INICIADO,
  FINALIZADO,
  PENDIENTE,
}
