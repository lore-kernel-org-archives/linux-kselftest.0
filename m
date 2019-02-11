From: mingo@kernel.org (Ingo Molnar)
Date: Mon, 11 Feb 2019 13:51:46 +0100
Subject: [PATCH 2/2] selftests/x86/fsgsbase: Default to trying to run the
 test repeatedly
In-Reply-To: <20190211124738.GA22391@sirena.org.uk>
References: <20190203134017.9375-1-broonie@kernel.org>
 <20190203134017.9375-3-broonie@kernel.org>
 <20190211084916.GB62722@gmail.com>
 <20190211124738.GA22391@sirena.org.uk>
Message-ID: <20190211125146.GA66987@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190211125146.fa1T7mIdFjHZBYxx8t3H1q54bWigm55aAXwhJyUsWG4@z>


* Mark Brown <broonie@kernel.org> wrote:

> On Mon, Feb 11, 2019@09:49:16AM +0100, Ingo Molnar wrote:
> 
> > So this isn't very user-friendly either, previously it would run a 
> > testcase and immediately provide output.
> 
> > Now it's just starting and 'hanging':
> 
> >   galatea:~/linux/linux/tools/testing/selftests/x86> ./fsgsbase_64 
> 
> > I got bored and Ctrl-C-ed it after ~30 seconds.
> 
> > How long is this supposed to run, and why isn't the user informed?
> 
> On Intel systems I've got access to it's tended to only run for less
> than 10 seconds for me with excursions up to ~30s at most, I'd have
> projected it to be about a minute if the tests pass.  However retesting
> with Debian's v4.19 kernel it seems to be running a lot more stably so
> we're now seeing it run to completion reliably when just one copy of the
> test is running.
> 
> AFAICT it's not terribly idiomatic to provide much output, and anything
> that was per iteration would be *way* too spammy.

Certainly - but a "please wait" and updating the current count via \r 
once every second isn't spammy.

> > Also, testcases should really be short, so I think a better approach 
> > would be to thread the test-case and start an instance on every CPU. That 
> > should also excercise SMP bugs, if any.
> 
> Well, a *better* approach would be for the underlying issue that the
> test is finding to be fixed.
> 
> I didn't look at adding more threads as the test case is already
> threaded, it does seem that running multiple copies simultaneously makes
> things reproduce more quickly so it's definitely useful though it's
> still taking multiple iterations.

multiple iterations are fine - waiting a minute with zero output on the 
console isn't.

Thanks,

	Ingo
