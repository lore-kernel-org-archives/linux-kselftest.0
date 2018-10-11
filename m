From: daniel at iogearbox.net (Daniel Borkmann)
Date: Thu, 11 Oct 2018 10:36:36 +0200
Subject: [PATCH] selftests: bpf: install script with_addr.sh
In-Reply-To: <20181010142704.26990-1-anders.roxell@linaro.org>
References: <20181010142704.26990-1-anders.roxell@linaro.org>
Message-ID: <10e2cd79-b3b9-c2cc-8587-2885781716f8@iogearbox.net>

On 10/10/2018 04:27 PM, Anders Roxell wrote:
> When test_flow_dissector.sh runs it complains that it can't find script
> with_addr.sh:
> 
> ./test_flow_dissector.sh: line 81: ./with_addr.sh: No such file or
> directory
> 
> Rework so that with_addr.sh gets installed, add it to
> TEST_PROGS_EXTENDED variable.
> 
> Fixes: 50b3ed57dee9 ("selftests/bpf: test bpf flow dissection")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>

Applied to bpf-next, thanks Anders!
