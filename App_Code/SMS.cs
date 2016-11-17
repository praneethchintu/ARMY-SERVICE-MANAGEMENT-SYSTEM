﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO.Ports;
using System.Threading;


    public class SMS
    {
         SerialPort serialPort;
        public  SMS(string comPort)
        {
            this.serialPort = new SerialPort();
            this.serialPort.PortName = comPort;
            this.serialPort.BaudRate = 9600;
            this.serialPort.Parity = Parity.None;
            this.serialPort.DataBits = 8;
            this.serialPort.StopBits = StopBits.One;
            this.serialPort.Handshake = Handshake.RequestToSend;
            this.serialPort.DtrEnable = true;
            this.serialPort.RtsEnable = true;
            this.serialPort.NewLine = System.Environment.NewLine;
        }

        public bool sendSMS(string cellNo, string sms)
        {

     
            string messages = null;
            messages = sms;
            if (this.serialPort.IsOpen == true)
            {
                try
                {
                    this.serialPort.WriteLine("AT" + (char)(13));
                    Thread.Sleep(2000);
                    this.serialPort.WriteLine("AT+CMGF=1" + (char)(13));
                    Thread.Sleep(3000);
                    this.serialPort.WriteLine("AT+CMGS=\"" + cellNo + "\"");
                    Thread.Sleep(5000);
                    this.serialPort.WriteLine(""+  messages + (char)(26)+"\r");
                }
                catch (Exception ex)
                {
                  return false;
                }
                return true;
            }
            else
            return false;
        }
 
        public void Opens()
        {
            if (this.serialPort.IsOpen == false)
            {
                this.serialPort.Open();
            }
        }
 
        public void Closes()
        {
            if (this.serialPort.IsOpen == true)
            {
                this.serialPort.Close();
            }
        }
    }
    