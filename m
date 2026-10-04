Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FEB3FE35A
	for <linux-kselftest@vger.kernel.org>; Sun,  4 Oct 2026 17:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134185; cv=none; b=nNWWhCDTKoL7+ZywRvKnJEaHnZLag7KsJ/Yi6X4aH+g+Kg+VO8Iz2Y3Enu5g6ezcnTMyuSOtwg1fCuTEs/6b89+9dqs6P8XVCNE2XHDETcmFPbPcEp3Yhu2XFWqddEXNhysLHrRrkPW85n7FulAf4G7n1brdQfkH8P4YaDGcku8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134185; c=relaxed/simple;
	bh=dj3NwmJPrPWb/bw6YKz6XnTWInhGE7dX0FcP3wklm9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EiENQ3QNkh8Fr5km7R+gOjvYD39meyVt3pPxZha0+lopcjrr5T8FCcxzBWY+lpmjy+noP37YJ45yD7N9knrpegml5e+JKiiKa+IS5i75v4s4E2Xrcxt2pxzN768hHFHKKgVj2noTSsGoNrnOwhjd0aqD9GXYClJQvuyjo87KYvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=Mm2sSM17; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="Mm2sSM17"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c264788fd58so187936166b.1
        for <linux-kselftest@vger.kernel.org>; Sun, 04 Oct 2026 10:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791134181; x=1791738981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQy1p6uH5D5EZA+BdR7YHzdsKEg9LefUPPRF/B7n4zU=;
        b=Mm2sSM17vVAzKT20oK0g+uDXswxBLImaEhGqc5eS2W6BQ0fQLZQkSY4HBP/KXxCE7t
         K327YbYlwP6WbZqWvZBDImm0ULDv9OxztUnJslzzlNrRdaTprV0/CHOonmKFaVQZf+ta
         7P3LXOTL30Py3LJhv0yMWRrmb2cvMgmYnar2XvOq95pg1wpyB4or1iiKjzo0m0l5n8SY
         eWdcrTny2rKauowywnxX8IOi510RUd+ZXGUEsDFfkrroIsk2aRFDx9FKW+ovwRXCNHoq
         XI4nQoCDvZQis7rPLfOPDH7lwjHVEc4T7ciNN2R8kQh2lnJU7ljA9CqcOBuabHZMAHaQ
         jF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134181; x=1791738981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DQy1p6uH5D5EZA+BdR7YHzdsKEg9LefUPPRF/B7n4zU=;
        b=AcpFDk34gjfFkA8+2Yr2XHsQRShGdRqxOsrb8tHtJAbLXjYDWyDg8PJEulb45VP3UC
         /drK5lqDLSzVeus4qnpZlRu6S0U7WAih+MtZmSQpjuh+BqP/58qF09fuU2vK51h8Jjos
         a+a9th1DdfvxVZ9ddCEzeuPynYuFnRP0AAK9qOVaLtV/66kgPZESpisUacb+KbJ2JIbj
         1ko13hFodlQiZEf+YTk7i2lYCXNuAAFxvUueXfxrWAL0tjpflpQ04oT8uihC6UUo51zL
         dfAfo9v/0BhCs6SdJFeHsVk4n+ecyfYMvY2wiV5GSG2w9ocJ1UaFuvVjNFRASdqUhXXo
         obIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJRp85W4MPqOsy5ffEjzSf26Yw37tyG8tH6LAaQ+GiqvK8bkq4rhHCjrvVlhsEaC+vhJ4clOkpQoLTxVoqLQU=@vger.kernel.org
X-Gm-Message-State: AFuF++m6DLC9rO3fff//TOZeblIeaEx8faeSSmyou9u4KrV4/vhDlpwV
	rlcgrAHuRruyEimBU5N24ddBn7GDRfRaBLbS7myxqtA6ndphKykRAkFLL0SgEkfoHg==
X-Gm-Gg: AYBFou31f3pqZFHTOT2UXeVdA9dpo8p1htNJHrjrHF9DK4AYYZcZFDy0ZFfkuc4xAUZ
	yOmygdH2k9JvQY/voSYxjCUzjzVbK2sxZIAzaXqJ61e0n4CYp2Htg0RHmqrPW7w4fhxby+ktJeY
	xAvgQ2iHvsGayOi3oDH0Fwt3ig2yEF9KAUAZ+Nav8nYaec0AtWX+Xl0AClUOvHIk8nF4RWGD0lE
	Xpqs8nPGWPzoM2ZqltpK+AlRdwnXiXLcSruw6+XG70Bo9m8Al20sd3TxAj9MKjZ0Pczy6H7/3J9
	AJf7hpFTsgQemDvGd/qhFPm2jqN1f9vyF9OK4vetM5FkONKS46UCmjYVkBA2UX2zMeB6ZliJHTl
	yHV/Efs4IC1tFFtdDHiuoKzjceo3ViSOobPkurR5ppqIuY8VJrvpeB5ZNWJNMonWpoyBRlVb3vJ
	Epnfza8MDc0eHSZAs/t+9RSKvTYcSWyxzqlV9XxQm5Xxpaek22NXASwAFrMuoBrW4ol3hYV/FIx
	ggAvXY8wHC04yIB+w2PaVyHkC9CNjeRfjfxCOxQ4Rq7ASFYVsW8FTDHkAG0DwAPPnnfYoCkTJ2Y
	5Bm/E72UJLzYEg4F1V3F5Agi1lxtOVqDFm+fVLyGIsIzb7z3TbxWvetuczwSZfpi6dybIom5s2u
	oUopEMsIs6Hr7dTLf54fa+wdDBq6zT3vdMPJ+eYsxiMMYKDi38Vxzzza1Pevjx/B6Y7sG/74EDL
	5ydxr76r991GA95cfDDDTG+pOU
X-Received: by 2002:a17:907:7281:b0:c2d:c6e7:9e9f with SMTP id a640c23a62f3a-c2e4ad3fe21mr707178466b.27.1791134181453;
        Sun, 04 Oct 2026 10:16:21 -0700 (PDT)
Received: from Desktop (pd9513667.dip0.t-ipconnect.de. [217.81.54.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd278cesm314885266b.37.2026.10.04.10.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:16:21 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netfilter-devel@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nbd@nbd.name
Subject: [PATCH nf-next 1/3] 8021q: add vlan_dev_sw_netstats_rx_add() and vlan_dev_sw_netstats_tx_add()
Date: Sun,  4 Oct 2026 19:16:14 +0200
Message-ID: <20261004171616.3544880-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004171616.3544880-1-julius@bairaktaris.de>
References: <20261004171616.3544880-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let code that forwards packets on behalf of a VLAN device update its
per-cpu counters, like dev_sw_netstats_rx_add() and
dev_sw_netstats_tx_add() do for devices with tstats. The netfilter
flowtable fast path uses them in the next patch.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 include/linux/if_vlan.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/linux/if_vlan.h b/include/linux/if_vlan.h
index 20cc16ea4e5a..4873a12958da 100644
--- a/include/linux/if_vlan.h
+++ b/include/linux/if_vlan.h
@@ -231,6 +231,31 @@ vlan_dev_get_egress_qos_mask(struct net_device *dev, u32 skprio)
 	return vlan_qos;
 }
 
+static inline void vlan_dev_sw_netstats_rx_add(struct net_device *dev,
+					       unsigned int len)
+{
+	struct vlan_pcpu_stats *stats;
+
+	stats = this_cpu_ptr(vlan_dev_priv(dev)->vlan_pcpu_stats);
+	u64_stats_update_begin(&stats->syncp);
+	u64_stats_inc(&stats->rx_packets);
+	u64_stats_add(&stats->rx_bytes, len);
+	u64_stats_update_end(&stats->syncp);
+}
+
+static inline void vlan_dev_sw_netstats_tx_add(struct net_device *dev,
+					       unsigned int packets,
+					       unsigned int len)
+{
+	struct vlan_pcpu_stats *stats;
+
+	stats = this_cpu_ptr(vlan_dev_priv(dev)->vlan_pcpu_stats);
+	u64_stats_update_begin(&stats->syncp);
+	u64_stats_add(&stats->tx_packets, packets);
+	u64_stats_add(&stats->tx_bytes, len);
+	u64_stats_update_end(&stats->syncp);
+}
+
 extern bool vlan_do_receive(struct sk_buff **skb);
 
 extern int vlan_vid_add(struct net_device *dev, __be16 proto, u16 vid);
@@ -249,6 +274,17 @@ static inline bool is_vlan_dev(const struct net_device *dev)
 	return false;
 }
 
+static inline void vlan_dev_sw_netstats_rx_add(struct net_device *dev,
+					       unsigned int len)
+{
+}
+
+static inline void vlan_dev_sw_netstats_tx_add(struct net_device *dev,
+					       unsigned int packets,
+					       unsigned int len)
+{
+}
+
 static inline struct net_device *
 __vlan_find_dev_deep_rcu(struct net_device *real_dev,
 		     __be16 vlan_proto, u16 vlan_id)
-- 
2.53.0

