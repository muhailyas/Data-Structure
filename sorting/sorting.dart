class SortingAlgorithm {
  List<int> list;
  SortingAlgorithm(this.list);

  // Selection sort algorithm implementation.
  void selectionSort() {
    // Iterate over the list
    for (int i = 0; i < list.length - 1; i++) {
      // Iterate over the unsorted portion of the list
      for (int j = i + 1; j < list.length; j++) {
        // If the current element is greater than the element at index j.
        // Swap the elements
        if (list[i] > list[j]) {
          int temp = list[i];
          list[i] = list[j];
          list[j] = temp;
        }
      }
    }
  }

  //Bubble sort algorithm implementation
  void bubbleSort() {
    // Iterate over the list
    for (int i = 0; i < list.length - 1; i++) {
      // Iterate over the unsorted portion of the list
      for (int j = 0; j < list.length - i - 1; j++) {
        // If the current element is greater than the next element,
        // swap the elements.
        if (list[j] > list[j + 1]) {
          int temp = list[j];
          list[j] = list[j + 1];
          list[j + 1] = temp;
        }
      }
    }
  }

  // Insertion sort algorithm implementation.
  void insertionSort() {
    // Iterate over the list starting from the second element.
    for (int i = 1; i < list.length; i++) {
      // store the current element and its index
      int current = list[i], j = i - 1;
      // Move elements of list[0...i-1], that are greater than the current element,
      // to one position ahead of their current position.
      while (j >= 0 && current < list[j]) {
        list[j + 1] = list[j];
        j -= 1;
      }
      // Place the current element at its correct position.
      list[j + 1] = current;
    }
  }

  List<int> mergeSort(List<int> array) {
    // Base case: if the array has 1 or fewer elements, it's already sorted
    if (array.length <= 1) {
      return array;
    }

    // Calculate the middle index
    int mid = array.length ~/ 2;

    // Split the array into two sub-arrays: array 1,array 2
    List<int> array1 = array.sublist(0, mid);
    List<int> array2 = array.sublist(mid);

    // Recursively sort both sub-arrays
    array1 = mergeSort(array1);
    array2 = mergeSort(array2);

    // Merge sorted sub-arrays and return the result
    return join(array1, array2);
  }

  List<int> join(List<int> array1, List<int> array2) {
    int i = 0, j = 0;
    List<int> array = [];

    // Merge the two sorted arrays into a single sorted array
    while (i < array1.length && j < array2.length) {
      if (array1[i] < array2[j]) {
        array.add(array1[i]);
        i++;
      } else {
        array.add(array2[j]);
        j++;
      }
    }

    // Append any remaining elements from array1
    while (i < array1.length) {
      array.add(array1[i]);
      i++;
    }

    // Append any remaining elements from array2
    while (j < array2.length) {
      array.add(array2[j]);
      j++;
    }

    // Return the merged and sorted array
    return array;
  }

  void quickSort(List<int> array, int low, int high) {
    if (low < high) {
      // Partition the array into two halves
      int pivotIndex = partition(array, low, high);

      // Recursively sort the two halves
      quickSort(array, low, pivotIndex - 1);
      quickSort(array, pivotIndex + 1, high);
    }
  }

  int partition(List<int> array, int low, int high) {
    // Choose the pivot element (usually the last element)
    int pivot = array[high];
    int i = low - 1; // Index of the smaller element

    for (int j = low; j < high; j++) {
      // If the current element is smaller than or equal to the pivot
      if (array[j] <= pivot) {
        i++;

        // Swap array[i] and array[j]
        int temp = array[i];
        array[i] = array[j];
        array[j] = temp;
      }
    }

    // Swap array[i+1] and array[high] (pivot)
    int temp = array[i + 1];
    array[i + 1] = array[high];
    array[high] = temp;

    return i + 1;
  }
}

void main() {
  List<int> list = [3, 1, 5, 6, 8, 5, 7, 4];
  final sort = SortingAlgorithm(list);
  sort.quickSort(list, 0, list.length - 1);
  print(sort.list);
}
