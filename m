From: joel@joelfernandes.org (Joel Fernandes)
Date: Fri, 26 Apr 2019 16:31:14 -0400
Subject: [PATCH v1 2/2] Add selftests for pidfd polling
In-Reply-To: <CAKOZuetFw9MnZCrXbcFTCFD9Jq8bZwzdcEi_OYHMMv2R_sgNNA@mail.gmail.com>
References: <20190425190010.46489-1-joel@joelfernandes.org>
 <20190425190010.46489-2-joel@joelfernandes.org>
 <20190425212917.yotnir4uqgpnh764@brauner.io>
 <CAKOZueuPeqnWVCv8NnQNyStWBQLybkr2qqtfQ0MjzsfSQDymzg@mail.gmail.com>
 <20190426172602.GD261279@google.com>
 <CAKOZuetFw9MnZCrXbcFTCFD9Jq8bZwzdcEi_OYHMMv2R_sgNNA@mail.gmail.com>
Message-ID: <20190426203114.GA185553@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190426203114.ty8Az934zdxRP4m-thYAlFjRd0ll6wM8EWkEhbcC8RA@z>

On Fri, Apr 26, 2019@12:35:40PM -0700, Daniel Colascione wrote:
> On Fri, Apr 26, 2019@10:26 AM Joel Fernandes <joel@joelfernandes.org> wrote:
> > On Thu, Apr 25, 2019@03:07:48PM -0700, Daniel Colascione wrote:
> > > On Thu, Apr 25, 2019@2:29 PM Christian Brauner <christian@brauner.io> wrote:
> > > > This timing-based testing seems kinda odd to be honest. Can't we do
> > > > something better than this?
> > >
> > > Agreed. Timing-based tests have a substantial risk of becoming flaky.
> > > We ought to be able to make these tests fully deterministic and not
> > > subject to breakage from odd scheduling outcomes. We don't have
> > > sleepable events for everything, granted, but sleep-waiting on a
> > > condition with exponential backoff is fine in test code. In general,
> > > if you start with a robust test, you can insert a sleep(100) anywhere
> > > and not break the logic. Violating this rule always causes pain sooner
> > > or later.
> >
> > I prefer if you can be more specific about how to redesign the test. Please
> > go through the code and make suggestions there. The tests have not been flaky
> > in my experience.
> 
> You've been running them in an ideal environment.

One would hope for a reliable test environment.

> > In this case, we want to make sure that the poll unblocks at the right "time"
> > that is when the non-leader thread exits, and not when the leader thread
> > exits (test 1), or when the non-leader thread exits and not when the same
> > non-leader previous did an execve (test 2).
> 
> Instead of sleeping, you want to wait for some condition. Right now,
> in a bunch of places, the test does something like this:
> 
> do_something()
> sleep(SOME_TIMEOUT)
> check(some_condition())

No. I don't have anything like "some_condition()". My some_condition() is
just the difference in time.

> 
> You can replace each of these clauses with something like this:
> 
> do_something()
> start_time = now()
> while(!some_condition() && now() - start_time < LONG_TIMEOUT)
>   sleep(SHORT_DELAY)
> check(some_condition())
> 
> This way, you're insensitive to timing, up to LONG_TIMEOUT (which can
> be something like a minute). Yes, you can always write
> sleep(LARGE_TIMEOUT) instead, but a good, robust value of LONG_TIMEOUT
> (which should be tens of seconds) would make the test take far too
> long to run in the happy case.

Yes, but try implementing some_condition()  :-). It is easy to talk in the
abstract, I think it would be more productive if you can come up with an
implementation/patchh of the test itself and send a patch for that. I know
you wrote some pseudocode below, but it is a complex reimplementation that I
don't think will make the test more robust. I mean reading /proc/pid stat?
yuck :) You are welcome to send a patch though if you have a better
implementation.

> Note that this code is fine:
> 
> check(!some_condition())
> sleep(SOME_REASONABLE_TIMEOUT)
> check(!some_condition())
> 
> It's okay to sleep for a little while and check that something did
> *not* happen, but it's not okay for the test to *fail* due to
> scheduling delays. The difference is that

As I said, multi-second scheduling delay are really unacceptable anyway. I
bet many kselftest may fail on a "bad" system like that way, that does not
mean the test is flaky. If there are any reports in the future that the test
fails or is flaky, I am happy to address them at that time. The tests work
and catch bugs reliably as I have seen. We could also make the test task as
RT if scheduling class is a concern.

I don't think its worth bikeshedding about hypothetical issues.

thanks,

 - Joel
