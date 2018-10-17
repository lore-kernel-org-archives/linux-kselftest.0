From: Tim.Bird at sony.com (Tim.Bird at sony.com)
Date: Wed, 17 Oct 2018 21:18:25 +0000
Subject: [RFC v1 06/31] arch: um: enabled running kunit from User Mode
 Linux
In-Reply-To: <CAFd5g45owvjnVh633_kqf9DKeWQDYdGNi9j1crNZC3k02r=v1A@mail.gmail.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
 <20181016235120.138227-7-brendanhiggins@google.com>
 <f0d64a0a-7914-f390-c0b5-dc7626b45476@ideasonboard.com>
 <ECADFF3FD767C149AD96A924E7EA6EAF8052436B@USCULXMSG01.am.sony.com>
 <CAFd5g45owvjnVh633_kqf9DKeWQDYdGNi9j1crNZC3k02r=v1A@mail.gmail.com>
Message-ID: <ECADFF3FD767C149AD96A924E7EA6EAF805248BE@USCULXMSG01.am.sony.com>



> -----Original Message-----
> From: Brendan Higgins 
> 
> On Wed, Oct 17, 2018 at 10:52 AM <Tim.Bird at sony.com> wrote:
> > >
> > > It might be of interest to the automated testing mailing list too ? (Tim?)
> >
> >  I think this is interesting to groups doing automated testing of the kernel
> > (including myself) as another set of tests to run.  Right now I don't see it
> > as having any special attributes related to automation.  But I could be
> wrong.
> 
> Pardon my ignorance, but by automated testing you mean a CI server
> with presubmits, nightlys, and things of the sort?
Yes.

> 
> If that's the case, KUnit could be helpful because of the low resource
> cost in running them and the speed at which they run.
True.

> There are some
> other features we would like to add which would help with that goal as
> well like test isolation. We actually have a presubmit server
> internally for running KUnit tests that can usually respond to patches
> with test results within a couple minutes. Would something like that
> be interesting?
I think the code and architecture of the software that handles presubmit,
mail-list scanning, notifications, etc. would be of interest.  But KUnit features
themselves (macro definitions, mocking vs. faking, etc.) would not. 
I only say that in the context of CC-ing the automated testing list on the patch set.
Of course the KUnit features are interesting by themselves for testers doing
unit testing.
 -- Tim
