Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5761481FC2;
	Tue,  1 Sep 2026 16:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280951; cv=none; b=PfJo4jukb0gflOvAvicTcWqwNtl8Lqtszf8/+GMsNEWVaQNboKW3nSweuDx4Jwp6IZ0iVulDaQWd96AkXXbyhGyHaOxOmGpf2CnEquOmL9eG66GGBfY4ctTk7TqtTtegg4k87L5kgfNyUsT8i2iIZtpYRa2VG8xwGBsq1Hf7nT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280951; c=relaxed/simple;
	bh=oL9d0Go6mi/VGMPgcxhNO52d25NV0sdszCMETabh+Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPHkd/ZyvaeGsA1QJiu/Ld0MsNSwU1kYxW1ggzh9Y5KqZsUaUi1aPpEkaYY5d/S4sR9envEZopzZxbb9OIjRhV2Uy+M0DYaZGDxFiBGH+UF2Gc2UdMnMSFOWSEn1mWqKX6WKJSRNwp/RbiWHfCdpqgWPHBjoxCkcGoQMLZvKxgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yhQAZO0W; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yhQAZO0W"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3961E1A1932;
	Tue,  1 Sep 2026 16:42:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0DDB66053C;
	Tue,  1 Sep 2026 16:42:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B01F011C7922D;
	Tue,  1 Sep 2026 18:42:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788280942; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=974G8/uKW2m5xLDzr1nWHC21XZpOSQqOpsO68GXI/VA=;
	b=yhQAZO0WCajjv4QXwzr5oZr1LWHWpehWWvxlWc6Orix731TBzvvaFah9Nlch5ZBgp2oDLg
	DkTzAdnKQXTVhUWDtu2h1ejNfl4ISNCbKgrwgASgBXTfuJhJQZ08jufYmWrCIHuq6Lm4er
	XeNa+Vj0HaksrXhDS7H2NRmR1royzKzKmKtN4ttwhLCLm5ubiY9S50BJ/4dRE+LIl38B6D
	bNYlGb0bWxdIgKRPKH463gy5Q31HFjGtyBtIiVRVYxGg6wDmaaRdwd4rhwJl27UElIs3E/
	ewi7KaRSjsxy4YHImDbE1TsSytouAQKfADiOREB5ObwiAtCGRrpQpgN4S8+Tsw==
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
Subject: [PATCH net-next 1/2] selftests: drv-net: ynl: Allow cross-compiling ynl and associated tools
Date: Tue,  1 Sep 2026 18:41:58 +0200
Message-ID: <20260901164200.1124343-2-maxime.chevallier@bootlin.com>
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

The ynl tool and libraries may be built standalone or through the
drivers/net/hw selftest machinery. This may target a different arch, so
we need to account for the cross-compiling options such as CROSS_COMPILE
or the LLVM-specific variables.

Let's include the tools/scripts/Makefile.include that deals with the
CC/AR resolution.

Fixup the ynltool CFLAGS handling to use +=, so that we don't override
the ones set in Makefile.include

Signed-off-by: Maxime Chevallier (Netdev Foundation) <maxime.chevallier@bootlin.com>
---
 tools/net/ynl/Makefile           | 1 +
 tools/net/ynl/generated/Makefile | 3 ++-
 tools/net/ynl/lib/Makefile       | 3 ++-
 tools/net/ynl/tests/Makefile     | 2 +-
 tools/net/ynl/ynltool/Makefile   | 4 ++--
 5 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/tools/net/ynl/Makefile b/tools/net/ynl/Makefile
index 3cefe4ed96cb..8bf72c063e86 100644
--- a/tools/net/ynl/Makefile
+++ b/tools/net/ynl/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 include ../../scripts/Makefile.arch
+include ../../scripts/Makefile.include
 
 INSTALL	?= install
 prefix  ?= /usr
diff --git a/tools/net/ynl/generated/Makefile b/tools/net/ynl/generated/Makefile
index ea4128f612d6..5a186349b5a8 100644
--- a/tools/net/ynl/generated/Makefile
+++ b/tools/net/ynl/generated/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-CC=gcc
+include ../../../scripts/Makefile.include
+
 CFLAGS += -std=gnu11 -O2 -W -Wall -Wextra -Wno-unused-parameter -Wshadow \
 	-I../lib/ -idirafter $(UAPI_PATH)
 ifeq ("$(DEBUG)","1")
diff --git a/tools/net/ynl/lib/Makefile b/tools/net/ynl/lib/Makefile
index 9b98c0599600..7b3eae89982f 100644
--- a/tools/net/ynl/lib/Makefile
+++ b/tools/net/ynl/lib/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-CC=gcc
+include ../../../scripts/Makefile.include
+
 CFLAGS += -std=gnu11 -O2 -W -Wall -Wextra -Wno-unused-parameter -Wshadow
 ifeq ("$(DEBUG)","1")
   CFLAGS += -g -fsanitize=address -fsanitize=leak -static-libasan
diff --git a/tools/net/ynl/tests/Makefile b/tools/net/ynl/tests/Makefile
index 40827ca8e579..99ae7dcd6348 100644
--- a/tools/net/ynl/tests/Makefile
+++ b/tools/net/ynl/tests/Makefile
@@ -2,8 +2,8 @@
 # Makefile for YNL tests
 
 include ../Makefile.deps
+include ../../../scripts/Makefile.include
 
-CC=gcc
 CFLAGS += -std=gnu11 -O2 -W -Wall -Wextra -Wno-unused-parameter -Wshadow \
 	-I../lib/ -I../generated/ -I../../../testing/selftests/ \
 	-idirafter $(UAPI_PATH)
diff --git a/tools/net/ynl/ynltool/Makefile b/tools/net/ynl/ynltool/Makefile
index 48b0f32050f0..85cc0840b403 100644
--- a/tools/net/ynl/ynltool/Makefile
+++ b/tools/net/ynl/ynltool/Makefile
@@ -1,12 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 include ../Makefile.deps
+include ../../../scripts/Makefile.include
 
 INSTALL	?= install
 prefix  ?= /usr
 
-CC := gcc
-CFLAGS := -Wall -Wextra -Werror -O2
+CFLAGS += -Wall -Wextra -Werror -O2
 ifeq ("$(DEBUG)","1")
   CFLAGS += -g -fsanitize=address -fsanitize=leak -static-libasan
 endif
-- 
2.55.0

