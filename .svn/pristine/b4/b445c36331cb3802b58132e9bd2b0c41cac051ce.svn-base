//
//  NSDate+KBExtension.m
//  ClgsUser
//
//  Created by kobe on 16/3/22.
//  Copyright © 2016年 com.xinmengsoft. All rights reserved.
//

#import "NSDate+KBExtension.h"

@implementation NSDate (KBExtension)

/**
 *  isToday
 *
 *  @return YES Or NO
 */
-(BOOL)isToday{
    
    //init instance calendar
    NSCalendar *calendar=[NSCalendar currentCalendar];
    //YMD
    int unit=NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear;
    
    //nowTime
    NSDateComponents *nowTime=[calendar components:unit fromDate:[NSDate date]];
    //sendTime
    NSDateComponents *sendTime=[calendar components:unit fromDate:self];
    
    return (sendTime.year==nowTime.year)&&(sendTime.month==nowTime.month)&&(sendTime.day==nowTime.day);
}

/**
 *  isYesterday
 *
 *  @return YES Or NO
 */
-(BOOL)isYesterday{
    NSCalendar *calendar=[NSCalendar currentCalendar];
    
    NSDate *nowTime=[[NSDate date]dateWithYMD];
    NSDate *sendTime=[self dateWithYMD];
    
    NSDateComponents *TimeGap=[calendar components:NSCalendarUnitDay fromDate:sendTime toDate:nowTime options:0];
    
    return TimeGap.day==1;
}

/**
 *  isThisYear
 *
 *  @return YES Or NO
 */
-(BOOL)isThisYear{
    NSCalendar *calendar=[NSCalendar currentCalendar];
    int unit=NSCalendarUnitYear;
    NSDateComponents *nowTime=[calendar components:unit fromDate:[NSDate date]];
    NSDateComponents *sendTime=[calendar components:unit fromDate:self];
    return sendTime.year==nowTime.year;
    
}

/**
 *  DateFormatter With YMD
 *
 *  @return Time
 */
-(NSDate *)dateWithYMD{
    
    NSDateFormatter *dateFmt=[[NSDateFormatter alloc]init];
    dateFmt.dateFormat=@"yyyy-MM-dd";
    NSString *sendTime=[dateFmt stringFromDate:self];
    return [dateFmt dateFromString:sendTime];
    
}

/**
 *  DeltaWithNow
 *
 *  @return TimeGap
 */
-(NSDateComponents *)deltaWithNow{
    NSCalendar *calendar=[NSCalendar currentCalendar];
    //Hour Minute Second
    int unit=NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}

+(NSString *)caculatorTime:(NSDate *)date{
    
    NSDateFormatter *fmt=[[NSDateFormatter alloc]init];
    fmt.dateFormat=@"EEE MMM dd HH:mm:ss Z yyyy";
    NSString *tempString;
    
    if (date.isThisYear) {
        if (date.isToday) {
            NSDateComponents *cmps=[date deltaWithNow];
            if (cmps.hour>=1) {
                tempString=[NSString stringWithFormat:@"%ld小时前",cmps.hour];
            }else if (cmps.minute>=1){
                tempString=[NSString stringWithFormat:@"%ld分钟前",cmps.minute];
            }else{
                tempString=@"刚刚";
            }
        }else if (date.isYesterday){
            fmt.dateFormat=@"昨天 HH:mm";
            tempString=[fmt stringFromDate:date];
        }else{
            fmt.dateFormat=@"MM-dd HH:mm";
            tempString=[fmt stringFromDate:date];
        }
    }else{
        fmt.dateFormat=@"yyyy-MM-dd";
        tempString=[fmt stringFromDate:date];
    }
    return tempString;
}
@end
