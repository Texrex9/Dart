void main() {
  int? statusSemaforo; // 0: vermelho, 1: amarelo, 2: verde
  statusSemaforo = 1;
  print(switch (statusSemaforo) {
    0 => 'Colors.red',
    1 => 'Colors.yellow',
    2 => 'Colors.green',
    _ => 'Colors.grey',
  });
  print(switch (statusSemaforo) {
    0 => 'Pare',
    1 => 'Atenção',
    2 => 'Siga',
    _ => 'Semáforo desligado',
  });
}
