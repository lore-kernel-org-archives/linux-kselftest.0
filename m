Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779822;
	b=FZOEArAQVit1SyZEsyhybYKFFBRpjqP5zoC1DWDi/T0ViBTztsVvKK3lhRD2mzeZw+K0
	 06jA35sb0OIS/savy3V8mJD5zn1oJQrFb/Y/vtQ5yGw2HIxbj+kEHq0jLSfRsg6BOMYTE
	 66gk8ndXUaibn0gt/zikGu1DRBRyLKyTzH7jX41/mv3MhbagnNy29n31WrAUEX3Sq9kv6
	 m89PfoJsz/wvLz0bu/koSmlEG+1WdzjyYdjJ5W8/zsM+D+QXVI4pTNOB6QDWJ0AnQCC0j
	 75uMHOk/czXMZeDqRN34v/VJ5sVYonXsGGkJPVQ8F+tSqPfm1mSvIJlnSnPtPYoxnpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779822;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qv63BJZJpTuqn9oT/kkgXxBPtvhk9LgkyaQuITas9nE=;
	b=bhLYTlL3d6Hm3kivI5f1KfOm0iW+cj8FuF8oa/L27Z7RV+lByO3bIf6l1YNwgeHE+nbN
	 KUrJxSYOptbJ/IBBrXQZvO55WoEirKpXOfLFZPlKRIClunHYZZrbkvfj5H2ByxL2slOq0
	 QWdhjMOxX+VDq2QW3b0EU+5EFBeYt9Z3/m68jp6t7F75GgxZbnC9bLaSuTR/ugdRLtMGK
	 BXwcxouyDc2rXTEL2HG3zaYlv72FvWLxSpaAzpa3L6FUsUTC7bCOmC5u/dDFl5oZPfJbd
	 TVamLHD3j3an4Y4XTbga6B81CpVeD+M10RFzvxkiu0JhiRr9UUFTL6tkY6qj9IQdGtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=KxI9u0Nj;
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4831E606A886;
	Sun, 15 Nov 2026 21:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4831E606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=KxI9u0Nj
Received: by mail.grapheneos.org (Postfix) id E292B3C08EE9E;
	Sun, 15 Nov 2026 21:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794779821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qv63BJZJpTuqn9oT/kkgXxBPtvhk9LgkyaQuITas9nE=;
	b=KxI9u0NjJv51E8YkLVVToaFGS4F+0nlX/AejsOJxh/W7PPRTbIRTPbyb6uLOkm6WfokmAD
	g/s9bbddZZiC/kYk8+r0KrcUgCFZ7FyfjtwiX/89K7VyXjs1GRDeEDEKcejsLVpj+N4jM1
	e9sog6GVy8UgzXOQDzKjfvcNQ27dbNlU7AjJqzHgHM48ANST4Bbsz1W5SBzDQlCNzDp1HZ
	kLzQQo/o3zkJh3wPs/+9pcMNkAcXFWusSuEMYbEtY2UaBUJXIRsV22colNfazNAAcgE08X
	OlkqYV8LLLD3b3hsHhDz4llK1+hXCRnzxCjyaAFIQZSiZnvcQq6P7Kx+LiERDw==
From: liamsmith827 <liamsmith827@grapheneos.org>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liam Smith <liamsmith827@proton.me>
Subject: [PATCH net-next v4 1/4] ipv4: add FIB_LOOKUP_REPORT_MISS
Date: Sun, 15 Nov 2026 21:56:37 +0000
Message-ID: <20261115215640.18728-2-liamsmith827@grapheneos.org>
In-Reply-To: <20261115215640.18728-1-liamsmith827@grapheneos.org>
References: <20261115215640.18728-1-liamsmith827@grapheneos.org>
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

From: Liam Smith <liamsmith827@proton.me>

Currently, fib_lookup() returns -ENETUNREACH for both a routing lookup
miss and an unreachable rule. These two cases must be distinguishable to
facilitate a fallback that only occurs when there's a miss.

Add a new FIB_LOOKUP flag that instructs lookups to return -ESRCH when
there's a miss.

Signed-off-by: Liam Smith <liamsmith827@proton.me>
---
 include/net/fib_rules.h | 1 +
 include/net/ip_fib.h    | 6 +++---
 net/ipv4/fib_rules.c    | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/net/fib_rules.h b/include/net/fib_rules.h
index c6b94790fa81..df1cb39ddf92 100644
--- a/include/net/fib_rules.h
+++ b/include/net/fib_rules.h
@@ -59,6 +59,7 @@ struct fib_lookup_arg {
 	int			flags;
 #define FIB_LOOKUP_NOREF		1
 #define FIB_LOOKUP_IGNORE_LINKSTATE	2
+#define FIB_LOOKUP_REPORT_MISS		4
 };
 
 struct fib_rules_ops {
diff --git a/include/net/ip_fib.h b/include/net/ip_fib.h
index 92f4eb8b86d7..d0b4f261585a 100644
--- a/include/net/ip_fib.h
+++ b/include/net/ip_fib.h
@@ -318,7 +318,7 @@ static inline int fib_lookup(struct net *net, const struct flowi4 *flp,
 			     struct fib_result *res, unsigned int flags)
 {
 	struct fib_table *tb;
-	int err = -ENETUNREACH;
+	int err = -EAGAIN;
 
 	rcu_read_lock();
 
@@ -327,7 +327,7 @@ static inline int fib_lookup(struct net *net, const struct flowi4 *flp,
 		err = fib_table_lookup(tb, flp, res, flags | FIB_LOOKUP_NOREF);
 
 	if (err == -EAGAIN)
-		err = -ENETUNREACH;
+		err = (flags & FIB_LOOKUP_REPORT_MISS) ? -ESRCH : -ENETUNREACH;
 
 	rcu_read_unlock();
 
@@ -398,7 +398,7 @@ static inline int fib_lookup(struct net *net, struct flowi4 *flp,
 		err = fib_table_lookup(tb, flp, res, flags);
 
 	if (err == -EAGAIN)
-		err = -ENETUNREACH;
+		err = (flags & FIB_LOOKUP_REPORT_MISS) ? -ESRCH : -ENETUNREACH;
 out:
 	rcu_read_unlock();
 
diff --git a/net/ipv4/fib_rules.c b/net/ipv4/fib_rules.c
index 060501b376a8..3d7dcb8d0865 100644
--- a/net/ipv4/fib_rules.c
+++ b/net/ipv4/fib_rules.c
@@ -101,7 +101,7 @@ int __fib_lookup(struct net *net, struct flowi4 *flp,
 		res->tclassid = 0;
 #endif
 
-	if (err == -ESRCH)
+	if (err == -ESRCH && !(flags & FIB_LOOKUP_REPORT_MISS))
 		err = -ENETUNREACH;
 
 	return err;
-- 
2.47.3

