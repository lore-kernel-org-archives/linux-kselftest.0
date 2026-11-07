Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=63.250.43.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057111;
	b=n4mi+wGsC1NJEz1eqrWRRO4nudEj7MWXDJEkHw3RBmlOiMexFn5J0m2atdTAZCejSFhy
	 TcGNqDCrA7URZns7cAueA8uMWsMPgWAZM0iCZ+rQSbWpStfhRxRpfKRkM5EHhbXxZ/HwR
	 3LZbJ6ve5LtjAvBcVIybITAFAFIo1iQEnkP/reGk0QjReNSYljfdh7wFEXtQf8fUVrbpH
	 pr5tZE03QuDKBBn3eVE5mgvkq2l0kMlVSqiAYPa+KjHKUeR2dKtex4SjwueEMQIRXGhvm
	 ZiTf9/TECoutkxr8iKTHrngop9+owWkvmfDi6vhhfKATuP7eAINndKFgvhpk0KETJPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057111;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=Hpnb3lkVBewOXosHHRQ+q5UlfoQ87orREhfjDwgUyjw=;
	b=3XmmBLFVAqznMD3ojhSM5x5qv2NXRJdx6cOvTmkavyBvEy34uo+Rqmg+VsN8/BOQCru0
	 kpGii8D6gpswZUCrx504FMYOHYolsQQjwWt/CYMrQkhIz3PzZJu4SDdfu+RpO9ln6qt8H
	 OWn4XlCJijKCEpCqsVWgi5ayfwpRIpuLBKyXplllWxt4/9+lvkiljy2KZHzOlqkqzS8So
	 /hMKREixswFeW0K+78vgLNej0k1aypgIQmvAMAG0/hjePYMNlCWEbo87qB7TE7sqE9J4s
	 OoyEZyoOxs/xBag+Jj515LAIJSg9q8FqVexrg6VeIzmNvI6zHnW/GB9lNk8PRaELc0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tychen.cc;
	spf=pass smtp.mailfrom=tychen.cc;
	dkim=pass header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=l8oqGiMj;
	arc=none smtp.remote-ip=63.250.43.97
Received: from out-2uec-a97.jellyfish.systems (out-2uec-a97.jellyfish.systems [63.250.43.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A556606A32C
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 13:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A556606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=l8oqGiMj
Received: from fedora (ec2-52-197-241-54.ap-northeast-1.compute.amazonaws.com [52.197.241.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4jMGdt47G8z8sWP;
	Sat, 07 Nov 2026 13:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1794057094;
	bh=Hpnb3lkVBewOXosHHRQ+q5UlfoQ87orREhfjDwgUyjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l8oqGiMj1f1+oSNv00Cla/P24UtVh+J/scLC9B2R3PBel+KK3bLsefYm6GmTpTXgs
	 O+l5666h90dnTvQelA/96LOAtHCexti3Pk9QGw0tEdmshz+oO3PFE+z56YGkH/exgp
	 WNhlQyvxLh1YD3mqYwExGaYrmyK4HMDGYTvolkpVMu96DHq8DxQ0YOa6qTL2lQnl2t
	 j6iVpex0zMYP2CAdjPtrEwhyak+uSbt6l3ebuqilnKN+yNRoQ6npVpBvO6vD8YHzkO
	 izqXRDSB9pMC0eGHEP0oj/oKrdFG3KvZ2iIzXD1Ol2c0mgIuaS2wiAgpMH4ZTBbcko
	 bbbNc1bbblpuw==
From: Tianyi Chen <hi@tychen.cc>
To: bpf@vger.kernel.org
Cc: Tianyi Chen <hi@tychen.cc>,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	yatsenko@meta.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf 1/2] bpf: Report lost RHASH batch traversal keys as EAGAIN
Date: Sat,  7 Nov 2026 22:11:19 +0900
Message-ID: <4c32437eee7649fbd822108278a3f582bb795329.1794056839.git.hi@tychen.cc>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794056839.git.hi@tychen.cc>
References: <cover.1794056839.git.hi@tychen.cc>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

If a key is deleted after a batch copies it, rhashtable_next_key()
returns ERR_PTR(-ENOENT). The batch code treats the missing next cursor
as end-of-iteration and returns -ENOENT with a partial batch, so callers
can silently stop before reading keys that are still present.

Translate a lost traversal key to -EAGAIN, as for a missing input cursor,
and preserve other iterator errors. Still copy the collected entries and
update the count, including for lookup-and-delete batches.

Fixes: 818e00848227 ("bpf: Implement iteration ops for resizable hashtab")
Link: https://github.com/kernel-patches/bpf/pull/14700#issuecomment-6641291019
Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 kernel/bpf/hashtab.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
index 6e2115477cb9..346a2afb4ad3 100644
--- a/kernel/bpf/hashtab.c
+++ b/kernel/bpf/hashtab.c
@@ -3556,14 +3556,15 @@ static int __rhtab_map_lookup_and_delete_batch(struct bpf_map *map,
 
 	rcu_read_unlock();
 
-	if (total == 0) {
+	if (IS_ERR(elem)) {
+		ret = PTR_ERR(elem);
+		if (ret == -ENOENT)
+			ret = -EAGAIN;
+	} else if (!has_next_cursor) {
 		ret = -ENOENT;
-		goto free;
 	}
-
-	/* No more elements after this batch. */
-	if (!has_next_cursor)
-		ret = -ENOENT;
+	if (!total)
+		goto free;
 
 	if (copy_to_user(ukeys, keys, (size_t)total * key_size) ||
 	    copy_to_user(uvalues, values, (size_t)total * value_size) ||
-- 
2.56.0

