Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B64237EFFD
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 22:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781736483; cv=none; b=Yaxqbdmtc+NDmwxFy63Gj9GYaOe/1A2/e+tHTJuXEw45IwM/j2zn6t+h9hP4Hdpyf7qkBjAWK9Z5d3V7Zp5AN01kwo9Lb1dD8lQpSjPKSlfXSW92ydkXT7lxhOcp7zXUZldmR+rRjEb3WjOsfZQ807YLhtTTIDhNYGHdTOAHqkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781736483; c=relaxed/simple;
	bh=tPkHru5q5q1nEArgBe2NPq67OssQ1NRA9w1d0hJndy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ba2qB51RtiynyAd2XG/a9n2efpnt/JxwVnEtvLUF35DAFWta1ANOd4gPXYIbUHc4lCDZ2MtjpivmknarBvA7LfqKRpthqW99Nf17ZPqTQyI2pue2qBdp3GfmZob3r/g0HFhSSEr2j7mE9j7sMgWUSnW0OLRVibyzikqV8+8FiQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=km4YlnTK; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="km4YlnTK"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0b9328c4aso2135035ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 15:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781736480; x=1782341280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlqZpxfKZoHcsQiFTzWpPXvPAT48qO2i6ysczS+SAw0=;
        b=km4YlnTKWQmk3wjMjqvRmY4xvfJlyzWAG01RHD1sw93J3NTDuuaOIh4wb0S+7GkRkv
         eZONfcOiD5bM7zO48PFG/jPlTcEhCYHAdCe6HAz7Ou3/4TI7rbIkQJZeTWSrbZO7tPIH
         l4M5akphUraRIDQWl+3P34+WnZEyYoGsxkUrZv/ZZVhBPPWe3VpituB/rnsZuuEQ7GrU
         EGzGbFZzJvEkm4DeASRnjfsrZRMLpyhZn/5snQZJ7h6HVoHFXOYbvhSubF7HSHD9XtmS
         YCWs6u+ZPSdNTKfI+CwfCZEsTKyytFwyo1pbnqciNpvxcQpwStZ3APwT1A7zkQLVuCtE
         8cCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781736480; x=1782341280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KlqZpxfKZoHcsQiFTzWpPXvPAT48qO2i6ysczS+SAw0=;
        b=MpDsUgfhTvOKOq8rdB2iGrUoRi38tI5uR7RgUDH8uCiSWelG/+jNDuGbrjP+9LLIJo
         aNTfnG+7SUVXYlh5EtV0VQjys3HbGygjzkjX5XIzJ4t5GaT7xBdeYb4RdGNvZh+hnKQk
         ah7+er0zPEYj89nTz0o3mgVk1i8OAFZKYawM1APMqlRRlu0rdU449DwWi3A7y4sMAukZ
         FJXc9gP5Flv6IsimWboRo7dFqm1CrrmD/kyTugcTy3Hmmyssf5rFlVzonm2dI0OCLjC3
         ld0OoCL7qH6o1M/7mnYnmPNbZ+eoJvLc1HLtiBVv4/3EoOAW1+CnN0cFtie2FMpu3b6h
         PP7g==
X-Forwarded-Encrypted: i=1; AFNElJ+NV67FPOIKeQW3A7YbOb5nlprKb1XwE683WhqNZTV5zvYioyfox8fpUN9KNrr/QTNqV1+5P83Y7V2sqZvMI/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDXNhvJcpj9Rw/czZWAVkg0faB07K5XA16EM4HE9XThnsXZsoC
	pwvRT/g2CVYMRzNt7yteoNN0twCnSWB/AdslMfnRsKEiSzf0oPbm//ek
X-Gm-Gg: AfdE7cnp/oUlwx4oxdW+Pvn+HEpMGbadycr3YtzpjhV6tJxwtCS1AlTv2vm1sk07CCj
	O1OOGvU7/c7iqMHiLSAhthsYgdlCAhOFliuH5m6+kqjiGjd+elVjk90zD/5JPrr+VBlB+1QjhMY
	n15qHR7u9m54T8taemr9fcJrNrCj95f8oNGSd6xP8OgrCe+SR9E11kLHQQ2o8D19YJPtgb648JL
	N059g3Iob9mbF1LWYdshButLoyHrEjW8vlZAIByjyr7OWFvxXJ1MLVmaDkTxZaoyx7cZbvjNcZE
	BNFcEJt8+fRLJTfytsCiu9ev8Oxrdb2ak2o3T9Y0ucZKgvnK7DJhZHGR8cSWIimAgvaj7A0jB+S
	1qD0dpMxwb3DedFysyU9tQvDrKDzr+hb05FzrM++QqEMDduxF11UQjQiVKxSh7wm1c0vsBGrMmd
	BLa4sa8fxUjUuUKpQ58NAJ16QycxClqz9FK5Ty7nacfDm3/buyfU0KLxrwZ32U
X-Received: by 2002:a17:903:19c7:b0:2c6:bb39:fed2 with SMTP id d9443c01a7336-2c6bc221f6fmr59967395ad.25.1781736479957;
        Wed, 17 Jun 2026 15:47:59 -0700 (PDT)
Received: from r912.tailbb6e1e.ts.net ([182.70.116.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433844a70sm170772265ad.84.2026.06.17.15.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 15:47:59 -0700 (PDT)
From: Avinash Duduskar <avinash.duduskar@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org
Cc: ameryhung@gmail.com,
	a.s.protopopov@gmail.com,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	dsahern@kernel.org,
	eddyz87@gmail.com,
	edumazet@google.com,
	emil@etsalapatis.com,
	eyal.birger@gmail.com,
	hawk@kernel.org,
	horms@kernel.org,
	john.fastabend@gmail.com,
	jolsa@kernel.org,
	kpsingh@kernel.org,
	kuba@kernel.org,
	leon.hwang@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	martin.lau@linux.dev,
	memxor@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rongtao@cestc.cn,
	sdf@fomichev.me,
	shuah@kernel.org,
	song@kernel.org,
	toke@redhat.com,
	yatsenko@meta.com,
	yonghong.song@linux.dev
Subject: [PATCH bpf-next v3 2/3] bpf: Add BPF_FIB_LOOKUP_VLAN_INPUT flag to bpf_fib_lookup() helper
Date: Thu, 18 Jun 2026 04:17:28 +0530
Message-ID: <20260617224729.1428662-3-avinash.duduskar@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617224729.1428662-1-avinash.duduskar@gmail.com>
References: <20260617224729.1428662-1-avinash.duduskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

BPF_FIB_LOOKUP_VLAN resolves a VLAN egress. The reverse is also
useful: an XDP program receiving a VLAN-tagged frame on a physical
device wants the lookup to behave as if the packet had arrived on the
corresponding VLAN subinterface, so iif-based policy routing and VRF
table selection use the right ingress.

Add BPF_FIB_LOOKUP_VLAN_INPUT. When set, params->h_vlan_proto and
params->h_vlan_TCI are read as an input VLAN tag and the matching VLAN
device of params->ifindex is resolved with __vlan_find_dev_deep_rcu().
The device must be up and in the same network namespace as
params->ifindex (a VLAN device can be moved to another netns while
registered on its parent; receive would deliver into that other
namespace, which a lookup here cannot represent). If params->ifindex
is itself a VLAN device, its inner (QinQ) subinterface is matched.
For a bond or team, a tag on a port matches no device and returns
NOT_FWDED; pass the master's ifindex.
The lookup then runs with the resolved device as the ingress;
params->ifindex itself is not modified on the input side. When the
resolved device is enslaved to a VRF, both the full lookup (via the
l3mdev rule) and BPF_FIB_LOOKUP_DIRECT (via l3mdev_fib_table_rcu())
select the VRF's table from the resolved ingress. That follows from
feeding the resolved device to the flow as the ingress
(fl4.flowi4_iif = dev->ifindex), which is what makes l3mdev resolve
the VRF master from the subinterface rather than from
params->ifindex.

The two failure classes get different treatment on purpose. A
h_vlan_proto other than 802.1Q/802.1ad is API misuse and returns
-EINVAL, since it would otherwise reach the WARN in vlan_proto_idx()
with a program-controlled value. An unmatched VID, a device that is
down, or one in another namespace is a data outcome and returns
BPF_FIB_LKUP_RET_NOT_FWDED, matching the DIRECT path when
fib_get_table() finds no table and mirroring real ingress, where the
receive path drops such frames. A VID of 0 (a priority tag) is looked
up literally and normally fails the same way; receive instead
processes such frames untagged, so callers should not set the flag for
priority tags. Proceeding on the physical device for any of these
would be fail-open for the policy-routing cases above.

The h_vlan fields share a union with tbid, so the flag cannot be
combined with BPF_FIB_LOOKUP_TBID. It describes ingress, so it also
cannot be combined with BPF_FIB_LOOKUP_OUTPUT. Both combinations
return -EINVAL; restricting now keeps a later relaxation backward
compatible. Combining with BPF_FIB_LOOKUP_VLAN is allowed: the tag is
consumed on the ingress side and the egress tag is written on
success.

Under !CONFIG_VLAN_8021Q the __vlan_find_dev_deep_rcu() stub returns
NULL, so every lookup with the flag returns NOT_FWDED, which is
correct since no VLAN device can exist.

Suggested-by: Toke Høiland-Jørgensen <toke@redhat.com>
Signed-off-by: Avinash Duduskar <avinash.duduskar@gmail.com>
---
 include/uapi/linux/bpf.h       | 21 ++++++++++-
 net/core/filter.c              | 66 +++++++++++++++++++++++++++++++---
 tools/include/uapi/linux/bpf.h | 21 ++++++++++-
 3 files changed, 101 insertions(+), 7 deletions(-)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index f1ac9266a2ab..23bc3109619d 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -3547,6 +3547,22 @@ union bpf_attr {
  *			are written only on success; other output fields keep
  *			the helper's existing behaviour, so a frag-needed result
  *			still reports the route mtu in *params*->mtu_result.
+ *		**BPF_FIB_LOOKUP_VLAN_INPUT**
+ *			Treat *params*->h_vlan_proto and *params*->h_vlan_TCI
+ *			as an input VLAN tag and run the lookup as if ingress
+ *			had happened on the VLAN subinterface carrying that tag
+ *			on *params*->ifindex. The VID is the low 12 bits of
+ *			*params*->h_vlan_TCI; *params*->h_vlan_proto must be
+ *			ETH_P_8021Q or ETH_P_8021AD in network byte order, else
+ *			**-EINVAL**. If *params*->ifindex is itself a VLAN
+ *			device, its inner (QinQ) subinterface is matched; for a
+ *			bond or team, pass the master's ifindex. An unmatched
+ *			tag, a down device, or one in another namespace returns
+ *			**BPF_FIB_LKUP_RET_NOT_FWDED**, mirroring real ingress.
+ *			A VID of 0 is looked up literally, so do not set this
+ *			flag for priority-tagged frames. Cannot be combined with
+ *			**BPF_FIB_LOOKUP_TBID** or **BPF_FIB_LOOKUP_OUTPUT**
+ *			(returns **-EINVAL**).
  *
  *		*ctx* is either **struct xdp_md** for XDP programs or
  *		**struct sk_buff** tc cls_act programs.
@@ -7343,6 +7359,7 @@ enum {
 	BPF_FIB_LOOKUP_SRC     = (1U << 4),
 	BPF_FIB_LOOKUP_MARK    = (1U << 5),
 	BPF_FIB_LOOKUP_VLAN    = (1U << 6),
+	BPF_FIB_LOOKUP_VLAN_INPUT = (1U << 7),
 };
 
 enum {
@@ -7412,7 +7429,9 @@ struct bpf_fib_lookup {
 			/*
 			 * output with BPF_FIB_LOOKUP_VLAN: set from the
 			 * resolved egress VLAN device (see the flag); zeroed
-			 * on other successful lookups.
+			 * on other successful lookups. input with
+			 * BPF_FIB_LOOKUP_VLAN_INPUT: the VLAN tag to scope
+			 * the lookup by.
 			 */
 			__be16	h_vlan_proto;
 			__be16	h_vlan_TCI;
diff --git a/net/core/filter.c b/net/core/filter.c
index 27e4792f11e9..399adf2a824a 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -6226,6 +6226,25 @@ static int bpf_fib_set_fwd_params(struct net_device *dev,
 
 	return 0;
 }
+
+static struct net_device *bpf_fib_vlan_input_dev(struct net_device *dev,
+						 const struct bpf_fib_lookup *params)
+{
+	__be16 proto = params->h_vlan_proto;
+	struct net_device *vlan_dev;
+	u16 vid;
+
+	if (proto != htons(ETH_P_8021Q) && proto != htons(ETH_P_8021AD))
+		return ERR_PTR(-EINVAL);
+
+	vid = ntohs(params->h_vlan_TCI) & VLAN_VID_MASK;
+	vlan_dev = __vlan_find_dev_deep_rcu(dev, proto, vid);
+	if (!vlan_dev || !(vlan_dev->flags & IFF_UP) ||
+	    !net_eq(dev_net(vlan_dev), dev_net(dev)))
+		return NULL;
+
+	return vlan_dev;
+}
 #endif
 
 #if IS_ENABLED(CONFIG_INET)
@@ -6246,6 +6265,14 @@ static int bpf_ipv4_fib_lookup(struct net *net, struct bpf_fib_lookup *params,
 	if (unlikely(!dev))
 		return -ENODEV;
 
+	if (flags & BPF_FIB_LOOKUP_VLAN_INPUT) {
+		dev = bpf_fib_vlan_input_dev(dev, params);
+		if (IS_ERR(dev))
+			return PTR_ERR(dev);
+		if (!dev)
+			return BPF_FIB_LKUP_RET_NOT_FWDED;
+	}
+
 	/* verify forwarding is enabled on this interface */
 	in_dev = __in_dev_get_rcu(dev);
 	if (unlikely(!in_dev || !IN_DEV_FORWARD(in_dev)))
@@ -6255,7 +6282,11 @@ static int bpf_ipv4_fib_lookup(struct net *net, struct bpf_fib_lookup *params,
 		fl4.flowi4_iif = 1;
 		fl4.flowi4_oif = params->ifindex;
 	} else {
-		fl4.flowi4_iif = params->ifindex;
+		/*
+		 * dev->ifindex, not params->ifindex: VLAN_INPUT may have
+		 * resolved dev to a subinterface above.
+		 */
+		fl4.flowi4_iif = dev->ifindex;
 		fl4.flowi4_oif = 0;
 	}
 	fl4.flowi4_dscp = inet_dsfield_to_dscp(params->tos);
@@ -6394,6 +6425,14 @@ static int bpf_ipv6_fib_lookup(struct net *net, struct bpf_fib_lookup *params,
 	if (unlikely(!dev))
 		return -ENODEV;
 
+	if (flags & BPF_FIB_LOOKUP_VLAN_INPUT) {
+		dev = bpf_fib_vlan_input_dev(dev, params);
+		if (IS_ERR(dev))
+			return PTR_ERR(dev);
+		if (!dev)
+			return BPF_FIB_LKUP_RET_NOT_FWDED;
+	}
+
 	idev = __in6_dev_get_safely(dev);
 	if (unlikely(!idev || !READ_ONCE(idev->cnf.forwarding)))
 		return BPF_FIB_LKUP_RET_FWD_DISABLED;
@@ -6402,7 +6441,12 @@ static int bpf_ipv6_fib_lookup(struct net *net, struct bpf_fib_lookup *params,
 		fl6.flowi6_iif = 1;
 		oif = fl6.flowi6_oif = params->ifindex;
 	} else {
-		oif = fl6.flowi6_iif = params->ifindex;
+		/*
+		 * dev->ifindex, not params->ifindex: VLAN_INPUT may have
+		 * resolved dev to a subinterface above.
+		 */
+		oif = dev->ifindex;
+		fl6.flowi6_iif = oif;
 		fl6.flowi6_oif = 0;
 		strict = RT6_LOOKUP_F_HAS_SADDR;
 	}
@@ -6515,7 +6559,19 @@ static int bpf_ipv6_fib_lookup(struct net *net, struct bpf_fib_lookup *params,
 #define BPF_FIB_LOOKUP_MASK (BPF_FIB_LOOKUP_DIRECT | BPF_FIB_LOOKUP_OUTPUT | \
 			     BPF_FIB_LOOKUP_SKIP_NEIGH | BPF_FIB_LOOKUP_TBID | \
 			     BPF_FIB_LOOKUP_SRC | BPF_FIB_LOOKUP_MARK | \
-			     BPF_FIB_LOOKUP_VLAN)
+			     BPF_FIB_LOOKUP_VLAN | BPF_FIB_LOOKUP_VLAN_INPUT)
+
+static bool bpf_fib_lookup_flags_ok(u32 flags)
+{
+	if (flags & ~BPF_FIB_LOOKUP_MASK)
+		return false;
+
+	if ((flags & BPF_FIB_LOOKUP_VLAN_INPUT) &&
+	    (flags & (BPF_FIB_LOOKUP_TBID | BPF_FIB_LOOKUP_OUTPUT)))
+		return false;
+
+	return true;
+}
 
 BPF_CALL_4(bpf_xdp_fib_lookup, struct xdp_buff *, ctx,
 	   struct bpf_fib_lookup *, params, int, plen, u32, flags)
@@ -6523,7 +6579,7 @@ BPF_CALL_4(bpf_xdp_fib_lookup, struct xdp_buff *, ctx,
 	if (plen < sizeof(*params))
 		return -EINVAL;
 
-	if (flags & ~BPF_FIB_LOOKUP_MASK)
+	if (!bpf_fib_lookup_flags_ok(flags))
 		return -EINVAL;
 
 	switch (params->family) {
@@ -6562,7 +6618,7 @@ BPF_CALL_4(bpf_skb_fib_lookup, struct sk_buff *, skb,
 	if (plen < sizeof(*params))
 		return -EINVAL;
 
-	if (flags & ~BPF_FIB_LOOKUP_MASK)
+	if (!bpf_fib_lookup_flags_ok(flags))
 		return -EINVAL;
 
 	if (params->tot_len)
diff --git a/tools/include/uapi/linux/bpf.h b/tools/include/uapi/linux/bpf.h
index f1ac9266a2ab..23bc3109619d 100644
--- a/tools/include/uapi/linux/bpf.h
+++ b/tools/include/uapi/linux/bpf.h
@@ -3547,6 +3547,22 @@ union bpf_attr {
  *			are written only on success; other output fields keep
  *			the helper's existing behaviour, so a frag-needed result
  *			still reports the route mtu in *params*->mtu_result.
+ *		**BPF_FIB_LOOKUP_VLAN_INPUT**
+ *			Treat *params*->h_vlan_proto and *params*->h_vlan_TCI
+ *			as an input VLAN tag and run the lookup as if ingress
+ *			had happened on the VLAN subinterface carrying that tag
+ *			on *params*->ifindex. The VID is the low 12 bits of
+ *			*params*->h_vlan_TCI; *params*->h_vlan_proto must be
+ *			ETH_P_8021Q or ETH_P_8021AD in network byte order, else
+ *			**-EINVAL**. If *params*->ifindex is itself a VLAN
+ *			device, its inner (QinQ) subinterface is matched; for a
+ *			bond or team, pass the master's ifindex. An unmatched
+ *			tag, a down device, or one in another namespace returns
+ *			**BPF_FIB_LKUP_RET_NOT_FWDED**, mirroring real ingress.
+ *			A VID of 0 is looked up literally, so do not set this
+ *			flag for priority-tagged frames. Cannot be combined with
+ *			**BPF_FIB_LOOKUP_TBID** or **BPF_FIB_LOOKUP_OUTPUT**
+ *			(returns **-EINVAL**).
  *
  *		*ctx* is either **struct xdp_md** for XDP programs or
  *		**struct sk_buff** tc cls_act programs.
@@ -7343,6 +7359,7 @@ enum {
 	BPF_FIB_LOOKUP_SRC     = (1U << 4),
 	BPF_FIB_LOOKUP_MARK    = (1U << 5),
 	BPF_FIB_LOOKUP_VLAN    = (1U << 6),
+	BPF_FIB_LOOKUP_VLAN_INPUT = (1U << 7),
 };
 
 enum {
@@ -7412,7 +7429,9 @@ struct bpf_fib_lookup {
 			/*
 			 * output with BPF_FIB_LOOKUP_VLAN: set from the
 			 * resolved egress VLAN device (see the flag); zeroed
-			 * on other successful lookups.
+			 * on other successful lookups. input with
+			 * BPF_FIB_LOOKUP_VLAN_INPUT: the VLAN tag to scope
+			 * the lookup by.
 			 */
 			__be16	h_vlan_proto;
 			__be16	h_vlan_TCI;
-- 
2.54.0

