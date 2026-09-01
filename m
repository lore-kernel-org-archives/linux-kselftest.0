Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91235481FC2
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 16:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280956; cv=none; b=MhF0xuH8lp6iLsaeKmQQ6EpHADEZMIQs710DNvg8/38ECwYDsLnjPIGJXnBKxsy+fuYU0C/rjHWdMStLC6m6DG1yVpj5J39IiFPYF9F2Y4JZSYbbtvVqXkxkTfGPthyy9R0n7UPJG+oUz9f0NSyPL00vfJgjfTpheuunqljEcQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280956; c=relaxed/simple;
	bh=OuzuyHS6Aee0uqjsgz3eDjQwQT5qFFkxKPDmF1PtJcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pv+NUa7I2rW/iukZDJcQUEZFwGMHkgsdOY3kVDWCXINvOekZPp++UsDGBN15S3kQM3Cpt1CN4h2O+CyMJLPoX1uYPkqApd2Hxn3qeHM9NurCIS8EFetQT9WHfUwm/jjuCIGuUId8skeF+3YKiKJ7zu4EX+TZ/hCvzQ7Qa8lmdNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uA75FqSO; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uA75FqSO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 18C8A4E414A8;
	Tue,  1 Sep 2026 16:42:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E2E676053C;
	Tue,  1 Sep 2026 16:42:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B67111C7927A;
	Tue,  1 Sep 2026 18:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788280948; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=mwD6RNRMS6GTy4KFntwUfx5v5Cnc7n48MawaxDnu5rk=;
	b=uA75FqSOHXllWbUkiHXCN4q9wbW9WuN71f+SWoonih5FPwUPRx1mfjDe7XeE/rQ+h4pcQ1
	Ni5UkVlLMAkamN2VA0QkN5d8aw8TUBjMExin0S0gSREtxPGnR4TxgNGOmqkH0j3cd58SnA
	eMzP/nI0a6LmPhKPo1vanpZ/LIeDg9SbIZqTcY6CoQ6mXJGFE0RUUCqojv+tQRDRyzcB7q
	HzxhaTGQjxY+qLG9nxb7Z2gV1iq8DkoTt1iJGgeVB+bKwpyI+vMfX31E5kWzFBAOwZmP9Q
	F02ngTvTYY1rsXeXROWop6Z0CXX/LHtdeknM1k6pxWyu968g+AaYbd7JugmPYA==
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
Subject: [PATCH net-next 2/2] selftests: drv-net: Use cross-compilation environment for the io_uring check
Date: Tue,  1 Sep 2026 18:41:59 +0200
Message-ID: <20260901164200.1124343-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901164200.1124343-1-maxime.chevallier@bootlin.com>
References: <20260901164200.1124343-1-maxime.chevallier@bootlin.com>
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

Signed-off-by: Maxime Chevallier (Netdev Foundation) <maxime.chevallier@bootlin.com>
---
 tools/testing/selftests/drivers/net/hw/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index 78bb0169350b..0ebb4767cd57 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -1,5 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0+ OR MIT
 
+# Set CC for the io_uring check
+CC := $(CROSS_COMPILE)gcc
+
 # Check if io_uring supports zero-copy receive
 HAS_IOURING_ZCRX := $(shell \
 	echo -e '#include <liburing.h>\n' \
-- 
2.55.0

