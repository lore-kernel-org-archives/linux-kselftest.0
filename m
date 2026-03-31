Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26298367F23
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 17:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977408; cv=pass; b=V2bbLjkMm3kGJgTBPtneW8umD180OP0RLWCW0xCh8FvGKkkfqkNe2ZVTjo5jXH9O4Tkb1s0CRbpGfq5UFbGqTMxwwNd7lxAioj/8TdITEbyt6OcGnbovlhT8vM79D2LU7ka9CZmKXuVLHtVThxWmoMnTcLTnaVcpjM0QU4MzYss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977408; c=relaxed/simple;
	bh=AlaAv/oY4ZLWVnm12PAYx9dKZ0BFTL5ugcVHQKGpG3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PSlyYuwJeQlUEsg8hyphIACS/rQpgBWQVp0gCkgB9w4FipXTY0n7K99/mCbyHGEEFDCpahWyZv3322CegERnn1Cw9DFUosOaC9O1pP9cyizBbVCQeczLH3nwdJHc6wkqu0B60sQLyJQ1sOsZMLmMyP3pJ3pFC8ouHoSQ1OGoA8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sAGabPzm; arc=pass smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sAGabPzm"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-60328744754so3688467137.3
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 10:16:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774977406; cv=none;
        d=google.com; s=arc-20240605;
        b=IrMSR1bUkLo//MFv7z5XGi3aeOOuQsbk8mFwzSRfc/DSPphTResxSXBM9cBZb4WpX+
         iYZNArjmBVIcagGtn4W06n8okaeewxQlZ3zpX1wpaAroGrnzR/u1LnWPlhqKOyHlEC+i
         QrMCLMONoMjlZMsZIp6Wxvvlirr1ftOtmvZ0Wo/UzR4lZQ9vQOHfM02qJ9DPNwG05JRK
         b/1bkYfZvF8uPXERamRYb5ieaGth4ABHYDvZ4ZobJ+rx2zwyGm3pS0+GD+frqws0yGwv
         pTl60gzi0eSRAuPOSNJDV32WvU99spXCzi7wuRSUkkwnehV6C83BKqC2qWVu0XMnB9Db
         i5+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8hJONhGlSkQz5oARDr2KezeMGnAwxGjBhhSBkIE6ImE=;
        fh=aiFpPRKr+ReD9l+o8pTfSy7K79c4FJ4c9pPF48u1zlE=;
        b=E/VP1loHidcHwM3KyL8P5AfQ70/HgDK/RsPONV9He9zqe7FHUWTuSSowB6bcGmtwsL
         +baGGzbVcrJqw7eKci2VJNSzlatfnqnmcqpPEgc1BIjhMgE1mwRA9FqEiptZxH11Pf82
         qDvZ8XpNf/j40AYNyxC7CSEXIo5IuBtO82O1jqTDorchYHp8ldcUAsWvHe42BIz3GEHS
         MJbNm5lmJbTLqZw8yCvXJKjogmw+RMH3E3Gs0uzbmdGYoa1n8CCoTn8yF05LRCV6OEpq
         hzz5mlpF/AxC3xgMx8QU6+6SGBAFf+WAtKZm0TKYGmIkYvQf+ZYlJj7+6DOtV2xIjOrD
         4F8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774977406; x=1775582206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hJONhGlSkQz5oARDr2KezeMGnAwxGjBhhSBkIE6ImE=;
        b=sAGabPzm+raYS9P5oOb5Zc6TGJRAnubWcaRAD/VHvUoi6+PML4oTkYzmnVJdTIYveS
         xhXbom9Yq3JLNWLx/m3XBWof288S0rqJLVUXfw6yfB37f8W9EzXNmHIpb4qG25uG+3GK
         VmGKkmL8IxVIIdZHmiPeMTlLG4GgKbfFzAPejUYUbAqgHCf7IX4hUDxZBs7X8lNE7jam
         9ma3VqTryaUqttLgv4v3i88qnUn20AJUz+xZW7nJQcT2icdMvsiq+OGGMK0zgSoMOLPE
         thudHBdYCWvHCsGGuRs9KLpZ8had5Skg8V+9OCFT/GCsmZnwCMgxTWSaZDwVCWJVRQ8Z
         bieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977406; x=1775582206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8hJONhGlSkQz5oARDr2KezeMGnAwxGjBhhSBkIE6ImE=;
        b=ScJIC5cw/oP6TkOQ7/L9qd5JRrNsyw6FSNRZotOxveLp7tamJJnUSBXxwepEkCSiaG
         qVsSPA1jLvedkkeH7qPaYOdiiFG5cQzoVylbNN2oVXqw5cwIqkpRks66Kf7ZqoSHz7We
         4wv4iZ5GCI11/r2dshsl8DJP32iY1L3+YZ5A4VVRKexo45qkJx4p6KVA3ltjHAoh3qmj
         cVvnR5+2yeOLbUHnxSy/dPFw1IygFeLlHAanytzr3N2ednLzoGP1PLRKjvBmpf9vWwke
         xmVzrbRd6QHXaA5hLEamrm2cMUpvVZrWfraEJWHkuU66oKRtCnHsfnPv/35NajTx6ish
         vpCg==
X-Forwarded-Encrypted: i=1; AJvYcCU1ugloMZxJTo+kJKUsqFfVEgdirpGBATIA51t/fCgugthURXVy3viHwYU24UnIh45lkECh3Od8+5Rgm4zelfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSvs1UCgqdU4m3aiBgeHk8XWHzJghtq8GVzLle3lS1ow0zV5kt
	ikwiEdWYJb+0siitw/XGLtYgg3VQ57UrTTqQQbjMQyTIZ53DKsfpn9OwfMTE/OklmQyYypJhbRL
	0ATK1/V5GkW+vKnBPTv9GvydQxmC/ojwHAkFaor2l
X-Gm-Gg: ATEYQzz9BeYPid5HhEqS5wtoilkjAw8uVdH1d0GsiAArwfxYkA2Q7Ky0iCsIYZ3Wcyv
	ITs/VBbIFAPgbIBboaecaORakTYlEjQuDLu5dBOR2RbORRwj2WV11DJn5/G5msp5k6S/pUlV/cZ
	LnRF4JXA0fm0NfeJvGteg68/532b56nqu5ZcQ0tqPAkzpVx3dDET2tXWnbA+rJf32zIYWftl1nz
	VZfiCi64juyPZSzJsHgA6b/4/i2hyWSs2UQbSZ0udYEQfOYZQbcKAy1C7eQWk0xktNxnMIwfl7J
	IU6Sb1k=
X-Received: by 2002:a05:6102:c94:b0:602:ace8:f20e with SMTP id
 ada2fe7eead31-60567e8d127mr38526137.14.1774977400614; Tue, 31 Mar 2026
 10:16:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-4-kees@kernel.org>
In-Reply-To: <20260331163725.2765789-4-kees@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 31 Mar 2026 10:16:27 -0700
X-Gm-Features: AQROBzCGiv9foA1bZmO6VZEpCJ9MD_wSGSd-WaAakLK22vknVxHA_3Jppbf1n18
Message-ID: <CAFhGd8pqeckxVVmNrGkb51gdaeTa7MY3BvsRfWVBGd_i=oZxEg@mail.gmail.com>
Subject: Re: [PATCH 4/5] lkdtm/bugs: Add basic Overflow Behavior Types test
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Marco Elver <elver@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 31, 2026 at 9:37=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> Exercise the end-to-end build and trap infrastructure in the kernel for
> __ob_trap, __ob_wrap, and associated sanitizer ignore patterns (i.e. idio=
m
> exclusions). Add a test for each of the basic overflow conditions under
> CONFIG_OVERFLOW_BEHAVIOR_TYPES=3Dy, as well as the corner cases associate=
d
> with promotion, casting, etc.
>
> For example, executing this test with CONFIG_OVERFLOW_BEHAVIOR_TYPES_WARN=
=3Dy
> (instead of CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP=3Dy), will show:
>
>     $ echo OBT_ASSIGN_TRUNCATE_TO | cat >/sys/kernel/debug/provoke-crash/=
DIRECT
>     $ dmesg
>     ...
>     lkdtm: Performing direct entry OBT_ASSIGN_TRUNCATE_TO
>     UBSAN: implicit-conversion in ../drivers/misc/lkdtm/bugs.c:825:10
>     cannot represent 'int' value 2147483647 during reference binding to '=
u8t' (aka '__ob_trap u8'), truncated to 255
>
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: <linux-kselftest@vger.kernel.org>
> ---
>  drivers/misc/lkdtm/bugs.c               | 253 ++++++++++++++++++++++++
>  tools/testing/selftests/lkdtm/tests.txt |  10 +
>  2 files changed, 263 insertions(+)
>
> diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
> index e0098f314570..f00c9099957e 100644
> --- a/drivers/misc/lkdtm/bugs.c
> +++ b/drivers/misc/lkdtm/bugs.c
> @@ -817,6 +817,249 @@ static noinline void lkdtm_CORRUPT_PAC(void)
>  #endif
>  }
>
> +static void lkdtm_OBT_ASSIGN_TRUNCATE_TO(void)
> +{
> +       volatile int big =3D INT_MAX;
> +       volatile int wide_low_value =3D 5;
> +       u8 __ob_trap narrow_low_value =3D 0;
> +       s32 __ob_trap same =3D 0;
> +       u8 __ob_trap small =3D 0;
> +
> +       pr_info("Performing same-width assignment to OBT\n");
> +       same =3D big;
> +
> +       pr_info("Performing small-value assignment to OBT\n");
> +       narrow_low_value =3D wide_low_value;
> +
> +       pr_info("Expecting trap on truncated assignment to OBT\n");
> +       small =3D big;
> +
> +       pr_err("FAIL: survived overflowing truncated assignment to OBT: %=
d -> %u (ok: %d -> %u)\n",
> +               same, small, wide_low_value, narrow_low_value);
> +       pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
> +}
> +
> +static void lkdtm_OBT_ASSIGN_TRUNCATE_FROM(void)
> +{
> +       volatile s32 __ob_trap big =3D INT_MAX;
> +       volatile s32 __ob_trap wide_low_value =3D 5;
> +       u8 narrow_low_value =3D 0;
> +       s32 same =3D 0;
> +       u8 small =3D 0;
> +
> +       pr_info("Performing same-width assignment from OBT\n");
> +       same =3D big;
> +
> +       pr_info("Performing small-value assignment from OBT\n");
> +       narrow_low_value =3D wide_low_value;
> +
> +       pr_info("Expecting trap on truncated assignment from OBT\n");
> +       small =3D big;
> +
> +       pr_err("FAIL: survived overflowing truncated assignment from OBT:=
 %d -> %u (ok: %d -> %u)\n",
> +               same, small, wide_low_value, narrow_low_value);
> +       pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
> +}
> +
> +static void lkdtm_OBT_CAST_TRUNCATE(void)
> +{
> +       volatile u32 __ob_trap big =3D INT_MAX;
> +       u32 trunc =3D 0;
> +       u32 small =3D 0;
> +
> +       pr_info("Performing wrapping too-small cast\n");
> +       trunc =3D (u16 __ob_wrap)big;
> +
> +       pr_info("Expecting trap on too-small cast\n");
> +       small =3D (s16)big;
> +
> +       pr_err("FAIL: survived truncated casting: %u -> %u (ok: %u -> %u)=
\n",
> +               big, small, big, trunc);
> +       pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
> +}
> +
> +static void lkdtm_OBT_CAST_SIGNED(void)
> +{
> +       volatile u32 __ob_trap big =3D UINT_MAX;
> +       s32 neg =3D 0;
> +       s32 small =3D 0;
> +
> +       pr_info("Performing explicit sign-changing cast\n");
> +       neg =3D (s32 __ob_wrap)big;
> +
> +       pr_info("Expecting trap on unexpected sign-changing cast\n");
> +       small =3D (s32)big;
> +
> +       pr_err("FAIL: survived lossy sign conversion: %u -> %d (forced: %=
u -> %d)\n",
> +               big, small, big, neg);
> +       pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
> +}

Note to travelers and testers, we still have a compiler patch in
flight [1] that fixes a bug with sign-change instrumentation
concerning OBTs.

> +
> +static void lkdtm_OBT_MUL(void)
> +{
> +       /* Promotion means no overflow checking can happen. */
> +       volatile u8 __ob_trap a8 =3D 100;

<snip>

[1]: https://github.com/llvm/llvm-project/pull/188340

Justin
