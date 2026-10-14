Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA134E8E18
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 12:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981616; cv=none; b=GfXtQURKyKUOoKNXt/8tCop1zjbnvAUyK6ojwsl3/VQFlntaum3b8cYQ1UStA3wTma8gpHkab86YK8FdQRQEZEaYw4w401mBRKU3M0X/IgIdGCZsgroJxsI0mNAFjlvTzy4o9a4prY80MUy/+y9EVAI330gWtKBFvXyiC6w4so8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981616; c=relaxed/simple;
	bh=xBZsWg657O0Kzvpg78Nn4idAJHQmNUGX/Dguk5wqE5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NA98SyP7QHsu1qnxSg89zgFromoSYdeGEJ+J2BRPuQRptJCWBhKkDESyOfishY9qULEZ7jyP/L/J4D9POBjdLzGWBUQYWqqnNEgA4H0+TVE/3UN2gLRWPwUK25rN/Fuqx85XGSe61V70lhjStxhrPfgNEkmbEdbDDB80Q4z5Y1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oTWTwB/P; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oTWTwB/P"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso38102875e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 05:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791981607; x=1792586407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7j8lPCn9h1uuA3yPP/goaFyMU1vXNQ0kqv5qfig57c8=;
        b=oTWTwB/PphcFSQeYz+4CjijfFO7mTevKds5hwY9pTUDls4MIk87n2a4mlOfvwnmfQ1
         sHbqjFnPptVawAXk72tUJBxucGi7IMOO5VRdHR/ufnDbdp5Nm+5sZwXxLi/x68Tecj5s
         2F/yGvPIxStwasiwwrHSngiqIU/DRr+jCeQPEtv03hS9FjPIQ5eqJtfem6W7fiaOi6L9
         jmuLlxSHYWUzQ24gBMUtc/tUyqPOEDOHEee3XMouFys2xPAyQezbX8muTxK+agijp+71
         hZEUag6ofcFuXkwOwBXf49BcnRpz//p/cfmz/YOyxcijTKF7PAl5bZtGhsRFnUXTY2gc
         WRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981607; x=1792586407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7j8lPCn9h1uuA3yPP/goaFyMU1vXNQ0kqv5qfig57c8=;
        b=nudP2YxLCepOk8MAkjzIdRlmpfBthtMnFAxo4/sCcbIaowOLU2pNImSRfb3pyKY4fX
         7qGKU6VSHFSb3Z8Fht1r1fjLlslOZSmxemObXnMdVFjT9t3i0Lk7Zf9bX7mJafjiJMmC
         UF/3DEa1AeyrYbCt3ofmZKQ9/91DmO5bGXEiTYb1gnIZHHGMD905NfyEzNsGhW9Ds5LI
         hon5z8MdPQx6+FvwlGhSJQKJQi5OCqjAH5ScDy60H3HA4NaIXQ4GTf8WWLD/ytecKyGQ
         ve45sBe+kdOWwRPaHGIzkiD28pYrm4Q7ldBGvXj93QgC2Z3Q2ywnDvmcH9FpdA0SId0f
         wWjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOUbaWacU/s6wpbJbOeMpadXc6EQ2zYszrjwoWytz5+JoRgZhgl7TkxbebgmnY0AKD/pbgy83ShcSWfkOf6OA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhn4LKYL8ep5YTG4bEWDNKJutHz8QkEieFxGVm98nzMXuahDfc
	828ZY1OIa3h6WWKD/ooDj3ieyNZSUWB8jeIuQNHscqVRqTfwVyHLc1DX
X-Gm-Gg: AYBFou1PT/BurZemo6LyWww4jyoRIDuC/XvJHmfSULQLkhrCRnrcDkFjuK55WSHMJEr
	9hdZTHWFTTncWd7yxncC9wvuA5ypqL5dAvYAFoSeJkcgMGEtVJVUD3pDVMpDG0XVlIERijbXw8u
	wybjGLhfWbFcK+NPnr7NQqXMIrmR56pP8vezY7JMhhWzAamMjKE1bmfnbdq6AQNhPKD2hkpXtYR
	7UluEgLoUdBd0TNeFFwIC09HXya5M8eiMimpzwjzgdNwnPBo/hqKdZFitZSYNCKKcmyu+nfI59d
	Y3vMsETSaqLpiGuTFdCcyVJeeHJRFQLmZ+YTlKrVmnUVsR+Bd9HBIUQj5sSIGdMYweGHAtT/9GF
	4Ff9zf6Y99Ht7VX0mf0eu/00SQLolDPXxNpNR718rMH0qDJY6rMmrLgRNNxnZATJrx+AHlX9Epz
	kl9LWTHZfa4oWBq90bfkI0tr/aW5jl6aapDTs5gN+F6yAmx+WKPAhDFT1qhpDWCy3zNV6aQvEXx
	Q==
X-Received: by 2002:a05:600c:5493:b0:4a1:78da:d271 with SMTP id 5b1f17b1804b1-4a18e4ee976mr343394145e9.30.1791981607167;
        Wed, 14 Oct 2026 05:40:07 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b2ec47fcsm54163165e9.1.2026.10.14.05.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:40:06 -0700 (PDT)
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
Subject: [PATCH net-next v4 4/7] vxlan: vnifilter: bound the number of VNIs one request may touch
Date: Wed, 14 Oct 2026 15:38:11 +0300
Message-ID: <20261014123814.388557-5-alishmery18@gmail.com>
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

The limit, VXLAN_VNI_FILTER_MSG_MAX (4096), is the one the preceding
patch introduced for the dump; it follows the usable VLAN ID space,
since vnifilter is mainly used on bridged devices where the VNI is
derived from the VLAN. It bounds one request, not how many VNIs a
device may hold: the whole space can still be installed in more than
one request, and a
device holding it is still torn down in one step by
vxlan_vnigroup_uninit(), which is device teardown, not a netlink
message, and is not subject to this cap.

This is a policy narrowing of what a single message may ask for, not a
fix for a crash or corruption, and is not a backport candidate.

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Assisted-by: LLM
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v4: use the constant the dump patch introduces; rebased.

 drivers/net/vxlan/vxlan_vnifilter.c | 80 ++++++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 8 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 5beec29eb84a..2999dd536625 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -971,13 +971,79 @@ static int vxlan_vni_add_del(struct vxlan_dev *vxlan, __u32 start_vni,
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
 	const struct vxlan_config *cfg;
-	u32 vni_start = 0, vni_end = 0;
+	u32 vni_start, vni_end;
 	union vxlan_addr group;
 	int err;
 
@@ -988,13 +1054,7 @@ static int vxlan_process_vni_filter(struct vxlan_dev *vxlan,
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
@@ -1104,6 +1164,10 @@ static int vxlan_vnifilter_process(struct sk_buff *skb, struct nlmsghdr *nlh,
 	if (!(cfg->flags & VXLAN_F_VNIFILTER))
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

