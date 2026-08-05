Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876143D3339
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 19:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785957636; cv=pass; b=Q8N2bkZWC2+zseiLYFzQs65q6cTxgz2U3d34tGJrCLFvGuVdNyFbE/IhRmoMJ8K/WiuxyqqqhoyyZGW1lwk5F5KCHUsyYHRONoMe3DnPUOsn726Sp224CLlT/w8fw6TIKeF+lRtaQGvSApl/AQ+th3T+KR59MJgAWGZHlRFYvLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785957636; c=relaxed/simple;
	bh=1xTnhDTVVprKfJCAfqFEyy5GesCuVs5KB9QoW6bxQjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qn0CF3sF4MXs0rqMNhDSHAI7nSAtgiKr+bXGMkhJF9KIl5ie2IyNoDYXez3sHF88Uzznrxy4XDFnx7pLe0KfOD4lqFw9AyVLNWoMIlUMHnv1UjWCoyPumspKCsQduZUpnbMiNyZKfMp/mGhyd96Ax9p+1vyeDg2rML3hMnqqcd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IBlAdvxL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=syJF9Blf; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IBlAdvxL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="syJF9Blf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785957633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JqQu/WpaLKkJsCAcXftHM0h14eMSmpLTgxcs+bPq/tA=;
	b=IBlAdvxLT/zq6Jv3FLgaTZ7yNgywN4Q2cczse2xOBZ5NqQ3/YvNdQBo6NCUYBWoy2pBEET
	eh1Q9yShZG36YCl0eEoco7oHrXqiEX6I0iMG01p8RBMzTPFqpAHk4FJuES3thk1HUhpsqJ
	12c0Z9zlRh9zIbRJ+0tGnRhEV5548/c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-3YoqXVXdORWE60y_3lekJA-1; Wed, 05 Aug 2026 15:20:27 -0400
X-MC-Unique: 3YoqXVXdORWE60y_3lekJA-1
X-Mimecast-MFC-AGG-ID: 3YoqXVXdORWE60y_3lekJA_1785957626
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-495569acf8dso8481135e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 05 Aug 2026 12:20:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785957626; cv=none;
        d=google.com; s=arc-20260327;
        b=l9ikOw11PaP/NpO0enzJnvg5KjfOwgaj0cPgaM1GJqO743ngAFjF3wv6yhi6gY9359
         mMVBKRGcTyc6KphEjhgppXzMZ3ztNP1cu86y9MgJY7pFoNBeRd7FklBdd9SyWYCysDT2
         B2SD9LzVmHzBTJYbV/NadFZ18BYtdmnkbxC7ZbY5wsk0InGygw01zwWIcp6Pv8M5l8jw
         01d8HoiSKg7eM4ajlznjAPidR3+aq2Paqjj2qNohaE2lLhHllaPg9EoNRyY5rO069qp2
         1aQNJM836P8y/6foracmgnOtfksSUu1C80mE43x0GNKGm+iaiE+LJXcMdOay9g9Afwzf
         bl1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JqQu/WpaLKkJsCAcXftHM0h14eMSmpLTgxcs+bPq/tA=;
        fh=JOhnWB6BSEw6Qk/1ojA1SIvyntHP6hOdEmiWWRvAomY=;
        b=r7QpCn84nht3+EvFHO7TXTNWY+69c+7T3srGrbdMgeFoLjJDCDZLrBua8eTG2OPIQY
         tvFlCyNCR5cOAjdQnrRkxN5RvATEHOfRI1x7OJgVuz8UCHJigMmmBu5WPPBY5XlugS8a
         5jlU3t5s39+H+bnUnaINce9WOLALZmn+wGHoKvuNs6RWnuxeG4s9Ebewtp5+4+hkDMIx
         Y+psAVHYPqPUjQ0E1DLf0VaPDYO2bnC9/VnegdQ3CWX9xQD/Cs9os9NsIwtnLo+RiqWm
         CdzBSr7f3AwhMKPVRaXlomVS7nGc5lbwmCG88pDYU5mvvVJV1/4KoARMCDEjB/piCRz2
         rScQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785957626; x=1786562426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JqQu/WpaLKkJsCAcXftHM0h14eMSmpLTgxcs+bPq/tA=;
        b=syJF9Blf404u4cLIHOEnmas5ePRghfoS+KqgdTD47ejXLpMtZN584gx3slgEmSMWJN
         ImGbroTLqLJgoUQsZ44GwCpmsaDAFK3xMSENJA2jrWk2arja9bYHqCvZ/qKnE6R8/jvS
         sqvAhZ3mH6pW0pKxDDJtfIl8WlFwrQrvicsVYSu+qmxSFJM1fSNEax1VIAgdNDShlaVi
         1VvCbkSidrLhhoqPTqyO1kXgwgCMmtEPTHjG0nw40QFdGHr6yTYDfEwxR8qCDnmnRL8W
         ++LsZnIuMbE3uWpRkyAxaoCiquF47kINowe6VKjOUpcxa+IjQks9cr7cueYN7dt+qJoT
         GzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785957626; x=1786562426;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqQu/WpaLKkJsCAcXftHM0h14eMSmpLTgxcs+bPq/tA=;
        b=oC22ki7qKet1BykZ8sueSNj/Uwi8SDpPfJ10gOQR+u+p6oBcLVmLK6gwl7LoVkOUVn
         BjV2UfOJDvGoJKj1cVab1f+HSUde7mhMsByRVDU+G4PG8jfqeMW1XjBBvnbDRASVZqbG
         jxiC6WX3OmOfh+TvZk0alQByU4hKzxiVoyewwCX20D3Q+sD6xBO2dCmbr9mf+7iR25pF
         LiY1KQqXn1FAf5ZPWeO1y5/wzRrz7S5UUA2XMZZJbi4ps3EzPtB9tahHjXv2UFirsa/L
         t7iMxotn2pTXEAIAHTVX5NQE6QvVmJ3+pnxPUf3GXxqE9ZqZCSfgHZoA/F3SKMpOZ7S7
         B5PA==
X-Forwarded-Encrypted: i=1; AHgh+RpPTyBC7IOjmNOK6BgvO/oGm4F758a8PWycVVPmY3XdCFu1Si2Dvb+DAaCN1irCeOmYTpU83YUZVzruDUj0J7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP8ERvstKKznV67Zo6Xp1rlhTShcb6WExdWq1kQViWYS57mrjZ
	UYJBcTbbugSPWtsgyZJnTEtUUAxDlNJ2Clhe/dS1v3qfCl0i+eyhJnEIi1IMSGcpL4qBZkp17kT
	KkC5Zb+CrdbvzaoW2SbMwIOIqdAtMqLTHu3V9BNKn6XR1V/ptMYznov6Z85kjVsFrkhHN2Dxxyz
	wP3zECDcgvI2DkBTzvdyL1jNzDKnmyQZySrTdeL/5iunVo
X-Gm-Gg: AR+sD13h7pSKFS1mVCjxcfM4wFHNDcGHr9dQcms/7XoL4uaMOVD420E4X+Iw0Ha5Tev
	MUaL0c3cGY9QSp9WpdpJzKJAytKBkfzukLpR/wA1nIM63EtZ1PsQWqaR1oGc5o5e8kkJvSDY7Uk
	Flmio4/WlZkGvCRaSq1pzk4X+tmy2ySMPbu7goJeaz6OS45a3ei00s191+jEoJIEZVCsbFVr1El
	gspJTC50TFZYXD83g==
X-Received: by 2002:a05:600c:5246:b0:495:52dc:73a9 with SMTP id 5b1f17b1804b1-4994e7ba79dmr105729495e9.11.1785957625934;
        Wed, 05 Aug 2026 12:20:25 -0700 (PDT)
X-Received: by 2002:a05:600c:5246:b0:495:52dc:73a9 with SMTP id
 5b1f17b1804b1-4994e7ba79dmr105728815e9.11.1785957625414; Wed, 05 Aug 2026
 12:20:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260725001614.2578617-1-tchiu@tenstorrent.com> <20260725001614.2578617-4-tchiu@tenstorrent.com>
In-Reply-To: <20260725001614.2578617-4-tchiu@tenstorrent.com>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Wed, 5 Aug 2026 15:20:14 -0400
X-Gm-Features: AUfX_mxVwTZAnVbtFKcu_xIR_Gmzo6gL93hh7hFktvBjsiqAZTRwAMyIZ7ACEgY
Message-ID: <CADRr4be7dwuMk2sxgXRgx89ph5uYNqveX0=H17j35+VBCJ10mw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] selftests: riscv: hwprobe: test the
 RISCV_HWPROBE_KEY_EXT_ENABLED modifier
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bergner@tenstorrent.com, 
	kito.cheng@sifive.com, dfustini@oss.tenstorrent.com, greentime.hu@sifive.com, 
	Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 8:17=E2=80=AFPM Andy Chiu <tchiu@tenstorrent.com> w=
rote:
>
> Add a selftest for the RISCV_HWPROBE_KEY_EXT_ENABLED modifier key, which
> reports the extensions that are not only present in hardware but also
> enabled for the calling process.
>
> The modifier is positional within a single hwprobe request: keys placed
> before it report what is present in hardware, keys placed after it report
> what is present and enabled. A single query therefore returns both views:
>
>       [ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
>           present       modifier       enabled
>
> The test uses this to check that Vector is masked out of the enabled view
> once V is disabled for the process, while remaining in the present view.
>
> The disabled-V check depends on user space being allowed to run vector
> instructions by default (/proc/sys/abi/riscv_v_default_allow =3D=3D 1). T=
he
> checks that require the modifier or V in hardware are skipped when either
> is unavailable.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>

Tested-by: Jesse Taube <jtaubepe@redhat.com>

Tested with:
https://github.com/Mr-Bossman/dbtr-buildroot/tree/user_V_hwprobe

Makefile doesn't apply cleanly on 7.1, just modify it and run
`touch buildroot/output/build/linux-7.1/.stamp_patched`
and continue build.
Inside qemu run:
```sh
cd /usr/lib/kselftests/riscv
./ext-enabled
```

> ---
>  .../selftests/riscv/hwprobe/.gitignore        |   2 +
>  .../testing/selftests/riscv/hwprobe/Makefile  |  14 ++-
>  .../selftests/riscv/hwprobe/ext-enabled.c     | 111 ++++++++++++++++++
>  .../riscv/hwprobe/ext-enabled_nolibc.c        |  58 +++++++++
>  4 files changed, 181 insertions(+), 4 deletions(-)
>  create mode 100644 tools/testing/selftests/riscv/hwprobe/ext-enabled.c
>  create mode 100644 tools/testing/selftests/riscv/hwprobe/ext-enabled_nol=
ibc.c
>
> diff --git a/tools/testing/selftests/riscv/hwprobe/.gitignore b/tools/tes=
ting/selftests/riscv/hwprobe/.gitignore
> index 6e384e80ea1a..ceb4bf86340c 100644
> --- a/tools/testing/selftests/riscv/hwprobe/.gitignore
> +++ b/tools/testing/selftests/riscv/hwprobe/.gitignore
> @@ -1,3 +1,5 @@
>  hwprobe
>  cbo
>  which-cpus
> +ext-enabled
> +ext-enabled_nolibc
> diff --git a/tools/testing/selftests/riscv/hwprobe/Makefile b/tools/testi=
ng/selftests/riscv/hwprobe/Makefile
> index 71e3f26c541b..55be82758830 100644
> --- a/tools/testing/selftests/riscv/hwprobe/Makefile
> +++ b/tools/testing/selftests/riscv/hwprobe/Makefile
> @@ -2,9 +2,8 @@
>  # Copyright (C) 2021 ARM Limited
>  # Originally tools/testing/arm64/abi/Makefile
>
> -CFLAGS +=3D -I$(top_srcdir)/tools/include
> -
> -TEST_GEN_PROGS :=3D hwprobe cbo which-cpus
> +TEST_GEN_PROGS :=3D hwprobe cbo which-cpus ext-enabled
> +TEST_GEN_PROGS_EXTENDED :=3D ext-enabled_nolibc
>
>  include ../../lib.mk
>
> @@ -12,7 +11,14 @@ $(OUTPUT)/hwprobe: hwprobe.c sys_hwprobe.S
>         $(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
>
>  $(OUTPUT)/cbo: cbo.c sys_hwprobe.S
> -       $(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
> +       $(CC) -static -o $@ $(CFLAGS) -I$(top_srcdir)/tools/include $(LDF=
LAGS) $^
>
>  $(OUTPUT)/which-cpus: which-cpus.c sys_hwprobe.S
>         $(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
> +
> +$(OUTPUT)/ext-enabled: ext-enabled.c sys_hwprobe.S
> +       $(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
> +
> +$(OUTPUT)/ext-enabled_nolibc: ext-enabled_nolibc.c
> +       $(CC) -nostdlib -static -include ../../../../include/nolibc/nolib=
c.h \
> +               -Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
> diff --git a/tools/testing/selftests/riscv/hwprobe/ext-enabled.c b/tools/=
testing/selftests/riscv/hwprobe/ext-enabled.c
> new file mode 100644
> index 000000000000..887820911629
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/hwprobe/ext-enabled.c
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Test the RISCV_HWPROBE_KEY_EXT_ENABLED positional modifier.
> + *
> + * The modifier is a one-way switch within a single hwprobe request: key=
s
> + * before it report what is present in hardware, keys after it report wh=
at is
> + * also enabled for the calling process. A single query returns both vie=
ws:
> + *
> + *     [ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
> + *         present       modifier       enabled
> + *
> + * When V is disabled for the process it must drop out of the enabled vi=
ew but
> + * stay in the present view. V cannot be turned off for a thread that al=
ready
> + * has it on (prctl returns -EPERM); the NEXT control only takes effect =
across
> + * execve(). So the disabled-V case runs in a forked child that sets NEX=
T=3Doff
> + * and execs a nolibc worker (built without libc so no vector-optimized =
libc
> + * routine can SIGILL while V is off). The worker reports back via exit =
code.
> + */
> +#include <unistd.h>
> +#include <sys/prctl.h>
> +#include <sys/wait.h>
> +#include "hwprobe.h"
> +#include "kselftest.h"
> +
> +#ifndef PR_RISCV_V_SET_CONTROL
> +#define PR_RISCV_V_SET_CONTROL         69
> +#define PR_RISCV_V_VSTATE_CTRL_OFF     1
> +#endif
> +#define VSTATE_CTRL_NEXT_SHIFT         2
> +
> +#define WORKER "./ext-enabled_nolibc"
> +
> +/* Verdicts returned by the worker. */
> +#define VOFF_OK                0       /* present keeps V, enabled masks=
 it */
> +#define VOFF_BUG       1       /* enabled view still reported V */
> +#define VOFF_SETUP     2       /* could not disable V / probe failed */
> +
> +/* Run the canonical present/enabled query; returns the raw syscall resu=
lt. */
> +static long query(__u64 *present, __u64 *enabled, __s64 *mod_key)
> +{
> +       struct riscv_hwprobe pairs[3] =3D {
> +               { .key =3D RISCV_HWPROBE_KEY_IMA_EXT_0, },
> +               { .key =3D RISCV_HWPROBE_KEY_EXT_ENABLED, },
> +               { .key =3D RISCV_HWPROBE_KEY_IMA_EXT_0, },
> +       };
> +       long ret =3D riscv_hwprobe(pairs, 3, 0, NULL, 0);
> +
> +       *present =3D pairs[0].value;
> +       *mod_key =3D pairs[1].key;
> +       *enabled =3D pairs[2].value;
> +       return ret;
> +}
> +
> +/* Fork a child that disables V across execve, and return the worker ver=
dict. */
> +static int probe_with_v_disabled(void)
> +{
> +       char * const argv[] =3D { WORKER, NULL };
> +       char * const envp[] =3D { NULL };
> +       int status;
> +       pid_t pid =3D fork();
> +
> +       if (pid < 0)
> +               return VOFF_SETUP;
> +       if (pid =3D=3D 0) {
> +               /* Disable V for the next execve of this child. */
> +               prctl(PR_RISCV_V_SET_CONTROL,
> +                     PR_RISCV_V_VSTATE_CTRL_OFF << VSTATE_CTRL_NEXT_SHIF=
T);
> +               execve(WORKER, argv, envp);

Can we print the error code here.
We should also say that you need to `cd /usr/lib/kselftests/riscv/` to
run this code
or use `argv[0]` to get the path of `WORKER`. That tripped me up when
testing and
is also an issue in `vstate_prctl`. Sidenote `vstate_prctl` seems to
panic in qemu.


> +               _exit(VOFF_SETUP);              /* execve failed */
> +       }
> +       if (waitpid(pid, &status, 0) < 0 || !WIFEXITED(status))
> +               return VOFF_SETUP;
> +       return WEXITSTATUS(status);
> +}
> +
> +/*
> + * This test assumes the user space allow executing vector instruction a=
s a
> + * default behavior. Namely, /proc/sys/abi/riscv_v_default_allow is 1
> + */
> +int main(void)
> +{
> +       __u64 present =3D 0, enabled =3D 0;
> +       __s64 mod_key =3D 0;
> +       int verdict;
> +
> +       ksft_print_header();
> +       ksft_set_plan(2);
> +
> +       if (query(&present, &enabled, &mod_key))
> +               ksft_exit_fail_msg("hwprobe() failed\n");
> +
> +       ksft_test_result(mod_key =3D=3D RISCV_HWPROBE_KEY_EXT_ENABLED,
> +                        "RISCV_HWPROBE_KEY_EXT_ENABLED is recognized\n")=
;
> +
> +       /* The remaining checks need both the modifier and V in hardware.=
 */
> +       if (mod_key !=3D RISCV_HWPROBE_KEY_EXT_ENABLED ||
> +           !(enabled & RISCV_HWPROBE_IMA_V)) {
> +               ksft_test_result_skip("V off: present keeps V, enabled ma=
sks it\n");
> +               ksft_finished();
> +       }
> +
> +       /* V off (only reachable across execve): enabled view masks it. *=
/
> +       verdict =3D probe_with_v_disabled();
> +       if (verdict =3D=3D VOFF_SETUP)
> +               ksft_test_result_skip("V off: present keeps V, but could =
not disable V\n");

IMO I think this should be an error. Or atleast the cases where
`VOFF_SETUP` is returned not by the sub-program.

> +       else
> +               ksft_test_result(verdict =3D=3D VOFF_OK,
> +                                "V off: present keeps V, enabled masks i=
t\n");
> +
> +       ksft_finished();
> +}
> diff --git a/tools/testing/selftests/riscv/hwprobe/ext-enabled_nolibc.c b=
/tools/testing/selftests/riscv/hwprobe/ext-enabled_nolibc.c
> new file mode 100644
> index 000000000000..d7f0a3c8314d
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/hwprobe/ext-enabled_nolibc.c
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * nolibc worker for the RISCV_HWPROBE_KEY_EXT_ENABLED test.
> + *
> + * ext-enabled execs this program with V disabled for the process. It is=
 built
> + * with nolibc on purpose: there is no libc here, so no vector-optimized=
 libc
> + * routine can run and take a SIGILL while V is off. It probes the canon=
ical
> + * [present, modifier, enabled] request and reports a verdict via exit c=
ode:
> + *
> + *     0  present keeps V, enabled masks it  (correct)
> + *     1  enabled view still reports V        (bug)
> + *     2  setup problem (V not off, or hwprobe failed)
> + */

Can we use the same macros for both
+/* Verdicts returned by the worker. */
+#define VOFF_OK                0       /* present keeps V, enabled masks i=
t */
+#define VOFF_BUG       1       /* enabled view still reported V */
+#define VOFF_SETUP     2       /* could not disable V / probe failed */

Thanks,
Jesse
> +
> +#ifndef __NR_riscv_hwprobe
> +#define __NR_riscv_hwprobe             258
> +#endif
> +
> +#ifndef PR_RISCV_V_GET_CONTROL
> +#define PR_RISCV_V_GET_CONTROL         70
> +#define PR_RISCV_V_VSTATE_CTRL_OFF     1
> +#define PR_RISCV_V_VSTATE_CTRL_CUR_MASK        0x3
> +#endif
> +
> +#define RISCV_HWPROBE_KEY_IMA_EXT_0    4
> +#define RISCV_HWPROBE_KEY_EXT_ENABLED  17
> +#define RISCV_HWPROBE_IMA_V            (1 << 2)
> +
> +struct riscv_hwprobe {
> +       long long key;
> +       unsigned long long value;
> +};
> +
> +int main(void)
> +{
> +       struct riscv_hwprobe pairs[3] =3D {
> +               { .key =3D RISCV_HWPROBE_KEY_IMA_EXT_0 },
> +               { .key =3D RISCV_HWPROBE_KEY_EXT_ENABLED },
> +               { .key =3D RISCV_HWPROBE_KEY_IMA_EXT_0 },
> +       };
> +       long ctrl;
> +
> +       /* We must really be running with V turned off. */
> +       ctrl =3D prctl(PR_RISCV_V_GET_CONTROL, 0, 0, 0, 0);
> +       if (ctrl < 0 ||
> +           (ctrl & PR_RISCV_V_VSTATE_CTRL_CUR_MASK) !=3D PR_RISCV_V_VSTA=
TE_CTRL_OFF)
> +               return 2;
> +
> +       if (syscall(__NR_riscv_hwprobe, pairs, 3, 0, 0, 0))
> +               return 2;
> +
> +       /* Present view must still carry V (it is in hardware). */
> +       if (!(pairs[0].value & RISCV_HWPROBE_IMA_V))
> +               return 2;
> +
> +       /* Enabled view must have masked V out. */
> +       return (pairs[2].value & RISCV_HWPROBE_IMA_V) ? 1 : 0;
> +}
> --
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>

