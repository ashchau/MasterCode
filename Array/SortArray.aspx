<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SortArray.aspx.cs" Inherits="Array_SortArray" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Array Sort</title>
    <script src="../Scripts/jquery-3.5.1.js"></script>
    <style>
        label {
            color: red;
        }
    </style>
    <script>
        $(document).ready(function () {
            //Bubble sort
            var numbers = [12, 10, 15, 11, 14, 13, 16];
            bubbleSort(numbers);
            document.getElementById('lblarraybubblesort').innerHTML = numbers;
            bubbleSort2(numbers);
             document.getElementById('lblarraybubblesort2').innerHTML = numbers;
            //Selection sort
            var arrselectionsort = [5, 2, 7, 1, 0];
            selectionSort(arrselectionsort);
            document.getElementById('lblarrayselctionsort').innerHTML = arrselectionsort;
            //Insertion sort  
            arrInsertionsort = [5, 2, 7, 1, 0];
            insertionSort(arrInsertionsort);
            document.getElementById('lblarrayinsertionsort').innerHTML = arrselectionsort;
        })
        //Bubble sort
        function bubbleSort(array) {
            var done = false;
            while (!done) {
                done = true;
                for (var i = 1; i < array.length; i += 1) {  //i++ is also work
                    if (array[i - 1] > array[i]) {
                        done = false;
                        var tmp = array[i - 1];
                        array[i - 1] = array[i];
                        array[i] = tmp;
                    }
                }
            }

            return array;
        }
        function bubbleSort2(arr) {
            for (let i = 0; i < arr.length - 1; i++) {

                let swapped = false

                for (let j = 0; j < arr.length - i - 1; j++) {
                    //swapping the elements
                    if (arr[j] > arr[j + 1]) {
                        let temp = arr[j]
                        arr[j] = arr[j + 1]
                        arr[j + 1] = temp
                        swapped = true
                    }
                }

                //if no elements are swapped
                //that means our array is sorted
                if (!swapped) break;
            }

            return arr
        }
        //Selection sort
        function selectionSort(arr) {

            for (let i = 0; i < arr.length - 1; i++) {

                // Finding the minimum element
                let minIndex = i;
                for (let j = i + 1; j < arr.length; j++) {
                    if (arr[j] < arr[minIndex]) minIndex = j;
                }

                // Swapping the minimum element with the first element
                let temp = arr[minIndex]
                arr[minIndex] = arr[i]
                arr[i] = temp
            }

            return arr
        }
        //Insertion sort
        arr = [5, 2, 7, 1, 0];

        function insertionSort(arr) {

            for (let i = 1; i < arr.length; i++) {
                let key = arr[i];
                let j = i - 1;

                // Moving elements of arr[0..i-1], that are  
                // greater than key, to one position ahead  
                while (j >= 0 && arr[j] > key) {
                    arr[j + 1] = arr[j];
                    j = j - 1;
                }

                arr[j + 1] = key;

            }

            return arr

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            [12, 10, 15, 11, 14, 13, 16] Bubble Sort  :
            <label id="lblarraybubblesort"></label>
            <br />
             [12, 10, 15, 11, 14, 13, 16] Bubble Sort2  :
            <label id="lblarraybubblesort2"></label>
            <br />
            [5, 2, 7, 1, 0] Selection Sort : 
            <label id="lblarrayselctionsort"></label>
            <br />
            [5, 2, 7, 1, 0] Insertion Sort :  
            <label id="lblarrayinsertionsort"></label>
        </div>
    </form>
</body>
</html>
