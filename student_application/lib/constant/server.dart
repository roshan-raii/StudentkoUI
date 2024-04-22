class ServerUrl {
  static String ipOnly = "192.168.1.72";
  static String ipaddress() {
    return "http://$ipOnly:8000/";
  }

  static String websocketIp() {
    return "ws://$ipOnly:8000";
  }
}
