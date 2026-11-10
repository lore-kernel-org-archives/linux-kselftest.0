Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283060;
	b=IsyRucAU53gFR5O9hkpylIbUoXgHtnbD8c17sTfxQe2BfUBpf5vGbPGAKbd6aqY6Qz8l
	 kumsQkWoZEnFDCb/IIPQooRoUTNrC0eYimvKJE18+8c8dLODdmhxXvJLFf90FAWcFF7rg
	 sGSWY45PWTi5hOL/Adubp9tL31PdWXv+k5U0vq6x0ItTbAHUQhX1QEwEy0+D7zMRJnMcu
	 84Tp5BQQCm+LHH34ZQvehWVPVhkgjlKaumv+DESft0dy0ZVFJHcBsdgafGwiGG2S2ft2Q
	 ouxlE4xV3BJsuIfJVm5vWlS0F/kkyEaSzKPBBNfn8WLDoSPpFlmgcxH32tkIurGcNwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IMIS7KfMcbwFH4EjhakKpSZPpu7Y+oEkSnNYuobCRt4=;
	b=yJk3HnsSfc/fY5ZwP1pL8qyklOMVMlogu9aBHNCvyW6LlvxH6WX568C/lCSmfe2+Mv14
	 UKTZNO2Bn8ek5XUc/DHXnpOLtGDNjfzslGAGcZBx+dpj9MyQaIZKMy98TfEIx6kyEthto
	 usYtsckZH1ACO/EFRK8pVj9UErmqgmujkM8MB4K9QlXS2XoYLhskoG3R3PbzqO6O6uSrV
	 wYfrfrIjO0CfBEKoflYsozI0pnPnhugPBk/jHTN/3Ww+lem1v3/kTmi1sy+RJF+DNZF6N
	 E1zo4LUtOjUvfE5Zc5u9FeKYavQvOQSIGZKsnfpDLCkopiXknqnJo3iiQxkcWPctm/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ABwiHJF8;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ACE60A260C
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 03:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8ACE60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ABwiHJF8
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b587591414so1742590a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 19:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283058; x=1794887858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMIS7KfMcbwFH4EjhakKpSZPpu7Y+oEkSnNYuobCRt4=;
        b=ABwiHJF8uRoIuX+DLpvMiqGhGqYaOhFABFxorxDzxkd6GIYPkHWXYOQ6ue2pWUuMm7
         PDulVSH6Ie4VNDUnAV+H/U0lhiJTP4IUp+SSFxwXvXTvRpfnk48hhYvBDP0G/yr11/UI
         9jw4ILmTvgoTC7Z1aC9K+b/J8rGTfpb4cZanllVLj4J8zsAYyvUUdIsKCezz4yee3yKD
         QMMHnppoAlrXJWQziV2HFCn8ayWrrrNvefvaGYXOTJUoUqs5XrZyhA0jm0qgrl2O1csR
         qJTbO96GXHjU2z/WKmGdzyxBI8xW1VVv8nLaGpg65yqKqRQWtIF9ZRe5CrgcV8mEJ957
         Z9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283058; x=1794887858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMIS7KfMcbwFH4EjhakKpSZPpu7Y+oEkSnNYuobCRt4=;
        b=J30A6ch5PXNbpUMbtbLM1wy5xjvtI9LdOVV9A0IqhKiYWHVWthU5BxjX8WqIyZKCBM
         dDHonOvwEYSV7vRu9BWMZWSXwvp8VXL3vhFkQUIUYxQCRr+ogHnsmSYBljvarrFaFIOf
         33qdYvXu/sbaeK3NwJlqA0VjceadgFM2u+oh8jtyTB5Z2NoTaDBSYZrxX2B5trSutFtA
         KvnAnimmMmyQxsVas5ibheAkluVXP9fMgxuOwwj/T+Nr8ZEQRXTjZZjv0AS17fIsRyjx
         I+q6djCLZfCbsRAa6xmxHPb3OXjmP5OQdj4cGrWpQg4F/04QOJVhXOW1tbk1xNo75WQ+
         jaRA==
X-Forwarded-Encrypted: i=1; AL+hErGDIMdTaqMFw1nNeuL3N11qFJE3MKSTPwpzAQEW4iPlOHmqH328yFRLwNZf08ZIyUY/2zFmaXKUktdZbZZW1qk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CAhQND7obWco4RDuqUqoaiL/soqN1AtazJ7bYiVXgCK/1Ej37
	o6OQmR+rnS4yxv+rwTz+f4Ds5ddRXB9xyXicBTOJ7KBA5bvrLUqrfic8aveh4Il9rp4=
X-Gm-Gg: AYBFou1LwEb5MS/pi+H9HPoLzxokUw8NnWZjwgNDgWjZDk8wGLd6G3NPaCMktFVQKsb
	lj+xkZctp2XSP/UhL+pStAZtd2Y0sVTlVoNBlzSLsWT4+4VuTUm/8DEyVVbUCBxjtzZFqb4OLk/
	Y9suGe/0vTYrGYCaFQC8c6A7VJP8HnrK2BKJWyvVzcub7qmrqaA9cQBEqeas9tm0wHbk+dgSkUF
	dh0DoaMuFeRCNa4yPsfL8AufUki9c/B0V6iog/c1pg9eaT6zvo+/l3NowW394CyjLx/osCIxw2h
	vorCPo7K9f4dL+/mExfYvZP3UmxNNCEECPV+RTAoBr6pdH5qUKredzTUZdPYKv9xN9p766Yt/6y
	kxpzbWPRxYK6qbyiGCeQRHQovBt4qFTt5GQGaivn9T4Lr4Z6ZB3aJEkttFnYiO8J8PlAQeLijHi
	UUt9qr+Fpz496DXclKi/M7enCnCj41aUTWkKRehyfXDmR0Gs/m0BBWtiCg/T1gz2xZdLT2DyfSI
	WSaPv9YuglcFNv5h/NkRoVLn94C9/9QVVw1m6rL6jMmBhzKB8ifJ5swvpBLAoWCf0KoseeLgsdI
	kJSHUFC4yfo4j0ChO8fxV8wQxkTcLd5ooMJpXFsfn3wTNkXZJv5C5A3h6QKRxyU=
X-Received: by 2002:a05:6402:4007:b0:6b5:8695:f839 with SMTP id 4fb4d7f45d1cf-6b756b0bf4cmr1096174a12.45.1794283058320;
        Mon, 09 Nov 2026 19:57:38 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.57.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:57:36 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Vladimir Vdovin <deliran@verdict.gg>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Tushar Vyavahare <tushar.vyavahare@intel.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Chris J Arges <carges@cloudflare.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	llvm@lists.linux.dev,
	kernel-team@cloudflare.com,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH bpf-next 05/15] xdp: add a kfunc to store the RX checksum status
Date: Tue, 10 Nov 2026 03:57:03 +0000
Message-ID: <f17f2567802dde23ad1cf81b572e0834c6531fe7.1794281983.git.tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794281983.git.tianyi@cloudflare.com>
References: <cover.1794281983.git.tianyi@cloudflare.com>
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

Add bpf_xdp_skb_ext_store_rx_csum(). It stores the RX checksum status in
the skb core extension area. A later patch sets the stored status on the
skb built from the xdp_frame. The program can read the status from the
NIC with bpf_xdp_metadata_rx_checksum() from Lorenzo's RX checksum kfunc
series [1].

The kfunc accepts XDP_CHECKSUM_NONE with csum_level 0, and
XDP_CHECKSUM_UNNECESSARY with csum_level up to SKB_MAX_CSUM_LEVEL:

- Storing XDP_CHECKSUM_UNNECESSARY asserts that the checksums are
  correct, as in [2]. A program must store it only after it has verified
  the checksums.
- Storing XDP_CHECKSUM_NONE invalidates the checksum status, as
  requested in [3][4].
- After a decap, storing a lower csum_level updates the status, as
  requested in [5].
- CHECKSUM_COMPLETE is not passed to the stack for now, as suggested in
  [5].

Link: https://lore.kernel.org/all/20260715-bpf-xdp-meta-rxcksum-v5-1-623d5c0d0ab7@kernel.org/ [1]
Link: https://lore.kernel.org/all/20260630191510.81402-2-deliran@verdict.gg/ [2]
Link: https://lore.kernel.org/all/20260227153231.78d16b69@kernel.org/ [3]
Link: https://lore.kernel.org/all/amEojEGsIGkUjIWn@devvm7509.cco0.facebook.com/ [4]
Link: https://lore.kernel.org/all/20260721183256.6f49d6e1@kernel.org/ [5]
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
enum xdp_checksum has the same names and values as in [1], so this
patch does not depend on that series. The series merged later drops its
copy.

Stanislav was not sure that any NIC reports a level of 2 or more [4]. A
separate maximum for XDP would give the same skb field two limits, so
the kfunc uses SKB_MAX_CSUM_LEVEL.
---
 include/net/xdp.h |  6 +++++
 net/core/xdp.c    | 57 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/include/net/xdp.h b/include/net/xdp.h
index 23c976e92898..d8b77d80bfbe 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -701,6 +701,12 @@ enum xdp_rss_hash_type {
 	XDP_RSS_TYPE_L4_IPV6_SCTP_EX = XDP_RSS_TYPE_L4_IPV6_SCTP | XDP_RSS_L3_DYNHDR,
 };
 
+enum xdp_checksum {
+	XDP_CHECKSUM_NONE		= BIT(CHECKSUM_NONE),
+	XDP_CHECKSUM_UNNECESSARY	= BIT(CHECKSUM_UNNECESSARY),
+	XDP_CHECKSUM_COMPLETE		= BIT(CHECKSUM_COMPLETE),
+};
+
 struct xdp_metadata_ops {
 	int	(*xmo_rx_timestamp)(const struct xdp_md *ctx, u64 *timestamp);
 	int	(*xmo_rx_hash)(const struct xdp_md *ctx, u32 *hash,
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 2c1d5ec3311b..eea04e7b7204 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -1004,9 +1004,15 @@ struct xdp_skb_ext_vlan {
 	u16 tci;
 };
 
+struct xdp_skb_ext_csum {
+	u8 ip_summed; /* CHECKSUM_* */
+	u8 level;
+};
+
 static const u8 xdp_skb_ext_type_len[] = {
 	[XDP_SKB_EXT_HASH] = XDP_SKB_EXT_CHUNKSIZEOF(struct xdp_skb_ext_hash),
 	[XDP_SKB_EXT_VLAN] = XDP_SKB_EXT_CHUNKSIZEOF(struct xdp_skb_ext_vlan),
+	[XDP_SKB_EXT_CSUM] = XDP_SKB_EXT_CHUNKSIZEOF(struct xdp_skb_ext_csum),
 };
 
 /* Limit the header and all entries to 64 bytes, so that a new entry
@@ -1120,6 +1126,56 @@ __bpf_kfunc int bpf_xdp_skb_ext_store_rx_vlan(struct xdp_md *ctx,
 	return 0;
 }
 
+/**
+ * bpf_xdp_skb_ext_store_rx_csum - Store the RX checksum status of this packet.
+ * @ctx: XDP context pointer.
+ * @ip_summed: ``XDP_CHECKSUM_NONE`` or ``XDP_CHECKSUM_UNNECESSARY``.
+ * @csum_level: Number of consecutive verified checksums minus one, up to
+ *              ``SKB_MAX_CSUM_LEVEL``. Must be 0 with ``XDP_CHECKSUM_NONE``.
+ *
+ * Store ``XDP_CHECKSUM_UNNECESSARY`` only after the program has verified
+ * the checksums.
+ *
+ * Return:
+ * * Returns 0 on success or ``-errno`` on error.
+ * * ``-EINVAL`` : @ip_summed is not supported, or @csum_level is not valid
+ *   for it
+ * * ``-ENOSPC`` : not enough headroom for the entry
+ * * ``-EOPNOTSUPP`` : AF_XDP zero-copy buffer
+ */
+__bpf_kfunc int bpf_xdp_skb_ext_store_rx_csum(struct xdp_md *ctx,
+					      enum xdp_checksum ip_summed,
+					      u8 csum_level)
+{
+	struct xdp_buff *xdp = (struct xdp_buff *)ctx;
+	struct xdp_skb_ext_csum *entry;
+	u8 val;
+
+	switch (ip_summed) {
+	case XDP_CHECKSUM_NONE:
+		if (csum_level)
+			return -EINVAL;
+		val = CHECKSUM_NONE;
+		break;
+	case XDP_CHECKSUM_UNNECESSARY:
+		if (csum_level > SKB_MAX_CSUM_LEVEL)
+			return -EINVAL;
+		val = CHECKSUM_UNNECESSARY;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	entry = xdp_skb_ext_add(xdp, XDP_SKB_EXT_CSUM);
+	if (IS_ERR(entry))
+		return PTR_ERR(entry);
+
+	entry->ip_summed = val;
+	entry->level = csum_level;
+
+	return 0;
+}
+
 /**
  * bpf_xdp_skb_ext_del - Delete a stored entry of this packet.
  * @ctx: XDP context pointer.
@@ -1149,6 +1205,7 @@ __bpf_kfunc_end_defs();
 BTF_KFUNCS_START(xdp_skb_ext_kfunc_ids)
 BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_hash)
 BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_vlan)
+BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_csum)
 BTF_ID_FLAGS(func, bpf_xdp_skb_ext_del)
 BTF_KFUNCS_END(xdp_skb_ext_kfunc_ids)
 
-- 
2.56.0

