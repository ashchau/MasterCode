using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        luser.Text = Convert.ToString( Session["Usernam"]);
        lmobile.Text =Convert.ToString( Session["Mobile"]);
        lfrndname.Text =Convert.ToString( Session["frndname"]);
        OCP();
        LSP();
    }
    #region SOLID Principles 2-Open Closed Principle (OCP)
    interface IAccount
    {
        // members and function declaration, properties
        decimal Balance { get; set; }
        decimal CalcInterest();
    }

    //regular savings account 
    public class RegularSavingAccount : IAccount
    {
        public decimal Balance { get; set; }// = 0; it's work on 6 or above version
        public decimal CalcInterest()
        {
            decimal Interest = (Balance * 4) / 100;
            if (Balance < 1000) Interest -= (Balance * 2) / 100;
            if (Balance < 50000) Interest += (Balance * 4) / 100;

            return Interest;
        }
    }

    //Salary savings account 
    public class SalarySavingAccount : IAccount
    {
        public decimal Balance { get; set; } // = 0;
        public decimal CalcInterest()
        {
            decimal Interest = (Balance * 5) / 100;
            return Interest;
        }
    }

    //Corporate Account
    public class CorporateAccount : IAccount
    {
        public decimal Balance { get; set; } //= 0;
        public decimal CalcInterest()
        {
            decimal Interest = (Balance * 3) / 100;
            return Interest;
        }
    }
    protected void OCP()
    {
        CorporateAccount objc = new CorporateAccount();
        objc.Balance = 150;
        objc.CalcInterest();
    }
    #endregion
    #region  SOLID Principles 3-Liskov Substitution Principle (LSP)
    public abstract class Shape
    {
        public abstract string GetShape();
    }

    public class Triangle : Shape
    {
        public override string GetShape()
        {
            return "Triangle";
        }
    }

    public class Circle : Triangle
    {
        public override string GetShape()
        {
            return "Circle";
        }
    }
    public void LSP()
    {
        Shape shape = new Circle();
        string  c=shape.GetShape();
        shape = new Triangle();
        string t=shape.GetShape();
    }
    #endregion
    #region SOLID Principles 5-Dependency Inversion Principle (DIP)
    //step 1
    public interface ILogger
    {
        void LogMessage(string aString);
    }
    //step 2
    public class DbLogger : ILogger
    {
        public void LogMessage(string aMessage)
        {
            //Code to write message in database.
        }
    }
    public class FileLogger : ILogger
    {
        public void LogMessage(string aStackTrace)
        {
            //code to log stack trace into a file.
        }
    }
    //step 3
    public class ExceptionLogger
    {
        private ILogger _logger;
        public ExceptionLogger(ILogger aLogger)
        {
            this._logger = aLogger;
        }
        public void LogException(Exception aException)
        {
            string strMessage = GetUserReadableMessage(aException);
            this._logger.LogMessage(strMessage);
        }
        private string GetUserReadableMessage(Exception aException)
        {
            string strMessage = string.Empty;
            // "code to convert Exception's stack trace and message to user readable format";
 
            return strMessage;
        }
    }
    public class DataExporter
    {
        public void ExportDataFromFile()
        {
            ExceptionLogger _exceptionLogger;
            try
            {
                //code to export data from files to database.
            }
            catch (IOException ex)
            {
                _exceptionLogger = new ExceptionLogger(new DbLogger());
                _exceptionLogger.LogException(ex);
            }
            catch (Exception ex)
            {
                _exceptionLogger = new ExceptionLogger(new FileLogger());
                _exceptionLogger.LogException(ex);
            }
        }
    }
    #endregion
}