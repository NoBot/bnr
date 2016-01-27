//
//  ViewController.m
//  Quiz
//
//  Created by Hyon Sim on 4/15/15.
//  Copyright (c) 2015 bWERX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation ViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil
                          bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Create two arrays filled with questions and answers
        // and make the pointers point to them
        self.questions = @[@"From what is cognac made?",
                           @"What is 7+7?",
                           @"What is the captial of Vermont?"];
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }
    // Return the address of the new object
    return self;
}

- (IBAction) showQuestion:(id)sender{
    // Step to the next questions
    self.currentQuestionIndex++;
    // Am i past the last question?
    if (self.currentQuestionIndex == [self.questions count]){
        // Go back to the first question
        self.currentQuestionIndex = 0;
    }
    
    // Get the string at the index in the questions array
    NSString *question = self.questions[self.currentQuestionIndex];
    
    // Display the string in the question label
    self.questionLabel.text = question;
    
    // Reset the anser label
    self.answerLabel.text = @"???";
}

- (IBAction) showAnswer:(id) sender{
    // What is the answer to the current question?
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    // Display it in the answer label
    self.answerLabel.text = answer;
}

@end
