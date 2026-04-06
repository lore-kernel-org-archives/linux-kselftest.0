Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FB238B121
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 16:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775494050; cv=pass; b=MdJ8YmcXykzyvG4JaZak8sHaLXZKkrXvXyRZaVgdDJSuCYPuO6UXuGMesjJkLZ0G4qNPTUOqkL1cWnPZDVL8nrYY6OPh+qTrucpNvn1Qx3s0I2U5GkKqiZbHWuA6I32ljp07a7DDjmx5lo9SZ+lDnR2sg2ar6R9q+mbEUIn38nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775494050; c=relaxed/simple;
	bh=JEheAmjH7txXoyWWdiuTW//UqfiWfhwwACMbEcrWJ/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S5VIf9A3TBo2d8KlqK2HN0zeGkUjTm07H0KL5GNFj6JV3OUsAQPsFe4B2YjzAXZwB+elNeWcTItndk8BBkq7US2w8HZQoQkef4sv/X6Ylvs6YcmOQaB/J3Qdt+11KL5lh9JMa+sUc6+PxduAgIUOdYXzoSk0CtjYb5Ge+rH9py4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMgOFf2W; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMgOFf2W"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-650182d19e0so4608175d50.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 09:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775494047; cv=none;
        d=google.com; s=arc-20240605;
        b=UhPPuxXH/pE4bsqqmXWUk+cwnfJq3BAMZ4JNO1paPdJrPLWTSS8yxPh8n8mPuDP8d/
         0w6/q2jy/sTV4G6BnwJMV55gjcPDsPsMoVtAAreF410OWBJ/h1jIrN/78eCQACLhCN4G
         N7EylZVj7z0LFRvO7wUT4WUAYj/O7TT1g+mOBLf3UUs6pXvk6ThXriWO73YgxA1Tu8li
         HmDNs7mcQrDhOHp1qr7rlwT5DUwB3Wut0+WRXblLTkD17mKeijp6u/FxZ7EHn1sjZ59G
         3Mag3XSTSsdPEuwAdsH4beVzPiN9ybYjW/f6RxMuczLyuY1nh8LOc/KI2R8SlNDDkMBS
         i+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vlwIXPpKQ8CS4YOJauI+utRmeeM0eGhtuhmfjxQeuSA=;
        fh=pyRRFmBrNSuBBopyldlZbuRA398qUHM09BcysVTd9FM=;
        b=hhwIUC3lik+nDoe1BzUPjMyVRV06+eAV2GfvT4cT5ZBe/WPWJuM/pWt8wzw+UI02I8
         4vOetLLwTQjGq4tFzr2zKU671Yx7ZZRoKCIBmbqt/5JjmCZNI636gFD65FyoPJbxLjyt
         07dkEKSkqeKwccul74Qq6aU5OAIlEb2jr09XF6IEA9rLS6t/i+sdDyh1IlYOmyroTco0
         kUCilLVyzMCufQpz1TKuhmyahCFg/aXq+33Px7Za1S9+adH3PTjXnZxwon+1mYlXqUYI
         50t1SBbrA+Vpr/iEO+C1t8QOIqy1j9zJdvIu8jfsMoL055OQmJNOMMlnCuICz4cy95YB
         8mmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775494047; x=1776098847; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlwIXPpKQ8CS4YOJauI+utRmeeM0eGhtuhmfjxQeuSA=;
        b=BMgOFf2WIQSaNa3TGWSp1dIWiC0tls9tA91H0OFPsnyLaMIEQH01yT9/zBDnAvRZJF
         SeM6tghq0G0bs0yvoW03z5aZg4bDj4ccu56NpXY0+pVf8EuqzCDW992PvLcwSHT4Vj1K
         t2E3gUf0OK7GBaZcQUcJaBtRrbItvEXGT+DAvjMnMlOMv+iGrKqQHRD4+pLeKbd3+KMK
         car9I4+29C9UwzhFlaxneeKWMelCh6Vz1EfDZuG0+NpNAZeq98WLnzCYic8c0ambQIUU
         iTX36PAhjra07Nt3mjddAipbaQAtsCNOWIpPa2nBPB0ZmRbl49zD9aVG1EixIjiqThKo
         xgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775494047; x=1776098847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vlwIXPpKQ8CS4YOJauI+utRmeeM0eGhtuhmfjxQeuSA=;
        b=jFC+2t33fVAC+NkI8Y9XfcdNV74psJol7o2mhVs6pYUzAsl8fZwnYsETFYgaswK+x5
         6FwPKfDJGoXceEhp6TdQohGsgGmpIILGJWim7oNT9NoREep6StUbAnQLjz9LUuw47S+i
         doJX2Tsw0mz0x1tFDmA7nk2xk2e+Ns14aF4HgbPLNzm9VAiWUv1d8iwJzq+0QyQDiE+9
         63NDrBYF5lgEZEMPg3Yqzg27fpDdF81gMvp8utqT+BdzSYsQ2ttV7T7D3g1rGlJU1TNr
         b5ZRrUgZ8T+XNMWR7pqR/4YNZ5+gZgCeuShxjjt01nuetxBq2CsmJu33CrWujfdPjTWP
         7x6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKBdZFTSMZO2HJ/nntRWpbvRtjiWmDrr7O5qHfDK+mgP+oRQMylx4dWM5COK+fdCpzdhVLXm4y/yS3PWijD14=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYF9wQ4JGUQYjRwQPu/F2KyHpCQ2QUBkfrltuEV4UQ1ZOC8xjI
	gOFIW9s6kR0JnbeOXCeX7brqdgUhMWXk0JgkInDo3mO7vGOAbNqFTIqQLivhpoALSp+g7yxX4go
	rvZfVeGPgOQuRvlICQ+c7RhDKq/kheDE=
X-Gm-Gg: AeBDiesOv0GOXHmuNYi/5dXbUOipRyyJ5UkGuxvT2RVD7Q7MIumAwrLvgSU+/esNhY5
	UF5+CEfJn/HJB731+CukXWzSS+TCLHYDxXRreLubJ61t0WBIe5ftH0XoeicjeYAnsvXlxEaFYk6
	0S2oaXru/k/bfep+w9qxwLbePDIQD0tLD6MTDiBXPrGOH903s10KDVPvcxKl9MDeFlIwbJUJZtG
	USkLbjik07Mugoqox7yLlQ46UuAnrXd18XsfqZe0BPPfdXhZ53TDxhHsqEKlwZwrHV4LpzN+VsK
	tuV+R/Rpvcs3r/hQyrPkAKYXQbETIYrdOaLhkyLIRBU5OeD1IH8=
X-Received: by 2002:a05:690e:150f:b0:650:ea3:de9b with SMTP id
 956f58d0204a3-6504872e1b7mr14283427d50.21.1775494047483; Mon, 06 Apr 2026
 09:47:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406031330.187630-1-jiayuan.chen@linux.dev> <20260406031330.187630-2-jiayuan.chen@linux.dev>
In-Reply-To: <20260406031330.187630-2-jiayuan.chen@linux.dev>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Tue, 7 Apr 2026 00:47:15 +0800
X-Gm-Features: AQROBzBtYrfK94OZcVbzSoNIXW4KYVJ4A_KLc369NruXQyIchCjNwuytdotI7XA
Message-ID: <CABFUUZFfPWBoweKsDhKj4kKOjyZGwGZuBcB+GLu1LFVEZSzHpw@mail.gmail.com>
Subject: Re: [PATCH bpf v2 2/2] selftests/bpf: Add tests for sock_ops ctx
 access with same src/dst register
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 11:15=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> Add selftests to verify SOCK_OPS_GET_SK() and SOCK_OPS_GET_FIELD()
> correctly return NULL/zero when dst_reg =3D=3D src_reg and is_fullsock =
=3D=3D 0.
>
> Three subtests are included:
>  - get_sk: ctx->sk with same src/dst register (SOCK_OPS_GET_SK)
>  - get_field: ctx->snd_cwnd with same src/dst register (SOCK_OPS_GET_FIEL=
D)
>  - get_sk_diff_reg: ctx->sk with different src/dst register (baseline)
>
> Each BPF program uses inline asm (__naked) to force specific register
> allocation, reads is_fullsock first, then loads the field using the same
> (or different) register. The test triggers TCP_NEW_SYN_RECV via a TCP
> handshake and checks that the result is NULL/zero when is_fullsock =3D=3D=
 0.
>
> Test:
>         ./test_progs -a sock_ops_get_sk -v
>         test_sock_ops_get_sk:PASS:join_cgroup 0 nsec
>         test_sock_ops_get_sk:PASS:skel_open_load 0 nsec
>         run_sock_ops_test:PASS:prog_attach 0 nsec
>         run_sock_ops_test:PASS:start_server 0 nsec
>         run_sock_ops_test:PASS:connect_to_fd 0 nsec
>         test_sock_ops_get_sk:PASS:null_seen 0 nsec
>         test_sock_ops_get_sk:PASS:bug_not_detected 0 nsec
>         #419/1   sock_ops_get_sk/get_sk:OK
>         run_sock_ops_test:PASS:prog_attach 0 nsec
>         run_sock_ops_test:PASS:start_server 0 nsec
>         run_sock_ops_test:PASS:connect_to_fd 0 nsec
>         test_sock_ops_get_sk:PASS:field_null_seen 0 nsec
>         test_sock_ops_get_sk:PASS:field_bug_not_detected 0 nsec
>         #419/2   sock_ops_get_sk/get_field:OK
>         run_sock_ops_test:PASS:prog_attach 0 nsec
>         run_sock_ops_test:PASS:start_server 0 nsec
>         run_sock_ops_test:PASS:connect_to_fd 0 nsec
>         test_sock_ops_get_sk:PASS:diff_reg_null_seen 0 nsec
>         test_sock_ops_get_sk:PASS:diff_reg_bug_not_detected 0 nsec
>         #419/3   sock_ops_get_sk/get_sk_diff_reg:OK
>         #419     sock_ops_get_sk:OK
>         Summary: 1/3 PASSED, 0 SKIPPED, 0 FAILED
>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
>  .../bpf/prog_tests/sock_ops_get_sk.c          |  77 ++++++++++++
>  .../selftests/bpf/progs/sock_ops_get_sk.c     | 117 ++++++++++++++++++
>  2 files changed, 194 insertions(+)
>  create mode 100644 tools/testing/selftests/bpf/prog_tests/sock_ops_get_s=
k.c
>  create mode 100644 tools/testing/selftests/bpf/progs/sock_ops_get_sk.c
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/sock_ops_get_sk.c b/t=
ools/testing/selftests/bpf/prog_tests/sock_ops_get_sk.c
> new file mode 100644
> index 0000000000000..e086f7abb197e
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/prog_tests/sock_ops_get_sk.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <test_progs.h>
> +#include "cgroup_helpers.h"
> +#include "network_helpers.h"
> +#include "sock_ops_get_sk.skel.h"
> +
> +/* See progs/sock_ops_get_sk.c for the bug description. */
> +static void run_sock_ops_test(struct sock_ops_get_sk *skel, int cgroup_f=
d,
> +                             int prog_fd)
> +{
> +       int server_fd, client_fd, err;
> +
> +       err =3D bpf_prog_attach(prog_fd, cgroup_fd, BPF_CGROUP_SOCK_OPS, =
0);
> +       if (!ASSERT_OK(err, "prog_attach"))
> +               return;
> +
> +       server_fd =3D start_server(AF_INET, SOCK_STREAM, NULL, 0, 0);
> +       if (!ASSERT_GE(server_fd, 0, "start_server"))
> +               goto detach;
> +
> +       /* Trigger TCP handshake which causes TCP_NEW_SYN_RECV state wher=
e
> +        * is_fullsock =3D=3D 0 and is_locked_tcp_sock =3D=3D 0.
> +        */
> +       client_fd =3D connect_to_fd(server_fd, 0);
> +       if (!ASSERT_GE(client_fd, 0, "connect_to_fd"))
> +               goto close_server;
> +
> +       close(client_fd);
> +
> +close_server:
> +       close(server_fd);
> +detach:
> +       bpf_prog_detach(cgroup_fd, BPF_CGROUP_SOCK_OPS);
> +}
> +
> +void test_sock_ops_get_sk(void)
> +{
> +       struct sock_ops_get_sk *skel;
> +       int cgroup_fd;
> +
> +       cgroup_fd =3D test__join_cgroup("/sock_ops_get_sk");
> +       if (!ASSERT_GE(cgroup_fd, 0, "join_cgroup"))
> +               return;
> +
> +       skel =3D sock_ops_get_sk__open_and_load();
> +       if (!ASSERT_OK_PTR(skel, "skel_open_load"))
> +               goto close_cgroup;
> +
> +       /* Test SOCK_OPS_GET_SK with same src/dst register */
> +       if (test__start_subtest("get_sk")) {
> +               run_sock_ops_test(skel, cgroup_fd,
> +                                 bpf_program__fd(skel->progs.sock_ops_ge=
t_sk_same_reg));
> +               ASSERT_EQ(skel->bss->null_seen, 1, "null_seen");
> +               ASSERT_EQ(skel->bss->bug_detected, 0, "bug_not_detected")=
;
> +       }
> +
> +       /* Test SOCK_OPS_GET_FIELD with same src/dst register */
> +       if (test__start_subtest("get_field")) {
> +               run_sock_ops_test(skel, cgroup_fd,
> +                                 bpf_program__fd(skel->progs.sock_ops_ge=
t_field_same_reg));
> +               ASSERT_EQ(skel->bss->field_null_seen, 1, "field_null_seen=
");
> +               ASSERT_EQ(skel->bss->field_bug_detected, 0, "field_bug_no=
t_detected");
> +       }
> +
> +       /* Test SOCK_OPS_GET_SK with different src/dst register */
> +       if (test__start_subtest("get_sk_diff_reg")) {
> +               run_sock_ops_test(skel, cgroup_fd,
> +                                 bpf_program__fd(skel->progs.sock_ops_ge=
t_sk_diff_reg));
> +               ASSERT_EQ(skel->bss->diff_reg_null_seen, 1, "diff_reg_nul=
l_seen");
> +               ASSERT_EQ(skel->bss->diff_reg_bug_detected, 0, "diff_reg_=
bug_not_detected");
> +       }
> +
> +       sock_ops_get_sk__destroy(skel);
> +close_cgroup:
> +       close(cgroup_fd);
> +}
> diff --git a/tools/testing/selftests/bpf/progs/sock_ops_get_sk.c b/tools/=
testing/selftests/bpf/progs/sock_ops_get_sk.c
> new file mode 100644
> index 0000000000000..3a0689f8ce7ca
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/progs/sock_ops_get_sk.c
> @@ -0,0 +1,117 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include "vmlinux.h"
> +#include <bpf/bpf_helpers.h>
> +#include "bpf_misc.h"
> +
> +/*
> + * Test the SOCK_OPS_GET_SK() and SOCK_OPS_GET_FIELD() macros in
> + * sock_ops_convert_ctx_access() when dst_reg =3D=3D src_reg.
> + *
> + * When dst_reg =3D=3D src_reg, the macros borrow a temporary register t=
o load
> + * is_fullsock / is_locked_tcp_sock, because dst_reg holds the ctx point=
er
> + * and cannot be clobbered before ctx->sk / ctx->field is read. If
> + * is_fullsock =3D=3D 0 (e.g., TCP_NEW_SYN_RECV with a request_sock), th=
e macro
> + * must still zero dst_reg so the verifier's PTR_TO_SOCKET_OR_NULL /
> + * SCALAR_VALUE type is correct at runtime. A missing clear leaves a sta=
le
> + * ctx pointer in dst_reg that passes NULL checks (GET_SK) or leaks a ke=
rnel
> + * address as a scalar (GET_FIELD).
> + *
> + * When dst_reg !=3D src_reg, dst_reg itself is used to load is_fullsock=
, so
> + * the JEQ (dst_reg =3D=3D 0) naturally leaves it zeroed on the !fullsoc=
k path.
> + */
> +
> +int bug_detected;
> +int null_seen;
> +
> +SEC("sockops")
> +__naked void sock_ops_get_sk_same_reg(void)
> +{
> +       asm volatile (
> +               "r7 =3D *(u32 *)(r1 + %[is_fullsock_off]);"
> +               "r1 =3D *(u64 *)(r1 + %[sk_off]);"
> +               "if r7 !=3D 0 goto 2f;"
> +               "if r1 =3D=3D 0 goto 1f;"
> +               "r1 =3D %[bug_detected] ll;"
> +               "r2 =3D 1;"
> +               "*(u32 *)(r1 + 0) =3D r2;"
> +               "goto 2f;"
> +       "1:"
> +               "r1 =3D %[null_seen] ll;"
> +               "r2 =3D 1;"
> +               "*(u32 *)(r1 + 0) =3D r2;"
> +       "2:"
> +               "r0 =3D 1;"
> +               "exit;"
> +               :
> +               : __imm_const(is_fullsock_off, offsetof(struct bpf_sock_o=
ps, is_fullsock)),
> +                 __imm_const(sk_off, offsetof(struct bpf_sock_ops, sk)),
> +                 __imm_addr(bug_detected),
> +                 __imm_addr(null_seen)
> +               : __clobber_all);
> +}
> +
> +/* SOCK_OPS_GET_FIELD: same-register, is_locked_tcp_sock =3D=3D 0 path. =
*/
> +int field_bug_detected;
> +int field_null_seen;
> +
> +SEC("sockops")
> +__naked void sock_ops_get_field_same_reg(void)
> +{
> +       asm volatile (
> +               "r7 =3D *(u32 *)(r1 + %[is_fullsock_off]);"
> +               "r1 =3D *(u32 *)(r1 + %[snd_cwnd_off]);"
> +               "if r7 !=3D 0 goto 2f;"
> +               "if r1 =3D=3D 0 goto 1f;"
> +               "r1 =3D %[field_bug_detected] ll;"
> +               "r2 =3D 1;"
> +               "*(u32 *)(r1 + 0) =3D r2;"
> +               "goto 2f;"
> +       "1:"
> +               "r1 =3D %[field_null_seen] ll;"
> +               "r2 =3D 1;"
> +               "*(u32 *)(r1 + 0) =3D r2;"
> +       "2:"
> +               "r0 =3D 1;"
> +               "exit;"
> +               :
> +               : __imm_const(is_fullsock_off, offsetof(struct bpf_sock_o=
ps, is_fullsock)),
> +                 __imm_const(snd_cwnd_off, offsetof(struct bpf_sock_ops,=
 snd_cwnd)),
> +                 __imm_addr(field_bug_detected),
> +                 __imm_addr(field_null_seen)
> +               : __clobber_all);
> +}
> +
> +/* SOCK_OPS_GET_SK: different-register, is_fullsock =3D=3D 0 path. */
> +int diff_reg_bug_detected;
> +int diff_reg_null_seen;
> +
> +SEC("sockops")
> +__naked void sock_ops_get_sk_diff_reg(void)
> +{
> +       asm volatile (
> +               "r7 =3D r1;"
> +               "r6 =3D *(u32 *)(r7 + %[is_fullsock_off]);"
> +               "r2 =3D *(u64 *)(r7 + %[sk_off]);"
> +               "if r6 !=3D 0 goto 2f;"
> +               "if r2 =3D=3D 0 goto 1f;"
> +               "r1 =3D %[diff_reg_bug_detected] ll;"
> +               "r3 =3D 1;"
> +               "*(u32 *)(r1 + 0) =3D r3;"
> +               "goto 2f;"
> +       "1:"
> +               "r1 =3D %[diff_reg_null_seen] ll;"
> +               "r3 =3D 1;"
> +               "*(u32 *)(r1 + 0) =3D r3;"
> +       "2:"
> +               "r0 =3D 1;"
> +               "exit;"
> +               :
> +               : __imm_const(is_fullsock_off, offsetof(struct bpf_sock_o=
ps, is_fullsock)),
> +                 __imm_const(sk_off, offsetof(struct bpf_sock_ops, sk)),
> +                 __imm_addr(diff_reg_bug_detected),
> +                 __imm_addr(diff_reg_null_seen)
> +               : __clobber_all);
> +}
> +
> +char _license[] SEC("license") =3D "GPL";
> --
> 2.43.0
>
>

Reviewed-by: Sun Jian <sun.jian.kdev@gmail.com>
