Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F329E3B4EB0
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 07:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937926; cv=none; b=LAJm7WKnadbfYrF0oK3pjv58yzKhWL+aE3A6ECD4+MTJaxzVIkGg8xJbchw3KM25kB+DQhMrleUOeU1NlyghfR2wQdF047L7V3vuFzvIx7U4Ot8/ef+s+eQh31/zUcaW7kkXAFhKFPaGSnyFDnwreaEoZl7372bcKmERiFfE8j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937926; c=relaxed/simple;
	bh=7AXpKDBvtYtN7R5PiABhVAilmec0rVru3yFYHIUsEGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hgotWe60qZ74onRfJCo9DUxa34VY5ZpWDbCfWSDjpyolJIPp0NLIkyr4dhl4lx18FruRwnUnAe9XEpi9+TYZue79MieY/P5YTK6xiTAzSlwo6D0Zn2MovJH15otkrJosUrEJqOSvqOysWdY5Pt79HfWOXTgDulSUA+ZynoCQKvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ous+8sLq; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ous+8sLq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 51FAD1A1A6D;
	Wed,  9 Sep 2026 07:12:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1C1D560448;
	Wed,  9 Sep 2026 07:12:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D3FF11C7AF25;
	Wed,  9 Sep 2026 09:11:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788937921; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ClGWkCrAEcZsuhRQ4KGQ7xioMUBoHGO60NH7qmq+AsE=;
	b=Ous+8sLq7eFEf/a8kmzFxp09SH3dkv233lGrFpz0q2B1lfFxs7LuCl6OnXU0R5pfoWc3BR
	eTFR1+nsRG6oPyxSUCeOuOZHhARgG+Vqnum7LH7ylHAam9IHDRUqIwPvrJuDavsYzXL3QX
	WjxyeRiEFYgRIQ1kVAzVIjEgm29NHJKIEDGBFEKxtHYVckPxmltYt9995KQvBzxAa762de
	ecECd4kJdllqYi0wkCBtPBdNhaALEjizVSMra2yrDFDfjr7iIDrnjwnrj31nWk0a7AebBs
	UMJtPxG1sCUvkS1qOI123Sw4MuC398v4M8O+KbcGDBu1sxl4X6GvXBDPBp+pJg==
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
	Stanislav Fomichev <sdf@fomichev.me>
Cc: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next] tools: ynl: Fix out-of-tree build for ynltool
Date: Wed,  9 Sep 2026 09:11:54 +0200
Message-ID: <20260909071155.1234922-1-maxime.chevallier@bootlin.com>
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

Let's update the %o: %c rule to also use $(OUTPUT).

Reported-by: Bobby Eshleman <bobbyeshleman@gmail.com>
Closes: https://lore.kernel.org/all/aqCyWQxqKDuQnZYR@devvm29614.prn0.facebook.com/
Fixes: 917f713b4ec4 ("tools: ynl: Allow cross-compiling ynl and associated tools")
Signed-off-by: Maxime Chevallier (Netdev Foundation) <maxime.chevallier@bootlin.com>
---
Targetting net-next, as the blamed commit lives there.

 tools/net/ynl/ynltool/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/net/ynl/ynltool/Makefile b/tools/net/ynl/ynltool/Makefile
index b8c67cdb4fdf..1053e7606c86 100644
--- a/tools/net/ynl/ynltool/Makefile
+++ b/tools/net/ynl/ynltool/Makefile
@@ -31,7 +31,7 @@ $(YNLTOOL): ../libynl.a $(OBJS)
 	$(Q)echo -e "\tLINK $@"
 	$(Q)$(CC) $(CFLAGS) -o $@ $(OBJS) ../libynl.a -lm
 
-%.o: %.c ../libynl.a
+$(OUTPUT)%.o: %.c ../libynl.a
 	$(Q)echo -e "\tCC $@"
 	$(Q)$(COMPILE.c) -MMD -c -o $@ $<
 
-- 
2.55.0

