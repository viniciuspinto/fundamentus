require 'nokogiri'

class FundamentusParser

  def parse(pages)
    if not pages.is_a?(Array)
      pages = [pages]
    end
    parsed = []
    pages.each do |content|
      parsed << parse_page(content)
    end
    parsed
  end

  private
    def parse_page(content)
      data = {}
      @doc = Nokogiri::HTML.parse(content)
      parsed = {
        :market_cap => parse_market_cap,
        :last_processed => parse_last_processed,
        :net_debt => parse_net_debt,
        :net_assets => parse_net_assets,
        :yearly_net_income => parse_yearly_net_income,
        :yearly_net_profit => parse_yearly_net_profit
      }
    end

    def parse_market_cap
      read_value_with_label('Valor de mercado')
    end

    def parse_last_processed
      read_value_with_label('Últ balanço processado')
    end

    def parse_net_debt
      read_value_with_label('Dív. Líquida')
    end

    def parse_net_assets
      read_value_with_label('Patrim. Líq')
    end

    def parse_yearly_net_income
      read_value_with_label('Receita Líquida')
    end

    def parse_yearly_net_profit
      read_value_with_label('Lucro Líquido')
    end

    def read_value_with_label(label, index = 0)
      label_td = find_td_with_label(label, index)
      if label_td
        data = label_td.next_element().css('span.txt').first.text
      end
    end

    def find_td_with_label(label, index = 0)
      td = nil
      count = 0
      @doc.css('body.detalhes div.conteudo td span.txt').each do |item|
        if item.content.strip == label
          if count == index
            return item.parent()
          end
          count += 1
        end
      end
    end

end
