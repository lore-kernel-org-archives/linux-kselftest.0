From: joel at joelfernandes.org (Joel Fernandes)
Date: Fri, 26 Apr 2019 13:26:02 -0400
Subject: [PATCH v1 2/2] Add selftests for pidfd polling
In-Reply-To: <CAKOZueuPeqnWVCv8NnQNyStWBQLybkr2qqtfQ0MjzsfSQDymzg@mail.gmail.com>
References: <20190425190010.46489-1-joel@joelfernandes.org>
 <20190425190010.46489-2-joel@joelfernandes.org>
 <20190425212917.yotnir4uqgpnh764@brauner.io>
 <CAKOZueuPeqnWVCv8NnQNyStWBQLybkr2qqtfQ0MjzsfSQDymzg@mail.gmail.com>
Message-ID: <20190426172602.GD261279@google.com>

On Thu, Apr 25, 2019 at 03:07:48PM -0700, Daniel Colascione wrote:
> On Thu, Apr 25, 2019 at 2:29 PM Christian Brauner <christian at brauner.io> wrote:
> > This timing-based testing seems kinda odd to be honest. Can't we do
> > something better than this?
> 
> Agreed. Timing-based tests have a substantial risk of becoming flaky.
> We ought to be able to make these tests fully deterministic and not
> subject to breakage from odd scheduling outcomes. We don't have
> sleepable events for everything, granted, but sleep-waiting on a
> condition with exponential backoff is fine in test code. In general,
> if you start with a robust test, you can insert a sleep(100) anywhere
> and not break the logic. Violating this rule always causes pain sooner
> or later.

I prefer if you can be more specific about how to redesign the test. Please
go through the code and make suggestions there. The tests have not been flaky
in my experience. Some tests do depend on timing like the preemptoff tests,
that can't be helped. Or a performance test that calculates framedrops.

In this case, we want to make sure that the poll unblocks at the right "time"
that is when the non-leader thread exits, and not when the leader thread
exits (test 1), or when the non-leader thread exits and not when the same
non-leader previous did an execve (test 2).

These are inherently timing related. Yes it is true that if this runs in a VM
and if the VM CPU is preempted for a couple seconds, then the test can fail
falsely. Still I would argue such a failure scenario of a multi-second CPU
lock-up can cause more serious issues like RCU stalls, and that's not a test
issue. We can increase the sleep intervals if you want, to reduce the risk of
such scenarios.

I would love to make the test not depend on timing, but I don't know how. And
the tests caught issues that I had in my development flow, so the tests
worked quite well in my experience.

thanks,

 - Joel
