Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A6D52D2C2
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 16:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059308; cv=none; b=B1eM2N+nVXpf8kj1uH2Lkr1J8bALPi0KBcTjCWdANcR4nC7umuBogenbnlw7EzjTURa3N3rtsj6tNAGH7sJLlZiCIxqzHR0qTk5NNPQsXXz0uoai4ZaCm6Dzon0YnsXf0epJqCl8x8kWBieeYi5SsfwPRe5BeRyfQOgkH7sIACk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059308; c=relaxed/simple;
	bh=7QNs6NXWWKKkLOjDA8WTZScjj03/02sVjQQ7yEMIzYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FT3/zlKVkdLK1HvpeH32RFGfNR/WBN/Ygcga8FA7hNTcaN+8HEheiVB7uSTAz7nbOQRi+sRzed7J6P0KdDmF53beCjpga15h/v8LmxvOuPkecbWb1624yvABCahlt/ezeUG41nYRA+aAziKcbqxUSlNoUSIkz9KnJF5K7WRnMBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=f2zww/OM; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="f2zww/OM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 487EC1A0113;
	Thu, 10 Sep 2026 16:54:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0C7065FC38;
	Thu, 10 Sep 2026 16:54:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9DA3A11C7926E;
	Thu, 10 Sep 2026 18:54:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789059295; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=aDmdjhRY3UHSS7iyezWcdpKTYmGRyljkJNG/pl1HU84=;
	b=f2zww/OMGhzX/YwoJEamCphjxEtQAb9F8TuTw3e6RoblSleiLMGEdpLn8pd2SVpPeXhamF
	lFaqqisyZuyF50HShDRJ3LEja+aUMxh3SE9eEQcp1kuQDU7GD/g3XpaeNv2bJrpPaOhHaV
	gPDBxeprBNUL9nM9NTQxp4g2IiBPhWZi6jzPbtICdId5OkcSCdNVoOVWG7Q45/HL3xCosD
	WTgelmFF2l41on6Wifp64wpmi/AVAJgy839MvzJOBpQwq+zYqTy90A11dXAjLdiH8ievac
	NmFs/HIXV+a0v4KiUt9WSJEZTASXrIeO/vZoFnu3CwzFFNui/TXs1waRWT3E7w==
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
Subject: [PATCH RESEND net-next] tools: ynl: Fix out-of-tree build for ynltool
Date: Thu, 10 Sep 2026 18:54:50 +0200
Message-ID: <20260910165451.1027541-1-maxime.chevallier@bootlin.com>
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
Re-sending, the previous submission didn't reach netdev@ :/
Fixes a bug in net-next, so targetting net-next.

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

