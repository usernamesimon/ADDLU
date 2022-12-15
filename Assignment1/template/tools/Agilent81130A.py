#!/bin/python3

import serial,time
import os
import sys
from docopt import docopt


class Device:
	def __init__(self, device="/dev/ttyUSB0", baudrate=57600):
		uart = serial.Serial()
		uart.port = arguments["-d"]
		uart.baudrate = arguments["-b"]
		uart.bytesize = serial.EIGHTBITS #number of bits per bytes
		uart.parity = serial.PARITY_NONE #set parity check: no parity
		uart.stopbits = serial.STOPBITS_ONE #number of stop bits
		uart.timeout = 500       #non-block read
		uart.xonxoff = False     #disable software flow control
		uart.rtscts = False     #disable hardware (RTS/CTS) flow control
		uart.dsrdtr = False       #disable hardware (DSR/DTR) flow control
		
		uart.open()
		self.uart = uart
	
	def Identify(self):
		return self.Read("*IDN?")
	
	def Reset(self):
		self.Write("*RST")
	
	def Write(self, paramter, value=None):
		if (value == None):
			self.uart.write(str.encode(paramter+"\n"))
		else:
			self.uart.write(str.encode(paramter+" "+str(value)+"\n"))
		
	def Read(self, paramter):
		self.uart.write(str.encode(paramter+"\n"))
		return self.uart.readline().decode("utf-8").strip() 


def IsOnOff(v):
	if (v.lower() in ["on", "off", "0", "1"]):
		return True
	return False

def IsMinMax(v):
	v = v.lower()
	if (v in ["min", "max", "minimum", "maximum"]):
		return True
	return False

class ParameterInfo:
	def __init__(self, command, numbers=False, min_max=False, on_off=False, additional_strings=[]):
		self.command = command
		self.numbers = numbers
		self.min_max = min_max
		self.on_off = on_off
		
		self.additional_strings = additional_strings
		self.valid_strings = []
		for i in additional_strings:
			self.valid_strings.append(i.lower())
			#get only the upper case letters 
			self.valid_strings.append(''.join([c for c in i if c.isupper()]).lower())
		
	
	def Check(self, value):
		if (self.on_off and IsOnOff(value)):
			return True
		elif (self.min_max and IsMinMax(value)):
			return True
		elif (self.numbers):
			try:
				float(value)
				return True
			except(ex):
				return False
		
		if (value.lower() in self.valid_strings):
			return True
		
		return False
	
	def FormatString(self):
		output = "The value must be \n"
		if(self.numbers):
			output += " * a number\n"
		
		if(self.on_off):
			output += " * ON | OFF or 1 | 0\n"
		
		if(self.min_max):
			output += " * MINimum | MAXimum\n"
		
		if(len(self.additional_strings) > 0):
			output += " * one of the following strings\n"
			for s in self.additional_strings:
				output += "   - " + s + "\n"
		
		return output.strip()
	
__doc__ = """
Agilent81130A.py

A command line tool to control the Agilent 81130A 400/660 MHz Pulse-/Pattern
Generator. This script is only tested with the Prologix GPIB-USB Controller.

Usage: 
  Agilent81130A.py [-i -r ] [ --output --output_n --freq --vhigh --vlow --duty_cycle [--value=V] ] [-b BAUD_RATE -d DEVICE]

-i               Print model identifier
-r               Reset the device

--output         Control output 0 of the device.
--output_n       Control the complement output of output 0 of the device.
--freq           The output frequency.
--vhigh          The high level of the output voltage.
--vlow           The low level of the output voltage.
--duty_cycle     The duty cycle of the output signal in percent.
--value=V        The value that should be written. If omitted a read
                 operation is performed. If V is empty of ? all possible valid
                 input values are printed.
-b BAUD_RATE     The baudrate of the UART interface [default: 57600]
-d DEVICE        The device to use for the UART connection [default: /dev/ttyUSB0]
"""

if __name__ == "__main__":

	arguments = docopt(__doc__, version='1.0')
	#print(arguments)

	if (not os.path.exists(arguments["-d"])):
		print("Error: Specified device does not exist or you are lacking the sufficient permissions")
		exit(1)

	uart = serial.Serial()
	d = Device(arguments["-d"], arguments["-b"])
	
	if(arguments["-r"]):
		d.Reset()
		
	if(arguments["-i"]):
		print(d.Identify())



	value = arguments["--value"]
	#print(value)
	
	paramters = {
		'--output':ParameterInfo('OUTP', numbers=False, on_off=True,  min_max=False, additional_strings=[]),'--output_n':ParameterInfo('OUTP:COMP', numbers=False, on_off=True,  min_max=False, additional_strings=[]),'--freq':ParameterInfo('FREQ', numbers=True, on_off=False,  min_max=True, additional_strings=[]),'--vhigh':ParameterInfo('VOLT:HIGH', numbers=True, on_off=False,  min_max=True, additional_strings=[]),'--vlow':ParameterInfo('VOLT:LOW', numbers=True, on_off=False,  min_max=True, additional_strings=[]),'--duty_cycle':ParameterInfo('PULSe:DCYCle', numbers=True, on_off=False,  min_max=False, additional_strings=[])
	}
	
	if(value in ["?", ""] ):
		for p in paramters.keys():
			if(arguments[p]): 
				print(paramters[p].FormatString())
				exit(0)
	
	for p in paramters.keys():
		if(arguments[p]): 
			info = paramters[p]
			if (value != None):
				if (info.Check(value)):
					d.Write(info.command + " " + str(value))
				else :
					print("Invalid input")
					print(info.FormatString())
					exit(1)
			else:
				print(d.Read(info.command + "?"))
				

	



