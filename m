Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF224E4C3C
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 12:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981606; cv=none; b=n5+BxgVfOp5lKwL1XMs/8HvlDl3+vYlha92doGaRA5A3P9uscyMXOu80cjdxYHl6zPpEFdQEtD9Eusy/u3W6UHzd1KtGRCIujwQzHjG2GgTcgDhME4UWEN9p6ceM4C2FTQN6DUDYLxv7Ocuw0Vc24QwMWvTeEhmBo+elDpBXfXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981606; c=relaxed/simple;
	bh=Ksp4EgliF7QzcdXzGDFAVUiL11TloA7f+lfEnZXBD2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nxggWlHRzMVavewzK05OTpPf+IMP8L7woqchn9/zbPWp/0yVKf8TBZhOo0WMfIFcjlux93vMP/57t/h8ffoeyi4rme/QPWDGhDbsCM34P7cmdmzDtac6T6C9chEh2ixGSICDJtNSN6tHDTQt7Vx+/6KKiH76TrY7TM0QElXr31I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkR+McFU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkR+McFU"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so24970785e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 05:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791981602; x=1792586402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXNpyqm5jy+6hjKyKFpoJe12RqunxSVKiBFsjy58fn0=;
        b=fkR+McFUqxCMgh/LtJQdKB5dtMWul3fmc9y1nbPzTFnGvO2a0wepY9DtguRNkvUQqh
         qvCWiCfYemdwB/yZ0FMxZ34CRZX/fEulp4wm20wURv7v8pSP1ifnylx5HIRj8cvQXx5W
         B++2Ta/yc4kFlbUz7WKYaccuf4rEtASR5n9lGkY2sjPvnY6bcXVaR0+J38GMZ6ye5Bbf
         rFO+1je63hWWw11IJe+p/LGP30gYvNOTMmsdf1UjXUqeF+XJEI73z6BGL8XtW22dhKds
         t+0u+xQ+OnvgHqRo+dWLEALmeK51KHgT54UpaAGziLWuBfmxHpJ92E5qrfsaO9ErflqC
         PWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981602; x=1792586402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hXNpyqm5jy+6hjKyKFpoJe12RqunxSVKiBFsjy58fn0=;
        b=YoVV4OrkXB+YPnBakX0i/TzKu2LAARmMOOz1lqjsdKkGoMoFZDLi/oYPND/xW4eBkv
         grgVOuZAwC66fMBJDERxmmpL6/bKqd1OvusihxPkYquDgtOYNymyBSeX73mvhkQerZge
         XiJ4VlU3wu9Mmbu7WFBgtiriVwETrg9IupcJd0ULTbIxvlnLIu4sTcm1qwGNAO90i4LX
         gJyUSEIW+DAeHI1VCwOp1wrtqfDiIzZwrLFi6zqRrGvZ358PT7bpLfZCr/PAhL1dsK2j
         wues4sAOcjQjRh30qq+oMl4hCsi6cP2JjAXyTi4k+4kiaMpcKTzAu2hjaAC26bo4MWUi
         ME2A==
X-Forwarded-Encrypted: i=1; AKwUvBzFLY743njJo3gPBz/Q5kiowvbsw/E4eJTXrW7n4pZ2lWg1ldl8jqXw5p5Cuc3BonOoxTJQXWAW3yDolHpfVbo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6rtag0h6TwGkdkUwCcJw1CTK0Aho7X3uk3WVwB0Gj0Q+xu6rQ
	yO5ZUHcPMBNInYw/03TbQiVB89VdxHsItMMha18apsvtVxne2ccwGmE6
X-Gm-Gg: AYBFou3kI/CdFmajsWyokzYSgL9EozllUEGvR02or69CyKmQE0KKOFgj5JXoufB4LZK
	+jKCpF2VIHbNzLLd8mALifU7vxEr6rHKUiCiXi49NJTrajHvJ+nU973gq6XiVEsmm0TKc/YJR9s
	7kJ93LYVwmATb07T9Y+xnCEfSIJSP7/PNc9W4mcODArkAX4NYEPx/rAemk6BM3hC1JaRm6luy8g
	GG7fbA8Unw8xK/eWbMBWa1dqkP/tGVyIZ/6aAuVS7SQ/JOVS08Ue0RkQ/aGPX70feKancS8V6Ca
	3KqCpHO8RaifoDkNWqMQAMVDU95s7RTUYcMlRnSSoSK2+ufQQgYjJTgv1icDLWo+n95ZFq1uWRo
	xWTPTYxPsorH1NcKsfdeyGb8VHogEb4RjPfU2KtnhkzYF7xRd3PyLq32nwArCRTzmNtWOvUSClQ
	iGYMaLvbjj/GIs6Nnj0Raxni/dcU82+K36TjT9LFZtwwJqHq07sw0t87bfY3ayVGfyyaD+oCFyO
	Q==
X-Received: by 2002:a05:600c:c113:b0:4a1:985b:83a9 with SMTP id 5b1f17b1804b1-4a1985b87f5mr174078275e9.4.1791981601878;
        Wed, 14 Oct 2026 05:40:01 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b2ec47fcsm54163165e9.1.2026.10.14.05.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:40:01 -0700 (PDT)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v4 2/7] vxlan: vnifilter: reject VNIs outside the 24-bit space
Date: Wed, 14 Oct 2026 15:38:09 +0300
Message-ID: <20261014123814.388557-3-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014123814.388557-1-alishmery18@gmail.com>
References: <20261014123814.388557-1-alishmery18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VXLAN_VNIFILTER_ENTRY_START and VXLAN_VNIFILTER_ENTRY_END are bare
NLA_U32, so neither is bounded before vxlan_process_vni_filter() hands
them to vxlan_vni_add_del():

	int v, err = 0;
	...
	for (v = start_vni; v <= end_vni; v++)

v is int and end_vni is __u32, so the comparison is done unsigned. A
request carrying only START=0xffffffff has vni_start == vni_end ==
0xffffffff and looks like a single VNI; v is then -1, the comparison
promotes it to 0xffffffff and passes, v++ makes v 0, and the loop walks
the space upwards from there, creating a VNI node and a per-CPU stats
block per iteration under rtnl_lock. Any range ending at 0xffffffff
behaves the same way.

Separately, a VNI at or above VXLAN_N_VID is accepted and stored even
though the VXLAN header carries only 24 bits: vxlan_vni_field() shifts
without masking, so such an entry keeps its own rhashtable slot while
being truncated on the wire.

Range-validate both attributes against the 24-bit space, as vxlan_mdb.c
already does for its own VNI attributes. With the nest now linked to
this policy, an out-of-range endpoint is rejected during netlink policy
validation, before vxlan_process_vni_filter() runs and before anything
is allocated. How many VNIs a single in-range request may span is a
separate question, bounded by the next patch; that limit is not a policy
check and does run in the handler.

Make the loop counter u32 as well. With the range bounded it is no
longer what keeps the loop finite, but it drops the undefined signed
overflow past INT_MAX and matches the u32 vni that vxlan_vni_add() and
vxlan_vni_del() already take.

Assisted-by: LLM
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v4: no functional change; rebased onto net-next.

 drivers/net/vxlan/vxlan_vnifilter.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 124ba47758e9..9e15f4de75c9 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -491,9 +491,15 @@ static int vxlan_vnifilter_dump(struct sk_buff *skb, struct netlink_callback *cb
 	return err;
 }
 
+static const struct netlink_range_validation vni_filter_vni_range = {
+	.max = VXLAN_N_VID - 1,
+};
+
 static const struct nla_policy vni_filter_entry_policy[VXLAN_VNIFILTER_ENTRY_MAX + 1] = {
-	[VXLAN_VNIFILTER_ENTRY_START] = { .type = NLA_U32 },
-	[VXLAN_VNIFILTER_ENTRY_END] = { .type = NLA_U32 },
+	[VXLAN_VNIFILTER_ENTRY_START] = NLA_POLICY_FULL_RANGE(NLA_U32,
+							      &vni_filter_vni_range),
+	[VXLAN_VNIFILTER_ENTRY_END] = NLA_POLICY_FULL_RANGE(NLA_U32,
+							    &vni_filter_vni_range),
 	[VXLAN_VNIFILTER_ENTRY_GROUP]	= NLA_POLICY_EXACT_LEN(sizeof_field(struct iphdr, daddr)),
 	[VXLAN_VNIFILTER_ENTRY_GROUP6]	= NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),
 };
@@ -914,7 +920,8 @@ static int vxlan_vni_add_del(struct vxlan_dev *vxlan, __u32 start_vni,
 			     int cmd, struct netlink_ext_ack *extack)
 {
 	struct vxlan_vni_group *vg;
-	int v, err = 0;
+	int err = 0;
+	u32 v;
 
 	vg = rtnl_dereference(vxlan->vnigrp);
 
-- 
2.53.0

