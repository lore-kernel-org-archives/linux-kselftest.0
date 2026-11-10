Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283088;
	b=FCDr3AYipkmcwvYU/LQhYq7/0jueaOTplpUWJlgeoJuwmYtIr0w/KJ4Hq5zJLrwcUr7S
	 X/KuW54FGwp8BVT6agRokyaQSL7A/d6l2/sQ+GunzpktQfbhjLCejqOAxv5Ae1Z/RXez+
	 2Hv3vFVH1ha11aWRX2+dv/EzVvNlhwh+BW1W9NoOhAX3uemFJXseCgm1pmCp1oXndpZ1I
	 tZAnznRBTG8USE1GeYULghPow4sExCICAIz6j8mIPVVqZE3oLvhK2KmZvWH86jhStC6KD
	 R1Xdj9fSTcG2JNlLycJJNfnQnmlYJ8pBU5NI+Y/2NzOT0d/Vuouo7MQkInYhm9td62A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PKtp2J/LvdqcfkW+9WIXUeirxII9N+NyVOA5Mc+RvFk=;
	b=3qygezrB3jFJPCg3vbnktXy6Ie8/9C/pQI7XEcOBLcU7TNXQfoYUqeoGhXN4fbQ2ZPUV
	 E9OJIbgmNmnaOzxrmVUrPlOe8jFSqZlzeiTO5KzEfOqIm9I+HdwAWPQhWcNNzM0e8Z++f
	 VYEk/fGjIkoV7uhEpt047/8qdoiO+++HbXBIBpYXL21bB9+IhEU0CTzkUtJMasMyj+X4h
	 KjbWmK6Z6f0by2kun6CAMD8W42yexDxKIyN1MuuMa624LYT5ZjbTTMQFKZdfzgQDm7+wo
	 3C8KG5wmEpHq7Qp9g7/rf3zYZoqSVxutfuFrHckCp0qOYIPHx3/RSsUQe98HXzr+xwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=MO78JhEH;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C7C60A383A
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 03:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08C7C60A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=MO78JhEH
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so2417606a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 19:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283086; x=1794887886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKtp2J/LvdqcfkW+9WIXUeirxII9N+NyVOA5Mc+RvFk=;
        b=MO78JhEHetkUvtt/6xyBQjnilRZP+k7gGuu9WX8QvZ4DVL0ayH+WQNpr74gYEvW+4c
         AtcaROKUnVLZ6FL1X7rJMU5IkYsy5V0UdBICmHkqypaUDdNboFMD2To1MpsEdzyegEIi
         F3oZMw4O7Jq9vtjT271TEXv/5TbzMvzuAo85uoXkeS+7T0rtWdZqSWZ295ytdWRLiv3I
         yOKdjNMbHOR59Xdj95N/cTu8Q2+muwsVs+V7t11FyaZvUuYZ8CY1fIp/UDxLYcph2A85
         1c8AtrvfLj4sy27ii6kr4HreZa8DOtcggqE6zM0RfIW/PcQOeQqTGkNI5B87TGM2QIxT
         TXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283086; x=1794887886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PKtp2J/LvdqcfkW+9WIXUeirxII9N+NyVOA5Mc+RvFk=;
        b=jF1S3llnLX6Lg8ZT2gnyfxmM7YqKw7Cqr9X6WjagNM3P3AHn7B1WWeRd4EUCmJ/DqZ
         hCEeLx2y4QBFFiJye9hp7XFIGIwKpBzx3lTd95gkmenXslRB/QS71CfH2JVn4vqzIKPk
         CQZlwUY7flENKdvkYi668RROZo/x3k+UoJqg8GfsdYviReqLvwSnMefn8S36zAk5unwn
         qZ4vhes7CPNwXT4OMpw/iy8FMPv7qs3MbnB6Tk5kZQUCx24mTNaxHhEL5f8eBjP2Ct83
         Wg95ME1P3Tv/FHQC9Rn5uCrhbMCMN/bP2MeB0utKHMy0xpF5q8Cg7G9sD1ULl5AmIzSl
         ANAw==
X-Forwarded-Encrypted: i=1; AL+hErEhG723xDunmroo6vi8HzByhiZLJ6ondZCK1fSCJ59B5wgiekQIMIoW4Mmmr5D5XGZlOTCI70jG8ybe83ysH6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hLiS1KS9IBcqwdYbLShhXDs0f2mrE17fkjsjoUm3QaplVkQ30
	5aEOCFCNbQifpGxhCF6uENqnp9lUlLj9WIxiFJHXbgCkuzYWrx/whkzVBTa+LrjJUz4=
X-Gm-Gg: AYBFou3Mr/63JdjZPRZxkikzCw8RQIioEqmO/3oa0YLbvSg1w1H4yMn5gPnb+ruRSLs
	+gJLKd7z2IAieN8W4Chllc0hhV6sOCjMOIBcS5v9/Tx+QeB/NCnRyMrBInpB3pnXKLjqy4wNWq/
	YVe+6hFxwGhS5RByAdRUWtpd7tles/yb/dKpuq04MoxMs9oyYO1k4aUTfBrrYPMMyVfSXlbiVLA
	c14qOvCO4fthSQHgxN/bCVK3EAJuwPtI3w2eroXgJeBMptcVtLaBead6nKQJ7u3pJngBZvyPaJW
	DbSf446BykEbk/aJJarHzLIVRU92JGZa3FjZ2AG/k7528UMrZ+on64x6ut7LeO453Xd9qtwJALW
	BNiTlKcH9y4tBwtoZY9E/IIIoUvpzyQ2zawQTXY/ZO08XaV8Rba/G4qivBbPkw2AyN5IXteL169
	DDNPPBK4IHOkShXWSl/Q4C5olsuWlonL6WPDNwdda+VVsR9Nthjg4dMsfZntCb0pYAn/OZlXUXi
	ozMhuivgpcB3tPljzp5uCKwn0gO2EgeRvD58eCssFrC8mHsvFLQvyPsn7K9SJkTIZJBxPmuzgfe
	KL1Tn15OrsnRvluNeqk49IXunoax6hbW07AImvHR/t5rN6hlvMtlT5bd2MpLIkA=
X-Received: by 2002:a05:6402:22d0:b0:6b1:b97b:745 with SMTP id 4fb4d7f45d1cf-6b756af0889mr755303a12.29.1794283086393;
        Mon, 09 Nov 2026 19:58:06 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.58.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:58:04 -0800 (PST)
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
Subject: [PATCH bpf-next 13/15] xdp: add kfuncs to load the stored RX metadata
Date: Tue, 10 Nov 2026 03:57:11 +0000
Message-ID: <1985183a511a2217fe0f42582cbd16f023d8991e.1794281983.git.tianyi@cloudflare.com>
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

A program on cpumap or devmap cannot call the XDP RX metadata kfuncs,
because they need a device-bound program. A program on veth can be
bound to veth, but the veth callbacks return -ENODATA for an
xdp_frame. So a program after the redirect cannot read the values
that the program on the NIC stored.

Add three kfuncs that read the skb core extension area:
bpf_xdp_skb_ext_load_rx_hash(), bpf_xdp_skb_ext_load_rx_vlan() and
bpf_xdp_skb_ext_load_rx_csum(). Each returns -ENODATA when its entry
is not stored. They are in the same kfunc set as the store kfuncs, so
they are not device-bound and need no driver callback. A program on
the NIC can also read back the values that it stored.

The RX metadata kfuncs could return the stored values instead. This
patch does not do that. Relaxing bpf_dev_bound_kfunc_check() for
cpumap is not trivial, and it changes these kfuncs for existing
programs, which read the values from the RX descriptor of the bound
device.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 net/core/xdp.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/net/core/xdp.c b/net/core/xdp.c
index fdda072a5858..4df3984479a7 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -1081,6 +1081,15 @@ static const void *xdp_skb_ext_get(const struct xdp_skb_ext *ext,
 	return (const void *)ext + off * XDP_SKB_EXT_ALIGN;
 }
 
+static const void *xdp_skb_ext_load(const struct xdp_md *ctx,
+				    enum xdp_skb_ext_id id)
+{
+	const struct xdp_buff *xdp = (const struct xdp_buff *)ctx;
+	const struct xdp_skb_ext *ext = xdp_buff_skb_ext(xdp);
+
+	return ext ? xdp_skb_ext_get(ext, id) : NULL;
+}
+
 /**
  * xdp_skb_ext_to_skb - Set the stored RX metadata on an skb.
  * @skb: The skb that is built from the packet.
@@ -1296,6 +1305,85 @@ __bpf_kfunc int bpf_xdp_skb_ext_del(struct xdp_md *ctx, enum xdp_skb_ext_id id)
 	return 0;
 }
 
+/**
+ * bpf_xdp_skb_ext_load_rx_hash - Load the stored RX hash of this packet.
+ * @ctx: XDP context pointer.
+ * @hash: Return value pointer.
+ * @rss_type: Return value pointer for RSS type, see &enum xdp_rss_hash_type.
+ *
+ * Return:
+ * * Returns 0 on success or ``-errno`` on error.
+ * * ``-ENODATA`` : the RX hash is not stored
+ */
+__bpf_kfunc int bpf_xdp_skb_ext_load_rx_hash(const struct xdp_md *ctx,
+					     u32 *hash,
+					     enum xdp_rss_hash_type *rss_type)
+{
+	const struct xdp_skb_ext_hash *entry;
+
+	entry = xdp_skb_ext_load(ctx, XDP_SKB_EXT_HASH);
+	if (!entry)
+		return -ENODATA;
+
+	*hash = entry->val;
+	*rss_type = entry->type;
+
+	return 0;
+}
+
+/**
+ * bpf_xdp_skb_ext_load_rx_vlan - Load the stored VLAN tag of this packet.
+ * @ctx: XDP context pointer.
+ * @vlan_proto: Return value pointer for the TPID, in network byte order.
+ * @vlan_tci: Return value pointer for the TCI, in host byte order.
+ *
+ * Return:
+ * * Returns 0 on success or ``-errno`` on error.
+ * * ``-ENODATA`` : the VLAN tag is not stored
+ */
+__bpf_kfunc int bpf_xdp_skb_ext_load_rx_vlan(const struct xdp_md *ctx,
+					     __be16 *vlan_proto, u16 *vlan_tci)
+{
+	const struct xdp_skb_ext_vlan *entry;
+
+	entry = xdp_skb_ext_load(ctx, XDP_SKB_EXT_VLAN);
+	if (!entry)
+		return -ENODATA;
+
+	*vlan_proto = entry->proto;
+	*vlan_tci = entry->tci;
+
+	return 0;
+}
+
+/**
+ * bpf_xdp_skb_ext_load_rx_csum - Load the stored RX checksum status of this
+ *                                packet.
+ * @ctx: XDP context pointer.
+ * @ip_summed: Return value pointer, ``XDP_CHECKSUM_NONE`` or
+ *             ``XDP_CHECKSUM_UNNECESSARY``.
+ * @csum_level: Return value pointer for the checksum level.
+ *
+ * Return:
+ * * Returns 0 on success or ``-errno`` on error.
+ * * ``-ENODATA`` : the checksum status is not stored
+ */
+__bpf_kfunc int bpf_xdp_skb_ext_load_rx_csum(const struct xdp_md *ctx,
+					     enum xdp_checksum *ip_summed,
+					     u8 *csum_level)
+{
+	const struct xdp_skb_ext_csum *entry;
+
+	entry = xdp_skb_ext_load(ctx, XDP_SKB_EXT_CSUM);
+	if (!entry)
+		return -ENODATA;
+
+	*ip_summed = BIT(entry->ip_summed);
+	*csum_level = entry->level;
+
+	return 0;
+}
+
 __bpf_kfunc_end_defs();
 
 BTF_KFUNCS_START(xdp_skb_ext_kfunc_ids)
@@ -1303,6 +1391,9 @@ BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_hash)
 BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_vlan)
 BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_csum)
 BTF_ID_FLAGS(func, bpf_xdp_skb_ext_del)
+BTF_ID_FLAGS(func, bpf_xdp_skb_ext_load_rx_hash)
+BTF_ID_FLAGS(func, bpf_xdp_skb_ext_load_rx_vlan)
+BTF_ID_FLAGS(func, bpf_xdp_skb_ext_load_rx_csum)
 BTF_KFUNCS_END(xdp_skb_ext_kfunc_ids)
 
 static const struct btf_kfunc_id_set xdp_skb_ext_kfunc_set = {
-- 
2.56.0

