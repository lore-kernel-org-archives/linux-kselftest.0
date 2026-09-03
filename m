Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55DB4CB8A4;
	Thu,  3 Sep 2026 15:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450936; cv=none; b=dcqUAG8WJj3wTQAH+XWE5EwOEUm6DFo+/7VWI4GGbAEXK+LdI3B+bv6PNCSedBG4uk/kaX2vY6J7cLqw88x4vd0K6GFUf6DdNpuVIeCdaW/RZQpuF4EDr+dwhpsLUGsYz9LVLs2e+HoVKonZUYkGrzUCBOsNakSpMlrT9p2+KRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450936; c=relaxed/simple;
	bh=8riOprZzOx5VNxFq6Mu0JLi7Psb/3lqKj9XMOrlRwV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AF4SZ0leXYiJSB8hnUG6EXIm1cXwBVK6u02GyLMCSk+dRCRKT7lQCAF7dSh7DmkKd0rWT4W8781+Yd+U7CvZ+8DI3JcWsdYUWaBwRvNe8gjFhyV1f2f3xV4JtRR7uMK5AaWvxbhJkUTTEFPEJzH5QjG24F6uJO4IK3HMxllx97A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MwEFw8ZF; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MwEFw8ZF"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2D0891A197F;
	Thu,  3 Sep 2026 15:55:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 016106054B;
	Thu,  3 Sep 2026 15:55:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D11B311C79776;
	Thu,  3 Sep 2026 17:55:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788450932; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=F2iYv7w94fBUcU0dgYfP8HvNVq7KQvbN0dmbw7DgBkE=;
	b=MwEFw8ZFhjFCLFFPD2ibN6y25HtanmEzr4RIq9MoLO8/EGi300/1f5bX6c8lSCJXfy6Llj
	nA2zsfur2gfhQmfQNEKhKFiWVOFYi5f4F6EYHqrR72eQ3cw1/1dcSq/Hb3V5J3KMbI+497
	zayC3iYr05KHmchQhGaDd9vNCzGqdAtMNo7ohjIzANspzN2JgrCKjeSpGdFUiBHWO11Vqs
	eJjNhDhJ2UHmwUtv5X2GuLrpRPakw/JNx+Wl2V+0ZpIj9Cf3aFSoviBuDwX42W9fVPyE+w
	aUQZh2WW0gOMtQZNglzFotEiItxOIDgG+iplWgaA/qdj6UHfs5jfT28fHUH/mw==
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
Subject: [PATCH net-next v2 1/2] tools: ynl: Allow cross-compiling ynl and associated tools
Date: Thu,  3 Sep 2026 17:55:22 +0200
Message-ID: <20260903155524.2241065-2-maxime.chevallier@bootlin.com>
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
V2: Fix subject, as per Jakub's review

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

