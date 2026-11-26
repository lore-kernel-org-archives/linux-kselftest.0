Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717424;
	b=Bup7FbmZ7njhu+twyWxiMYP9/UwoL/5fOYDTGa0sVo7JT+S23K4B1Gk0lzqtYk25udPF
	 hQ6l1z895gEc/AHilloNNuUUGrLiIN3Bx8tHWu/w7Ndf2nChti6nzdXISBSEJxGZfoMrW
	 fHaHbmcMKjqdCgaItMvFRj23gGCVc5/MlXHufKrPAzWsPtVQpyMoOsKJVf8W+avVvZIDB
	 Jl1ua43UrSNfmgU3EafMW+5UXvgMh6G1FS9w189c4uQiCLA8NDcTO6alEPZ0gaWShbBBZ
	 ad8Fl1ArluHBpgML3RbZ9bhHRoKvnU7J8Nw2i8/lbhxZYekKGwelj6MQoMumXaIZavQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Lp8M8lYYzj4bAb9lBG0lPMLGWnNV20tyRcd9oS1HW70=;
	b=A1OhECj3baGsFePBKwU4xt0B9fXhtTK3oyxwGXNiVAnUmSUVJtlwrgx1aiSZrAugPhHk
	 vqMsSPiGkiuiUP5XuUU/+IGrsIR/tq8z+rL73TSQjh35IIOvRMA6EM0SFcsvpX6kAUEuf
	 9ok+MyvvJQ8ccJBuDlR573+MhZr15+u5rc7jpE/2jQnuILjGwWO6WObcVlmdn4PpDL8mR
	 lOpt3Fyne4T3Njvr5T7oTvCImJxA+KVm+NuThqUTYdUj9qFlMxDHOo+8Sb7UyA7rT59AR
	 zr+bfkDKnvW4284xb13ucV9uvPzuRa7sAUXi9Mq9khDD3+AFjjk6/vI4mqcPq7QqRxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GkfMpqsR;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CA1606A321
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 18:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95CA1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GkfMpqsR
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38692f62b22so9414371eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 10:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795717423; x=1796322223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lp8M8lYYzj4bAb9lBG0lPMLGWnNV20tyRcd9oS1HW70=;
        b=GkfMpqsRuNkpr8OY3eTCYkDTW1lYDxDbjJnf6vR3/D0Uir0fRy1UMbVP77reIhaip+
         ssfV+kBkxfWhfK2WwxSfsRdgXOyP6Fd1QuxhX5FpH3c8ua5QE/7kN/fYOzQs+zVwoBGC
         HRKoJKrMCvNVWhRFl7oMYN0PieZEBU0MjvepDP25WEPsN+pGt77JhSVewLTR+/RXbFHo
         18Mfe0xnFQJKfvuhgWvdwv6jPP6t1Cq2VUEOdt7FFfTQzKVNypZPS9geN7RECuY08vQg
         fOCzp50uJj8r63cI5YLExa/N8POwS/huT8R0drDO4F9LqchDZhbwsphqT6gKGkWqU7DU
         Jhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717423; x=1796322223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lp8M8lYYzj4bAb9lBG0lPMLGWnNV20tyRcd9oS1HW70=;
        b=EFBHZmV9BxJVKHe0R4oDnhge9TH9LVCRFvbbWiyr5CGwhDxAuMbqMmIzQoB8sxsXMp
         H3H/h5erBfbmveVYQHqyHBjtGcMDXFuuFh0qXXDHa26wfWnfK4UvOxluSlzwJXjGtyCF
         8jwmjTR3jYqB6vnXCIrG9M8vFTz1mcADh02obrOxlw9gkfncrRG1zXcrC9ONaCfvYNK+
         9jS5AT92Zv7gxamvfExWSvZXY3bXKU2h64lW8Q22ozOysp0Xm/8j3XvqcYUl6scP7z5O
         e/5hx2Y4/2Cx1/SXUwsOLQQLVSELyClVYL3gtxbGkm7DMRsWuHobfg/GQapCdsgSkVS6
         ULAA==
X-Forwarded-Encrypted: i=1; AL+hErEj1JZjC1idwsrUJBiS1tef4oQl/QoYTtTUURkcsrdMEH368/1CXSGEN5LxQQNN1BsYdvqVu0uS8KzJUCd6CQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+64hl0td20XUh9O6aNkyxNKLfGSF7uuLNaSPw2jaoAod0JnvGQ
	dAcW0O4s9gSmQmHRv2kLoX2pLo+4Zm7j8zeoP5rdVwJO3bymn7vlFRft
X-Gm-Gg: AZFdTZfpfpafI+ELLKuD1sLG5PyleM62tNz+pn+StJOfZVGLPR6AtmuPHdYvAng/eND
	KC1OlswK4XDCeAcin5nHdMiwTuPHdinajJaxkbrgJufctSWaEuQ3KsQwey3NeuXqTrv1EwjqPCB
	4tn/4sTiF9LspvwT6Zyz+dNoxH0hYp3qAwZX2XZPDuLHUUvXjcDXeE1HGgkA/jPDWcszc5IRpEE
	TWZ9Pp3MBVu6asmMYhbBx1Pm/pJfsWqGVQ8g9BGuFGA+tcjkwnSi93CBEiSwu2Oupb3KXguq0tg
	Ayqmy40ez3BtiqeDuellHG6QlU+tNSW+hnP4qGeo2Ehnw8ZLJry3SaaylWu6CvXaQ8WAlJPHs2y
	vGsx57EpX9Csg5/W4rM9BE6PSBPiGVo6xSt8KX5XjHT5N3pIZqVHo+CK6IdPuqP051EkAuXLlgC
	EW/iQuiErCaF5bivH+2fG66JacTYPLF5TjRFjWOu0RNfST69Tqa0XceOPHbYLSxGBBgpPxCkcFe
	1wSgXRSEXqxmEH3YXQ4I/74f5Q3aAI/XWw4qyqlAnS4h7Yqmr2e328Q90nGBpbf5ly++599TxLn
	kGLZKpehz1tSE03mCFHE/mvSzlXO99erin3GfHB0Si3HC/GEKxoQjODPRKCanLqwKhf5O7SWJ+Q
	eIMybvg==
X-Received: by 2002:a05:693c:80c2:b0:35d:4185:5395 with SMTP id 5a478bee46e88-3856eb492ccmr23530067eec.16.1795717422466;
        Thu, 26 Nov 2026 10:23:42 -0800 (PST)
Received: from localhost.localdomain ([203.202.252.249])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386d605c894sm11826582eec.2.2026.11.26.10.23.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 10:23:41 -0800 (PST)
From: Zhefu Peng <ilskdw@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kuniyu@google.com,
	mschiffer@universe-factory.net,
	nicolas.dichtel@6wind.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v7 1/2] vxlan: reset the remote's dst cache when snooping moves a MAC
Date: Fri, 27 Nov 2026 00:23:28 +0600
Message-ID: <20261126182329.91058-2-ilskdw@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261126182329.91058-1-ilskdw@gmail.com>
References: <20261126182329.91058-1-ilskdw@gmail.com>
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

vxlan_snoop() handles a known MAC that now arrives from another remote
by rewriting the remote's IP address in place. It leaves the remote's
dst_cache alone, so the next packet to that MAC is routed with the dst
cached for the previous remote. When the two remotes have different
next hops, the packet leaves the wrong way. For example, if the
previous remote was on-link and the new one is behind a router, the
device resolves the new remote's address on the local link, the
neighbour stays incomplete, and traffic to the MAC is blackholed until
the cached route is invalidated, such as by "ip route flush cache".

The same branch also leaves remote_ifindex unchanged, although the
early return compares it and vxlan_xmit_one() uses it as the output
interface. When a MAC moves between an IPv6 link-local and another
address, the remote keeps the previous interface, and every later
packet from that remote enters the migration branch again.

vxlan_fdb_replace(), which makes the same change through netlink,
already resets the cache, updates remote_ifindex and clears offloaded.
Do the same when snooping.

vxlan_snoop() knows the interface only for IPv6 link-local sources and
uses 0 for all others, but the early return compares remote_ifindex for
every source. A packet from the remote of a dynamic entry that was
added with a "via" device therefore enters the migration branch as
well, which would now reset the device to 0. Compare remote_ifindex
only for link-local sources.

Two CPUs can snoop the same MAC from different remotes at the same time,
and the plain stores to remote_ip and remote_ifindex can then mix, for
example a global address with the interface of a link-local one. With
the early return above, such an entry is never repaired. Update the
remote under vxlan->hash_lock, which vxlan_fdb_replace() and the other
writers of these fields hold, and check the entry again once the lock
is held.

The selftest added in the next patch moves a MAC from an on-link IPv4
remote to one behind a router, and from a global IPv6 remote to a
link-local one. Both cases fail without this patch and pass with it.
A third case checks that the "via" device of a dynamic entry stays set
when its remote sends traffic.

This was found by our AI-driven automated live migration tests. The fix
and this changelog were written with the help of an AI coding assistant.

Fixes: 0c1d70af924b ("net: use dst_cache for vxlan device")
Fixes: 87613de95041 ("vxlan: fix snooping for link-local IPv6 addresses")
Signed-off-by: Zhefu Peng <ilskdw@gmail.com>
---
 drivers/net/vxlan/vxlan_core.c | 87 +++++++++++++++++++++++++++-------
 1 file changed, 69 insertions(+), 18 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index d11028b37..584d56d03 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -1434,6 +1434,67 @@ static int vxlan_fdb_get(struct sk_buff *skb,
 	return err;
 }
 
+static bool vxlan_snoop_should_move(struct vxlan_fdb *f,
+				    const union vxlan_addr *src_ip,
+				    u32 ifindex,
+				    enum skb_drop_reason *reason)
+{
+	struct vxlan_rdst *rdst;
+
+	*reason = SKB_NOT_DROPPED_YET;
+
+	/* Don't override an fdb with nexthop with a learnt entry */
+	if (rcu_access_pointer(f->nh)) {
+		*reason = SKB_DROP_REASON_VXLAN_ENTRY_EXISTS;
+		return false;
+	}
+
+	rdst = first_remote_rcu(f);
+	if (likely(vxlan_addr_equal(&rdst->remote_ip, src_ip) &&
+		   (!ifindex || rdst->remote_ifindex == ifindex)))
+		return false;
+
+	/* Don't migrate static entries, drop packets */
+	if (f->state & (NUD_PERMANENT | NUD_NOARP)) {
+		*reason = SKB_DROP_REASON_VXLAN_ENTRY_EXISTS;
+		return false;
+	}
+
+	return true;
+}
+
+static enum skb_drop_reason vxlan_snoop_move(struct net_device *dev,
+					     struct vxlan_fdb *f,
+					     const u8 *src_mac,
+					     union vxlan_addr *src_ip,
+					     u32 ifindex)
+{
+	struct vxlan_dev *vxlan = netdev_priv(dev);
+	enum skb_drop_reason reason;
+	struct vxlan_rdst *rdst;
+
+	/* The entry may have changed before the lock was taken */
+	if (hlist_unhashed(&f->fdb_node))
+		return SKB_NOT_DROPPED_YET;
+
+	if (!vxlan_snoop_should_move(f, src_ip, ifindex, &reason))
+		return reason;
+
+	rdst = first_remote_rcu(f);
+	if (net_ratelimit())
+		netdev_info(dev,
+			    "%pM migrated from %pIS to %pIS\n",
+			    src_mac, &rdst->remote_ip.sa, &src_ip->sa);
+
+	dst_cache_reset(&rdst->dst_cache);
+	rdst->remote_ip = *src_ip;
+	rdst->remote_ifindex = ifindex;
+	rdst->offloaded = false;
+	vxlan_fdb_notify(vxlan, f, rdst, RTM_NEWNEIGH, true, NULL);
+
+	return SKB_NOT_DROPPED_YET;
+}
+
 /* Watch incoming packets to learn mapping between Ethernet address
  * and Tunnel endpoint.
  */
@@ -1459,31 +1520,21 @@ static enum skb_drop_reason vxlan_snoop(struct net_device *dev,
 
 	f = vxlan_find_mac_rcu(vxlan, cfg, src_mac, vni);
 	if (likely(f)) {
-		struct vxlan_rdst *rdst = first_remote_rcu(f);
+		enum skb_drop_reason reason;
 		unsigned long now = jiffies;
 
 		if (READ_ONCE(f->updated) != now)
 			WRITE_ONCE(f->updated, now);
 
-		/* Don't override an fdb with nexthop with a learnt entry */
-		if (rcu_access_pointer(f->nh))
-			return SKB_DROP_REASON_VXLAN_ENTRY_EXISTS;
+		if (likely(!vxlan_snoop_should_move(f, src_ip, ifindex,
+						    &reason)))
+			return reason;
 
-		if (likely(vxlan_addr_equal(&rdst->remote_ip, src_ip) &&
-			   rdst->remote_ifindex == ifindex))
-			return SKB_NOT_DROPPED_YET;
-
-		/* Don't migrate static entries, drop packets */
-		if (f->state & (NUD_PERMANENT | NUD_NOARP))
-			return SKB_DROP_REASON_VXLAN_ENTRY_EXISTS;
-
-		if (net_ratelimit())
-			netdev_info(dev,
-				    "%pM migrated from %pIS to %pIS\n",
-				    src_mac, &rdst->remote_ip.sa, &src_ip->sa);
+		spin_lock(&vxlan->hash_lock);
+		reason = vxlan_snoop_move(dev, f, src_mac, src_ip, ifindex);
+		spin_unlock(&vxlan->hash_lock);
 
-		rdst->remote_ip = *src_ip;
-		vxlan_fdb_notify(vxlan, f, rdst, RTM_NEWNEIGH, true, NULL);
+		return reason;
 	} else {
 		/* learned new entry */
 		spin_lock(&vxlan->hash_lock);
-- 
2.54.0

