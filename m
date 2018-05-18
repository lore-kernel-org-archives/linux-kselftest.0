From: daniel@iogearbox.net (Daniel Borkmann)
Date: Fri, 18 May 2018 22:32:13 +0200
Subject: [PATCH] selftests: bpf: config: enable NET_SCH_INGRESS for
 xdp_meta.sh
In-Reply-To: <20180518182324.23827-1-anders.roxell@linaro.org>
References: <20180518182324.23827-1-anders.roxell@linaro.org>
Message-ID: <eabe5ff5-623e-e36f-1dea-f4f78a362332@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180518203213.FLUjtb9LbiHUFA7fdnCVbGFpn-jk60PjK-S7E6Z-FzE@z>

On 05/18/2018 08:23 PM, Anders Roxell wrote:
> When running bpf's selftest test_xdp_meta.sh it fails:
> ./test_xdp_meta.sh
> Error: Specified qdisc not found.
> selftests: test_xdp_meta [FAILED]
> 
> Need to enable CONFIG_NET_SCH_INGRESS and CONFIG_NET_CLS_ACT to get the
> test to pass.
> 
> Fixes: 22c8852624fc ("bpf: improve selftests and add tests for meta pointer")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>

Applied to bpf tree, thanks Anders!
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
