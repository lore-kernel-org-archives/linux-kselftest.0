Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F870517BA8;
	Mon,  7 Sep 2026 16:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797698; cv=none; b=dGjDiVCqZP7kT555nvhMgFw+qRYpVoGHy6DnBahkvEmyf4kNA52Brxio/W/BtKFyQUlKgfcpiIFo9R3HOWq3ZIhIY4pN+GWyClQdy6aACng2plrAxlMWbZgtToHFLa4Px1Qjn2TpMhSOJm2FRjIIwo03bS7KlYZ9DCC91n+YIvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797698; c=relaxed/simple;
	bh=i9Jn+nMK5yRKJILpxGhn4u+rjeyL7aCOIsewDJssZDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qA3nD+Pm0g+S6q1s6fMqRG+HGi+sKxfKqmnVb9xcl85uftlmUCpNlmHFtgpNZdBw7JAr2RFcOh0Xyj5NhiXRy0EuZRA1Negq8yVv5/GWYB8m+H4EqSDL8JjIOzdZFcny9rZfaBpo+KbrZ0LBXRnyITA4Z1uDFpE7cN3B1oHyrcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gy8h3Q8H; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gy8h3Q8H"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 040D94E4156A;
	Mon,  7 Sep 2026 16:14:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD70A60383;
	Mon,  7 Sep 2026 16:14:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56C6211C79FF1;
	Mon,  7 Sep 2026 18:14:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788797689; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=28SvcWgrOztUICc4tgGJQGEoj/8YPhXVEIGuRH590fY=;
	b=gy8h3Q8H8baCsejxCAwmcrrrVlG2bpxVFCEFl1pRzcoz2uOFJ2ewLCVbItFVcOWIt4CjfK
	ZtBd8I2ZSDBzP0FqQVtef95Emjz78vY9TsTRcf9KNFGntXHDS98CPtbDTRWivqZPrjq+dF
	M31KuzsPfTfYoLK0JNzrOiC30ljbH+Am9Uk8015ulQ6A98DWuTBnCvR3Smq5k3FsFL7EtP
	/fd6t3QS3jbTdY1IC4yzDMabrL9lQxg5lHc5J4Peg1pVd+yqrxik70plLugw9wLipUgeHz
	SjageWEHpt/Ko0wKlWcGE5naXdRCimuhnNRigmQIhvMigpAxjP6inaGTr730Bg==
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
Subject: [PATCH net-next v3 1/2] tools: ynl: Allow cross-compiling ynl and associated tools
Date: Mon,  7 Sep 2026 18:14:35 +0200
Message-ID: <20260907161438.755125-2-maxime.chevallier@bootlin.com>
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

The ynl tool and libraries may be built standalone or through the
drivers/net/hw selftest machinery. This may target a different arch, so
we need to take the CROSS_COMPILE variable into account for LLVM and
gcc.

Let's include the tools/scripts/Makefile.include that deals with the
CC/AR resolution.

Fixup the ynltool CFLAGS handling to use +=, so that we don't override
the ones set in Makefile.include.

Makefile.include also sets the Q variable for verbose mode, so we can
drop it from the ynltool Makefile. This will allow properly selection
the verbosity of ynltool builds with the V=1 make flag.

Reviewed-by: Matthieu Baerts (Netdev Foundation) <matttbe@kernel.org>
Signed-off-by: Maxime Chevallier (Netdev Foundation) <maxime.chevallier@bootlin.com>
---
 tools/net/ynl/Makefile           | 1 +
 tools/net/ynl/generated/Makefile | 3 ++-
 tools/net/ynl/lib/Makefile       | 3 ++-
 tools/net/ynl/tests/Makefile     | 2 +-
 tools/net/ynl/ynltool/Makefile   | 6 ++----
 5 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/tools/net/ynl/Makefile b/tools/net/ynl/Makefile
index 3cefe4ed96cb..838c465d65aa 100644
--- a/tools/net/ynl/Makefile
+++ b/tools/net/ynl/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
+include ../../scripts/Makefile.include
 include ../../scripts/Makefile.arch
 
 INSTALL	?= install
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
index 48b0f32050f0..b8c67cdb4fdf 100644
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
@@ -27,8 +27,6 @@ include $(wildcard *.d)
 
 all: $(YNLTOOL)
 
-Q = @
-
 $(YNLTOOL): ../libynl.a $(OBJS)
 	$(Q)echo -e "\tLINK $@"
 	$(Q)$(CC) $(CFLAGS) -o $@ $(OBJS) ../libynl.a -lm
-- 
2.55.0

