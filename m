Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3195013B5;
	Mon,  7 Sep 2026 16:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797704; cv=none; b=JdQmxv0UGr20g2hzxO8xvUyXQPUuWi0+g19ThQOndbfp3HukfRdR+8MNjDCC2/cwrIIBXeJ6XUQLbvWkr64oE8jCOVMh92F/XcTdZsu6tUmJ1wuUbxjjPHG3TfuqK/0qSZLtYT5Cl+89FVFBRmdXWy+PvAJ1RuXsLlRrwTRUj4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797704; c=relaxed/simple;
	bh=GXS7uy7ZQPlg5GAAD/bVVz/FgtCNKoR5H+ZSEQtiRAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ll/5Xg7gy83lTU3/QGVC0ruJlc5QnSgnjTDywUv8xZQAxw4slLkwMODpJcCS3bSG/kKjsnBG3yvP7ZRjxaJ3zfCz+Q8fwNJg5zR1j0E/ptkg/vMKO6foMS06E0sKM0/wBBK+vkKlyVh9ndGVEaoFlZyt1ADLqWIX6Wu87FfW02w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TI03mc4c; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TI03mc4c"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BFDC41A1A3E;
	Mon,  7 Sep 2026 16:15:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B1D560383;
	Mon,  7 Sep 2026 16:15:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 732ED11C79257;
	Mon,  7 Sep 2026 18:14:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788797696; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=RrpUiysZLfwdvwiw0RYbueYYBMWHQpaCTOyhsapAyQ8=;
	b=TI03mc4c2oDqd2HqNbQsZ7+QElDhxqHZs3moa6s81RDIrCOBBtzy1AFPZVUid8C35nVyiH
	WNeuja3Cx5nTdEN6IDFnLGRbACQJ0qx2MiHjcuBtlBrvDmT61PAZsb/sfPt310WQ/eZuMf
	hfKXhGLT3h1Bhll+yL/s7S8Dh85h/ErsiqlmOmTmi+39GVZb0FF+lLnlc4mtuPpaQjOZxL
	K6MNzAaTLgSkftyuaRTKSYPXp7C8KpGwJ0QmMun2wQnKv4x9mHFUM0N4kH+GOqsszBETSH
	mLTXbvyNJL2x8+Rpfjctv9pm6XNjk3cawt0Vyze+jwWznBFAuIfL15nV3jNkrw==
From: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	matttbe@kernel.org,
	Stanislav Fomichev <sdf@fomichev.me>
Cc: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v3 2/2] selftests: drv-net: Use cross-compilation environment for the io_uring check
Date: Mon,  7 Sep 2026 18:14:36 +0200
Message-ID: <20260907161438.755125-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907161438.755125-1-maxime.chevallier@bootlin.com>
References: <20260907161438.755125-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

To test for the presence of zerocopy support in the available liburing,
a small check program is compiled.

The CC value used for the io_uring library check defaults to the host
compiler, which will incorrectly validate liburing based on the host's
sysroot and not the target's.

Normally the CC for cross-compile is set in lib.mk, but this also
requires the test list to be set when we include it, and this check
needs to run first.

Note that this doesn't cover the LLVM cross-compiling case though, as
with LLVM we may still detect based on the host liburing.

Suggested-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
Reviewed-by: Matthieu Baerts (Netdev Foundation) <matttbe@kernel.org>
Signed-off-by: Maxime Chevallier (Netdev Foundation) <maxime.chevallier@bootlin.com>
---
 tools/testing/selftests/drivers/net/hw/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index 6105be8e590f..f9458dc6c150 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -1,5 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0+ OR MIT
 
+# Set CC for the io_uring check
+ifeq ($(LLVM)$(CC),cc)
+CC := $(CROSS_COMPILE)gcc
+endif
+
 # Check if io_uring supports zero-copy receive
 HAS_IOURING_ZCRX := $(shell \
 	echo -e '#include <liburing.h>\n' \
-- 
2.55.0

