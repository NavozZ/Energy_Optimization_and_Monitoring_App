import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTService {
  late MqttServerClient client;

  Future<void> connect() async {
    client = MqttServerClient('broker.hivemq.com',
        'flutter_client_${DateTime.now().millisecondsSinceEpoch}');
    client.port = 1883;
    client.keepAlivePeriod = 20;
    client.logging(on: true);
    client.onConnected = () => print('MQTT Connected');
    client.onDisconnected = () => print('MQTT Disconnected');

    final connMess = MqttConnectMessage()
        .withClientIdentifier(client.clientIdentifier)
        .startClean()
        .withWillQos(MqttQos.atMostOnce);

    client.connectionMessage = connMess;

    try {
      await client.connect();
      if (client.connectionStatus?.state != MqttConnectionState.connected) {
        throw Exception('MQTT connection failed: ${client.connectionStatus}');
      }
    } catch (e) {
      print('MQTT connection failed: $e');
      client.disconnect();
      rethrow; // So caller knows connection failed
    }
  }

  void publish(String topic, String message) {
    if (client.connectionStatus?.state != MqttConnectionState.connected) {
      throw Exception('MQTT client not connected');
    }
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, MqttQos.atMostOnce, builder.payload!);
  }
}
