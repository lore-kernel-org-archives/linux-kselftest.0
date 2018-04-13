From: davem@davemloft.net (David Miller)
Date: Thu, 12 Apr 2018 21:53:00 -0400 (EDT)
Subject: [PATCH] selftests: net: add in_netns.sh to TEST_PROGS
In-Reply-To: <20180411151734.15507-1-anders.roxell@linaro.org>
References: <20180411151734.15507-1-anders.roxell@linaro.org>
Message-ID: <20180412.215300.1371548831144372410.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180413015300.hQPMbzY06kl0-nOsW4a3QfDEEOKdiEr4w-NVFK9Lm24@z>

From: Anders Roxell <anders.roxell@linaro.org>
Date: Wed, 11 Apr 2018 17:17:34 +0200

> Script in_netns.sh isn't installed.
> --------------------
> running psock_fanout test
> --------------------
> ./run_afpackettests: line 12: ./in_netns.sh: No such file or directory
> [FAIL]
> --------------------
> running psock_tpacket test
> --------------------
> ./run_afpackettests: line 22: ./in_netns.sh: No such file or directory
> [FAIL]
> 
> In current code added in_netns.sh to be installed.
> 
> Fixes: cc30c93fa020 ("selftests/net: ignore background traffic in psock_fanout")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
