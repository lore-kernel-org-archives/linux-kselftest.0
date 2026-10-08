Received: from terminus.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8496E29B766;
	Thu,  8 Oct 2026 12:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791461942; cv=none; b=PocYeHM/1MwAxH8TGn4tFLrpqyN/kS2SoB+kzZGoMWR88FaLWf7bgFIL7C+N1K9FnfPFSn+RGKt95xCv370QI4Gc1ii3sdFqgaV8+4Zo5ZbIAf58oOqZq+AtixTpwVRvUv8pZNAw++Fpx22ZVdJLmFoDMfkHknCtZ5b3MHhhQi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791461942; c=relaxed/simple;
	bh=5PuCP3CbXgI2IH2YwCi71AGOGwZE3Xt70lyE94ahk3c=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=av71F5Fz2sckRbwvyupRJud3svt8rHE9ALj2pgvAl3d9w6fiKZMHuCq2MVII6pyBeaAVlHTLSq5mAsaRUIPWeKS2WhJcibPcf+nKwjOLQgLyGHyWoYTm/BZoyJaJIZW3AbTqvATrI1IFSI/6QFbClRbtRrizs2/npPmgaPLt38k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=ZW8cEflJ; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="ZW8cEflJ"
Received: from ehlo.thunderbird.net ([172.59.192.127])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 698CFmc62830241
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 8 Oct 2026 05:15:50 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 698CFmc62830241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026092801; t=1791461752;
	bh=vg1ZKcmZSmYiLGnDiNyOm2ayv4LK+74uEkyw4KKmmPM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=ZW8cEflJDXVXYnpyK9H5g3k4nuGp0DuSVeP2bAHqAqHjxCMGXfCYZD6wDBams6Nty
	 E4Yz5ggCffOp+Wa6x4wIXrJ1RNOkqLLi/eqj2NyhDPgWHJKO4hsZpShfNNGuvP4tRt
	 lCrDA0UQ8vCzAc9IANdoS8iWZ+2OPTV+9dVWeR44Zx1HYFNqwq+W3DLmsPyxxuZolr
	 gdUFcuOofFrvHUIG7O6pL1jKmoJHw31xe7UPUZtq6r74EpxaYn5WznJatDlWXKL709
	 cSkg8vJWdDOLkd2zjZWabYAE/T0sNiHEZy0SfznUmAMRy4ztmJsdwchf0SboC0NLAZ
	 xrY/FIIF5+fmA==
Date: Thu, 08 Oct 2026 14:15:39 +0200
From: "H. Peter Anvin" <hpa@zytor.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
CC: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Justin Stitt <justinstitt@google.com>,
        Nathan Chancellor <nathan@kernel.org>, Neal Gompa <neal@gompa.dev>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Sam James <sam@gentoo.org>, Shuah Khan <shuah@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        =?ISO-8859-1?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>,
        Tomas Glozar <tglozar@kernel.org>, Willy Tarreau <w@1wt.eu>,
        x86@kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 2/2] x86: Start removing X86_X32_ABI
User-Agent: K-9 Mail for Android
In-Reply-To: <20261008-x32_removal-v4-2-d389a193c506@breakpoint.cc>
References: <20261008-x32_removal-v4-0-d389a193c506@breakpoint.cc> <20261008-x32_removal-v4-2-d389a193c506@breakpoint.cc>
Message-ID: <2B66CB7E-2302-470F-A3B5-0566DCF2A826@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 8, 2026 11:07:43 AM GMT+02:00, Sebastian Andrzej Siewior <bigeas=
y@linutronix=2Ede> wrote:
>From: Sebastian Andrzej Siewior <sebastian@breakpoint=2Ecc>
>
>From: Sebastian Andrzej Siewior <bigeasy@linutronix=2Ede>
>
>The x32 ABI was introduced in v3=2E4 to leverage the additional registers
>which were available on x86_64 but not on i386 while keeping the smaller
>32bit pointers=2E
>
>This did not take off=2E The memory usage usually knows no limit and the
>better performance did not reach a point where certain workloads widely
>move to x32 and use it exclusively=2E In the meantime Debian introduced a
>patch to disable x32 by default (so it has to be enabled at boot time on
>the command line) because they are afraid of the increased attack
>surface=2E Fedora as far as I tell has X32 disabled (looking at 7=2E0-rc5
>rpm in rawhide)=2E
>
>The syscall range >512 used by x32 can not be reused because on earlier
>kernels (before v5=2E4 with x32 enabled, see commit 6365b842aae4
>("x86/syscalls: Split the x32 syscalls into their own table") it is not
>obvious if the syscall is for x86-64 and not implemented or meant for
>x32=2E
>What can be removed are the special compat cases due to different
>alignment=2E
>
>Since there is practically no real use for x32, start removing it by
>marking the symbol as BROKEN so it is not possible to enable by default=
=2E
>It will remain around in the last LTS kernel of this year and then it
>will be removed=2E
>
>Acked-by: Arnd Bergmann <arnd@arndb=2Ede>
>Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix=2Ede>
>---
> arch/x86/Kconfig | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>index 15fd9ec5ecacb=2E=2E21a6863e14e7a 100644
>--- a/arch/x86/Kconfig
>+++ b/arch/x86/Kconfig
>@@ -3104,7 +3104,7 @@ config IA32_EMULATION_DEFAULT_DISABLED
>=20
> config X86_X32_ABI
> 	bool "x32 ABI for 64-bit mode"
>-	depends on X86_64
>+	depends on X86_64 && BROKEN
> 	# llvm-objcopy does not convert x86_64 =2Enote=2Egnu=2Eproperty or
> 	# compressed debug sections to x86_x32 properly:
> 	# https://github=2Ecom/ClangBuiltLinux/linux/issues/514
>

Acked-by: H=2E Peter Anvin (Rosaic) <hpa@zytor=2Ecom>
