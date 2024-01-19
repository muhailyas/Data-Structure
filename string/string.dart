void main() {
  print(reverse('Ilyas'));
}

String reverse(String input) {
  String result = '';
  for (int i = input.length - 1; i >= 0; i--) {
    result += input[i];
  }
  return result;
}

