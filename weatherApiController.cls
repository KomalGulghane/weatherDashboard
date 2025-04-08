// WeeK3 : Assignment :- Find a public weather API (Integration)

public class weatherApiController {
    @AuraEnabled
    public static String getWeatherData(String city) {
        HttpRequest req = new HttpRequest();
        String apiKey = '3ed94a4c6afb53a079c6a49a49809348'; 
        req.setEndpoint('callout:WeatherApiNameCredential/data/2.5/weather?q=' + EncodingUtil.urlEncode(city, 'UTF-8') + '&appid=' + apiKey);

        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json');
        
        Http http = new Http();
        HttpResponse res = http.send(req);

        System.debug('response: ' + res.getBody());
        return res.getBody();
    }
}