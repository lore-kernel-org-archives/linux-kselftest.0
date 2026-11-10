Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283045;
	b=FdBJ+OSIY8s5w8v3sFnanyHxr/t1hhCUWrnMLI+fZ0MmIw+7oYMQDzMonpklkBPBmJlx
	 K0aw58a2nbO0F2ibezNVAgziCxGJiGzZOV/MlbAcv+i2jplPz6qxFFmK2frtvJdjxNHMT
	 jAqmhwEiLe8CQUCJ1JBLjICn8OWViTK9F+dpkuSRJ1V26foC4OyB0EP60DmjmuhSJC6ne
	 cItALASXeCPl4pUht1nVhXlfUrKRf5OThlFLOeCkvxxl69z0cZE/l/CR3JzGDIXp/UcaN
	 XVKZs2XPw/xeJV4M0vbI4ADSSjMV2G27oqtLltcPK3sSAeipZhPWy56PIb5uDNYOMJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oKixK7Jwu6TCrx7SV2g9n1KdVg0f5barw8E7pwYTzBI=;
	b=xg839CUJU0eKBdfgf8g8pEbcpdqPZfAp2TVmF78KsSQ99l1gJx0MJErNlfH8UfFT8Mav
	 Ix9bgQRSwCbeDthGdlrNyjut3i5rpyNI/Rs1sW4s9n9Tz/ELfzx1rMhCTCMMUztj4H9FD
	 dAcxN6p2SGhoOInSxi13KJxA2+tl9EAbnV3rok6u7aZHmpDm3r39+zuXl6fqvkHnTduZH
	 jlLMDSTCdjZ+AvJHcNZ87OYox0rHwcs1bwotv6iGZbXFV/Kow+gIFVcpGBBkgbhQcBU9X
	 DEz8y266RnolZLB2sLKadix1nZONclBoWVzBGGV+XREWTuoEemwSxqZuGPRZrxd4i2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=QaraZEkx;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC365606A332
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 03:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC365606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=QaraZEkx
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b5669a5100so2126913a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 19:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283043; x=1794887843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKixK7Jwu6TCrx7SV2g9n1KdVg0f5barw8E7pwYTzBI=;
        b=QaraZEkxayhccY6b502Tx2lOCXD6td300StkCrEzkQTRPruXRrO8lL0XZm1bNWe4g6
         R1MKBfce5GYhWuTGwI8vZXMp1e1hXvUinF3fwjoXYsNfDuiI+adZ/cMFC6pYqxf9rrfz
         F5zPy/psKAn8RLKWFcJH+RLcXRuk/neSHRXomMDf57JqLmqyUO3Af+r40vbZyDcUztta
         FAJvg7+4AmxnWnEXvliVBm/vVRScv/pYvz5nctuvXgZ0y1zg9zdsp4JdevTT31gCsTjH
         6+W4+WpQsMi9UlYFY59LkFue2R6D+z+pTePNoFWw9iUm55mCFT9xSm0SzYlSzdTrEaMW
         Ic9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283043; x=1794887843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKixK7Jwu6TCrx7SV2g9n1KdVg0f5barw8E7pwYTzBI=;
        b=zLivaANhdb/F8h7KgcOyNewjU2Hfe0S99z1N344ZHHY1knz31y2dn23CMUcIkjfX2I
         +PC0ZkVD0JtDa6MANuXCCLOxc4klYRX4Nc8MKAGa4jrd+4D3sO343sU/355DkZw5Y4hJ
         QAADpidqk7HyQx1N5siB4fzau+HSA5Ds7jyH4UoHgJ+B0/uk8je85yjUXtR2tY8KCfMs
         qNZSsCgwioCRhnHIRb9Fr7xSqwH7xi13JsFlu/m9Ojua75AIXA1lrF7HmrPBNtGXdlf5
         T3fxVjRoxiWc0p0T8s0pmNdCksdeW7RtZmlnKvhxmWQDQoago+qqnMzwEBtDkKEUkC03
         bQ+w==
X-Forwarded-Encrypted: i=1; AL+hErEaO6r1QyKmFeJh3QQNxU6iIGm4B2tAH1yYL0ztlet4mUqay05rM9gpyBJvnRoRTfvueaae/C70SFBrBHG19Cs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iS/uBiQNKXRYM1O3UdqDmeW3bx5YbupN+kTwloJ4m4NHDfsTU
	kR2JYnmFlmBxzSUA+Q4k5fxnLcE4xRLQm2JtEb4+PGUhlkI8K0Vyr1yPCzAy3t6PHcM=
X-Gm-Gg: AYBFou08JSHV0O2hiuDsJlpWHx5T4zPDN0axPhv9GjUUG8FOU3BS3PCpNydZyXcqoPC
	woUrnb/A8nAxtFpr+fO9AwvBrEP/1wnINnSwL48qFfCSWQdJx7AAejafOINNu1iX6KfUHGnFKbG
	Qd4UJ+etpcChgLCV3QkMtw2uFNp1CtF6c7r9PiYYqG1qFFt2tgILgxW9lImbY2rLZO8Gb1ZEPUG
	6mB8MtYAMxd10P5hraCgCJ60eY0ahMUfvube/9zcY1/pxbZa3RVRXfFS2irwdqc9Rhrzf9mDBhg
	BCAdQ6Q9j6sesopOirBTPb+V3/KE5QAUuh9XiCgHHDifBVybQaiUdVM0UimebOR08M8nNVN+xJ5
	/rbDj7WYhzJZLjoqtn20RpeJkwaCabgMF6befnalLBD/48xCOSJFfTiIMX62hfua1l6XiIk2pp5
	yfLaUBNFk7V2Pn7rO2q1S+PeWpktUe88oRA1pS4mrv9zQA7kTqdp72kZXiUZPow8Un2iIkt4Ty4
	eLPxnJVwZhBcX4b+C2kAmn+sBp4T7jxKngh7omZOqiivHv0d98G+I0R/j36CH2u3YR+hmLPgJC4
	MlVg0TBpI4aUAk58hMIDrV3ZTBxNRTvvEvIXAzoF1vM3nFgUKLXcCOgW8PAHl/8=
X-Received: by 2002:a05:6402:a6c7:10b0:6ac:73f8:2e4f with SMTP id 4fb4d7f45d1cf-6b756aeaf80mr752992a12.29.1794283043237;
        Mon, 09 Nov 2026 19:57:23 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.57.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:57:21 -0800 (PST)
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
Subject: [PATCH bpf-next 01/15] xdp: reserve an skb core extension area after the xdp_frame
Date: Tue, 10 Nov 2026 03:56:59 +0000
Message-ID: <115997f55d63b507ce54fbe9e22900b59016f3c3.1794281983.git.tianyi@cloudflare.com>
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

Reserve the skb core extension area in the headroom, right after the
xdp_frame. An XDP program stores RX metadata there for the skb that is
built later.

The area begins with a header, struct xdp_skb_ext. It records the offset
of each entry and the end of the last entry, in 4-byte units.
bpf_xdp_adjust_head(), bpf_xdp_adjust_meta() and bpf_xdp_pull_data() use
xdp_skb_ext_end() as their lower bound, so packet data and metadata
cannot overwrite the entries.

The XDP_FLAGS_HAS_SKB_EXT flag indicates that the header is valid. Most
drivers reuse the xdp_buff between packets, so xdp_prepare_buff() clears
it. With BPF_F_TEST_XDP_LIVE_FRAMES, reset_ctx() restores the flags
before each run, and ctx_was_changed() compares them.

Suggested-by: Jesper Dangaard Brouer <hawk@kernel.org>
Link: https://lore.kernel.org/all/1d5521eb-84fc-4417-a3f5-6366694d160a@kernel.org/
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 include/net/xdp.h  | 45 +++++++++++++++++++++++++++++++++++++++++++++
 net/bpf/test_run.c |  4 +++-
 net/core/filter.c  |  8 +++-----
 3 files changed, 51 insertions(+), 6 deletions(-)

diff --git a/include/net/xdp.h b/include/net/xdp.h
index 07231adfb5f8..c888353425d4 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -81,6 +81,9 @@ enum xdp_buff_flags {
 	 * XDP program is not attached.
 	 */
 	XDP_FLAGS_FRAGS_UNREADABLE	= BIT(2),
+	XDP_FLAGS_HAS_SKB_EXT		= BIT(3), /* skb core extension header
+						   * is valid
+						   */
 };
 
 struct xdp_buff {
@@ -146,6 +149,16 @@ static __always_inline void xdp_buff_clear_frag_pfmemalloc(struct xdp_buff *xdp)
 	xdp->flags &= ~XDP_FLAGS_FRAGS_PF_MEMALLOC;
 }
 
+static __always_inline bool xdp_buff_has_skb_ext(const struct xdp_buff *xdp)
+{
+	return !!(xdp->flags & XDP_FLAGS_HAS_SKB_EXT);
+}
+
+static __always_inline void xdp_buff_clear_skb_ext_flag(struct xdp_buff *xdp)
+{
+	xdp->flags &= ~XDP_FLAGS_HAS_SKB_EXT;
+}
+
 static __always_inline void
 xdp_init_buff(struct xdp_buff *xdp, u32 frame_sz, struct xdp_rxq_info *rxq)
 {
@@ -174,6 +187,7 @@ xdp_prepare_buff(struct xdp_buff *xdp, unsigned char *hard_start,
 	xdp->data = data;
 	xdp->data_end = data + data_len;
 	xdp->data_meta = meta_valid ? data : data + 1;
+	xdp_buff_clear_skb_ext_flag(xdp);
 }
 
 /* Reserve memory area at end-of data area.
@@ -450,6 +464,37 @@ struct xdp_frame *xdp_convert_buff_to_frame(struct xdp_buff *xdp)
 	return xdp_frame;
 }
 
+/* skb core extensions: RX metadata that an XDP program stores in the
+ * headroom right after the xdp_frame, for the skb that is built later.
+ */
+enum xdp_skb_ext_id {
+	XDP_SKB_EXT_HASH,
+	XDP_SKB_EXT_VLAN,
+	XDP_SKB_EXT_CSUM,
+	XDP_SKB_EXT_NUM,
+};
+
+#define XDP_SKB_EXT_ALIGN	4
+
+struct xdp_skb_ext {
+	u8 offset[XDP_SKB_EXT_NUM];	/* in chunks of 4 bytes */
+	u8 chunks;			/* same */
+};
+
+static __always_inline struct xdp_skb_ext *xdp_skb_ext(struct xdp_frame *frame)
+{
+	return (void *)(frame + 1);
+}
+
+static __always_inline void *xdp_skb_ext_end(const struct xdp_buff *xdp)
+{
+	struct xdp_skb_ext *ext = xdp_skb_ext(xdp->data_hard_start);
+
+	if (!xdp_buff_has_skb_ext(xdp))
+		return ext;
+	return (void *)ext + ext->chunks * XDP_SKB_EXT_ALIGN;
+}
+
 void __xdp_return(netmem_ref netmem, enum xdp_mem_type mem_type,
 		  bool napi_direct, struct xdp_buff *xdp);
 void xdp_return_frame(struct xdp_frame *xdpf);
diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
index d6c9dc62182e..f25581851339 100644
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
index 9245009d9f1e..4f6698f75d90 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -4243,9 +4243,8 @@ static unsigned long xdp_get_metalen(const struct xdp_buff *xdp)
 
 BPF_CALL_2(bpf_xdp_adjust_head, struct xdp_buff *, xdp, int, offset)
 {
-	void *xdp_frame_end = xdp->data_hard_start + sizeof(struct xdp_frame);
 	unsigned long metalen = xdp_get_metalen(xdp);
-	void *data_start = xdp_frame_end + metalen;
+	void *data_start = xdp_skb_ext_end(xdp) + metalen;
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
+	if (unlikely(meta < xdp_skb_ext_end(xdp) ||
 		     meta > xdp->data))
 		return -EINVAL;
 	if (unlikely(xdp_metalen_invalid(metalen)))
@@ -12794,7 +12792,7 @@ __bpf_kfunc int bpf_xdp_pull_data(struct xdp_md *x, u32 len)
 
 	start = xdp_data_meta_unsupported(xdp) ? xdp->data : xdp->data_meta;
 
-	headroom = start - xdp->data_hard_start - sizeof(struct xdp_frame);
+	headroom = start - xdp_skb_ext_end(xdp);
 	tailroom = data_hard_end - xdp->data_end;
 
 	delta = len - data_len;
-- 
2.56.0

