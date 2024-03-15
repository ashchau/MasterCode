using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class SalaryConvertIntoWord_ConvertNumberToword : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    string constr;
    protected void Page_Load(object sender, EventArgs e)
    {
        constr = ConfigurationManager.ConnectionStrings["Con"].ToString();
        con = new SqlConnection(constr);
        //https://www.aspdotnet-suresh.com/2014/08/aspnet-convert-numbers-to-words-string-in-csharp.html
        //https://www.aspsnippets.com/questions/118917/Convert-amount-into-words-Dollars-and-cents-in-ASPNet/
        //lbltime.Text = DateTime.Now.ToString("MMMMMMMMMMMMMMMMMMMM"); /*+ "'" + DateTime.Now.Year;*/
        lbltime.Text = DateTime.Now.ToString("MMMM");//output- june
        if(!IsPostBack)
        {
            bindgrid();
        }
        CheckFile();
    }

    protected void btnClick_Click(object sender, EventArgs e)
    {
        string word = ConvertNumbertoWords(Convert.ToInt32(txtnumber.Text));
        lblmsg.InnerText = word;
    }
    public static string ConvertNumbertoWords(int number)
    {
        if (number == 0)
            return "ZERO";
        if (number < 0)
            return "minus " + ConvertNumbertoWords(Math.Abs(number));
        string words = "";
        if ((number / 1000000) > 0)
        {
            words += ConvertNumbertoWords(number / 1000000) + " MILLION ";//LAKH
            number %= 1000000;
        }
        if ((number / 1000) > 0)
        {
            words += ConvertNumbertoWords(number / 1000) + " THOUSAND ";
            number %= 1000;
        }
        if ((number / 100) > 0)
        {
            words += ConvertNumbertoWords(number / 100) + " HUNDRED ";
            number %= 100;
        }
        if (number > 0)
        {
            if (words != "")
                words += "AND ";
            var unitsMap = new[] { "ZERO", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE", "TEN", "ELEVEN", "TWELVE", "THIRTEEN", "FOURTEEN", "FIFTEEN", "SIXTEEN", "SEVENTEEN", "EIGHTEEN", "NINETEEN" };
            var tensMap = new[] { "ZERO", "TEN", "TWENTY", "THIRTY", "FORTY", "FIFTY", "SIXTY", "SEVENTY", "EIGHTY", "NINETY" };

            if (number < 20)
                words += unitsMap[number];
            else
            {
                words += tensMap[number / 10];
                if ((number % 10) > 0)
                    words += " " + unitsMap[number % 10];
            }
        }
        return words;
    }



    protected void btntoword_Click(object sender, EventArgs e)
    {
        lblResult.Text = MoneyToWords(Convert.ToDouble(txtAmount.Text));
    }
    public static string MoneyToWords(double value)
    {
        decimal money = Math.Round((decimal)value, 2);
        int number = (int)money;
        int decimalValue = 0;
        string doller = string.Empty;
        string cents = string.Empty;
        doller = NumberToWords(number);
        if (money.ToString().Contains("."))
        {
            decimalValue = int.Parse(money.ToString().Split('.')[1]);
            cents = NumberToWords(decimalValue);
        }
        string result = !string.IsNullOrEmpty(cents) ? (decimalValue == 1 ? string.Format("{0} Doller and {1} Cent Only.", doller, cents) : string.Format("{0} Doller and {1} Cents Only.", doller, cents)) : string.Format("{0} Doller Only.", doller);
        return result;
    }
    //Below Method id also work same
    //public static string NumberToWords(int number)
    //{
    //    if (number == 0)
    //        return "zero";

    //    if (number < 0)
    //        return "minus " + NumberToWords(Math.Abs(number));

    //    string words = "";
    //    if ((number / 1000000000) > 0)
    //    {
    //        words += NumberToWords(number / 1000000000) + " Billion ";
    //        number %= 1000000000;
    //    }
    //    if ((number / 10000000) > 0)
    //    {
    //        words += NumberToWords(number / 10000000) + " Crore ";
    //        number %= 10000000;
    //    }
    //    if ((number / 1000000) > 0)
    //    {
    //        words += NumberToWords(number / 1000000) + " Million ";
    //        number %= 1000000;
    //    }
    //    if ((number / 100000) > 0)
    //    {
    //        words += NumberToWords(number / 100000) + " Lakh ";
    //        number %= 100000;
    //    }

    //    if ((number / 1000) > 0)
    //    {
    //        words += NumberToWords(number / 1000) + " Thousand ";
    //        number %= 1000;
    //    }

    //    if ((number / 100) > 0)
    //    {
    //        words += NumberToWords(number / 100) + " Hundred ";
    //        number %= 100;
    //    }

    //    if (number > 0)
    //    {
    //        var unitsMap = new[] { "Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen" };
    //        var tensMap = new[] { "Zero", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety" };

    //        if (number < 20)
    //            words += unitsMap[number];
    //        else
    //        {
    //            words += tensMap[(number) / 10];
    //            if ((number % 10) > 0)
    //                words += " " + unitsMap[(number) % 10];
    //        }
    //    }
    //    return words;
    //}
    private static string NumberToWords(int number)
    {
        if (number == 0)
            return "zero";

        if (number < 0)
            return "minus " + NumberToWords(Math.Abs(number));

        string words = "";
        if ((number / 1000000000) > 0)
        {
            words += NumberToWords(number / 1000000000) + " Billion ";
            number %= 1000000000;
        }

        if ((number / 10000000) > 0)
        {
            words += NumberToWords(number / 10000000) + " Crore ";
            number %= 10000000;
        }

        if ((number / 1000000) > 0)
        {
            words += NumberToWords(number / 1000000) + " Million ";
            number %= 1000000;
        }


        if ((number / 100000) > 0)
        {
            words += NumberToWords(number / 100000) + " Lakh ";
            number %= 100000;
        }


        if ((number / 1000) > 0)
        {
            words += NumberToWords(number / 1000) + " Thousand ";
            number %= 1000;
        }

        if ((number / 100) > 0)
        {
            words += NumberToWords(number / 100) + " Hundred ";
            number %= 100;
        }

        if (number > 0)
        {
            if (words != "")
                words += "and ";

            var unitsMap = new[] { "zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen" };
            var tensMap = new[] { "zero", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety" };

            if (number < 20)
                words += unitsMap[number];
            else
            {
                words += tensMap[number / 10];
                if ((number % 10) > 0)
                    words += "-" + unitsMap[number % 10];
            }
        }

        return words;
    }
//    #region code for number to word in RDLC report
//    Public Shared Function changeToWords(ByVal numb As[String]) As[String]
//   Dim val As[String] = "", wholeNo As[String] = numb, points As[String] = "", andStr As[String] = "", pointStr As[String] = ""
//    Dim endStr As[String] = ""
//    Try
//        Dim decimalPlace As Integer = numb.IndexOf(".")
//        If decimalPlace > 0 Then
//            wholeNo = numb.Substring(0, decimalPlace)
//            points = numb.Substring(decimalPlace + 1)
//            If Convert.ToInt32(points) > 0 Then
//                andStr = "point"
//                ' just to separate whole numbers from points
//                pointStr = translateCents(points)
//            End If
//        End If
//        val = [String].Format("{0} {1}{2} {3}", translateWholeNumber(wholeNo).Trim(), andStr, pointStr, endStr)
//    Catch


//    End Try
//    Return val
//End Function
//Private Shared Function translateWholeNumber(ByVal number As[String]) As[String]
//   Dim word As String = ""
//    Try
//        Dim beginsZero As Boolean = False
//        'tests for 0XX
//        Dim isDone As Boolean = False
//        'test if already translated
//        Dim dblAmt As Double = (Convert.ToDouble(number))
//        'if ((dblAmt > 0) && number.StartsWith("0"))
//        If dblAmt > 0 Then
//            'test for zero or digit zero in a nuemric
//            beginsZero = number.StartsWith("0")
           
//            Dim numDigits As Integer = number.Length
//            Dim pos As Integer = 0
//            'store digit grouping
//            Dim place As[String] = ""
//            'digit grouping name:hundres,thousand,etc...
//            Select Case numDigits
//                Case 1
//                    'ones' range
//                    word = ones(number)
//                    isDone = True
//                    Exit Select
//                Case 2
//                    'tens' range
//                    word = tens(number)
//                    isDone = True
//                    Exit Select
//                Case 3
//                    'hundreds' range
//                    pos = (numDigits Mod 3) + 1
//                    place = " Hundred "
//                    Exit Select
//                'thousands' range
//                Case 4, 5, 6
//                    pos = (numDigits Mod 4) + 1
//                    place = " Thousand "
//                    Exit Select
//                'millions' range
//                Case 7, 8, 9
//                    pos = (numDigits Mod 7) + 1
//                    place = " Million "
//                    Exit Select
//                Case 10
//                    'Billions's range
//                    pos = (numDigits Mod 10) + 1
//                    place = " Billion "
//                    Exit Select
//                Case Else
//                    'add extra case options for anything above Billion...
//                    isDone = True
//                    Exit Select
//            End Select
//            If Not isDone Then
//                'if transalation is not done, continue...(Recursion comes in now!!)
//                word = translateWholeNumber(number.Substring(0, pos)) + place + translateWholeNumber(number.Substring(pos))
//                'check for trailing zeros
//                If beginsZero Then
//                    word = " and " & word.Trim()
//                End If
//            End If
//            'ignore digit grouping names
//            If word.Trim().Equals(place.Trim()) Then
//                word = ""
//            End If
//        End If
//    Catch


//    End Try
//    Return word.Trim()
//End Function
//Private Shared Function tens(ByVal digit As[String]) As[String]
//   Dim digt As Integer = Convert.ToInt32(digit)
//   Dim name As[String] = Nothing
//    Select Case digt
//        Case 10
//            name = "Ten"
//            Exit Select
//        Case 11
//            name = "Eleven"
//            Exit Select
//        Case 12
//            name = "Twelve"
//            Exit Select
//        Case 13
//            name = "Thirteen"
//            Exit Select
//        Case 14
//            name = "Fourteen"
//            Exit Select
//        Case 15
//            name = "Fifteen"
//            Exit Select
//        Case 16
//            name = "Sixteen"
//            Exit Select
//        Case 17
//            name = "Seventeen"
//            Exit Select
//        Case 18
//            name = "Eighteen"
//            Exit Select
//        Case 19
//            name = "Nineteen"
//            Exit Select
//        Case 20
//            name = "Twenty"
//            Exit Select
//        Case 30
//            name = "Thirty"
//            Exit Select
//        Case 40
//            name = "Fourty"
//            Exit Select
//        Case 50
//            name = "Fifty"
//            Exit Select
//        Case 60
//            name = "Sixty"
//            Exit Select
//        Case 70
//            name = "Seventy"
//            Exit Select
//        Case 80
//            name = "Eighty"
//            Exit Select
//        Case 90
//            name = "Ninety"
//            Exit Select
//        Case Else
//            If digt > 0 Then
//                name = (tens(digit.Substring(0, 1) & "0") & " ") + ones(digit.Substring(1))
//            End If
//            Exit Select
//    End Select
//    Return name
//End Function
//Private Shared Function ones(ByVal digit As[String]) As[String]
//   Dim digt As Integer = Convert.ToInt32(digit)
//   Dim name As[String] = ""
//    Select Case digt
//        Case 1
//            name = "One"
//            Exit Select
//        Case 2
//            name = "Two"
//            Exit Select
//        Case 3
//            name = "Three"
//            Exit Select
//        Case 4
//            name = "Four"
//            Exit Select
//        Case 5
//            name = "Five"
//            Exit Select
//        Case 6
//            name = "Six"
//            Exit Select
//        Case 7
//            name = "Seven"
//            Exit Select
//        Case 8
//            name = "Eight"
//            Exit Select
//        Case 9
//            name = "Nine"
//            Exit Select
//    End Select
//    Return name
//End Function
//Private Shared Function translateCents(ByVal cents As[String]) As[String]
//   Dim cts As[String] = "", digit As[String] = "", engOne As[String] = ""
//    For i As Integer = 0 To cents.Length - 1
//        digit = cents(i).ToString()
//        If digit.Equals("0") Then
//            engOne = "Zero"
//        Else
//            engOne = ones(digit)
//        End If
//        cts += " " & engOne
//    Next
//    Return cts
//End Function


//    #endregion
public void bindgrid()
    {
        con.Open();
        cmd = new SqlCommand();
        cmd.CommandText = "agetoword";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@Ind", 1);
        da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if(dt.Rows.Count>0)
        {
            for(int i=0;i<dt.Rows.Count;i++)
            {
                dt.Rows[i]["agetoword"] = ConvertNumbertoWords(Convert.ToInt32( dt.Rows[i]["Age"].ToString()));
            }
            grdage.DataSource = dt;
            grdage.DataBind();
        }
    }
    #region substring function
   public void CheckFile()
    {
        //https://www.c-sharpcorner.com/UploadFile/mahesh/substring-in-C-Sharp/
        //https://docs.microsoft.com/en-us/dotnet/api/system.string.substring?view=net-6.0
        string file = "Jaipur Nagar Nigam (Greater).pdf";
        string filext = file.Substring(file.LastIndexOf(".") + 1);// if write 1 then filext=pdf , if write the 0 then filext=.pdf, if write the 2 then filext=df
        //int len = file.Length;
        //string ext = file;
        //if (ext.Substring(len - 3, len) != "pdf")
        //{
           
        //}
        // Get a substring after or before a character 
        string authors = "Mahesh Chand, Henry He, Chris Love, Raj Beniwal, Praveen Kumar";            
        string stringBeforeChar = authors.Substring(0, authors.IndexOf(","));
        // Get a substring after a character     
        string stringAfterChar = authors.Substring(authors.IndexOf(",") + 2);
    }
    #endregion
}
