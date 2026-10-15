Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8621B3F20EC;
	Thu, 15 Oct 2026 18:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090048; cv=none; b=eDpYtvrPU2aE+3nDFIXR69UpbLj5JBtkQA18dlA2gNQuUv2d9pyXmsOP6JffaF3Qt8oQhqlXZdwCdLcvnIx0Ktaqcpn25EC6pIukC8DhwCHEh4ujEDe+213b6dP9IakcQdKvmSllONnnoMOhiwY82VqQeFYFH3uCsUNXbvaOZgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090048; c=relaxed/simple;
	bh=O3lwr6EwkwPliqe1jwl+3ZZZb0h1MOzX7laZi7ZtDn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aS1JYvEVMXxToRmO1gn85eq4pHzTtBDe4x6eRVZEWVvpTHQI6Bhv0eYX0KBoY9C6btcO9WzYswA0wKERQ9R24OfB/imb9lkLaPQhk0eXKmp5rTv4JL0t2vmGe3JTZM5LMIzCImmu6qTaQZ5HzYrEG5dVhwf/0KZEj/taJS2HxAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pxnnIUS5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IPc5HaWX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pxnnIUS5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IPc5HaWX"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792090042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SWILElDqTeo7/T5BOpqpe5sYU2Aw3dqCKwEKXxn+uiE=;
	b=pxnnIUS5CPGShtoW7dDxYqvfZjmSj4fB0u1RvEd8HXx7zZWufVsThBV9v8qmYBfD+YmrJf
	pwx2bebgsnHcE3r6uIf8aU+WDSf476ZbEcn7Vv9ObxmZv/DytNzXw7RERnDfZkIDLSOEai
	0H76kZ9G1wBUvazJ6p7sXAsa2zQ772weNuMv5HlwBr6/JNz2UfHiRzqLphPqOALs8tk45K
	4rWlXN6SDEselR3l2Lh06TkAwSIEH7Ds2tqdT9c36RfY6mZCSyeVi1FZndjfxQHu5nr2pS
	OFXUn70iPx2u41gVa5vpc3E0Es8jtIohZDzc+p1cBcATb2jpFP5+kUhYTp1yeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792090042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SWILElDqTeo7/T5BOpqpe5sYU2Aw3dqCKwEKXxn+uiE=;
	b=IPc5HaWXau2OVTBLwJIxWae4rz+/LmFjyAppM+nL+/yt9kVQ0BqupfGBTYA9J/FNzCxO21
	YagzRfyZlEkSGhDA==
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
Subject: [PATCH v5 0/2] Start removing X86_X32_ABI
Date: Thu, 15 Oct 2026 20:47:13 +0200
Message-ID: <20261015-x32_removal-v5-0-2bfef9151fad@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260706-x32_removal-28823498c4a2
Content-Transfer-Encoding: quoted-printable

Patch #2 prepares the removal of the X32 ABI and has the broader
reasoning. Patch #1 removes x32 from the selftests because it does not
have a depends on and assumes x32 to be always available on x64 and so
it breaks.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
v4=E2=80=A6v5: https://patch.msgid.link/20261008-x32_removal-v4-0-d389a193c=
506@breakpoint.cc
  - reword commit message for #2 as requested by hpa to state that this
    is the last warning.

v3=E2=80=A6v4: https://patch.msgid.link/20260813-x32_removal-v3-0-e8f96cd15=
478@linutronix.de
  - Depend on BROKEN instead of removing it.

v2=E2=80=A6v3: https://patch.msgid.link/20260707212252.bYk3-AlU@linutronix.=
de
  - added a nolibc-selftests patch to not break it in their setup since
    it does not depend on the symbol.

v1=E2=80=A6v2: https://lore.kernel.org/r/20260523093734.A3AR7reJ@linutronix=
.de
  - reworded commit message

Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Bill Wendling <morbo@google.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Jonathan Corbet <corbet@lwn.net>,
Cc: Justin Stitt <justinstitt@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
Cc: Sam James <sam@gentoo.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
Cc: Tomas Glozar <tglozar@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>
Cc: x86@kernel.org
To: linux-kernel@vger.kernel.org
To: linux-kselftest@vger.kernel.org

---
Sebastian Andrzej Siewior (1):
      x86: Start removing X86_X32_ABI

Thomas Wei=C3=9Fschuh (1):
      selftests/nolibc: remove the x32 testcase

 arch/x86/Kconfig                               | 2 +-
 tools/testing/selftests/nolibc/Makefile.nolibc | 6 ------
 tools/testing/selftests/nolibc/run-tests.sh    | 7 +------
 3 files changed, 2 insertions(+), 13 deletions(-)
---
base-commit: ec8bf8280261294a9b9b4520414b42704c7f9f6b
change-id: 20260706-x32_removal-28823498c4a2

Best regards,
--=20=20
Sebastian Andrzej Siewior <bigeasy@linutronix.de>

