enum StatusPedido { pendente, processando, enviado, entregue }

void main() {
  var status = StatusPedido.pendente;

  switch (status) {
    case StatusPedido.pendente:
      print("Aguardando pagamento.");
      break;
    case StatusPedido.processando:
      print("Estamos preparando seu pacote.");
      break;
    case StatusPedido.enviado:
      print("Saiu para entrega.");
      break;
    case StatusPedido.entregue:
      print("Pedido concluído!");
      break;
  }
}
