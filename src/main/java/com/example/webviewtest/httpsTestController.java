package com.example.webviewtest;

import com.google.gson.Gson;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class httpsTestController {

    private Gson gson = new Gson();

    @PostMapping("/test")
    public String receiveData(@RequestBody String data) {
        // URL 디코딩
        String decodedData = java.net.URLDecoder.decode(data, java.nio.charset.StandardCharsets.UTF_8);
        // 디코딩된 데이터 출력
        System.out.println("Decoded data: " + decodedData);

        HashMap<String,Object> test = gson.fromJson(decodedData, HashMap.class);

        return "Data received";
    }

    /*주기보고테스트*/
    @PostMapping("/send/gps/cycle")
    public HashMap<String, Object> gpsCycleTest(@RequestBody String data) {
        // URL 디코딩
        String decodedData = java.net.URLDecoder.decode(data, java.nio.charset.StandardCharsets.UTF_8);
        // 디코딩된 데이터 출력
        System.out.println("Decoded data: " + decodedData);

        HashMap<String,Object> test = gson.fromJson(decodedData, HashMap.class);

        HashMap<String, Object> response = new HashMap<>();
        response.put("result","success");

        return response;
    }


    @PostMapping("/api/v1/auth/login")
    public HashMap<String, Object> autoLogin(@RequestBody String data) {
        // URL 디코딩
        String decodedData = java.net.URLDecoder.decode(data, java.nio.charset.StandardCharsets.UTF_8);
        // 디코딩된 데이터 출력
        System.out.println("Decoded data: " + decodedData);

        HashMap<String,Object> test = gson.fromJson(decodedData, HashMap.class);


        HashMap<String, Object> response = new HashMap<>();
        response.put("accessToken","accessToken");
        response.put("expiresIn","expiresIn");
        response.put("refreshToken","refreshToken");
        response.put("encKey","encKey");
        response.put("clientCode","clientCode");
        response.put("sURL","sURL");
        response.put("sPort","sPort");

        return response;
    }


}