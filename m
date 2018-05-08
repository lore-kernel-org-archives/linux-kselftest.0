From: davem at davemloft.net (David Miller)
Date: Mon, 07 May 2018 23:22:24 -0400 (EDT)
Subject: [PATCH] selftests: net: add udpgso* to TEST_GEN_FILES
In-Reply-To: <20180504091725.24977-1-anders.roxell@linaro.org>
References: <20180504091725.24977-1-anders.roxell@linaro.org>
Message-ID: <20180507.232224.1710068197351359395.davem@davemloft.net>

From: Anders Roxell <anders.roxell at linaro.org>
Date: Fri,  4 May 2018 11:17:25 +0200

> The generated files udpgso* shouldn't be part of TEST_PROGS, they are
> used by udpgso.sh and udpgsp_bench.sh. They should be added to the
> TEST_GEN_FILES to get installed without being added to the main
> run_kselftest.sh script.
> 
> Fixes: 3a687bef148d ("selftests: udp gso benchmark")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
