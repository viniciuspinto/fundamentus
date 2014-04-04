require_relative './app/util/file_manager.rb'
require_relative './app/util/url_fetcher.rb'
require_relative './app/fundamentus/fundamentus_fetcher.rb'
require_relative './app/fundamentus/fundamentus_parser.rb'

stock_codes = []
# stock_codes = ["PETR4","VALE5","ITUB4","BBDC4","ABEV3","BBAS3","BRFS3","BBSE3","CIEL3","BVMF3","GGBR4","KROT3","CMIG4","CCRO3","AEDU3","USIM5","UGPA3","PCAR4","ESTC3","CSNA3","BRML3","VIVT4","SUZB5","CTIP3","CSAN3","NATU3","SBSP3","BRKM5","TIMP3","LREN3","JBSS3","CYRE3","MRVE3","QUAL3","HGTX3","EMBR3","BRPR3","PDGR3","FIBR3","HYPE3","MULT3","TBLE3","SANB11","CPFE3","OIBR4","CRUZ3","LAME4","CESP6","GFSA3","RENT3","PSSA3","ENBR3","ALLL3","RADL3","TOTS3","LIGT3","DTEX3","CPLE6","ECOR3","EQTL3","WEGE3","ELET6","TAEE11","SMLE3","MPLU3","EVEN3","MILS3","VLID3","IGTA3","GETI4","MDIA3","EZTC3","BEEF3","ODPV3","KLBN4","RAPT4","GOLL4","RSID3","POMO4","QGEP3","BRSR6","MRFG3","ELPL4","SULA11","TRPL4","FLRY3","MYPK3","MGLU3","ALSC3","ENEV3","BRIN3","CSMG3","LPSB3","BBRK3","GRND3","PFRM3","BTOW3","LINX3","DIRR3","SMTO3","ARZZ3","TCSA3","ARTR3","DASA3","LEVE3","ALPA4","ABRE11","IMCH3","AMAR3","ABCB4","ALUP11","SLCE3","STBP11","BPHA3","TGMA3","HBOR3","VAGR3","JSLG3","SSBR3","SLED4","COCE5","CGAS5","BEMA3","KEPL3","JHSF3","MAGG3","AUTM3","TECN3","LLIS3","RDNI3","PMAM3","TPIS3","BPNM4","UCAS3","IDNT3","BISA3"]

save_dir = File.expand_path('./data/', File.dirname(__FILE__)) + '/'

html_fetcher = UrlFetcher.new({ verbose: true })
pages = FundamentusFetcher.new(html_fetcher, { verbose: true }).fetch(stock_codes)
file_manager = FileManager.new(save_dir, { verbose: true })
parser = FundamentusParser.new({ verbose: true })

pages.each do |key, content|
  file_manager.save(key + '.json', parser.parse(content).to_json)
end
