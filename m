Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774973;
	b=vi+iO/IQnMHdD07uwG0jF82AAIgVJRTv1s24uEMmdy7fNH59+gI6u59Rr/c4zBoF2lL6
	 cEHkRFkX01YyLUkdUOuh7WR1VuaeU1/SWvaC7eAYrAWv9UBS5mcfOsxKLxku+8CRxFkhs
	 /zn93RUCQ6p6p870np0XhFTcn4BldA/0iseP4ycjnjkZnYm5C10psa09fbm3ITzcczZrW
	 0A/2a6f8rax7eorkx8BjQRwAc8qCaCH9iz6jkRpgp3C3v5ViEc/9pkK6hc3kLSB2CERSV
	 7kNgcJLUa8JTDASZkxADJyCo/ll61DFThNL/sK9Txtu8TGwh0uo3zLScRBe10YqUCAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I8jZKLvyVFU/3fMfQszx3S+AK4kpCDpBdmM0K1CgiX8=;
	b=tzIsUlDVh7gy2d0+RdyhZcYNAZ5+cb0Gty1m0+99L0jFdSxJIBpKGaW7aztt/BFsSxJx
	 felwXn0KBN2vhom17X/h1iGpGIj+QbizYHUh8zchRv/pcdhvm4wZiIebza3YhBe1c0Y6K
	 LAs68vX+4583qKT3ziO6jEnQCIs76i/JiEYEibuubrHBpcO94z81MvblsrX9dBjbXtRER
	 GRbXcaJRlXmocrHmIs8zosVqo+EWBABG4My/WNmLBa9rU/8j9oDJuC+TDO7wCww07+EU6
	 JrzKj2YhHCMpiq67i1LGxqwDYLt/5Gdh0VqUoxco7TaNuLGgFCTskTm0dhnDvDWcxAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iUfprVmi;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7FF606A6A7
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 10:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB7FF606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iUfprVmi
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6bb06dc1fd5so5499149a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 02:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774967; x=1796379767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8jZKLvyVFU/3fMfQszx3S+AK4kpCDpBdmM0K1CgiX8=;
        b=iUfprVmi1p2iZpSWamAre+Ca+1GLQ/sm48kJML9FIQ3AZbFfn9jwnrSf9AmcH21p9/
         wVigRP6lTz7WJi7gw/Su/ldnTrvtUSjIAIVEJ+BvJTPt0FPwVhDaGM1LuXt1njMDmcv3
         aFskoRgHNMaqMVg1R+5xrNRJg/8X4qh89yRySLGt09Hd/L9UtHj6JoVOE1GQWhdqHXam
         KVgDDgteoMjw0gIf+9asFXlcgBEbpNN+klZcLXRVWZaCF8AJ/fE/pyNVPk6oiDWPJd7W
         GxssRG0SVOvp7BgXaXHbwWVs3RP/UbkOMZa3U9LksCubGHx8MD8nkrtg4QAJfOQytS/I
         yCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774967; x=1796379767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I8jZKLvyVFU/3fMfQszx3S+AK4kpCDpBdmM0K1CgiX8=;
        b=jgOR18VWpyhgZo++u6W76GcKvhKfGtvijmpL6CBmHAtYQ+DuWXnqswg7KBtSJw8jIq
         mQMZGYxrDxBexPNqpMCL3RBXVKUtABZkXIJoHr80Kp0xKa5ZtW9SUfeCKhNWUfMY2IdS
         mvn2IcrWo2A5ExubBztPezN+7mNks6Bt0jsK7Z2CRYc5QLhy7R0p8gxbRQdBgyL7pFjq
         Fyl0iJpd9jx4LNhlenFg2u5oXUM+g5knjsD/IMBylVt/TBdk5GPzzqcgrwB4frY8bXbB
         bBz9fB56iVHaocKqYhfMw4iK7heCZVxyDB0k5/RieYmMZbPO0SPyQ2nMqZNsflN+C4t9
         mJYw==
X-Forwarded-Encrypted: i=1; AL+hErGc8WjbD6JFjNDuT3o1LDB0Lp/FIBXAvOb00vXZJ9B9DJSx5kfrPQ8jAWbM45QX2UPbwztBbduPAlUylaobcI0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8alylN9WeYKI8PoX6Fx74moCAnSUWFEXmZLAqF6V0mjD1jzyNh
	sF9HYEkHw+6pWK6+fQIj6ax/X0MQiE0thULgtHBtSozTthTKC4NKTFzS
X-Gm-Gg: AZFdTZcHXrkZpl8fZ4dwRvJn3t4+m3isdZGijwmqlsydlwe7Exc8eDzQTR7TENiIrYQ
	chHaLsfTjnC9Qdp/cV4L3FUHEci7xtp5XM9emtQLA6UiiJRyZ1xRusl0LCnoVspvFHUgyMYa+3x
	kQzwqfmEIaFgyoitcXfCqLqgIyOLj/1DtKhW+/+G02LeXNZ7GRMNeTT9UkNiTJORA3/Zmxsxgvt
	295n3Wep9qnBgPioCfz5f7ncpdYMMLsx0vsX0QwjvZHfy23J2yN7RQMtkAm9H4+JLsPFbcLCnrT
	wE07+GIzCpCtCvsPI7bt45p70Sd9ylozdE2QXuU/dEgQ/JCbXCE5epmualkFuloFdWe23nFfpcE
	V6ApEjwDz5WzKfjHSz6vAEzyUcz1+7iIPatyRT36TvmRyTwmyVEvs34nqbQipd3TTL33Bn/4Tmq
	0PDr238c321LG5PgHSxrNafA6fTcDBHiPj+lpp4hoKn7SM4ZrgJ51FSi4ccuCe8LghQamZaGUtQ
	92YqF+xdUUpoFPP1THk/I+I7dpnECMxrJQexsMBYgja+zfQObRgKIbg9g8MXtv1igQPnkeSNMTl
	9gA55Pcmzqt6NYbkbXsAi/ACxyuf40rZKuT2C24VFIw0yOwU
X-Received: by 2002:a05:6402:1d4c:b0:6b9:c43d:893 with SMTP id 4fb4d7f45d1cf-6ba37ee46b3mr18117759a12.35.1795774966892;
        Fri, 27 Nov 2026 02:22:46 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm10886407a12.9.2026.11.27.02.22.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 02:22:46 -0800 (PST)
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
Subject: [PATCH net v3 1/2] wireguard: peer: free packets left on the receive queue on removal
Date: Fri, 27 Nov 2026 12:22:42 +0200
Message-ID: <20261127102243.49405-2-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127102243.49405-1-apasichnik9@gmail.com>
References: <20261127102243.49405-1-apasichnik9@gmail.com>
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

Free what is left on rx_queue once the NAPI is gone and nothing reads
the queue any more. tx_queue needs no such step: transmit_packet_work
drains it without a budget, and its entries keep the peer alive until
then.

Hit on a single-CPU MIPS router (Realtek RTL8196E) in everyday use as a
WireGuard gateway, then reproduced with the WireGuard selftest VM (x86
KVM): remove a peer while a UDP flood keeps its receive queue busy,
re-add it, bring the session back up, repeat, then run the selftest's
created/destroyed object check. With 1 vCPU the unpatched kernel leaks a
peer and its keypair in 25-40% of such removals ("wg0: Peer 11: merely
created"); with this patch, 0 in 210. The next patch adds the loop to
netns.sh.

Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
Signed-off-by: Andrii Pasichnyk <apasichnik9@gmail.com>
---
 drivers/net/wireguard/peer.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireguard/peer.c b/drivers/net/wireguard/peer.c
index 1cb502a93..6bafe5724 100644
--- a/drivers/net/wireguard/peer.c
+++ b/drivers/net/wireguard/peer.c
@@ -91,6 +91,19 @@ static void peer_make_dead(struct wg_peer *peer)
 	/* The caller must now synchronize_net() for this to take effect. */
 }
 
+/* Each receive queue entry holds a keypair and a peer reference. */
+static void peer_purge_rx_queue(struct wg_peer *peer)
+{
+	struct sk_buff *skb;
+
+	while ((skb = wg_prev_queue_peek(&peer->rx_queue)) != NULL) {
+		wg_prev_queue_drop_peeked(&peer->rx_queue);
+		wg_noise_keypair_put(PACKET_CB(skb)->keypair, false);
+		wg_peer_put(peer);
+		dev_kfree_skb(skb);
+	}
+}
+
 static void peer_remove_after_dead(struct wg_peer *peer)
 {
 	WARN_ON(!peer->is_dead);
@@ -108,8 +121,9 @@ static void peer_remove_after_dead(struct wg_peer *peer)
 	/* The transition between packet encryption/decryption queues isn't
 	 * guarded by is_dead, but each reference's life is strictly bounded by
 	 * two generations: once for parallel crypto and once for serial
-	 * ingestion, so we can simply flush twice, and be sure that we no
-	 * longer have references inside these queues.
+	 * ingestion, so we can simply flush twice, and be sure that no crypto
+	 * worker still holds a packet of this peer. The per-peer queues may
+	 * still hold packets after that; see below.
 	 */
 
 	/* a) For encrypt/decrypt. */
@@ -122,6 +136,13 @@ static void peer_remove_after_dead(struct wg_peer *peer)
 	 * here from process context.
 	 */
 	netif_napi_del(&peer->napi);
+	/* A NAPI that is being disabled completes after the poll in progress,
+	 * even if that poll used its whole budget, so rx_queue may still hold
+	 * packets, and nothing reads it any more. tx_queue is left alone: a
+	 * transmit_packet_work queued during the second flush may still be
+	 * draining it, and its entries keep the peer alive until it has.
+	 */
+	peer_purge_rx_queue(peer);
 
 	/* Ensure any workstructs we own (like transmit_handshake_work or
 	 * clear_peer_work) no longer are in use.
-- 
2.43.0

