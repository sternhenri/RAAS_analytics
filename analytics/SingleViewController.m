//
//  ViewController.m
//  analytics
//
//  Created by Henri Stern on 27/02/16.
//  Copyright © 2016 Henri. All rights reserved.
//

#import "SingleViewController.h"
#import "RAASNetworkManager.h"
#import "RAASSettings.h"
#import "TotalStats.h"

@interface SingleViewController ()
@property (nonatomic) RAASSettings *settings;
@property (nonatomic) NSNumber *clientID;
@property (nonatomic) TotalStats *stats;
@property (nonatomic) IBOutlet UILabel *company;
@property (nonatomic) IBOutlet UILabel *invitesSent;
@property (nonatomic) IBOutlet UILabel *invitesClicked;
@property (nonatomic) IBOutlet UILabel *downloads;
@property (nonatomic) IBOutlet UILabel *signups;
@property (nonatomic) IBOutlet UILabel *totalConv;
@property (nonatomic) IBOutlet UILabel *emailConv;
@property (nonatomic) IBOutlet UILabel *smsConv;
@end

@implementation SingleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.clientID = @1;
    [self getTotals];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) getTotals{
    RAASNetworkManager *client = [RAASNetworkManager sharedClient];
    id params = @{@"client_id": self.clientID
                  };
    NSString *path = [NSString stringWithFormat:@"/referral_stats.json"];
    
    [client GET:path parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        self.stats = [[TotalStats alloc] initWithAttributes:responseObject];
        [self displayStats];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Got failure");
    }];
}

- (void) displayStats{
    self.company.text = @"Nuzzle";
    self.invitesSent.text = [self.stats.sentCount stringValue];
    self.invitesClicked.text = [self.stats.hitCount stringValue];
    self.signups.text = [self.stats.registrationCount stringValue];
    self.downloads.text = [self.stats.downloadCount stringValue];
    self.totalConv.text = self.stats.percentConverted;
    self.emailConv.text = self.stats.percentConvertedEmail;
    self.smsConv.text = self.stats.percentConvertedSMS;
}

@end
