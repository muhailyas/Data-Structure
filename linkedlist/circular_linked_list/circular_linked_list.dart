class Node {
  int data;
  Node? next;
  Node(this.data);
}

class CircularLinkedList {
  Node? head, tail;
  insertNode(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
    }
    newNode.next = head;
    tail = newNode;
  }

  display() {
    Node? current = head;
    while (current != null) {
      print(current.data);
      if (current.next == head) {
        break;
      }
      current = current.next;
    }
  }
}

void main() {
  CircularLinkedList cl = CircularLinkedList();
  cl.insertNode(10);
  cl.insertNode(20);
  cl.insertNode(30);
  cl.insertNode(40);
  cl.insertNode(50);
  cl.display();
}
