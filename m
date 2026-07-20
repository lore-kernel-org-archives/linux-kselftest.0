Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8667C3D411B
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 21:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784584328; cv=none; b=BaQ23jZbA5CmvwELUOV5O2dVWdLXgCbsvXEH3gQfi56K6bSEUCq+NVuB2F1/wUss+LPwdg0tudPV/WJtnmOrj8tg5CbIB2AxQoPwEqYY7mq3jwvpUMyPsE30B1MhvjcwRKsH8F+AZHCbWii9W7HsGFno8HiM+J4aT6/wZMLU7Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784584328; c=relaxed/simple;
	bh=+XUKKqJWK2Ht2sPwcjD8swLKukA4/t2PPxAUFqudnGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G0owNuOQdLggK2n0UCztgTfbruto8eL6FRgOj/v3IlgwGYkcQfjpRSxLACTV2aPKGyPUe6fARMAsvDGXL4JNN/eEiasnonwHArVKU3KhquFoxYsAhPzZR03uERtX29KNetNviQhqg8G5QWeHlYAurd0zanhyVCJjM0hvgquUu6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=cRBCQ1+2; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=5cqE/ioW; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=SkoXP3qA; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=qKyUpzW7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="cRBCQ1+2";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="5cqE/ioW";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="SkoXP3qA";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="qKyUpzW7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7F5E03E93;
	Mon, 20 Jul 2026 21:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1784584324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iv4FeW/gTiIemCSXopumjCnScVNElpvB2EzzpeUThLw=;
	b=cRBCQ1+2nLFo4zfAEWOc7By3JxsWPS8UYqS6Lz4/Rrg8tuqYFXjevyBQw/LADIjq2Y2UYA
	j7QPYzaiNJ6yGtdMbjvSaIk7NIbrrMyJUcbL8GcQv1C5TtV/h7Ae28r6wjggdeE13P+EUX
	3wFglpX18G0rq+F03RUsljgGpdxqRmg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1784584324;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iv4FeW/gTiIemCSXopumjCnScVNElpvB2EzzpeUThLw=;
	b=5cqE/ioWr3OR+GmdaE1XGAqigUrRgtAAvKRzPOlL06XT/cedhJfRUuRtyDG0ErQskv6sI2
	KGyJwgqOSNstBoCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=SkoXP3qA;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=qKyUpzW7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1784584323; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iv4FeW/gTiIemCSXopumjCnScVNElpvB2EzzpeUThLw=;
	b=SkoXP3qAemTm6tKMQVC8xEUnu0+5HemyHVAF6wOPVhYNsSBsgAPvj6lC5f1CVhnqjpB8OB
	cuMOYpR2BsEmRqoLfSsf7tmuuwd6QGp/9OaJ9g8apkUcDL7of3tg4rnBVhX0RA2lylmPfm
	BNkEWRhPQGiAq8clpNBNxQyk02LbjX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1784584323;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iv4FeW/gTiIemCSXopumjCnScVNElpvB2EzzpeUThLw=;
	b=qKyUpzW7W+7Dol8gCTup06ThtdBeWdf1rVLnPRGYOcEyMWCnXKVRv1sPes5t8suZuOVUU6
	k46CHiHlJOcCgdAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 02EAA779AA;
	Mon, 20 Jul 2026 21:52:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3QS+N4KYXmpJewAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Mon, 20 Jul 2026 21:52:02 +0000
From: Petr Vorel <pvorel@suse.cz>
To: netdev@vger.kernel.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	linux-kselftest@vger.kernel.org,
	Petr Vorel <pvorel@suse.cz>
Subject: [PATCH v2 1/2] selftests: drv-net: Fix csum path in doc
Date: Mon, 20 Jul 2026 23:51:48 +0200
Message-ID: <20260720215149.631145-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,vger.kernel.org,suse.cz];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7F5E03E93
X-Spam-Score: -1.51

From: Petr Vorel <petr.vorel@gmail.com>

C source was moved in 1d0dc857b5d87.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v1->v2 (both asked by Jakub):
* Sent to netdev
* Remove Fixes tag

Link to v1:
https://lore.kernel.org/linux-kselftest/20260702212248.358977-1-pvorel@suse.cz/

 tools/testing/selftests/drivers/net/hw/csum.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/hw/csum.py b/tools/testing/selftests/drivers/net/hw/csum.py
index 3e3a89a34afe..0e99198f8d39 100755
--- a/tools/testing/selftests/drivers/net/hw/csum.py
+++ b/tools/testing/selftests/drivers/net/hw/csum.py
@@ -1,7 +1,7 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 
-"""Run the tools/testing/selftests/net/csum testsuite."""
+"""Run the tools/testing/selftests/net/lib/csum testsuite."""
 
 from os import path
 
-- 
2.55.0

