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
        
        succeed(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
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
        succeed(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];

}

#pragma mark -单利获取AFHTTPSessionManager实例
//MARK:解决[AFHTTPSessionManager manager]内存泄漏问题
+ (AFHTTPSessionManager *)sessionManager {
    static dispatch_once_t onceToken;
    static AFHTTPSessionManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        // 客户端是否信任非法证书
        manager.securityPolicy.allowInvalidCertificates = YES;
        // 是否在证书域字段中验证域名
        [manager.securityPolicy setValidatesDomainName:NO];
        
        //申明返回的结果是json类型
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        //申明请求的数据是json类型
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
@end
