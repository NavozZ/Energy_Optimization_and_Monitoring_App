import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTService {
  late MqttServerClient client;

  Future<void> connect() async {
    client = MqttServerClient('broker.hivemq.com', 'flutter_client');
    client.port = 1883;
    client.keepAlivePeriod = 20;
    client.onConnected = () => print('MQTT Connected');
    client.onDisconnected = () => print('MQTT Disconnected');
    client.logging(on: true);

    final connMess = MqttConnectMessage()
        .withClientIdentifier('flutter_client')
        .startClean()
        .withWillQos(MqttQos.atMostOnce);
    client.connectionMessage = connMess;

    try {
      await client.connect();
      client.subscribe('esp32/#', MqttQos.atMostOnce);
    } catch (e) {
      print('MQTT connection failed: $e');
      client.disconnect();
    }
  }

  void publish(String topic, String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, MqttQos.atMostOnce, builder.payload!);
  }

  Stream<List<MqttReceivedMessage<MqttMessage>>>? get updates => client.updates;
}
