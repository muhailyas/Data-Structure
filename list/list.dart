void main() {
  List<int> list = [1, 23, 4, 6, 2, 4, 5, 67, 64];
  List<int> list1 = [1, 2, 3, 4, 5, 6, 7];
  print(linearSearch(list, 100));
  print(binarySearch(list1, 100));
}

String linearSearch(List<int> nums, int target) {
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] == target) {
      return "Target found position at $i";
    }
  }
  return 'Target not found';
}

int binarySearch(List<int> nums, int target) {
  int left = 0;
  int right = nums.length - 1;
  while (left <= right) {
    int mid = left + ((right - left) ~/ 2);
    if (nums[mid] == target) {
      return mid;
    } else if (nums[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return -1;
}
