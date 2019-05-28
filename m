From: liu.song.a23@gmail.com (Song Liu)
Date: Tue, 28 May 2019 09:45:14 -0700
Subject: [PATCH] selftests: bpf: fix compiler warning
In-Reply-To: <20190524003038.GA69487@ip-172-31-44-144.us-west-2.compute.internal>
References: <20190524003038.GA69487@ip-172-31-44-144.us-west-2.compute.internal>
Message-ID:
 <CAPhsuW7H=w_UMyu5Q5p5+MGogkQ7+7X7sS=vJTiR=+JJy0KuTg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190528164514.KZttr8IO0zwCptsLqMVsYnFCEmMgm0CZN-bWpREQqNU@z>

On Thu, May 23, 2019@5:31 PM Alakesh Haloi <alakesh.haloi@gmail.com> wrote:
>
> Add missing header file following compiler warning
>
> prog_tests/flow_dissector.c: In function ‘tx_tap’:
> prog_tests/flow_dissector.c:175:9: warning: implicit declaration of function ‘writev’; did you mean ‘write’? [-Wimplicit-function-declaration]
>   return writev(fd, iov, ARRAY_SIZE(iov));
>          ^~~~~~
>          write
>
> Signed-off-by: Alakesh Haloi <alakesh.haloi at gmail.com>

The patch looks good. Please add a "Fixes" tag, so the fix
can be back ported properly.

Also, please specify which tree the patch should be applied
with [PATCH bpf] or [PATCH bpf-next].

Thanks,
Song




> ---
>  tools/testing/selftests/bpf/prog_tests/flow_dissector.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/flow_dissector.c b/tools/testing/selftests/bpf/prog_tests/flow_dissector.c
> index fbd1d88a6095..c938283ac232 100644
> --- a/tools/testing/selftests/bpf/prog_tests/flow_dissector.c
> +++ b/tools/testing/selftests/bpf/prog_tests/flow_dissector.c
> @@ -3,6 +3,7 @@
>  #include <error.h>
>  #include <linux/if.h>
>  #include <linux/if_tun.h>
> +#include <sys/uio.h>
>
>  #define CHECK_FLOW_KEYS(desc, got, expected)                           \
>         CHECK_ATTR(memcmp(&got, &expected, sizeof(got)) != 0,           \
> --
> 2.17.1
>
