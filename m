Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794527995;
	b=4x8eW6jIytIa1LLcAWWfkjLUbWkDjLTLi51SjV70iOqph83m/hgRNwOGcS/1UBmkU/US
	 5zB2dTJuCJLbJTzXFT+4s8EKRKP+5yy132IYuRcKf5+fSzmjyoDNiqCYWqx8bnR+A1jWr
	 eAqp2KGTW/KJ6FJfXjwErHGM8RAwLeWmzq3Qv1ujj3fC79M2GKR/2myHcA26Oh06wmXsY
	 SbkrD5qj+2axVcclO8IuKfcVZzlAyt1dmbuGURGFOQKunWohU3v7tO9CdnOPhaz6IULMY
	 Q/mclw58b2Zr8aoHslH7nJ4BiXuV3B2iVvV7HwaxweOvtIFoZ0zMUlovIGSQec+8BFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794527995;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qv63BJZJpTuqn9oT/kkgXxBPtvhk9LgkyaQuITas9nE=;
	b=396Ne7mwDkxxFJog55rzv7YkHoWGZoLAOQEhIb6p14Qh29xzR9M9rBOPtfbazVbW9eMj
	 vf4J+xb7kv+5B03Ubgcxx/75TVxIZZNVXephzZwT+D++apEM+W2NjKPqQjvWFyYgB6UAl
	 Swm8zF750ESlvirRe0a24T37pnphPCxypP4ckKGxcz5gQjXXUvY6vj3YKLtBsJmXuuXwg
	 vOxmuV3osT2KG72XehGbmFD4o9ME3U6qDgLDSLB2RNYAyMJCroFMTrbiD4sXA9n5dFgeQ
	 TzO8RwtLuyJsPLUhsAfD4mAJ/4N8q6eKsEmuwYwW5u++cq8qj7BK2X68OA0pwv/N1ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=Dz9FIiUP;
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5E9606A327;
	Thu, 12 Nov 2026 23:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B5E9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=Dz9FIiUP
Received: by mail.grapheneos.org (Postfix) id 5F1D23C08EE90;
	Thu, 12 Nov 2026 23:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794527994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qv63BJZJpTuqn9oT/kkgXxBPtvhk9LgkyaQuITas9nE=;
	b=Dz9FIiUP20f/k1yraDdTBqh6VRj7eFvi6Pb4XjJSWztaEAW3O81rZmC8RPBxGCCCxkhzvN
	2H5JNvbM5xyIbZzhZFlO1MotD7njvO947CSaFR+jDgO1J3yrSdA+Se1zHXFpW+BHT9nODw
	2Lpa+qGJSpVtqWJg8mZFP3EejsOZ00kP+UpQGxpoTJR70EEv6I7gxftmaISMdtQaBS9DfE
	KuhF3vqbFTXWtC8LKtXU70DmbbhlvyQpVmlkRm+1bJ3YWGyGsI0c8Wg90MQ9yQlN0T9TFr
	b36SvQHGLRMaqhD4HdaqVPoR3dTlSGuPwVaZhaWG98dvOYf69Bm/ZKoDiYgaGQ==
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
Subject: [PATCH net-next v3 1/4] ipv4: add FIB_LOOKUP_REPORT_MISS
Date: Thu, 12 Nov 2026 23:59:29 +0000
Message-ID: <20261112235932.23836-2-liamsmith827@grapheneos.org>
In-Reply-To: <20261112235932.23836-1-liamsmith827@grapheneos.org>
References: <20261112235932.23836-1-liamsmith827@grapheneos.org>
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

