From: liu.song.a23@gmail.com (Song Liu)
Date: Sun, 24 Jun 2018 22:08:52 -0700
Subject: [PATCH] selftests: bpf: notification about privilege required to
 run test_lirc_mode2.sh testing script
In-Reply-To: <20180622185417.3452-1-ahiliation@gmail.com>
References: <20180622185417.3452-1-ahiliation@gmail.com>
Message-ID:
 <CAPhsuW6MUKiKdstH=H8nrPA5kRQUQus-UVSxYgCM+KwWQ3VXJA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180625050852.xl1v5g5ImPS9CMCYl12aGVTsjj1omNvHOyc4bigjHgA@z>

On Fri, Jun 22, 2018@11:54 AM, Jeffrin Jose T <ahiliation@gmail.com> wrote:
> The test_lirc_mode2.sh script require root privilege for the successful
> execution of the test.
>
> This patch is to notify the user about the privilege the script
> demands for the successful execution of the test.
>
> Signed-off-by: Jeffrin Jose T (Rajagiri SET) <ahiliation at gmail.com>

Acked-by: Song Liu <songliubraving at fb.com>

> ---
>  tools/testing/selftests/bpf/test_lirc_mode2.sh | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/test_lirc_mode2.sh b/tools/testing/selftests/bpf/test_lirc_mode2.sh
> index ce2e15e4f976..51184f8f9e64 100755
> --- a/tools/testing/selftests/bpf/test_lirc_mode2.sh
> +++ b/tools/testing/selftests/bpf/test_lirc_mode2.sh
> @@ -1,6 +1,15 @@
>  #!/bin/bash
>  # SPDX-License-Identifier: GPL-2.0
>
> +# Kselftest framework requirement - SKIP code is 4.
> +ksft_skip=4
> +
> +msg="skip all tests:"
> +if [ $UID != 0 ]; then
> +    echo $msg please run this as root >&2
> +    exit $ksft_skip
> +fi
> +
>  GREEN='\033[0;92m'
>  RED='\033[0;31m'
>  NC='\033[0m' # No Color
> --
> 2.17.0
>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
