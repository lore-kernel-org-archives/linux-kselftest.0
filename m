Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794715586;
	b=X8wic87WPM7Rs2nafzspqCWf8miI4qxS88EEGg/boE0otBcDFwECwQXILP0Bu/QHBv30
	 HUntrIETLyUDUHZo195um7sRlBfE71f82g2VYCsInoOknECHl13Pbxo+N9N4ZaKNNLwFy
	 NKpYHra+GHP5ggn3GiHodyVGFDg2pQSPeIMVrPf/p8QycP22aspAt9s7BxyIBhrc5k6iT
	 6CLnjmnA99Gh4iUPByXPqw7HBeEAQ3tkntKknHuHXMaTfkAqMDdazcgyx++LAA0sVXPKh
	 cyFrM0Ulhpor1tzliielJOwH0pu4edanpzPYTB/J9rryx+z9Kz6q4DNEq+bGBtXKGvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794715586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bOChi6lheS4EHx0MIl9gs99kMirPUpdkvQRxAFefnDU=;
	b=OY6UMZmlLka4ktTvkpTqGQbOH1eDKtg/GW+khqz0EQOYJgnE5jw62MNdclGR4KlxBriq
	 c7j5GrjiFujFYJs73PoIWcrrQxRX17n8ZkbzOK6hOXaD/yuPRrCgDKV1KGJVWLI/hLjYp
	 1FO9fmfLt9W3EKymaDOlNlLUm5GvqY8O/EqR1LErCCCQkrUpl71DKxJ5G38Zp8nEFd79N
	 xifJ1rpvv5Ma0fHLxCqyal7iW58q9lwNEm/3nG1Ft7EvL6mek4OJ2hVdyg5BFab7cYg9l
	 miJ8zBfnffSCPdfVw9zcliGPXWWmCZphIDbow1BhonvbfvHq3d4aNsfDMN2DZc2TZuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=at7PFRq1;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37138606A329
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 04:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37138606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=at7PFRq1
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cddac941ed1so1090006a12.2
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 20:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794715585; x=1795320385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bOChi6lheS4EHx0MIl9gs99kMirPUpdkvQRxAFefnDU=;
        b=at7PFRq10eTsdOt9uitGaczbNBTm1VR+fitPN/ymHwOw1TEmTAcr+X0ArQU6H+VWWL
         uatUjAkMDUx0ORSw/1s9cxRvWXIXeGcIWAGU83rZPLXPfDo+bkY6cU8a8wth5DhHlqpH
         4F+d3biIsVtdV3ii0lHfFTG+mhjmdlEvy9tCT0FzzUNb2zrNWd3IHCoLlSj/9lJP33aD
         0Dkgm8srah7mn5YOo+Z8E89/Ws8MQ1EZiEFi/KoFSIAFhBNxNyo5gNWyrZs0AZJjN7zC
         myrRVAndu7rlCFrynDAlYtg/tPgU5hU1PXjMz7ju5qcoV9ptDwEN6ld459M5W1l/G0dx
         nLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794715585; x=1795320385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bOChi6lheS4EHx0MIl9gs99kMirPUpdkvQRxAFefnDU=;
        b=jBJF0M7JnY31oK4YzCzE1KK6TNfMZAdf0bzzeijreHoczdTjQaf/RMbEq9cZ6bmS9h
         LCn57EPT8Nk05gGQ8YBsCd67BWxOwuscjV9yH5D4YHrX8K3eEe7FiBbHcNLmuEV3rYop
         cbZ845nmLZIdZsVL4vsIpyn4JOD9C6JrNNdvqaOS16jsAUlWO+lMtzbbkWc5a2Q+IV0P
         1iHgaBJyzKi7gj5g8Jq7KXpQ9s24MbnaxIF0TCoCcLaextG7mddSueF2GgIQEAiaDpVl
         tYjcY8itE4HuLksmIHqmvTUCYPOMnCwLFFlmbV4N6kuveiQWk2oXbrVQi5OMe2u1Ycwc
         TXLg==
X-Forwarded-Encrypted: i=1; AL+hErHNfZ1FmliZ6R+9VaoAlkgBw6CAhixedyx/SveKYvKeYtvZmRoB8a69NG0mHpKGWllVLk5EEM835oo8tP4iIjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ot3nPYbGCCeHT0Nv6ek4O5TOXXmVHMBJ5egjj26Om3ccatZmx
	Lj16ADVYWYPVM2tN3VePZaTu3crABAD0v3sj/12dEMrv2uNkhu40IIuZ
X-Gm-Gg: AYBFou2nFMPGUs0v4ST/d+a0wh7mAGNSYFsUTpqvLRvkFjrip9osSpgRdY8Ly2Od2Lz
	ahMD9vajGHAcxAgDK/jclx0wiXeHRIlmY0zNyMYB0IH3DZSlBXj002Zvsr5m32X+Waf84pBQAlU
	/sXVVhXrclZiKWxzJDFoSKzD4XmoNF7RtNXtCZOLdy75dxQyhOagJ1kheInuvyOe0B7AyqNBFf/
	gB6FVEr9unqqaFooOuWVN7pOwlLRHz3U6jOoaJGa1Ui4TV8vPFbs7wdbZXIt8Ok4sTR+SnQ4SGc
	O7f5pCRDADrGekpqLzgoziYrF2w2EHbcWQoY0x5Wsb9U+eTeiSdtWtVjWcWfRSTWX8Ltns4f/f9
	vpJTOQ4FCjAw3FS3mZM1Tt/Wfb1Ic/W2zMIaJFiqZcE5rDfLxkR4jjUOv7p8+nfoD8j94XKEN4a
	M7jvHc1ESOO3feRp3KFBKeqkf/cdC52xtUwRaKP61rn0vmXBC2rif8DFXNAwyVvfhUGi/rqD/Pz
	Janelzg1D6zsfLBIPP8Gs1SoGUxsf6owlaii79tluWAHaxCpEDGZPLJXxhHDBW2YbjKuXhoUCgP
	mv5ecM+GUidJ28CHyGntoJ9orxevx+wiTv7bKwQvifE5q1d/YGktl8sBc8ahuij9mbs4tmhV30k
	qjac=
X-Received: by 2002:a05:6a20:2584:b0:3e2:57b7:4d7e with SMTP id adf61e73a8af0-3f7a51b3164mr6894533637.10.1794715585250;
        Sat, 14 Nov 2026 20:06:25 -0800 (PST)
Received: from localhost.localdomain ([116.88.205.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8682sm2485668b3a.10.2026.11.14.20.06.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 20:06:23 -0800 (PST)
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
Subject: [PATCH net v5 1/2] vxlan: reset the remote's dst cache when snooping moves a MAC
Date: Sun, 15 Nov 2026 12:06:08 +0800
Message-ID: <20261115040609.61134-2-ilskdw@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115040609.61134-1-ilskdw@gmail.com>
References: <20261115040609.61134-1-ilskdw@gmail.com>
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
 drivers/net/vxlan/vxlan_core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index d11028b37..1cfb34fa2 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -1470,7 +1470,7 @@ static enum skb_drop_reason vxlan_snoop(struct net_device *dev,
 			return SKB_DROP_REASON_VXLAN_ENTRY_EXISTS;
 
 		if (likely(vxlan_addr_equal(&rdst->remote_ip, src_ip) &&
-			   rdst->remote_ifindex == ifindex))
+			   (!ifindex || rdst->remote_ifindex == ifindex)))
 			return SKB_NOT_DROPPED_YET;
 
 		/* Don't migrate static entries, drop packets */
@@ -1482,7 +1482,10 @@ static enum skb_drop_reason vxlan_snoop(struct net_device *dev,
 				    "%pM migrated from %pIS to %pIS\n",
 				    src_mac, &rdst->remote_ip.sa, &src_ip->sa);
 
+		dst_cache_reset(&rdst->dst_cache);
 		rdst->remote_ip = *src_ip;
+		rdst->remote_ifindex = ifindex;
+		rdst->offloaded = false;
 		vxlan_fdb_notify(vxlan, f, rdst, RTM_NEWNEIGH, true, NULL);
 	} else {
 		/* learned new entry */
-- 
2.54.0

