Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA38338D3F6
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 19:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292323; cv=pass; b=ok1DTjWBwwCd66sw/IUSwXiPvFOS9NqlRqGkAjilawy8ll1ZngYT5SGrJoLIHL2EKLn/NSFWdtD7SMGtoBWkWj1EbQLxqR4Z9kcCeA0CK7p6Q1CmRHVxIJ0j9jfE+qr6Hvi2VceiS6d87hq6GS6G7DmfFcodHAf8ZPEhP+ZFsi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292323; c=relaxed/simple;
	bh=wtdSAI/WhKGBjuABTv5R/kXIRbC/rjQy6jOp30gmmV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3h3GrJ9fxxzroOb2YpcKCbtDusDsOZCKAKEg6V7zK0oiGyer72pBPSt55lWulDXO/IxpmI8c4n3eRqDXycSkPzVtIro3K5yaMyzWswag7YICdzXX95HNnJIoUcFX/HX3CESezn7iq4a/ssB7iFaG/BfSz0NOm6B55UNtXqIlhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DgF8gDjd; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DgF8gDjd"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ad0abf1f7bso988726e87.3
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 12:25:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781292320; cv=none;
        d=google.com; s=arc-20240605;
        b=CU4Jo9dd7b0W/7RiWdNr9c8BarHuHXjysPNGUXoi8dqV+ChGmkUYmcBd1kEMiAJ5Tv
         VNO2ulYsvSIeWb727B1hy2VoChPkspVZzcTRpLIFK1vYHq+OPz2sQDMhQEKUjkJT/thf
         UeeGeAeeUp5zh22lzAe9I15SKo6ZrBNR5a3vogOvY/iZ0Ntm2+mvrwM3t4u7Jp5sKjDg
         36o+6MTk7TyBDRvMNDOTVJ63frkn1N4RniPTQdMTHg6zA1T/oQs5HfEUiE+kMUH8EM9x
         mTi2IZuNCehN4c+zVUfhtjO1Y9EM2+igqGBzFjpF/ZaRO2NDkAcpYfABeZsdhBG1F+vH
         Fc8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JzbhYOVx15zdNgTlmqivEDbnFdm8e7TKoj1i3uih1i8=;
        fh=1fMRYLo3c8UXlkgIaa0OkEWzjb1RcoU6ZCy9ubgOMbU=;
        b=K4HRindXvmRk3a0phpfMLVLbbM9Wb6lUb+45/aWm42q2j3gayEt3l2HY/Cjw8k22Tm
         HnUNEvvoJb43ALynQQolnBJ4jmKaeiyTsY9Czmyr53Wk0lh1yIomL5H0MBnmgwU7YbEP
         EI5rYiY8yS6OuZB16PozOMCF9KPKjMCo5mEgyfAAKYBtCgsRvbtuM2uuJpqLcdoxKdmZ
         KNbwBE9DKwNWvORDKmxnDIzu5VLrwEzn1KUudkH35aOV4O/tnx2s0PiA9zfHLBnQm8uS
         2B97t5LlvJyAIr8hraLAe+WWNFlE2g7whrmxBOsC/xR1myocuqSKjT6SLJRC57YeBK00
         4tYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781292320; x=1781897120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzbhYOVx15zdNgTlmqivEDbnFdm8e7TKoj1i3uih1i8=;
        b=DgF8gDjdoPbi+WpN19e2HKMcEIJNpsRgG6t0J3ouGRuudtJMGdY/fnnNPidXbkFatF
         M/yI372egOH3EOroPtM2WdecxJojBzPApVemjhnc5QWBgXo4VCSkWmFNZXup6jl+DPRa
         dimn87G92CKfrIQBovIao5xy9HjLv8f9ykmeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292320; x=1781897120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JzbhYOVx15zdNgTlmqivEDbnFdm8e7TKoj1i3uih1i8=;
        b=D48VWf3S39ky28nSSOGVKPnBM6dP8tDlXttNokqbzHwFG/prjlLfOZZyEp4MbUAV+T
         gkBIYOyiRLAD/Fvt1CIHMv3PRnE12Ibop65LVfub2TXlXvDjwREzJgHlIaRgDmpTdZbq
         dvozDSPrM6Ph607zoT4Q0xAkatNCa1RvUE9xUM33/JGDbv18mR4wz6hlKIdcNvRv33Im
         pu38tkh8u6exXz1LkeuTY+v7aAeZht2+/gEWev3Emn6sp2fLZ+Jcg/WC7vu6ViQ+rT3V
         pck0P49VlqQqfvCnAaSnTsffICapdFgqJjBeXJmTxHG4SAt6zziEfmaPRjQE6Ali41he
         QWzw==
X-Forwarded-Encrypted: i=1; AFNElJ87+IYTY94vHXwmob4dpX1srDUhkf5MywIcnlXtx6sUKkFtxWGZ4bvU4knbLDyM9/64kJ+aSVwWr4SOpMtcfww=@vger.kernel.org
X-Gm-Message-State: AOJu0YyChIQjvjdTrCfye9SP/L5hartuoK5Ia8fnfeHatjdGMVH7/Dxy
	jpYVF/D8BfMnTLO3CzDeOgTDKIxN4GOfbGq6DKnUejEY/Ktk/DBAeDI3zR+WnYf+8SXdH1M9Ysg
	LkzM548qCgpdZqlR3oV53pr8u0a1QRvnkAyibIsFMCMmO30mSe1g0BN7m
X-Gm-Gg: Acq92OGotKEJRpMXuGej2LEBVPdhFjaU2JrDEaeqru7THeXfsnLy6QswxbUoypYq6of
	95VaNBUKNptd/lRKSyBhfIWcz7z9I3szSbiCcZLShV9EIOyL58VY0atiWakJ5eGoXGvVIxJ+sfj
	lAzL6M7IU8Ve7fNbbfJJitrYONgUS8qfqGoxp55qL/UrEKnPh6yq06TFtkTNWpVeakrHNYe6hX2
	DFN05ZqPKutBe4BXZamu+ZCCq9kFGszoeuLpHuAuH1swZWl50yDS78Ks3+3OYPrf04LvVr9ft/p
	QGS6Z3rw7muDodXyVSWfVltQbRbgh1D5yjXbvFC5FG1Zboxo
X-Received: by 2002:a05:6512:3b0a:b0:5aa:854c:61e0 with SMTP id
 2adb3069b0e04-5ad2db452d1mr1311594e87.20.1781292319447; Fri, 12 Jun 2026
 12:25:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-seccomp-combined-v1-0-304b1cc3ad24@hill-daniel.co.uk> <20260526-seccomp-combined-v1-1-304b1cc3ad24@hill-daniel.co.uk>
In-Reply-To: <20260526-seccomp-combined-v1-1-304b1cc3ad24@hill-daniel.co.uk>
From: Will Drewry <wad@chromium.org>
Date: Fri, 12 Jun 2026 14:25:03 -0500
X-Gm-Features: AVVi8CdO18l0E0vkUdggPdi_e7VaCUHGrQ-SUpY-fJfFGaS3PLmAAujQ6BHqK08
Message-ID: <CAAFS_9HpxOgHn+qfzSpLjV4Mj_CURiwxFOaK9GO0DdBg8xgNYw@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] seccomp: Allow using `SECCOMP_MODE_STRICT`
 with `SECCOMP_MODE_FILTER`
To: Jamie Hill-Daniel <clubby789@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, Jamie Hill-Daniel <jamie@hill-daniel.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 10:42=E2=80=AFAM Jamie Hill-Daniel <clubby789@gmail=
.com> wrote:
>
> It is currently impossible to enable `SECCOMP_MODE_STRICT` if
> `SECCOMP_MODE_FILTER` is enabled, and vice-versa. This makes using
> seccomp difficult in environments such as Docker, which installs a
> seccomp filter by default.

Some quick thoughts on your resend -- the original reasons for
this approach:
(a) filter policy !=3D strict policy
(b) filter can implement strict, if layering is desired
(c) minimize checks in the syscall entry/return path

I'd expected folks to simply create the ~80 byte strict filter and install
it if they needed STRICT policy. More discussion below.

> Introduce a new internal `SECCOMP_MODE_COMBINED`
> that runs `strict` checks, followed by any installed filters.
>
> Link: https://github.com/moby/moby/issues/42082
> Signed-off-by: Jamie Hill-Daniel <jamie@hill-daniel.co.uk>
> ---
>  kernel/seccomp.c | 46 ++++++++++++++++++++++++++--------------------
>  1 file changed, 26 insertions(+), 20 deletions(-)
>
> diff --git a/kernel/seccomp.c b/kernel/seccomp.c
> index 25f62867a16d..8201a050d358 100644
> --- a/kernel/seccomp.c
> +++ b/kernel/seccomp.c
> @@ -33,6 +33,8 @@
>
>  /* Not exposed in headers: strictly internal use only. */
>  #define SECCOMP_MODE_DEAD      (SECCOMP_MODE_FILTER + 1)
> +/* Run SECCOMP_MODE_STRICT checks, followed by SECCOMP_MODE_FILTER  */
> +#define SECCOMP_MODE_COMBINED (SECCOMP_MODE_DEAD + 1)

I'm not sure if DEAD is meant to be fixed at the end of all modes or
not -- given that it's internal.

>
>  #ifdef CONFIG_SECCOMP_FILTER
>  #include <linux/file.h>
> @@ -432,14 +434,21 @@ static u32 seccomp_run_filters(const struct seccomp=
_data *sd,
>  }
>  #endif /* CONFIG_SECCOMP_FILTER */
>
> -static inline bool seccomp_may_assign_mode(unsigned long seccomp_mode)
> +/**
> + * seccomp_needs_combined: internal function for checking if requested m=
ode
> + * needs to be upgraded to `SECCOMP_MODE_COMBINED`.
> + *
> + */
> +static inline bool seccomp_needs_combined(unsigned long seccomp_mode)

It is easier to reason about if you keep the access checks separate from th=
e
behavior-change decision. Setting seccomp modes isn't on a particularly
performance-critical path, so we can be more verbose and explicit.

>  {
>         assert_spin_locked(&current->sighand->siglock);
>
> -       if (current->seccomp.mode && current->seccomp.mode !=3D seccomp_m=
ode)
> -               return false;
> +       if ((current->seccomp.mode =3D=3D SECCOMP_MODE_STRICT ||
> +            current->seccomp.mode =3D=3D SECCOMP_MODE_FILTER) &&
> +           current->seccomp.mode !=3D seccomp_mode)
> +               return true;

AFAICT, the only valid "combined" case is current->seccomp.mode=3D=3DFILTER
and seccomp_mode=3D=3DSTRICT.   There are other allowed transitions, but
not allowed for transitioning from FILTER->STRICT via COMBINED.

If this wasn't subsuming the update access check, then the single allowed
transition could be checked in set_mode_strict() (or a helper).

>
> -       return true;
> +       return false;
>  }
>
>  void __weak arch_seccomp_spec_mitigate(struct task_struct *task) { }
> @@ -1407,6 +1416,9 @@ int __secure_computing(void)
>                 WARN_ON_ONCE(1);
>                 do_exit(SIGKILL);
>                 return -1;
> +       case SECCOMP_MODE_COMBINED:
> +               __secure_computing_strict(this_syscall);
> +               return __seccomp_filter(this_syscall, false);
>         default:
>                 BUG();
>         }
> @@ -1421,30 +1433,23 @@ long prctl_get_seccomp(void)
>  /**
>   * seccomp_set_mode_strict: internal function for setting strict seccomp
>   *
> - * Once current->seccomp.mode is non-zero, it may not be changed.
> + * Once current->seccomp.mode is non-zero, it may only be changed to `CO=
MBINED` or `DEAD`.
>   *
> - * Returns 0 on success or -EINVAL on failure.
>   */
> -static long seccomp_set_mode_strict(void)
> +static void seccomp_set_mode_strict(void)
>  {
> -       const unsigned long seccomp_mode =3D SECCOMP_MODE_STRICT;
> -       long ret =3D -EINVAL;
> +       unsigned long seccomp_mode =3D SECCOMP_MODE_STRICT;
>
>         spin_lock_irq(&current->sighand->siglock);
>
> -       if (!seccomp_may_assign_mode(seccomp_mode))
> -               goto out;
> +       if (seccomp_needs_combined(seccomp_mode))
> +               seccomp_mode =3D SECCOMP_MODE_COMBINED;
>
>  #ifdef TIF_NOTSC
>         disable_TSC();
>  #endif
>         seccomp_assign_mode(current, seccomp_mode, 0);
> -       ret =3D 0;
> -
> -out:
>         spin_unlock_irq(&current->sighand->siglock);
> -
> -       return ret;

Is this reachable when mode is DEAD? In its current form, it would fail
out on may_assign_mode(), but now you have to consider if a race
could silently clobber the DEAD value (let's say).

>  }
>
>  #ifdef CONFIG_SECCOMP_FILTER
> @@ -1956,7 +1961,7 @@ static bool has_duplicate_listener(struct seccomp_f=
ilter *new_child)
>  static long seccomp_set_mode_filter(unsigned int flags,
>                                     const char __user *filter)
>  {
> -       const unsigned long seccomp_mode =3D SECCOMP_MODE_FILTER;
> +       long seccomp_mode =3D SECCOMP_MODE_FILTER;
>         struct seccomp_filter *prepared =3D NULL;
>         long ret =3D -EINVAL;
>         int listener =3D -1;
> @@ -2016,8 +2021,8 @@ static long seccomp_set_mode_filter(unsigned int fl=
ags,
>
>         spin_lock_irq(&current->sighand->siglock);
>
> -       if (!seccomp_may_assign_mode(seccomp_mode))
> -               goto out;
> +       if (seccomp_needs_combined(seccomp_mode))
> +               seccomp_mode =3D SECCOMP_MODE_COMBINED;

So I have two concerns here --

1. By layering, STRICT becomes subject to FILTER RET behaviors.
2. If we did want to layer them, it would be ideal to separate the 'upgrade=
'
    decision from the access checks and make the layering path explicit.

If you are running a legacy binary that uses STRICT in Docker, then I
understand the goal, but there are userspace options.

I think it's hard to want to open the door on changing STRICT without
a good reason to work through all the implications that come with it:
cross-checking every SECCOMP_MODE_FILTER reference, sorting
out thread sync interactions, ...

That said, this change could be streamlined and look for ways
to minimize any potential implications.

Am I missing something or overstating it?

Thanks!
will

>
>         if (has_duplicate_listener(prepared)) {
>                 ret =3D -EBUSY;
> @@ -2105,7 +2110,8 @@ static long do_seccomp(unsigned int op, unsigned in=
t flags,
>         case SECCOMP_SET_MODE_STRICT:
>                 if (flags !=3D 0 || uargs !=3D NULL)
>                         return -EINVAL;
> -               return seccomp_set_mode_strict();
> +               seccomp_set_mode_strict();
> +               return 0;
>         case SECCOMP_SET_MODE_FILTER:
>                 return seccomp_set_mode_filter(flags, uargs);
>         case SECCOMP_GET_ACTION_AVAIL:
>
> --
> 2.54.0
>
