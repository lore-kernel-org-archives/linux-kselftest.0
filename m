Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267CD3D1A8E;
	Sat, 10 Oct 2026 06:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615317; cv=none; b=EDb0LIghkqwEAEA/F2qjd8VCSR2T8uKlmtAgGf5u0McoKTMnMmPpG/+h2BAr1XlsecoDhnI3eOd4o24vSy5JemqfY/YffilNLzgfLxq3ZhE4M3VVfIb5MhFJNoPnXA/z4OdrRmTqfa81IprIqOyamDrygcIlwuuWwAuxW7sVfbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615317; c=relaxed/simple;
	bh=dds94h2tCpUAEqZmdvAVHIAH3c44CSGmgK9M0PtEawc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=C8slQpBdB7iGDAZaRrFqruKP8I6AeTFtH3KjfvCFe0fwHgLUzRT/euVOUF6c+amPrruwDUMR/TCldV1gACjw0kFKhyqAA3rXUatW5WB6KArjuxWtO67ilbXRX7atFSzWDSZjpSu5+wQxFXRj2UoWzGoduUuul2C/xP+P0IzJdCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=oq/zBHgi; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="oq/zBHgi"
Received: from ehlo.thunderbird.net ([172.59.192.99])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 69A6qu8k3096797
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 9 Oct 2026 23:52:58 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 69A6qu8k3096797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026092801; t=1791615180;
	bh=gIbyT1LJ8E+Wsr69yQQkhxyJsSBPI7cWD8OlwVgQw4M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=oq/zBHgiCjdM3u/+7hEQB9sYTGpxgP2hcwAA4i0Ad9GWnoQM/ylfGB0Eo07g1tCjM
	 FQuaSulokt8wZ0Ng41RA5blYNTh/lqIAm41rIMOy9cyFFcDcRR0IUhDYmCQANeI8yR
	 1df1ok8DAJI3yo4CzOe4MYfzX/3cIl+Zn/e6mXGpkmLDa0wkrhR94wPJL04IKaNUip
	 La8idiwmqfUdESxcQqaTUEfIyqk+GJoN7HlPwJndzuplRdL4/B5Gx6/azMVU+wXA5b
	 fcHbhb/5D/B6YLLRepLIccB8y79PsI+faAgwpebkkkYKXgI+TdYtJtxAjjENNguzQM
	 wm18eOzLL3rag==
Date: Sat, 10 Oct 2026 08:38:23 +0200
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
Message-ID: <C64A956C-15BE-483F-ACA4-0E9A56699A61@zytor.com>
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

I want to make one change to this=2E=20

The commit message states this as a fait accompli, but what it should say =
is:=20

** If you have a legitimate use case for x32, this is your last chance to =
speak up=2E Otherwise it will=2E=2E=2E **
