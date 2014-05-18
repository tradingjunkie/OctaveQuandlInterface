These functions provide an interface between the Quandl financial database and Octave.

Prior to invoking any of the functions, make sure to execute

	addpath('/path/to/OctaveQuandlInterface')

To import financial data into Octave, start by defining an Octave structure:

	Quandl.auth = token;

Then import data using the getQuandl.m function:

	data = getQuandl('GOOG/NASDAQ_MSFT',token,'cellstr');
