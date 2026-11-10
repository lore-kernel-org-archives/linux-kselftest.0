Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283067;
	b=j0x3/C7EVuydVvUuL2B3MVlFxlWYXeoJeXc5bleZ0xzkl4kx8dtGJjL8jQR1O+alw22q
	 njUX1g6goZAvKolvQoGnCw5Jtr0mhDbx1Pxgg0zXqAZwlrRnyeDD2HuaJXDBnWUM9/xEX
	 MaH938bCt8dAi7VBtkOVFtriTH3NaEafTJRIPPyQXz9iVKj1HsisaUjUAFoFELJOoBU7f
	 M6maaUR3mTnoNW5l7ljD7wH/fdfPdxHN0kHqUOlO62huRzQfUo76OdvdbdiQHL14rBSPb
	 HQEQREw0K7kMzmt3MtHv+/nFZKSO9ltFRhCuAy10M75oycRN6k1OlQUnPZj3V8j4GdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F9EfUz+UskV0rhf4cQXQsxZ2euYB/mU/YoxBROtxa6Y=;
	b=LquwxUO0xO+OvWyU/OTzekPsdD0dVfBd0rz7qde8wstfUhBdF1gUAJEVCuyKIExKYYYG
	 iNsJ+qsGnmrOgNfWE2Bw/cA23dvNFTQHN5SpjjmCCCqGM0fbdW/pGeJtLWc5L/dawnwSH
	 Ga6OcQb0IEvInY/no8I2AVmJbbXHhvbqgELltyf+TevcEUoSjF6OZo/3PGUz4G55NWF6b
	 W7PJcUWum4S7VPapZIgrGwk4TCBix5JECmLS83xujd9wX8Q8yMadUi+ve4KnJJXQww6gU
	 U99HOAEOZP++6BOwCxsgpyOtnKogm2JEcP204AnIpQc2P8E+OoSPvSZT9/ueGAUCgIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=QBmHh+94;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB5260A261F
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 03:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CB5260A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=QBmHh+94
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b5669a5100so2127125a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 19:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283065; x=1794887865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F9EfUz+UskV0rhf4cQXQsxZ2euYB/mU/YoxBROtxa6Y=;
        b=QBmHh+94xIdnicj/GHNGgXHLPODmnXcib34+US8v+VulSQchcVNYTAcJgrF8kD27yn
         159A+e/3oF9zJh3zibDHlJn4v2exjs5bhQTXhHQy8BqyusXMiLI1nAk4D9/VYvaJ0Cpf
         +4L+BAw62Tppwk4wku7PiTGsxMF1YVRqO2D8icO71M3HmBIyAhjhuZ0l+F2LLZbPvp1N
         4PE0ksIiuW6wjUp3UZ/eOlhCPJJqsxn1uqUuWBYSJjDtUC3c9y3XWC1+/j1YGrHNeHRh
         8gDmSfAgs4zKpnYQmWLXMNF0R58lNTK9wnt/bQIL/G55ElOkTw1tXrv/tYHisWJNCQI6
         mqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283065; x=1794887865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F9EfUz+UskV0rhf4cQXQsxZ2euYB/mU/YoxBROtxa6Y=;
        b=lLjFkTvhQAMJo32z7Lkv49gI3o+D2xKi7F0Bak3HwzyEq4WpFtgmg3AgXkb8T//Wzi
         MCzHEkKTYK3NvfdfV4r1g7onbSjfrF6Zh4q7iAX+EIe19+aI9bqEwkszF//fa85X6mSA
         R0QKxaz/uQv7hTUZhJqZkVlbhCpXDcUVozNphGrrA91rdpqtcQQu2bLXbZ2NZnE7l10j
         NA/sEmyfIOWQFfq9ljpKDttwXD4hlABS+rdAWNwd0Z0Lub7QJNRPDSq0ulp/peWANjon
         PhZqSGMYVwHwHg3iW4Gxh2EOZqpTJGZvk6SXGKdNLb6AKSF2E1eiGNFfkaTODgh6CuM3
         ulIQ==
X-Forwarded-Encrypted: i=1; AL+hErFTORRymhWyLOtP/Y9CxRlzWVgcYxuw84j0xo2iFjMwfydeEOHzV8UG0Hw6fmofHaVhnaevfLwqH9337E2D3fc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iDv7Jiu2SCWts/5V1frk0i4hgo5443WqwFXaH5Jk4WwPgDjoj
	5PBGwH/+1qdqyTotVjgl7kuZBM+HQ/+5g2plVMJqL6H1jjR+g81K3R3zMUNVax75oQ8=
X-Gm-Gg: AYBFou1gCl/SRKy7V/VBV2pf01ihHR5PPP/WaVK5ngfmRbFIRZYER+oM7QT0KzaOtq5
	t6yDvZhbNIV1geCgEoPvC7wxrlkejCgywOEtYRvmgqzOBtYqxyQFyhgjcCmhYPoYX5DgiaguVQO
	dZB7afqbmekBUXezB4he1W8UNO5k4iMZWXILdVrecpWP8Jd9kQccm3XcwTcWB5OfIWbJlPf7swO
	EVZOkueEKKy6tk9satoWuXy972cW9POM+WrJrotDG3a7ntyHKABJkvJvXmPjSTDhUJkQc+hLoOG
	30y/AA1gmUlNhiyGxAQdV8yRPITMuPQsMTU5ypiIk6yROgFvKstvyBkbJGPDRjK0cJlkmSatqML
	NjQUddLU1y7T0tVb/LtkUgzyHsGOhNaJQ+L37Bes7gKoXB8WHzB+/486W9+IsUuLkfep70eDA1j
	nKZt/OcX4hCilAi16+vZAaxQskcFNQ94HaX607o+7oBhSX8MrcgZA6sVYxMmxAh2KTbDNKoXxN9
	MRxLKG09A6l3S0pE6jWXV3kFYQDVjijunMlhYvPKE06kmqvjJjo1OxoiasxAsZXMQ4BiesOta9k
	EL7K2/iD6Mg3vzJVdliKiJAE1eR1ek4dCZZV+CVKFudqxoMl2OTfYFTUD3CYEiI=
X-Received: by 2002:a05:6402:2750:b0:6b3:b10c:40f9 with SMTP id 4fb4d7f45d1cf-6b756af5982mr1263386a12.31.1794283065131;
        Mon, 09 Nov 2026 19:57:45 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.57.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:57:43 -0800 (PST)
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
Subject: [PATCH bpf-next 07/15] xdp: set skb RX metadata from the skb core extension area of xdp_frame
Date: Tue, 10 Nov 2026 03:57:05 +0000
Message-ID: <eca7d73b0881b59f0f7b3cf8d6e022e70c8ed800.1794281983.git.tianyi@cloudflare.com>
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

cpumap, veth and BPF_PROG_RUN build the skb from an xdp_frame with
__xdp_build_skb_from_frame(). It now calls the new helper
xdp_skb_ext_to_skb() if the xdp_frame has the XDP_FLAGS_HAS_SKB_EXT
flag.

Three drivers (atlantic, mana and netvsc) call the wrapper
xdp_build_skb_from_frame() in their RX and TX routines, and then set the
skb fields from the RX descriptor or transmit the skb. The stored values
must be ignored there to keep their behaviour consistent. So the wrapper
clears the flag. A driver that supports them calls xdp_skb_ext_to_skb()
itself, as ice does in a later patch.

xdp_skb_ext_to_skb() is based on [1].

Link: https://lore.kernel.org/all/175146831960.1421237.9105904582430357235.stgit@firesoul/ [1]
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 include/net/xdp.h |  7 ++++++
 net/core/xdp.c    | 54 +++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/include/net/xdp.h b/include/net/xdp.h
index d8b77d80bfbe..7c9a812b6e86 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -329,6 +329,11 @@ static __always_inline bool xdp_frame_has_frags(const struct xdp_frame *frame)
 	return !!(frame->flags & XDP_FLAGS_HAS_FRAGS);
 }
 
+static __always_inline bool xdp_frame_has_skb_ext(const struct xdp_frame *frame)
+{
+	return !!(frame->flags & XDP_FLAGS_HAS_SKB_EXT);
+}
+
 static __always_inline u32
 xdp_frame_get_skb_flags(const struct xdp_frame *frame)
 {
@@ -503,6 +508,8 @@ static __always_inline void *xdp_skb_ext_end(const struct xdp_buff *xdp)
 	return (void *)ext + ext->chunks * XDP_SKB_EXT_ALIGN;
 }
 
+void xdp_skb_ext_to_skb(struct sk_buff *skb, const struct xdp_skb_ext *ext);
+
 void __xdp_return(netmem_ref netmem, enum xdp_mem_type mem_type,
 		  bool napi_direct, struct xdp_buff *xdp);
 void xdp_return_frame(struct xdp_frame *xdpf);
diff --git a/net/core/xdp.c b/net/core/xdp.c
index eea04e7b7204..9f311b3c0d2b 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -829,10 +829,10 @@ struct sk_buff *__xdp_build_skb_from_frame(struct xdp_frame *xdpf,
 
 	/* Essential SKB info: protocol and skb->dev */
 	skb->protocol = eth_type_trans(skb, dev);
+	if (xdp_frame_has_skb_ext(xdpf))
+		xdp_skb_ext_to_skb(skb, xdp_skb_ext(xdpf));
 
 	/* Optional SKB info, currently missing:
-	 * - HW checksum info		(skb->ip_summed)
-	 * - HW RX hash			(skb_set_hash)
 	 * - RX ring dev queue index	(skb_record_rx_queue)
 	 */
 
@@ -857,6 +857,9 @@ struct sk_buff *xdp_build_skb_from_frame(struct xdp_frame *xdpf,
 
 	memset(skb, 0, offsetof(struct sk_buff, tail));
 
+	/* The callers set the RX fields themselves or transmit the skb */
+	xdpf->flags &= ~XDP_FLAGS_HAS_SKB_EXT;
+
 	return __xdp_build_skb_from_frame(xdpf, skb, dev);
 }
 EXPORT_SYMBOL_GPL(xdp_build_skb_from_frame);
@@ -1065,6 +1068,53 @@ static void *xdp_skb_ext_add(struct xdp_buff *xdp, enum xdp_skb_ext_id id)
 	return (void *)ext + newoff * XDP_SKB_EXT_ALIGN;
 }
 
+static const void *xdp_skb_ext_get(const struct xdp_skb_ext *ext,
+				   enum xdp_skb_ext_id id)
+{
+	u8 off = ext->offset[id];
+
+	if (!(off & XDP_SKB_EXT_ENTRY_ACTIVE))
+		return NULL;
+	off &= ~XDP_SKB_EXT_ENTRY_ACTIVE;
+
+	return (const void *)ext + off * XDP_SKB_EXT_ALIGN;
+}
+
+/**
+ * xdp_skb_ext_to_skb - Set the stored RX metadata on an skb.
+ * @skb: The skb that is built from the packet.
+ * @ext: The skb core extension area of the packet.
+ *
+ * Call it only when the packet has the XDP_FLAGS_HAS_SKB_EXT flag.
+ */
+void xdp_skb_ext_to_skb(struct sk_buff *skb, const struct xdp_skb_ext *ext)
+{
+	const struct xdp_skb_ext_hash *hash;
+	const struct xdp_skb_ext_vlan *vlan;
+	const struct xdp_skb_ext_csum *csum;
+
+	hash = xdp_skb_ext_get(ext, XDP_SKB_EXT_HASH);
+	if (hash) {
+		enum pkt_hash_types type = PKT_HASH_TYPE_NONE;
+
+		if (hash->type & XDP_RSS_L4)
+			type = PKT_HASH_TYPE_L4;
+		else if (hash->type & (XDP_RSS_L3_IPV4 | XDP_RSS_L3_IPV6))
+			type = PKT_HASH_TYPE_L3;
+		skb_set_hash(skb, hash->val, type);
+	}
+
+	vlan = xdp_skb_ext_get(ext, XDP_SKB_EXT_VLAN);
+	if (vlan)
+		__vlan_hwaccel_put_tag(skb, vlan->proto, vlan->tci);
+
+	csum = xdp_skb_ext_get(ext, XDP_SKB_EXT_CSUM);
+	if (csum) {
+		skb->ip_summed = csum->ip_summed;
+		skb->csum_level = csum->level;
+	}
+}
+
 __bpf_kfunc_start_defs();
 
 /**
-- 
2.56.0

