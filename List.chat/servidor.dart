import 'dart:io';
import 'dart:convert';

void main() async {
  // O servidor escutará na porta 3000
  final int porta = 3000;
  final server = await ServerSocket.bind(InternetAddress.loopbackIPv4, porta);

  print('🚀 Servidor de Chat iniciado na porta $porta.');
  print('Aguardando conexões...\n');

  List<Socket> clientes = [];

  
  server.listen((Socket cliente) {
    print('✅ Novo cliente conectado: Porta local do cliente é ${cliente.remotePort}');
    clientes.add(cliente);

    
    cliente.cast<List<int>>().transform(utf8.decoder).listen(
      (String data) {
        final mensagem = data.trim();
        if (mensagem.isEmpty) return;

        print('Recebido do cliente ${cliente.remotePort}: $mensagem');

        
        for (var c in clientes) {
          if (c != cliente) {
            c.write(' Cliente ${cliente.remotePort} diz: $mensagem');
          }
        }
      },
      onDone: () {
        print(' Cliente ${cliente.remotePort} desconectou.');
        clientes.remove(cliente);
        cliente.destroy();
      },
      onError: (error) {
        print('Erro com o cliente ${cliente.remotePort}: $error');
        clientes.remove(cliente);
        cliente.destroy();
      },
    );
  });
}