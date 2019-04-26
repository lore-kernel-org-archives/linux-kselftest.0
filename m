From: dancol@google.com (Daniel Colascione)
Date: Fri, 26 Apr 2019 12:35:40 -0700
Subject: [PATCH v1 2/2] Add selftests for pidfd polling
In-Reply-To: <20190426172602.GD261279@google.com>
References: <20190425190010.46489-1-joel@joelfernandes.org>
 <20190425190010.46489-2-joel@joelfernandes.org>
 <20190425212917.yotnir4uqgpnh764@brauner.io>
 <CAKOZueuPeqnWVCv8NnQNyStWBQLybkr2qqtfQ0MjzsfSQDymzg@mail.gmail.com>
 <20190426172602.GD261279@google.com>
Message-ID:
 <CAKOZuetFw9MnZCrXbcFTCFD9Jq8bZwzdcEi_OYHMMv2R_sgNNA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190426193540.rxZIc6g6hLjhWa0J34iBfD_aSvQampabbECn3PtjCkM@z>

On Fri, Apr 26, 2019@10:26 AM Joel Fernandes <joel@joelfernandes.org> wrote:
> On Thu, Apr 25, 2019@03:07:48PM -0700, Daniel Colascione wrote:
> > On Thu, Apr 25, 2019@2:29 PM Christian Brauner <christian@brauner.io> wrote:
> > > This timing-based testing seems kinda odd to be honest. Can't we do
> > > something better than this?
> >
> > Agreed. Timing-based tests have a substantial risk of becoming flaky.
> > We ought to be able to make these tests fully deterministic and not
> > subject to breakage from odd scheduling outcomes. We don't have
> > sleepable events for everything, granted, but sleep-waiting on a
> > condition with exponential backoff is fine in test code. In general,
> > if you start with a robust test, you can insert a sleep(100) anywhere
> > and not break the logic. Violating this rule always causes pain sooner
> > or later.
>
> I prefer if you can be more specific about how to redesign the test. Please
> go through the code and make suggestions there. The tests have not been flaky
> in my experience.

You've been running them in an ideal environment.

Some tests do depend on timing like the preemptoff tests,
> that can't be helped. Or a performance test that calculates framedrops.

Performance tests are *about* timing. This is a functional test. Here,
we care about sequencing, not timing, and using a bare sleep instead
of sleeping with a condition check (see below) is always flaky.

> In this case, we want to make sure that the poll unblocks at the right "time"
> that is when the non-leader thread exits, and not when the leader thread
> exits (test 1), or when the non-leader thread exits and not when the same
> non-leader previous did an execve (test 2).

Instead of sleeping, you want to wait for some condition. Right now,
in a bunch of places, the test does something like this:

do_something()
sleep(SOME_TIMEOUT)
check(some_condition())

You can replace each of these clauses with something like this:

do_something()
start_time = now()
while(!some_condition() && now() - start_time < LONG_TIMEOUT)
  sleep(SHORT_DELAY)
check(some_condition())

This way, you're insensitive to timing, up to LONG_TIMEOUT (which can
be something like a minute). Yes, you can always write
sleep(LARGE_TIMEOUT) instead, but a good, robust value of LONG_TIMEOUT
(which should be tens of seconds) would make the test take far too
long to run in the happy case.

Note that this code is fine:

check(!some_condition())
sleep(SOME_REASONABLE_TIMEOUT)
check(!some_condition())

It's okay to sleep for a little while and check that something did
*not* happen, but it's not okay for the test to *fail* due to
scheduling delays. The difference is that
sleeping-and-checking-that-something-didn't-happen can only generate
false negatives when checking for failures, and it's much better from
a code health perspective for a test to sometimes fail to detect a bug
than for it to fire occasionally when there's no bug actually present.

> These are inherently timing related.

No they aren't. We don't care how long these operations take. We only
care that they happen in the right order.

(Well, we do care about performance, but not for the purposes of this
functional test.)

> Yes it is true that if this runs in a VM
> and if the VM CPU is preempted for a couple seconds, then the test can fail
> falsely. Still I would argue such a failure scenario of a multi-second CPU
> lock-up can cause more serious issues like RCU stalls, and that's not a test
> issue. We can increase the sleep intervals if you want, to reduce the risk of
> such scenarios.
>
> I would love to make the test not depend on timing, but I don't know how.

For threads, implement some_condition() above by opening a /proc
directory to the task you want. You can look by death by looking for
zombie status in stat or ESRCH.

If you want to test that poll() actually unblocks on exit (as opposed
to EPOLLIN-ing immediately when the waited process is already dead),
do something like this:

- [Main test thread] Start subprocess, getting a pidfd
- [Subprocess] Wait forever
- [Main test thread] Start a waiter thread
- [Waiter test thread] poll(2) (or epoll, if you insist) on process exit
- [Main test thread] sleep(FAIRLY_SHORT_TIMEOUT)
- [Main test thread] Check that the subprocess is alive
- [Main test thread] pthread_tryjoin_np (make sure the waiter thread
is still alive)
- [Main test thread] Kill the subprocess (or one of its threads, for
testing the leader-exit case)
- [Main test thread] pthread_timedjoin_np(LONG_TIMEOUT) the waiter thread
- [Waiter test thread] poll(2) returns and thread exits
- [Main test thread] pthread_join returns: test succeeds (or the
pthread_timedjoin_np fails with ETIMEOUT, it means poll(2) didn't
unblock, and the test should fail).

Tests that sleep for synchronization *do* end up being flaky. That the
flakiness doesn't show up in local iterative testing doesn't mean that
the test is adequately robust.
