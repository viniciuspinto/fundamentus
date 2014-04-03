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
        :last_processed => parse_last_processed
      }
    end

    def parse_market_cap
      label_td = find_td_with_label('Valor de mercado')
      if label_td
        data = label_td.next_element().css('span.txt').first.text
      end
    end

    def parse_last_processed
      label_td = find_td_with_label('Últ balanço processado')
      if label_td
        data = label_td.next_element().css('span.txt').first.text
      end
    end

    def find_td_with_label(label)
      td = nil
      @doc.css('body.detalhes div.conteudo td.w2 span.txt').each do |item|
        if item.content.strip == label
          td = item.parent()
        end
      end
      td
    end

end
