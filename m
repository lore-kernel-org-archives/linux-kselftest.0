Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694536;
	b=oZUCbwSMYYTFXtAIDse+G9TT2rjZZXQxEFe1qoWlPovgZg8DGokDDYHZnLnGg1fJXXUx
	 5fpt+JZDs2+14ps0TuVC3E/8CUquCvQIkAFAtOMDq3HQRwJ1MNdHA23YZ3uAuntZERYwJ
	 lymXTRIYSl0/moN8pa7cf6lwZZsYU3pMdE1SYUxFA2SJtNZFHnxg3v7T6HueRSrzce8IJ
	 rfI4fxCD+K38rQipCjB4rOTwtMis8g7KPH3fE3C5DzntJPnGJmBuyN4zkrEp8bYb1dnoi
	 TIGehKk/Q3limmnzYsTmIhagUqtMYWSXknagtxYfvQb/OBoCWfWpALsehEn4S2bzA3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sFCil6/GykmHC8UZ+eSxB0rc3OAECvi79g/NHfkD1vc=;
	b=31CV8tsFS4J36WJW2v72pIHXPZXBR5PWZBptLx1Ml1fa/jiCU1de8SlhDfu3tu88m6gR
	 jV98fwFVlnMO9HFTR9W+xOTAmKLSy0lbhXridjptLRojzmijkpOY+MPtczi6O806KPQGX
	 Sv2eaQ6on4DTMw7LXkIu1C8yC4rEe5jZTzyQnHBGzdwg9l2L6MFJXlCwYBhCnIYXP3jHk
	 mWqe6ldCeX7Egj2cfvVwdgmuMQU/s2VJXKN+rK42N3wNww+RftZPUWoqBshete/43uSue
	 s4vEfSNVYssNl26pU/lNS/rEgUgbaNQtsUT/aaxdF5ASW24SHBPgirzHZSYQHadjXvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdIQm6En;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE328606A891
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 22:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE328606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdIQm6En
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso11916785e9.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 14:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694534; x=1795299334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFCil6/GykmHC8UZ+eSxB0rc3OAECvi79g/NHfkD1vc=;
        b=kdIQm6Eno9IUfOMTOu8gndMuAs02BU2lSZB4SE1JJ0QophMAJF6Yowsx7p9Y+QlcCg
         kMrrQGfi4vH14yn/H1RziG363GHfFRfvBlYINIPtTn77YUvMeaIJHQzYNTj5X4lXHs+7
         QB5lCvQzeV90uRiDrejM1eBiaj9RpG1f/isUqLYfZFjUjyl2zTwbu3OHOZxFuToEd8U+
         WQATOqMZ4EkHyoTBM9ToJI+cPYR9YnGtDjORBdsQtJ/ImXUhX0tgmydJZgR4d8HcF77e
         6gGlAQBcZq3flcLXg9kCgc2wGaBk5kMywdelpvB5afNYq6QdtIIulbsk0dp+LIb1S3J2
         gxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694534; x=1795299334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sFCil6/GykmHC8UZ+eSxB0rc3OAECvi79g/NHfkD1vc=;
        b=T7eqNfCiRG2zlPAoMY6HSVRkfB1QtVRd2tAzXspOqnhkLVylBy4R9A521rc09YLOKx
         XfUtonIUleWPYh5TZULiMbUN/Zaz1K8OL3zbQ+OXIQiVFRbF9MYqfWg41WfR1u3/X6Kv
         mzoEBAmWrnpCaeI2UjrNaEJNkKO2mgRq/LoEczd1E8RoQEsrWoKq95UhHOvc57kQQL3n
         KGWTSYSrKhK+SKv2sQBvlRBIreNzrsafK5gRSolppLT6H9dfNllItgzOnwlpSSoJDPnM
         rmGwKVTC8dN7FKyO/heOZ1y1NU9zMkzTnsGOY0H+NqCHfe6rzJ5Wuujx9QWv7jEgbliT
         jtTQ==
X-Forwarded-Encrypted: i=1; AL+hErHFOMiwniNwhJtisiADbmQXbd15wKutRvwE01H3TEoHI59gw0UMviKMXcstJGRXaWljfgNTTBZBCew5rHFBESE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EkmqTmAuCKg86rh+x6oYELXereLJO0RRZvkoEo4+xGeKC6R38
	uYOnjIrO1+cj6RbIWAMjE08dJ85hMjBC8sHkRhUjtHy4Fa8hrDttXuSH
X-Gm-Gg: AYBFou1g1Nt+yBE3aAkIdM7XMclCzlvCxoUnv64mBMmdxv3sDvMIGcBuWp/DqITuPpM
	UfLWvrXqf85R7NoLN7kThOLaoMAPe9wbVJ3X9Melg75TGeycCteyLmIwV1CCpOPTizvx4wauDMc
	Hhmm0JsIg+RtUUI/oyPbNgYeGm5+nXPJkXFTT6urpfLGR2fHT61S6v/oFH/Cox6Jzlme/QiGsBB
	Xo0V+W7/dZPHOCvECoQK3c70PLF8la12eBXpRKeBoc3RwjvmPk/Kkfanp4x1muZuHTpcwUx/jL/
	G6Qd3IkiBbJIkluFTdT0NRKjmVWJ8lw0NRS5+Lfgt95c6DIY/NgqHCE4E8NTKWq30GEPm6zPkKy
	OzSEf1fb8hyjiUTl2h+P0o+ZKYJlo+kUxj2XHUck0wQ0PJt72QVfMdifMB1MhcsWNYhXiRqrBSi
	V6z+DbPig6vTRApKkERPMtFmGvxCqvQnveQdEyFPNXLbdsM3MzYOPqCYJG3T7lBBG8qYyldZO1E
	AMP6Ao/u6flNlk2BVQVeN111FAY+iVqpR8/pAJv7uKD2957DedfugKzT7ZAlY4W+cKoVQfYKj+g
	pa46rbhJQz8II9iWNC+kfX/FsZPMchRZcyYDiNpDybUK9A==
X-Received: by 2002:a05:600c:3e19:b0:4bb:665f:7e52 with SMTP id 5b1f17b1804b1-4bb665f8108mr45213385e9.10.1794694534138;
        Sat, 14 Nov 2026 14:15:34 -0800 (PST)
Received: from kali ([169.224.126.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm13514941f8f.8.2026.11.14.14.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:15:33 -0800 (PST)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	kuniyu@google.com,
	petrm@nvidia.com,
	aroulin@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v5 1/8] vxlan: vnifilter: reject VNIs outside the 24-bit space
Date: Sun, 15 Nov 2026 01:14:05 +0300
Message-ID: <20261114221412.255825-2-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114221412.255825-1-alishmery18@gmail.com>
References: <20261114221412.255825-1-alishmery18@gmail.com>
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
already does for its own VNI attributes. Since commit 599d0e97610f
("vxlan: vnifilter: validate the VXLAN_VNIFILTER_ENTRY nest") linked the
nest to this policy, an out-of-range endpoint is rejected during netlink
policy validation, before vxlan_process_vni_filter() runs and before
anything is allocated. Without that commit the range would be checked
one entry at a time, by the nla_parse_nested() in
vxlan_process_vni_filter(), after the earlier entries of the message had
been applied. How many VNIs a single in-range request may span is a
separate question, bounded later in this series by "vxlan: vnifilter:
bound the number of VNIs one request may touch"; that limit is not a
policy check and runs in the handler.

Make the loop counter u32 as well. With the range bounded it is no
longer what keeps the loop finite, but it drops the undefined signed
overflow past INT_MAX and matches the u32 vni that vxlan_vni_add() and
vxlan_vni_del() already take.

Found by code review: vxlan_mdb.c range-checks its VNI attributes
against VXLAN_N_VID, and the vnifilter policy did not. In QEMU on
net-next (production build, 2 vCPU), VNI 16777216 is accepted and
stored, and a lone START=0xffffffff wraps the loop counter and keeps
allocating VNI nodes under rtnl_lock.

This targets net-next without a Fixes tag and is not a backport
candidate. Reviewing the earlier posting of this range check alone,
Jakub said it was either a security fix needing a stronger check or
something making things slightly better that did not deserve Fixes or
stable.

Link: https://lore.kernel.org/netdev/20260905123900.23984eda@kernel.org/
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v5: state the dependency on the applied nest patch, named by commit id
(Paolo and review of v3); name the cap patch by subject instead of "the
next patch"; the changelog no longer calls this "not a fix" and says how
the gap was found and what it did in QEMU (review of v4, sinfo bot);
policy lines wrapped to 80 columns; rebased. v4: no functional change;
rebased onto net-next.

 drivers/net/vxlan/vxlan_vnifilter.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 124ba47758e9..2b02f448c3e9 100644
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
+	[VXLAN_VNIFILTER_ENTRY_START] =
+		NLA_POLICY_FULL_RANGE(NLA_U32, &vni_filter_vni_range),
+	[VXLAN_VNIFILTER_ENTRY_END] =
+		NLA_POLICY_FULL_RANGE(NLA_U32, &vni_filter_vni_range),
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

