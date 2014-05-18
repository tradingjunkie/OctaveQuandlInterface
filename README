These functions provide an interface between the Quandl financial database and Octave.

Prior to invoking any of the functions, make sure to execute

<pre><code>
addpath('/path/to/OctaveQuandlInterface')
</code><pre>

To import financial data into Octave, start by defining an Octave structure:

<pre><code>
Quandl.auth = token;
</code><pre>

Then import data using the getQuandl.m function:

<pre><code>
data = getQuandl('GOOG/NASDAQ_MSFT',token,'cellstr');
</code><pre>