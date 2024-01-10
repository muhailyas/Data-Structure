import 'dart:io';

class Node {
  int data;
  Node? next;
  Node(this.data);
}

class SinglyLinkedList {
  Node? head, tail;
  insertNode(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
    }
    tail = newNode;
  }

  deleteNode(int data) {
    if (data == head!.data) {}
  }

  display() {
    Node? current = head;
    if (head == null) return 'Linkedlist is empty';
    while (current != null) {
      stdout.write("${current.data} -> ");
      current = current.next;
    }
    stdout.write("NULL");
  }
}

void main() {
  final _singlyLinkedList = SinglyLinkedList();
  _singlyLinkedList.insertNode(10);
  _singlyLinkedList.insertNode(20);
  _singlyLinkedList.insertNode(30);
  _singlyLinkedList.insertNode(40);
  _singlyLinkedList.insertNode(50);
  _singlyLinkedList.display();
}
