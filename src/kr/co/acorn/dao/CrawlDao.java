package kr.co.acorn.dao;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import kr.co.acorn.dto.CrawlDto;


public class CrawlDao {
	private static CrawlDao single;
	private CrawlDao() {
		
	}
	public static CrawlDao getInstance() {
		if(single==null) {
			single = new CrawlDao();
		}
		return single;
	}
	
	public ArrayList<CrawlDto> crawl(int startdate, int enddate){
		ArrayList<CrawlDto> list = new ArrayList<CrawlDto>();
		FileWriter fw = null;
		BufferedWriter bw = null;
		PrintWriter pw = null;
		String url = "https://coinmarketcap.com/currencies/bitcoin/historical-data/?start="+startdate+"&end="+enddate;
		Document doc = null;
		
		
		try {
			fw = new FileWriter("C:\\dev\\io\\2019\\12\\crawling1.doc");
			bw = new BufferedWriter(fw);
			pw = new PrintWriter(bw,true);
			pw.println("Date\t\tOpen\t\tHigh\t\tLow\t\tClose\t\tVolume\t\tCap");
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		

		
		try {
			doc = Jsoup.connect(url).get(); // url 가져오기
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Elements elements = doc.select(".cmc-table__table-wrapper-outer table tbody tr");
		
		
		// c:\dev\io\2019\12\crawling.txt 여기에 저장하기
		
		for(int i = 0; i< elements.size(); i++){
			Element trElement = elements.get(i);
			String date = trElement.child(0).text();
			String open = trElement.child(1).text();
			String high = trElement.child(2).text();
			String low = trElement.child(3).text();
			String close = trElement.child(4).text();
			String volume = trElement.child(5).text();
			String cap = trElement.child(6).text();

		
			list.add(new CrawlDto(date,open,high,low,close,volume,cap));

			//System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\t%s%n",date,open,high,low,close,volume,cap);
		}
		return list;

	}
	
	
}
