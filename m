Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041680;
	b=Wth2k/HmdfNlJloZvpXBoPRtR+TcrnCQioOSH4lY+f5Zw+hoJXgWT/lxRqy/BdLnPywe
	 2CUbEenIaJaAifgthCLx/hfXJxNSxksWAij+95PA5fkCMIj7oKTAPy3ikkz5fzlbMoZee
	 y0znPTchKZVB0yHO1WXWHdHwVzEgEGz2k/WKN1+qlPdQCVpRnYuDiW0l9BbsT4CayE2H0
	 7eiYm/o6M91JNAfPgQ41vwiyrDdfKO8L8htr4XqvFi/92i4wHlPbxrRgO0Is65agvc51N
	 fODV4DwPvtYDAi0eGK/oj3e1xcWAKxCE7T9Uk7RtzSx3j0/p6SuhKLRdu4nEtuZNBFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041680;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=urfO6D4hqsaWObIrpF6xBqN7wc2zXiiEIXZMlS0+D0s=;
	b=FK4hrf2vdazSVMQZM9A7SbF6AenNylOVtLFQylKHnF74/GoFRGq2cajkef9PjjeJejE2
	 /x71PFp/Rou1Hd7+/OWIMO0iMU/tAYINn8lt0W16yyBlaB3oPAxiw2nzFG3BNQH+t526J
	 WWIRa/cnlPWuQG6hffhXWiySbMWqZeVuc2JciZvkajEcYny5+j4ubN9pkkMhawUGZuPwA
	 1hm3zjBGuJVGMUAPAZAn1UHU2tr48WfjbVfOSH3MbKTFltnuGmB5+mGUa+kF8hCeWwJRn
	 DPdnEMSIMZdEvpdrQOrHFUM34Z+ae1ehS2q1rCQzqUCNfKykQGE72f4SVZM9lE/m6hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UY2ho6jA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA25B606A31D
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 19:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UY2ho6jA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A891F031E0
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 19:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793041679;
	bh=urfO6D4hqsaWObIrpF6xBqN7wc2zXiiEIXZMlS0+D0s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UY2ho6jArPqIFaWq+Nzej3FIZZMDU+HH3zUAv5RWoTZJFF26qENwlX/PuSzeave9B
	 up8sNePlt/i79wnID0Z/QzG6yOp22f8t2E8ojlYTLzLcdvr7CpUlNjlIVBpKtqKliR
	 f6xADGHY9N43BI2fSnDjZC6UuGKYf+ZBeTykk9+zwmk1kaVMvCuVi6fI2WbKuD2y3m
	 PZ01ROgqxUWWOgz3acwz09J7CWAKdmIs9IhIMlDBIxHYoOVIDgL9OqyUhOKbMtWXAt
	 1O6MY7L4QAYAI4Z1EBBQA52A7u5aLR3P/7ZVDxz08JM6067J766dpceYp7Zfopvhun
	 h0Z3AENqJiBLw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so2884554e87.1
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 12:07:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxmDMjI5LEln2UoLpWOoOCu5l6g0Vq2hiuKrGvC9VY6UoElS+SKA6VskUyPzp8QN+kNrXoMWlwYXaUytmXNcPw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnVJ1rZoicoV3eaGWtYk1dwq7iDeTYRSGc5qoeFFBYI7DbnlSK
	fO5mNfoydluQ6w//V9G7Hf9p5Jzmt5Zhm49NqLHQHKBShpLMLNu80fOXVCnI8y+SYNPUj9Ps5xY
	IrEpATgPI/uwD9qkQkXYibDZdiDd93Uw=
X-Received: by 2002:a05:6512:3d91:b0:5bf:c4d2:b074 with SMTP id
 2adb3069b0e04-5bfc4d2b178mr465139e87.55.1793041677961; Mon, 26 Oct 2026
 12:07:57 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014200127.1363472-1-sashal@kernel.org> <20261014200127.1363472-4-sashal@kernel.org>
In-Reply-To: <20261014200127.1363472-4-sashal@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 26 Oct 2026 20:07:44 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hN1xj6wnf53QAD_OZxJHyy3DNAXeMWBnVrTZ4xcBBG5A@mail.gmail.com>
X-Gm-Features: AclHuK8f4uksRxlVflTjoQx-AJmosU8fA-9vAMQQLIJZ0eA6F1YTlLjjzwLCkvw
Message-ID: <CAJZ5v0hN1xj6wnf53QAD_OZxJHyy3DNAXeMWBnVrTZ4xcBBG5A@mail.gmail.com>
Subject: Re: [PATCH 3/5] selftests/thermal: allow cross builds of the Intel tests
To: Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 10:01=E2=80=AFPM Sasha Levin <sashal@kernel.org> wr=
ote:
>
> The power_floor and workload_hint Makefiles build nothing when
> CROSS_COMPILE is set, even for an x86 target, and they include lib.mk
> only on x86. Other architectures therefore have no install or
> emit_tests rules for these suites, and their installation fails with a
> missing target.
>
> Select the x86 tests from the target ARCH when it is given and from the
> host's SUBARCH otherwise, and include lib.mk unconditionally so that the
> suites install and emit an empty runlist on other architectures. Use a
> private ARCH_PROCESSED instead of the ARCH override added by
> commit 5a1292137e89 ("selftests: fix ARCH normalization to handle
> command-line argument"): the override changed the value lib.mk uses to
> pick the clang target, whereas leaving ARCH unset lets lib.mk use the
> compiler's native triple. A command-line ARCH such as x86_64 is still
> normalized for the selection, while an ARCH spelling that lib.mk does
> not know, such as i686 with LLVM=3D1, is rejected as in other selftests.
>
> Fixes: 27801542b2b8 ("selftests/thermel/intel: Add test to read workload =
hint")
> Fixes: d4d27e5a1a88 ("selftests/thermel/intel: Add test to read power flo=
or status")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  .../selftests/thermal/intel/power_floor/Makefile     | 12 +++++-------
>  .../selftests/thermal/intel/workload_hint/Makefile   | 12 +++++-------
>  2 files changed, 10 insertions(+), 14 deletions(-)
>
> diff --git a/tools/testing/selftests/thermal/intel/power_floor/Makefile b=
/tools/testing/selftests/thermal/intel/power_floor/Makefile
> index 07463c2160e09..16d26eab55652 100644
> --- a/tools/testing/selftests/thermal/intel/power_floor/Makefile
> +++ b/tools/testing/selftests/thermal/intel/power_floor/Makefile
> @@ -1,12 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0
> -ifndef CROSS_COMPILE
> -ARCH ?=3D $(shell uname -m 2>/dev/null || echo not)
> -override ARCH :=3D $(shell echo $(ARCH) | sed -e s/i.86/x86/ -e s/x86_64=
/x86/)
> +top_srcdir =3D ../../../../../..
> +include $(top_srcdir)/scripts/subarch.include
> +ARCH_PROCESSED :=3D $(shell echo $(or $(ARCH),$(SUBARCH)) | sed -e s/i.8=
6/x86/ -e s/x86_64/x86/)
>
> -ifeq ($(ARCH),x86)
> +ifeq ($(ARCH_PROCESSED),x86)
>  TEST_GEN_PROGS :=3D power_floor_test
> +endif
>
>  include ../../../lib.mk
> -
> -endif
> -endif
> diff --git a/tools/testing/selftests/thermal/intel/workload_hint/Makefile=
 b/tools/testing/selftests/thermal/intel/workload_hint/Makefile
> index 49e3bc2b20f9d..e53d6ecd9f8de 100644
> --- a/tools/testing/selftests/thermal/intel/workload_hint/Makefile
> +++ b/tools/testing/selftests/thermal/intel/workload_hint/Makefile
> @@ -1,12 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0
> -ifndef CROSS_COMPILE
> -ARCH ?=3D $(shell uname -m 2>/dev/null || echo not)
> -override ARCH :=3D $(shell echo $(ARCH) | sed -e s/i.86/x86/ -e s/x86_64=
/x86/)
> +top_srcdir =3D ../../../../../..
> +include $(top_srcdir)/scripts/subarch.include
> +ARCH_PROCESSED :=3D $(shell echo $(or $(ARCH),$(SUBARCH)) | sed -e s/i.8=
6/x86/ -e s/x86_64/x86/)
>
> -ifeq ($(ARCH),x86)
> +ifeq ($(ARCH_PROCESSED),x86)
>  TEST_GEN_PROGS :=3D workload_hint_test
> +endif
>
>  include ../../../lib.mk
> -
> -endif
> -endif
> --

Applied as 7.4-rc material, thanks!
