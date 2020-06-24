//
//  LXHttpRequest.m
//  TemperatureProject
//
//  Created by admin on 2020/6/22.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXHttpRequest.h"
#import "AFNetworking.h"

@implementation LXHttpRequest

/**
 *  创建网络请求类的单例
 */
static LXHttpRequest *httpRequest = nil;
+(LXHttpRequest *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (httpRequest == nil) {
            httpRequest = [[self alloc] init];
        }
    });
    return httpRequest;
}
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (httpRequest == nil) {
            httpRequest = [super allocWithZone:zone];
        }
    });
    return httpRequest;
}
-(instancetype)copyWithZone:(NSZone *)zone
{
    return httpRequest;
}
/**
 *封装AFN的GET请求
 *@param URLString 网络请求地址
 *@param dict      参数(可以是字典或者nil)
 *@param succeed   成功后执行success block
 *@param failure   失败后执行failure block
 */
+ (void)GET:(NSString *)URLString dict:(id)dict succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure
{
    //创建网络请求管理对象
    AFHTTPSessionManager *manager = [self sessionManager];
    [manager GET:URLString parameters:dict headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self printResponse:responseObject rquestUrl:URLString requestParams:dict];
        succeed(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self printErrorInfo:error rquestUrl:URLString requestParams:dict];
        failure(error);
    }];
   
}
/**
 *  封装AFN的POST请求
 *
 *  @param URLString 网络请求地址
 *  @param dict      参数(可以是字典或者nil)
 *  @param succeed   成功后执行success block
 *  @param failure   失败后执行failure block
 */
+ (void)POST:(NSString *)URLString dict:(id)dict succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure
{
    //创建网络请求管理对象
    AFHTTPSessionManager *manager = [self sessionManager];
   
    //发送网络请求(请求方式为POST)
    
    [manager POST:URLString parameters:dict headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self printResponse:responseObject rquestUrl:URLString requestParams:dict];
        succeed(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self printErrorInfo:error rquestUrl:URLString requestParams:dict];
        failure(error);
    }];

}

+ (void)POST:(NSString *)URLString jsonDict:(id)dict succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure
{
    // 请求参数数据
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *urlstr = URLString;

       AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
       manager.requestSerializer.timeoutInterval = 30;
       manager.responseSerializer = [AFJSONResponseSerializer serializer];
       // 设置header
       [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
       [manager.requestSerializer setValue:@"Bearer" forHTTPHeaderField:@"Authorization"];


       // request
       NSError *requestError = nil;
       NSMutableURLRequest *request = [manager.requestSerializer requestWithMethod:@"POST" URLString:urlstr parameters:nil error:&requestError];
       
       // body
       NSData *postData = jsonData;
       [request setHTTPBody:postData];
       
       NSURLSessionDataTask *dataTask = [manager.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
           
           if (error) {
               [self printErrorInfo:error rquestUrl:URLString requestParams:dict];
               failure(error);
           }
           else
           {
               NSError * error = nil;

               id jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
               NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
               
               NSString *log = [NSString stringWithFormat:@"\n**************** REQUEST: ****************\n【URL】 %@\n--------------------------------------------\npara:\n%@\n--------------------------------------------\nresponse:\n%@ \n*********************************************\n", URLString, [dict description], [jsonData description]];
               // 注释掉大数据上报
              
                printf("%s\n", [log UTF8String]);
               
               succeed(jsonData);
           }
           
       }];
       [dataTask resume];
}

#pragma mark -单利获取AFHTTPSessionManager实例
//MARK:解决[AFHTTPSessionManager manager]内存泄漏问题
+ (AFHTTPSessionManager *)sessionManager {
    static dispatch_once_t onceToken;
    static AFHTTPSessionManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
//        // 客户端是否信任非法证书
//        manager.securityPolicy.allowInvalidCertificates = YES;
//        // 是否在证书域字段中验证域名
//        [manager.securityPolicy setValidatesDomainName:NO];
        [manager.requestSerializer setValue:@"Bearer" forHTTPHeaderField:@"Authorization"];
        //申明返回的结果是json类型
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        //申明请求的数据是json类型
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        //如果报接受类型不一致请替换一致text/html或别的
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
        @"application/json",
        @"text/json",@"text/text",
        @"text/html",@"text/plain",
        @"text/javascript", nil];
    
    });
    
   
    //!h这里要放在外面，因为有些地方会单独设置超时时间覆盖这里的15s
    manager.requestSerializer.timeoutInterval = 15;
    
    return manager;
}

//MARK:----------接口响应数据打印----------
+ (void)printResponse:(id)response rquestUrl:(NSString *)url requestParams:(id)params {
#if DEBUG
    @try {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:NSJSONWritingPrettyPrinted error:nil];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
        NSString *log = [NSString stringWithFormat:@"\n**************** REQUEST: ****************\n【URL】 %@\n--------------------------------------------\npara:\n%@\n--------------------------------------------\nresponse:\n%@ \n*********************************************\n", url, [params description], jsonString];
        // 注释掉大数据上报
        if (![url containsString:@"passenger/appDataReport"]) {
            printf("%s\n", [log UTF8String]);
        }
    } @catch (NSException *exception) {
        
    }
#endif
}

//MARK:----------接口错误信息打印----------
+ (void)printErrorInfo:(NSError *)error rquestUrl:(NSString *)url requestParams:(id)params {
#if DEBUG
    @try {
        NSString *log = [NSString stringWithFormat:@"\n**************** REQUEST ERROR: ****************\n【URL】%@\n--------------------------------------------\npara:\n%@\n--------------------------------------------\nresponse:\n%@ \n*********************************************\n", url, [params description], error];
        printf("%s\n", [log UTF8String]);
    } @catch (NSException *exception) {
        
    }
#endif
}
@end
