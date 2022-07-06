
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Gimhana Sandakelum
 */
public class test {
    public static void main(String[] args) throws ParseException {
        List<Date> dates = new ArrayList<Date>();

        String str_date ="01/01/2020";
        String end_date ="02/09/2020";

        DateFormat formatter ; 

        formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date  startDate = (Date)formatter.parse(str_date); 
        Date  endDate = (Date)formatter.parse(end_date);
        long interval = 24*1000 * 60 * 60; // 1 hour in millis
        long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
        long curTime = startDate.getTime();
        while (curTime <= endTime) {
            dates.add(new Date(curTime));
            curTime += interval;
        }
        for(int i=0;i<dates.size();i++){
            Date lDate =(Date)dates.get(i);
            String ds = formatter.format(lDate);    
            System.out.println(" Date is ..." + ds);
        }
    }
}
