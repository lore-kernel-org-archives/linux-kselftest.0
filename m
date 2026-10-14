Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E82C4E73A2
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981620; cv=none; b=L7G+NBfNK4TaS/O24Uo460ORfCWBix+/ptMu9QEOqq2t5yygKcOT4Y2UcAXOAo9RwrFHeVf6sZVIGHvbLpMJme+259KXP1sqOfT0G0vk9Yb6+wiumS3MIWhMSuyI+w/hR6JOoYxyT5CUmaKcWkVmvts1VLOwjJKn3ABLPcDq6xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981620; c=relaxed/simple;
	bh=y0KNGeCtSjD1ACxF+bydrIxkgyBwc9qs4SPLuP098Z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oDV+LTHQYG842jHuh1zLVvynkDQENRy4pCD+UTvsmGyobiRZwkSZgUAFTiEQPRJmSrfXxx98PJNSjRelOtjs4tR/jlMblxXNJDEa2hBxEfj+zv3tbnUyRCLH+BwJJwGdCASAc/nSbRvYxdGDFlKflrxgwgsPNUIG44xUql/3fCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMMAlKze; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMMAlKze"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so8282125e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 05:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791981613; x=1792586413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7kWYfk+xokLUPXcyOfskQM732fHT0KCZAHVmHMKllY=;
        b=kMMAlKzedoP//1K31JmHhwQnoyUZKrUZ9xUVRA4Sbnpkfp/9nsSsHcWscfI4NLyilB
         f1Dh496j99g+zxFUC8uVq0X5ffe2/NnIxCb3hKNCg2morgcsshG0QYXXqs/kOWPrIRZZ
         YmSQ5Zy2obu8+xoL44vAcBew1a9kAega7q56EETIUVnp97giqH46gxEgWcm7tDNolU+x
         PVv7bZZq4pSf5tS5f4QNITBhi7hM391ZeP0eAys3iHloxG0aY3pG+hIkANckM5iclClw
         AaJOoskq5SRo42dEBj3F3Z5tDdCoqLjmRhS49IFDz622qbzUwrZDL513llEY74GTPQst
         LYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981613; x=1792586413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N7kWYfk+xokLUPXcyOfskQM732fHT0KCZAHVmHMKllY=;
        b=ylHF0oavKgmVk4lESxX6C1ZA5hMMdMWaMH4SmP0vForeCYy4/Cyn6A0rcq16frbnPN
         EXqgh8bGcEHqvf9P5Gk3z78TgLpipdeEYPw3k4RRgsljFbak8dM5xa4jvzqgIwaK23dw
         UjtbMkc9+CQliUetplxSOjXWcLSEZ9h1xvnk2gSveoXbWhFAI93TOep/KpjoMGHQvM0E
         3iS+XP/96HoaRuLl0ztoHnHlyzmk0HFT96+RTjxc17/oE6rdMWl5KFqg8lmXMguUsFsV
         Ato2kBW8bn615J3+SVZx/DCbNjYC8eJ6DiI/KrLuuyLpgwvo0BHucD6LFQNQVigQeK0s
         PQ+w==
X-Forwarded-Encrypted: i=1; AKwUvByGBcWVDrHdXjC2WtvW/MASk98csgeA7LToRlZd35mQfmgGldaE/BWraFmXEGdfIuKPbvI+sak5J+LrUdFYXEQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAN3/rD4keKCG9z0XGeLl/jzV/yeOfgkbV9Do4B5mPq0LZr/dk
	zkrXly+GE0tkiEOdpxo77G0shn4PVFn6BBkwHymv+W8by4lEcgxTGCwL
X-Gm-Gg: AYBFou1BgWkG1daqIFPKm8Vzre//MNsmwjykdBll3/CGKeh/bjNE5hE7ofQ9xUQs3xv
	a0oFi5S+xI8tXHiRFZqZc797E1dbmNsgXinUEls3gHhobUuDK3zFOd6jYjT7QAKz2GWo66FcXjc
	xBcMhhX/k5HX8f3mvCYqYYljfgdg1HdB+l4Xk1d8yTplGytMigcEMpf7Dq+BaC/9PVmjNbkHw5J
	0ylek2RHJKHJroVufiINRV3C6v+Nf3lTn4wMO6sJTGUCtprfktXdgcdBafwI+xQcXPipJaJWiQe
	+HWmoNSwTkXQYiu2B/rCcYDMl6gGgGpouNzaA8FOrMtPOdooPQV/jrW2v6NtBHnVXCEKV1Sq+lU
	h/auOuOzRh+50OHYhzR3bape6IbqQ9J674vdRBb/AVUVO/kc8JVxMNJhy0V55UD2Ljrk8j79VAa
	tOD+czWRlNY9YZW8qgKN9kb+AFvo3wpbr3nj8aUEsw0WhttKTg/LiRLLVF1/QL7dk=
X-Received: by 2002:a05:600c:8105:b0:4a1:83f0:7c8a with SMTP id 5b1f17b1804b1-4a18e4433d6mr310145795e9.1.1791981613429;
        Wed, 14 Oct 2026 05:40:13 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b2ec47fcsm54163165e9.1.2026.10.14.05.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:40:12 -0700 (PDT)
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
Subject: [PATCH net-next v4 6/7] vxlan: vnifilter: account the default FDB entry to memcg
Date: Wed, 14 Oct 2026 15:38:13 +0300
Message-ID: <20261014123814.388557-7-alishmery18@gmail.com>
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

A VNI added through the vnifilter interface with a group or remote
installs a default FDB entry for that VNI: vxlan_vni_update_group()
calls vxlan_update_default_fdb_entry(), which calls vxlan_fdb_update()
and vxlan_fdb_create(). The entry allocates a struct vxlan_fdb and, per
remote, a struct vxlan_rdst plus its per-CPU dst cache, all with
GFP_ATOMIC and none charged to a memory cgroup.

The previous patch accounts the per-VNI node and its stats; these FDB
objects are the rest of what one vnifilter request allocates per VNI.
Charge them to the caller, as commit c948f51c1654 ("memcg: enable
accounting for net_device and Tx/Rx queues") and commit e2c8d550a973
("netfilter: ebtables: account ebt_table_info to kmemcg") do: the
lifetime of this memory is the net namespace, not the allocating task,
so the OOM killer cannot reclaim it and it must be charged to the cgroup
of the task whose request allocates it.

Thread a gfp argument through vxlan_fdb_update() to
vxlan_fdb_alloc()/vxlan_fdb_append() on both paths it can take -- the
create path (vxlan_fdb_update_create() -> vxlan_fdb_create()) and the
path that changes an existing entry's remote
(vxlan_fdb_update_existing()) -- and a second gfp through
vxlan_update_default_fdb_entry(), so each caller chooses it. Every
non-vnifilter caller of vxlan_fdb_update() -- vxlan_fdb_add(),
vxlan_snoop(), vxlan_dev_create(), vxlan_changelink() and the switchdev
vxlan_fdb_external_learn_add() -- keeps plain GFP_ATOMIC, so the data
path and unrelated callers are unchanged. dst_cache_init() already takes
a gfp argument, so no change outside the driver is needed.

A per-request add or change of a VNI's remote (RTM_NEWTUNNEL, via
vxlan_vni_update_group()) passes GFP_NOWAIT | __GFP_ACCOUNT. These
allocations run under the hash spinlock and cannot sleep, but a
configuration path does not need the atomic reserves GFP_ATOMIC grants,
and GFP_NOWAIT makes the memcg charge hard-bounded rather than
force-charged: a cgroup at its limit fails the add or change there with
-ENOMEM instead of pushing memory.current past memory.max. The failure
is clean -- the new entry is allocated before the old is freed, so an
add that fails leaves the existing entry intact and returns the error;
no established FDB state is destroyed and no false success is returned.
Creating a VNI is gated the same way by the previous patch's node and
stats (GFP_KERNEL_ACCOUNT, hard-bounded). Measured on production builds
at 2 and 8 vCPU in an 8 MiB cgroup: over-limit adds and changes return
-ENOMEM and memory.current does not exceed memory.max.

The device-wide default-remote change (RTM_NEWLINK, via
vxlan_vnilist_update_group()) keeps GFP_ATOMIC | __GFP_ACCOUNT. That
walk touches every VNI inheriting the device default in one message,
outside the per-request cap, and its existing error unwind re-installs
entries; hard-bounding it would turn a cgroup limit into a mid-walk
failure that the unwind cannot cleanly reverse. Bounding and unwinding
that pre-existing walk is left to a separate change; here it stays
force-charged, as before this series, and is charged to the task
issuing the RTM_NEWLINK.

This adds no new failure path on the data or learning paths: their
allocations already existed and keep GFP_ATOMIC; only the vnifilter
configuration path gains an -ENOMEM return, which its callers already
propagate.

Assisted-by: LLM
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v4: new patch.

 drivers/net/vxlan/vxlan_core.c      | 47 ++++++++++++++++-------------
 drivers/net/vxlan/vxlan_private.h   |  7 +++--
 drivers/net/vxlan/vxlan_vnifilter.c | 14 ++++++---
 3 files changed, 39 insertions(+), 29 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index 278d41f58d89..7991b544af5a 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -577,7 +577,7 @@ static int vxlan_fdb_replace(struct vxlan_fdb *f,
 /* Add/update destinations for multicast */
 static int vxlan_fdb_append(struct vxlan_fdb *f,
 			    union vxlan_addr *ip, __be16 port, __be32 vni,
-			    __u32 ifindex, struct vxlan_rdst **rdp)
+			    __u32 ifindex, struct vxlan_rdst **rdp, gfp_t gfp)
 {
 	struct vxlan_rdst *rd;
 
@@ -585,14 +585,14 @@ static int vxlan_fdb_append(struct vxlan_fdb *f,
 	if (rd)
 		return 0;
 
-	rd = kmalloc_obj(*rd, GFP_ATOMIC);
+	rd = kmalloc_obj(*rd, gfp);
 	if (rd == NULL)
 		return -ENOMEM;
 
 	/* The driver can work correctly without a dst cache, so do not treat
 	 * dst cache initialization errors as fatal.
 	 */
-	dst_cache_init(&rd->dst_cache, GFP_ATOMIC | __GFP_NOWARN);
+	dst_cache_init(&rd->dst_cache, gfp | __GFP_NOWARN);
 
 	rd->remote_ip = *ip;
 	rd->remote_port = port;
@@ -779,11 +779,11 @@ static int vxlan_gpe_gro_complete(struct sock *sk, struct sk_buff *skb, int nhof
 
 static struct vxlan_fdb *vxlan_fdb_alloc(struct vxlan_dev *vxlan, const u8 *mac,
 					 __u16 state, __be32 src_vni,
-					 __u16 ndm_flags)
+					 __u16 ndm_flags, gfp_t gfp)
 {
 	struct vxlan_fdb *f;
 
-	f = kmalloc_obj(*f, GFP_ATOMIC);
+	f = kmalloc_obj(*f, gfp);
 	if (!f)
 		return NULL;
 	memset(&f->key, 0, sizeof(f->key));
@@ -869,7 +869,7 @@ int vxlan_fdb_create(struct vxlan_dev *vxlan,
 		     __u16 state, __be16 port, __be32 src_vni,
 		     __be32 vni, __u32 ifindex, __u16 ndm_flags,
 		     u32 nhid, struct vxlan_fdb **fdb,
-		     struct netlink_ext_ack *extack)
+		     struct netlink_ext_ack *extack, gfp_t gfp)
 {
 	const struct vxlan_config *cfg = rcu_dereference_rtnl(vxlan->cfg);
 	struct vxlan_rdst *rd = NULL;
@@ -881,14 +881,14 @@ int vxlan_fdb_create(struct vxlan_dev *vxlan,
 		return -ENOSPC;
 
 	netdev_dbg(vxlan->dev, "add %pM -> %pIS\n", mac, ip);
-	f = vxlan_fdb_alloc(vxlan, mac, state, src_vni, ndm_flags);
+	f = vxlan_fdb_alloc(vxlan, mac, state, src_vni, ndm_flags, gfp);
 	if (!f)
 		return -ENOMEM;
 
 	if (nhid)
 		rc = vxlan_fdb_nh_update(vxlan, f, nhid, extack);
 	else
-		rc = vxlan_fdb_append(f, ip, port, vni, ifindex, &rd);
+		rc = vxlan_fdb_append(f, ip, port, vni, ifindex, &rd, gfp);
 	if (rc < 0)
 		goto errout;
 
@@ -984,7 +984,7 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 				     __u32 ifindex, __u16 ndm_flags,
 				     struct vxlan_fdb *f, u32 nhid,
 				     bool swdev_notify,
-				     struct netlink_ext_ack *extack)
+				     struct netlink_ext_ack *extack, gfp_t gfp)
 {
 	__u16 fdb_flags = (ndm_flags & ~NTF_USE);
 	struct vxlan_rdst *rd = NULL;
@@ -1047,7 +1047,8 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 	if ((flags & NLM_F_APPEND) &&
 	    (is_multicast_ether_addr(f->key.eth_addr) ||
 	     is_zero_ether_addr(f->key.eth_addr))) {
-		rc = vxlan_fdb_append(f, ip, port, vni, ifindex, &rd);
+		rc = vxlan_fdb_append(f, ip, port, vni, ifindex, &rd,
+				      gfp);
 
 		if (rc < 0)
 			return rc;
@@ -1088,7 +1089,7 @@ static int vxlan_fdb_update_create(struct vxlan_dev *vxlan,
 				   __be16 port, __be32 src_vni, __be32 vni,
 				   __u32 ifindex, __u16 ndm_flags, u32 nhid,
 				   bool swdev_notify,
-				   struct netlink_ext_ack *extack)
+				   struct netlink_ext_ack *extack, gfp_t gfp)
 {
 	__u16 fdb_flags = (ndm_flags & ~NTF_USE);
 	struct vxlan_fdb *f;
@@ -1101,7 +1102,7 @@ static int vxlan_fdb_update_create(struct vxlan_dev *vxlan,
 
 	netdev_dbg(vxlan->dev, "add %pM -> %pIS\n", mac, ip);
 	rc = vxlan_fdb_create(vxlan, mac, ip, state, port, src_vni,
-			      vni, ifindex, fdb_flags, nhid, &f, extack);
+			      vni, ifindex, fdb_flags, nhid, &f, extack, gfp);
 	if (rc < 0)
 		return rc;
 
@@ -1124,7 +1125,7 @@ int vxlan_fdb_update(struct vxlan_dev *vxlan,
 		     __be16 port, __be32 src_vni, __be32 vni,
 		     __u32 ifindex, __u16 ndm_flags, u32 nhid,
 		     bool swdev_notify,
-		     struct netlink_ext_ack *extack)
+		     struct netlink_ext_ack *extack, gfp_t gfp)
 {
 	struct vxlan_fdb *f;
 
@@ -1138,7 +1139,8 @@ int vxlan_fdb_update(struct vxlan_dev *vxlan,
 
 		return vxlan_fdb_update_existing(vxlan, ip, state, flags, port,
 						 vni, ifindex, ndm_flags, f,
-						 nhid, swdev_notify, extack);
+						 nhid, swdev_notify, extack,
+						 gfp);
 	} else {
 		if (!(flags & NLM_F_CREATE))
 			return -ENOENT;
@@ -1146,7 +1148,7 @@ int vxlan_fdb_update(struct vxlan_dev *vxlan,
 		return vxlan_fdb_update_create(vxlan, mac, ip, state, flags,
 					       port, src_vni, vni, ifindex,
 					       ndm_flags, nhid, swdev_notify,
-					       extack);
+					       extack, gfp);
 	}
 }
 
@@ -1287,7 +1289,7 @@ static int vxlan_fdb_add(struct ndmsg *ndm, struct nlattr *tb[],
 	err = vxlan_fdb_update(vxlan, addr, &ip, ndm->ndm_state, flags,
 			       port, src_vni, vni, ifindex,
 			       ndm->ndm_flags | NTF_VXLAN_ADDED_BY_USER,
-			       nhid, true, extack);
+			       nhid, true, extack, GFP_ATOMIC);
 	spin_unlock_bh(&vxlan->hash_lock);
 
 	if (!err)
@@ -1507,7 +1509,8 @@ static enum skb_drop_reason vxlan_snoop(struct net_device *dev,
 					 cfg->dst_port,
 					 vni,
 					 cfg->vni,
-					 ifindex, NTF_SELF, 0, true, NULL);
+					 ifindex, NTF_SELF, 0, true, NULL,
+					 GFP_ATOMIC);
 		spin_unlock(&vxlan->hash_lock);
 	}
 
@@ -4154,7 +4157,7 @@ static int vxlan_dev_create(struct net *net, struct net_device *dev,
 				       cfg->vni,
 				       cfg->vni,
 				       cfg->remote_ifindex,
-				       NTF_SELF, 0, true, extack);
+				       NTF_SELF, 0, true, extack, GFP_ATOMIC);
 		spin_unlock_bh(&vxlan->hash_lock);
 		if (err)
 			goto unlink;
@@ -4617,7 +4620,8 @@ static int vxlan_changelink(struct net_device *dev, struct nlattr *tb[],
 					       cfg->dst_port,
 					       conf.vni, conf.vni,
 					       conf.remote_ifindex,
-					       NTF_SELF, 0, true, extack);
+					       NTF_SELF, 0, true, extack,
+					       GFP_ATOMIC);
 			if (err) {
 				spin_unlock_bh(&vxlan->hash_lock);
 				if (lowerdev_changed)
@@ -4652,7 +4656,8 @@ static int vxlan_changelink(struct net_device *dev, struct nlattr *tb[],
 							       &cfg->remote_ip,
 							       conf.remote_ifindex,
 							       cfg->remote_ifindex,
-							       NULL);
+							       NULL,
+							       GFP_ATOMIC | __GFP_ACCOUNT);
 				if (lowerdev_changed)
 					netdev_adjacent_change_abort(vxlan->lowerdev,
 								     lowerdev, dev);
@@ -4972,7 +4977,7 @@ vxlan_fdb_external_learn_add(struct net_device *dev,
 			       fdb_info->remote_vni,
 			       fdb_info->remote_ifindex,
 			       NTF_USE | NTF_SELF | NTF_EXT_LEARNED,
-			       0, false, extack);
+			       0, false, extack, GFP_ATOMIC);
 	spin_unlock_bh(&vxlan->hash_lock);
 
 	return err;
diff --git a/drivers/net/vxlan/vxlan_private.h b/drivers/net/vxlan/vxlan_private.h
index f0ee85f83732..b5a80ed3eff2 100644
--- a/drivers/net/vxlan/vxlan_private.h
+++ b/drivers/net/vxlan/vxlan_private.h
@@ -192,7 +192,7 @@ int vxlan_fdb_create(struct vxlan_dev *vxlan,
 		     __u16 state, __be16 port, __be32 src_vni,
 		     __be32 vni, __u32 ifindex, __u16 ndm_flags,
 		     u32 nhid, struct vxlan_fdb **fdb,
-		     struct netlink_ext_ack *extack);
+		     struct netlink_ext_ack *extack, gfp_t gfp);
 int __vxlan_fdb_delete(struct vxlan_dev *vxlan,
 		       const unsigned char *addr, union vxlan_addr ip,
 		       __be16 port, __be32 src_vni, __be32 vni,
@@ -202,7 +202,8 @@ int vxlan_fdb_update(struct vxlan_dev *vxlan,
 		     __u16 state, __u16 flags,
 		     __be16 port, __be32 src_vni, __be32 vni,
 		     __u32 ifindex, __u16 ndm_flags, u32 nhid,
-		     bool swdev_notify, struct netlink_ext_ack *extack);
+		     bool swdev_notify, struct netlink_ext_ack *extack,
+		     gfp_t gfp);
 void vxlan_xmit_one(struct sk_buff *skb, struct net_device *dev,
 		    const struct vxlan_config *cfg,
 		    __be32 default_vni, struct vxlan_rdst *rdst, bool did_rsc);
@@ -229,7 +230,7 @@ int vxlan_update_default_fdb_entry(struct vxlan_dev *vxlan, __be32 vni,
 				   const union vxlan_addr *old_remote_ip,
 				   const union vxlan_addr *remote_ip,
 				   u32 old_ifindex, u32 new_ifindex,
-				   struct netlink_ext_ack *extack);
+				   struct netlink_ext_ack *extack, gfp_t gfp);
 int vxlan_vnilist_update_group(struct vxlan_dev *vxlan,
 			       const union vxlan_addr *old_remote_ip,
 			       const union vxlan_addr *new_remote_ip,
diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 4a631fcdf23a..4b43674cceff 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -553,7 +553,7 @@ int vxlan_update_default_fdb_entry(struct vxlan_dev *vxlan, __be32 vni,
 				   const union vxlan_addr *old_remote_ip,
 				   const union vxlan_addr *remote_ip,
 				   u32 old_ifindex, u32 new_ifindex,
-				   struct netlink_ext_ack *extack)
+				   struct netlink_ext_ack *extack, gfp_t gfp)
 {
 	const struct vxlan_config *cfg = rtnl_dereference(vxlan->cfg);
 	int err = 0;
@@ -575,7 +575,8 @@ int vxlan_update_default_fdb_entry(struct vxlan_dev *vxlan, __be32 vni,
 				       vni,
 				       vni,
 				       new_ifindex,
-				       NTF_SELF, 0, true, extack);
+				       NTF_SELF, 0, true, extack,
+				       gfp);
 		if (err && extack) {
 			spin_unlock_bh(&vxlan->hash_lock);
 			return err;
@@ -636,7 +637,8 @@ static int vxlan_vni_update_group(struct vxlan_dev *vxlan,
 					     oldrip, newrip,
 					     cfg->remote_ifindex,
 					     cfg->remote_ifindex,
-					     extack);
+					     extack,
+					     GFP_NOWAIT | __GFP_ACCOUNT);
 	if (ret)
 		goto out;
 
@@ -707,7 +709,8 @@ int vxlan_vnilist_update_group(struct vxlan_dev *vxlan,
 		ret = vxlan_update_default_fdb_entry(vxlan, vent->vni,
 						     oldrip, newrip,
 						     old_ifindex, new_ifindex,
-						     extack);
+						     extack,
+						     GFP_ATOMIC | __GFP_ACCOUNT);
 		if (ret)
 			goto err_unwind;
 	}
@@ -729,7 +732,8 @@ int vxlan_vnilist_update_group(struct vxlan_dev *vxlan,
 		vxlan_update_default_fdb_entry(vxlan, vent->vni,
 					       newrip, oldrip,
 					       new_ifindex, old_ifindex,
-					       NULL);
+					       NULL,
+					       GFP_ATOMIC | __GFP_ACCOUNT);
 	}
 	return ret;
 }
-- 
2.53.0

