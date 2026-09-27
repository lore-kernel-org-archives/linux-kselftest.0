Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FF63CAE95
	for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 21:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546042; cv=none; b=GsYRPn9abGqj+BJkDs+F2OJWbDTmGD6ImIFUj2YbiwCNUBVq0KS0TvpxLkpkqbI1CBkPC5EJG2eP7t1lKVLm43hQw2opX6OCHhSWIWXANTbVemFTSZFgzRMi3Ajb8T1KDU7ZzIuxSCfbMYnG2xQCJdiOsWZQvKCX9dwk21/79kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546042; c=relaxed/simple;
	bh=xrUo7eJDknue4jHQW8YLudmxiQL0GJSon9qQwPgr2M8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HryXeeczN8WoYTII5bEu8DgPIzvEePNIWy+9hBOk8tefty6lsMsNinNxWNF5iWNIGnD85c4IP0pCmlOVarlJ+sSMuhi+Uf0Kae8Fs5C3C+qF+aDHQVaXpRXiYMWNe3kCKc3YeYx41G3A99iljCudz3suNEUtZZI5m4Nwx+rcVn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHnx/r6Q; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHnx/r6Q"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so5075965e9.3
        for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 14:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546037; x=1791150837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hG1F4NjMgvfqDxejRjw93Y89wPHj58dXwI/MFbotKmk=;
        b=kHnx/r6Q7dsuKgWipXPcd2R62dAeyGhDHmrMEIDWVE9n1d/Me2bb6OGQdobnb/ZA4z
         Ng3zTbTwZN4rBxPbAM0/q8An/8nFwx4J5mL428uZMVqn6CF0Ia/eyteIk0ruzyxQyDPT
         XPGsm0HsXFN82JJdAMjSVoPc7g7uifBjYds28ZnXK/h0xStY5I/tZW2+oBQPMWFKhwfs
         ti6UdL4bRS8FsQn2cXKdosZy77bAP8gxRFddufNcSrXfcgYbtD9s55EImvp/CY46BEws
         5rE/JLEEnMx/El7aWR6Cm57xeCZm7dDMCVvgFL6MADCCua0OVLeTRWqYPJAXZGsXGnMg
         +1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546037; x=1791150837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hG1F4NjMgvfqDxejRjw93Y89wPHj58dXwI/MFbotKmk=;
        b=fWyyv0TOGljJQsfSa5w5jT8cgYcugNbNCsQ/21AB6g42UyZv2eeNUmh6C/F5lxQJJ7
         q8M/+Gjve3zW618mJf3tGMwPjz4djNRve2R6md2hwtiK7AcyxI2ArnIxknmzYcZTcogp
         AbAZj8xoN77hQYGqDU+PDrwPmFW6TtkNG+DII2ZYdJAeD/9JGS3hgs5qjpwOQMSMz0Zl
         0t3r0X08E9udq21jKHXaO+3S/zvm60Pf3DzlGKA24z65EwyxMI/r5FZyubtIKdiHwe8x
         BEtJvDmrYpYkTK+lFxXSnr8IUid5CK3wMonOX4X3pn4VxcZLwvRbF3dlHG5tKEOqOoef
         HFiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxn70MeYiZFWY5xCgjyd/M/BG9dgTjrLEXShPf8kGBtwWXo9wfPhnhM6wdKAlLtX9lYdniYURwKX1fzr9PChwI=@vger.kernel.org
X-Gm-Message-State: AFuF++kACHo0P7Wcb89khuYGYEZ1KuK+jesdr5RnUJL8oY772yOMOcXU
	wvhDSm8YU9utx42FbtsCIBP8ATbDNhljjN7AWmp6kKUmFOMK9EpZk5US
X-Gm-Gg: AYBFou20t0gaLge4fifM1526ov/h0TdXTPddJSHde0ZJ7mhLuXpKbHIaEE5BWpjSXJ3
	V18dYNho3lzGpViC3MbBvDDO2fvZ3Q3tgUVgPQMEardTOlPfEhT4D1LhIL0JVUJuDWutNXlMawR
	4m429JGbNFgUAlaUgLViWyEnM/gTph1azYO9o9mOrlRGfpBSJWF8sZD7kqPfQRACW8IlJE9B8Uk
	Z3iDj0qVXqHM7aHWnnFKgLpV8SlRkidlWJTwC35wIXuGQYKs76yR8KZAk5dAzeMvXhFMBHxnujC
	2rb7nduXXJBkJs69z2OqJFqDAyFBuwlhscUHZaxdjpwsYosCVzBQLhas7dwrsY5AKBWLfF5qSQK
	99+moFnLD5z+OHBuedSW/OD36qjuD4JAEK6ShxMxWGLMHwNTjsXxvE/sv1RVsjbjXSXntCmM9D0
	YGWMGBBJb7zFvY3JS+qeqSbc9YPDK70hpBQR9b4jfkE41o2QkeW/ap5tMM4pQq260=
X-Received: by 2002:a05:600c:4ecf:b0:4a0:108:3b54 with SMTP id 5b1f17b1804b1-4a001e8c316mr34108535e9.32.1790546037536;
        Sun, 27 Sep 2026 14:53:57 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001922102sm89556865e9.15.2026.09.27.14.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:53:57 -0700 (PDT)
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
Subject: [PATCH net-next v3 2/6] vxlan: vnifilter: reject VNIs outside the 24-bit space
Date: Mon, 28 Sep 2026 00:52:05 +0300
Message-ID: <20260927215209.2581830-3-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927215209.2581830-1-alishmery18@gmail.com>
References: <20260927215209.2581830-1-alishmery18@gmail.com>
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

Notes:
    v3: was 1/5. No code change; the changelog now says the out-of-range rejection lands at policy validation, which holds for a multi-entry message once patch 1 links the nest.

 drivers/net/vxlan/vxlan_vnifilter.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index d391ec579661..9cffaf4998a9 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -459,9 +459,15 @@ static int vxlan_vnifilter_dump(struct sk_buff *skb, struct netlink_callback *cb
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
@@ -814,7 +820,8 @@ static int vxlan_vni_add_del(struct vxlan_dev *vxlan, __u32 start_vni,
 			     int cmd, struct netlink_ext_ack *extack)
 {
 	struct vxlan_vni_group *vg;
-	int v, err = 0;
+	int err = 0;
+	u32 v;
 
 	vg = rtnl_dereference(vxlan->vnigrp);
 
-- 
2.53.0

