import 'dart:io';
import 'package:flutter/foundation.dart';

class Server {
  Future<void> initialize() async {
    //Get Free IP Address
    final ip = InternetAddress.anyIPv4;
    const port = 3000;
    //Initialize ServerSocket on ip / port
    final server = await ServerSocket.bind(ip, port);
    //Listen for incomming connections
    server.listen((Socket event) {
      //Inform the server that the client connected  
      _handleConnection(event);
    });
  }

  List<Socket> clients = <Socket>[];

  void _handleConnection(Socket client) {
    client.listen( //Listen for "write" information from the client
      (Uint8List data) {
        final message = String.fromCharCodes(data);

        for(final _client in clients) {
          _client.write("Server: $message joined");
        }

        clients.add(client);
        client.write("Server: Logged in as $message");
      },
      onDone: () { //Handle client closing connection
        debugPrint("Server: onDone");
        client.close();
      },
      onError: (error) { //Handle the error case
        debugPrint("Server: onError $error");
        client.close();
      }
    );
  }
}