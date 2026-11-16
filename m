Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794860897;
	b=vCN7reWXgkgaQ+uduY4ZaNDovHeBW3UKYy8yJhnewlll4bTSIJ8Gub0wYNIO5mPxXV6u
	 ye+FibxGvUJN+QpFlk7qp3WQay7CMnNZ8Ju/Zvr4N6aFSR0Vq4a7IQ5aVm7qS3rqbnCbe
	 OMtcoUAxwUo+A1jzywQn/WzVmfoQ+rHaCsED1BoZhkZmLQQlvPlPCMmHhv7MpdCS2rd2h
	 crWpoaAJs+sUKeu16BnyYvpdtvZUtPT7d+ngZkBuUno0vGXZDggzdQYKzgQx844jGI0Nd
	 wKIKVPxy/iDJetwYANpaM/Uww/khj+bqQAVNoV0tK7wKV6Sdk5TmcnwHcxa/8+eE97Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860897;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qv63BJZJpTuqn9oT/kkgXxBPtvhk9LgkyaQuITas9nE=;
	b=owD2wuL02iUlML8xuzqm3xedk4Fzwfr/5KGGLJmhQJLoHpPEeIczIrMu2FLVPUysci7q
	 BK7gGKXRfV5ku024GH2D8cGEzyqvXhomtOkqg78ZYkO/Wydx+oUAYQruBnPSbshn4aqb6
	 krgkKDO2meCB5mMj1yvPWkpkG6EhLadUQ6tKZ/cpcwdF66GaeeZuDK5QfbwKUzdJSs9w+
	 0EVEnuDbnwV8MViFUb9ObDnX7c3gjH0ysNt8aI5IRzNHukQuWyIHcZWBKgxzIyuVRb/9v
	 H6MYtMeellNz9UGydnQgvtmy6u0pSXhAz39XtAXO8HuOo0Yk9Ryx34u20JNGAcg4GQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=JyiHjce+;
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBBC606A882;
	Mon, 16 Nov 2026 20:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FBBC606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=JyiHjce+
Received: by mail.grapheneos.org (Postfix) id D16963C08B8D6;
	Mon, 16 Nov 2026 20:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794860895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qv63BJZJpTuqn9oT/kkgXxBPtvhk9LgkyaQuITas9nE=;
	b=JyiHjce+xGmIXcgprPPVqk4uK1j4MjH7Zfa+I8/fM48DuzNOz2vYod/TN6k7J6uqW4RhuB
	GT1Msa9DwjcJraX/nlx7AXQOkqEq5twBJkl4U8NWKkqH5rpwukFs2jZXrtiHFGGhOaefKl
	BL0fBcnAcCImDeraPWZGLUvgyWdZhenSls+pZ4WNpz0QpEOBJsYFrh67cNVOZ1Rilnv7j4
	ad1Bbdk1h5lPSyjQisyS/5ITDFfq4Cr+2z3sR1q8XuoabZqcxINtyTy272rcQI7Ol2NWKD
	i2jy3XxHpmsa4dOvIJUdBNbb8anmsc8abKJbGgf/UIu4cJGJR6EIKmkFigXIjw==
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
Subject: [PATCH net-next v5 1/4] ipv4: add FIB_LOOKUP_REPORT_MISS
Date: Mon, 16 Nov 2026 20:27:38 +0000
Message-ID: <20261116202741.13106-2-liamsmith827@grapheneos.org>
In-Reply-To: <20261116202741.13106-1-liamsmith827@grapheneos.org>
References: <20261116202741.13106-1-liamsmith827@grapheneos.org>
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

