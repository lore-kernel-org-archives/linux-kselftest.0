Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D17348465
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Jul 2026 21:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783027376; cv=none; b=T4mDflTPZzm+1fr9z2ZRG1OBiuxYRD/kZtFt+/GJW/F0kthIE7ahcKzusqQGPXVR4VzyQP18uAS5WYeztfpKfC1ULNBzZdW+F65DcyU6UabzVibHrxntKXx7Wqb78+LN4oiu0AZ9mhS9WOLVJy1313FALq3rloUF5+Hq7ghFYX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783027376; c=relaxed/simple;
	bh=7H1nTinw1K7/7Am6XrHzhPmzBZ287whjoYk7ahwguV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c7W3XenKe7Aa6pvNAkOtMCpzztuIcNv5/ejCLXV8blcD3PI6dxI9EfUTD/lByLsVz4mD3I5HDBZyXlVm4NjtDymcQW7o2qHyWTvvxmOkq6QGKVOgmogeg5F5zLgtHTTxqC/BpeOyxBSdNFcoXVwWYG35br9Pk/qI6NwTlEPiZec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=2cSE1iwn; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=6OJ3OsRt; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=2cSE1iwn; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=6OJ3OsRt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="2cSE1iwn";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="6OJ3OsRt";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="2cSE1iwn";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="6OJ3OsRt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 31E9274535;
	Thu,  2 Jul 2026 21:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1783027373; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PRGsiUW0kyopn5mfXySfXVBvy44V6siSjT6NkdM/9PA=;
	b=2cSE1iwnUQ4xQDXUkaQ2UY52kWD/A4fzbk/wmMwnojqFKGum47I40NzPlsS//H4FqO8Jvf
	UuFqz7WLAKcaW4gVX8IgN9fpp8SzJEwO+nYG4d/x4KWyjTI3iUwcvSwMuhOf3N2qb2kXXW
	yuXEH1nqCuzZr8Irbyd4gDSfniCoHxs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1783027373;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PRGsiUW0kyopn5mfXySfXVBvy44V6siSjT6NkdM/9PA=;
	b=6OJ3OsRtr9xxO3LOfywP2w1XvCj+AaLSQX+sTFNsOTMu6Hc6nE+qQc4IaHLRgXZZulKB8C
	7Wc9loSu5wTsiQCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1783027373; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PRGsiUW0kyopn5mfXySfXVBvy44V6siSjT6NkdM/9PA=;
	b=2cSE1iwnUQ4xQDXUkaQ2UY52kWD/A4fzbk/wmMwnojqFKGum47I40NzPlsS//H4FqO8Jvf
	UuFqz7WLAKcaW4gVX8IgN9fpp8SzJEwO+nYG4d/x4KWyjTI3iUwcvSwMuhOf3N2qb2kXXW
	yuXEH1nqCuzZr8Irbyd4gDSfniCoHxs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1783027373;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PRGsiUW0kyopn5mfXySfXVBvy44V6siSjT6NkdM/9PA=;
	b=6OJ3OsRtr9xxO3LOfywP2w1XvCj+AaLSQX+sTFNsOTMu6Hc6nE+qQc4IaHLRgXZZulKB8C
	7Wc9loSu5wTsiQCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B7D10779AA;
	Thu,  2 Jul 2026 21:22:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9QoOJqzWRmrXRgAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Thu, 02 Jul 2026 21:22:52 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-kselftest@vger.kernel.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Petr Vorel <pvorel@suse.cz>
Subject: [PATCH 1/2] selftests: drv-net: Fix csum path in doc
Date: Thu,  2 Jul 2026 23:22:47 +0200
Message-ID: <20260702212248.358977-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,suse.cz];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Score: -1.30

From: Petr Vorel <petr.vorel@gmail.com>

C source was moved in 1d0dc857b5d87.

Fixes: 1d0dc857b5d87 ("selftests: drv-net: add checksum tests")
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Trivial doc fix - feel free to remove Fixes: tag before merge.

 tools/testing/selftests/drivers/net/hw/csum.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/hw/csum.py b/tools/testing/selftests/drivers/net/hw/csum.py
index 3e3a89a34afe7..0e99198f8d399 100755
--- a/tools/testing/selftests/drivers/net/hw/csum.py
+++ b/tools/testing/selftests/drivers/net/hw/csum.py
@@ -1,7 +1,7 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 
-"""Run the tools/testing/selftests/net/csum testsuite."""
+"""Run the tools/testing/selftests/net/lib/csum testsuite."""
 
 from os import path
 
-- 
2.53.0

