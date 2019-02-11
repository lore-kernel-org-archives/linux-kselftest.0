From: broonie@kernel.org (Mark Brown)
Date: Mon, 11 Feb 2019 12:47:38 +0000
Subject: [PATCH 2/2] selftests/x86/fsgsbase: Default to trying to run the
 test repeatedly
In-Reply-To: <20190211084916.GB62722@gmail.com>
References: <20190203134017.9375-1-broonie@kernel.org>
 <20190203134017.9375-3-broonie@kernel.org>
 <20190211084916.GB62722@gmail.com>
Message-ID: <20190211124738.GA22391@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190211124738.3m0K5VlmC7hAQK2qDR3etlW6A2qn-mxW8j9gZmKqEBI@z>

On Mon, Feb 11, 2019@09:49:16AM +0100, Ingo Molnar wrote:

> So this isn't very user-friendly either, previously it would run a 
> testcase and immediately provide output.

> Now it's just starting and 'hanging':

>   galatea:~/linux/linux/tools/testing/selftests/x86> ./fsgsbase_64 

> I got bored and Ctrl-C-ed it after ~30 seconds.

> How long is this supposed to run, and why isn't the user informed?

On Intel systems I've got access to it's tended to only run for less
than 10 seconds for me with excursions up to ~30s at most, I'd have
projected it to be about a minute if the tests pass.  However retesting
with Debian's v4.19 kernel it seems to be running a lot more stably so
we're now seeing it run to completion reliably when just one copy of the
test is running.

AFAICT it's not terribly idiomatic to provide much output, and anything
that was per iteration would be *way* too spammy.

> Also, testcases should really be short, so I think a better approach 
> would be to thread the test-case and start an instance on every CPU. That 
> should also excercise SMP bugs, if any.

Well, a *better* approach would be for the underlying issue that the
test is finding to be fixed.

I didn't look at adding more threads as the test case is already
threaded, it does seem that running multiple copies simultaneously makes
things reproduce more quickly so it's definitely useful though it's
still taking multiple iterations.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190211/c88abc72/attachment.sig>
