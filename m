Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D94852FE32;
	Thu, 15 Oct 2026 18:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090053; cv=none; b=EhabMD3xE2Ww6ChXZVZtMHUlq1+wCbW+Cy7azA8mdj8l0ssZNOKdM3xymrVbw0k2NRdezEHXHlsdlt6pgEAhaSw/wsCKQbko/atxw0i8wMJABvPMHSbe/O/fojTNOAphbQIstQsBeyvqMgbsrxPJ2x1u16DNPLaPA8fFQg/Ikgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090053; c=relaxed/simple;
	bh=J13rsjmfHYbumDnrwvgDnrwTnKILlGKvdQvkEkc+s20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=esYFHrpdK26bakv1VnjLsde4pv9sdQFaGIU/oNtTkOakx+r6QqvEUgqcM2Vm4yxqdYKFkV9Rw5QUEp1ixwrfaj4Fjs8/z4bHX4Y5tsH6wQc2qUaSxmVa1G0dD8aniqfcCTTURGUONv4vE1qXG/dY3UDfUgGhQkYNKEhn+Gi8yww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pktEqFH2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vw2CnGuf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pktEqFH2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vw2CnGuf"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792090044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rwXbwRcgQZQ6eaot/zcedlRXRuMPKGPBCqwWDnGYFog=;
	b=pktEqFH2qKgJTEaNFUB23TMu0vASVC+T0eHmHZKq5WH3+IDkZzKBEqiuabN5vti78a7o2N
	6yy99Fj0C5JVXcLZ0aufuAcr/Y0uyxzwLCBiNL2M4JuHAQWui7CDNLS+VTE9DdR1W5d/Z5
	CQ440bhGWb4Pu65stM8c6Si1o9of7SH6HpTru34OwPSCqiRJFQGm3kLM1Wbn+4c54r3jh2
	Zi3ZFbdkaw2ILD8FTjULI00/L50jmYCSQDGAb7CO6abOpNm5QrHnpr1DbNS4x7oChjvQ06
	TntKBB8n2cC0nJRzqxFfWGDKZjv9cQtBbxNrtmMtz59ycTomVA0raKtn0Vwljg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792090044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rwXbwRcgQZQ6eaot/zcedlRXRuMPKGPBCqwWDnGYFog=;
	b=vw2CnGufOY6Kl83aD+rO+XB0VQ1Lqx15r6YSkcia8o4LVB1dZynFvUBKvl2p8zYTXcDnV5
	6IAhbopUpEBEqFCQ==
To: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Sam James <sam@gentoo.org>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	=?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Tomas Glozar <tglozar@kernel.org>,
	Willy Tarreau <w@1wt.eu>,
	x86@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v5 2/2] x86: Start removing X86_X32_ABI
Date: Thu, 15 Oct 2026 20:47:15 +0200
Message-ID: <20261015-x32_removal-v5-2-2bfef9151fad@linutronix.de>
In-Reply-To: <20261015-x32_removal-v5-0-2bfef9151fad@linutronix.de>
References: <20261015-x32_removal-v5-0-2bfef9151fad@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The x32 ABI was introduced in v3.4 to leverage the additional registers
which were available on x86_64 but not on i386 while keeping the smaller
32bit pointers.

This did not take off. The memory usage usually knows no limit and the
better performance did not reach a point where certain workloads widely
move to x32 and use it exclusively. In the meantime Debian introduced a
patch to disable x32 by default (so it has to be enabled at boot time on
the command line) because they are afraid of the increased attack
surface. Fedora as far as I tell has X32 disabled (looking at 7.0-rc5
rpm in rawhide).

The syscall range >512 used by x32 can not be reused because on earlier
kernels (before v5.4 with x32 enabled, see commit 6365b842aae4
("x86/syscalls: Split the x32 syscalls into their own table") it is not
obvious if the syscall is for x86-64 and not implemented or meant for
x32.
What can be removed are the special compat cases due to different
alignment.

Since there is practically no real use for x32, start removing it by
marking the symbol as BROKEN so it is not possible to enable by default.
If you have a legitimate use case for x32, this is your last chance to
speak up. Otherwise it will be removed.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: H. Peter Anvin (Rosaic) <hpa@zytor.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15fd9ec5ecacb..21a6863e14e7a 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -3104,7 +3104,7 @@ config IA32_EMULATION_DEFAULT_DISABLED
=20
 config X86_X32_ABI
 	bool "x32 ABI for 64-bit mode"
-	depends on X86_64
+	depends on X86_64 && BROKEN
 	# llvm-objcopy does not convert x86_64 .note.gnu.property or
 	# compressed debug sections to x86_x32 properly:
 	# https://github.com/ClangBuiltLinux/linux/issues/514

--=20
2.55.0

