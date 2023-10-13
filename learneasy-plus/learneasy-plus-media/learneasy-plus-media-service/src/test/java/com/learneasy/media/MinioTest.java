package com.learneasy.media;

import com.j256.simplemagic.ContentInfo;
import com.j256.simplemagic.ContentInfoUtil;
import io.minio.*;
import io.minio.errors.*;
import org.apache.commons.compress.utils.IOUtils;
import org.junit.jupiter.api.Test;
import org.mockito.internal.util.io.IOUtil;
import org.springframework.http.MediaType;
import org.springframework.util.DigestUtils;

import java.io.*;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

/*
* 测试MinIO的SDK
* */
public class MinioTest {

    MinioClient minioClient =
            MinioClient.builder()
                    .endpoint("http://192.168.101.65:9000")
                    .credentials("minioadmin", "minioadmin")
                    .build();

    @Test
    public void test_upload() throws IOException, ServerException, InsufficientDataException, ErrorResponseException, NoSuchAlgorithmException, InvalidKeyException, InvalidResponseException, XmlParserException, InternalException {


        ContentInfo extensionMatch = ContentInfoUtil.findExtensionMatch(".mp4");
        String mimeType = MediaType.APPLICATION_OCTET_STREAM_VALUE;//通用mimeType，字节流
        if(extensionMatch!=null){
            mimeType=extensionMatch.getMimeType();
        }



        //上传文件的·参数信息
        UploadObjectArgs uploadObjectArgs = UploadObjectArgs.builder()
                .bucket("testbucket")//桶
                .filename("C:\\Users\\23863\\Desktop\\图片\\1.png")//指定本地文件路径
                .object("1.png")//对象名
                .contentType(mimeType)
                .build();

        //上传文件
        minioClient.uploadObject(uploadObjectArgs);


    }

    //删除文件
    @Test
    public void test_delete() throws IOException, ServerException, InsufficientDataException, ErrorResponseException, NoSuchAlgorithmException, InvalidKeyException, InvalidResponseException, XmlParserException, InternalException {




        //删除文件的·参数信息
        UploadObjectArgs uploadObjectArgs = UploadObjectArgs.builder()
                .bucket("testbucket")//桶
                .filename("C:\\Users\\23863\\Desktop\\图片\\1.png")//指定本地文件路径
                .object("1.png")//对象名
                .build();

        //RemoveObjectArgs
        RemoveObjectArgs removeObjectArgs=RemoveObjectArgs.builder()
                .bucket("testbucket")
                .object("1.png")
                .build();


        //删除文件
        minioClient.removeObject(removeObjectArgs);
    }

    @Test
    //查询文件
    public  void test_getFile() throws ServerException, InsufficientDataException, ErrorResponseException, IOException, NoSuchAlgorithmException, InvalidKeyException, InvalidResponseException, XmlParserException, InternalException {
        GetObjectArgs getObjectArgs=GetObjectArgs.builder().bucket("testbucket").object("1.png").build();

        GetObjectResponse inputStream = minioClient.getObject(getObjectArgs);
        //指定输入流
        FileOutputStream outputStream=new FileOutputStream(new File("C:\\Users\\23863\\Desktop\\图片\\1a.png"));
        IOUtils.copy(inputStream,outputStream);

        //检验文件的完整性，对文件的内容进行md5
        FileInputStream fileInputStream1 = new FileInputStream(new File("C:\\Users\\23863\\Desktop\\图片\\1.png"));
        String source_md5 = DigestUtils.md5DigestAsHex(fileInputStream1);
        FileInputStream fileInputStream = new FileInputStream(new File("C:\\Users\\23863\\Desktop\\图片\\1a.png"));
        String local_md5 = DigestUtils.md5DigestAsHex(fileInputStream);
        if(source_md5.equals(local_md5)){
            System.out.println("下载成功");
        }


    }



}
