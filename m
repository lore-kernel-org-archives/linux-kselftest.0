From: liu.song.a23 at gmail.com (Song Liu)
Date: Mon, 25 Jun 2018 22:33:28 -0700
Subject: [PATCH v2] selftests: bpf: notification about privilege required
 to run test_lwt_seg6local.sh testing script
In-Reply-To: <20180622214032.6527-1-ahiliation@gmail.com>
References: <20180622214032.6527-1-ahiliation@gmail.com>
Message-ID: <CAPhsuW40D4SGyer5pwf_yM5UdQxViuPJUGmxY8HvcemTBg+MZg@mail.gmail.com>

On Fri, Jun 22, 2018 at 2:40 PM, Jeffrin Jose T <ahiliation at gmail.com> wrote:
> This test needs root privilege for it's successful execution.
>
> This patch is atleast used to notify the user about the privilege
> the script demands for the  smooth execution of the test.
>
> Signed-off-by: Jeffrin Jose T (Rajagiri SET) <ahiliation at gmail.com>

Acked-by: Song Liu <songliubraving at fb.com>

> ---
>  tools/testing/selftests/bpf/test_lwt_seg6local.sh | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/test_lwt_seg6local.sh b/tools/testing/selftests/bpf/test_lwt_seg6local.sh
> index 1c77994b5e71..30575577a8b2 100755
> --- a/tools/testing/selftests/bpf/test_lwt_seg6local.sh
> +++ b/tools/testing/selftests/bpf/test_lwt_seg6local.sh
> @@ -21,6 +21,15 @@
>  # An UDP datagram is sent from fb00::1 to fb00::6. The test succeeds if this
>  # datagram can be read on NS6 when binding to fb00::6.
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
>  TMP_FILE="/tmp/selftest_lwt_seg6local.txt"
>
>  cleanup()
> --
> 2.17.0
>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
