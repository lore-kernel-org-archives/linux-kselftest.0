From: daniel at iogearbox.net (Daniel Borkmann)
Date: Wed, 29 May 2019 16:07:18 +0200
Subject: [PATCH bpf v2] selftests: bpf: fix compiler warning
In-Reply-To: <20190528190218.GA6950@ip-172-31-44-144.us-west-2.compute.internal>
References: <20190528190218.GA6950@ip-172-31-44-144.us-west-2.compute.internal>
Message-ID: <f78082c5-6fd9-611d-0da3-969f076a97f8@iogearbox.net>

On 05/28/2019 09:02 PM, Alakesh Haloi wrote:
> Add missing header file following compiler warning
> 
> prog_tests/flow_dissector.c: In function ‘tx_tap’:
> prog_tests/flow_dissector.c:175:9: warning: implicit declaration of function ‘writev’; did you mean ‘write’? [-Wimplicit-function-declaration]
>   return writev(fd, iov, ARRAY_SIZE(iov));
>          ^~~~~~
>          write
> 
> Fixes: 0905beec9f52 ("selftests/bpf: run flow dissector tests in skb-less mode")
> Signed-off-by: Alakesh Haloi <alakesh.haloi at gmail.com>

Applied, thanks!
