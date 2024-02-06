import 'dart:io';

class Node {
  int value;
  Node? left, right;
  Node(this.value);
}

class BinarySearchTree {
  Node? root;
  insert(int value) {
    final newNode = Node(value);
    if (root == null) {
      root = newNode;
    } else {
      Node? current = root;
      while (true) {
        if (value < current!.value) {
          if (current.left == null) {
            current.left = newNode;
            break;
          } else {
            current = current.left;
          }
        } else {
          if (current.right == null) {
            current.right = newNode;
            break;
          } else {
            current = current.right;
          }
        }
      }
    }
  }

  inOrder(Node? root) {
    if (root == null) {
      return;
    }
    inOrder(root.left);
    stdout.write("${root.value} ");
    inOrder(root.right);
  }

  preOrder(Node? root) {
    if (root == null) {
      return;
    }
    stdout.write("${root.value} ");
    preOrder(root.left);
    preOrder(root.right);
  }

  postOrder(Node? root) {
    if (root == null) {
      return;
    }
    preOrder(root.left);
    preOrder(root.right);
    stdout.write("${root.value} ");
  }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();
  List<int> list = [25, 20, 30, 18, 24, 27, 35];
  for (var element in list) {
    bst.insert(element);
  }
  print("InOrder----------");
  bst.inOrder(bst.root);
  print("\nPreOrder----------");
  bst.preOrder(bst.root);
  print("\nPostOrder----------");
  bst.postOrder(bst.root);
}
