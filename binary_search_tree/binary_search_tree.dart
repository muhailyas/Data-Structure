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
    inOrder(root.right);
    stdout.write("${root.value} ");
  }

  // delete node
  void remover(int value) {
    _removerHelper(value, null, root);
  }

  void _removerHelper(int target, Node? parentNode, Node? currentNode) {
    while (currentNode != null) {
      if (target < currentNode.value) {
        parentNode = currentNode;
        currentNode = currentNode.left;
      } else if (target > currentNode.value) {
        parentNode = currentNode;
        currentNode = currentNode.right;
      } else {
        if (currentNode.left == null && currentNode.right == null) {
          //finds the node
          if (parentNode == null) {
            root = null;
            return;
          } else if (parentNode.left == currentNode) {
            parentNode.left = null;
            return;
          } else if (parentNode.right == currentNode) {
            parentNode.right = null;
            return;
          }
        } else if (currentNode.right == null) {
          //when node have only left child
          currentNode.value = _findLargest(currentNode.left);
          _removerHelper(currentNode.value, currentNode, currentNode.left);
        } else {
          //if(currentNode.left == null) && current have left and right child
          currentNode.value = _findSmallest(currentNode.right);
          _removerHelper(currentNode.value, currentNode, currentNode.right);
        }
      }
    }
    return;
  }

  //find smallest node in a bst
  int _findSmallest(Node? currentNode) {
    if (currentNode?.left == null)
      return currentNode!.value;
    else
      return _findSmallest(currentNode!.left);
  }

  //find largest in a bst
  int _findLargest(Node? currentNode) {
    if (currentNode?.right == null)
      return currentNode!.value;
    else
      return _findLargest(currentNode!.right);
  }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();
  List<int> list = [25, 20, 30, 18, 24, 27, 35];
  for (var element in list) {
    bst.insert(element);
  }
  bst.inOrder(bst.root);
}
