//
//  CardChooserViewController.m
//  CardViewer
//
//  Created by Ujwal Manjunath on 2/27/13.
//  Copyright (c) 2013 Ujwal Manjunath. All rights reserved.
//

#import "CardChooserViewController.h"
#import "CardDisplayViewController.h"
@interface CardChooserViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *suitSegmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *rankLabel;
@property(nonatomic)NSUInteger rank;
@property(nonatomic,readonly)NSString *suit;
@end

@implementation CardChooserViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
        if([segue.identifier isEqualToString:@"showCard"])
        {
            if([segue.destinationViewController isKindOfClass:[CardDisplayViewController class]]){
                CardDisplayViewController *cardDisplayViewController = (CardDisplayViewController *)segue.destinationViewController;
                cardDisplayViewController.rank = self.rank;
                cardDisplayViewController.suit = self.suit;
                cardDisplayViewController.title = [[self rankAsString]stringByAppendingString:self.suit];
            }
        }
}

-(NSString *)rankAsString
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"][self.rank];
}

-(void)setRank:(NSUInteger)rank
{
    _rank=rank;
    self.rankLabel.text = [self rankAsString];
}

-(NSString *)suit
{
    return [self.suitSegmentedControl titleForSegmentAtIndex:self.suitSegmentedControl.selectedSegmentIndex];
}

- (IBAction)changeRank:(UISlider *)sender
{
    if(sender.value)
    {
    self.rank = round(sender.value);
    }
}


@end
