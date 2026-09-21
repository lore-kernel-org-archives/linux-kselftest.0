Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21FD46D0A6;
	Mon, 21 Sep 2026 09:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984453; cv=none; b=deVvwCOVmDnwo2eDikFck2UudwxGElPrI9Vy++LMbdXZX7UN/593EZIqTsgwEhbIOQk27DLmhw6yPLG9GOmPDJsP7lKIMbzwPBWpTEjSnCvTBgysGM7KqruZppOWmH4dbEjIYDgjJOf6ONG2v2fSRqUSG/cDXZVpmAYt/7q7YNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984453; c=relaxed/simple;
	bh=cr7Pr1as3t8xw4ITRgieqkzUSZKvGQCDzGVVxAk8Q8A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g22y5QyvUvD5ntYL9xM3LnpTXTL86Uo7sGW3xW6to/kS1r9Gd6S1KvhtvKjmxR57NzqLEnz4m5SvYBun7gqfh88CNqQFZKsygvkhecaZFd3EjC5GYw071pCiS0nTBahnvYnXwQ90ivQ0pTvhtn3c8o7LJjIhG2W32dsB6aeFtdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=dojcZZtD; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="dojcZZtD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1789984449;
	bh=cr7Pr1as3t8xw4ITRgieqkzUSZKvGQCDzGVVxAk8Q8A=;
	h=From:Subject:Date:To:Cc:From;
	b=dojcZZtDHJQvER4Iog2k97V3g3PNoSNM/A+50WoTDjhYrIoR0xgY0a3APtxJbK4JH
	 NirWWksqzZT4tiH/c3XB1Rsoop+SqLadgK66nMjzIQ80adCqj92YcT1HJQCKq+ObGL
	 9xR/MZr7y0rvbwUHn+CJuIrT88gjUYDWH0/zIqtM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/3] vdso/gettimeofday: Add support for ALARM clocks
Date: Mon, 21 Sep 2026 11:53:59 +0200
Message-Id: <20260921-vdso-alarm-clocks-v1-0-617abb5271c7@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2N0QrCMAxFf2Xk2UBb6EB/RXyIbdToXDXZxmDs3
 626xwPnnruAsQobHJoFlCcxKX0Fv2sg3ai/MkquDMGF1u2DxylbQepIn5i6kh6GbXSBYvSUY4K
 6eylfZP41j6c/23i+cxq+oc1Qfo/1bNi0df0AlaOXJYoAAAA=
X-Change-ID: 20260921-vdso-alarm-clocks-6502a551ad5c
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789984448; l=893;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=cr7Pr1as3t8xw4ITRgieqkzUSZKvGQCDzGVVxAk8Q8A=;
 b=h9SiNGJ6286q1j9mPyZTbyG5v08Qtx7hNBTXld3gghrRxNc7EHKpMrnHLoVMoZRgczA5S4T7g
 DPycTtEy51zApwy8dktCVNlEcuh9SKbmtIWIO+dR/XPZar8xAUjxk4h
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Extend the generic vDSO library to also handle CLOCK_BOOTTIME_ALARM
and CLOCK_REALTIME_ALARM. This does not introduce any runtime overhead
in the userspace fast path and only memory copies in the tick update
path.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (3):
      selftests: vDSO: vdso_test_abi: Also test ALARM clocks
      vdso/gettimeofday: Add support for CLOCK_BOOTTIME_ALARM
      vdso/gettimeofday: Add support for CLOCK_REALTIME_ALARM

 include/vdso/datapage.h                      | 2 ++
 kernel/time/vsyscall.c                       | 7 +++++++
 tools/testing/selftests/vDSO/vdso_test_abi.c | 4 +++-
 3 files changed, 12 insertions(+), 1 deletion(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260921-vdso-alarm-clocks-6502a551ad5c

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

