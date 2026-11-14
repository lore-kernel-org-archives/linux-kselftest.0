Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694557;
	b=pCjsHXgkRdl9HuBPC2OmGxdmiW7RunyCWc3wDL7dY0+qbxodAzAxfOczoaFnwOS2pIjF
	 XAkKefiD8K0CqrIkLDhe3hk3AOlwZtWywnRNObcLSaXhOCaQZ8g35mxq0jkMbI7zii4dl
	 gjD/fm+83SL9f2kdkjzeyETwi5Wds4DvwSNiH4rZQvhclzBnQekRxxtzLW03zP/509kYm
	 HeysIyrJVXGj93lI7Q1oDmu5I913fPbBTDVIQWt6oChnb7u7UvNN3wqGfVw+szaBzOQ7+
	 pmvi566rDHUsTCUYd/GnP+Vn1yKqZjAxBtphVqjkbfYYE35UsHLIpBTfo3avNAaOlIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AfZ+R41jbnx6/vCBIHq3Nny5JbDDXrlk8KKrMZ2JwfU=;
	b=jlR4cFu6kfKUymm41mn+0KnOim113H3Qcx6/j/Bc/W6/9YGOeMNsTwxl/VLWTafL8cr8
	 fX9W33XIGsiaR3Xfm1Z/sBFz0uqnnRjTEd5vfnyNneXJtA0Ct/GfpbIq90nYFgGXwAkTQ
	 FOxP5KrSQ7ONcY0lNx2det21+hmAYF2CdLentr34/qcTLcBH2gXVvim3gNhxDLrqVb63B
	 xmnR4r++B7CJjQCqGPIxW7I27o1eiCMdbgDqcCzZYiZ7vNupBzk1jo58VMHsbshtwOtDM
	 Cjd2g+NIlNFHG1+IRmhW3WaVkofLlI0Y0kbHtpWRYZf+iU/BkyghumMHiWCqFQGQ0yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CXC+evaW;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7D2606A896
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 22:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA7D2606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CXC+evaW
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4922dbcee23so979905f8f.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 14:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694555; x=1795299355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AfZ+R41jbnx6/vCBIHq3Nny5JbDDXrlk8KKrMZ2JwfU=;
        b=CXC+evaW+pF1+nYaQ09Xf6bZlRmH0/9DhCiZv5Os7XAeX6mDVGrVgtp/CpY7p9A1rM
         SPgIrHuQ4QKNYsxarlqzEdpR3JwPjo1I08vFzCQYxoxoFpVOMykK+OvxtsUsFuyyNCsQ
         iQ5H85LnBW+5BOTLACn1HKp2MQKkkZREtslFwz/bO5pZ8ClyCTEmZ5IIKGDEc18DOTH2
         eqtFar1Pia0Z295+tAenecm0ge3iBirvlh7YlTWhABdu7VZ5VNxzkUk/GpboE3PLjuCX
         rr+Fk6zJTv6XfE9Mih600sQXIznSE5xPz4C1hWJXdC3Awb2mdrzCw26EvqZTZPvmclSP
         kRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694555; x=1795299355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AfZ+R41jbnx6/vCBIHq3Nny5JbDDXrlk8KKrMZ2JwfU=;
        b=TpL9ykL0CykVMg5DWcuEgjEYdbYXpmh0fYp9ljmtGwZ1vJMfEYEL+RN/zMsQANs35K
         lWBTmA4fsFNV8Vr0/Et46qbfDCf53tOap09LHTJv8yMrTy7Izc4/3XM2jJXOJasQlzHj
         9JFtRlerCXUZFW5oONsqEr94gaGUhf3PXQDGdhcIpYokDA1z4eXKcDSokJiPi0pT6qsl
         2jpsjHtdQ3eawg/UFLwqPShIpqyJyQLn76aIoruYYwhecp8PuOXhK+3DUA1nPtIagBxO
         CiY5HcojoANPI4cFTLeGwRnYFqg/jHU/fc0GKGyIlVDZeIT56fuWg0kcjAFtQFMQBrUN
         QXkA==
X-Forwarded-Encrypted: i=1; AL+hErHfgxFxvgwEGcN4Ypd8eOgRbs5plUZeDa4Rr4DSNN8HuIpyQCm8l+/gaoxKjEuN5BIw77U63Gy6QsVRM57/aoc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uOf1aBGgdmdJXTO9qfua6MKcswK5RKyTCLh+3T/kD/M2vyY30
	ILn+T2wrfiKrnR3falfg8nBV5g6yL2g1UiJH5tv8M162txpzQwWXiZoN
X-Gm-Gg: AYBFou10XlT4WhdtSdQ3CaAJyasK/o460zOPbErL1trpqsRxixCnNJP847simrl8F+I
	DPBWZ7YC49qu6gVUdI/4btb8iM2gb8RgHN8f26GNAVp7mX7K4k7T1vTBuk1DW6ihfbAXkhcg3mN
	7fSnCrIA5K/PwbRps3Y+0qtmQM5xY7CLftqteA/kxcXmY3XzfuG9DHZfOtG6jx9ezXvQRY/dZ8s
	3t0x/hhXRjm0ORJoJ9G5wO5eghnM4WF+yWv3jU8JpoHoaJ2sUt4iFPRG8ADFKcdGNHh2ptEIpsF
	jKUMosCUHDM34o+uqywbjgFd2wT7Kxd4afAjdE0Y+pYN58ice3DZc2fBDHEdTjqynz9ett6VFJ+
	XdQhGj/ozijzdTUHzry+BPWFrul3dDWslR/WSYtk044rR4vPTddLl4CvhFbZ4VG1jlVC9Hv7CPG
	mFbF8T53nbED8luKuXAznby7aE1C3l1YKDyLA3z/MKZi3qsBg0oEkXazV2AL6Gwap5QaIDvTE+f
	cqr4/PaSqxNDykKK1v8YAoFAmKlKyOTZon+K4AkYS0FeLQJNV3Kwvynhkhuw0+irwc8HDNS6UIB
	FPafTPd2xupZ/PF791K1DiU=
X-Received: by 2002:a05:6000:40db:b0:48c:6fa4:fc89 with SMTP id ffacd0b85a97d-49c71e3e248mr14788058f8f.12.1794694555141;
        Sat, 14 Nov 2026 14:15:55 -0800 (PST)
Received: from kali ([169.224.126.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm13514941f8f.8.2026.11.14.14.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:15:54 -0800 (PST)
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
Subject: [PATCH net-next v5 7/8] vxlan: vnifilter: account the default FDB entry to memcg
Date: Sun, 15 Nov 2026 01:14:11 +0300
Message-ID: <20261114221412.255825-8-alishmery18@gmail.com>
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

A VNI added through the vnifilter interface with a group or remote
installs a default FDB entry for that VNI: vxlan_vni_update_group()
calls vxlan_update_default_fdb_entry(), which calls vxlan_fdb_update()
and vxlan_fdb_create(). The entry allocates a struct vxlan_fdb and, per
remote, a struct vxlan_rdst plus its per-CPU dst cache, all with
GFP_ATOMIC and none charged to a memory cgroup.

"vxlan: vnifilter: account per-VNI memory to memcg" accounts the per-VNI
node and its stats; these FDB objects are the rest of what one vnifilter
request allocates per VNI. Charge them to the caller, as
commit c948f51c1654 ("memcg: enable accounting for net_device and Tx/Rx
queues") and commit e2c8d550a973 ("netfilter: ebtables: account
ebt_table_info to kmemcg") do: the lifetime of this memory is the net
namespace, not the allocating task, so the OOM killer cannot reclaim it
and it must be charged to the cgroup of the task whose request
allocates it.

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
-ENOMEM instead of pushing memory.current past memory.max. That makes
the failure routine, which the two preceding patches prepare for:
"vxlan: vnifilter: roll back a VNI add that fails" unpublishes a VNI
whose create fails, and a failed change keeps the existing entry,
because the new remote is allocated before the old one is freed and
"vxlan: leave FDB state and flags unchanged when an update fails"
leaves the rest untouched. The per-CPU dst cache of a new remote is
charged too, but as before vxlan_fdb_append() does not treat its
allocation failing as fatal, so at the limit a remote can instead be
installed without one.
Measured on production builds in an 8 MiB cgroup at 2 and 8 vCPU: at the
limit a create or a remote change fails here with -ENOMEM, leaving the
VNI or its entry as it was, and nothing on this path was charged past
memory.max; at 2 vCPU some remotes were also installed without a dst
cache.

The device-wide default-remote change (RTM_NEWLINK, via
vxlan_vnilist_update_group()) passes GFP_ATOMIC | __GFP_ACCOUNT. Nothing
on that walk was charged before this patch; it is now charged to the
task issuing the RTM_NEWLINK, but force-charged, not hard-bounded. The
walk touches every VNI inheriting the device default in one message,
outside the per-request cap, and its error unwind re-installs entries
without checking whether that succeeded, so hard-bounding it would turn
a cgroup limit into a mid-walk failure the unwind cannot cleanly
reverse. Bounding that walk, and its unwind, are left to a separate
change. The vxlan_changelink() rollback of the device's own default
entry keeps plain GFP_ATOMIC, like the forward vxlan_fdb_update() call
it reverses.

This adds no new failure path on the data or learning paths: their
allocations already existed and keep GFP_ATOMIC; only the vnifilter
configuration path gains an -ENOMEM return, which its callers already
propagate.

Raised during the automated review of v3; Paolo Abeni agreed it required
fixing. In QEMU (production builds, 2 vCPU), 4000 inheriting VNIs charge
their cgroup 1101 B each before this patch, 1551 B with it.

Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v5: the vxlan_changelink() rollback keeps plain GFP_ATOMIC, like the
call it reverses; the changelog says the RTM_NEWLINK walk was not
charged before this patch, relies on the two new patches before it for a
clean failure instead of claiming one (review of v4), and says that at
the limit a remote can be installed without its dst cache; says what the
patch changes in QEMU (sinfo bot); re-measured; lines wrapped to 80
columns. v4: new patch.

 drivers/net/vxlan/vxlan_core.c      | 47 ++++++++++++++++-------------
 drivers/net/vxlan/vxlan_private.h   |  7 +++--
 drivers/net/vxlan/vxlan_vnifilter.c | 14 ++++++---
 3 files changed, 39 insertions(+), 29 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index 2303d652d396..1f91d50accdc 100644
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
 	__u16 old_flags = f->flags;
@@ -1028,7 +1028,8 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 	if ((flags & NLM_F_APPEND) &&
 	    (is_multicast_ether_addr(f->key.eth_addr) ||
 	     is_zero_ether_addr(f->key.eth_addr))) {
-		rc = vxlan_fdb_append(f, ip, port, vni, ifindex, &rd);
+		rc = vxlan_fdb_append(f, ip, port, vni, ifindex, &rd,
+				      gfp);
 
 		if (rc < 0)
 			return rc;
@@ -1090,7 +1091,7 @@ static int vxlan_fdb_update_create(struct vxlan_dev *vxlan,
 				   __be16 port, __be32 src_vni, __be32 vni,
 				   __u32 ifindex, __u16 ndm_flags, u32 nhid,
 				   bool swdev_notify,
-				   struct netlink_ext_ack *extack)
+				   struct netlink_ext_ack *extack, gfp_t gfp)
 {
 	__u16 fdb_flags = (ndm_flags & ~NTF_USE);
 	struct vxlan_fdb *f;
@@ -1103,7 +1104,7 @@ static int vxlan_fdb_update_create(struct vxlan_dev *vxlan,
 
 	netdev_dbg(vxlan->dev, "add %pM -> %pIS\n", mac, ip);
 	rc = vxlan_fdb_create(vxlan, mac, ip, state, port, src_vni,
-			      vni, ifindex, fdb_flags, nhid, &f, extack);
+			      vni, ifindex, fdb_flags, nhid, &f, extack, gfp);
 	if (rc < 0)
 		return rc;
 
@@ -1126,7 +1127,7 @@ int vxlan_fdb_update(struct vxlan_dev *vxlan,
 		     __be16 port, __be32 src_vni, __be32 vni,
 		     __u32 ifindex, __u16 ndm_flags, u32 nhid,
 		     bool swdev_notify,
-		     struct netlink_ext_ack *extack)
+		     struct netlink_ext_ack *extack, gfp_t gfp)
 {
 	struct vxlan_fdb *f;
 
@@ -1140,7 +1141,8 @@ int vxlan_fdb_update(struct vxlan_dev *vxlan,
 
 		return vxlan_fdb_update_existing(vxlan, ip, state, flags, port,
 						 vni, ifindex, ndm_flags, f,
-						 nhid, swdev_notify, extack);
+						 nhid, swdev_notify, extack,
+						 gfp);
 	} else {
 		if (!(flags & NLM_F_CREATE))
 			return -ENOENT;
@@ -1148,7 +1150,7 @@ int vxlan_fdb_update(struct vxlan_dev *vxlan,
 		return vxlan_fdb_update_create(vxlan, mac, ip, state, flags,
 					       port, src_vni, vni, ifindex,
 					       ndm_flags, nhid, swdev_notify,
-					       extack);
+					       extack, gfp);
 	}
 }
 
@@ -1284,7 +1286,7 @@ static int vxlan_fdb_add(struct ndmsg *ndm, struct nlattr *tb[],
 	err = vxlan_fdb_update(vxlan, addr, &ip, ndm->ndm_state, flags,
 			       port, src_vni, vni, ifindex,
 			       ndm->ndm_flags | NTF_VXLAN_ADDED_BY_USER,
-			       nhid, true, extack);
+			       nhid, true, extack, GFP_ATOMIC);
 	spin_unlock_bh(&vxlan->hash_lock);
 
 	if (!err)
@@ -1504,7 +1506,8 @@ static enum skb_drop_reason vxlan_snoop(struct net_device *dev,
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
+							       GFP_ATOMIC);
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
index 6e896ddf658c..23e9b06e3c02 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -554,7 +554,7 @@ int vxlan_update_default_fdb_entry(struct vxlan_dev *vxlan, __be32 vni,
 				   const union vxlan_addr *old_remote_ip,
 				   const union vxlan_addr *remote_ip,
 				   u32 old_ifindex, u32 new_ifindex,
-				   struct netlink_ext_ack *extack)
+				   struct netlink_ext_ack *extack, gfp_t gfp)
 {
 	const struct vxlan_config *cfg = rtnl_dereference(vxlan->cfg);
 	int err = 0;
@@ -576,7 +576,8 @@ int vxlan_update_default_fdb_entry(struct vxlan_dev *vxlan, __be32 vni,
 				       vni,
 				       vni,
 				       new_ifindex,
-				       NTF_SELF, 0, true, extack);
+				       NTF_SELF, 0, true, extack,
+				       gfp);
 		if (err && extack) {
 			spin_unlock_bh(&vxlan->hash_lock);
 			return err;
@@ -653,7 +654,8 @@ static int vxlan_vni_update_group(struct vxlan_dev *vxlan,
 					     oldrip, newrip,
 					     cfg->remote_ifindex,
 					     cfg->remote_ifindex,
-					     extack);
+					     extack,
+					     GFP_NOWAIT | __GFP_ACCOUNT);
 	if (ret) {
 		if (joined)
 			vxlan_igmp_leave(vxlan, group, 0);
@@ -727,7 +729,8 @@ int vxlan_vnilist_update_group(struct vxlan_dev *vxlan,
 		ret = vxlan_update_default_fdb_entry(vxlan, vent->vni,
 						     oldrip, newrip,
 						     old_ifindex, new_ifindex,
-						     extack);
+						     extack, GFP_ATOMIC |
+						     __GFP_ACCOUNT);
 		if (ret)
 			goto err_unwind;
 	}
@@ -749,7 +752,8 @@ int vxlan_vnilist_update_group(struct vxlan_dev *vxlan,
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

