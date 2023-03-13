import 'package:test/test.dart';

class Node {
  int value;
  Node? next;

  Node(this.value, [this.next]);
}

class Stack {
  Node? _top;

  void push(int value) {
    Node newNode = Node(value);
    newNode.next = _top;
    _top = newNode;
  }

  int pop() {
    if (_top == null) {
      throw Exception('Stack is empty');
    }
    int poppedValue = _top?.value ?? -1;
    _top = _top?.next;
    return poppedValue;
  }

  int peek() {
    if (_top == null) {
      throw Exception('Stack is empty');
    }
    return _top?.value ?? -1;
  }

  bool isEmpty() {
    return _top == null;
  }

  void sort([bool reverse = false]) {
    Stack tempStack = Stack();

    while (!isEmpty()) {
      int temp = pop();

      while (
        !tempStack.isEmpty() &&
        (
          (reverse && tempStack.peek() > temp) ||
          (!reverse && tempStack.peek() < temp)
        )
      ) {
        push(tempStack.pop());
      }

      tempStack.push(temp);
    }

    _top = tempStack._top;
  }
}

void main() {
  group('Stack tests', () {
    late Stack stack;

    setUp(() {
      stack = Stack();
    });

    test('push adds an element to the top of the stack', () {
      stack.push(1);
      stack.push(2);
      stack.push(3);

      expect(stack.peek(), equals(3));
    });

    test('pop removes and returns the top element from the stack', () {
      stack.push(1);
      stack.push(2);
      stack.push(3);

      expect(stack.pop(), equals(3));
      expect(stack.pop(), equals(2));
      expect(stack.pop(), equals(1));
    });

    test('pop throws an exception when stack is empty', () {
      expect(() => stack.pop(), throwsException);
    });

    test('peek returns the top element without removing it', () {
      stack.push(1);
      stack.push(2);
      stack.push(3);

      expect(stack.peek(), equals(3));
      expect(stack.peek(), equals(3));
    });

    test('isEmpty returns true when stack is empty', () {
      expect(stack.isEmpty(), isTrue);
    });

    test('isEmpty returns false when stack is not empty', () {
      stack.push(1);

      expect(stack.isEmpty(), isFalse);
    });

    test('reverse sort stack', () {
      stack.push(5);
      stack.push(1);
      stack.push(7);
      stack.push(3);
      stack.sort(true);
      expect(stack.pop(), equals(7));
      expect(stack.pop(), equals(5));
      expect(stack.pop(), equals(3));
      expect(stack.pop(), equals(1));
    });

    test('sort stack', () {
      stack.push(5);
      stack.push(1);
      stack.push(7);
      stack.push(3);
      stack.sort();
      expect(stack.pop(), equals(1));
      expect(stack.pop(), equals(3));
      expect(stack.pop(), equals(5));
      expect(stack.pop(), equals(7));
    });
  });
}
