Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C281A3D3CEB
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 19:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769024708; cv=none; b=KH3haMvne9f1aHDcVjdF9K4G1ewlG7qtw9fC6D2c+AsBmn0EVlYWEDmYhfVje1OYC8IAOXz8oTqnRdrwiULAfEG0fKwJLF0/VlLH4h5680Gw4wPrUKuC3CxYUkWpCIBO3lAKBprBqJeAeIqTrwMquxiTFDj3aXwzz7E4N8GN/2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769024708; c=relaxed/simple;
	bh=gxpY8uP40p/YyKkhlCX8hPEuAcbvp7DOnnr5ZdbMxFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tJAIVOoXyzQT+Lc5Fb59SUFjlMqhVHXgKZoN2VvFtRw9qyJwTutkxtaZoMt34AmdG0oWGaKr0dfn5SmJzdjqnnsaxuGj6+5a4Q7fNz5zYQxkiPlKinkQPza5fzG/459SdR9WnEAxNWUuozkQ8AvaP1TngexvVatL3/YuAUsxNus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HDGcRrzc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hibXffPf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HDGcRrzc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hibXffPf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HDGcRrzc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hibXffPf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HDGcRrzc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hibXffPf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7FF725BD52;
	Wed, 21 Jan 2026 19:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769024702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TXJ03vNvRbDQgJokB67VHtfUCQYwr8p62iGM7d1KfbQ=;
	b=HDGcRrzc1P/av3lt3ytnR8EiZSHmIMxIZTLT6mQFAqp0ZbCMrY90+O+C9okpOc9aDr6vbO
	PJNE9YLNzDCJUMaBiosOfL9aMw4EMhCD9X9eE3uj9dKuBnOmOB5KnRRsdEqAxGAFnqFFRq
	eG7dDpsin9AfNVFxYc2dxtiE8FQfC64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769024702;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TXJ03vNvRbDQgJokB67VHtfUCQYwr8p62iGM7d1KfbQ=;
	b=hibXffPfpCVO/YZndHSNm5nfdG9WmcUjWuThNA8oKKxHjHuVgcmaEbA7y6ceGLSWIzpAUY
	iE6l+UmeD5qEwCAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HDGcRrzc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hibXffPf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769024702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TXJ03vNvRbDQgJokB67VHtfUCQYwr8p62iGM7d1KfbQ=;
	b=HDGcRrzc1P/av3lt3ytnR8EiZSHmIMxIZTLT6mQFAqp0ZbCMrY90+O+C9okpOc9aDr6vbO
	PJNE9YLNzDCJUMaBiosOfL9aMw4EMhCD9X9eE3uj9dKuBnOmOB5KnRRsdEqAxGAFnqFFRq
	eG7dDpsin9AfNVFxYc2dxtiE8FQfC64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769024702;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TXJ03vNvRbDQgJokB67VHtfUCQYwr8p62iGM7d1KfbQ=;
	b=hibXffPfpCVO/YZndHSNm5nfdG9WmcUjWuThNA8oKKxHjHuVgcmaEbA7y6ceGLSWIzpAUY
	iE6l+UmeD5qEwCAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB60A3EA63;
	Wed, 21 Jan 2026 19:45:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KIqiMr0scWnOHwAAD6G6ig
	(envelope-from <fmancera@suse.de>); Wed, 21 Jan 2026 19:45:01 +0000
From: Fernando Fernandez Mancera <fmancera@suse.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	haleyb.dev@gmail.com,
	Fernando Fernandez Mancera <fmancera@suse.de>
Subject: [PATCH 2/2 net-next v3] selftests: net: add ipv6 ping to local address from localhost
Date: Wed, 21 Jan 2026 20:44:09 +0100
Message-ID: <20260121194409.6749-2-fmancera@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260121194409.6749-1-fmancera@suse.de>
References: <20260121194409.6749-1-fmancera@suse.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,kernel.org,redhat.com,vger.kernel.org,gmail.com,suse.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -1.51
X-Rspamd-Queue-Id: 7FF725BD52
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

Test ipv6 pinging to local configured address and linklocal address from
localhost with -I ::1.

Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>
---
v2: shellcheck fixes, added VRF based tests and simplified linklocal
address parsing
v3: extend existing test in fcnal-test.sh instead of creating a new one,
notice some shellcheck warnings but I prefer to follow the style of the
existing code. It can be fixed if it is a requirement.
---
 tools/testing/selftests/net/fcnal-test.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/net/fcnal-test.sh b/tools/testing/selftests/net/fcnal-test.sh
index 844a580ae74e..890c3f8e51bb 100755
--- a/tools/testing/selftests/net/fcnal-test.sh
+++ b/tools/testing/selftests/net/fcnal-test.sh
@@ -2327,6 +2327,13 @@ ipv6_ping_novrf()
 		log_test_addr ${a} $? 2 "ping local, device bind"
 	done
 
+	for a in ${NSA_LO_IP6} ${NSA_LINKIP6}%${NSA_DEV} ${NSA_IP6}
+	do
+		log_start
+		run_cmd ${ping6} -c1 -w1 -I ::1 ${a}
+		log_test_addr ${a} $? 0 "ping local, from localhost"
+	done
+
 	#
 	# ip rule blocks address
 	#
-- 
2.52.0

