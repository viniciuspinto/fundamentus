# What is this?

Save stocks financial information from [fundamentus.com.br](http://www.fundamentus.com.br) in JSON format.

Tags: bovespa, stock market, bolsa de valores, brasil, brazilian, ações

# Status

Very early, but working. Currently only a few fields are being retrieved, more will be added soon. If you need something that isn't currently saved, you can add the field on `app/fundamentus/fundamentus_parser.rb`.

# Usage

Set the stock symbols you want to fetch on the `stock_codes` array at `save_financial_data.rb` and run the file. There's a commented out array of symbols with the most traded stocks. By default the JSON files will be saved to `./data/`

# License

The MIT License (MIT)

Copyright (c) 2014 Vinicius Pinto

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
