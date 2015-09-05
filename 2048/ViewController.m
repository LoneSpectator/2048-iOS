//
//  ViewController.m
//  2048
//
//  Created by GaoMing on 15/9/4.
//  Copyright (c) 2015年 ifLab. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSInteger point;
@property (weak, nonatomic) IBOutlet UILabel *pointLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property NSMutableArray *nums;
@property NSArray *labels;
@property (weak, nonatomic) IBOutlet UILabel *label00;
@property (weak, nonatomic) IBOutlet UILabel *label01;
@property (weak, nonatomic) IBOutlet UILabel *label02;
@property (weak, nonatomic) IBOutlet UILabel *label03;
@property (weak, nonatomic) IBOutlet UILabel *label10;
@property (weak, nonatomic) IBOutlet UILabel *label11;
@property (weak, nonatomic) IBOutlet UILabel *label12;
@property (weak, nonatomic) IBOutlet UILabel *label13;
@property (weak, nonatomic) IBOutlet UILabel *label20;
@property (weak, nonatomic) IBOutlet UILabel *label21;
@property (weak, nonatomic) IBOutlet UILabel *label22;
@property (weak, nonatomic) IBOutlet UILabel *label23;
@property (weak, nonatomic) IBOutlet UILabel *label30;
@property (weak, nonatomic) IBOutlet UILabel *label31;
@property (weak, nonatomic) IBOutlet UILabel *label32;
@property (weak, nonatomic) IBOutlet UILabel *label33;
@property (weak, nonatomic) IBOutlet UIView *gameover;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.labels = @[@[self.label00, self.label01, self.label02, self.label03],
                    @[self.label10, self.label11, self.label12, self.label13],
                    @[self.label20, self.label21, self.label22, self.label23],
                    @[self.label30, self.label31, self.label32, self.label33]];
    self.nums = [[NSMutableArray alloc] init];
    for (int i = 0; i <= 3; i++) {
        [self.nums addObject:[[NSMutableArray alloc] init]];
        for (int j = 0; j <= 3; j++) {
            [self.nums[i] addObject:[NSMutableString stringWithString:@""]];
        }
    }
    self.point = 0;
    self.pointLabel.text = [NSString stringWithFormat:@"%ld", (long)self.point];
    [self start:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)start:(id)sender {
    self.gameover.hidden = YES;
    for (int i = 0; i <= 3; i++) {
        for (int j = 0; j <= 3; j++) {
            self.nums[i][j] = [NSMutableString stringWithString:@""];
        }
    }
    self.point = 0;
    self.pointLabel.text = [NSString stringWithFormat:@"%ld", (long)self.point];
    [self newBlock];
    [self newBlock];
}

- (void)newBlock {
    NSMutableArray *emptyArr = [self emptyBlocks];
    if (emptyArr.count == 0) {
        return;
    }
    long n = random() % emptyArr.count;
    long m = random() % 10;
    if (m <= 6) {
        [emptyArr[n] setString:@"2"];
    } else {
        [emptyArr[n] setString:@"4"];
    }
    [self reloadData];
}

- (NSMutableArray *)emptyBlocks {
    NSMutableArray *emptyArr = [[NSMutableArray alloc] init];
    for (int i = 0; i <= 3; i++) {
        for (int j = 0; j <= 3; j++) {
            if ([self.nums[i][j] isEqualToString:@""]) {
                [emptyArr addObject:self.nums[i][j]];
            }
        }
    }
    return emptyArr;
}

- (void)reloadData {
    for (int i = 0; i <= 3; i++) {
        for (int j = 0; j <= 3; j++) {
            ((UILabel *)self.labels[i][j]).text = [NSString stringWithFormat:@"%@", self.nums[i][j]];
            int n = [((UILabel *)self.labels[i][j]).text intValue];
            switch (n) {
                case 2:
                    ((UILabel *)self.labels[i][j]).backgroundColor = [UIColor colorWithRed:238.0/255.0 green:228.0/255.0 blue:218.0/255.0 alpha:1.0];
                    break;
                case 4:
                    ((UILabel *)self.labels[i][j]).backgroundColor = [UIColor colorWithRed:237.0/255.0 green:224.0/255.0 blue:200.0/255.0 alpha:1.0];
                    break;
                case 8:
                    ((UILabel *)self.labels[i][j]).backgroundColor = [UIColor colorWithRed:241.0/255.0 green:177.0/255.0 blue:121.0/255.0 alpha:1.0];
                    break;
                case 16:
                    ((UILabel *)self.labels[i][j]).backgroundColor = [UIColor colorWithRed:245.0/255.0 green:149.0/255.0 blue:99.0/255.0 alpha:1.0];
                    break;
                case 32:
                    ((UILabel *)self.labels[i][j]).backgroundColor = [UIColor colorWithRed:246.0/255.0 green:124.0/255.0 blue:95.0/255.0 alpha:1.0];
                    break;
                case 64:
                    ((UILabel *)self.labels[i][j]).backgroundColor = [UIColor colorWithRed:244.0/255.0 green:94.0/255.0 blue:59.0/255.0 alpha:1.0];
                    break;
                case 128:
                    ((UILabel *)self.labels[i][j]).backgroundColor = [UIColor colorWithRed:236.0/255.0 green:204.0/255.0 blue:97.0/255.0 alpha:1.0];
                    break;
                case 256:
                    ((UILabel *)self.labels[i][j]).backgroundColor = [UIColor colorWithRed:236.0/255.0 green:204.0/255.0 blue:97.0/255.0 alpha:1.0];
                    break;
                case 512:
                    ((UILabel *)self.labels[i][j]).backgroundColor = [UIColor colorWithRed:236.0/255.0 green:204.0/255.0 blue:97.0/255.0 alpha:1.0];
                    break;
                case 1024:
                    ((UILabel *)self.labels[i][j]).backgroundColor = [UIColor colorWithRed:236.0/255.0 green:204.0/255.0 blue:97.0/255.0 alpha:1.0];
                    break;
                case 2048:
                    ((UILabel *)self.labels[i][j]).backgroundColor = [UIColor colorWithRed:236.0/255.0 green:204.0/255.0 blue:97.0/255.0 alpha:1.0];
                    break;
                default:
                    if (n > 2048) {
                        ((UILabel *)self.labels[i][j]).backgroundColor = [UIColor blackColor];
                    } else {
                        ((UILabel *)self.labels[i][j]).backgroundColor = [UIColor colorWithRed:205.0/255.0 green:193.0/255.0 blue:180.0/255.0 alpha:1.0];
                    }
                    break;
            }
        }
    }
    self.pointLabel.text = [NSString stringWithFormat:@"%ld", (long)self.point];
    if ([self isLoss]) {
        self.gameover.hidden = NO;
    }
}

- (BOOL)isLoss {
    NSMutableArray *emptyArr = [self emptyBlocks];
    if (emptyArr.count != 0) {
        return NO;
    } else {
        for (int i = 0; i <= 2; i++) {
            for (int j = 0; j <= 3; j++) {
                if ([self.nums[i][j] isEqualToString:self.nums[i+1][j]]) {
                    return NO;
                }
            }
        }
        for (int j = 0; j <= 2; j++) {
            for (int i = 0; i <= 3; i++) {
                if ([self.nums[i][j] isEqualToString:self.nums[i][j+1]]) {
                    return NO;
                }
            }
        }
    }
    return YES;
}

- (IBAction)up:(id)sender {
    for (int j = 0; j <= 3; j++) {
        for (int i = 1; i <= 3; i++) {
            [self moveUpWithi:i j:j];
        }
    }
    [self newBlock];
}

- (IBAction)down:(id)sender {
    for (int j = 0; j <= 3; j++) {
        for (int i = 2; i >= 0; i--) {
            [self moveDownWithi:i j:j];
        }
    }
    [self newBlock];
}

- (IBAction)left:(id)sender {
    for (int i = 0; i <= 3; i++) {
        for (int j = 1; j <= 3; j++) {
            [self moveLeftWithi:i j:j];
        }
    }
    [self newBlock];
}

- (IBAction)right:(id)sender {
    for (int i = 0; i <= 3; i++) {
        for (int j = 2; j >= 0; j--) {
            [self moveRightWithi:i j:j];
        }
    }
    [self newBlock];
}

- (void)moveUpWithi:(int)i j:(int)j {
    if (i == 0) {
        return;
    } else if ([self.nums[i][j] isEqualToString:@""]) {
        return;
    } else if ([self.nums[i-1][j] isEqualToString:@""]) {
        [self.nums[i-1][j] setString:[NSString stringWithFormat:@"%@", self.nums[i][j]]];
        [self.nums[i][j] setString:@""];
        [self moveUpWithi:i-1 j:j];
    } else if ([self.nums[i-1][j] isEqualToString:self.nums[i][j]]) {
        [self.nums[i-1][j] setString:[NSString stringWithFormat:@"%d", 2*[self.nums[i-1][j] intValue]]];
        self.point = self.point + [self.nums[i-1][j] intValue];
        [self.nums[i][j] setString:@""];
        return;
    } else {
        return;
    }
}

- (void)moveDownWithi:(int)i j:(int)j {
    if (i == 3) {
        return;
    } else if ([self.nums[i][j] isEqualToString:@""]) {
        return;
    } else if ([self.nums[i+1][j] isEqualToString:@""]) {
        [self.nums[i+1][j] setString:[NSString stringWithFormat:@"%@", self.nums[i][j]]];
        [self.nums[i][j] setString:@""];
        [self moveDownWithi:i+1 j:j];
    } else if ([self.nums[i+1][j] isEqualToString:self.nums[i][j]]) {
        [self.nums[i+1][j] setString:[NSString stringWithFormat:@"%d", 2*[self.nums[i+1][j] intValue]]];
        self.point = self.point + [self.nums[i+1][j] intValue];
        [self.nums[i][j] setString:@""];
        return;
    } else {
        return;
    }
}

- (void)moveLeftWithi:(int)i j:(int)j {
    if (j == 0) {
        return;
    } else if ([self.nums[i][j] isEqualToString:@""]) {
        return;
    } else if ([self.nums[i][j-1] isEqualToString:@""]) {
        [self.nums[i][j-1] setString:[NSString stringWithFormat:@"%@", self.nums[i][j]]];
        [self.nums[i][j] setString:@""];
        [self moveLeftWithi:i j:j-1];
    } else if ([self.nums[i][j-1] isEqualToString:self.nums[i][j]]) {
        [self.nums[i][j-1] setString:[NSString stringWithFormat:@"%d", 2*[self.nums[i][j-1] intValue]]];
        self.point = self.point + [self.nums[i][j-1] intValue];
        [self.nums[i][j] setString:@""];
        return;
    } else {
        return;
    }
}

- (void)moveRightWithi:(int)i j:(int)j {
    if (j == 3) {
        return;
    } else if ([self.nums[i][j] isEqualToString:@""]) {
        return;
    } else if ([self.nums[i][j+1] isEqualToString:@""]) {
        [self.nums[i][j+1] setString:[NSString stringWithFormat:@"%@", self.nums[i][j]]];
        [self.nums[i][j] setString:@""];
        [self moveRightWithi:i j:j+1];
    } else if ([self.nums[i][j+1] isEqualToString:self.nums[i][j]]) {
        [self.nums[i][j+1] setString:[NSString stringWithFormat:@"%d", 2*[self.nums[i][j+1] intValue]]];
        self.point = self.point + [self.nums[i][j+1] intValue];
        [self.nums[i][j] setString:@""];
        return;
    } else {
        return;
    }
}

@end
