From: davem@davemloft.net (David Miller)
Date: Wed, 25 Apr 2018 13:25:13 -0400 (EDT)
Subject: [PATCH] selftests: net: add in_netns.sh TEST_GEN_PROGS_EXTENDED
In-Reply-To: <20180424221952.12081-1-anders.roxell@linaro.org>
References: <20180424221952.12081-1-anders.roxell@linaro.org>
Message-ID: <20180425.132513.1786379382285267245.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180425172513.SY-0SHHHvaZHhfk2Ud_I-uRV1K1I7fiGgko5RqJxBp4@z>

From: Anders Roxell <anders.roxell@linaro.org>
Date: Wed, 25 Apr 2018 00:19:52 +0200

> Script in_netns.sh is a utility function and not its own test so it
> shouldn't be part of the TEST_PROGS. The in_netns.sh get used by
> run_afpackettests.
> To install in_netns.sh without being added to the main run_kselftest.sh
> script use the TEST_GEN_PROGS_EXTENDED variable.
> 
> Fixes: 5ff9c1a3dd92 ("selftests: net: add in_netns.sh to TEST_PROGS")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>

Please respin this against the 'net' tree as we want this bug fixed
there not just 'net-next'.

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
