require 'nokogiri'

class FundamentusParser

  LABEL_MAP = {
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
    :yearly_net_profit => 'Lucro Líquido'
  }

  def initialize(options = {})
    if options.has_key?(:verbose)
      @verbose = options[:verbose]
    end
  end

  def parse(content)
    @doc = Nokogiri::HTML.parse(content)
    parsed = {}
    LABEL_MAP.each do |key, label|
      parsed[key] = read_value_with_label(label)
    end
    parsed
  end

  private

    def read_value_with_label(label, index = 0)
      label_td = find_td_with_label(label, index)
      if label_td
        data = label_td.next_element().css('span.txt').first.text.strip
      end
    end

    def find_td_with_label(label, index = 0)
      count = 0
      @doc.css('body.detalhes div.conteudo td span.txt').each do |item|
        if item.content.strip == label
          if count == index
            return item.parent()
          end
          count += 1
        end
      end
      nil
    end

end
