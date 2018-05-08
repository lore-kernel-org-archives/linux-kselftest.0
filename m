From: davem at davemloft.net (David Miller)
Date: Mon, 07 May 2018 23:29:01 -0400 (EDT)
Subject: [PATCH] selftests: net: use TEST_PROGS_EXTENDED
In-Reply-To: <20180504164725.13516-1-anders.roxell@linaro.org>
References: <20180504164725.13516-1-anders.roxell@linaro.org>
Message-ID: <20180507.232901.1578185927050716610.davem@davemloft.net>

From: Anders Roxell <anders.roxell at linaro.org>
Date: Fri,  4 May 2018 18:47:25 +0200

> When a script file that isn't generated uses the variable
> TEST_GEN_PROGS_EXTENDED and a 'make -C tools/testing/selftests clean' is
> performed the script file gets removed and git shows the file as
> deleted. For script files that isn't generated TEST_PROGS_EXTENDED
> should be used.
> 
> Fixes: 9faedd643fd9 ("selftests: net: add in_netns.sh TEST_GEN_PROGS_EXTENDED")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>

Applied.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
