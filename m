From: brendanhiggins at google.com (Brendan Higgins)
Date: Tue, 14 May 2019 01:12:23 -0700
Subject: [PATCH v3 08/18] objtool: add kunit_try_catch_throw to the
 noreturn list
In-Reply-To: <20190514065643.GC2589@hirez.programming.kicks-ass.net>
References: <20190514054251.186196-1-brendanhiggins@google.com>
 <20190514054251.186196-9-brendanhiggins@google.com>
 <20190514065643.GC2589@hirez.programming.kicks-ass.net>
Message-ID: <20190514081223.GA230665@google.com>

On Tue, May 14, 2019 at 08:56:43AM +0200, Peter Zijlstra wrote:
> On Mon, May 13, 2019 at 10:42:42PM -0700, Brendan Higgins wrote:
> > This fixes the following warning seen on GCC 7.3:
> >   kunit/test-test.o: warning: objtool: kunit_test_unsuccessful_try() falls through to next function kunit_test_catch()
> > 
> 
> What is that file and function; no kernel tree near me seems to have
> that.

Oh, sorry about that. The function is added in the following patch,
"[PATCH v3 09/18] kunit: test: add support for test abort"[1].

My apologies if this patch is supposed to come after it in sequence, but
I assumed it should come before otherwise objtool would complain about
the symbol when it is introduced.

Thanks!

[1] https://lkml.org/lkml/2019/5/14/44
