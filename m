Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0904C44781A;
	Thu, 13 Aug 2026 11:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786619088; cv=none; b=XEe0rpOcNo76qYBpOTQe0+ASOokcWvlR3EQmpCLXDLDa0pgAvQn7AB41rDe4lA0acNTXNDStZ7JZxGbNxOYLilrNIwPWu6Y4rQ41upT0EQEnhBmEkp/hcGAnTEVbvd9QEJsesR7F9GtfD5xG6IRGMBLEL+JOT8h09gpdtMCxlHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786619088; c=relaxed/simple;
	bh=K0/L34QRYBRaAK05s2YcLwsa26f1g8C5qDYPbYNRjE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=paiFaRrqygvYxAvDUEDKzpuvLRc7/fbeQy6wIaPj0BxCu3dZzgsyCSc/FOP6QVDVXZIkyE5Q6AEuSoPepU0W+hMdcvK4yPLhPnIGSt6kJDjNMBKaQ6XJPRzePT2ESZKxkDnIlHkCsMHxE4u18hCmNCn0zJR2b9CG+Y+BDDuobLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MYLV7YUo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=skmaP9Al; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MYLV7YUo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="skmaP9Al"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786619080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2l0mNd/Y4YoZJm19sroVhZS0zIRrWDUGp+vUSqMrbHQ=;
	b=MYLV7YUodln40hkMqFCwojrNC0u3avRpv0A4CAgA5lx9BNUIbHbhrkGKQb4t3MCNwWB1lN
	fgy/KL60DvquzVXgEGD1kEwB/yVbFolRz6UcqNA1rY/ojyHx4LUhU2Lyvnv9d+gG+zj9oc
	cVTfqo7owCpKD0qE21sPL7JlSNquN1L448ahXTPfFid1drTiYEYjx5e6ha+SXFXI/WYWrs
	xCTrTXvp0g+YbIXgZooiQPe3Oh8hsY6bMAjJ30D5fQJ2KMHbI19aP5Hcm9MaLnkMqaC9lR
	+oVDtjXDHp1snyQb++htkFXJAxqjNvbmg8CjI2P9k0dTTa3y+NCvpaXfUPpIrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786619080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2l0mNd/Y4YoZJm19sroVhZS0zIRrWDUGp+vUSqMrbHQ=;
	b=skmaP9Al6EcXdt+NWk8UkeOWBw/G5mFTsoj6vYq7BpENRSx0lJUpH9rXNf5+jcIUyiO0dP
	8VBUOiquLPiAuEDA==
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
Subject: [PATCH v3 0/2] Start removing X86_X32_ABI
Date: Thu, 13 Aug 2026 13:04:31 +0200
Message-ID: <20260813-x32_removal-v3-0-e8f96cd15478@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260706-x32_removal-28823498c4a2
Content-Transfer-Encoding: quoted-printable

Patch #2 prepares the removal of the X32 ABI and has the broader=0D
reasoning. Patch #1 removes x32 from the selftests because it does not=0D
have a depends on and assumes x32 to be always available on x64 and so=0D
it breaks.=0D
=0D
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>=0D
---=0D
v2=E2=80=A6v3: https://patch.msgid.link/20260707212252.bYk3-AlU@linutronix.=
de=0D
  - added a nolibc-selftests patch to not break it in their setup since=0D
    it does not depend on the symbol.=0D
=0D
v1=E2=80=A6v2: https://lore.kernel.org/r/20260523093734.A3AR7reJ@linutronix=
.de=0D
  - reworded commit message=0D
=0D
Cc: "H. Peter Anvin" <hpa@zytor.com>=0D
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>=0D
Cc: Bill Wendling <morbo@google.com>=0D
Cc: Borislav Petkov <bp@alien8.de>=0D
Cc: Dave Hansen <dave.hansen@linux.intel.com>=0D
Cc: Ingo Molnar <mingo@redhat.com>=0D
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>=0D
Cc: Jonathan Corbet <corbet@lwn.net>,=0D
Cc: Justin Stitt <justinstitt@google.com>=0D
Cc: Nathan Chancellor <nathan@kernel.org>=0D
Cc: Neal Gompa <neal@gompa.dev>=0D
Cc: Nick Desaulniers <ndesaulniers@google.com>=0D
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>                    =
                                                                       =0D
Cc: Sam James <sam@gentoo.org>=0D
Cc: Shuah Khan <shuah@kernel.org>=0D
Cc: Thomas Gleixner <tglx@kernel.org>=0D
Cc: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>=0D
Cc: Tomas Glozar <tglozar@kernel.org>=0D
Cc: Willy Tarreau <w@1wt.eu>=0D
Cc: x86@kernel.org=0D
To: linux-kernel@vger.kernel.org=0D
To: linux-kselftest@vger.kernel.org=0D
=0D
---=0D
Sebastian Andrzej Siewior (1):=0D
      x86: Start removing X86_X32_ABI=0D
=0D
Thomas Wei=C3=9Fschuh (1):=0D
      selftests/nolibc: remove the x32 testcase=0D
=0D
 arch/x86/Kconfig                               | 14 --------------=0D
 tools/testing/selftests/nolibc/Makefile.nolibc |  6 ------=0D
 tools/testing/selftests/nolibc/run-tests.sh    |  7 +------=0D
 3 files changed, 1 insertion(+), 26 deletions(-)=0D
---=0D
base-commit: 2ee859ebf156157609f71060ae472711c8cbc326=0D
change-id: 20260706-x32_removal-28823498c4a2=0D
=0D
Best regards,=0D
--  =0D
Sebastian Andrzej Siewior <bigeasy@linutronix.de>=0D
=0D
