From: peterz at infradead.org (Peter Zijlstra)
Date: Tue, 14 May 2019 08:56:43 +0200
Subject: [PATCH v3 08/18] objtool: add kunit_try_catch_throw to the
 noreturn list
In-Reply-To: <20190514054251.186196-9-brendanhiggins@google.com>
References: <20190514054251.186196-1-brendanhiggins@google.com>
 <20190514054251.186196-9-brendanhiggins@google.com>
Message-ID: <20190514065643.GC2589@hirez.programming.kicks-ass.net>

On Mon, May 13, 2019 at 10:42:42PM -0700, Brendan Higgins wrote:
> This fixes the following warning seen on GCC 7.3:
>   kunit/test-test.o: warning: objtool: kunit_test_unsuccessful_try() falls through to next function kunit_test_catch()
> 

What is that file and function; no kernel tree near me seems to have
that.
