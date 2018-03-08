From: davem at davemloft.net (David Miller)
Date: Thu, 08 Mar 2018 11:14:15 -0500 (EST)
Subject: [PATCH] selftests/net: enable fragments for fib-onlink-tests
In-Reply-To: <20180308101723.19721-1-anders.roxell@linaro.org>
References: <20180308101723.19721-1-anders.roxell@linaro.org>
Message-ID: <20180308.111415.514057888108219546.davem@davemloft.net>

From: Anders Roxell <anders.roxell at linaro.org>
Date: Thu,  8 Mar 2018 11:17:23 +0100

> We miss CONFIG_* fragments so test fib-onlink-tests.sh can do:
> ip li add lisa type vrf table 1101
> ip li add veth1 type veth peer name veth2
> 
> And the follow message occurs if it isn't enabled:
> Configuring interfaces
> RTNETLINK answers: Operation not supported
> 
> This enables for NET_NRF (and friends) and VETH so we can create a vrf
> table and veth.
> 
> Fixes: 153e1b84f477 ("selftests: Add FIB onlink tests")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>

Applied, thank you.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
