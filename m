From: rostedt@goodmis.org (Steven Rostedt)
Date: Thu, 30 Aug 2018 11:50:55 -0400
Subject: [PATCH v2 22/32] selftests/ftrace: Add ringbuffer size changing
 testcase
In-Reply-To: <20180830161218.e46affa5a84abd47c9cf2a39@kernel.org>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
 <153443757416.23257.9284862385646039929.stgit@devbox>
 <20180824191836.305ad740@gandalf.local.home>
 <20180830161218.e46affa5a84abd47c9cf2a39@kernel.org>
Message-ID: <20180830115055.6a28054c@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180830155055.VN_gBICcn8x8frUh9gEwU6b1rWK6os8WCFA65ZnsxvY@z>

On Thu, 30 Aug 2018 16:12:18 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> > I'm fine with this, but one day I need to port over some of my other
> > tests. I have a test that stresses the ring buffer size (basically
> > checks to see if it can cause an oom). I need to port that to
> > selftests. But for now...  
> 
> Hmm, such stress test is not good for kselftest, since it can cause
> oom and kill some test process. Maybe we should have such stresstest
> framework (which allows test to crash kernel)

The point of the test is to make sure that it doesn't kill
everything :-)  The ring buffer code is suppose to detect that it will
cause an OOM, and if it does that's considered a failure.

Just like any other test, if it fails, it can crash the kernel. But the
ring buffer code is suppose to be able to keep the kernel from crashing
(including triggering OOM) if the buffer size is stressed.

Maybe I'll port that over today :-/


-- Steve
