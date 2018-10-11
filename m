From: daniel@iogearbox.net (Daniel Borkmann)
Date: Thu, 11 Oct 2018 10:34:10 +0200
Subject: [PATCH] selftests: bpf: add config fragment LWTUNNEL
In-Reply-To: <20181010092123.26218-1-anders.roxell@linaro.org>
References: <20181010092123.26218-1-anders.roxell@linaro.org>
Message-ID: <0eb2f372-ff85-b4c8-ee51-b9cc7ab5971d@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181011083410.PnLY5EXkZiGmayse8AwWJjHpBPS4xvl6uB3BraHVV3s@z>

On 10/10/2018 11:21 AM, Anders Roxell wrote:
> When test_lwt_seg6local.sh was added commit c99a84eac026
> ("selftests/bpf: test for seg6local End.BPF action") config fragment
> wasn't added, and without CONFIG_LWTUNNEL enabled we see this:
> Error: CONFIG_LWTUNNEL is not enabled in this kernel.
> selftests: test_lwt_seg6local [FAILED]
> 
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>

Applied to bpf-next, thanks Anders!
