#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    switch (monthNumber) {
        case 1: {
            return @"January";
        }
        
        case 2: {
            return @"February";
        }
        
        case 3: {
            return @"March";
        }
        
        case 4: {
            return @"April";
        }
        
        case 5: {
            return @"May";
        }
        
        case 6: {
            return @"June";
        }
        
        case 7: {
            return @"July";
        }
        
        case 8: {
            return @"August";
        }
        
        case 9: {
            return @"September";
        }
        
        case 10: {
            return @"October";
        }
        
        case 11: {
            return @"November";
        }
        
        case 12: {
            return @"December";
        }
            
        default: return nil;
    }
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSCalendar *Calendar = [NSCalendar currentCalendar];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate *dateFromString = [dateFormatter dateFromString:date];
    
    return (long)[[Calendar components: NSCalendarUnitDay fromDate:dateFromString] day];
    
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru"];
    [dateFormatter setDateFormat:@"E"];
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    if (dateString == NULL) {
        return NULL;
    } else {
    dateString = [NSString stringWithFormat:@"%@%@",[[dateString substringToIndex:1] uppercaseString],[dateString substringFromIndex:1] ];
    
    return dateString;
    }
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDate *currentDate = [NSDate now];
    
    
    NSDateComponents *currentWeekDay = [currentCalendar components:NSCalendarUnitWeekday | NSCalendarUnitHour fromDate:currentDate];
    
    NSDateComponents *subtractComponent = [NSDateComponents new];

    [subtractComponent setDay:-([currentWeekDay weekday] - 2)];
    [subtractComponent setHour: -[currentWeekDay hour]];
    [subtractComponent setMinute:0];
    [subtractComponent setSecond:0];
    
    NSDate *beginningOfWeek = [currentCalendar dateByAddingComponents:subtractComponent toDate:currentDate options:0];
    
    [subtractComponent setDay: 7 - [currentWeekDay weekday] + 1];
    
    NSDate *endOfWeek = [currentCalendar dateByAddingComponents:subtractComponent toDate:currentDate options:0];
    
    BOOL isEarlier = [date compare: beginningOfWeek] == NSOrderedAscending;
    BOOL isLater = [date compare:endOfWeek] == NSOrderedDescending;
    
    if (isEarlier || isLater) {
        return NO;
    }
    
    return YES;
    
}

@end
