Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794022483;
	b=McA5DmIbbqM28j168d69j8P1r5qCoSMPxUDbeyojduQOxXnzxXzahQ2ZOps6zFNSYed6
	 Q19yQjJrMG4uK8EocS9IWeD841tKPGSV3ReyFsQDeqBNc23l3VPykUfXCZ9DIb5FUB7Bl
	 pWfK8XTUbcoFPvmVApLvOiDQZzs7d9O/XJ3uXwAnwOvlYT0NauAXfgFOF2VBzHPslfSMV
	 IF5dMF/gNH/sf1VBBgJ5gl+at+PwqEljfzlOhqls9B99mV23CAUQjQbLAGL4+N+zRVF/x
	 +4YK/CECjRc0qf6M5UGiPRndjgQKt8YVVxpBqg6K+2pNFV3zg6y6Kec+oGYu5h73izA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794022483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RrV5iqN0VATzlL9Eoq00NFZhRYz4qlgHoomWQEo1jXw=;
	b=4Jr2qubjClVcT5M8Hfk6AdHTGNOiqDkpaNmJ5RJLA8JRBK47myXYGCZPmZJXZzl2+RVW
	 PgBJTmYxe8KFeQjOVRqhF0I3wvWnR9aFAKVhq4tC5n+MyNuh6qruJWzzGxkvOUsVR/EX8
	 gT+jHXH4oW1bxY3WCyMCavqYJonTN55BID+ZjDCAZxZPrcHZB+W4tqTkueRMC9YJXCIrB
	 xM9LcshGNp7NosW/eH1eao2MUWf9E9dwiTMKz7MtDV36buAKjCAmmcOJdTxsD3FOnX+1g
	 qCA8uc27keB3MEVju57TeqhSIfaDcZMWzzIXD5olHy/FEN5EOoK/1eJvXqXedlr0tuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=KlfMre+Z;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0017C606A33B
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 03:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0017C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=KlfMre+Z
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d30639709so164214566b.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 19:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794022481; x=1794627281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RrV5iqN0VATzlL9Eoq00NFZhRYz4qlgHoomWQEo1jXw=;
        b=KlfMre+Z7nZjGpdNNmAPYVnUnKeDa/tY8JSsFzeVfl6aMAVYrLnVC3du54uvFKSS9c
         P8J4+HTghaSxCZIsjLlI/EkKBQKWp0Q9y1scjI9Gcwy9B8MiRrgRQDVkLehJCDxphYVB
         PxZxHDH+4F1fjxkly/VAdKsj8XMZKIIu/0QzDTmIOJvfof0X86ZgFFC255Ge5EjNWDhs
         nOarth4F32zcMsyIgMPCIQf3HDLEixgCHGwPlEmvjpsOvNRy/eZzFPucwYw/2C52CyaM
         EMv2Z4NlrC3ayy1Asf+0xf66clln+V8I7XEGPheqMLf6YYl+j7wbBk2Pf49mO7sEZa8N
         9TTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794022481; x=1794627281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RrV5iqN0VATzlL9Eoq00NFZhRYz4qlgHoomWQEo1jXw=;
        b=WrhDV1KNfiiJYKT/gCQDs6/4UgnwikZ/mgDewW1yKD9Vl6zu45R10zkDvaOUYUpcKB
         dZiX4Fv7th16MBbZ+vc6N0uj5/yRq9u0+nhAE+e+z8FmIpdLCoDE+TUI2Kb+VLv5ceHK
         EtvFe6l9TNp4zsF1pXvBTxmdSlO5EnFhrxbEn+6qYl5NbmeDmzgFOZDpIMwSeMxAAA93
         sRw3RHHTau6kmTX3HxXbeYsfvPbH/hrC2wjJecQWF9xolNfQbmjRL8zET9bSIzwx135D
         92oz2hIAI7CpGOoAQs53Gg7DWB1ziY5mvIeHzjUUTJ9BW5uZ5Awnnie3xm9bBFGRHxmN
         fDww==
X-Forwarded-Encrypted: i=1; AKwUvByIGVe0+qTbRAwPeDY4YDdNAxIIfOGj4nv7T3aahaQdrW7ZOZfuG8VVnxnRyZMPidCuuie2OQTKafM7tOP5u+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KCqHQzA13jsnG1dV5VFGryKcPPtOBo/9fCbIxNueEEbPWoQKI
	1ljQnhqJqacgVhNaG95gNAOgM3T1SBia8gAIguj7TBdGoWLyN5ag4veL0RmgX5HEIjM=
X-Gm-Gg: AYBFou2eZPxUIU97SGdoz0SpAqoh9fXSZMYaKPbvQnsRA5rUQic5TWOHTIsSRsHZIDH
	GWLgMh7UFSlvoGxceQRVNoSJuSvbqXd5VyOabnytKJrYGOq7L339mnpn/DTh1wGg4Fd8jrlDKCc
	4QGovEeGJy6ljghuIFxCVfcvBw5GEjrMcMKL5D9OF1EGiIfEM1cW7Uc1d1IDsflo9SemQG7EKTg
	v19b2fctRvthY3NakMDxUf/rnpnbwcz0lwQ54rtEbVGxVaPFtXez9W+E7NmiFtOYlT+BpewTGFw
	RX8arY5OUjzeT3zbDBT2JHm76JYLZTzeAYk0GwiYVuV2Sm6QE2efv/BTQW7zvetN+TYAML5CN2m
	gtlB4DQQ5ApMfir0QrZKZpUrqs/ugaLAAqXTwFGGJzNcgUW4Oj1EGbOPPSRuATU4JAcSx4NZpBO
	i2kAgTmaY0nIoEVR/L963vxf/h3ACxN6j4WbQNjX8coIi3XtszeoUfBF/9qevVVwe9idJFrPQFz
	KVSwoapmWr64aDMLpZgv5EBJ+mgVJ6NHUR/BneGDy/Hn88LN+LmQgAEKF285y9q+yzz0qdvPgz5
	+9mT/AtZfETT/fYDII8gbK7ZgRJ5dsmb6BUAaWQocqOhLJkxmH4c5yAmndbECv4=
X-Received: by 2002:a17:906:9f92:b0:c3f:dce3:20c5 with SMTP id a640c23a62f3a-c4d34c9a760mr362334466b.44.1794022481458;
        Fri, 06 Nov 2026 19:34:41 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3562e00dsm121104166b.21.2026.11.06.19.34.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 19:34:40 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	David Keogh <dkeogh@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Nimrod Oren <noren@nvidia.com>,
	Alasdair McWilliam <alasdair@mcwilliam.dev>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Danielle Ratson <danieller@nvidia.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com,
	nh-open-source@amazon.com,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next 2/8] net: reserve extra TX headroom for local egress
Date: Sat,  7 Nov 2026 03:34:21 +0000
Message-ID: <4b2f20b9a7bcca58fced690d20916efab55ad31a.1794020868.git.tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794020868.git.tianyi@cloudflare.com>
References: <cover.1794020868.git.tianyi@cloudflare.com>
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

From: David Keogh <dkeogh@amazon.com>

Use LL_ALLOC_SPACE() and LL_ALLOC_SPACE_EX() instead of
LL_RESERVED_SPACE() and LL_RESERVED_SPACE_EX() where the stack allocates
packets on behalf of a local sender and sizes them for the output
device:

 - __ip_append_data() and __ip6_append_data(), covering UDP, ICMP,
   ping and raw sockets without IP_HDRINCL;
 - raw_send_hdrinc() and rawv6_send_hdrinc();
 - the three AF_PACKET transmit paths;
 - AF_XDP copy mode, which open-codes its own calculation from
   needed_headroom and now uses netdev_tx_alloc_headroom().

These are the main paths where a packet's headroom is decided by the
device's advertised requirement and nothing else. Adding the
administrator's extra reservation here means such packets reach the TC
egress hook with room for additional headers already in place.

Paths that check an existing packet against LL_RESERVED_SPACE() and
expand it on demand, such as ip_finish_output2() and the tunnel
transmit functions, are deliberately left alone. Using the larger value
there would force a reallocation of every packet that lacks the full
extra reservation, including TCP segments that already have enough
room for the headers an egress program actually pushes.

ip_do_fragment() and ip6_fragment() are also left alone. They use the
same value to check the headroom of existing fragments and to size new
ones. A larger value would send more packets to the slow path, which
copies them. A local sender's fragments normally come from
__ip_append_data() or __ip6_append_data().

Signed-off-by: David Keogh <dkeogh@amazon.com>
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 net/ipv4/ip_output.c   | 2 +-
 net/ipv4/raw.c         | 2 +-
 net/ipv6/ip6_output.c  | 2 +-
 net/ipv6/raw.c         | 2 +-
 net/packet/af_packet.c | 6 +++---
 net/xdp/xsk.c          | 6 ++++--
 6 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
index 3396f177a18d..bf718b8f6f1d 100644
--- a/net/ipv4/ip_output.c
+++ b/net/ipv4/ip_output.c
@@ -988,7 +988,7 @@ static int __ip_append_data(struct sock *sk,
 	mtu = cork->gso_size ? IP_MAX_MTU : cork->fragsize;
 	paged = !!cork->gso_size;
 
-	hh_len = LL_RESERVED_SPACE(rt->dst.dev);
+	hh_len = LL_ALLOC_SPACE(rt->dst.dev);
 
 	fragheaderlen = sizeof(struct iphdr) + (opt ? opt->optlen : 0);
 	maxfraglen = ((mtu - fragheaderlen) & ~7) + fragheaderlen;
diff --git a/net/ipv4/raw.c b/net/ipv4/raw.c
index 9d01006d8189..a1e72e634d0e 100644
--- a/net/ipv4/raw.c
+++ b/net/ipv4/raw.c
@@ -355,7 +355,7 @@ static int raw_send_hdrinc(struct sock *sk, struct flowi4 *fl4,
 	if (flags&MSG_PROBE)
 		goto out;
 
-	hlen = LL_RESERVED_SPACE(rt->dst.dev);
+	hlen = LL_ALLOC_SPACE(rt->dst.dev);
 	tlen = rt->dst.dev->needed_tailroom;
 	skb = sock_alloc_send_skb(sk,
 				  length + hlen + tlen + 15,
diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
index 25fe0ba98b1a..a3626d5f0d11 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1490,7 +1490,7 @@ static int __ip6_append_data(struct sock *sk,
 	mtu = cork->gso_size ? IP6_MAX_MTU : cork->fragsize;
 	orig_mtu = mtu;
 
-	hh_len = LL_RESERVED_SPACE(rt->dst.dev);
+	hh_len = LL_ALLOC_SPACE(rt->dst.dev);
 
 	fragheaderlen = sizeof(struct ipv6hdr) + rt->rt6i_nfheader_len +
 			(opt ? opt->opt_nflen : 0);
diff --git a/net/ipv6/raw.c b/net/ipv6/raw.c
index bdea825434ea..06459685ec61 100644
--- a/net/ipv6/raw.c
+++ b/net/ipv6/raw.c
@@ -601,7 +601,7 @@ static int rawv6_send_hdrinc(struct sock *sk, struct msghdr *msg, int length,
 	struct sk_buff *skb;
 	int err;
 	struct rt6_info *rt = dst_rt6_info(*dstp);
-	int hlen = LL_RESERVED_SPACE(rt->dst.dev);
+	int hlen = LL_ALLOC_SPACE(rt->dst.dev);
 	int tlen = rt->dst.dev->needed_tailroom;
 
 	if (length > rt->dst.dev->mtu) {
diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index 8250e6a791f6..8800da612880 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -2032,7 +2032,7 @@ static int packet_sendmsg_spkt(struct socket *sock, struct msghdr *msg,
 		goto out_unlock;
 
 	if (!skb) {
-		size_t reserved = LL_RESERVED_SPACE_EX(dev, hard_header_len);
+		size_t reserved = LL_ALLOC_SPACE_EX(dev, hard_header_len);
 		int tlen = dev->needed_tailroom;
 		unsigned int hhlen = dev->header_ops ? hard_header_len : 0;
 
@@ -2860,7 +2860,7 @@ static int tpacket_snd(struct packet_sock *po, struct msghdr *msg)
 			goto tpacket_error;
 
 		status = TP_STATUS_SEND_REQUEST;
-		hlen = LL_RESERVED_SPACE_EX(dev, hard_header_len);
+		hlen = LL_ALLOC_SPACE_EX(dev, hard_header_len);
 		tlen = dev->needed_tailroom;
 		if (vnet_hdr_sz) {
 			data += vnet_hdr_sz;
@@ -3087,7 +3087,7 @@ static int packet_snd(struct socket *sock, struct msghdr *msg, size_t len)
 		goto out_unlock;
 
 	err = -ENOBUFS;
-	hlen = LL_RESERVED_SPACE_EX(dev, hard_header_len);
+	hlen = LL_ALLOC_SPACE_EX(dev, hard_header_len);
 	tlen = dev->needed_tailroom;
 	linear = __virtio16_to_cpu(vio_le(), vnet_hdr.hdr_len);
 	linear = max(linear, min_t(int, len, hard_header_len));
diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index 781ba46eb152..3ee8ad3fd155 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -1045,7 +1045,8 @@ static struct sk_buff *xsk_build_skb_zerocopy(struct xdp_sock *xs,
 	buffer = xsk_buff_raw_get_data(pool, addr);
 
 	if (!skb) {
-		hr = max(NET_SKB_PAD, L1_CACHE_ALIGN(xs->dev->needed_headroom));
+		hr = max(NET_SKB_PAD,
+			 L1_CACHE_ALIGN(netdev_tx_alloc_headroom(xs->dev)));
 
 		skb = sock_alloc_send_skb(&xs->sk, hr, 1, &err);
 		if (unlikely(!skb))
@@ -1128,7 +1129,8 @@ static struct sk_buff *xsk_build_skb(struct xdp_sock *xs,
 		len = desc->len;
 
 		if (!skb) {
-			hr = max(NET_SKB_PAD, L1_CACHE_ALIGN(dev->needed_headroom));
+			hr = max(NET_SKB_PAD,
+				 L1_CACHE_ALIGN(netdev_tx_alloc_headroom(dev)));
 			tr = dev->needed_tailroom;
 			skb = sock_alloc_send_skb(&xs->sk, hr + len + tr, 1, &err);
 			if (unlikely(!skb))
-- 
2.56.0

