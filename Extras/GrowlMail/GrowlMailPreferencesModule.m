/*
 Copyright (c) The Growl Project, 2004-2005
 All rights reserved.

 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 3. Neither the name of Growl nor the names of its contributors
 may be used to endorse or promote products derived from this software
 without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 OF THE POSSIBILITY OF SUCH DAMAGE.
*/
//
//  GrowlMailPreferencesModule.m
//  GrowlMail
//
//  Created by Ingmar Stein on 29.10.04.
//

#import "GrowlMailPreferencesModule.h"
#import "GrowlMailNotifier.h"
#import "GrowlMail.h"


@interface MailAccount(GrowlMail)
+ (NSArray *) remoteMailAccounts;
@end

static BOOL isLocalAccount(MailAccount *account) {
	Class localAccountClass = NSClassFromString(@"LocalAccount");
	return localAccountClass && [account isKindOfClass:localAccountClass];
}
static BOOL isCalDAVAccount(MailAccount *account) {
	Class CalDAVAccountClass = NSClassFromString(@"MailCalDAVAccount");
	return CalDAVAccountClass && [account isKindOfClass:CalDAVAccountClass];
}

@implementation MailAccount(GrowlMail)
+ (NSArray *) remoteMailAccounts; {
	//we check this because on 10.6 mailAccounts includes additional unwanted caldav account references
	//On some systems, even though they're running Snow Leopard, either this check is failing or this method no longer works as advertised. For this reason, plus to exclude CalDAV accounts on Leopard (if +mailAccounts includes them there), we need to do additional filtering below.
	SEL mailAccountSelector = @selector(mailAccounts);
	if([MailAccount respondsToSelector:@selector(mailAccountsExcludingCalDAVAccounts)])
		mailAccountSelector = @selector(mailAccountsExcludingCalDAVAccounts);
	
	NSArray *mailAccounts = [MailAccount performSelector:mailAccountSelector];
	NSMutableArray *remoteAccounts = [NSMutableArray arrayWithCapacity:[mailAccounts count]];
	for(id account in mailAccounts) {
		if (!(isLocalAccount(account) || isCalDAVAccount(account)))
			[remoteAccounts addObject:account];
	}

	return remoteAccounts;
}
@end

@implementation GrowlMailPreferencesModule
- (void) awakeFromNib {
	NSTableColumn *activeColumn = [accountsView tableColumnWithIdentifier:@"active"];
	[[activeColumn dataCell] setImagePosition:NSImageOnly]; // center the checkbox
	[growlMailVersion setStringValue: [GMGetGrowlMailBundle() objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
}

- (NSString *) preferencesNibName {
	return @"GrowlMailPreferencesPanel";
}

- (NSView *)preferencesView
{
	if (!view_preferences)
		[NSBundle loadNibNamed:[self preferencesNibName] owner:self];
	return view_preferences;
}

- (id) viewForPreferenceNamed:(NSString *)aName {
#pragma unused(aName)
	return [self preferencesView];
}

- (NSString *) titleForIdentifier:(NSString *)aName {
#pragma unused(aName)
	return @"GrowlMail";
}

- (NSImage *) imageForPreferenceNamed:(NSString *)aName {
	return [NSImage imageNamed:aName];
}

- (NSSize) minSize {
	return [[self preferencesView] frame].size;
}

- (BOOL) isResizable {
	return NO;
}

- (NSInteger) numberOfRowsInTableView:(NSTableView *)aTableView {
#pragma unused(aTableView)
	return [[MailAccount remoteMailAccounts] count];
}

- (IBAction)changeBackgroundOnlyMode:(id)sender {
	[[GrowlMailNotifier sharedNotifier] configureForBackgroundOnly:[sender state]];
}

- (id) tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex {
#pragma unused(aTableView)
	MailAccount *account = [[MailAccount remoteMailAccounts] objectAtIndex:rowIndex];
	if ([[aTableColumn identifier] isEqualToString:@"active"])
		return [NSNumber numberWithBool:[[GrowlMailNotifier sharedNotifier] isAccountEnabled:account]];
	else
		return [account displayName];
}

- (void) tableView:(NSTableView *)aTableView setObjectValue:(id)anObject forTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex {
#pragma unused(aTableView,aTableColumn)
	MailAccount *account = [[MailAccount remoteMailAccounts] objectAtIndex:rowIndex];
	[[GrowlMailNotifier sharedNotifier] setAccount:account enabled:[anObject boolValue]];
}

@end
