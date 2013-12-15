#import "PHTableViewController.h"

@interface PHTableViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation PHTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView insertSubview:self.imageView atIndex:0];
    [self updateImageViewFrame:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self updateImageViewFrame:scrollView];
}

- (void)updateImageViewFrame:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    CGRect f = self.imageView.frame;
    f.origin.y = offset.y/2 - 120;
    self.imageView.frame = f;
}

@end
