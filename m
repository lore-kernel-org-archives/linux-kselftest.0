From: daniel@iogearbox.net (Daniel Borkmann)
Date: Tue, 26 Jun 2018 12:07:41 +0200
Subject: [PATCH] selftests: bpf: enable NET_SCHED
In-Reply-To: <20180625145605.13726-1-anders.roxell@linaro.org>
References: <20180625145605.13726-1-anders.roxell@linaro.org>
Message-ID: <76182da2-d261-8747-610f-8506e3d96daf@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180626100741.lqq3tZJqY0AKfAqOwmeM900Er2-6ekjI5qx-lSGFr7I@z>

On 06/25/2018 04:56 PM, Anders Roxell wrote:
> CONFIG_NET_SCHED wasn't enabled in arm64's defconfig only for x86.
> So bpf/test_tunnel.sh tests fails with:
> RTNETLINK answers: Operation not supported
> RTNETLINK answers: Operation not supported
> We have an error talking to the kernel, -1
> Enable NET_SCHED and more tests passes.
> 
> Fixes: 3bce593ac06b ("selftests: bpf: config: add config fragments")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>

Applied to bpf, thanks Anders!
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
