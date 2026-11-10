Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283056;
	b=AaKvorfCopGAw2WIGwgf5M2ybcRJ3EXBMqAiUK9QNd52o8y5Pc2SIJbZTjhk4FXVC82H
	 bZ0lqcd3KlhgAOmebrYO/chPsvtihTsKBI5kLDKdalKZeagMCNz4Mso3CRIOhhjKmR9SH
	 /NeLPooaW+GhB75kjbJF8sLQxGZbQJIk8UXQtdDTOY6dicHwoHOVElOvY6fvhiCGcP8Jq
	 BWe+TIxynnKg8uXWDm60ZSP91NsuuSvdqvaAqdhqtAOkjd2fAGyPDS1iUdnfXBbByVQSJ
	 UzL+AJS53PFUbYm4cRJbRD0ZtpGqVh0gtgU6fC70Y0fSi5M0rjjJePWdoijw+DUR1pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EC2CxfAA6gR7S2oAAPp+eS1dDml83jpwhvD444kpRqo=;
	b=1PLJ+15HB3RJ/9Dk90NIX4u3VjP47yQZLovtUMToUZTzGSSqiQTLIdFNw1x1yeqFISvT
	 MBq/VsVnDrS+NGzqr02LNTsfMlZwHuRJo0wlO4gD36PGME3quuypI/bBcp78D7pUEt8Ki
	 kX4f8p22UA5C6VG8OHDiDgw1zwg/KiBssJ4ozs2AzRwKjHnOlZK45V6dlzCj9NpJL1d/i
	 eU+tlAAhmyY9gcLIREa6CAxxwhpI1Uv8BYp+5lT2DF/PyWyKo/rIhYhHOpK7F1BOlwPhU
	 wxaZLR0upI8HD9DnQNgxjKjhRw5Eq7FfYZ1pklSEu5TtOo+8+ARqQRZljM7lr+WgSBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=doJtRZHT;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDE7606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 03:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFDE7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=doJtRZHT
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4682977f9aso193870566b.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 19:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283054; x=1794887854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EC2CxfAA6gR7S2oAAPp+eS1dDml83jpwhvD444kpRqo=;
        b=doJtRZHTNbnpgwY0Tk0QABAt2OJ4W+o0eKi+YWqBAxLx0axLIIEdnuobt4IeXlgIWE
         ITthrLWGQp3Qff4FnMSUWWMW/YsigFzb/d3b3ddZBxAWfbgsU17JxO+UYSa+IyHxuD2X
         zr/rJSKY1isl/vKP32lbRu88ZwvOxVaqBgFgEkYzqQhtg1z49MD5EtVbQCRGP8HdiJ43
         dEEBVvvp29r4yGqP6aBpbKGaFq/8OTOQWdKcKr7Os5OpAdRrGUqg48/3pDEVhSElID/5
         ji1nW9x+H9xk9Oa/a24heU8amtkcVtMEV73aIyT+bjvpB90Zeb5tsLWkedaEE5UoGzRc
         MRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283054; x=1794887854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EC2CxfAA6gR7S2oAAPp+eS1dDml83jpwhvD444kpRqo=;
        b=Z06NJy1T+jW3iS9Ob1OCERVxglbwNwde2z9lGoVqy/bm2HpfT0cYqz5gFfWvZ+xFN+
         83okokeifSQiqy6ZEW4q3U2MVo1MDyJs2wfHMPpyq9LnHZAY1dyWi0lx4kftpHxjxbpB
         sSgfs+/Zvx3QKhwdPNpNN+FpPg7gyH9rdzDjY4sZO8kNldC5xm52BPwtQchQ4LWY+4pQ
         r4YWJdAiIUd6JpiLrEI12yS0cicy4yi7vRaU2x32UDd31HDiXt6EcWujsmFsQA8AOWGj
         OSQJTA8JxC5FNWj9skr0Cau5FpJ6L6ILQOGS4dLKyMSchFOwfVtws/SjBZe/eGrrQ+ik
         r2MA==
X-Forwarded-Encrypted: i=1; AL+hErFsJagFT61eo7Du0UdOkET8rfE7iXFKB6L81No1n5ypE0xvTMr+P2FTiS9jLW9leiX5341w9d3XM8Kn1S8LkDU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k0nBWTndy1E2Q8urUgNuslPzGRVQ6rU4q2sDqlSdg+fGejd8W
	NzBRfp1aFGEhmJau2mfy+K1bKCBdJ4LliD8RIxjdRsjeLD8XCQUOHiDj6kEsgyJDlGM=
X-Gm-Gg: AYBFou3AoyTbFL6EvedG2qqVjeW29/y2eoxs2+pC141o138OXAACp4T3V/lWC4+HG1Y
	lpsrvqF6p97FWfzItrWyBt1fqRZibixCUtC2M+vHM0JIhGvTW0Emss5xywb8s67nPJmaRkwqNnH
	vklzwM8c3w2aDF8fwCtqIM7sqk1QD71C8Vz1JUe0tAWpyE9N9FyF29kZH97JkKaJONkhVqM0ZYE
	Or50r7BznA777D58s5keeMMzF6jnA0cVd93gzG+DSgYhOtyYCEV1ZAJpBqtIQA/S+O4lsGCW/c1
	LPhBZOXRKRG+51VK3wyZJrVoHbWah1F0X2mVMJcHBby6Kl9kiFSvMCJXWeE6+z545hRGoSP2Xtp
	yh5bN7LDqSIdk1aAJQNRGhk4QeAVH7MJFxFo9lEALjioITg+mXUe9R7GOO5Uxns38I14PldMm4M
	vF+zjgAdqNnhRraAjSahZwXNZjlaHUDj0lwHCKu2lDnOgRr0AayHK/KsYgAehLBRm5zzyVuA8S4
	LqTDgLo+JI0mnzrSxfUso2PFketd24bgrIFKmpFRkjLy91S3r6l1Q3EFBqu8dmi9hjOR5XWPrIX
	K/kT7Q15EfvNkYYYYYXRUB3yGZKgwbzxZ/vusmhv+EadFWu0wV+X2wYA9JWaklU=
X-Received: by 2002:a17:906:364f:b0:c2d:be57:f73a with SMTP id a640c23a62f3a-c504952c083mr70409766b.13.1794283054469;
        Mon, 09 Nov 2026 19:57:34 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.57.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:57:32 -0800 (PST)
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
Subject: [PATCH bpf-next 04/15] xdp: add a kfunc to delete skb core extension entries
Date: Tue, 10 Nov 2026 03:57:02 +0000
Message-ID: <2892d19e606e3809c268de0610a4ccc8bf68625a.1794281983.git.tianyi@cloudflare.com>
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

bpf_xdp_skb_ext_del() deletes the stored entry for an id. A program on
cpumap or veth can use it to drop RX metadata that an earlier program
stored.

Without the XDP_FLAGS_HAS_SKB_EXT flag, the kfunc does nothing, because
the header bytes may then belong to the packet.

The kfunc only clears XDP_SKB_EXT_ENTRY_ACTIVE, so a later store of the
same id reuses its offset. The flag and the size of the area stay the
same, also after the last delete. To give the bytes back, the kfunc
would have to move the entries after the deleted one. The cost is
headroom that bpf_xdp_adjust_head() and bpf_xdp_adjust_meta() cannot
use.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
__skb_ext_del() frees struct skb_ext after the last delete, because it
comes from a slab cache. The skb core extension area uses existing
headroom, so it is not freed.
---
 include/net/xdp.h |  8 ++++++++
 net/core/xdp.c    | 26 ++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/net/xdp.h b/include/net/xdp.h
index c888353425d4..23c976e92898 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -486,6 +486,14 @@ static __always_inline struct xdp_skb_ext *xdp_skb_ext(struct xdp_frame *frame)
 	return (void *)(frame + 1);
 }
 
+static __always_inline struct xdp_skb_ext *
+xdp_buff_skb_ext(const struct xdp_buff *xdp)
+{
+	if (!xdp_buff_has_skb_ext(xdp))
+		return NULL;
+	return xdp_skb_ext(xdp->data_hard_start);
+}
+
 static __always_inline void *xdp_skb_ext_end(const struct xdp_buff *xdp)
 {
 	struct xdp_skb_ext *ext = xdp_skb_ext(xdp->data_hard_start);
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 97dc0e403a78..2c1d5ec3311b 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -991,6 +991,7 @@ bool bpf_dev_bound_kfunc_id(u32 btf_id)
 }
 
 #define XDP_SKB_EXT_CHUNKSIZEOF(x) DIV_ROUND_UP(sizeof(x), XDP_SKB_EXT_ALIGN)
+/* A deleted entry keeps its offset, without this bit */
 #define XDP_SKB_EXT_ENTRY_ACTIVE BIT(7)
 
 struct xdp_skb_ext_hash {
@@ -1119,11 +1120,36 @@ __bpf_kfunc int bpf_xdp_skb_ext_store_rx_vlan(struct xdp_md *ctx,
 	return 0;
 }
 
+/**
+ * bpf_xdp_skb_ext_del - Delete a stored entry of this packet.
+ * @ctx: XDP context pointer.
+ * @id: Entry id, see &enum xdp_skb_ext_id.
+ *
+ * Return:
+ * * Returns 0 on success, also when the entry is not stored.
+ * * ``-EINVAL`` : @id is not a valid entry id
+ */
+__bpf_kfunc int bpf_xdp_skb_ext_del(struct xdp_md *ctx, enum xdp_skb_ext_id id)
+{
+	struct xdp_buff *xdp = (struct xdp_buff *)ctx;
+	struct xdp_skb_ext *ext;
+
+	if ((u32)id >= XDP_SKB_EXT_NUM)
+		return -EINVAL;
+
+	ext = xdp_buff_skb_ext(xdp);
+	if (ext)
+		ext->offset[id] &= ~XDP_SKB_EXT_ENTRY_ACTIVE;
+
+	return 0;
+}
+
 __bpf_kfunc_end_defs();
 
 BTF_KFUNCS_START(xdp_skb_ext_kfunc_ids)
 BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_hash)
 BTF_ID_FLAGS(func, bpf_xdp_skb_ext_store_rx_vlan)
+BTF_ID_FLAGS(func, bpf_xdp_skb_ext_del)
 BTF_KFUNCS_END(xdp_skb_ext_kfunc_ids)
 
 static const struct btf_kfunc_id_set xdp_skb_ext_kfunc_set = {
-- 
2.56.0

