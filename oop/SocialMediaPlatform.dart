import 'package:test/test.dart';

class SocialMediaPlatform {
  final Map<String, List<String>> _users = {};
  final Map<String, List<Map<String, dynamic>>> _posts = {};

  void addUser(String username) {
    _users.putIfAbsent(username, () => []);
    _posts.putIfAbsent(username, () => []);
  }

  List<String> getUsers() {
    return _users.keys.toList();
  }

  void post(String username, String message) {
    _posts[username]?.add({
      'message': message,
      'likes': 0,
      'comments': [],
    });
  }

  List<String> getPosts(String username) {
    if (_posts.containsKey(username)){
      return (_posts[username] ?? []).map((post) => post['message'].toString()).toList();
    }
    return [];
  }

  void follow(String follower, String followee) {
    _users.putIfAbsent(follower, () => []);
    _users[follower]?.add(followee);
  }

  List<String> getFollowers(String username) {
    return _users.entries.where((entry) => entry.value.contains(username)).map((entry) => entry.key).toList();
  }

  void like(String username, int postIndex) {
    _posts[username]?[postIndex]?['likes']++;
  }

  int getLikes(String username, int postIndex) {
    return _posts[username]?[postIndex]?['likes'];
  }

  void comment(String username, int postIndex, String comment) {
    _posts[username]?[postIndex]?['comments']?.add(comment);
  }

  List<String> getComments(String username, int postIndex) {
    List<String> comments = [];
    try {
      comments = _posts[username]?[postIndex]?['comments'].cast<String>();
    } catch (e) {
      print(e);
    }
    return comments;
  }

  List<Map<String, String>> getFeed(String username) {
    List<String> followees = (_users[username] ?? []);
    followees.add(username);
    List<Map<String, String>> feed = [];
    for (String followee in followees) {
      feed.addAll(_posts[followee]?.map((post) => {
        'user': followee,
        'post': post['message'],
      }) ?? {});
    }
    feed.sort((a, b) => b['post']?.compareTo(a['post'] ?? "") ?? 0);
    return feed;
  }
}

void main() {
  group('Social Media Platform Tests', () {
    late SocialMediaPlatform platform;

    setUp(() {
      platform = SocialMediaPlatform();
    });

    test('Add User Test', () {
      platform.addUser('Zokis');
      expect(platform.getUsers(), ['Zokis']);
    });

    test('Post Message Test', () {
      platform.addUser('Zokis');
      platform.post('Zokis', 'Hello Dart!');
      expect(platform.getPosts('Zokis'), ['Hello Dart!']);
    });

    test('Follow User Test', () {
      platform.addUser('Zokis');
      platform.addUser('Ana');
      platform.follow('Zokis', 'Ana');
      expect(platform.getFollowers('Ana'), ['Zokis']);
    });

    test('Like Post Test', () {
      platform.addUser('Zokis');
      platform.post('Zokis', 'Hello Dart!');
      platform.like('Zokis', 0);
      expect(platform.getLikes('Zokis', 0), 1);
    });

    test('Comment Post Test', () {
      platform.addUser('Zokis');
      platform.post('Zokis', 'Hello Dart!');
      platform.comment('Zokis', 0, 'Nice post!');
      expect(platform.getComments('Zokis', 0), ['Nice post!']);
    });

    test('Display User Feed Test', () {
      platform.addUser('Zokis');
      platform.addUser('Ana');
      platform.post('Zokis', 'Hello Dart!');
      platform.follow('Ana', 'Zokis');
      expect(platform.getFeed('Ana'), [{'user': 'Zokis', 'post': 'Hello Dart!'}]);
    });
  });
}