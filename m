Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D0038D3ED
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Jul 2026 21:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783027382; cv=none; b=P4D2PDSgRDa/bWUYiH5WjVa2tg5WSFQGE4mUfoAx2Y8oipD7WYOfA/3gvAiNLyn+uh1NV3KQy+VsNGi+kG5TQ9LKCpUab4i7/22lmmJRijxr9SbH5Ebt6J1Vsqs07HSqDpSPsCrnPMDDW5VKvoAuLR61WiNF3L7Pze2bmBXTFGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783027382; c=relaxed/simple;
	bh=DAInkl4w9PVtBfDdI1nS4bUg4CuTVNpxYHeIVL8Ihec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dRy5UzOjMdSLGkS0aYjtZmNpIW1rO+qoQj8Kp5u5bLj0ovP/nHk9wJ5RU5X5nqtmhyl3FHwaLEgfy/ZTzEHRoVXPkbDXnhNtJUwtn5FVroNLe1TJnnSOB+70izDG3PxuJW7kj3QCey4mJq20AfasPu99uh/r9WDnQt9b4NlM3xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B11F474537;
	Thu,  2 Jul 2026 21:22:53 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 41795779AC;
	Thu,  2 Jul 2026 21:22:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2BbSDK3WRmrXRgAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Thu, 02 Jul 2026 21:22:53 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-kselftest@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Jakub Kicinski <kuba@kernel.org>,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH 2/2] selftests: drv-net: Fix TSO test doc
Date: Thu,  2 Jul 2026 23:22:48 +0200
Message-ID: <20260702212248.358977-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702212248.358977-1-pvorel@suse.cz>
References: <20260702212248.358977-1-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: B11F474537
X-Rspamd-Action: no action

Replace copy paste from csum.py with a real test purpose.

Fixes: 0d0f4174f6c87 ("selftests: drv-net: add a simple TSO test")
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Trivial doc fix - feel free to remove Fixes: tag before merge.

 tools/testing/selftests/drivers/net/hw/tso.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/hw/tso.py b/tools/testing/selftests/drivers/net/hw/tso.py
index 802bb48680465..67f6c9ca9a647 100755
--- a/tools/testing/selftests/drivers/net/hw/tso.py
+++ b/tools/testing/selftests/drivers/net/hw/tso.py
@@ -1,7 +1,7 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 
-"""Run the tools/testing/selftests/net/csum testsuite."""
+"""A simple test for TSO."""
 
 import fcntl
 import socket
-- 
2.53.0

