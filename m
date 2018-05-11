From: dvhart at infradead.org (Darren Hart)
Date: Fri, 11 May 2018 08:13:20 -0700
Subject: [PATCH] selftests: futex: delete RUN_TESTS and EMIT_TESTS
 overrides
In-Reply-To: <20180502211848.22404-2-shuah@kernel.org>
References: <20180502211848.22404-1-shuah@kernel.org>
 <20180502211848.22404-2-shuah@kernel.org>
Message-ID: <20180511151320.GA6391@fury>

On Wed, May 02, 2018 at 03:18:45PM -0600, Shuah Khan (Samsung OSG) wrote:
> Delete RUN_TESTS and EMIT_TESTS overrides and use common defines in
> lib.mk. Common defines work just fine and there is no need to define
> custom overrides.
> 
> Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>

I was concerned because this override was a deliberate decision made in:

9705315b7562 selftests/futex: Update Makefile to use lib.mk

But reviewing lib.mk today, the RUN_TESTS and EMIT_TESTS perform the same
function running TEST_PROGS.

Reviewed-by: Darren Hart (VMware) <dvhart at infradead.org>

-- 
Darren Hart
VMware Open Source Technology Center
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
