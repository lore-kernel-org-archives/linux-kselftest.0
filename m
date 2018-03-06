From: dvhart at infradead.org (Darren Hart)
Date: Mon, 5 Mar 2018 16:18:20 -0800
Subject: [PATCH v2] selftests: futex Makefile add top level TAP header
 echo to RUN_TESTS
In-Reply-To: <20180301201907.17573-1-shuahkh@osg.samsung.com>
References: <20180301201907.17573-1-shuahkh@osg.samsung.com>
Message-ID: <20180306001820.GF25693@fury>

On Thu, Mar 01, 2018 at 01:19:07PM -0700, Shuah Khan wrote:
> Add top level TAP header echo, testname and separator line to make
> the output consistent with the common run_tests target.
> 
> This change prevents nested TAP13 headers output from individual tests.
> Nested TAP13 headers could cause problems for some parsers.
> 
> Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>


Reviewed-by: Darren Hart (VMware) <dvhart at infradead.org>


-- 
Darren Hart
VMware Open Source Technology Center
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
