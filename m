From: davem@davemloft.net (David Miller)
Date: Fri, 19 Apr 2019 14:40:06 -0700 (PDT)
Subject: [PATCH] selftests/net: correct the return value for
 run_afpackettests
In-Reply-To: <20190419110113.21883-1-po-hsu.lin@canonical.com>
References: <20190419110113.21883-1-po-hsu.lin@canonical.com>
Message-ID: <20190419.144006.2099381369535226239.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190419214006.od8Rg-03WMMwbbHcmT57KJzml-YImw6gGQQ_e-sFzrk@z>

From: Po-Hsu Lin <po-hsu.lin@canonical.com>
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

Applied, thank you.
