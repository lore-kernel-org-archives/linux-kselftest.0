From: daniel at iogearbox.net (Daniel Borkmann)
Date: Thu, 23 May 2019 18:02:51 +0200
Subject: [PATCH bpf v1 1/3] selftests/bpf: Test correctness of narrow
 32bit read on 64bit field
In-Reply-To: <20190515134731.12611-2-krzesimir@kinvolk.io>
References: <20190515134731.12611-1-krzesimir@kinvolk.io>
 <20190515134731.12611-2-krzesimir@kinvolk.io>
Message-ID: <c28c3cea-a8e0-fbd8-6113-bbb4cece0178@iogearbox.net>

On 05/15/2019 03:47 PM, Krzesimir Nowak wrote:
> Test the correctness of the 32bit narrow reads by reading both halves
> of the 64 bit field and doing a binary or on them to see if we get the
> original value.
> 
> This isn't really tested - the program is not being run, because
> BPF_PROG_TYPE_PERF_EVENT is not supported by bpf_test_run_prog.

One option could be to add actual support for BPF_PROG_TYPE_PERF_EVENT to
test_verifier where the program gets actually triggered, and the result
stored in a map value that the test case reads out for checking the result
against the expected one. Recently added something similar for LRU maps in
the test suite, that shouldn't be too complex.

Thanks,
Daniel

> Signed-off-by: Krzesimir Nowak <krzesimir at kinvolk.io>
> ---
>  tools/testing/selftests/bpf/verifier/var_off.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/tools/testing/selftests/bpf/verifier/var_off.c b/tools/testing/selftests/bpf/verifier/var_off.c
> index 8504ac937809..2668819dcc85 100644
> --- a/tools/testing/selftests/bpf/verifier/var_off.c
> +++ b/tools/testing/selftests/bpf/verifier/var_off.c
> @@ -246,3 +246,18 @@
>  	.result = ACCEPT,
>  	.prog_type = BPF_PROG_TYPE_LWT_IN,
>  },
> +{
> +	"32bit loads of a 64bit field (both least and most significant words)",
> +	.insns = {
> +	BPF_LDX_MEM(BPF_W, BPF_REG_4, BPF_REG_1, offsetof(struct bpf_perf_event_data, sample_period)),
> +	BPF_LDX_MEM(BPF_W, BPF_REG_5, BPF_REG_1, offsetof(struct bpf_perf_event_data, sample_period) + 4),
> +	BPF_LDX_MEM(BPF_DW, BPF_REG_6, BPF_REG_1, offsetof(struct bpf_perf_event_data, sample_period)),
> +	BPF_ALU64_IMM(BPF_LSH, BPF_REG_4, 32),
> +	BPF_ALU64_REG(BPF_OR, BPF_REG_4, BPF_REG_5),
> +	BPF_ALU64_REG(BPF_XOR, BPF_REG_4, BPF_REG_6),
> +	BPF_MOV64_REG(BPF_REG_0, BPF_REG_4),
> +	BPF_EXIT_INSN(),
> +	},
> +	.result = ACCEPT,
> +	.prog_type = BPF_PROG_TYPE_PERF_EVENT,
> +},
> 
