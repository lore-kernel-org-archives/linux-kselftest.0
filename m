Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DF53B95FA
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 21:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784584328; cv=none; b=EMGq7pAKDsbLdGhT7wOmSCXyPj2zwaFKeP3i0R8H45XdHoc9rK1rpeUyBxqEgjAAJ2aCnxjKDl9RywhU9D1BnWHxEYjHsU6cfne9XaA3YcBuHZyYS8QAtXqFeOgqIvCyju/Vh9gKZkMQBijrRR0RtpveVLTye5xraGoVE9CHOSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784584328; c=relaxed/simple;
	bh=xtHwjtUBCf2SzMzjo/RBpjgiTktn/7a4BJDjqM8gY3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tft8hPVH60LP18Yw1CpHt+N92HPuRLLBdxKvj7XohhYmpaoI/RRSdH9bZBf7XUsRN6wNgaNRhL2B2veJQUdzBLIGHr/f8Vtnqq5i9NvAO1+XOpSejXe5A4XgibjWU8G66CGXu8Or0B9rXBzMIxEOfwiZZEfVlDRSsibXqwgAL1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=uB+uXLKP; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=2Ilv+a4s; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=uB+uXLKP; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=2Ilv+a4s; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="uB+uXLKP";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="2Ilv+a4s";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="uB+uXLKP";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="2Ilv+a4s"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 082EB7A200;
	Mon, 20 Jul 2026 21:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1784584324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aBA4L+FuzKZP2SabGlEFWVvTeQNZRvkXuT1xkzN0Md4=;
	b=uB+uXLKPCoWmDr2p9sUZy/QLB56H/yhrJLvi36F91yMhErO0n7DFhdHLWzQce7QaiR1zWZ
	4NszU7dNFzx+pbeHMtEHV11ME1Uu5BgD/nX0m9UhdhLh7gmGhg3Z8TII2yZo616RGnC6rU
	zAacDgBiJ2dnqn6JpBdtFiEZkuoitmw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1784584324;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aBA4L+FuzKZP2SabGlEFWVvTeQNZRvkXuT1xkzN0Md4=;
	b=2Ilv+a4sa7/SPk5bIdrbF/bu/g8gFJi3PW9X7iUJ3ZoPoTgsGHNDxdPjaIEfQ28AYDXIN0
	X08PqRsnhgVDj2CQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1784584324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aBA4L+FuzKZP2SabGlEFWVvTeQNZRvkXuT1xkzN0Md4=;
	b=uB+uXLKPCoWmDr2p9sUZy/QLB56H/yhrJLvi36F91yMhErO0n7DFhdHLWzQce7QaiR1zWZ
	4NszU7dNFzx+pbeHMtEHV11ME1Uu5BgD/nX0m9UhdhLh7gmGhg3Z8TII2yZo616RGnC6rU
	zAacDgBiJ2dnqn6JpBdtFiEZkuoitmw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1784584324;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aBA4L+FuzKZP2SabGlEFWVvTeQNZRvkXuT1xkzN0Md4=;
	b=2Ilv+a4sa7/SPk5bIdrbF/bu/g8gFJi3PW9X7iUJ3ZoPoTgsGHNDxdPjaIEfQ28AYDXIN0
	X08PqRsnhgVDj2CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 924E5779AB;
	Mon, 20 Jul 2026 21:52:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0GiSIIOYXmpJewAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Mon, 20 Jul 2026 21:52:03 +0000
From: Petr Vorel <pvorel@suse.cz>
To: netdev@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Jakub Kicinski <kuba@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 2/2] selftests: drv-net: Fix TSO test doc
Date: Mon, 20 Jul 2026 23:51:49 +0200
Message-ID: <20260720215149.631145-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720215149.631145-1-pvorel@suse.cz>
References: <20260720215149.631145-1-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

Replace copy paste from csum.py with a real test purpose.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v1->v2 (both asked by Jakub):
* Sent to netdev
* Remove Fixes tag

Link to v1:
https://lore.kernel.org/linux-kselftest/20260702212248.358977-2-pvorel@suse.cz/

 tools/testing/selftests/drivers/net/hw/tso.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/hw/tso.py b/tools/testing/selftests/drivers/net/hw/tso.py
index 802bb4868046..67f6c9ca9a64 100755
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
2.55.0

