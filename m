Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3DD484234;
	Thu,  8 Oct 2026 09:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450478; cv=none; b=ZU2fzyL2vSksQRx5y+9nehf7kOGbuNbLeZRghcXU7PTzG5JbKdGJ61ulD5KXZ+bCXtuH6lgqeaAtryqQ0mF+GYAsW9tIUoaDxZdaWx60E22Ha/58cakK+2w/Wr76Ofe/E660wxef2SlHEXOHHHniTc/S6ZJuD8jfDyA+22j9x8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450478; c=relaxed/simple;
	bh=1qpII5YyVDzNLmcVmoolkkDQyT3PZfvGpwTA+YNjk5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dekV/QrPKi7fE3AHeu8AOd9uaKQ9/GzdDo1G2tP5BFoHRGciKJs+6OAxHMQxmIDPvpS4GxmkiVy+CAVK25vqhdDait4HmZNR5o5ECOyXC8N0AoJU3ziBGLUKHXysM7i4rUa8XAp48Z2ik5DuRhcqw1MuNsvlAtCiC82q1kB1fyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IpbGAQrO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6mYyCF9A; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IpbGAQrO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6mYyCF9A"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791450466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bHBTUr7p04AlVKtPozF+TH9Wpz/mghN4voU0hKvtxsU=;
	b=IpbGAQrOrRyqq8Sbvm/2WqjL3A4/s66Se+gIY5fvs79qLZawVVD0QlazWOTdOk/1MHeg40
	x4B+wVq3tX6ONZfmuRIWsElM6at1lOLyhnXvEdtvJq8zG3wv9qcH3qKS2ug2CNsGPqvk4N
	rGL6KLIkW7CYGvcxviy0T++H0LFdyZliWURZAyqHbDEEmS6fW2OC3/VwwFA2JFm/WRAPW7
	LK9lDQfEvkPvaOu86to3IGvIp8VqS2gOLh1ot07x/HrScolmABj+w6Qk7S3SDFSJ9j+trR
	5HIykUr8n4jdsJbrGJ8wJgcRhvge+TovljmzszVgMSHYFQI/Ouc+lLNlMoUxYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791450466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bHBTUr7p04AlVKtPozF+TH9Wpz/mghN4voU0hKvtxsU=;
	b=6mYyCF9A0oknzRvqbFbx1hcZUZNZkjgJ0fWOqB21jMQ9bwADjdd84ZIhaOUG3B015qjXBQ
	zVTXqv75hZqfrgDw==
To: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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
Subject: [PATCH v4 2/2] x86: Start removing X86_X32_ABI
Date: Thu,  8 Oct 2026 11:07:43 +0200
Message-ID: <20261008-x32_removal-v4-2-d389a193c506@breakpoint.cc>
In-Reply-To: <20261008-x32_removal-v4-0-d389a193c506@breakpoint.cc>
References: <20261008-x32_removal-v4-0-d389a193c506@breakpoint.cc>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

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
It will remain around in the last LTS kernel of this year and then it
will be removed.

Acked-by: Arnd Bergmann <arnd@arndb.de>
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

