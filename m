Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686452;
	b=VXeGhsBZI6Le84kwvWIjHecmqvuYKcPjke8E8QMiMEjwuk6c2hlUGHC0t0rflqGyIlXS
	 VEP2FVh0kxsc99wtZVrKieoB0UBlAXdjpLcEjkhnZa8mZY4hiNAxOcAAlXRXT5e52yzhs
	 tTGxLUZbXGUQzdw0dDQVxCgWveO3p2OIP6t7NRoIQM/5ogoLOvZeMoiYm5Sj9pgsIPjrw
	 HCQCMsahDX7q88IS3AOCqZo5gYa5ignWsjS4CSJOyMXVbarHo3hBSPLWLCO1lj9EzoqVk
	 nl4ZbOdzt2mpRAQBypIcEmBiMYl0EfDQv6JB3zF5HYGtj3wcyXipTMT05Z5RbjCK5Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ebxm1DL45nJQcO9+sb8DXg3JXXQ3y5h9iFkKaPDLveg=;
	b=YOg22lyaR3vqd9prFepAJBRfd8qcSFRMXkVWB5fkoeVcdU6N3IpGnlimCN5aVsgcjDMR
	 OtcHuiDpiALzyP3PQOMNENzHvyCuNwoA7aCtoS3WXdXxMIbWAg/hQbZQ68V7DP5ZP5uzF
	 oG+aWmOLp3b+xJTV0uWme0oxa+x2HRnx0itZQGTBXRxp9q6YkBznEQ1n4AQZ2AifJaQZD
	 Wyhl/MrMsV4ENHrcDPp2EZLwrr9sRhOM8Lwk1q4x+ZNV2GZP3FA2FUMo4ry9i5VdVr2cC
	 lVtVzXoJ8//QqITJwtcnCuA7ck2wYGh9aPu4Xs/g8DUG+HApZWEgTfsB5e49lb1L12w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gGKJDkKI;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF834606A32D
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 09:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF834606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gGKJDkKI
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c51bf011392so135000766b.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 01:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795686450; x=1796291250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ebxm1DL45nJQcO9+sb8DXg3JXXQ3y5h9iFkKaPDLveg=;
        b=gGKJDkKIKrjS/e3C0IpipinDtBBDVlS722h1FfEacoDIYwVLYuzltZxsazd3qs8OoQ
         fUyErCNMV+QWTsLsFx+J18kWkZHo5IIWOmfm1owGHLnOcE6RtBeC2I/TFuX8VSB9zohz
         YssXA3pkNplcxGq2wPU0a1+BTtmeZhWx+R2HYStPUwc6W716E+imrw95RIweGW4H27GX
         KxsYVlovMjn7CeyYLC0wE191Pq68TIUxuQl4JD/S0D6La2OBUKjF8GSPbeNOy3z/lnMe
         Cm+OUgYLyJ6981J3W1kSlz+miMoDxpKzU6IMHLU0iSvBldwvJ0lLIAKOtYxuMhOC+Cs1
         3mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686450; x=1796291250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ebxm1DL45nJQcO9+sb8DXg3JXXQ3y5h9iFkKaPDLveg=;
        b=zT2T8jKbONuN/SokQRj1Yoipk+NUo7qvT3w8F067TaeDxlMF0ngM5MbaW8xU46Hakt
         IdGSVYR5/QaGzbnD/JT+NzcYfiry/PSxYPkMRaknCBXkOp4GZFXajPVHTAwrZemdbrFz
         e2fmofnBfHjZ8VpHHd2GUxu+6IxEnYkQ5E+qJAppzDxmJ6abIUV66i3SumxkwkvKIQDU
         rlrN8+WyCoeR+4bSWpU/IYrZnv4lRkBG5NkEcOXJNrDYnHTLAKb5Rc1bIqmKnBTTQiH/
         aMdcNEjmScII8YrCIuAqTQhrXuz0sy8cA4XbZl11i+eIdyKNXaF1+++ScyDG0jt/UyzH
         /Sow==
X-Forwarded-Encrypted: i=1; AL+hErHKMEVW3I7BQQSgx/3zfYYU9jkFdnZa2Jb0X7JEarlfISnBuEShYyIWucz8733Ub6nr8sRfjd7rLybzjF2KQlk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VvUqxrTMf6kdXqpE89PZ6C9x3PcxFEc310QF13ZkuFGPd6vdZ
	36im2Sd7o+OO7iKYPxex3f0UCV9PVcBC8JFtSOd6AEUb1Fw/7KV5PXW0
X-Gm-Gg: AZFdTZdoD/waC5Lz8l0yOXWVLNYj+E8NET4vtLHxrzxBc5Af07dL9sPD3AIW1JkjjFg
	LxU2QjYVI+Q18U2tvw/H678o/8l1y0Tl91WlNhLd7Kd9wVb3iJmEAJX5HSUvu9qKgVI3wH7vj8H
	mo32tsBNN4dLbPWmJVlj3v+D7xvIprho8lqtRCaWlz1Xt8+uxOb0E4KJ2Skuec8v2GP99BzpPGw
	dg/Io0WCXbNIUK4NPt19MCeEbUqZIWWwSCFQoPxW0L2HTYIy4hAZ0VDEKhCXAouqC5mm04He+F+
	k6wmRPkfjwSvROefUTiMrYUUGTRxZ4fCyKCVUH7AA7IB/9ft/whuOz/1P0Hm0vgYIqfMncoF7py
	bkuXdxEU5B/9gdLC4rdfwYrf4NduVfEEPvM7L+EmOznnNksAnQUQvIG7s+QtVvzzxx4Z9f8WK6R
	OdmDTJSN1wHLodQQbLKW6Wf9wk7HdQTY23ajoiE7+igwELEZ+xxNaQDNWDm6UamTtS/tU+c1xtS
	zJwZMiyJzMy0xqaZwyHvg6ggikkjCN3xvCQ1uXAj9BOKKlfCmNJDLk+qHFZ6p+m21TNSdx8dIic
	7YaMOCmHW0vm5sf5791sCa2LL3GA8fux6rBKyR5nlbsFR8k0
X-Received: by 2002:a17:906:c10e:b0:c41:5e31:5184 with SMTP id a640c23a62f3a-c513a99abe6mr1685897766b.13.1795686450072;
        Thu, 26 Nov 2026 01:47:30 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b002b9fsm727100666b.78.2026.11.26.01.47.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:47:29 -0800 (PST)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/2] wireguard: peer: free packets left on the per-peer queues on removal
Date: Thu, 26 Nov 2026 11:47:21 +0200
Message-ID: <20261126094722.73025-2-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126094722.73025-1-apasichnik9@gmail.com>
References: <20261126094722.73025-1-apasichnik9@gmail.com>
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

peer_remove_after_dead() flushes the crypt workqueue and then disables
the peer's NAPI. Once a disable is pending, __napi_poll() completes the
instance after the poll returns even if it used its whole budget, so a
peer removed while more than one budget of decrypted packets waits on
rx_queue keeps the rest there. Each entry holds a keypair and a peer
reference, so the peer is never released; the WARN_ON in rcu_release()
that checks for leftovers is never reached either.

Free whatever is left on both per-peer queues once nothing can feed them
any more: receive entries are single packets, transmit entries lists.

Reproduced with the WireGuard selftest VM (x86 KVM): remove a peer while
a UDP flood keeps its receive queue busy, re-add it, bring the session
back up, repeat, then run the selftest's created/destroyed object check.
With 1 vCPU the unpatched kernel leaks a peer and its keypair in 25-40%
of such removals ("wg0: Peer 11: merely created"); with this patch, 0 in
212 removals. The next patch adds the loop to netns.sh.

Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
Signed-off-by: Andrii Pasichnyk <apasichnik9@gmail.com>
---
 drivers/net/wireguard/peer.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/wireguard/peer.c b/drivers/net/wireguard/peer.c
index 1cb502a93..3e08898ce 100644
--- a/drivers/net/wireguard/peer.c
+++ b/drivers/net/wireguard/peer.c
@@ -91,6 +91,25 @@ static void peer_make_dead(struct wg_peer *peer)
 	/* The caller must now synchronize_net() for this to take effect. */
 }
 
+/* Each queue entry holds a keypair and a peer reference. Transmit entries
+ * are lists of packets, receive entries single packets.
+ */
+static void peer_purge_queue(struct wg_peer *peer, struct prev_queue *queue,
+			     bool lists)
+{
+	struct sk_buff *first;
+
+	while ((first = wg_prev_queue_peek(queue)) != NULL) {
+		wg_prev_queue_drop_peeked(queue);
+		wg_noise_keypair_put(PACKET_CB(first)->keypair, false);
+		wg_peer_put(peer);
+		if (lists)
+			kfree_skb_list(first);
+		else
+			dev_kfree_skb(first);
+	}
+}
+
 static void peer_remove_after_dead(struct wg_peer *peer)
 {
 	WARN_ON(!peer->is_dead);
@@ -122,6 +141,11 @@ static void peer_remove_after_dead(struct wg_peer *peer)
 	 * here from process context.
 	 */
 	netif_napi_del(&peer->napi);
+	/* A NAPI being disabled completes after at most one more poll, which
+	 * may leave packets on rx_queue that still hold references.
+	 */
+	peer_purge_queue(peer, &peer->rx_queue, false);
+	peer_purge_queue(peer, &peer->tx_queue, true);
 
 	/* Ensure any workstructs we own (like transmit_handshake_work or
 	 * clear_peer_work) no longer are in use.

base-commit: e509726660dd06ce107437aecf7c106c9d3fc1e7
-- 
2.43.0

