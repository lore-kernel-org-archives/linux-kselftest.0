Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457FB45D1A8;
	Thu, 13 Aug 2026 11:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786619087; cv=none; b=KFM+VVy3Ks/PpWuJOL6gfxu5FXbgWrk97kiwz6qFEqS7jKcI75vGOucgVjsQa0o+x9Fzh3nu0lxNZYgnAjNUhMt2Pyi/jhcvwQaNdQE64spxiouuoZINIOFIbxm9fS5aOuBEIBTUbdtG84t4OZOfaRLKSzjI8Br4LKie8eWGEpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786619087; c=relaxed/simple;
	bh=9YLfWUtDaIrZ7qEeMTha8XRK4xntfN19xyF1hXQegDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V44cPQUFrelyQzT76pmvc9AzcZ/4yDNHrBPaWEWM5mqnVwftPNf41y+uASCpIerFVNEZckTK6w73s17TFEuZtBZY/qUDl4ODnyaTWmUwU+IE4GaOQs4w+zsOmXUGD0K8SXISUwO04OpUwEQb5KdlLrmKIvDz0u1JzYVVlyCWB/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=a58TA44o; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zNfvu/uZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="a58TA44o";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zNfvu/uZ"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786619081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jjpObbj2WfW43hEykvD0YZhHijZQsYldhHSw+YX23Bk=;
	b=a58TA44oQ1b0NKdp2U3O+r+I1etNZXeNnZ5xwjEvCiaxuYsktzTd8+Xnd6/JPJnjseCWIP
	oexHKKnAbdFl5D1c/5+RVbBEu/X9dIuzcC9KvmH6GuUf/5rO7iTUvLhiWvsLY2t5yY1qsU
	gdIQrr1el71Kd2xGazpVQcxuT4c7e9XYnILLuVPd8D0Y0iE1L/qLRWFdTnrDrgaOq+bRNb
	aBjQbH8oWSYqGowXBVGyBAIX+JVc2o0yayrbzxgj4E75mJTsLQR00y+f3wcryZXafPUX7q
	Ba4rWV+S4EFu7Hi+B+YkWCDKAI4HLhJjjeckXX0CHdblmoJce+C0cykEsNtSsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786619081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jjpObbj2WfW43hEykvD0YZhHijZQsYldhHSw+YX23Bk=;
	b=zNfvu/uZu0EXARvxIQRbX5eYcms6yK8oqDPjfmgpk0muDeWbGDUyZoBIzSFGzxNpc7Nc6Q
	GXDslDXi3zoDOUBw==
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
Subject: [PATCH v3 2/2] x86: Start removing X86_X32_ABI
Date: Thu, 13 Aug 2026 13:04:33 +0200
Message-ID: <20260813-x32_removal-v3-2-e8f96cd15478@linutronix.de>
In-Reply-To: <20260813-x32_removal-v3-0-e8f96cd15478@linutronix.de>
References: <20260813-x32_removal-v3-0-e8f96cd15478@linutronix.de>
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
removing the symbol first, not allowing to enable it. Should nothing
happening by the end of the year, it will removed after the last LTS
kernel this year.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/x86/Kconfig | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index bdad90f210e4b..f6fe55fdc928a 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -3097,20 +3097,6 @@ config IA32_EMULATION_DEFAULT_DISABLED
 	  processes and access to 32-bit syscalls. If unsure, leave it to its
 	  default value.
=20
-config X86_X32_ABI
-	bool "x32 ABI for 64-bit mode"
-	depends on X86_64
-	# llvm-objcopy does not convert x86_64 .note.gnu.property or
-	# compressed debug sections to x86_x32 properly:
-	# https://github.com/ClangBuiltLinux/linux/issues/514
-	# https://github.com/ClangBuiltLinux/linux/issues/1141
-	depends on $(success,$(OBJCOPY) --version | head -n1 | grep -qv llvm)
-	help
-	  Include code to run binaries for the x32 native 32-bit ABI
-	  for 64-bit processors.  An x32 process gets access to the
-	  full 64-bit register file and wide data path while leaving
-	  pointers at 32 bits for smaller memory footprint.
-
 config COMPAT_32
 	def_bool y
 	depends on IA32_EMULATION || X86_32

--=20
2.55.0

