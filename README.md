# What is this?

Save stocks financial information from [fundamentus.com.br](http://www.fundamentus.com.br) in JSON format.

Tags: bovespa, stock market, bolsa de valores, brasil, brazilian, ações

# Status

Currently only the fields specified in the following hash are being retrieved:

    LABEL_MAP = {
      :share_count => 'Nro. Ações',
      :market_cap => 'Valor de mercado',
      :last_processed => 'Últ balanço processado',
      :pl => 'P/L',
      :pvp => 'P/VP',
      :pebit => 'P/EBIT',
      :lpa => 'LPA',
      :vpa => 'VPA',
      :net_margin => 'Marg. Líquida',
      :net_debt => 'Dív. Líquida',
      :net_assets => 'Patrim. Líq',
      :yearly_net_income => 'Receita Líquida',
      :yearly_net_profit => 'Lucro Líquido',
      :quarterly_net_income => ['Receita Líquida', 2],
      :quarterly_net_profit => ['Lucro Líquido', 2]
    }

# Installation

    gem install fundamentus_data

# Usage

    require 'fundamentus_data'

    FundamentusData.save ['PETR4', 'BBDC4', 'PSSA3'], './data', :verbose => true

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
