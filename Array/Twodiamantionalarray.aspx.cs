using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Array_Twodiamantionalarray : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PrintArray();
    }
    protected void PrintArray()
    {
        int[,] array = {
        { 10, 20, 30 },
        { 40, 50, 60 },
        { 70, 80, 90 },
        {100,200,300 }
    };
        for (int i = 0; i < 4; i++)
        {
            for (int j = 0; j < 3; j++)
            {
                Response.Write(array[i, j] + " ");
            }
            Response.Write("<br>");
        }
    }
    protected void TwodiamantionalArray( int row,int column)
    {
        int[,] numbers = {
        { 10, 20, 30 },
        { 40, 50, 60 },
        { 70, 80, 90 }
    };
        int value = numbers[row, column];

        ValueLabel.Text = "The value at row :"+row + " column :" + column + " is : " + value;
    }
    protected void MultiArray()
    {
        // Assume that you have a multi-dimensional array named "myArray"
        // that contains integer values.
        int[,] myArray = {
        { 10, 20, 30 },
        { 40, 50, 60 },
        { 70, 80, 90 }
    };
        int userValue =Convert.ToInt32( txtrow.Text); /* get user input */ 

        int rowCount = myArray.GetLength(0); // Get the number of rows
        int colCount = myArray.GetLength(1); // Get the number of columns

        for (int i = 0; i < rowCount; i++)
        {
            for (int j = 0; j < colCount; j++)
            {
                if (myArray[i, j] == userValue)
                {
                    // The user-given value is found in the array.
                    // Do something here, such as displaying a message.
                    Response.Write("The value " + userValue + " is found in the array.");
                    return;
                }
            }
        }
       
        // The user-given value is not found in the array.
        // Do something here, such as displaying an error message.
        Response.Write("The value " + userValue + " is not found in the array.");

    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        //TwodiamantionalArray(Convert.ToInt32(txtrow.Text), Convert.ToInt32( txtcolumn.Text));
        MultiArray();
    }
    
}