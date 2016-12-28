NSURLCache 方法介绍

//获得全局缓存对象（没必要手动创建）
+ (NSURLCache *)sharedURLCache;

//设置内存缓存的最大容量（字节为单位，默认为512KB）
- (void)setMemoryCapacity:(NSUInteger)memoryCapacity;

//设置硬盘缓存的最大容量（字节为单位，默认为10M）
- (void)setDiskCapacity:(NSUInteger)diskCapacity;

//设置自定义的NSURLCache作为应用缓存管理对象
+ (void)setSharedURLCache:(NSURLCache *)cache;

//设置内存、磁盘、磁盘路径
- (instancetype)initWithMemoryCapacity:(NSUInteger)memoryCapacity diskCapacity:(NSUInteger)diskCapacity diskPath:(nullable NSString *)path;

//取得某个请求的缓存(取)
- (nullable NSCachedURLResponse *)cachedResponseForRequest:(NSURLRequest *)request;

//给请求设置指定的缓存(存)
- (void)storeCachedResponse:(NSCachedURLResponse *)cachedResponse forRequest:(NSURLRequest *)request;

//删除某个请求对应的缓存
- (void)removeCachedResponseForRequest:(NSURLRequest *)request;

//删除所有缓存
- (void)removeAllCachedResponses;

//按时间段来删除缓存
- (void)removeCachedResponsesSinceDate:(NSDate *)date NS_AVAILABLE(10_10, 8_0);

缓存策略
缓存策略
缓存策略
缓存策略
NSURLRequestUseProtocolCachePolicy // 默认的缓存策略（取决于协议）
NSURLRequestReloadIgnoringLocalCacheData // 忽略缓存，重新请求
NSURLRequestReloadIgnoringLocalAndRemoteCacheData // 未实现
NSURLRequestReloadIgnoringCacheData = NSURLRequestReloadIgnoringLocalCacheData // 忽略缓存，重新请求
NSURLRequestReturnCacheDataElseLoad// 有缓存就用缓存，没有缓存就重新请求
NSURLRequestReturnCacheDataDontLoad// 有缓存就用缓存，没有缓存就不发请求，当做请求出错处理（用于离线模式）
NSURLRequestReloadRevalidatingCacheData // 未实现
