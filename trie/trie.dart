class TrieNode {
  Map<String, TrieNode>? children;
  bool? isEndOfWord;
  TrieNode() {
    children = {};
    isEndOfWord = false;
  }
}

class Trie {
  TrieNode? root;
  Trie() {
    root = TrieNode();
  }
  insertWord(String word) {
    TrieNode? current = root;
    for (var char in word.split('')) {
      if (!current!.children!.containsKey(char)) {
        current.children![char] = TrieNode();
      }
      current = current.children![char];
    }
    current!.isEndOfWord = true;
  }

  bool searchWord(String word) {
    TrieNode? current = root;
    for (var char in word.split('')) {
      if (!current!.children!.containsKey(char)) {
        return false;
      }
      current = current.children![char];
    }
    return current!.isEndOfWord!;
  }

  void display() {
    List<String> words = [];
    _displayHelper(root, "", words);
    print(words);
  }

  void _displayHelper(TrieNode? node, String word, List<String> words) {
    if (node!.isEndOfWord!) {
      words.add(word);
    }

    node.children!.forEach((key, value) {
      _displayHelper(value, word + key, words);
    });
  }
}

void main() {
  Trie trie = Trie();
  trie.insertWord('Ilyas');
  trie.display();
  print(trie.searchWord('Ilyas'));
}
