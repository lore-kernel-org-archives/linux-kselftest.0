Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694550;
	b=zBLM6hLu79D0d5OJku1vROfdZO5zKSMwiDG1tqNhjbp4/6nxIcXv3c+XsOEGTnmZAYDQ
	 cggx3LXF04JDetXCXzMND0SROoZN1hIz3wPr0N8Etrp0mJBWroC8y+LIpC0U2VwgoRz2B
	 kWeJmkXX027Kq2x8hXkJOHrUVJwtwdIJupfBt2XwBRzs+LoN7h0Fn2nhh5C/2eLcU1vA+
	 5afBOQE0MChM/6eeL73BSPv+uIjMnLmDOwnv++f0ZtS/O1mhWzQ3/AOIpyzMvOkHuw+za
	 QuhAdzvVBOzVvGx26mTnoiK08JTfujx5SScxpDyYPpN3I+LJphBwIg+MBXDz9wu5I0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QqHs6HEOhDu5aRvOORUyDd00kdCJ9afZEREichHXXFs=;
	b=H1TpMjPvlbccZFReiw8frlIXFyNA3fvEt9Vjk5YKOb3ezwS4to+Sgc1ojuLUkCvX1C9e
	 dgFDxvsSn8FG7GtdW4P2wcWZCO8PLDovCvJ6k40+PjoP4Yy/7ooUyWv87ZZTETfGEAZrK
	 dyXjftcTWYDEYxas+oRlnTuLwKbIyrM+oZtZ9abh0LeoIIWqhrUPXJRPtfOQpAueofUEj
	 j7D/Jy4iYP/47BrAeYqrBO/NRL4VUWGrWFQ8x9hZAPD9pDoQFt0uNDb0IMlaIofavDdIb
	 dnETUcmO8XUV+fcLSbQe707r9v+k91oNJ8vFY8OEZDcEEnnfTRsTOvTXmzGcRmn5+og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nq61C60D;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC6A60A2626
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 22:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DC6A60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nq61C60D
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4919a880834so1039190f8f.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 14:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694548; x=1795299348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqHs6HEOhDu5aRvOORUyDd00kdCJ9afZEREichHXXFs=;
        b=Nq61C60D4mAlZNO7ooeTvcHOc/hrz4DLr1qK456QcqOP2E5oy2bN7gRIeRmqfxTlkp
         6WwmlNVrooFnYXmkqAHp5T9laK6sCm1Blqg94QEWVjSCHFjFHzl/uoSuN/ldL137aSNo
         KwxpJC3yffXA91aJIszp64IYhtM3OEphSw/fnd4nOGLV3wjWT9xXUzasjMDOSnfsKZuc
         XE0AohHW5LRLDSRjj6MH3tkWTcL8CJQ9lEUb37p013sxFjkDRnuQwQljyp8L5lMVtrq4
         T/sqL1nzbf8e5Z5DWsyD9flInuhUU/i04ZErlAarvKQ98BHTyS4Tmofw73T5eMGrodT1
         nSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694548; x=1795299348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QqHs6HEOhDu5aRvOORUyDd00kdCJ9afZEREichHXXFs=;
        b=sMTNLD9Yg9RJk4diCyUlP7FrBCxPwCle+Y5oBWqbhXwZAi0LeEpbnRCwIMB3SW7lWT
         /fif2Ih7+Hg3/OdBCT8+E1guQAL/LtUSxVnfoouJtQOKXY8v9Rb1/XQED1agZoh3nwZK
         WSZPNu8Eeg0TTV4UdPOmJ9hhEzuvkPVnNZT2LBgKVl2UmssdXKbBeCEDEAIniAn6n3y8
         Ib68JnuZopaSOgg+UBP/eHBJH4ZE48ENB3G8n1vXT3eyXO3EpqtOz/x7ECsQhJI4kavs
         LI/N1gwazD1rAQVb0gqhTT2Mw9KGGL61uO6fqpFr/f5BwMEN+9W9ZV+S9Emry0iQ+sL4
         9FQg==
X-Forwarded-Encrypted: i=1; AL+hErFOi7X+YhraVBplyI/X5/e3ezLjHdSAh8hafiYKrcNyf+qTPm+i8l/fX7hLJRz7HkDP2c0ZPkfsvDLa9sXoBE8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Rc4SFIgoMFf/wSJjHexbHP4oY8bCXdTFKzv54bRZlR8SOm9++
	+D3XWyu56XEXZt0qsRuGfiJGGFvlF/uKVoh4+RAzs4UG0Y8Uays+XCD7
X-Gm-Gg: AYBFou0lC8UOnFIxAOCdNiXiLACLYVW3uqE4fxKrOPBzerf6pFo+YU7zKV+gf++Rt/p
	rHH5LVfS0a/7CWDanMAP8VJB6iqGENY1Miu2+MYP7h47BblElh6KNex+iSfchWFTVeLwh+Ub4PR
	ek8IqhlNfh2KSeAr+jM90Dj2oYgz6518XQuh5HA08beo7P8TOHgncUIPHrT3bZl54W2cncMkmbl
	23SaTb12Yx5YgQER1n6m0vRDb5Nk4fEZUbeHGqno29bAey5bro5YiWj0kxDWszbWZ2TgTmwdia5
	w03fXdZFlonTUPlkiDNpqVcI9PbJXgE3nUFXpx3Vy8Bz10Lue4jsZ5E13tm72usoxxGC63MaM7P
	0VAiHfbZe+nTQGDi3/EnTG+M/XacOAAopwrWj2wOIET5f572xdDtU30Sii2iuSDyI2ZVymOysOD
	gDJi2i6PPQv9IgaFYUHCERWt97ZkRLGQUZ8fvKgQ0Ka6dM34+uVw5Jwjq0b6/Btk+oYAvNHDECm
	iIVfMSrqlR9XLh9+PGwpu3tIvGW0OICA8RpRFwHiY94JWjpmOeZhhOdYt00y7Vh8dZ3CVnT2N15
	VLpBzM7aY0MXcMiCJBTxXKuaBtUH4QOmWAwqopjyL6Vr
X-Received: by 2002:a5d:59c3:0:b0:48c:72fc:363e with SMTP id ffacd0b85a97d-49c9487049dmr15265032f8f.44.1794694547772;
        Sat, 14 Nov 2026 14:15:47 -0800 (PST)
Received: from kali ([169.224.126.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm13514941f8f.8.2026.11.14.14.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:15:47 -0800 (PST)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	kuniyu@google.com,
	petrm@nvidia.com,
	aroulin@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v5 5/8] vxlan: leave FDB state and flags unchanged when an update fails
Date: Sun, 15 Nov 2026 01:14:09 +0300
Message-ID: <20261114221412.255825-6-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114221412.255825-1-alishmery18@gmail.com>
References: <20261114221412.255825-1-alishmery18@gmail.com>
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

vxlan_fdb_update_existing() writes the requested state and flags into
the entry before the steps that can still fail: under NLM_F_REPLACE the
nexthop update and the check that refuses non-unicast entries, under
NLM_F_APPEND the allocation of the new remote, and the switchdev
notification. Each of them returns an error with the new state and
flags left in place, and no RTM_NEWNEIGH is sent for them, so the entry
changes while the request reports failure and nothing tells userspace.
For example, an RTM_NEWNEIGH asking to replace the permanent all-zeros
entry with a dynamic one is refused with -EOPNOTSUPP, yet leaves the
entry dynamic, and the ageing timer then deletes it.

Write the state and flags only after the nexthop update, the non-unicast
check and the allocation of the new remote, so that a request any of
them refuses never changes the entry, not even briefly. The switchdev
notification reports the new state, so it still follows the write; save
both fields on entry and put them back if a switchdev driver vetoes it.
A successful update ends in the same state and sends the same
notification as before. The ageing timer reads the state and flags
without the hash lock (see commit 7308ef8b4a67 ("vxlan: Stop rejecting
dynamic FDB entries with a nexthop ID")), so it can still age out an
entry that a concurrent successful update makes static; that race
predates this patch and is not addressed here.

The patch "vxlan: vnifilter: account the default FDB entry to memcg"
later in this series makes the NLM_F_APPEND allocation fail routinely
at a memory cgroup limit, on the path that changes a vnifilter VNI's
default entry; this is ordered before it so that failure leaves the
entry as it was. Like the rest of the series it targets net-next.

Found in the automated review of v4 of this series; the other error
exits were found by auditing the rest of the function. Each exit was
triggered in QEMU on net-next. The refused replace and the failed
nexthop update need only netlink requests; the failed append was
injected with the kernel's fail-nth fault injection, and the switchdev
veto was triggered with a test-only module that vetoes the notification,
as no switchdev hardware was available. In a production build (4 vCPU,
ageing 1 s), 356,026,806 refused requests in 1200 s, in equal parts
replaces of the permanent all-zeros entry refused with -EOPNOTSUPP,
appends to it failing on an injected -ENOMEM, and nexthop replaces of
another entry refused with -EINVAL, let the ageing timer delete the
all-zeros entry 1,193 times; the test re-added it after each deletion.

Tested in QEMU with the same requests: each exit now leaves the state
and flags as they were, and the loop above deleted the entry 0 times in
341,241,414 requests. test_vxlan_vnifiltering.sh, which gains a case
for the refused replace later in this series, passes with and without
KASAN and lockdep, and fib_nexthops.sh passes.

Fixes: 6681712d67ee ("vxlan: generalize forwarding tables")
Fixes: 906dc186e020 ("vxlan fdb replace an existing entry")
Fixes: 61f46fe8c646 ("vxlan: Allow vetoing of FDB notifications")
Fixes: 1274e1cc4226 ("vxlan: ecmp support for mac fdb entries")
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v5: new patch (review of v4 6/7); says how the gap was found and what it
did in QEMU (sinfo bot); writes the state and flags after the steps that
can fail instead of writing and then reverting them, so a request those
steps refuse never changes them, not even briefly; a switchdev veto
still writes them and puts them back (local review and KCSAN runs).

 drivers/net/vxlan/vxlan_core.c | 40 ++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index d11028b37472..2303d652d396 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -987,6 +987,8 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 				     struct netlink_ext_ack *extack)
 {
 	__u16 fdb_flags = (ndm_flags & ~NTF_USE);
+	__u16 old_flags = f->flags;
+	__u16 old_state = f->state;
 	struct vxlan_rdst *rd = NULL;
 	struct vxlan_rdst oldrd;
 	int notify = 0;
@@ -1005,21 +1007,6 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 		return -EOPNOTSUPP;
 	}
 
-	/* Do not allow an externally learned entry to take over an entry added
-	 * by the user.
-	 */
-	if (!(fdb_flags & NTF_EXT_LEARNED) ||
-	    !(f->flags & NTF_VXLAN_ADDED_BY_USER)) {
-		if (f->state != state) {
-			f->state = state;
-			notify = 1;
-		}
-		if (f->flags != fdb_flags) {
-			f->flags = fdb_flags;
-			notify = 1;
-		}
-	}
-
 	if ((flags & NLM_F_REPLACE)) {
 		/* Only change unicasts */
 		if (!(is_multicast_ether_addr(f->key.eth_addr) ||
@@ -1048,6 +1035,23 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 		notify |= rc;
 	}
 
+	/* Do not allow an externally learned entry to take over an entry added
+	 * by the user. The state and flags are written only after the steps
+	 * above that can fail, so that a request they refuse never changes
+	 * them, not even briefly: the ageing timer reads them without the lock.
+	 */
+	if (!(fdb_flags & NTF_EXT_LEARNED) ||
+	    !(f->flags & NTF_VXLAN_ADDED_BY_USER)) {
+		if (f->state != state) {
+			f->state = state;
+			notify = 1;
+		}
+		if (f->flags != fdb_flags) {
+			f->flags = fdb_flags;
+			notify = 1;
+		}
+	}
+
 	if (ndm_flags & NTF_USE)
 		WRITE_ONCE(f->updated, jiffies);
 
@@ -1066,13 +1070,17 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 
 err_notify:
 	if (nhid)
-		return err;
+		goto err_restore;
 	if ((flags & NLM_F_REPLACE) && rc)
 		*rd = oldrd;
 	else if ((flags & NLM_F_APPEND) && rc) {
 		list_del_rcu(&rd->list);
 		call_rcu(&rd->rcu, vxlan_dst_free);
 	}
+err_restore:
+	/* The notification was vetoed: put back the state and flags. */
+	f->state = old_state;
+	f->flags = old_flags;
 	return err;
 }
 
-- 
2.53.0

