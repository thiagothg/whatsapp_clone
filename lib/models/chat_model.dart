class ChatModel {
  String name;
  bool isGroup;
  String time;
  String currentMessage;
  String icon;

  ChatModel(
      {required this.name,
      required this.isGroup,
      required this.time,
      required this.currentMessage,
      required this.icon});

  static List<ChatModel> listChats() => [
        ChatModel(
            name: 'Dev Stack',
            isGroup: false,
            time: '4:00',
            currentMessage: 'Hello Mate',
            icon: ''),
        ChatModel(
            name: 'Kick',
            isGroup: true,
            time: '14:00',
            currentMessage: 'Hello Mate',
            icon: ''),
        ChatModel(
            name: 'Dev server chat',
            isGroup: false,
            time: '20:00',
            currentMessage: 'Hello everyone',
            icon: ''),
        ChatModel(
            name: 'balam friends',
            isGroup: true,
            time: '20:00',
            currentMessage: 'Hello everyone',
            icon: ''),
      ];
}
