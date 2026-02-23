Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC67366548
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 15:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771859400; cv=none; b=WVWcKkA9o7P8hbIwtPz1F362QxG1LRm4dG7V7k0iRwRVrublR0XL5e0UJtDth3tiY/laNpHhjisBGkVToJcpnIk2dGnPGgFzUcslli+5ERRbFkQUkT3rM/0cSe991kP1/BwUZvtBtS51mAK9SaIv9d0SRdSUu4m6/ovz83luL3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771859400; c=relaxed/simple;
	bh=kiLW3oO45MtI5F1zY0Fb4LUn/46tAgkIa8tZOFWq52c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rreBvC99WPn00EYzAfY/ceNAKrST/NYBkysfjdbCnXPh/30mwlEO5UDsVg8swj9gmo3Vr0gPxmLclQRsEip2iIf81RvbRBCvDrYGFCOREHagE4n2ykeWuA8w8+223v3HJyv6ww3GnVw/jRoLs2yNtBBuyFqAwkCegG/hWkO1zqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LBX/hzJq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QZfrgC0O; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LBX/hzJq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QZfrgC0O; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LBX/hzJq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QZfrgC0O";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LBX/hzJq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QZfrgC0O"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2058F5BD92;
	Mon, 23 Feb 2026 15:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771859397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=u0qEcCAl2t4On+48oQcJ99yv/5KLDR8ZXvKbMpP4oZY=;
	b=LBX/hzJq+cLC/wEhwIItlHW/8pooDHKPdBHE2yCT7xEbxeOwNy0dfWyufn/mowKgwWFuP6
	wf48/5Sj3Qy6J+R9HovWc385O6BegI8+2aji6cALV8qRxjssJ2KNHGc2V01Rpwo0Zm1GQZ
	UydBNhdICwPZgKg9qg3v7pKOSt91Ruo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771859397;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=u0qEcCAl2t4On+48oQcJ99yv/5KLDR8ZXvKbMpP4oZY=;
	b=QZfrgC0Ow0lS/UdzaJGmeHfdbGgoMQIw3gcuQIKVx8AbQuiQfrmY9XEg314h+bkxmNmhnx
	hvI8e033LRaqdYCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="LBX/hzJq";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QZfrgC0O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771859397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=u0qEcCAl2t4On+48oQcJ99yv/5KLDR8ZXvKbMpP4oZY=;
	b=LBX/hzJq+cLC/wEhwIItlHW/8pooDHKPdBHE2yCT7xEbxeOwNy0dfWyufn/mowKgwWFuP6
	wf48/5Sj3Qy6J+R9HovWc385O6BegI8+2aji6cALV8qRxjssJ2KNHGc2V01Rpwo0Zm1GQZ
	UydBNhdICwPZgKg9qg3v7pKOSt91Ruo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771859397;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=u0qEcCAl2t4On+48oQcJ99yv/5KLDR8ZXvKbMpP4oZY=;
	b=QZfrgC0Ow0lS/UdzaJGmeHfdbGgoMQIw3gcuQIKVx8AbQuiQfrmY9XEg314h+bkxmNmhnx
	hvI8e033LRaqdYCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7909B3EA68;
	Mon, 23 Feb 2026 15:09:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2d1oGsRtnGmtHgAAD6G6ig
	(envelope-from <fmancera@suse.de>); Mon, 23 Feb 2026 15:09:56 +0000
From: Fernando Fernandez Mancera <fmancera@suse.de>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	Fernando Fernandez Mancera <fmancera@suse.de>
Subject: [PATCH net-next] selftests: net: add ipv6 RA route to ECMP merge test
Date: Mon, 23 Feb 2026 16:09:50 +0100
Message-ID: <20260223150950.31904-1-fmancera@suse.de>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2058F5BD92

As commit bbf4a17ad9ff ("ipv6: Fix ECMP sibling count mismatch when
clearing RTF_ADDRCONF") pointed out, RA routes are not elegible for ECMP
merging.

Add a test scenario mixing RA and static routes with gateway to check
that they are not getting merged.

Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>
---
 tools/testing/selftests/net/fib_tests.sh | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
index c5694cc4ddd2..1262ee1ea09b 100755
--- a/tools/testing/selftests/net/fib_tests.sh
+++ b/tools/testing/selftests/net/fib_tests.sh
@@ -1534,6 +1534,23 @@ fib6_ra_to_static()
 
 	log_test $ret 0 "ipv6 promote RA route to static"
 
+	# Prepare for RA route with gateway
+	$NS_EXEC sysctl -wq net.ipv6.conf.veth1.accept_ra_rt_info_max_plen=64
+
+	# Add initial route to cause ECMP merging
+	$IP -6 route add 2001:12::/64 via fe80::dead:beef dev veth1
+
+	$NS_EXEC ra6 -i veth2 -d 2001:10::1 -R 2001:12::/64#1#120
+
+	# Routes are not merged as RA routes are not elegible for ECMP
+	check_rt_num 2 "$($IP -6 route list | grep -c "2001:12::/64 via")"
+
+	$IP -6 route append 2001:12::/64 via fe80::dead:feeb dev veth1
+
+	check_rt_num 2 "$($IP -6 route list | grep -c "nexthop via")"
+
+	log_test "$ret" 0 "ipv6 RA route with nexthop do not merge into ECMP with static"
+
 	set +e
 
 	cleanup &> /dev/null
-- 
2.53.0

