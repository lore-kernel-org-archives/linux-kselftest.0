From: liu.song.a23@gmail.com (Song Liu)
Date: Tue, 30 Oct 2018 11:35:21 -0700
Subject: [PATCH v2] kselftests/bpf: use ping6 as the default ipv6 ping
 binary if it exists
In-Reply-To: <1540869355-13324-1-git-send-email-lizhijian@cn.fujitsu.com>
References: <1540869355-13324-1-git-send-email-lizhijian@cn.fujitsu.com>
Message-ID:
 <CAPhsuW4Bm2H7sV8xgzcD9s=9d_z1bpeEYbo2OMTTh9mcgmrC0w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181030183521.Qi2YyOeBUYkLrtU1IN7F9kgIUGOeimZmrpj--64v480@z>

On Mon, Oct 29, 2018@7:35 PM Li Zhijian <lizhijian@cn.fujitsu.com> wrote:
>
> ping binary on some distros doesn't support "ping -6" anymore.
>
> Signed-off-by: Li Zhijian <lizhijian at cn.fujitsu.com>

I think this should go bpf-next. Please resubmit when the bpf-next tree is open
(after the merge window). Other than this:

Acked-by: Song Liu <songliubraving at fb.com>

> ---
>  tools/testing/selftests/bpf/test_skb_cgroup_id.sh | 3 ++-
>  tools/testing/selftests/bpf/test_sock_addr.sh     | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/test_skb_cgroup_id.sh b/tools/testing/selftests/bpf/test_skb_cgroup_id.sh
> index 42544a9..a9bc6f8 100755
> --- a/tools/testing/selftests/bpf/test_skb_cgroup_id.sh
> +++ b/tools/testing/selftests/bpf/test_skb_cgroup_id.sh
> @@ -10,7 +10,7 @@ wait_for_ip()
>         echo -n "Wait for testing link-local IP to become available "
>         for _i in $(seq ${MAX_PING_TRIES}); do
>                 echo -n "."
> -               if ping -6 -q -c 1 -W 1 ff02::1%${TEST_IF} >/dev/null 2>&1; then
> +               if $PING6 -c 1 -W 1 ff02::1%${TEST_IF} >/dev/null 2>&1; then
>                         echo " OK"
>                         return
>                 fi
> @@ -58,5 +58,6 @@ BPF_PROG_OBJ="${DIR}/test_skb_cgroup_id_kern.o"
>  BPF_PROG_SECTION="cgroup_id_logger"
>  BPF_PROG_ID=0
>  PROG="${DIR}/test_skb_cgroup_id_user"
> +type ping6 >/dev/null 2>&1 && PING6="ping6" || PING6="ping -6"
>
>  main
> diff --git a/tools/testing/selftests/bpf/test_sock_addr.sh b/tools/testing/selftests/bpf/test_sock_addr.sh
> index 9832a87..3b9fdb8 100755
> --- a/tools/testing/selftests/bpf/test_sock_addr.sh
> +++ b/tools/testing/selftests/bpf/test_sock_addr.sh
> @@ -4,7 +4,8 @@ set -eu
>
>  ping_once()
>  {
> -       ping -${1} -q -c 1 -W 1 ${2%%/*} >/dev/null 2>&1
> +       type ping${1} >/dev/null 2>&1 && PING="ping${1}" || PING="ping -${1}"
> +       $PING -q -c 1 -W 1 ${2%%/*} >/dev/null 2>&1
>  }
>
>  wait_for_ip()
> --
> 2.7.4
>
