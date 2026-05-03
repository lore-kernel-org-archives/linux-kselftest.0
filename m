Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDE8370D6D
	for <linux-kselftest@vger.kernel.org>; Sun,  3 May 2026 22:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777846373; cv=none; b=dmSYgWWrzlbXilLdfmFUSbXwiuNVcKVIGqIvSSlN1UuHPYn1M+Xl68ebTWymJ3Eg9YT+K47QcSgb3WzI+4N+F6TmP/zkeshHM8MND4lYPTvOiiRy2U6LK/dbSLlIebu1eW5xdQpTbUEhZhiOtksWTW3X45XPZdzHb6m4torbofI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777846373; c=relaxed/simple;
	bh=amjNKDiByO8OXYXjgCXvacfURD9eqUFBCrcfV8+f06g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eFBtQTPOc8EIJneNpZ0sdEJoLJo80JgsichSYmReUiTe9eDiSfr3s2L5iw94g9EwFucvwQRlinIrVFWCOo0DfOcD91L4Gs2g9HHH1w1VtotivFCHL52eO8Hp67+NefyMT9d8SuVuaTY9ClNzLzdPejplk9MKMqhCnuaVzCnS/oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R2R0tcP7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Wc+UCacn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R2R0tcP7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Wc+UCacn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R2R0tcP7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wc+UCacn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R2R0tcP7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wc+UCacn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A1D4D6AF5C;
	Sun,  3 May 2026 22:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777846368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fQutdRSJ/DzsQ0IV3KpvTBpuYwE1y3MNPWni6jO1YNk=;
	b=R2R0tcP7W6ubydvm2Dp/LNYFTEgZbU+0w4vxP3ojWOhbD0w0pP4lQydq3YiLo1TTrIKwI/
	D/QvDZllNreoS3CqnjbLgZ9LRnixcu806/WuXnOluCoVidB8o4NtypQyzJXP1ZPNHAm8pk
	nvaIFHkEBPxpMs7KrdspKTSu616CIoA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777846368;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fQutdRSJ/DzsQ0IV3KpvTBpuYwE1y3MNPWni6jO1YNk=;
	b=Wc+UCacn4ADSYn3hoMv7ITQRP5E7tIQ1oMptdBErq/liePbvw22BJQN6I/eU450NExrI3i
	Vt+i4yPo2lGjDJCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=R2R0tcP7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Wc+UCacn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777846368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fQutdRSJ/DzsQ0IV3KpvTBpuYwE1y3MNPWni6jO1YNk=;
	b=R2R0tcP7W6ubydvm2Dp/LNYFTEgZbU+0w4vxP3ojWOhbD0w0pP4lQydq3YiLo1TTrIKwI/
	D/QvDZllNreoS3CqnjbLgZ9LRnixcu806/WuXnOluCoVidB8o4NtypQyzJXP1ZPNHAm8pk
	nvaIFHkEBPxpMs7KrdspKTSu616CIoA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777846368;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fQutdRSJ/DzsQ0IV3KpvTBpuYwE1y3MNPWni6jO1YNk=;
	b=Wc+UCacn4ADSYn3hoMv7ITQRP5E7tIQ1oMptdBErq/liePbvw22BJQN6I/eU450NExrI3i
	Vt+i4yPo2lGjDJCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F368D593A3;
	Sun,  3 May 2026 22:12:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id W5EXOF/I92kabwAAD6G6ig
	(envelope-from <fmancera@suse.de>); Sun, 03 May 2026 22:12:47 +0000
From: Fernando Fernandez Mancera <fmancera@suse.de>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	horms@kernel.org,
	pabeni@redhat.com,
	kuba@kernel.org,
	edumazet@google.com,
	davem@davemloft.net,
	idosch@nvidia.com,
	dsahern@kernel.org,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	=?UTF-8?q?=C5=81ukasz=20Stelmach?= <steelman@post.pl>
Subject: [PATCH 1/2 net] ipv6: addrconf: fix temp address generation after prefix deprecation
Date: Mon,  4 May 2026 00:11:40 +0200
Message-ID: <20260503221139.3742-3-fmancera@suse.de>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: A1D4D6AF5C
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

When a router temporarily deprecates an IPv6 prefix (either by sending a
Router Advertisement with Preferred Lifetime = 0 or by letting the
lifetime expire) and later restores it, the kernel permanently loses its
ability to generate temporary privacy addresses (RFC 8981) for that
prefix.

This happens because the address worker attempts to generate a
replacement temporary address when the current one nears expiration. As
the base prefix is deprecated already, the generation fails, burning the
retry counter for temporary address generation of that prefix.

When the router eventually restores the prefix, the temporary address
becomes active again. However, once it naturally expires, the kernel
sees the exhausted retry limit and permanently stops generating new
privacy addresses.

Fix this by verifying that the base prefix has sufficient preferred
lifetime remaining before attempting to generate a new temporary
address. This prevents the worker from burning through its retry counter
during temporary network deprecation events like a router reboot.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: Łukasz Stelmach <steelman@post.pl>
Closes: https://lore.kernel.org/netdev/87340td30q.fsf%25steelman@post.pl/
Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>
---
 net/ipv6/addrconf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 5476b6536eb7..f6a3d9da3cb1 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -4654,9 +4654,11 @@ static void addrconf_verify_rtnl(struct net *net)
 			    !ifp->regen_count && ifp->ifpub) {
 				/* This is a non-regenerated temporary addr. */
 
+				unsigned long pub_age = (now - READ_ONCE(ifp->ifpub->tstamp)) / HZ;
 				unsigned long regen_advance = ipv6_get_regen_advance(ifp->idev);
 
-				if (age + regen_advance >= ifp->prefered_lft) {
+				if (age + regen_advance >= ifp->prefered_lft &&
+				    pub_age + regen_advance < READ_ONCE(ifp->ifpub->prefered_lft)) {
 					struct inet6_ifaddr *ifpub = ifp->ifpub;
 					if (time_before(ifp->tstamp + ifp->prefered_lft * HZ, next))
 						next = ifp->tstamp + ifp->prefered_lft * HZ;
-- 
2.53.0

