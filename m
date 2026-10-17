Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2F9476CD3;
	Sat, 17 Oct 2026 22:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792274558; cv=none; b=KzvwcfFYDoLcg3caWd1IZJIv+hk/P/mDSIE7UZM8GWLxud6ZtWIskxvaH99wR6m/cCdhpkCRgUBPJx+12sMBf3QTnQedImBP228D3lG8SdIme2W65eigPMRIcEMFemFonYDrsgbd2YMbbrplBxfcKVaA0CX6UGGV48oZfyQCeJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792274558; c=relaxed/simple;
	bh=Vc+m7Gpi6RSXlHOcniGXp1iDUeMacvLIvd8xUuPFJAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Z4iirYlIq7q8Xl2FFxU5ZOU3waKYMuycC0xkmKMHr9ZrsRiHbutgabyK6ELE9t95XbEVXyMEhIuK0jFkuJfrcbYv5anqVr2YD8aQee4CeEM8Z73VEuNN7vLMnmRP5Fgxi9+rdl7BfsZy0j73tjlRGXRLjShzQjxOKLDDklLXCcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=JUT0LK3t; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="JUT0LK3t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1792274552;
	bh=Vc+m7Gpi6RSXlHOcniGXp1iDUeMacvLIvd8xUuPFJAs=;
	h=From:Date:Subject:To:Cc:From;
	b=JUT0LK3t+MccQ7y+JZNBSFBm0W0x9iZ3y0WNHnScowj+KKz5YEeO84zUH8+vC8kpY
	 dzh0hGi8EGVeHhx1wC1fwLIfB81ohiVrGK+nZzUEORj1gVB7ZBdks2OWWZ/CTDDj9c
	 qFZaEMgo1Xj2W1fB8y2+U0wM2h3VKcSZFudf+E98=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 18 Oct 2026 00:02:18 +0200
Subject: [PATCH] selftests/nolibc: explicitly disable position independent
 executables
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-nolibc-unused-arguments-v1-1-6cba71555fe8@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMAyA4VeRnBdoxXWwV5EdbIwuY4vSWBHEd
 7fbjt/h/3cwTsIG92qHxKuYTFrgLxXQs9ORUfpiqF0dvPM31OktkTBrNu6xS2P+sC6G8eqagVz
 w1AQo9Zx4kO13bh9/W44vpuW7g+M4Ae6S9sl7AAAA
X-Change-ID: 20261017-nolibc-unused-arguments-b504fc061c46
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792274551; l=1970;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Vc+m7Gpi6RSXlHOcniGXp1iDUeMacvLIvd8xUuPFJAs=;
 b=2AU69PoxQRnQ4EbAm0e6BW6u2EXyJGm1PhEJAGI3GAG1G45Fpk1Dp1iRV28ZdF95pgmsmL2V4
 9+KpOXwOpd5Av2HyuMKzxrFsC+Hf0E5Y6nlzaZkRxJ38AaqkYo6HVXb
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

nolibc does not support position independent executables (PIE).
However a toolchain might generate these by default depending on various
circumstances. Recently clang started to do so for hexagon. See LLVM
commit ab43cb8520c0 ("[Hexagon] Pass -pie to linker when PIE is the
toolchain default (#189723)").

As clang can also be configured to create PIE for other architectures by
default disable it globally. While we are at it also pass the argument
for GCC to be on the safe side.

If PIE is disabled already, clang will generate
-Wunused-command-line-argument warnings. Inhibit those.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
I ran into this when testing the upcoming PR to Linus.
The referenced LLVM commit was released between when I wrote the hexagon
support and today. My plan is to fold this patch into the PR.
---
 tools/testing/selftests/nolibc/Makefile.include | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/nolibc/Makefile.include b/tools/testing/selftests/nolibc/Makefile.include
index ea520eac64a6..14e51c821d8a 100644
--- a/tools/testing/selftests/nolibc/Makefile.include
+++ b/tools/testing/selftests/nolibc/Makefile.include
@@ -8,6 +8,7 @@ _CFLAGS_SANITIZER ?= $(call cc-option,-fsanitize=undefined -fsanitize-trap=all)
 CFLAGS_NOLIBC_TEST  ?= -Os -fno-ident -fno-asynchronous-unwind-tables -std=c89 -ggdb \
 		-W -Wall -Wextra -Wundef -Wwrite-strings \
 		$(call cc-option,-fno-stack-protector) $(call cc-option,-Wmissing-prototypes) \
+	        $(call cc-option,--start-no-unused-arguments) -no-pie $(call cc-option,--end-no-unused-arguments) \
 		$(_CFLAGS_STACKPROTECTOR) $(_CFLAGS_SANITIZER)
 
 NOLIBC_TEST_SOURCES := nolibc-test.c nolibc-test-linkage.c nolibc-test-ignore-errno.c

---
base-commit: f9532b372e415e8198287ce010efa22f337857b5
change-id: 20261017-nolibc-unused-arguments-b504fc061c46

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

