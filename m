Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794443698;
	b=OphnttTK5zzdskkRFQG06HArY8yQ5Xw+A4nz4/Mo1/6QUgfacbMklPv0KhMOI3P+s6h7
	 TIRj6TwxKKlnkL1yrj13H3coTW7Lfp1UHq4NuHB6uZtX3WrTW8HMtLREenz4ocecb0Wkg
	 oIbZtORWVjtlUo4fkDiZIGAyf2GRSuejfVHzXuFC9cEp/ItMu3m/IqzStsjVXwdTgwj8s
	 suLY8sLW8RmDroxWksD4zJQ+YIVWaePev2OQfFtcFcFxHaQJsxFmAeKulB5+g3z00HzV6
	 qDunH9wproh9ws/c8swJNwe9ZOhIoiVRU66su6479fh+VfmyCD2+WMbidiEyGPDr+Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=0TpPReWodjm7eLrKXuRP3FItXhIb0Yxnna4BA9L21XQ=;
	b=K0qpxJscs9LvF6dk7Yp+QhRREzOQTwH20/hXk+nAwbm832IdwmnZnm67ghIjasEy7zFj
	 Ty7wAP1KlXJn3tH7lD3nor6T73jqkWDxB1TgnEv6OTRd78+gLo3uGkNuNaRWbyv3yZ9SF
	 LlYDizTtrRJxSYkSTH2b7jMfVAxuj/Qh+CV5yvXOSejPKLAHFXhHSZ1vwNUq0kXPifSTp
	 yL4CUd999nlhPcdwsNCQUWUsQCE+tp5S0FIivxusN33+U7ZtPuWTJ0fwrjtySZopjqyeh
	 dhQdtL//AyTv/i3fauxg9ZCyx8lNdck31dqJaxaYEscPCE1xaUfvyP59OF4Kas+dHPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7rNGSCD;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537DD606A330
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 00:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 537DD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7rNGSCD
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b271e573adso1445970b3a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 16:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794443697; x=1795048497; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0TpPReWodjm7eLrKXuRP3FItXhIb0Yxnna4BA9L21XQ=;
        b=r7rNGSCDkIhCgGBgZ8kj8FdyLBVKDQG/O5RAUe2QMa1aw4aFHGQVOmH+I5U4dIywmy
         sRO0usem/Pnik8CMQECL9FkN/NZ4pvp5me+uXKmfWc4Sb59ARznFRmZ6KlROCFbwWbGN
         c8KyIEAmjv0eVqBPb3AZRSGcJhJ4B6tLChk3JjBRGiNRRvHv+ydVkd8Isbc2qBeqiK4w
         y4pTLB1R78zuhWOgyPmUNjja6++acuK8xAHP16SP7GmP8hagOTHRH4ww72US4yBWtiZB
         +BY9X0zuWIucfXjcUlOcmwUxrOeKStTWfZ8kjGKsnkJfjoLQBKHWLbqjdxBSZ5QFdcaC
         hGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794443697; x=1795048497;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TpPReWodjm7eLrKXuRP3FItXhIb0Yxnna4BA9L21XQ=;
        b=hdb8aFZIfGpVmBXphCoQyfJ6R66KrTGG56HGWKRuFueCvD9k0hZZvLzSSaG5aVrURj
         wBvrJG5xfBqwG8h4SIqTAyOEV3hNEKs/Ua9KdE48rq0yY3J3qfIX/laqQqFVo01z2C/Z
         0jsilBtURcw8pldpjN1yiMt2joe17G9R5q0nQwrjJECcQt5/RL9s9bLpYWpyyaQqpcnH
         D1cHfUkIAk18rQAmgsXnzGI9wAJb3BeN6BA55+dRbcfBJk1xUczCZHf33eqXpsl4nsTv
         E585JlsTtEJ3iUaPbCean0SyHtchu9yK7ERLqY/qdExwf+xJZPjIpz0C87PHycsTOqdO
         11ZA==
X-Forwarded-Encrypted: i=1; AL+hErEG/NpFG8OAyIOhAPnBWmqdYFCxv+/G4nNvxEaKqmWQu5av60imqycA7XfwxTyQshjeEC+svh0J8ygoW8DcMh0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DTKM/plaR4CkhOqSZX0U7ZYUMl+7a+UJTNT6LloppOQXFcomt
	mOf4l7mhNbqyjngXWydNs0L92NbdBsqldgUATnT4AdsakUXvzEOEI2Vd
X-Gm-Gg: AYBFou1DnamBUl3o+t2DiURar+V7I+x2N3n9c5M3ZrVkt7MLXoXkqalJktdiQryyqAL
	XR6/qu+Z3MLtzUhqbZ0Fe6v7x6B+Lbe0om6BvXYC+BGuwYV2+tLqRSPUUnoD+h/WaURCpCq8MnL
	T1ZuipOCL8UaXW4CZYAPMFFDEOKbiaeiyDHX5QomgPa/J3RpdCPtzgE9aSMMrbq+Xq4kP8foqJs
	89zvPSCSO9MS/+OZX/SsHaxObiDpfhmPflGV1ipV87LprXj/hwBnwxS+mpKhWdqVbeN5byaiQW0
	kCI/cm/w1YKzDW/VWV6S6JYhL+Kzv4DmYjTwKSUTvYk9Ne+W73BJ6bNBVwFu5PX4WwsttX9KLbQ
	2Hv8hiqqnUl1S4SVvUzEPY5qK30dRpeFUCm9b2vqD7zxR/qCzFjlpxKcs461LlaExvisR5JvEnO
	d+wM73Sxli0JIshkz+Hc3i1v3tDhMU++FNq7MVti7ZOBzfmESiQ+HcV0NjkckUfTUO19D6cV9rp
	YSSwOnWiY+G+9dgfAqTgBk8xMFfUEUKTLFrCxUVp7BV5i2rtMzGhAJ8RP7YsHmTwSHUP5Ashd2e
	ezpTbRbPFTfS3Y66VxHiKP/gqsMB50kxonVdXAJdOZWXBS3vEK1rqK2IgRuapwurXrfZN8Mn8pj
	jDRS2IDeKeBNL7a0dnaixkL36yOavK9RAkA==
X-Received: by 2002:a05:6a20:2451:b0:3e2:1a24:fb7e with SMTP id adf61e73a8af0-3f2fda8c6b2mr4281249637.40.1794443696335;
        Wed, 11 Nov 2026 16:34:56 -0800 (PST)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d67e52esm2026298a12.10.2026.11.11.16.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 16:34:55 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 00:34:54 +0000
Message-Id: <DMST78XBB2RK.2BKP3O07GEWZQ@gmail.com>
Cc: "John Fastabend" <john.fastabend@gmail.com>, "Stanislav Fomichev"
 <sdf@fomichev.me>, "Lorenzo Bianconi" <lorenzo@kernel.org>, "Vladimir
 Vdovin" <deliran@verdict.gg>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Simon Horman" <horms@kernel.org>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "Donald Hunter" <donald.hunter@gmail.com>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Tony Nguyen"
 <anthony.l.nguyen@intel.com>, "Przemek Kitszel"
 <przemyslaw.kitszel@intel.com>, "Maciej Fijalkowski"
 <maciej.fijalkowski@intel.com>, "Alexander Lobakin"
 <aleksander.lobakin@intel.com>, "Magnus Karlsson"
 <magnus.karlsson@intel.com>, "Tushar Vyavahare"
 <tushar.vyavahare@intel.com>, "Jason Xing" <kerneljasonxing@gmail.com>,
 "Nikolay Aleksandrov" <razor@blackwall.org>, "Madalin Bucur"
 <madalin.bucur@nxp.com>, "Ioana Ciornei" <ioana.ciornei@nxp.com>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Shuah
 Khan" <shuah@kernel.org>, "Randy Dunlap" <rdunlap@infradead.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nick Desaulniers"
 <ndesaulniers@google.com>, "Bill Wendling" <morbo@google.com>, "Justin
 Stitt" <justinstitt@google.com>, "Chris J Arges" <carges@cloudflare.com>,
 "Jakub Sitnicki" <jakub@cloudflare.com>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <intel-wired-lan@lists.osuosl.org>,
 <llvm@lists.linux.dev>, <kernel-team@cloudflare.com>
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Tianyi Gao" <tianyi@cloudflare.com>, <bpf@vger.kernel.org>,
 <netdev@vger.kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Jakub Kicinski" <kuba@kernel.org>, "Jesper Dangaard Brouer"
 <hawk@kernel.org>
In-Reply-To: <cover.1794281983.git.tianyi@cloudflare.com>
References: <cover.1794281983.git.tianyi@cloudflare.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 09, 2026 at 07:56 PM Tianyi Gao <tianyi@cloudflare.com> wrote:
> The layout of the area follows skb extensions (struct skb_ext). A small
> header gives the offset of each entry. An entry takes headroom only when
> the program stores it, so the area does not grow with each new type of
> RX metadata, unlike [4]. Unlike skb_ext, the area needs no allocation.

I'm with Stan on this. It looks heavy.

How about the following idea:

diff --git a/include/net/xdp.h b/include/net/xdp.h
index 07231ad..7f30d24 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -81,8 +81,15 @@ enum xdp_buff_flags {
 	 * XDP program is not attached.
 	 */
 	XDP_FLAGS_FRAGS_UNREADABLE	= BIT(2),
+	/* The prog stored these members of struct xdp_rx_meta */
+	XDP_FLAGS_RX_HASH		= BIT(3),
+	XDP_FLAGS_RX_VLAN		= BIT(4),
+	XDP_FLAGS_RX_CSUM		= BIT(5),
 };

+#define XDP_FLAGS_RX_META \
+	(XDP_FLAGS_RX_HASH | XDP_FLAGS_RX_VLAN | XDP_FLAGS_RX_CSUM)
+
 struct xdp_buff {
 	void *data;
 	void *data_end;
@@ -174,6 +181,7 @@ xdp_prepare_buff(struct xdp_buff *xdp, unsigned char *hard_start,
 	xdp->data = data;
 	xdp->data_end = data + data_len;
 	xdp->data_meta = meta_valid ? data : data + 1;
+	xdp->flags &= ~XDP_FLAGS_RX_META;
 }

 /* Reserve memory area at end-of data area.
@@ -310,6 +318,48 @@ struct xdp_frame {
 	u32 flags; /* supported values defined in xdp_buff_flags */
 };

+/*
+ * RX metadata that an XDP prog stores for the skb that is built later.
+ * It follows the xdp_frame in the headroom. The headroom is taken only
+ * when one of XDP_FLAGS_RX_META is set.
+ */
+struct xdp_rx_meta {
+	u32 hash;
+	__be16 vlan_proto;
+	u16 vlan_tci;
+	u8 hash_type;	/* enum pkt_hash_types */
+	u8 ip_summed;
+	u8 csum_level;
+};
+
+static __always_inline struct xdp_rx_meta *xdp_rx_meta(void *data_hard_start)
+{
+	return data_hard_start + sizeof(struct xdp_frame);
+}
+
+/* The lowest address that the packet and data_meta can use */
+static __always_inline void *xdp_buff_headroom_start(const struct xdp_buff *xdp)
+{
+	struct xdp_rx_meta *meta = xdp_rx_meta(xdp->data_hard_start);
+
+	return xdp->flags & XDP_FLAGS_RX_META ? meta + 1 : meta;
+}
+
+void __xdp_rx_meta_to_skb(struct sk_buff *skb, const struct xdp_rx_meta *meta,
+			  u32 flags);
+
+/*
+ * A driver calls it on XDP_PASS after it sets the skb fields from
+ * the RX descriptor.
+ */
+static inline void xdp_buff_rx_meta_to_skb(const struct xdp_buff *xdp,
+					   struct sk_buff *skb)
+{
+	if (unlikely(xdp->flags & XDP_FLAGS_RX_META))
+		__xdp_rx_meta_to_skb(skb, xdp_rx_meta(xdp->data_hard_start),
+				     xdp->flags);
+}
+
 static __always_inline bool xdp_frame_has_frags(const struct xdp_frame *frame)
 {
 	return !!(frame->flags & XDP_FLAGS_HAS_FRAGS);
@@ -648,6 +698,12 @@ enum xdp_rss_hash_type {
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
diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
index d6c9dc6..f255818 100644
--- a/net/bpf/test_run.c
+++ b/net/bpf/test_run.c
@@ -223,7 +223,8 @@ static bool ctx_was_changed(struct xdp_page_head *head)
 {
 	return head->orig_ctx.data != head->ctx.data ||
 		head->orig_ctx.data_meta != head->ctx.data_meta ||
-		head->orig_ctx.data_end != head->ctx.data_end;
+		head->orig_ctx.data_end != head->ctx.data_end ||
+		head->orig_ctx.flags != head->ctx.flags;
 }

 static void reset_ctx(struct xdp_page_head *head)
@@ -234,6 +235,7 @@ static void reset_ctx(struct xdp_page_head *head)
 	head->ctx.data = head->orig_ctx.data;
 	head->ctx.data_meta = head->orig_ctx.data_meta;
 	head->ctx.data_end = head->orig_ctx.data_end;
+	head->ctx.flags = head->orig_ctx.flags;
 	xdp_update_frame_from_buff(&head->ctx, head->frame);
 	head->frame->mem_type = head->orig_ctx.rxq->mem.type;
 }
diff --git a/net/core/filter.c b/net/core/filter.c
index 9245009..efbe293 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -4243,9 +4243,8 @@ static unsigned long xdp_get_metalen(const struct xdp_buff *xdp)

 BPF_CALL_2(bpf_xdp_adjust_head, struct xdp_buff *, xdp, int, offset)
 {
-	void *xdp_frame_end = xdp->data_hard_start + sizeof(struct xdp_frame);
 	unsigned long metalen = xdp_get_metalen(xdp);
-	void *data_start = xdp_frame_end + metalen;
+	void *data_start = xdp_buff_headroom_start(xdp) + metalen;
 	void *data = xdp->data + offset;

 	if (unlikely(data < data_start ||
@@ -4547,13 +4546,12 @@ static const struct bpf_func_proto bpf_xdp_adjust_tail_proto = {

 BPF_CALL_2(bpf_xdp_adjust_meta, struct xdp_buff *, xdp, int, offset)
 {
-	void *xdp_frame_end = xdp->data_hard_start + sizeof(struct xdp_frame);
 	void *meta = xdp->data_meta + offset;
 	unsigned long metalen = xdp->data - meta;

 	if (xdp_data_meta_unsupported(xdp))
 		return -ENOTSUPP;
-	if (unlikely(meta < xdp_frame_end ||
+	if (unlikely(meta < xdp_buff_headroom_start(xdp) ||
 		     meta > xdp->data))
 		return -EINVAL;
 	if (unlikely(xdp_metalen_invalid(metalen)))
@@ -12794,7 +12792,7 @@ __bpf_kfunc int bpf_xdp_pull_data(struct xdp_md *x, u32 len)

 	start = xdp_data_meta_unsupported(xdp) ? xdp->data : xdp->data_meta;

-	headroom = start - xdp->data_hard_start - sizeof(struct xdp_frame);
+	headroom = start - xdp_buff_headroom_start(xdp);
 	tailroom = data_hard_end - xdp->data_end;

 	delta = len - data_len;
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 1d679e8..ca17609 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -829,10 +829,10 @@ struct sk_buff *__xdp_build_skb_from_frame(struct xdp_frame *xdpf,

 	/* Essential SKB info: protocol and skb->dev */
 	skb->protocol = eth_type_trans(skb, dev);
+	if (xdpf->flags & XDP_FLAGS_RX_META)
+		__xdp_rx_meta_to_skb(skb, xdp_rx_meta(xdpf), xdpf->flags);

 	/* Optional SKB info, currently missing:
-	 * - HW checksum info		(skb->ip_summed)
-	 * - HW RX hash			(skb_set_hash)
 	 * - RX ring dev queue index	(skb_record_rx_queue)
 	 */

@@ -857,6 +857,9 @@ struct sk_buff *xdp_build_skb_from_frame(struct xdp_frame *xdpf,

 	memset(skb, 0, offsetof(struct sk_buff, tail));

+	/* The callers set the RX fields themselves or transmit the skb */
+	xdpf->flags &= ~XDP_FLAGS_RX_META;
+
 	return __xdp_build_skb_from_frame(xdpf, skb, dev);
 }
 EXPORT_SYMBOL_GPL(xdp_build_skb_from_frame);
@@ -990,9 +993,154 @@ bool bpf_dev_bound_kfunc_id(u32 btf_id)
 	return btf_id_set8_contains(&xdp_metadata_kfunc_ids, btf_id);
 }

+void __xdp_rx_meta_to_skb(struct sk_buff *skb, const struct xdp_rx_meta *meta,
+			  u32 flags)
+{
+	if (flags & XDP_FLAGS_RX_HASH)
+		skb_set_hash(skb, meta->hash, meta->hash_type);
+	if (flags & XDP_FLAGS_RX_VLAN)
+		__vlan_hwaccel_put_tag(skb, meta->vlan_proto, meta->vlan_tci);
+	if (flags & XDP_FLAGS_RX_CSUM) {
+		skb->ip_summed = meta->ip_summed;
+		skb->csum_level = meta->csum_level;
+	}
+}
+EXPORT_SYMBOL_GPL(__xdp_rx_meta_to_skb);
+
+static struct xdp_rx_meta *xdp_rx_meta_reserve(const struct xdp_buff *xdp)
+{
+	struct xdp_rx_meta *meta = xdp_rx_meta(xdp->data_hard_start);
+	void *start = xdp_data_meta_unsupported(xdp) ? xdp->data : xdp->data_meta;
+
+	/* User space can write the headroom of AF_XDP zero-copy buffers */
+	if (xdp->rxq->mem.type == MEM_TYPE_XSK_BUFF_POOL)
+		return ERR_PTR(-EOPNOTSUPP);
+	if ((void *)(meta + 1) > start)
+		return ERR_PTR(-ENOSPC);
+	return meta;
+}
+
+__bpf_kfunc_start_defs();
+
+/**
+ * bpf_xdp_store_rx_hash - Store the RX hash for the skb of this packet.
+ * @ctx: XDP context pointer.
+ * @hash: RX hash value.
+ * @rss_type: RSS hash type, see &enum xdp_rss_hash_type.
+ *
+ * Return:
+ * * Returns 0 on success or ``-errno`` on error.
+ * * ``-ENOSPC`` : not enough headroom
+ * * ``-EOPNOTSUPP`` : AF_XDP zero-copy buffer
+ */
+__bpf_kfunc int bpf_xdp_store_rx_hash(struct xdp_md *ctx, u32 hash,
+				      enum xdp_rss_hash_type rss_type)
+{
+	struct xdp_buff *xdp = (struct xdp_buff *)ctx;
+	struct xdp_rx_meta *meta = xdp_rx_meta_reserve(xdp);
+
+	if (IS_ERR(meta))
+		return PTR_ERR(meta);
+
+	meta->hash = hash;
+	if (rss_type & XDP_RSS_L4)
+		meta->hash_type = PKT_HASH_TYPE_L4;
+	else if (rss_type & (XDP_RSS_L3_IPV4 | XDP_RSS_L3_IPV6))
+		meta->hash_type = PKT_HASH_TYPE_L3;
+	else
+		meta->hash_type = PKT_HASH_TYPE_NONE;
+	xdp->flags |= XDP_FLAGS_RX_HASH;
+
+	return 0;
+}
+
+/**
+ * bpf_xdp_store_rx_vlan_tag - Store the VLAN tag for the skb of this packet.
+ * @ctx: XDP context pointer.
+ * @vlan_proto: VLAN tag protocol identifier (TPID), in network byte order.
+ * @vlan_tci: VLAN TCI, in host byte order.
+ *
+ * Return:
+ * * Returns 0 on success or ``-errno`` on error.
+ * * ``-EINVAL`` : @vlan_proto is not 802.1Q or 802.1AD
+ * * ``-ENOSPC`` : not enough headroom
+ * * ``-EOPNOTSUPP`` : AF_XDP zero-copy buffer
+ */
+__bpf_kfunc int bpf_xdp_store_rx_vlan_tag(struct xdp_md *ctx, __be16 vlan_proto,
+					  u16 vlan_tci)
+{
+	struct xdp_buff *xdp = (struct xdp_buff *)ctx;
+	struct xdp_rx_meta *meta = xdp_rx_meta_reserve(xdp);
+
+	if (IS_ERR(meta))
+		return PTR_ERR(meta);
+	if (vlan_proto != htons(ETH_P_8021Q) &&
+	    vlan_proto != htons(ETH_P_8021AD))
+		return -EINVAL;
+
+	meta->vlan_proto = vlan_proto;
+	meta->vlan_tci = vlan_tci;
+	xdp->flags |= XDP_FLAGS_RX_VLAN;
+
+	return 0;
+}
+
+/**
+ * bpf_xdp_store_rx_csum - Store the checksum status for the skb of this packet.
+ * @ctx: XDP context pointer.
+ * @ip_summed: ``XDP_CHECKSUM_NONE`` or ``XDP_CHECKSUM_UNNECESSARY``.
+ * @csum_level: Number of consecutive verified checksums minus one, up to
+ *              ``SKB_MAX_CSUM_LEVEL``. Must be 0 with ``XDP_CHECKSUM_NONE``.
+ *
+ * Return:
+ * * Returns 0 on success or ``-errno`` on error.
+ * * ``-EINVAL`` : @ip_summed is not supported, or @csum_level is not valid
+ *   for it
+ * * ``-ENOSPC`` : not enough headroom
+ * * ``-EOPNOTSUPP`` : AF_XDP zero-copy buffer
+ */
+__bpf_kfunc int bpf_xdp_store_rx_csum(struct xdp_md *ctx,
+				      enum xdp_checksum ip_summed,
+				      u8 csum_level)
+{
+	struct xdp_buff *xdp = (struct xdp_buff *)ctx;
+	struct xdp_rx_meta *meta = xdp_rx_meta_reserve(xdp);
+
+	if (IS_ERR(meta))
+		return PTR_ERR(meta);
+	if (ip_summed == XDP_CHECKSUM_NONE && !csum_level)
+		meta->ip_summed = CHECKSUM_NONE;
+	else if (ip_summed == XDP_CHECKSUM_UNNECESSARY &&
+		 csum_level <= SKB_MAX_CSUM_LEVEL)
+		meta->ip_summed = CHECKSUM_UNNECESSARY;
+	else
+		return -EINVAL;
+
+	meta->csum_level = csum_level;
+	xdp->flags |= XDP_FLAGS_RX_CSUM;
+
+	return 0;
+}
+
+__bpf_kfunc_end_defs();
+
+BTF_KFUNCS_START(xdp_rx_meta_kfunc_ids)
+BTF_ID_FLAGS(func, bpf_xdp_store_rx_hash)
+BTF_ID_FLAGS(func, bpf_xdp_store_rx_vlan_tag)
+BTF_ID_FLAGS(func, bpf_xdp_store_rx_csum)
+BTF_KFUNCS_END(xdp_rx_meta_kfunc_ids)
+
+static const struct btf_kfunc_id_set xdp_rx_meta_kfunc_set = {
+	.owner = THIS_MODULE,
+	.set   = &xdp_rx_meta_kfunc_ids,
+};
+
 static int __init xdp_metadata_init(void)
 {
-	return register_btf_kfunc_id_set(BPF_PROG_TYPE_XDP, &xdp_metadata_kfunc_set);
+	int ret;
+
+	ret = register_btf_kfunc_id_set(BPF_PROG_TYPE_XDP, &xdp_rx_meta_kfunc_set);
+	return ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_XDP, &xdp_metadata_kfunc_set);
 }
 late_initcall(xdp_metadata_init);

