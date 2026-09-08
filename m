Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC9C38657D;
	Tue,  8 Sep 2026 06:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850191; cv=none; b=aX44TppYTqbsnVIFXfWER2303A0g6UkVawE7ijLUnMb0UQ4Ci+tGy1qoSZpu1wK4QduodMqnvrJuKm5nI/aaoDc/XKryHsoOwqNVVNuO9e0w1Bxgqs9ZAEbFPdDCZzhMd1/mDoRX0GQbSwFYQ+q8S2qKmKZMPNcqkURYCwQYV20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850191; c=relaxed/simple;
	bh=ytmcD6RwEkd1Zad8uaIo1OWAGQ7HyolfVqt8ZYgbJYo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kImJW0R4DnOsdsnfulQ4/pAPNTu87bnl9yFzeM/SI++PKTuBqYcSfljp9C429ioznKzaGEZDgn2NNLM69ur0/SXm3NnrNWtjnPVBNWhdM01L9yXN4RZ49wT568oTyN8dGkK6TxqBTqulmJULTp6sDR/Sd9wRuDiimZ27+wcUJ/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=PTTTqykC; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="PTTTqykC"
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 74662206DF;
	Tue,  8 Sep 2026 08:49:47 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U5OFWtTFJU4c; Tue,  8 Sep 2026 08:49:46 +0200 (CEST)
Received: from EXCH-02.secunet.de (rl2.secunet.de [10.32.0.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id A9075201E2;
	Tue,  8 Sep 2026 08:49:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com A9075201E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1788850186;
	bh=TBoPTybd3Kxu9XHwwt+Wl7LY5T6URqzmAlERkZVnuLM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=PTTTqykCADiUBYDw61Uh2sZZfbXtlYdyKV7/1MFjb4Fo2+X1nx7K7IcxLmJnNYHrD
	 6dqqnxb5PWKJGQYD2Ppz6gfDjY/sdzLwkMTJJlAZ54u1MdmRz2Uz8NKIAfar0hbcxo
	 toWePxbvNhglltBlLTnTxG7TBFfNFbck5KMQ35XlgP6kFS1tzdlYikhj0jg/eK/w2g
	 NK1epAbL2NfS/5cMzP1vHQ7/tuiUdNj7mN+8c3b7zM9o461JYbYBzBpR3WPXbi9TEV
	 az/YwQ4OzLkasuUsZZhKeQ4PyXxkHgejd2b1TvEd/VOJWuW/XZTzUHuY46d6zyZ1ia
	 X6pL0kCPpZPOQ==
Received: from moon.secunet.de (172.18.149.1) by EXCH-02.secunet.de
 (10.32.0.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 8 Sep
 2026 08:49:45 +0200
From: Antony Antony <antony.antony@secunet.com>
To: Antony Antony <antony.antony@secunet.com>, Steffen Klassert
	<steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, Jamal Hadi Salim
	<hadi@cyberus.ca>, Shuah Khan <shuah@kernel.org>
CC: Sabrina Dubroca <sd@queasysnail.net>, <netdev@vger.kernel.org>, Yan Yan
	<evitayan@google.com>, Tobias Brunner <tobias@strongswan.org>, Florian
 Westphal <fw@strlen.de>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH ipsec v2 4/6] xfrm: include mark in MIGRATE_STATE SA collision check
Date: Tue, 8 Sep 2026 08:49:37 +0200
Message-ID: <migrate-state-fixes-v2-4-c3e2767f0d96@secunet.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <migrate-state-fixes-v2-0-c3e2767f0d96@secunet.com>
References: <migrate-state-fixes-v2-0-c3e2767f0d96@secunet.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16-dev
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EXCH-01.secunet.de (10.32.0.171) To EXCH-02.secunet.de
 (10.32.0.172)

The SA lookup tuple is (daddr, spi, proto, family, mark), but the
EEXIST pre-check and the xfrm_state_insert() vs xfrm_state_add()
decision only considered daddr and family, ignoring mark.
A migration that only changes the mark inserts a duplicate SA tuple
into the hash tables.

The collision check is implemented as xfrm_state_mark_collides(),
which walks the SPI hash bucket for the target tuple and excludes the
state being migrated by pointer, rather than doing a separate
exact-match lookup followed by a wildcard lookup and comparing the
result against self.

Before:
root@west:~# ip xfrm state add src 10.1.1.1 dst 10.1.1.2 proto esp \
        spi 0x1000  reqid 100 mode tunnel aead "rfc4106(gcm(aes))" \
        0x1111111111111111111111111111111111111111 96 \
        mark 0x1 mask 0xff

root@west:~# ip xfrm state add src 10.1.1.1 dst 10.1.1.2 proto esp \
        spi 0x1000  reqid 100 mode tunnel aead "rfc4106(gcm(aes))" \
        0x1111111111111111111111111111111111111111 96 \
        mark 0x2 mask 0xff
root@west:~# ip xfrm state migrate dst 10.1.1.2 proto esp spi 0x1000 \
        mark 0x1 mask 0xff \
        new-dst 10.1.1.2 new-src 10.1.1.1 new-reqid 100 \
        new-mark 0x2 mask 0xff
ip x s
src 10.1.1.1 dst 10.1.1.2
    proto esp spi 0x00001000 reqid 100 mode tunnel
    replay-window 0
    mark 0x2/0xff
    aead rfc4106(gcm(aes)) 0x1111111111111111111111111111111111111111 96
    anti-replay context: seq 0x0, oseq 0x0, bitmap 0x00000000
src 10.1.1.1 dst 10.1.1.2
    proto esp spi 0x00001000 reqid 100 mode tunnel
    replay-window 0
    mark 0x2/0xff
    aead rfc4106(gcm(aes)) 0x1111111111111111111111111111111111111111 96
    anti-replay context: seq 0x0, oseq 0x0, bitmap 0x00000000
    sel src 0.0.0.0/0 dst 0.0.0.0/0

Notice two states with same mark 0x2/0xff.
After:

Error: New SA tuple already occupied.

Fixes: a9d155ea9b44 ("xfrm: add XFRM_MSG_MIGRATE_STATE for single SA migration")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Antony Antony <antony.antony@secunet.com>

---
v1->v2: pre-check used wildcard lookup; factored the check into
xfrm_state_mark_collides() excluding self directly instead of
lookup_exact()+lookup() with a pointer comparison
---
 include/net/xfrm.h    |  4 ++++
 net/xfrm/xfrm_state.c | 40 +++++++++++++++++++++++++++++++++++++---
 net/xfrm/xfrm_user.c  | 17 ++++++++---------
 3 files changed, 49 insertions(+), 12 deletions(-)

diff --git a/include/net/xfrm.h b/include/net/xfrm.h
index 9e053388aa4b..26dd4b570588 100644
--- a/include/net/xfrm.h
+++ b/include/net/xfrm.h
@@ -1751,6 +1751,10 @@ struct xfrm_state *xfrm_state_lookup_byaddr(struct net *net, u32 mark,
 struct xfrm_state *xfrm_state_lookup_exact(struct net *net, const struct xfrm_mark *mark,
 					   const xfrm_address_t *daddr, __be32 spi,
 					   u8 proto, unsigned short family);
+bool xfrm_state_mark_collides(struct net *net, u32 mark,
+			      const xfrm_address_t *daddr, __be32 spi,
+			      u8 proto, unsigned short family,
+			      const struct xfrm_state *self);
 #ifdef CONFIG_XFRM_SUB_POLICY
 void xfrm_tmpl_sort(struct xfrm_tmpl **dst, struct xfrm_tmpl **src, int n,
 		    unsigned short family);
diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index b7ea1060dac9..977eb004270a 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -2205,10 +2205,12 @@ int xfrm_state_migrate_install(const struct xfrm_state *x,
 			       struct netlink_ext_ack *extack)
 {
 	if (m->new_family == m->old_family &&
-	    xfrm_addr_equal(&x->id.daddr, &m->new_daddr, m->new_family)) {
+	    xfrm_addr_equal(&x->id.daddr, &m->new_daddr, m->new_family) &&
+	    xc->mark.v == x->mark.v && xc->mark.m == x->mark.m) {
 		/*
-		 * Care is needed when the destination address of the state is
-		 * to be updated as it is a part of triplet.
+		 * Care is needed when the destination address or mark of the
+		 * state is to be updated, as they are part of the lookup
+		 * triplet.
 		 */
 		xfrm_state_insert(xc);
 	} else {
@@ -2443,6 +2445,38 @@ xfrm_state_lookup_exact(struct net *net, const struct xfrm_mark *mark,
 }
 EXPORT_SYMBOL(xfrm_state_lookup_exact);
 
+/* True if some OTHER state at this tuple would wildcard-match "mark".
+ * Used by MIGRATE_STATE, which must exclude the state being migrated.
+ */
+bool xfrm_state_mark_collides(struct net *net, u32 mark,
+			      const xfrm_address_t *daddr, __be32 spi,
+			      u8 proto, unsigned short family,
+			      const struct xfrm_state *self)
+{
+	struct xfrm_hash_state_ptrs state_ptrs;
+	unsigned int h;
+	struct xfrm_state *x;
+	bool collides = false;
+
+	rcu_read_lock();
+	xfrm_hash_ptrs_get(net, &state_ptrs);
+	h = __xfrm_spi_hash(daddr, spi, proto, family, state_ptrs.hmask);
+
+	hlist_for_each_entry_rcu(x, state_ptrs.byspi + h, byspi) {
+		if (x != self && x->props.family == family &&
+		    x->id.spi == spi && x->id.proto == proto &&
+		    xfrm_addr_equal(&x->id.daddr, daddr, family) &&
+		    (mark & x->mark.m) == x->mark.v) {
+			collides = true;
+			break;
+		}
+	}
+	rcu_read_unlock();
+
+	return collides;
+}
+EXPORT_SYMBOL(xfrm_state_mark_collides);
+
 struct xfrm_state *
 xfrm_find_acq(struct net *net, const struct xfrm_mark *mark, u8 mode, u32 reqid,
 	      u32 if_id, u32 pcpu_num, u8 proto, const xfrm_address_t *daddr,
diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index aac12991d2ca..f8c2b17c6f2b 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -3446,15 +3446,14 @@ static int xfrm_do_migrate_state(struct sk_buff *skb, struct nlmsghdr *nlh,
 						       x->nat_keepalive_interval);
 
 	if (m.new_family != um->id.family ||
-	    !xfrm_addr_equal(&m.new_daddr, &um->id.daddr, um->id.family)) {
-		u32 new_mark_key = m.new_mark ? m.new_mark->v & m.new_mark->m :
-						m.old_mark.v & m.old_mark.m;
-		struct xfrm_state *x_new;
-
-		x_new = xfrm_state_lookup(net, new_mark_key, &m.new_daddr,
-					  um->id.spi, um->id.proto, m.new_family);
-		if (x_new) {
-			xfrm_state_put(x_new);
+	    !xfrm_addr_equal(&m.new_daddr, &um->id.daddr, um->id.family) ||
+	    (m.new_mark && (m.new_mark->v != x->mark.v ||
+			   m.new_mark->m != x->mark.m))) {
+		const struct xfrm_mark *new_mark = m.new_mark ? m.new_mark : &x->mark;
+
+		if (xfrm_state_mark_collides(net, new_mark->v & new_mark->m,
+					     &m.new_daddr, um->id.spi,
+					     um->id.proto, m.new_family, x)) {
 			NL_SET_ERR_MSG(extack, "New SA tuple already occupied");
 			err = -EEXIST;
 			goto out;

-- 
2.47.3

