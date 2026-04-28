void main() {
  int codigoStatus = 2;
  String mensagem = switch (codigoStatus) {
    1 => "Pedido realizado",
    2 => "Pagamento Confirmado",
    3 => "Enviado",
    _ => "Status desconhecido",
  };
  print(mensagem);
}
