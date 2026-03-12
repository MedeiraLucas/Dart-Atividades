import 'dart:io';
import 'dart:convert';

void main() async {
  final int portaServidor = 3000;

  try {
    
    final socket = await Socket.connect(InternetAddress.loopbackIPv4, portaServidor);
    
    print('🔗 Conectado ao chat!');
    print('Sua porta de comunicação única é: ${socket.port}');
    print('Digite suas mensagens e pressione Enter para enviar:\n');

    
    socket.cast<List<int>>().transform(utf8.decoder).listen(
      (String data) {
        print('\n$data');
      },
      onDone: () {
        print('\nO servidor encerrou a conexão.');
        exit(0);
      },
    );

    
    stdin.transform(utf8.decoder).listen((String input) {
      if (input.trim().isNotEmpty) {
        socket.write(input);
      }
    });

  } catch (e) {
    print('Erro ao conectar. Verifique se o servidor está rodando na porta $portaServidor.');
  }
}