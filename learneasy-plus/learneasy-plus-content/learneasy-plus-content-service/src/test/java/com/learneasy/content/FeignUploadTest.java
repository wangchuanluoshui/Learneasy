package com.learneasy.content;

import com.learneasy.content.config.MultipartSupportConfig;
import com.learneasy.content.feignclient.MediaServiceClient;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

/**
 * 测试使用feign远程上传文件
 */
@SpringBootTest
public class FeignUploadTest {
    @Autowired
    MediaServiceClient mediaServiceClient;

    //远程调用，上传文件
    @Test
    public void test() {
        MultipartFile multipartFile = MultipartSupportConfig.getMultipartFile(new File("D:\\develop\\175.html"));
        String result = mediaServiceClient.upload(multipartFile, "course");
        System.out.println(result);
    }
}