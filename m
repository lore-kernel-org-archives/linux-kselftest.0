Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E252318ED7
	for <linux-kselftest@vger.kernel.org>; Sun,  2 Aug 2026 20:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702311; cv=none; b=l9eXF0Rq9F6LBT0a8EtNiNVBgIJBG3HvbxgIOxFNzJXLPpUqSORUB1+SWmMwTIb1DV8UBpML6/n1g17nDSOps8OIQR8KJqA6rNqmZW19Uo2JKYdrtQH1HgTaUeskuVlpDf/g1fF66peKXtCoJ5koLIEa/qm0+9bp/h1OhpS8uNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702311; c=relaxed/simple;
	bh=t+wNgK5pWkodZMpENG/HFFh/wGgVK+guUXkQGCLdJe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qaqlHGOueyhonXwLYmo9s1czGtB3ZbKJAKHfFGbqnpmyBzD93tpsK+lJYGr1EtmD48b1+w2PqEwpLWQ4NhqgY6MbMH8XBm70TgVb5Nqo/0UuwtQtI/VOViOiSQU7JQKs6DJTKtFkcZyR7/lp4Zbw3vLWtVSDdi2K3ATwjcezmac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loVyY7KU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loVyY7KU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-496c5280812so419575e9.0
        for <linux-kselftest@vger.kernel.org>; Sun, 02 Aug 2026 13:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702308; x=1786307108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BOTNDYCh7zvkHHeJw6yM0wB8e5xxO6pLFuXcfQFg8Ms=;
        b=loVyY7KUAdssF1LXALCNvvI2I+OF48YKZmcyZCfmEzLN5UlkBIN9lZRdof5T7PVTlC
         VqAqrW9grKRCbhMv+7l4SDG6wLAZ2TRU25L9WUFSPFM7Fd6pI0xybYeZgSNQVLEGcAJx
         CUgMZNtVkA0Mu298JwTsRLtiKSZ7Oyg/aVCusD9yCAqbUUcMLTtECY9ZlmRs+jSdOErs
         MwJMjT0qdZzL5NDcWdMI0KJ0gonyxtnEdCCA4BDcpSPZPK8STdxKMb5y5mcCfBCQYDdj
         kbCcsTqE4qN0XZilvPStGcMkGgd5aYxk9nPXfzGEkmht9WJAXN5bAp/q/DXLV5qgzjG3
         Ch/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702308; x=1786307108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BOTNDYCh7zvkHHeJw6yM0wB8e5xxO6pLFuXcfQFg8Ms=;
        b=MZf1YnS56FvhtMX1xSmLYZBxgU/LdE06iqmmXFQl+cNQdaPVOZgidIokw5FTCUgUI8
         u6+KNmypCXytgc+sjLuAd4N5GncSS2DXt8yYenHmlwkuq1pZ2MZI2K9lNpxVI8YcB+e/
         pfPPbd/B0dzqM1HAn9v0gEv10vEULFX+EDiKr5FS6V8UT251kn1j/vlR4iekLIRkNaFK
         5v1BnKfFrVO8K/040S+6KJGRsn+lLeCZraJwdR6OR6/DPQmOSJj2dsS0FnhWEjk5O4Y6
         YhW6+7jHzT7N9YyAEj4VfMJ+yQs0KE9aQ1+7ViKFQN17gOaqDrYwogbAe0qv9U98MWjf
         yo4w==
X-Forwarded-Encrypted: i=1; AHgh+RpdP6b1vIasCGlljYtHUI7U9eQqgO5u3jCvw6nz4yS9DIPBUM6Y28aeSntTezjF/ieQdhMTdBUbFEzdVAruwrw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaY0ikyYc7M2Ji7bQNvCsGtU6yM0wjuzDqB/SiVpN2CNb51yfZ
	zlwn5n0Q3wvDFrFtGh1O5I5PKIfhWiXdbx8x2NY6HJvuMj2BFm+2woQQ
X-Gm-Gg: AR+sD11HNODtELtg4OATJmy9UtGq36XWDSLc//3PAyzWHuCrc4+S87O7YJMEU0Q6Vg+
	Yj9L7BBJ4WsZzYNJxap7EJ93DLt7Y4XyRocTJqKyloXVLs4ihZxuhJrXRVN76Hcd93l3U91v9G4
	FeisZLtKeuHQ1PLPMZ3c6CF4b4/efafYwJs1FGrjxS/Y8V+cy9pNNghCc7yZ8V8uQn4fWuQ2Pco
	x7NqIQWpybvGzI7mVTSQdsHi9hVutyTWSnzMuVuKLaTJqihKFEdsEa1prVTJD47i0MBLkRgR6mg
	h6qMszQG4OaTCBQNcTiKcEw8K02gIITOnhi9+Cz4YyEukdkWd63nOcQIaLF4S/QE8UW7K4DAzT3
	cW+O3cKCk3Jz6MiZqlGv5oJeh4X76nTuZby4Z/Rw6l8+y534HOCAdLQBdtaZR+N4C5nz3JO+JEP
	5sR4a8kxGKRhotLi8hzJu6aAT9HMb7CFmGkGwTBM/TXQKxjMBu2YUpET9fbkzANt916XwhRgOMl
	xKr49u2kKN2pZ8E9a9or5Rn94WJMso8hdf8JAd+KB4K6gntztNThVByyNAnLXZYxN0HggyCIpYF
	2FkZ4K8X01hHeBZvaFI9
X-Received: by 2002:a05:600c:c494:b0:498:8e6:d463 with SMTP id 5b1f17b1804b1-4980c657c57mr75721695e9.1.1785702308193;
        Sun, 02 Aug 2026 13:25:08 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-078-051-143-142.78.51.pool.telefonica.de. [78.51.143.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b23f6fsm132234365e9.0.2026.08.02.13.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:25:07 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: edumazet@google.com,
	horms@kernel.org,
	shuah@kernel.org,
	lukma@denx.de,
	m-karicheri2@ti.com,
	fmaurer@redhat.com,
	luka.gejak@linux.dev,
	bigeasy@linutronix.de,
	ali@iusegentoo.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net v2 1/3] net: hsr: privatize interlink-bound skbs before address mutation
Date: Sun,  2 Aug 2026 22:25:02 +0200
Message-ID: <20260802202504.2962-2-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260802202504.2962-1-xiexinet@gmail.com>
References: <20260802202504.2962-1-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On an HSR RedBox, frames forwarded to the interlink go through
hsr_get_untagged_frame() and arrive in hsr_xmit() as
skb_clone(frame->skb_std). Two reachable alias cases make the writes
there unsafe:

(a) A tagged multicast or broadcast frame received on a slave is
    also delivered to the master through another clone of the same
    buffer: hsr_deliver_master() writes the node MAC and hsr_xmit()
    writes hsr->macaddress_redbox into the same six source bytes, so
    the local stack receives the RedBox MAC instead of the
    originating node's - deterministic without backpressure.

(b) A master-originated frame forwarded to the interlink aliases the
    original TX skb, which packet taps or the TX path may still hold.
    The master-origin substitutions (hsr_addr_subst_dest() and the
    outgoing-slave source write) and the RedBox rewrite would all
    modify that shared data.

Privatize the interlink-bound skb with skb_cow() before any address
mutation whenever it can alias a live consumer: for all
master-originated frames, and for ring frames the master also
consumes (is_local_dest && !is_local_exclusive - the exact inverse
of the port loop's master skip rules, so the condition does not
depend on port order). Every interlink skb reaching hsr_xmit() is a
clone from get_untagged_frame(), so the selected cases always pay
one private copy. On the hardware tag-insertion path, the selected
master-originated and locally consumed ring frames are now isolated
before the interlink address write: the interlink write can no
longer change an already queued clone of the same frame. Ring frames
the master does not consume (is_local_dest == false, e.g. unicast
ring-to-SAN) keep the zero-copy path; aliases that already exist
there - for example between the interlink clone and a peer slave's
hardware-tag-insertion clone - are pre-existing and unchanged by
this patch. On allocation failure the frame is dropped with the same
accounting as a tagged-frame creation failure.

Fixes: 5055cccfc2d1 ("net: hsr: Provide RedBox support (HSR-SAN)")
Reviewed-by: Ali Ahmet Memis <ali@iusegentoo.com>
Tested-by: Ali Ahmet Memis <ali@iusegentoo.com>
Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 net/hsr/hsr_forward.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
index 0774981a65c1..67aaf5a8622b 100644
--- a/net/hsr/hsr_forward.c
+++ b/net/hsr/hsr_forward.c
@@ -420,6 +420,22 @@ static void hsr_deliver_master(struct sk_buff *skb, struct net_device *dev,
 static int hsr_xmit(struct sk_buff *skb, struct hsr_port *port,
 		    struct hsr_frame_info *frame)
 {
+	/* An interlink-bound skb from get_untagged_frame() can still alias
+	 * another live consumer: for master-originated frames the clone
+	 * shares the original TX skb (which taps or the TX path may still
+	 * hold); for ring frames the master also consumes them when they
+	 * are destined to the local node without being exclusive to it.
+	 * Privatize before any address mutation.
+	 */
+	if (port->type == HSR_PT_INTERLINK &&
+	    (frame->port_rcv->type == HSR_PT_MASTER ||
+	     (frame->is_local_dest && !frame->is_local_exclusive)) &&
+	    skb_cow(skb, 0)) {
+		frame->port_rcv->dev->stats.rx_dropped++;
+		kfree_skb(skb);
+		return NET_XMIT_DROP;
+	}
+
 	if (frame->port_rcv->type == HSR_PT_MASTER) {
 		hsr_addr_subst_dest(frame->node_src, skb, port);
 
-- 
2.43.0

