Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283082;
	b=LxEbFkiYnaL6u0jjmwwvBCRjiQ4nm+j+NBF0OOoqN+/QuNo+Ba0SynBOH/rZUzIh94PL
	 8vgDMy5BOLILkUZesvj1lBZmCAATtnc8J1aJkkbFOIAXjqiofOS3ZlFe7II2l6DKet0jR
	 a5Nz21kOqMXCUhbeOZivhTIFytB34A/om/dStEGqnBOEr0MGYmRY4YhzQpqyPx0M515qp
	 6aJIgs5EmeUJ/2roqxg46KIvhEj2lvqA7uFhhKSUmo0qijWR1n7puTCkBVE9yjvy9JK9l
	 03bGx8WwmA7AtarieWlsq7SFbFqJToL43UXgDWyrOb/eVsZCKpR/DPssSNU4VDLSEAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y1n75dlSKXk28YfIHQIdOaiTcHKQaKmSFDKJym+w+lI=;
	b=0aA27hLEoovGnt06huIQdKJyH//vxqRYFGwGFjuh4GE9AzF65A1G7moY5Cz55v6welWr
	 u4MM1KMXesZSgM+ggSA5s8L/6VZyPFJ7mho4DZd/K63S0bPfv6UnbZwMoaJe5cWFNqgPG
	 U9iXCE+nAJpfPSSfkRpuFGJ5JIo0P/LR0QVeYSGCFZ6FQUDeD/eyuzyxI2yKWC5YF8FcV
	 uKFQ4FiE0+A01NSWXndVG4R6TCy8ZieCAzOcn3yIlD/gd7fVDcV9p3wZmx7PCsBXYRP7p
	 ZPap8gbMuJWSAU+Tde+lU7CeRkSgzG36dRV/xPwapOj7avyrFrgJNmcCkl5uLl7+Q8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b="Zunm+lH/";
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BC560A3827
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 03:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91BC560A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Zunm+lH/
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b75712fb57so693493a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 19:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794283080; x=1794887880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1n75dlSKXk28YfIHQIdOaiTcHKQaKmSFDKJym+w+lI=;
        b=Zunm+lH/GCbrTUEtY30BW+R2BvU+2cGVOn79diffD/96JVNfHqCMaR5Gvvf1gsiQR6
         8K76zX1a8+Yh0L2CwsGxZPV8nUAMB+5w5Mm2MCgUMZlSCAEOfZgTki5qqXCp8mJUi8H3
         LuogYuTe3LX1ZCf6xxr7jaIlq6UqvCIrssX2U+lTHLsDy96Ui6AqusBcWrPzeruJ88YR
         /WMhErncCHO3cb8+1zwRpUullxN4yczarlTpXd5JcivujI0fDeVcEqJNPPwMrN68pevA
         Lx4AkP1fiMtHSuXKIJJQw0iIts5da1+6sBlWiXD7EvGQiIWRqgKUOxZqBjj3SECm1nA3
         YVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283080; x=1794887880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y1n75dlSKXk28YfIHQIdOaiTcHKQaKmSFDKJym+w+lI=;
        b=KBcpYLTsClF3GUmhLHfcAUc8njcMtFoIoc/vuBjO1F6nzSMIdrMTtK3W55svi3M6ww
         fFxDet9z0bvlH986VvrDLRghuukWiH6MqpYDgRO8MBNqb+YoQluDywQ+vuFnL4fKpC26
         GaonFi9OTF0Zs67cGyEpFwFkM0Iy6kdyMg+qRPiRtpi600RQgo3I7HOgRfI9OlOJaaNh
         C0u9xpbVbrb79AACTXbpSHOwAJdd7S6Sc62bQouRIlPsSV2Dslsrl3ByO5bpe4atQwRQ
         sMZll+/fbqD9RGDGtIAhBCR6FJJHByUFawP+Jr17+YsNWKy6B4hcWK0wp+FwkmhJ949j
         ZRvQ==
X-Forwarded-Encrypted: i=1; AL+hErHf5zGcNj8K/Hdqin7UVqSB49ZGwdl0BjOOA5ae4t50t9zi9n9rVgL26lfpZfaHwSgJKSkrNZRDgulxjF335Yo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+qtOUfSucpQol5/SNPoaD4pC9g8+kBC+1MmYktohZlhZ9y6k5
	R2zA+/hd1wVzZJbEx+ZEWm1ZaDx+1cZ0vP02KtWM1p/GvCOK960ZwEEHzT443lOsLeY=
X-Gm-Gg: AYBFou2fBIrS1Qr12g6kNWrawix++cwlidxQeA7EnER+kY9V+th6Tf0QkLqs1HgDuBq
	8RYmRNDPqbj0nLRL1O3pNUPeqoeK6eT9Pro39jtIxssj7LZOz/774P/C+FChwWHT6qnSrBIAHoX
	bKu0m6D6qzsrjbd4KyXpAGUYpzCThmgoT90VYkk0LkxL55xlOjVZdMByBNOWsvLAqJmCci+RvkB
	LGG/ZtSlybug10DhaJR9w7LnLyFaw3StlSwkfxI+d/WLOA3yS9YhOv6h4R7EXyHM0Vs3IcLk98X
	cq1Bq9ZtchVjxEhP0/rk+miiHO2fyx20PpUWUN460MKP3JEAOBFutZ3oOk7VFCLVnRuRBBmLzhl
	xYRDQ5JIQ+P6HiwXgwybOu5lCmabtbgi+eTJO+5e4KJ/DF4hdfsJCTrYkXG0Enus/5DP8lM23/K
	gGGIgHYskS3h0iXhAk4bvxyDIdDcAuUsVVUHfI7KUfPGSAIANslHTHQ30HzYEZM5MQwBsmqotLm
	tzzhUtH3u2W/xNqW5K5NOr0nPdSIzfJgN0btfRS1InP1JJb1YqEwWfYMKMcBUsnPcwpZ7IKcoPL
	tzZRT+84ee5isHQGu6RkCKba+GtsjJL4MV/Pga6qs7JAw66sikNEBCX1wq6BUok=
X-Received: by 2002:aa7:cd92:0:b0:6af:a64f:bd44 with SMTP id 4fb4d7f45d1cf-6b756b0d218mr745095a12.45.1794283080043;
        Mon, 09 Nov 2026 19:58:00 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579047c9sm548801a12.33.2026.11.09.19.57.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:57:58 -0800 (PST)
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
Subject: [PATCH bpf-next 11/15] ice: set skb RX metadata from the skb core extension area of xdp_buff
Date: Tue, 10 Nov 2026 03:57:09 +0000
Message-ID: <ae488c057454cd57fb01ac01aefc3e97d6271ada.1794281983.git.tianyi@cloudflare.com>
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

On XDP_PASS, ice builds the skb with xdp_build_skb_from_buff(). Then
ice_process_skb_fields() sets the hash and ip_summed from the RX
descriptor, and ice_receive_skb() adds the VLAN tag. The values that the
XDP program stored in the skb core extension area are not used.

ice_clean_rx_irq() takes the skb core extension pointer from the
xdp_buff before it builds the skb, and passes it to ice_receive_skb().
ice_receive_skb() calls xdp_skb_ext_to_skb() right before GRO. The
stored values then replace the values from the descriptor before the skb
leaves the driver. ice now sets the skb-ext-pass XDP feature.

Zero-copy is not supported in this patch. ice_clean_rx_irq_zc() passes
NULL for the skb core extension pointer to ice_receive_skb(). Hence the
skb-ext-pass feature does not cover AF_XDP zero-copy queues.

Export xdp_skb_ext_to_skb(), because ice can be a module.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 drivers/net/ethernet/intel/ice/ice_main.c     | 3 ++-
 drivers/net/ethernet/intel/ice/ice_sf_eth.c   | 3 ++-
 drivers/net/ethernet/intel/ice/ice_txrx.c     | 4 +++-
 drivers/net/ethernet/intel/ice/ice_txrx_lib.c | 7 ++++++-
 drivers/net/ethernet/intel/ice/ice_txrx_lib.h | 3 ++-
 drivers/net/ethernet/intel/ice/ice_xsk.c      | 2 +-
 net/core/xdp.c                                | 5 ++++-
 7 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index 454fba07d4ec..cb619689d11a 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -3461,7 +3461,8 @@ static void ice_set_ops(struct ice_vsi *vsi)
 
 	netdev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			       NETDEV_XDP_ACT_XSK_ZEROCOPY |
-			       NETDEV_XDP_ACT_RX_SG;
+			       NETDEV_XDP_ACT_RX_SG |
+			       NETDEV_XDP_ACT_SKB_EXT_PASS;
 	netdev->xdp_zc_max_segs = ICE_MAX_BUF_TXD;
 }
 
diff --git a/drivers/net/ethernet/intel/ice/ice_sf_eth.c b/drivers/net/ethernet/intel/ice/ice_sf_eth.c
index a730aa368c92..90f2ce5da022 100644
--- a/drivers/net/ethernet/intel/ice/ice_sf_eth.c
+++ b/drivers/net/ethernet/intel/ice/ice_sf_eth.c
@@ -52,7 +52,8 @@ static int ice_sf_cfg_netdev(struct ice_dynamic_port *dyn_port,
 
 	netdev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			       NETDEV_XDP_ACT_XSK_ZEROCOPY |
-			       NETDEV_XDP_ACT_RX_SG;
+			       NETDEV_XDP_ACT_RX_SG |
+			       NETDEV_XDP_ACT_SKB_EXT_PASS;
 	netdev->xdp_zc_max_segs = ICE_MAX_BUF_TXD;
 
 	eth_hw_addr_set(netdev, dyn_port->hw_addr);
diff --git a/drivers/net/ethernet/intel/ice/ice_txrx.c b/drivers/net/ethernet/intel/ice/ice_txrx.c
index a2c7c4962882..06a1a5fdc43b 100644
--- a/drivers/net/ethernet/intel/ice/ice_txrx.c
+++ b/drivers/net/ethernet/intel/ice/ice_txrx.c
@@ -966,6 +966,7 @@ static int ice_clean_rx_irq(struct ice_rx_ring *rx_ring, int budget)
 	/* start the loop to process Rx packets bounded by 'budget' */
 	while (likely(total_rx_pkts < (unsigned int)budget)) {
 		union ice_32b_rx_flex_desc *rx_desc;
+		const struct xdp_skb_ext *ext;
 		struct libeth_fqe *rx_buf;
 		struct sk_buff *skb;
 		unsigned int size;
@@ -1041,6 +1042,7 @@ static int ice_clean_rx_irq(struct ice_rx_ring *rx_ring, int budget)
 		continue;
 
 construct_skb:
+		ext = xdp_buff_skb_ext(&xdp->base);
 		skb = xdp_build_skb_from_buff(&xdp->base);
 		xdp->data = NULL;
 
@@ -1061,7 +1063,7 @@ static int ice_clean_rx_irq(struct ice_rx_ring *rx_ring, int budget)
 
 		ice_trace(clean_rx_irq_indicate, rx_ring, rx_desc, skb);
 		/* send completed skb up the stack */
-		ice_receive_skb(rx_ring, skb, vlan_tci);
+		ice_receive_skb(rx_ring, skb, vlan_tci, ext);
 
 		/* update budget accounting */
 		total_rx_pkts++;
diff --git a/drivers/net/ethernet/intel/ice/ice_txrx_lib.c b/drivers/net/ethernet/intel/ice/ice_txrx_lib.c
index e695a664e53d..85439853596f 100644
--- a/drivers/net/ethernet/intel/ice/ice_txrx_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_txrx_lib.c
@@ -247,17 +247,22 @@ ice_process_skb_fields(struct ice_rx_ring *rx_ring,
  * @rx_ring: Rx ring in play
  * @skb: packet to send up
  * @vlan_tci: VLAN TCI for packet
+ * @ext: skb core extension area of the packet, or NULL
  *
  * This function sends the completed packet (via. skb) up the stack using
  * gro receive functions (with/without VLAN tag)
  */
 void
-ice_receive_skb(struct ice_rx_ring *rx_ring, struct sk_buff *skb, u16 vlan_tci)
+ice_receive_skb(struct ice_rx_ring *rx_ring, struct sk_buff *skb, u16 vlan_tci,
+		const struct xdp_skb_ext *ext)
 {
 	if ((vlan_tci & VLAN_VID_MASK) && rx_ring->vlan_proto)
 		__vlan_hwaccel_put_tag(skb, rx_ring->vlan_proto,
 				       vlan_tci);
 
+	if (ext)
+		xdp_skb_ext_to_skb(skb, ext);
+
 	napi_gro_receive(&rx_ring->q_vector->napi, skb);
 }
 
diff --git a/drivers/net/ethernet/intel/ice/ice_txrx_lib.h b/drivers/net/ethernet/intel/ice/ice_txrx_lib.h
index f17990b68b62..cfc77847696e 100644
--- a/drivers/net/ethernet/intel/ice/ice_txrx_lib.h
+++ b/drivers/net/ethernet/intel/ice/ice_txrx_lib.h
@@ -133,6 +133,7 @@ ice_process_skb_fields(struct ice_rx_ring *rx_ring,
 		       union ice_32b_rx_flex_desc *rx_desc,
 		       struct sk_buff *skb);
 void
-ice_receive_skb(struct ice_rx_ring *rx_ring, struct sk_buff *skb, u16 vlan_tci);
+ice_receive_skb(struct ice_rx_ring *rx_ring, struct sk_buff *skb, u16 vlan_tci,
+		const struct xdp_skb_ext *ext);
 
 #endif /* !_ICE_TXRX_LIB_H_ */
diff --git a/drivers/net/ethernet/intel/ice/ice_xsk.c b/drivers/net/ethernet/intel/ice/ice_xsk.c
index 0643017541c3..f64659dc8313 100644
--- a/drivers/net/ethernet/intel/ice/ice_xsk.c
+++ b/drivers/net/ethernet/intel/ice/ice_xsk.c
@@ -670,7 +670,7 @@ int ice_clean_rx_irq_zc(struct ice_rx_ring *rx_ring,
 		vlan_tci = ice_get_vlan_tci(rx_desc);
 
 		ice_process_skb_fields(rx_ring, rx_desc, skb);
-		ice_receive_skb(rx_ring, skb, vlan_tci);
+		ice_receive_skb(rx_ring, skb, vlan_tci, NULL);
 	}
 
 	rx_ring->next_to_clean = ntc;
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 984299199906..fdda072a5858 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -1086,7 +1086,9 @@ static const void *xdp_skb_ext_get(const struct xdp_skb_ext *ext,
  * @skb: The skb that is built from the packet.
  * @ext: The skb core extension area of the packet.
  *
- * Call it only when the packet has the XDP_FLAGS_HAS_SKB_EXT flag.
+ * Call it only when the packet has the XDP_FLAGS_HAS_SKB_EXT flag. A driver
+ * calls it after it sets the skb fields from the RX descriptor, and sets
+ * NETDEV_XDP_ACT_SKB_EXT_PASS.
  */
 void xdp_skb_ext_to_skb(struct sk_buff *skb, const struct xdp_skb_ext *ext)
 {
@@ -1115,6 +1117,7 @@ void xdp_skb_ext_to_skb(struct sk_buff *skb, const struct xdp_skb_ext *ext)
 		skb->csum_level = csum->level;
 	}
 }
+EXPORT_SYMBOL_GPL(xdp_skb_ext_to_skb);
 
 /**
  * xdp_skb_ext_warn_pass - Warn if XDP_PASS does not use the stored values.
-- 
2.56.0

