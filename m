Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B7A3D47A5;
	Thu, 15 Oct 2026 22:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792103727; cv=none; b=KAwDiMf7FJwO0tWMyPKs0irH8nGfD1B3GYjXVGrDEivaq0HwSD+Ob7wJk4xSqldWNHMsUOamz9irrJ4tQV8eDWV7xx28z48nupvYF2SbupW3YZej5hqETKwocWu/H86uonVgdSnEaU2MvGjt8QHkZpayPovdMmWpjN8RQEouSKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792103727; c=relaxed/simple;
	bh=3E+U6VozkWbJDG0scmCEXfCdyNI3ebUxG20vG9jLttY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lysCj4z8je6+VmzSnqF3Y+RW/CodSAZhdsdgyoCLK/OFNPck2sVHXQM7MkNqBe9OD2nxeCnseI4TfTKXbzdkED0t5DJN9H6Z/CH3vEyQEUeTXzGzl6nC30hQ7OH1KKLDkKMibhS9LhZTU2P4a7R/hkqJbHdjQuCnwg385iWL/r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=adw/q6Vo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="adw/q6Vo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51EF71F000C4;
	Thu, 15 Oct 2026 22:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792103724;
	bh=3NmvYLl5QHeykmporrZNiQW/rnQk5zz4ISSBCPdSjPA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=adw/q6VoJblAyBzhC05/WcBR3verzhT/2YShYwqZzoW4sOFkXql9e7jy3/0o5mUrI
	 qcQyhCMcrK0yMNYSytMyoqsFrh7KLrgWFmoAU5vPAqTJcVuD7hhWfkiPgZb+e936Y1
	 1IDP3mgLcv35UuvXZ36snkmcBtFdIgdgKFyFZpskWRHV+7X82j2bh4Q8hDG1ccaX9f
	 UWJJw8V6uVCi4YdA34Xz4qBgSJmwNgnVl7qEt3EOz3lMHW7HL4kBAct18fD5dBYxo1
	 MIMtFQVosFx4zW+mghjFCQRbjjiTJEUFdfv2YZCvC6CPCVIUqb07W6/yNTGFgmsqwU
	 0QQsWoVRX5czw==
From: Thomas Gleixner <tglx@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "H. Peter Anvin"
 <hpa@zytor.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Bill Wendling
 <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet
 <corbet@lwn.net>, Justin Stitt <justinstitt@google.com>, Nathan Chancellor
 <nathan@kernel.org>, Neal Gompa <neal@gompa.dev>, Nick Desaulniers
 <ndesaulniers@google.com>, Richard Purdie
 <richard.purdie@linuxfoundation.org>, Sam James <sam@gentoo.org>, Shuah
 Khan <shuah@kernel.org>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Tomas
 Glozar <tglozar@kernel.org>, Willy Tarreau <w@1wt.eu>, x86@kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 2/2] x86: Start removing X86_X32_ABI
In-Reply-To: <20261015-x32_removal-v5-2-2bfef9151fad@linutronix.de>
References: <20261015-x32_removal-v5-0-2bfef9151fad@linutronix.de>
 <20261015-x32_removal-v5-2-2bfef9151fad@linutronix.de>
Date: Fri, 16 Oct 2026 00:35:22 +0200
Message-ID: <87h5imd239.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Oct 15 2026 at 20:47, Sebastian Andrzej Siewior wrote:
> The x32 ABI was introduced in v3.4 to leverage the additional registers
> which were available on x86_64 but not on i386 while keeping the smaller
> 32bit pointers.
>
> This did not take off. The memory usage usually knows no limit and the
> better performance did not reach a point where certain workloads widely
> move to x32 and use it exclusively. In the meantime Debian introduced a
> patch to disable x32 by default (so it has to be enabled at boot time on
> the command line) because they are afraid of the increased attack
> surface. Fedora as far as I tell has X32 disabled (looking at 7.0-rc5
> rpm in rawhide).
>
> The syscall range >512 used by x32 can not be reused because on earlier
> kernels (before v5.4 with x32 enabled, see commit 6365b842aae4
> ("x86/syscalls: Split the x32 syscalls into their own table") it is not
> obvious if the syscall is for x86-64 and not implemented or meant for
> x32.
> What can be removed are the special compat cases due to different
> alignment.
>
> Since there is practically no real use for x32, start removing it by
> marking the symbol as BROKEN so it is not possible to enable by default.
> If you have a legitimate use case for x32, this is your last chance to
> speak up. Otherwise it will be removed.
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: H. Peter Anvin (Rosaic) <hpa@zytor.com>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: Thomas Gleixner <tglx@kernel.org>

> ---
>  arch/x86/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 15fd9ec5ecacb..21a6863e14e7a 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -3104,7 +3104,7 @@ config IA32_EMULATION_DEFAULT_DISABLED
>  
>  config X86_X32_ABI
>  	bool "x32 ABI for 64-bit mode"
> -	depends on X86_64
> +	depends on X86_64 && BROKEN
>  	# llvm-objcopy does not convert x86_64 .note.gnu.property or
>  	# compressed debug sections to x86_x32 properly:
>  	# https://github.com/ClangBuiltLinux/linux/issues/514
