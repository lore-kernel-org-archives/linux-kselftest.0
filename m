From: davem at davemloft.net (David Miller)
Date: Fri, 27 Apr 2018 13:14:01 -0400 (EDT)
Subject: [PATCH v2] selftests: net: add in_netns.sh TEST_GEN_PROGS_EXTENDED
In-Reply-To: <20180425213206.7531-1-anders.roxell@linaro.org>
References: <20180425.132513.1786379382285267245.davem@davemloft.net>
 <20180425213206.7531-1-anders.roxell@linaro.org>
Message-ID: <20180427.131401.2013176564896918298.davem@davemloft.net>

From: Anders Roxell <anders.roxell at linaro.org>
Date: Wed, 25 Apr 2018 23:32:06 +0200

> Script in_netns.sh is a utility function and not its own test so it
> shouldn't be part of the TEST_PROGS. The in_netns.sh get used by
> run_afpackettests.
> To install in_netns.sh without being added to the main run_kselftest.sh
> script use the TEST_GEN_PROGS_EXTENDED variable.
> 
> Fixes: 5ff9c1a3dd92 ("selftests: net: add in_netns.sh to TEST_PROGS")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> ---
> 
> respin against the 'net' tree.

Applied, thank you.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
