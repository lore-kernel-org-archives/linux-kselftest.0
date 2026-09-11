Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D5549BD6F
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 16:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144922; cv=none; b=WYJxbd/8ofYQl3zk8FPOwbGyg1rsQAwvmSXu2LFRk/K6SZuABKHeXyXtvyc+w5rhhiz9XGZdv3BwPBfdStc0SMPUiNM9Lf+ZR8ARd1p321eUD8o0sZNgv4qunQAGbyHJgXo5oetO2kWyzOgAp7tPoA8LMPm02F4E3PBxB/iDhng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144922; c=relaxed/simple;
	bh=h47qJES/qZJHMmeUe0na21XfhEU6R3j+2k2Vv+5n1Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rzUvcrlxCWXp5LrjmhNVcxi5lkV5nItF0nqvM56jrCe797G/WNjNbiqochEhy0rZdDXDn6clkwliUDzi40I8+CzCzXJIzNLzg0qvkGAbqI4/yK8HivUbRMtlDZdcA3dlIoz7wDhgMBXp4uA8/VG18HRlZdTqOzKko2uxT07lvR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jIsN4tuV; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jIsN4tuV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B92B74E401EF;
	Fri, 11 Sep 2026 16:41:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1EF90601A3;
	Fri, 11 Sep 2026 16:41:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C919811C7A9DC;
	Fri, 11 Sep 2026 18:41:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789144913; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Rw9jSI3K5RFJvTn+3XarXtAG3wY4HQElRj6gzzRiRUw=;
	b=jIsN4tuVR8Lw6vMMO55MWlY5dC9IU4JaqjdA1bYBymI1Q0dRzPPC+pTCpMBcwl/Qp91lcD
	nW4Hesr020/or6qqE2l1JgjxHRu/33isxChAAr4uCNA9Fa0TjqESHPjIWOxdknsQFe222U
	IzjQKKEVkCDmAUcEzrdsFKmRVxouvXdCDpD4OiEBCqjXPOKIAulvz1tKZ+TWBCIOw80DmF
	ZT1L2EU+ShG3V2huEjy0HectsBF4GiNTHQmDFzZ2rMvTY4FQaC7TwZZXU4xfJSolaFgLwC
	QNe9mbyfNDzKw0+VTDDJQPeXg02+/UxaRC3JzD7g8uohUxAfIOsAz/Y26BRZ1A==
From: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Bobby Eshleman <bobbyeshleman@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	matttbe@kernel.org,
	Stanislav Fomichev <sdf@fomichev.me>,
	Nicolai Buchwitz <nb@tipi-net.de>
Cc: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2] tools: ynl: Fix out-of-tree build for ynltool
Date: Fri, 11 Sep 2026 18:41:33 +0200
Message-ID: <20260911164135.1428140-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

After the blamed commit, running a out-of-tree build for ynltool fails :

  # make -C tools/net/ynl/ynltool O=/tmp/o1
  make: Entering directory 'tools/net/ynl/ynltool'
  make: *** No rule to make target '/tmp/o1/json_writer.o', needed by '/tmp/o1/ynltool'.  Stop.

ynltool's Makefile correctly accounts for $(OUTPUT) to get the list of
object files to generate :

OBJS := $(patsubst %.c,$(OUTPUT)%.o,$(SRCS))

but it never actually set $(OUTPUT) before the blamed commit, meaning
that out-of-tree buils of ynltool were always actually in-tree.

Now, the O= parameter is correctly accounted for, and the %o: %c rule fails.

Let's update the %o: %c rule to also use $(OUTPUT), as well as the .d
file expansion so that any header change is taken into account.

Reported-by: Bobby Eshleman <bobbyeshleman@gmail.com>
Closes: https://lore.kernel.org/all/aqCyWQxqKDuQnZYR@devvm29614.prn0.facebook.com/
Fixes: 917f713b4ec4 ("tools: ynl: Allow cross-compiling ynl and associated tools")
Signed-off-by: Maxime Chevallier (Netdev Foundation) <maxime.chevallier@bootlin.com>
---
V2: Add include $(wildcard $(OUTPUT)*.d), from Nicolai

V1: https://lore.kernel.org/netdev/20260910085931.3c64f2ab@kernel.org/

 tools/net/ynl/ynltool/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/net/ynl/ynltool/Makefile b/tools/net/ynl/ynltool/Makefile
index b8c67cdb4fdf..e79b8af353c3 100644
--- a/tools/net/ynl/ynltool/Makefile
+++ b/tools/net/ynl/ynltool/Makefile
@@ -23,7 +23,7 @@ OBJS := $(patsubst %.c,$(OUTPUT)%.o,$(SRCS))
 
 YNLTOOL := $(OUTPUT)ynltool
 
-include $(wildcard *.d)
+include $(wildcard $(OUTPUT)*.d)
 
 all: $(YNLTOOL)
 
@@ -31,7 +31,7 @@ $(YNLTOOL): ../libynl.a $(OBJS)
 	$(Q)echo -e "\tLINK $@"
 	$(Q)$(CC) $(CFLAGS) -o $@ $(OBJS) ../libynl.a -lm
 
-%.o: %.c ../libynl.a
+$(OUTPUT)%.o: %.c ../libynl.a
 	$(Q)echo -e "\tCC $@"
 	$(Q)$(COMPILE.c) -MMD -c -o $@ $<
 
-- 
2.55.0

