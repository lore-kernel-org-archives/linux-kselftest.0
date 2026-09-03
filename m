Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D2D4E8E02;
	Thu,  3 Sep 2026 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450938; cv=none; b=Z7QwiFkBfH7Rs3jnJfYxBFRtRi4vqV3ZEuM4PAl0hejqrKnhvEFSI9vMCoD3kuitO4RuEZXW8ilGeTqnWDKm+SEJTd1EyhKoRFJqLyr3Wx9+mPcnlz36jFnEL1BsDXVtxQTRcCila+79krxji89Hwz35v6Jtg/4NYDmWQowtW+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450938; c=relaxed/simple;
	bh=hA3/B7cyPJmwoWdLf9ib4iflfFKZt/lQoHBDjG2GjDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I/xUnuU3KOjmjas3xNpTIgd3tF+uaKxNhOxx8KqyF1CBB+H88MfWt42u0qttZbzgqV8YZSoJB6/0pTil7anVKp+j2HKhmVFRXXCMKgaNkQeK1za0EXbV6sX2jRDYts09JEoZhA9m/J/maLoG4MVTxBBOwDZzHBeSziDHANv53xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NTT+zK1b; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NTT+zK1b"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 58A431A1980;
	Thu,  3 Sep 2026 15:55:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E2FE6054B;
	Thu,  3 Sep 2026 15:55:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81FB511C7A332;
	Thu,  3 Sep 2026 17:55:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788450934; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9yy1ws6cQZrGfdQ8UzzWR0UzkJ14jmmIFo2MGf4XpH8=;
	b=NTT+zK1b29OKZXKAk4LFwV/G2+V9YUeZ3yTJyLh+0VHCvFTIDPJryCPXYy5CwHq+LKAgD+
	gjqXBcGES0V0/p8tVSWS55Hd7b1gZAOCUMyGyXma2npOTF5ZI1+YoV1+8W2BEXr0xzoRFk
	zsNBKPaXrGeLfHT3tp+z0nR33EPXvGN/xTA/0c1CjdDGAQH9s7IOVHOf73cWG38oGhX62S
	Mq6+YRx5VGs182HFLzbFUxnIfvjWjbo2F5tdAgtM6BMff5ld/hBgwqPjBPVBk0pqvM/mOj
	S0rdPEUjx9mlRLQP1WItSqKrhf6REM0efweJZM8yP8drhPxrsF0yklnvQkGCzg==
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
Subject: [PATCH net-next v2 2/2] selftests: drv-net: Use cross-compilation environment for the io_uring check
Date: Thu,  3 Sep 2026 17:55:23 +0200
Message-ID: <20260903155524.2241065-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903155524.2241065-1-maxime.chevallier@bootlin.com>
References: <20260903155524.2241065-1-maxime.chevallier@bootlin.com>
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
compiler, which will fail in cross-compiling environments.

Normally the CC for cross-compile is set in lib.mk, but this also
requires the test list to be set when we include it, and this check
needs to run first.

Note that this doesn't cover the LLVM cross-compiling case though.

Suggested-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
Signed-off-by: Maxime Chevallier (Netdev Foundation) <maxime.chevallier@bootlin.com>
---
V2: Use an LLVM-aware construct for CC construction, from Mattieu

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

