
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    
#pragma mark- NSString
    
    //创建指定格式的字符串对象
    NSString *str1 = [NSString stringWithFormat:@"How old are you"];

    //用另一个字符串创建一个新的字符串（适合用于可变字符串）
    NSString *str2 = [NSString stringWithString:str1];
    
    //读取文本内容为字符串对象
    NSString *str = [NSString stringWithContentsOfFile:@"/Users/xalo/Desktop/text.txt" encoding:NSUTF8StringEncoding error:nil];
    
    //获取字符串长度
    NSInteger length = [str length];
    
#pragma mark 根据下标获取字符
    for (int i = 0; i < length; i ++) {
        NSLog(@"%c",[str1 characterAtIndex:i]);
    }
    
#pragma mark 大、小字符转换
    NSString *uperStr = [str1 uppercaseString];
    NSLog(@"%@",uperStr);
    
    NSString *lowerStr = [str1 lowercaseString];
    NSLog(@"%@",lowerStr);
    
#pragma mark 首字母大写
    NSString *capitalStr = [str1 capitalizedString];
    NSLog(@"%@",capitalStr);
    
#pragma mark 字符串拼接
    NSString * str3 = [str1 stringByAppendingString:str2];
    NSLog(@"%@",str3);
    
    NSString *str4 = [str1 stringByAppendingFormat:@" %d + %d",2 , 3];
    NSLog(@"%@",str4);
    
#pragma mark 是否包含前缀、后缀
    BOOL result = [@"http://www.baidu.com"hasPrefix:@"http"];
    NSLog(@"%@",result ? @"YES" : @"NO");
    BOOL result1 = [@"http://www.baidu.com"hasSuffix:@"www"];
    NSLog(@"%@", result1 ? @"YES" : @"NO");
    
#pragma mark 搜索字符串范围
    NSRange range = [str1 rangeOfString:@"old"];
    NSLog(@"%@",NSStringFromRange(range));//NSRange 是结构体类型，起始下标location，长度length，如果存在，length不为0
    
#pragma mark 字符串截取

    //字符串截取到第n位  （substringToIndex: n）(第n 位不算再内)
    NSString *subStr1 = [str1 substringFromIndex:3];//从给定下标开始，包含给定下标
    NSString *subStr2 = [str1 substringToIndex:3];//从0开始，返回到给定下标-1（不包含给定下标）
    
    NSRange subRange = NSMakeRange(2, 4);
    NSString * subStr3 = [str1 substringWithRange:subRange];//根据指定范围截取
    NSLog(@"%@ /%@ /%@",subStr1,subStr2,subStr3);//old are you /How /w ol
    
#pragma mark 字符串替换
    NSString * resultStr = [str1 stringByReplacingOccur rencesOfString:@"old" withString:@"hehe"];
    NSLog(@"%@",resultStr);
    
#pragma mark 字符串对象和基本数据类型的转换
    
    NSString *numStr = @"3.1415";
    float num1 = [numStr floatValue];
    NSLog(@"%f",num1);
    /*@property (readonly) double doubleValue;
     @property (readonly) float floatValue;
     @property (readonly) int intValue;
     @property (readonly) NSInteger integerValue
     @property (readonly) long long longLongValue
     @property (readonly) BOOL boolValue
     */
    
#pragma mark NSMutableString
    
    NSMutableString *mutableStr1 = [NSMutableString string ];
    
    //添加字符串
    [mutableStr1 setString:@"zhou"];
    
    //拼接字符串
    [mutableStr1 appendFormat:@" %d + %d ",1,99];
    [mutableStr1 appendString:@"qiang"];
    
    //插入
    [mutableStr1 insertString:@"love" atIndex:5];
    
    //替换
    [mutableStr1 replaceCharactersInRange:NSMakeRange(0, 3) withString:@"tiantian"];//注意中间的NSMakeRange(把下标为0长度为3的字符替换成XX)
    
    //删除
    [mutableStr1 deleteCharactersInRange:NSMakeRange(8, 1)];
    NSLog(@"%@",mutableStr1);
    
#pragma mark 截取字符串空格的方法 （去掉两端，去掉全部用替换）
    - (NSString *)trim:(NSString *)str{
        str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        return [str lowercaseString];
    }
    
    
    
#pragma mark- NSRUL
    
    //URL中文转码

    方法1:
    NSString* encodedString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    方法2:
    NSString * encodedString = (NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)urlString,NULL,NULL,kCFStringEncodingUTF8);
    
    
    /**
     *
     查看方法2参数说明:
     CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding);
     
     因此做出修改,写出方法:
     NSString *encodedString = (NSString *)
     CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
     (CFStringRef)urlString,
     (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
     NULL,
     kCFStringEncodingUTF8);
     
     
     如果在所有的类里都要用到这个方法,可以写成category,然后在头文件import "NSString+URL.h" 即可调用.
     
     - (NSString *)URLEncodedString
     {
     NSString *encodedString = (NSString *)
     CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
     (CFStringRef)self,
     (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
     NULL,
     kCFStringEncodingUTF8);
     return encodedString;
     }
     
     */
#pragma mark- NSNumber
    
    
    /*
     2，字符转int
     int intString = [newString intValue];
     
     3，int转字符
     NSString *stringInt = [NSString stringWithFormat:@"%d",intString];
     
     4，字符转float
     float floatString = [newString floatValue];
     
     5，float转字符
     NSString *stringFloat = [NSString stringWithFormat:@"%f",intString];
     
     */
    
    
    
    
    /*
    创建和初始化类方法	    初始化实例方法	     取值实例方法
    numberWithChar:	    initWithChar:  	 charValue
    numberWithShort:	initWithShort:	 shortValue
    ...	                ...	             ...
    
    */
    NSNumber *intObj = [NSNumber numberWithInt:123];//初始化
    int intNum = [intObj intValue];//取值
    
    //NSNumber 类中的比较方法，返回比较结果-1代表 调用方法的对象比参数对象小 0代表相同， 1代表调用方法的对象比参数对象大
    NSComparisonResult cmpRes = [@9 compare :@8];
    NSLog(@"%ld",cmpRes);
    
    
#pragma mark NSNumber 初始化语法糖
    
//    NSNumber *intObj1 = @123;
//    NSNumber *floatObj = @3.14f;
//    NSNumber *doubleObj = @3.14;
//    NSNumber *longObj = @1234L;
//    NSNumber *boolObj = @YES;

    
#pragma mark NSValue
    
    /*
     NSNumber就是数字对象
     
     
     NSValue对象是用来存储一个C或者Objective－C数据的简单容器。它可以保存任意类型的数据，比如int，float，char，当然也可以是指pointers, structures, and object ids。NSValue类的目标就是允许以上数据类型的数据结构能够被添加到集合里，例如那些需要其元素是对象的数据结构，如NSArray或者NSSet的实例。需要注意的是NSValue对象一直是不可枚举的。
     
     */
    
    
    
    int pm2_5 = [string intValue];
    
#pragma mark- NSArray
    
    
    //快速求数组最大值
    [array valueForKeyPath:@"@max.floatValue"]
    
    //创建
    NSArray *arr = [[NSArray alloc]initWithObjects: @1, @2, @"zz", @5.2, @7, nil];
   
    
    //便利构造器 列表结尾标志nil不能省略，否则会导致crash，参数列表中的对象用逗号隔开
    NSArray *arr1 = [NSArray arrayWithObjects:@1,@2,@"zhouqiang", nil];
    NSArray *arr2 = [NSArray arrayWithArray:arr];
   
    //根据保存了N个对象的C数组 创建OC的不可变数组对象 第一个参数是C语言数组，但保存OC对象，第二个参数 <= C语言数组元素的个数
    id array[] = {@1,@3,@5};
    NSArray *arr3 = [NSArray arrayWithObjects:array count:1];
    NSArray *arr4 = [[NSArray alloc]initWithObjects:array count:3];
    
    
    //2.获取一个指定数组对象的元素个数
    NSInteger count = [arr4 count];
    NSLog(@"%ld",count);
    
    //数组的语法糖形式,数组的写法为@[对象列表（逗号分隔）]
    NSArray *arr5 = @[@1 ,@2 ,@3, @"a"];
    NSLog(@"%@",arr5);
    
    
    for (int i = 0; i < [arr5 count]; i ++) {
        NSLog(@"%@",[arr5 objectAtIndex:i]);
        //数组获取指定下标对象的语法糖
        NSLog(@"%@",arr5[i]);
    }
    
    //获取指定对象在数组中的下标
    //如果该数组存在指定对象，返回的结果在 [0 , count) 之间，否则返回长整型的最大值
    NSInteger index = [arr5 indexOfObject:@"a"];
    NSLog(@"%ld",index);
    
    //判断某个指定对象是否包含在数组中
    BOOL result11 = [arr5 containsObject:@666];
    
    
    //为不可变数组添加对象，返回一个新数组，不改变原来数组
    NSArray *arr6 = [arr5 arrayByAddingObject:@"cc"];
    NSLog(@"arr6:%@",arr6);
    
    //把指定数组中的所有对象按照顺序添加给调用方法的原数组，产生新的结果数组
    NSArray *arr7 = [arr6 arrayByAddingObjectsFromArray:@[@99, @88]];
    NSLog(@"arra7:%@",arr7);
    
    
#pragma mark 可变数组
    NSMutableArray *mutableArr1 = [[NSMutableArray alloc]init ];
    
    
    NSMutableArray *mutableArr2 = [NSMutableArray array ];
    
    
    
    //---添加对象---
    [mutableArr2 addObject:@1];
    NSLog(@"%@",mutableArr2);
    
    //把一个给定的数组中的所有对象添加到可变数组中
    [mutableArr2 addObjectsFromArray:@[@2, @3, @4]];
    NSLog(@"%@",mutableArr2);
    
    
    //---插入、替换、交换 对象---
    //给指定下标插入一个对象
    [mutableArr2 insertObject:@"hanPig" atIndex:1];
    NSLog(@"%@",mutableArr2);
    
    //替换指定下标的对象
    [mutableArr2 replaceObjectAtIndex:2 withObject:@"hanPiPi"];
    NSLog(@"%@",mutableArr2);
    //替换指定下标的对象 语法糖形式
    mutableArr2[2] =@"zhuzhu";
    NSLog(@"%@",mutableArr2);
    
    //交换两个指定下标的对象
    [mutableArr2 exchangeObjectAtIndex:1 withObjectAtIndex:3];
    NSLog(@"%@",mutableArr2);
    
    id temp = mutableArr2[1];
    mutableArr2[1] = mutableArr2[3];
    mutableArr2[3] = temp;
    NSLog(@"%@",mutableArr2);
    
    //删除指定下标的数组元素
    [mutableArr2 removeObjectAtIndex:1];
    NSLog(@"%@",mutableArr2);
    
    //删除数组所有元素，但是数组对象依然存在，方便二次保存新数组元素
    [mutableArr2 removeAllObjects];
    NSLog(@"%@",mutableArr2);
    
    
    //用关键字符串切分原字符串，生成一个由子字符串组成的数组并返回
    NSString *str = @"haha|hehe";
    NSArray *substrs = [str componentsSeparatedByString:@"|"];
    NSLog(@"%@",substrs);
    
    
    
    
    /*
     
     下面示例需要的函数：
     
     void bubbleSort(int *array,int count, BOOL(*point)(int, int )){
     for (int i = 0; i < count - 1; i ++) {
     for (int j = 0; j < count - i - 1; j ++) {
     if (point (array[j],array[j + 1])) {
     int temp = array[j];
     array[j] = array[j + 1];
     array[j + 1] = temp;
     }
     }
     }
     }
     
     BOOL isMax(int a ,int b){
     return a  > b ? YES : NO;
     }
     
     BOOL isMin(int a ,int b){
     return a < b ? YES : NO;
     }
     
     */
    
    
    int cArray[8] = {1,23,42,12,35,85,6,9};
    bubbleSort(cArray, 8, isMax);
    for (int i = 0; i < 8; i ++) {
        printf("%d ",cArray[i]);
    }
    
    NSArray *originalArr = @[@15,@66, @2];
    NSArray *sortedArr = [originalArr sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"%@",sortedArr);
    
    //NSNumber 类中的比较方法，返回比较结果-1代表 调用方法的对象比参数对象小 0代表相同， 1代表调用方法的对象比参数对象大
    NSComparisonResult cmpRes = [@9 compare :@8];
    NSLog(@"%ld",cmpRes);
    
    
    
        NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:originalArr];
        objc_sorted_array(mutableArray, @selector(compare:));
    
        NSLog(@"%@",mutableArray);
    

    
    
    
    

    
    
    
    
#pragma mark- NSDictionary
#pragma mark 添加键和值  以及其 便利构造器
    NSDictionary *dict1 = [[NSDictionary alloc]initWithObjectsAndKeys:@"zhouqing",@"name",@"25",@"age", nil];
    NSLog(@"%@",dict1);
    
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"hanPig", @"name", @"luolin", @"name", nil];//重复的键值对不会被保存在字典中
    NSLog(@"%@",dict2);
    
    NSDictionary *dic = @{@"key1":@"value1",@"key2":@"value2"};
    
#pragma mark 传入数组创建字典
    
    NSArray *allkeys = @[@1, @2];
    NSArray *allValue = @[@"shuxue",@"yuwen"];//两个数组长度必须相等
    NSDictionary *dict3 = [NSDictionary dictionaryWithObjects:allValue forKeys:allkeys];
    NSLog(@"%@",dict3);
    
#pragma mark 获取字典的键和值
    
    NSArray *keys = [dict1 allKeys];
    NSLog(@"%@",keys);
    
    
    
#pragma mark 键/值的互相查找
    
    
    NSString *currentValue = [dict1 objectForKey:@"name"];//根据键返回值
    NSLog(@"%@",currentValue);
    
    
    NSArray *keysOfObject = [dict1 allKeysForObject:@"zhouqing"];//根据值返回键(因为值有可能重复，所以会返回多个键 allKeys)
    NSLog(@"%@",keysOfObject);

#pragma mark 可变字典
   
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"95", @"score", nil];
    NSLog(@"%@",mutableDict);
    
    //将不可变字典变为可变字典
    NSMutableDictionary *mutableDict1 = [NSMutableDictionary dictionaryWithDictionary:dict1];
#pragma mark 可变字典 添加/修改键值对
    [mutableDict setObject:@"english" forKey:@"lesson"];//如果没有这个键，则添加，如果有，则修改。
    [mutableDict setObject:@"02" forKey:@"lesson"];

    mutableDict [@"score"] = @"88";//setObject 的语法糖形式
    
    
#pragma mark 移除键值对

    [mutableDict removeObjectForKey:@"lesson"];
    [mutableDict removeObjectsForKeys:@[@"lesson", @"score" ]];
    [mutableDict removeAllObjects];
    NSLog(@"%@",mutableDict);
    
    
#pragma mark- 集合
    /**无序 互异 确定**/
    
    NSSet *set1 = [[NSSet alloc]initWithObjects:@1,@2,@3, nil];
    NSSet *set2 = [NSSet setWithObjects:@2, nil];
    
    //用数组作为参数创建集合对象，(因为其互异性)某种意义上可以将数组中重复元素过滤掉
    NSSet *set3 = [NSSet setWithArray:arr1];
    NSSet *set4 = [NSSet setWithArray:@[@1,@2]];
    
#pragma mark 集合的相关用法
    //集合的个数
    set1.count;
    
    //判断一个给定的对象是否包含在集合中
    BOOL isContain = [set1 containsObject:@2];
    
    //获取集合中的某个对象
    id object = [set1 anyObject];
    
    //判断接收消息的集合与参数集合是否相交（两个集合中至少有一个对象是相同的）
    BOOL isIntersects = [set1 intersectsSet:set2];
    
    //判断接收消息的集合是否是参数集合的子集
    BOOL result2 = [set1 isSubsetOfSet:set4];
    
#pragma mark 可变集合
    NSMutableSet *mutableSet = [NSMutableSet setWithSet:set4];
    //集合添加对象
    [mutableSet addObject:@8];
    NSLog(@"%@",mutableSet);
    
    [mutableSet addObjectsFromArray:@[@9,@6,@"linpig"]];
    NSLog(@"%@",mutableSet);
    
    //移除对象
    [mutableSet removeObject:@2];
    NSLog(@"%@",mutableSet);
    
    [mutableSet removeAllObjects];
    NSLog(@"%@",mutableSet);
#pragma mark 计数集合-countSet 添加了记数功能
    NSCountedSet *countSet = [NSCountedSet setWithSet:set4];
    [countSet addObjectsFromArray:@[@1,@1,@2,@2]];
    NSLog(@"%ld",[countSet countForObject:@1]);
    NSLog(@"%@",countSet);

#pragma mark 有序集合
    NSOrderedSet *set = [NSOrderedSet orderedSetWithArray:array];
    
    
    
    
    
    
#pragma mark- 数组排序
    
    /***
     
     不可变数组排序，并不改变原数组内容，而是会产生一个新的数组
     compare:方法时数值类NSNumber提供的一个对象比较的方法，返回值为NSCompqrisionResult枚举类型，包含三个值 -1 0 1 （升序 相同 降序）
     该数组排序的方法是依据compare：方法的返回值来产生数组元素交换的。比较结果如果为1才产生交换，所以默认结果为升序的
     SEL是类型定义的一个表示方法的选择器的结构体指针类型
     typedef srtuct objc_selector * SEL
     可以通过@selector（方法名）的方式获取SEL类型的选择器

     */
#pragma mark sortedArrayUsingSelector

    NSArray *arr01 = @[@45,@28,@9,@3,@33];
    NSArray *arrRes =  [arr1 sortedArrayUsingSelector:@selector(compare:)];//两个相比 结果为1(降序)时交换（这种只能升序）
    NSLog(@"%@",arrRes);

    
    NSArray *sotredImArr = [originalArr sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"%@",sotredImArr);
    
    NSArray *numerStrArr = @[@"1",@"12", @"3", @"35", @"22" , @"21"];
    NSArray *numerSortedArr = [numerStrArr sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"%@",numerSortedArr);
    
#pragma mark sortedArrayUsingComparator
    
    NSArray *arrRes1 = [arr1 sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj2 compare:obj1];
    }];
    NSLog(@"%@",arrRes1);
    
    
    //利用block 重写compare( sortedArrayUsingComparator 的内部实现)
    NSComparisonResult (^decBlock)(NSNumber *,NSNumber *) = ^(NSNumber *num1, NSNumber *num2){
        return [num2 compare:num1];
    };
    
    NSArray *arrRes2 = [arr1 sortedArrayUsingComparator:decBlock];
    NSLog(@"%@",arrRes2);
    
    
    
    
    
    NSArray *originalImArr = @[@1,@4,@12,@5,@6];
    NSLog(@"%@",originalImArr);
    
  


    
    
    
    
    
    //    /*============================*/
    //    Number *aNumber = [Number numberWithInt:35];
    //    NSLog(@"%@",aNumber);
    //    //type用来控制Number类对象操作数据时 以NSNumber 类型对象为准还是以NSString类型对象为准
    //    aNumber.type = NumberTypeString;
    //    NSLog(@"%@",aNumber);
    //
    //
    //    Number *bNumber = [Number numberWithInt:@12];
    //    bNumber.type = NumberTypeString;
    //    Number *cNumber = [Number numberWithInt:28];
    //    cNumber.type = NumberTypeString;
    //
    //    NSArray *numberArr = @[aNumber,bNumber,cNumber];
    //    NSArray *sortedArr = [numberArr sortedArrayUsingSelector:@selector(compareAscending:)];
    //    NSLog(@"%@",sortedArr);
    
    
#pragma mark Block
    //Block是OC2.0提出的新的语法特性，本质上是匿名函数。可以类比C语言中的函数指针
    BOOL (*p)(int,int) = NULL;
    //block 匿名函数体内需要访问局部变量时，局部变量数据之前是需要通过__block修饰，意思是告诉匿名函数可以在函数体内正常访问
    __block int count1 = 0;
    int (^ maxBlock)(int ,int ) =  ^int(int a,int b){
        count1++;
        return a > b ? a : b;
    };
    
    NSLog(@"%d",maxBlock(3,5));
    
    
    
    
#pragma mark 利用block重写compare
    //相当于 重写 sortedArrayUsingSelector 里的compare
    NSComparisonResult (^ascBlock)(NSNumber *,NSNumber *) = ^(NSNumber *num1,NSNumber *num2){
        return [num1 compare:num2];
    };
    //数组的block排序方法
    NSArray *blockSortedArr = [originalImArr sortedArrayUsingComparator:ascBlock];
    NSLog(@"%@",blockSortedArr);
    
    
    NSComparisonResult (^desBlock)(NSNumber *,NSNumber *) = ^(NSNumber *num1,NSNumber *num2){
        return [num2 compare:num1];
    };
    NSArray *blockSortArr2 = [originalImArr sortedArrayUsingComparator:desBlock];
    NSLog(@"%@",blockSortArr2);
    
    
#pragma mark sortedArrayUsingComparator(封装block)
    NSArray *blockSotr = [originalImArr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj2 compare:obj1];
    }];
    NSLog(@"%@",blockSotr);
    
    
    //比较字符型数组
    NSArray *blockStr = [numerStrArr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        int leftNum = [obj1 intValue];
        int rightNum = [obj2 intValue];
        return leftNum < rightNum ?
        NSOrderedAscending : NSOrderedDescending;
    }];
    
    NSLog(@"%@",blockStr);
    
    
#pragma mark sortDescriptorWithKey: ascending:
    Person *aPerson = [Person personWithName:@"Duck" age:88];
    Person *bPerson = [Person personWithName:@"HanPig" age:19];
    Person *cPerson = [Person personWithName:@"Lee" age:45];
    
    NSArray *personList = @[aPerson, bPerson, cPerson];
    //NSLog(@"%@",personList);
    
    NSSortDescriptor *nameDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    NSSortDescriptor *ageDescripotor = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:YES];
    NSLog(@"%@",nameDescriptor);//LOG:(name, descending, compare:)
    
    
#pragma mark sortedArrayUsingDescriptors
    NSArray *sortList = [personList sortedArrayUsingDescriptors:@[nameDescriptor,ageDescripotor]];
    NSLog(@"%@",sortList);
    
    
    

    
    
    
    
    
    
#pragma mark-  三大集合类的快速枚举
    
    
    /***
     经典for循环
     for in (NSFastEnumeration)
     makeObjectsPerformSelector
     kvc集合运算符
     enumerateObjectsUsingBlock
     enumerateObjectsWithOptions(NSEnumerationConcurrent)
     dispatch_apply
     
     */
    
    
    //数组的快速枚举
    NSArray *testArray = @[@1, @2, @3, @4];
    for (id object in testArray) {
        NSLog(@"%@",object);
    }
    
    //倒序遍历
    for (NSString * str in [array reverseObjectEnumerator]) {
        NSLog(@"%@",str);
    }
    
    //使用block 遍历
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%@",obj);
    }];
    
    //block - 倒序
    [array enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%@",obj);
    }];
    
    
    
    //使用block同时遍历字典key，value
    
    //block版本的字典遍历可以同时取key和value（forin只能取key再手动取value），如：
    NSDictionary *dict = @{@"a": @"1", @"b": @"2"};
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSLog(@"key: %@, value: %@", key, obj);
    }];
    
    //对于耗时且顺序无关的遍历，使用并发版本 NSEnumerationConcurrent
    [array enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(Sark *sark, NSUInteger idx, BOOL *stop) {
        [sark doSomethingSlow];
    }];
    
    
    //字典的快速枚举   字典快速枚举得到的是一个一个键 我们依然需要在快速枚举体内通过键去获取与之对应的值
    for (id key  in dict) {
        NSLog(@"%@:%@,key" ,dict[key]);
    }
    
    //对集合做快速枚举 可以得到每一个对象
    for (id object in set) {
        NSLog(@"%@",object);
    }
    
#pragma mark- NSDate
    
    //date便利构造器创建的对象是当前的系统时间，并且无论身处哪个区，得到的都是零时区的时间
    NSDate *date1 = [NSDate date];
    NSLog(@"%@",date1);
    
    //NSTimeInterval(double 类型) 用以表示以秒为单位的时间间隔
    NSDate *date2 = [NSDate dateWithTimeIntervalSinceNow:3600];//以当前系统时间为准，增加指定时间间隔（3600s）后的时间对象
    NSLog(@"%@",date2);
    
    //根据给定的时间间隔以及标准时间点1970年1月1日0点，推算出 相应的 时间对象
    NSDate *date3 = [NSDate dateWithTimeIntervalSince1970:3600];
    NSLog(@"%@",date3);
    
    //根据两个时间信息，获取对应的时间间隔
    NSTimeInterval timeInterval1 = [date2 timeIntervalSinceDate:date1];
    NSLog(@"%f",timeInterval1);
    
    
    NSTimeInterval timeInterval2 = [date2 timeIntervalSinceReferenceDate];
    NSLog(@"%f",timeInterval2);
    
    //获取时间戳
    NSTimeInterval timeStamp = [date2 timeIntervalSince1970];
    NSLog(@"%f",timeStamp);
    
#pragma mark

    //获取系统时间(字符串)
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSString *localTime = [formatter stringFromDate:date];
    //NSLog(@"~~~~~~%@",localTime);

    +(NSString*)getCurrentDate
    {
        NSString *result = @"";
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyyMMddHHmmss"];
        result = [formatter stringFromDate:[NSDate date]];
        return  result;
    }


    //获取系统时间(NSDate)
    [NSTimeZone systemTimeZone];//时区
    NSTimeInterval timeInterval = [[NSTimeZone systemTimeZone] secondsFromGMTForDate:[NSDate date]];//当前时区 和 (某date)时区的 差()
    NSTimeInterval time2 =[[NSTimeZone systemTimeZone] secondsFromGMT];//当前时区 和 零时区的 差

    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];//零时区 同[NSDate date]
    NSDate *dateNow = [NSDate dateWithTimeIntervalSinceNow:timeInterval];//当前系统时间


    
    //时间戳转换时间
    NSTimeInterval timeInterval = [time doubleValue] //?+ 288000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-mm-dd HH:mm:ss"];
    NSString *timeStr = [formatter stringFromDate:date];
    

    //字符串转时间
    - (NSDate *)getDateWithString:(NSString *)str{
        NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init] ;
        [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_CN"] ];
        [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        NSDate *startDate = [inputFormatter dateFromString:str];
        return startDate;
    }

#pragma mark NSDateformatter
    
    /*
     NSFormatter 类
     字符串和 NSDate 相互转换的方法
     创建对象 使用对象调用以下两个方法
     - (NSString *)stringFromDate:(NSDate *)date;【转换后-当前时区】
     - (NSDate *)dateFromString:(NSString *)string;【转换后-零时区】
     */
    
    //NSDateFormatter 根据formatter创建对象，来对日期对象做格式化输出
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    //根据给定的样式来格式化显示日期和时间 字符串
    [formatter setDateStyle:NSDateFormatterFullStyle];
    [formatter setTimeStyle:NSDateFormatterFullStyle];
    
    //用字符串来自定义输出样式
    [formatter setDateFormat:@"G yyyy-MM-dd EEEE hh:mm:ss zzzz a"];
    
    NSString *time = [formatter stringFromDate:date1];
    NSLog(@"%@",time);// 公元 2015-08-01 星期六 07:50:35 中国标准时间 下午
    
    NSDate *t = [formatter dateFromString:time];
    NSLog(@"%@",t);
    
    //打印所有时区名
    //NSArray *names = [NSTimeZone knownTimeZoneNames];
    //NSLog(@"%@",names);
    
#pragma mark 给定时区
    
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:3600*8]];
    //[formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Bangkok"]];
    [formatter setDateFormat:@"y-MM-dd HH:mm:ss zz"];
    NSString *timeZone = [formatter stringFromDate:date1];
    NSLog(@"%@",timeZone);
    
#pragma mark- NSTimer
    
    
    //注意这两者的区别
    NSTimer *timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(gotogo) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(gotogo) userInfo:nil repeats:YES];
    [timer fire];

    
    
    
    
    /*
     
     + (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti invocation:(NSInvocation *)invocation repeats:(BOOL)yesOrNo;
     
     
     + (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti invocation:(NSInvocation *)invocation repeats:(BOOL)yesOrNo;
     
     
     创建返回一个NSTimer对象和时间表，在当前的默认模式下循环调用的方法
     + (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo;
     
     
     + (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget"表示发送的对象，如 self" selector:(SEL)aSelector"方法选择器，在间隔时间内，调用一个实例方法" userInfo:(id)userInfo"可以为nil，当定时器失效时，由你指定的对象保留和释放该选择器" repeats:(BOOL)yesOrNo"当为YES时，定时器会不断循环知道失效或被释放，当NO时，定时器循环一次就失效";
     
     
     - (instancetype)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)ti target:(id)t selector:(SEL)s userInfo:(id)ui repeats:(BOOL)rep NS_DESIGNATED_INITIALIZER;
     
     
     //启动
     - (void)fire;
     
     //停止
     - invalidate
     
     //设置
     – isValid //是否在运行
     – fireDate
     – setFireDate: //重新设置定时器开始运行的时间
     – timeInterval //定时器延时时间
     – userInfo
     
     */
    


#pragma mark- 类的扩展
    
#pragma mark 类目 Category
    
    /*
     作用：
     为没有源码的类添加方法 （一般用于系统类），通过Category 添加的方法会称为原类的一部分。从而达到扩展一个类的功能。
     1、将类别实现分散到多个不同文件或多个不同框架中
     2、创建私有方法的前向引用
     3、向对象添加非正式协议
     定义：
     1、新建文件
     2、选择Objective-C Category 模板 
     3、填写类名和分类名 命名一般为:  (要扩展的 在class里选)类名 + Additions
     4、.h 文件添加方法声明   .m 文件添加方法实现
     5、需要使用的地方调用
     特点：一个类可以定义多个类目，类目的作用可以沿袭到子类，即 父类的类目中的方法子类可以使用super关键字调用
     局限性：
     1、只能添加方法，无法添加新的实例变量。
     2、如果跟原来类中的方法名重复，则类目覆盖原来的方法，因为类目具有更高的优先级。
     */
    
    
#pragma mark 延展 Extension
    /*
     延展可以为当前类扩展私有方法、属性、以及实例变量的声明。私有方法的实现、属性以及实例变量的使用都必须在当前类的m文件中，不提供对外访问，体现了封装的思想
     
     某些情况下，我们需要声明一个@property，它对外是只读的（readonly），而对内是可读写的（readwrite），这时，可以通过Extensions实现
     */
    
    
#pragma mark 协议 Protocol
    
    /*
     协议是一堆方法的声明，只有头文件。某个对象遵守了协议，就需要实现协议中的方法（接收协议的对象实现协议中的方法）。OC的协议都是间接或者直接扩展自NSObject协议的。
     
     协议中的方法是默认实现的，即@required-必须 关键字@optional-可选
     如何遵守
     1、委托方：id <协议名> dalegate 表示遵守了指定协议的对象，意思为只要遵守该协议的对象都可以成为当前类的代理对象，并不关心代理对象的类型
     2、执行方：@interface 类名 : NSObject<协议名> 表示当前类遵守该协议
     3、建立代理关系：委托方.delegate = 代理方 
     4、委托方通知代理方执行对应的协议方法（如果需要）：例如：[agirl notifyDelegate(通知代理方执行的方法，如果需要，需要委托方自行声明和实现)];
     - (void)notifyDelegate{
           if (self.delegate && [self.delegate respondsToSelector:@selector(makeMoney)]) {
           [self.delegate makeMoney];
           }
     }
     
     */
    
    
    
#pragma mark- 内存管理
    
    /*
     iOS 支持的内存管理有两种方式：MRC，手动引用计数 和 ARC 自动引用计数（基于MRC）。
     影响引用计数的方法：增加【+alloc、-retain、-copy、new、mutableCopy】  减少【-release、-autorelease】
     - dealloc 是继承自父类的方法，当对象引用计数为0时，由对象自动调用
     */
    
#pragma mark 使用自动释放池
    
    //任何接收到autorelease消息的对象都会被保存在就近的自动释放池中，只要自动释放池存在，该对象的retainCount值就不产生变化，否则一旦自动释放池销毁，保存在自动释放池中的对象，就会立即接收并执行一遍ralease方法来使自己的retaCount-1
    
#pragma mark 内存管理的基本原则
    
    /*
     1、任何时刻对象引用的计数的增减应该保存平衡，只有当对象的引用计数减小到0，运行时系统才会自动调用对象的dealloc方法销毁内存。
     2、凡是使用alloc new copy mutableCopy retain 让引用计数增加了。就应该在适当地时候使用release或者autorelease 让其减小
     3、我们需要释放自己所拥有的对象，无权释放自己不拥有的对象
     */
    
#pragma mark 内存管理策略
    
    /*
     1 你拥有你所创建的对象
     2 可以使用retain来获取一个对象的所有权。有两种情形可以使用retain来获取对象的所有权：a.在初始化方法或者setter方法中，如果一个传递过来的对象要被当做属性值保存，则应该使用retain，让该对象引用计数+1 b.为防止一个对象因为单方面的影响而变得不可用时，可以先使用retain获取该对象的所有权
     3 如果该对象不再需要，应当使用release或者autorelease放弃该对象的所有权，通常放弃所有权也称作释放对象
     4 不能释放不拥有的对象
     */
    
    
#pragma mark copy方法
    /*
     跟retain不同，一个对象想要copy，生成自己的副本，需要实现NSCopying协议，定义copy细节（如何copy）。如果没有接受NSCopying协议而给对象发送copy消息，会引起crash
     一个类的实例对象能够使用copy，前提是该类遵守了NSCopying协议，并实现了copyWithZone:协议方法
     
     声明：
     @interface Person : NSObject<NSCopying>//遵守拷贝协议
     @end
    
     
     实现：
     如果一个自定义类对象要使用copy方法拷贝对象，则需要对应的实现如下方法，当对象调用copy方法时会自动调用如下协议方法，创建拷贝对象时需要使用allocWithZone:方法根据原内存信息开辟空间，并将原对象的属性值赋值给拷贝出来的对象
     
     @implementation Person
     - (id)copyWithZone:(NSZone *)zone{
     Person *copyedPerson = [[Person allocWithZone:zone]initWithName:self.name age:self.age];
     return copyedPerson;
     }
     @end
     
     
     调用：
     Person *cperson = [aperson copy];
     NSLog(@"%@",cperson.name);
    
    */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    return 0;
}

