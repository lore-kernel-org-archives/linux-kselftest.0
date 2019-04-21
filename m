From: davem at davemloft.net (David Miller)
Date: Sat, 20 Apr 2019 20:29:20 -0700 (PDT)
Subject: [PATCH] selftests/net: correct the return value for
 run_afpackettests
In-Reply-To: <20190419110113.21883-1-po-hsu.lin@canonical.com>
References: <20190419110113.21883-1-po-hsu.lin@canonical.com>
Message-ID: <20190420.202920.2293248605361106810.davem@davemloft.net>

From: Po-Hsu Lin <po-hsu.lin at canonical.com>
Date: Fri, 19 Apr 2019 19:01:13 +0800

> The run_afpackettests will be marked as passed regardless the return
> value of those sub-tests in the script:
>     --------------------
>     running psock_tpacket test
>     --------------------
>     [FAIL]
>     selftests: run_afpackettests [PASS]
> 
> Fix this by changing the return value for each tests.
> 
> Signed-off-by: Po-Hsu Lin <po-hsu.lin at canonical.com>

Applied, thanks.
