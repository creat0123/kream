//import com.amazonaws.auth.BasicAWSCredentials;
//import com.amazonaws.services.s3.AmazonS3;
//import com.amazonaws.services.s3.AmazonS3Client;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//@Configuration
//public class AmazonS3Config {
//
//    @Value("${aws.accessKeyId}")
//    private String accessKey;
//
//    @Value("${aws.secretKey}")
//    private String secretKey;
//
//    @Value("${aws.region}")
//    private String region;
//
//    @Bean
//    public AmazonS3 amazonS3Client() {
//        return AmazonS3Client.builder()
//                .credentials(new BasicAWSCredentials(accessKey, secretKey))
//                .region(region)
//                .build();
//    }
//    @Bean
//    public AmazonS3 amazonS3Client() {
//        return AmazonS3ClientBuilder.standard()
//                .withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(accessKey, secretKey)))
//                .withRegion(region)
//                .build();
//    }
//}
