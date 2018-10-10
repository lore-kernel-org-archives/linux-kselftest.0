From: liu.song.a23 at gmail.com (Song Liu)
Date: Wed, 10 Oct 2018 09:07:54 -0700
Subject: [PATCH] selftests: bpf: install script with_addr.sh
In-Reply-To: <20181010142704.26990-1-anders.roxell@linaro.org>
References: <20181010142704.26990-1-anders.roxell@linaro.org>
Message-ID: <CAPhsuW7xqr91k0c6zQxWf1n5nDPk1tq9F5Fp_yarBdZxE7Vn9w@mail.gmail.com>

On Wed, Oct 10, 2018 at 7:28 AM Anders Roxell <anders.roxell at linaro.org> wrote:
>
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

Acked-by: Song Liu <songliubraving at fb.com>

> ---
>  tools/testing/selftests/bpf/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
> index 1381ab81099c..efd108ff737d 100644
> --- a/tools/testing/selftests/bpf/Makefile
> +++ b/tools/testing/selftests/bpf/Makefile
> @@ -51,6 +51,8 @@ TEST_PROGS := test_kmod.sh \
>         test_skb_cgroup_id.sh \
>         test_flow_dissector.sh
>
> +TEST_PROGS_EXTENDED := with_addr.sh
> +
>  # Compile but not part of 'make run_tests'
>  TEST_GEN_PROGS_EXTENDED = test_libbpf_open test_sock_addr test_skb_cgroup_id_user \
>         flow_dissector_load test_flow_dissector
> --
> 2.19.1
>
