Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AE439D6E8;
	Sun, 27 Sep 2026 08:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790498981; cv=none; b=OlbcVJbdKvBcW4KWrRx9l8pQRgj3bX7jiguL6OC49REoYW2ZbieH/rnouQRNZNXGHJ0x37UclZ+pV6O26xuGgssCLcC7C0GuTbH8Y9Wo87p6fcs1N4QBShX8WHxMsKW/3dO+gPECNZmZOHgUTteE9WllFYVXkUfovEJ0aaeGxQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790498981; c=relaxed/simple;
	bh=RqZSl0BRkOMKLuI519KEa62uvUo6JdSFVcKBJgenLl8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eA1fBdmQeTJQL1wWACXCYC3HCwLTAjUMjp4vUsiE0asfCv579HiPuiwky65uTVMG0W/2GVyHwTXCU6eXoTzOradG8/QOXcTkU9xnzge77PIVkggYxAf6pbm57umLb1UCwvJH6AOnS0xdqiARFBoQYLkeQl7K0TyiuDzTr/hHygc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=t3I8I5om; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="t3I8I5om"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1790498971;
	bh=RqZSl0BRkOMKLuI519KEa62uvUo6JdSFVcKBJgenLl8=;
	h=From:Subject:Date:To:Cc:From;
	b=t3I8I5omWOn+Iwu/PPfcPAQ8P8Tnm/DPVFZbpiDbzvmGASfdqTYsQ6qrrDfqklfP6
	 sE0w8tv2EB5aBTonbdjnUeb+ptGdFzqCRkEYWPBjCtCotDnMpbCOek5ztX4DlC43eJ
	 tdnu3cB9Fv7fbMWDUNxXFYONuuR6bPv4buZjByJc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/5] tools/nolibc: pwrite() and pread() support
Date: Sun, 27 Sep 2026 10:49:11 +0200
Message-Id: <20260927-nolibc-pread-v1-0-e9af6e47b37a@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqAIBCF4VeJWSeUdn+VaGE61kRYaEUQvXtWy
 +/A+S/w6Ag9NNEFDg/ytNiANI5AjdIOyEgHA094kdQ8Y3aZqVdsdSg1E0aKqkzzWhsJ4RJWQ+e
 Xa7vffu8nVNvbgPt+AHg0nEFwAAAA
X-Change-ID: 20260924-nolibc-pread-3fa387159dfa
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790498970; l=1434;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=RqZSl0BRkOMKLuI519KEa62uvUo6JdSFVcKBJgenLl8=;
 b=jxxfwvjwuY2UhSr4SjmEaCulik5VnMEVNZYcQoOdmbK7ZOEr/bJXVutAJn5gRy5ECk4YXYomE
 iiJ1s+/adIJCEyU6pOhWfh4KGryTJV8j4eR7iq/T/Q2OaWYlw9TFJwz
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Some users are missing those.

Link: https://lore.kernel.org/lkml/20260923224408.3745689-7-pratyush@kernel.org/

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (5):
      selftests/nolibc: make the broken MIPS N32 argument detection reusable
      tools/nolibc: make 64-bit systemcall argument padding generic
      tools/nolibc: move __NOLIBC_LLARGPART() to compiler.h
      tools/nolibc: introduce __NOLIBC_BITS_PER_SYSCALL_ARG
      tools/nolibc: add support for pread() and pwrite()

 tools/include/nolibc/arch-arm.h              |  7 +---
 tools/include/nolibc/arch-hexagon.h          |  7 +---
 tools/include/nolibc/arch-mips.h             |  8 +---
 tools/include/nolibc/arch-powerpc.h          |  7 +---
 tools/include/nolibc/arch-sh.h               | 18 +++++++++
 tools/include/nolibc/arch-x86.h              |  2 +
 tools/include/nolibc/arch.h                  |  5 +++
 tools/include/nolibc/compiler.h              |  9 +++++
 tools/include/nolibc/sys.h                   | 60 +++++++++++++++++++++++-----
 tools/include/nolibc/unistd.h                |  4 ++
 tools/testing/selftests/nolibc/nolibc-test.c | 60 ++++++++++++++++++++++++----
 11 files changed, 146 insertions(+), 41 deletions(-)
---
base-commit: 0e1c44b472e1ec21efdad1df21b10e5c568b65b5
change-id: 20260924-nolibc-pread-3fa387159dfa

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

