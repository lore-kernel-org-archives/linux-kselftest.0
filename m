From: mcgrof at kernel.org (Luis R. Rodriguez)
Date: Wed, 9 May 2018 19:28:13 +0000
Subject: [PATCH 13/24] selftests: kmod: return Kselftest Skip code for
 skipped tests
In-Reply-To: <20180505011328.32078-13-shuah@kernel.org>
References: <20180505011328.32078-1-shuah@kernel.org>
 <20180505011328.32078-13-shuah@kernel.org>
Message-ID: <20180509192813.GT27853@wotan.suse.de>

On Fri, May 04, 2018 at 07:13:17PM -0600, Shuah Khan (Samsung OSG) wrote:
> When kmod test is skipped because of unmet dependencies and/or unsupported
> configuration, it returns 0 which is treated as a pass by the Kselftest
> framework. This leads to false positive result even when the test could
> not be run. It returns fail in some cases when test is skipped. Either way,
> it is incorrect and incosnistent reporting.
> 
> Change it to return kselftest skip code when a test gets skipped to
> clearly report that the test could not be run.
> 
> Kselftest framework SKIP code is 4 and the framework prints appropriate
> messages to indicate that the test is skipped.
> 
> Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>

Reviewed-by: Luis R. Rodriguez <mcgrof at kernel.org>

  Luis
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
