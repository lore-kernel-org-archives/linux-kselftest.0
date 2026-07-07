Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66252424646;
	Tue,  7 Jul 2026 16:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442563; cv=none; b=UV1h6/dh/Aelzu/f6/itMLFE4LRbGP+AWlAZ3IVQ71lAU5OuZQ0G0IiQ9cKppvQHE7O3nigf8LLa1BVxHLuy0U3u8CH4EexF7MJlAP9t2am8tjLluEcExw6iHuiSoCPGZH/7RmlOsctO7TvbJOhWS1dCS1ziEUQVYeLW0oBFZfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442563; c=relaxed/simple;
	bh=IOXUH20QyU8LHNzJXiibs12N4TUODIER18Oav3baHBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lgHNpVRnElzsGHjA1euJZ/oFgXks3NGFgNnqcIlv/SiAex9Eg66QqXArCkFdXgnhRa/0/wcbrXXP7BMz8ADSvWRXoWOVVOKEGtmuZOPm0hi0ufM5aRg/sx9GtjVUX143flhVjP+tHYpFT0toGntfG/ZXL50S3X3+9RjKrz4GGKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=D4R/uHGi; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="D4R/uHGi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1783442553;
	bh=IOXUH20QyU8LHNzJXiibs12N4TUODIER18Oav3baHBQ=;
	h=From:Date:Subject:To:Cc:From;
	b=D4R/uHGimc9yP1p1ZjWJRPiKiMThlS1ZcDpwTokmFQvMg0KCByRK/TeMRHqtqH1ek
	 UkejzVGGz+OgiIqgK4ml6QaAlVY70IpWIErtC02uWDTyLgVX0p/CjqxXV3l9HOVFBY
	 lmrKQSB6sJZIcC+mJFiTG8FD+xnRCBKdinKz2rZo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 07 Jul 2026 18:42:30 +0200
Subject: [PATCH] selftests/nolibc: add debug information
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260707-nolibc-debug-v1-1-31619ec94bbd@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwNz3bz8nMykZN2U1KTSdF0Dk2TL5NSUFOPUxDQloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAJTWhMnAAAAA=
X-Change-ID: 20260707-nolibc-debug-04c9cedd3eaf
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783442553; l=1454;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=IOXUH20QyU8LHNzJXiibs12N4TUODIER18Oav3baHBQ=;
 b=TMTH06Gwg8EoMWgSPjlojhv8Y32TF+t1hFtccSJSCTkzuJfwLroPzWzIJBVxHM4E2oIsSqVVN
 810xvvVlK7CCozRuKnfptVCXe3rahxlqpMBPj3MVQC2zg6CruGWjYbl
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

When working on nolibc, debug information is very valuable.
I find myself adding this flag in many patchsets.

Enable debug information unconditionally, as there is no downside to it.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/testing/selftests/nolibc/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nolibc/Makefile.include b/tools/testing/selftests/nolibc/Makefile.include
index c30ca3a9ef14..ea520eac64a6 100644
--- a/tools/testing/selftests/nolibc/Makefile.include
+++ b/tools/testing/selftests/nolibc/Makefile.include
@@ -5,7 +5,7 @@ _CFLAGS_STACKPROTECTOR ?= $(call try-run, \
 	echo 'void foo(void) {}' | $(CC) -x c - -o - -S $(CLANG_CROSS_FLAGS) $(__CFLAGS_STACKPROTECTOR) | grep -q __stack_chk_guard, \
 	$(__CFLAGS_STACKPROTECTOR))
 _CFLAGS_SANITIZER ?= $(call cc-option,-fsanitize=undefined -fsanitize-trap=all)
-CFLAGS_NOLIBC_TEST  ?= -Os -fno-ident -fno-asynchronous-unwind-tables -std=c89 \
+CFLAGS_NOLIBC_TEST  ?= -Os -fno-ident -fno-asynchronous-unwind-tables -std=c89 -ggdb \
 		-W -Wall -Wextra -Wundef -Wwrite-strings \
 		$(call cc-option,-fno-stack-protector) $(call cc-option,-Wmissing-prototypes) \
 		$(_CFLAGS_STACKPROTECTOR) $(_CFLAGS_SANITIZER)

---
base-commit: a3b2181459a2c74c03ddbad585f884eefc8ff8ff
change-id: 20260707-nolibc-debug-04c9cedd3eaf

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

