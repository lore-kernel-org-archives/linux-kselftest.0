From: liu.song.a23 at gmail.com (Song Liu)
Date: Mon, 4 Mar 2019 14:59:14 -0800
Subject: [PATCH] selftests/bpf: Add arm target register definitions
In-Reply-To: <20190304205019.15071-1-adrian.ratiu@collabora.com>
References: <20190304205019.15071-1-adrian.ratiu@collabora.com>
Message-ID: <CAPhsuW4kbZhE=1v4t6v803zA6PnRjzGA5UaAu5Nrbo7mrYyw5Q@mail.gmail.com>

On Mon, Mar 4, 2019 at 12:50 PM Adrian Ratiu <adrian.ratiu at collabora.com> wrote:
>
> eBPF "restricted C" code can be compiled with LLVM/clang using target
> triplets like armv7l-unknown-linux-gnueabihf and loaded/run with small
> cross-compiled gobpf/elf [1] programs without requiring a full BCC
> port which is also undesirable on small embedded systems due to its
> size footprint. The only missing pieces are these helper macros which
> otherwise have to be redefined by each eBPF arm program.
>
> [1] https://github.com/iovisor/gobpf/tree/master/elf
>
> Signed-off-by: Adrian Ratiu <adrian.ratiu at collabora.com>

I think this is for bpf-next tree, which is closed during the merge window.
Please resubmit when the bpf-next trees is opened (usually in 2 weeks).

Thanks,
Song

> ---
>  tools/testing/selftests/bpf/bpf_helpers.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/bpf_helpers.h b/tools/testing/selftests/bpf/bpf_helpers.h
> index 6c77cf7bedce..f7883576f445 100644
> --- a/tools/testing/selftests/bpf/bpf_helpers.h
> +++ b/tools/testing/selftests/bpf/bpf_helpers.h
> @@ -232,6 +232,9 @@ static int (*bpf_skb_pull_data)(void *, int len) =
>  #elif defined(__TARGET_ARCH_s930x)
>         #define bpf_target_s930x
>         #define bpf_target_defined
> +#elif defined(__TARGET_ARCH_arm)
> +       #define bpf_target_arm
> +       #define bpf_target_defined
>  #elif defined(__TARGET_ARCH_arm64)
>         #define bpf_target_arm64
>         #define bpf_target_defined
> @@ -254,6 +257,8 @@ static int (*bpf_skb_pull_data)(void *, int len) =
>         #define bpf_target_x86
>  #elif defined(__s390x__)
>         #define bpf_target_s930x
> +#elif defined(__arm__)
> +       #define bpf_target_arm
>  #elif defined(__aarch64__)
>         #define bpf_target_arm64
>  #elif defined(__mips__)
> @@ -291,6 +296,19 @@ static int (*bpf_skb_pull_data)(void *, int len) =
>  #define PT_REGS_SP(x) ((x)->gprs[15])
>  #define PT_REGS_IP(x) ((x)->psw.addr)
>
> +#elif defined(bpf_target_arm)
> +
> +#define PT_REGS_PARM1(x) ((x)->uregs[0])
> +#define PT_REGS_PARM2(x) ((x)->uregs[1])
> +#define PT_REGS_PARM3(x) ((x)->uregs[2])
> +#define PT_REGS_PARM4(x) ((x)->uregs[3])
> +#define PT_REGS_PARM5(x) ((x)->uregs[4])
> +#define PT_REGS_RET(x) ((x)->uregs[14])
> +#define PT_REGS_FP(x) ((x)->uregs[11]) /* Works only with CONFIG_FRAME_POINTER */
> +#define PT_REGS_RC(x) ((x)->uregs[0])
> +#define PT_REGS_SP(x) ((x)->uregs[13])
> +#define PT_REGS_IP(x) ((x)->uregs[12])
> +
>  #elif defined(bpf_target_arm64)
>
>  #define PT_REGS_PARM1(x) ((x)->regs[0])
> --
> 2.20.1
>
