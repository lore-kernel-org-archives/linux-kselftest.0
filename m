From: brendanhiggins at google.com (Brendan Higgins)
Date: Wed, 17 Oct 2018 15:45:32 -0700
Subject: [RFC v1 06/31] arch: um: enabled running kunit from User Mode
 Linux
In-Reply-To: <ECADFF3FD767C149AD96A924E7EA6EAF805248BE@USCULXMSG01.am.sony.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
 <20181016235120.138227-7-brendanhiggins@google.com>
 <f0d64a0a-7914-f390-c0b5-dc7626b45476@ideasonboard.com>
 <ECADFF3FD767C149AD96A924E7EA6EAF8052436B@USCULXMSG01.am.sony.com>
 <CAFd5g45owvjnVh633_kqf9DKeWQDYdGNi9j1crNZC3k02r=v1A@mail.gmail.com>
 <ECADFF3FD767C149AD96A924E7EA6EAF805248BE@USCULXMSG01.am.sony.com>
Message-ID: <CAFd5g47S16XGSt1ecDR1AnfOSuVwr3o7yma99EEG0GkvQ40gzQ@mail.gmail.com>

On Wed, Oct 17, 2018 at 2:18 PM <Tim.Bird at sony.com> wrote:
<snip>
> > There are some
> > other features we would like to add which would help with that goal as
> > well like test isolation. We actually have a presubmit server
> > internally for running KUnit tests that can usually respond to patches
> > with test results within a couple minutes. Would something like that
> > be interesting?
> I think the code and architecture of the software that handles presubmit,
> mail-list scanning, notifications, etc. would be of interest.  But KUnit features
> themselves (macro definitions, mocking vs. faking, etc.) would not.
> I only say that in the context of CC-ing the automated testing list on the patch set.
> Of course the KUnit features are interesting by themselves for testers doing
> unit testing.

Fair enough. Well, we will share what we have in that regard, but that
belongs on a separate thread.

BTW, what mailing list is that? I am also guessing your code isn't in
the kernel repo; where is it?
