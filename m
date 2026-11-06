Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793983647;
	b=FGcgDJEIvtxTywOtX5wDJQqojT+RrDJhu3SWPm60CUfZggVEozcgdXAczR5MwStAV9lw
	 TZM4JVJpJtggq3uMhMeGrCzBG96o5iPkNXezGn6r/oHCIIJ6PW1YD8NREyEqoPaoactEu
	 iGVQ7LgYxs9xiFOnILSUbad7g6qkvCg7xyvIaoosHdXLZzrDaSrRtEmW3xocgmq+c7Ndv
	 oW1FJMq+/VZmvD7BqpMcCXTdSQvOWtunfOUM8aEU2TsYBOETcf8cbeI5SvoTbTY7/jovZ
	 x9yKuodsbij82/MFOTO0znQHNDbyQbQ/Nnw9DhLhNtsOqAcFmh/tiiv2+hWE7ftrq0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983647;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=wPWOls+GsP/LZWvFejuggf19NK8Hy8dSKnoByaWSWbU=;
	b=USGPV8H5rEuFKKAVP/FO4eTpabR0a5kZb+jJr/qZinJGihiM3F6Vhq/Yg1FebJQjl8rN
	 YKW9as7m/XcYm14P2NXyjOWQ2GfO/fFRIoieSon1KaiCZJuPjIcNC3EadO7DxOrolzZ+C
	 bBdQK/A5KdV9DAtwK7gb405DXkUgybd+rLusvzs7ApAQoXcq0CiQc8T7+F366PEpvjkzC
	 SjCTl2ytv/z2w0v0y9E6wBpy44Uk2XjCS6jwDNRMygnrWUiPC8Z1CUWmDUJBN/y7ybLvx
	 U/yb+cRLe94UL3dVPxE8P0P8kAQlBtkrZ7K6RmhLGvT4tcvv6dDrjQnNIt4nXMVhUbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="PxkzuLI/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3G8zjDyi;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="PxkzuLI/";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3G8zjDyi;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2B7606A326;
	Fri,  6 Nov 2026 16:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD2B7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PxkzuLI/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3G8zjDyi;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PxkzuLI/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3G8zjDyi
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B9E9F21FFC;
	Fri,  6 Nov 2026 16:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793983643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wPWOls+GsP/LZWvFejuggf19NK8Hy8dSKnoByaWSWbU=;
	b=PxkzuLI/am9JnYTnTvuEijgDPYfeVBgSqbGO9O+MfngsRdJbzeo4biD6Plw7uupL+RkSYr
	Hq4PezkwWHm8Dpu0ed6ywBjWd/rVb1h/Z2eDZ7IDZYVHxWLl2xSQ1CmK98wTvhGLERcOqE
	zzN8n9ag1q/au621BObs+lVpZDXaLyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793983643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wPWOls+GsP/LZWvFejuggf19NK8Hy8dSKnoByaWSWbU=;
	b=3G8zjDyiDhO0L5LiKBTyzfNc2Apd4rvaT59qMkS2k2mY0+P4MMnyI2VnRcnFe70HH1YDf6
	Fs1bW31Ux15qoeBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="PxkzuLI/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3G8zjDyi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793983643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wPWOls+GsP/LZWvFejuggf19NK8Hy8dSKnoByaWSWbU=;
	b=PxkzuLI/am9JnYTnTvuEijgDPYfeVBgSqbGO9O+MfngsRdJbzeo4biD6Plw7uupL+RkSYr
	Hq4PezkwWHm8Dpu0ed6ywBjWd/rVb1h/Z2eDZ7IDZYVHxWLl2xSQ1CmK98wTvhGLERcOqE
	zzN8n9ag1q/au621BObs+lVpZDXaLyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793983643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wPWOls+GsP/LZWvFejuggf19NK8Hy8dSKnoByaWSWbU=;
	b=3G8zjDyiDhO0L5LiKBTyzfNc2Apd4rvaT59qMkS2k2mY0+P4MMnyI2VnRcnFe70HH1YDf6
	Fs1bW31Ux15qoeBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA6F3132C9;
	Fri,  6 Nov 2026 16:47:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uO5eHpoE7mo4BAAAD6G6ig
	(envelope-from <clopez@suse.de>); Fri, 06 Nov 2026 16:47:22 +0000
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com,
	=?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Subject: [PATCH] selftests/mm: pkeys: wait for the child in become_child()
Date: Fri,  6 Nov 2026 17:46:39 +0100
Message-ID: <20261106164639.2959195-1-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: B9E9F21FFC

become_child() forks during test_pkey_alloc_exhaust() and has the parent
exit, so that the remaining tests run in the child. However, the test
runner only waits for the original process, so it sees the test finish
early with a success status while the remaining tests keep running in
the background. Failures after the first fork are thus not reported in
the exit status, and the remaining tests overlap with the next selftest.

Fix this by waiting for the child in the parent and exiting with its
status. A previous fix avoided waiting, arguing that the parents would
keep holding their resources [1]. Particularly, the parent keeps the
hugetlb reservation of its test memory, so the child runs out of hugetlb
pages after a few iterations. Avoid this by freeing the test memory
before waiting.

Link: https://lore.kernel.org/all/20240419115027.3848958-1-usama.anjum@collabora.com [1]
Fixes: e1812933b17b ("x86/selftests/pkeys: Fork() to check for state being preserved")
Signed-off-by: Carlos López <clopez@suse.de>
---
 tools/testing/selftests/mm/protection_keys.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
index b7882ab97683..5dece144ab95 100644
--- a/tools/testing/selftests/mm/protection_keys.c
+++ b/tools/testing/selftests/mm/protection_keys.c
@@ -1009,9 +1009,10 @@ static void test_pkey_syscalls_bad_args(int *ptr, u16 pkey)
 	pkey_assert(err);
 }
 
-static void become_child(void)
+static void become_child(int *ptr)
 {
 	pid_t forkret;
+	int status;
 
 	forkret = fork();
 	pkey_assert(forkret >= 0);
@@ -1021,7 +1022,16 @@ static void become_child(void)
 		/* in the child */
 		return;
 	}
-	_exit(0);
+
+	/*
+	 * Wait for the child to finish the tests and pass on its result.
+	 * Free the test memory first, as it may reserve pages from the
+	 * small hugetlb pool that the child needs.
+	 */
+	free_pkey_malloc(ptr);
+	if (waitpid(forkret, &status, 0) != forkret || !WIFEXITED(status))
+		_exit(KSFT_FAIL);
+	_exit(WEXITSTATUS(status));
 }
 
 /* Assumes that all pkeys other than 'pkey' are unallocated */
@@ -1060,7 +1070,7 @@ static void test_pkey_alloc_exhaust(int *ptr, u16 pkey)
 		 * preserved across fork().
 		 */
 		if (i == NR_PKEYS*2)
-			become_child();
+			become_child(ptr);
 	}
 
 	dprintf3("%s()::%d\n", __func__, __LINE__);

base-commit: 843c58022865a7b0f9743416c2b48bc2632da23c
-- 
2.51.0

