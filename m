Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0BA3C8C52
	for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 21:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546044; cv=none; b=bQF5Ox/WPbf/fTCfE48PjlX1GDeNL3AZCE/Jko3XXpSul25PoMOFEeXPPCiOp5qSaVsBBSfc5+zX1nvsDef3z1IlPwwPPGJEtHxbEqEfHhieBw/yUkXTv0833EdRSdmWa8Hr3YZYPOJ0mhvZYJeGqZI4O2WIXASiKPhlz8qAUcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546044; c=relaxed/simple;
	bh=zBCIAG1MKLAtjIU+6hKDk2Wf5/IUNYQLmG3+Eth/4mU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5TyhqveU18Mbuhu8NOW1yVWmV4FqRMn90kXPAqFtjnNEjS07PQuiTd31v9ZxQVX3jsQI5S0Wy3xA5rnemEo2zIQ1xNcjkfNm3PIAbUeY+S5VNLscC41/8SA7QoX+4TKGjzz2bSTAkBxdmHL3GAA3CC4RruFQV/hfcHfAuHrSzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLU8YS8S; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLU8YS8S"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso8676465e9.0
        for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 14:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546040; x=1791150840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fdd6B5ClKk5POZ9//IjIW8bzEvh8NM84J0neA7j6Ya0=;
        b=VLU8YS8SZMBDYal7actMobSW/3rB18Hn4fkQ+X9z/RYgNYk214sZ4rkUQicdiX6gaD
         4eBjaRFU1JPbjVEQjinyVFl9taFGHYmO7RTaLQuHaz4bYNujtUbhNO4mhLbQ4GFtfnv+
         KATUf+tnwq9rD8ODA6MYw0ZmFOal9V4hGo0WoPudOMTdvF75tYENhR6DCCKR/i0qPYFK
         TQcxuCtZUYmmuss9GGAF3Om1DdUYbX4webi1aKyaS/hII/ctXHk41WzweHWJybzT/b3V
         nX+Tj6LFrWjfshWMYdTh22J30X8RlRGGHgYC3WNzh0l95CmSo+1E4Ss9qVoARh7APoUh
         sz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546040; x=1791150840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fdd6B5ClKk5POZ9//IjIW8bzEvh8NM84J0neA7j6Ya0=;
        b=LVXGMFIAOhxs/phY14m+a6MjA+gAfa+TQy8MkOpS49XPpFumK947C1IuPxjSWfqwF7
         0dkZc90pSx0dnD9HrLMZN1NjYcOR34AztqJJqfiUn4DnEW1A5G4IacZCRX+DLWKjzIq9
         wgN2G1IzFfw0z3zqVzuMlDOgzrGenfUA1KnLwzkoU4qAWTWhjjKMoBZ2rrP3rzIXX09H
         g/AVkSwirOqWK2my8C0D720vqOq/Qk/E8aJWTA7EtxRPQAAhcr8FdhopXzg7bNlPqwsq
         zD8h9gvgKxFyvsUv8zWDdYuG1PFpuh+43L1r8Bk5o90w8a6HWplDMhPb7PALSE25UFEF
         hWLw==
X-Forwarded-Encrypted: i=1; AKwUvBwi4oRegFnh2OYip+IhS2l0Nind9ds1ZyonOCPcRdimN7s0lA8nmIuIXpriQZ2t2qxIFkWvW3wKyui8LZCzfqc=@vger.kernel.org
X-Gm-Message-State: AFuF++ke+BM2+q3OBwNKp0FYzYZNKG1oS0PFbFPJnsFy4kYy/m530gqs
	X+B6LgFnDr9nap89vveWQscE3UAjq4u4mH3JiMWQOkIGK7o4CcQG9iBv
X-Gm-Gg: AYBFou0ve5LqH/WIErAYXHZli5uUxsvEr1vZMv3dBMJlu2O59D15dUMfmsp3p/zpFqC
	waXMPzqNLZDLoe79Quq3S0BeB1d5dhCOiKHwucsQwVVCsJijL84Np/a23nzGjmypxdJEIpaAZVP
	v1wHETey/kRNkyu+Eo826oORxjEtWlYUiGxzKp0k2WE2Svon3u12AkV228+8+R1r8vx9uYGw2Kq
	9j3wUyL28CH8QIs4tDO3GhFklhXkYoaFVrD9MaM+qIdogT6c7Kmz9j5wAakgYe82KQDeUZNYo6M
	/3+Guq7jZ9DCy1pCdgkF5ucu6veaekDi3IVkg+gFp8uTm6geVhjZn/bnwubgcznlobn3YsVCLLN
	8R69zDlKrMiyzAHad/vl+eW5ABz0Pa479OYJs3JTMI+pZz7hzIKqsa3yAG34DqV/Q0ZD9LCEb0j
	dKq8bG4g14wzzppFgOk5UhWiXlFwUxeI8MYfU5cQW1a8/QF4muzl871Xelv65CwL3wo2idUbLhe
	Q==
X-Received: by 2002:a05:600c:34c6:b0:49e:7cff:f8ca with SMTP id 5b1f17b1804b1-49fe66f4dc9mr236370295e9.29.1790546040233;
        Sun, 27 Sep 2026 14:54:00 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001922102sm89556865e9.15.2026.09.27.14.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:53:59 -0700 (PDT)
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
Subject: [PATCH net-next v3 3/6] vxlan: vnifilter: bound the number of VNIs one request may touch
Date: Mon, 28 Sep 2026 00:52:06 +0300
Message-ID: <20260927215209.2581830-4-alishmery18@gmail.com>
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

A single RTM_NEWTUNNEL or RTM_DELTUNNEL message can ask for the whole
24-bit space in one range. vxlan_vni_add_del() then walks it one VNI at
a time under rtnl_lock, holding the lock for the length of the walk.
That walk is the cost being bounded, not the memory: an add allocates a
VNI node and a per-CPU stats block per VNI, a delete creates neither,
but both walk the same span and hold rtnl the same way, so both are
bounded.

The span of one VXLAN_VNIFILTER_ENTRY is not the quantity to bound. An
entry carrying just START and END is 20 bytes on the wire and a message
may carry many of them, vxlan_process_vni_filter() being called once per
entry, so bounding each entry alone would still let one message ask for
thousands of times the limit. Sum the spans of every entry and reject
the message as a whole in vxlan_vnifilter_check_msg(), before the
dispatch loop: entries are applied and notified one at a time, so a
limit enforced during dispatch would return an error only after every
preceding entry had been acted on. The range extraction is factored
into vxlan_vni_filter_entry_range() so the count and the range later
acted on cannot drift.

The limit is 4096, following the usable VLAN ID space, since vnifilter
is mainly used on bridged devices where the VNI is derived from the
VLAN. It bounds one request, not how many VNIs a device may hold: the
whole space can still be installed in more than one request, and a
device holding it is still torn down in one step by
vxlan_vnigroup_uninit(), which is device teardown, not a netlink
message, and is not subject to this cap.

This is a policy narrowing of what a single message may ask for, not a
fix for a crash or corruption, and is not a backport candidate.

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Assisted-by: LLM
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---

Notes:
    v3: was 2/5. Symmetric cap kept (bounds add and delete); changelog reframed around the rtnl walk, and the dump-range asymmetry moved to patch 4.

 drivers/net/vxlan/vxlan_vnifilter.c | 89 ++++++++++++++++++++++++++---
 1 file changed, 81 insertions(+), 8 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 9cffaf4998a9..13f4e115701a 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -17,6 +17,15 @@
 
 #include "vxlan_private.h"
 
+/* Maximum number of VNIs one RTM_NEWTUNNEL or RTM_DELTUNNEL message may add or
+ * delete, summed over all of its VXLAN_VNIFILTER_ENTRY attributes. VNI
+ * filtering is mainly used on bridged VXLAN devices where the VNI is derived
+ * from the VLAN, so one request touching more VNIs than the VLAN ID space has
+ * no practical use, while an unbounded request walks the 24-bit space one VNI
+ * at a time under rtnl_lock.
+ */
+#define VXLAN_VNI_FILTER_MSG_MAX	4096
+
 static inline int vxlan_vni_cmp(struct rhashtable_compare_arg *arg,
 				const void *ptr)
 {
@@ -846,12 +855,78 @@ static int vxlan_vni_add_del(struct vxlan_dev *vxlan, __u32 start_vni,
 	return err;
 }
 
+/* Derive the VNI range one VXLAN_VNIFILTER_ENTRY selects. Shared so that the
+ * count taken by vxlan_vnifilter_check_msg() cannot drift from the range
+ * vxlan_process_vni_filter() then acts on.
+ */
+static void vxlan_vni_filter_entry_range(struct nlattr **vattrs, u32 *vni_start,
+					 u32 *vni_end)
+{
+	*vni_start = 0;
+	*vni_end = 0;
+
+	if (vattrs[VXLAN_VNIFILTER_ENTRY_START]) {
+		*vni_start = nla_get_u32(vattrs[VXLAN_VNIFILTER_ENTRY_START]);
+		*vni_end = *vni_start;
+	}
+
+	if (vattrs[VXLAN_VNIFILTER_ENTRY_END])
+		*vni_end = nla_get_u32(vattrs[VXLAN_VNIFILTER_ENTRY_END]);
+}
+
+/* Reject a request touching more than VXLAN_VNI_FILTER_MSG_MAX VNIs before any
+ * of its entries is acted on. Both add and delete walk the span one VNI at a
+ * time under rtnl_lock, so both are bounded. Entries are applied one at a time
+ * and each one notifies as it goes, so a limit checked inside the dispatch loop
+ * would leave the entries ahead of the offending one already applied.
+ */
+static int vxlan_vnifilter_check_msg(const struct nlmsghdr *nlh,
+				     struct netlink_ext_ack *extack)
+{
+	struct nlattr *vattrs[VXLAN_VNIFILTER_ENTRY_MAX + 1];
+	struct nlattr *attr;
+	u32 vnis = 0;
+	int err, rem;
+
+	nlmsg_for_each_attr_type(attr, VXLAN_VNIFILTER_ENTRY, nlh,
+				 sizeof(struct tunnel_msg), rem) {
+		u32 vni_start, vni_end;
+
+		err = nla_parse_nested(vattrs, VXLAN_VNIFILTER_ENTRY_MAX, attr,
+				       vni_filter_entry_policy, extack);
+		if (err)
+			return err;
+
+		vxlan_vni_filter_entry_range(vattrs, &vni_start, &vni_end);
+
+		/* A start above the end selects no VNI and costs nothing;
+		 * leave it behaving as it does today.
+		 */
+		if (vni_end < vni_start)
+			continue;
+
+		/* vni_filter_entry_policy has already bounded both endpoints
+		 * below VXLAN_N_VID, so one entry adds at most VXLAN_N_VID and
+		 * vnis cannot wrap before the test below rejects it.
+		 */
+		vnis += vni_end - vni_start + 1;
+		if (vnis > VXLAN_VNI_FILTER_MSG_MAX) {
+			NL_SET_ERR_MSG_ATTR_FMT(extack, attr,
+						"Request asks for more than %u VNIs",
+						VXLAN_VNI_FILTER_MSG_MAX);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int vxlan_process_vni_filter(struct vxlan_dev *vxlan,
 				    struct nlattr *nlvnifilter,
 				    int cmd, struct netlink_ext_ack *extack)
 {
 	struct nlattr *vattrs[VXLAN_VNIFILTER_ENTRY_MAX + 1];
-	u32 vni_start = 0, vni_end = 0;
+	u32 vni_start, vni_end;
 	union vxlan_addr group;
 	int err;
 
@@ -862,13 +937,7 @@ static int vxlan_process_vni_filter(struct vxlan_dev *vxlan,
 	if (err)
 		return err;
 
-	if (vattrs[VXLAN_VNIFILTER_ENTRY_START]) {
-		vni_start = nla_get_u32(vattrs[VXLAN_VNIFILTER_ENTRY_START]);
-		vni_end = vni_start;
-	}
-
-	if (vattrs[VXLAN_VNIFILTER_ENTRY_END])
-		vni_end = nla_get_u32(vattrs[VXLAN_VNIFILTER_ENTRY_END]);
+	vxlan_vni_filter_entry_range(vattrs, &vni_start, &vni_end);
 
 	if (!vni_start && !vni_end) {
 		NL_SET_ERR_MSG_ATTR(extack, nlvnifilter,
@@ -975,6 +1044,10 @@ static int vxlan_vnifilter_process(struct sk_buff *skb, struct nlmsghdr *nlh,
 	if (!(vxlan->cfg.flags & VXLAN_F_VNIFILTER))
 		return -EOPNOTSUPP;
 
+	err = vxlan_vnifilter_check_msg(nlh, extack);
+	if (err)
+		return err;
+
 	nlmsg_for_each_attr_type(attr, VXLAN_VNIFILTER_ENTRY, nlh,
 				 sizeof(*tmsg), rem) {
 		err = vxlan_process_vni_filter(vxlan, attr, nlh->nlmsg_type,
-- 
2.53.0

