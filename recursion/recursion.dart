void main() {
  List<int> list = [1, 2, 3, 4, 5, 6, 7];
  print(binarySearchUsingRecursion(list, 100, 0, list.length - 1));
  print(factorial(5));
}

int binarySearchUsingRecursion(
    List<int> nums, int target, int left, int right) {
  if (left > right) {
    return -1;
  }
  int mid = left + ((right - left) ~/ 2);
  if (nums[mid] == target) {
    return mid;
  } else if (nums[mid] < target) {
    return binarySearchUsingRecursion(nums, target, mid + 1, right);
  } else {
    return binarySearchUsingRecursion(nums, target, left, mid - 1);
  }
}

int factorial(int n) {
  if (n == 1) {
    return n;
  }
  return n * factorial(n - 1);
}

