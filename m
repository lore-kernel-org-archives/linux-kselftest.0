Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694553;
	b=W+q0Au1v37MMhR+0hoH0bYadpi2weFfb/WQWNUGd8St0evqew9FklQLdRRRRutchyrfZ
	 RXxTzqgOeLqE+C53F7GlqtmgJB2HS7xKBf0FaYpIBAHDRKRKLI8VZ0xOWc8YmJSjB593o
	 2/jjh1cJvK+FoVgRcpcmprScR9/RUruMHjDG1Y/TEidQEvOrNvfTbL8Y1o8oXryl7omrY
	 JctBihbZ0hkB0NWc1oAn/RhTBLDRshvqrW+9p+mIlxhmOZgud3IQr0hK8goLYspNEf2R1
	 5IWlbx6tSRrXNQxIE6Gsz9hpHQxSJXZMzO04erwXE6RUR8aDuyTyjc2aGFeeLPApmxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yoG65OXiXkWQCJFS12NP3/OMELZGoJucnTHxc+Moicc=;
	b=gPWu66fEIOE5CQVFQVp+Qcwe0bmaIeo/v6+fJ2dzbB63c5ZwmZb/YiaOGuvHzC+EY7VT
	 bZzVvfTK4KrXKEjf1iqCAH4qAViNrKnh3P0febEIe6um/2b9JUyJBiOkoxF24qyXCschL
	 wJGawK5sJlZRWspyo8j2Geh/9j4Zg518d2zF+7Z+t/YggyHu2X7gHWGbauTLo9b4J6X96
	 lo9sLMv3v53xHMZJTxLqQxlppGCFqunAHZgMa9VJ33IlwHnsERxWcloPwiJIibYPYhnx0
	 9RIdzMAvfbPyKYGEVxtUsm+UnFXSD4tlTmxGnIYIzpamQfgrABBf3tOmiUb1Irk3uDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UMImx1uh;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3413B606A891
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 22:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3413B606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UMImx1uh
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so22218915e9.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 14:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694552; x=1795299352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yoG65OXiXkWQCJFS12NP3/OMELZGoJucnTHxc+Moicc=;
        b=UMImx1uhnpPgZWwJXeXprNt+VqJnEZ9kx4WELoHGjviyYMtFHwBPhkFgV8S3GKm9IZ
         oN3iCp90hHlJaHunHPOxVMa5BHrqf3xXxOaiWaNJFchIsM2/eW9u6x2KyCu0S99PMiaf
         T3GaZFBs9U2UdOw5TWVm7ECrMS/iy9FV4NW3pAnCIYsBTdvSRs0JtYyZBZjaSSrnqIGG
         Y/GANUc6yHIRHGVjvUeozGTkQxB9Ioote1JuQA6AIRybLNuh9DxILvXotbhhwLVGVRMr
         /oKYNyMha/YdSL+pDwP943wZ7Tj5FjCFCuBJGJllLRXSeo6VUMavaHsv6YIYXzQiV/9h
         8hzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694552; x=1795299352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yoG65OXiXkWQCJFS12NP3/OMELZGoJucnTHxc+Moicc=;
        b=D5jPcRPqkeqcvmLfDMOXzSPBCDFxaZxVqCPuvyz/WaFVgdRcnP0r9Z80BLKlgtrSto
         t/4jiJZXPNPoaAaN46dJyCu1aS0iC7fnKxyx6qBFP5X24tGP9AFPuIu6/JrvNUedVLoA
         c+px9o6chjLkbvYIEywDLhuYck8CA9HjOfUUyPHSMnwWqvpYbqEn6zKqfWk8obJy0WD2
         GdFGXkvOnvCf3Pfi8I/d/gE6sJewvU7fd2yBLu0EyFq1JGJGms0mQ3bHEzc/LiRV7pKE
         qO0KyximYB8qD/sK7b/7IwVim/dAAEV0koaohBH2KA6SGDF/pn3wnzaVcnRYTtvm/gHM
         50Nw==
X-Forwarded-Encrypted: i=1; AL+hErHZcfNxRr25IVtj0OR1cjZFbtDU7K+o9bjerntGwjjtpVG6pGOVsvIlwray1hSqE8UQsbjlxHyDwJGqM2tQSsY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uxiut2fHVofh4Q7h7lLYFz1eRaO1ezc6Q7l4f1U1HIKIHvSt8
	SFSxt2kr3AkqHlA4VqjrajGQDES0aitqwb7Gw++775TKRV6ecCutOLjd
X-Gm-Gg: AYBFou0SRlH+H7bEBZhyouvPnob80IhzpXY7Tv//xJxqvCskoPd1t17LyNe7kw3rpc3
	zTF++AZZdwPTuNeM1aoX8PJ2HFKMgm/dt1Jmhzd8IeOuywhDPCblmU81EeRpyYAXooeu0rm4mvu
	OF+Fn33IlVyv+KIyPW03dXAx25ceM6CZrWT6N0kkt5yt2dhSl5msWf4/WM821uJfxr8lDRK12hs
	1UxDI81CKnNs293Hr4hjlQe9WKlhZJXs7db/5zMet0kWmfmqAmdMa8SPvAjAW7yNiv9iU0PaW9v
	EC4bzmlQGu5S/Kk8zG0u+h2eGNygcB4yeAWRKe58tqDQefhuPa3RX4qc9V/nRh6UjoT1+FU8lWe
	r4/sxV5SMi62J6jZ6Tnllq5Mx1Z4+Bs9CDNZyH3v4UKn5zyIVApwvUfufTeikHM6O1dAtxKznSZ
	GE5NPgCYDH7lzgWtUKN+Vjn5gEi+U0WCcv43S2GpYCpmcowMSfyd8XHsAxupTrS9RScmOCUhW9u
	UqOdwwpWGn5oFWj+jHYyPmSS+w4c1moNxOUDcE+j9o36ng5+TzB7uo6nci32HTUOkbhjzSRApzL
	mdfMINgEyGkuVZqnApZFMHg=
X-Received: by 2002:a05:600c:2784:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb4e2918b1mr188363445e9.2.1794694551566;
        Sat, 14 Nov 2026 14:15:51 -0800 (PST)
Received: from kali ([169.224.126.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm13514941f8f.8.2026.11.14.14.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:15:51 -0800 (PST)
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
	Ali Firas <alishmery18@gmail.com>,
	Weiming Shi <bestswngs@gmail.com>,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH net-next v5 6/8] vxlan: vnifilter: roll back a VNI add that fails
Date: Sun, 15 Nov 2026 01:14:10 +0300
Message-ID: <20261114221412.255825-7-alishmery18@gmail.com>
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

vxlan_vni_add() publishes a new VNI before the steps that can still
fail: the node goes into the VNI rhashtable, the VNI list and, when the
device is up, the per-socket VNI hash. Only then does
vxlan_vni_update_group() install the VNI's default FDB entry and join
its multicast group. If either fails, nothing is undone and
RTM_NEWTUNNEL is sent anyway, so a request that returns an error leaves
behind a VNI that is listed, notified and accepts unicast VXLAN frames,
but has no default entry or no membership. A retry of a VNI that
inherits the device remote, or of one whose join failed, does not repair
it: vxlan_vni_add() then takes the update path, which finds the stored
remote equal to the requested one and returns 0.

Both failures are reachable without memory pressure. Installing the
entry fails with -ENOSPC once the device holds maxaddress FDB entries.
The join fails with -ENOBUFS once the socket holds
net.ipv4.igmp_max_memberships groups (20 by default).

Make installing the entry the last step that can fail, then undo the
publication when it does. On create, vxlan_vni_update_group() now joins
the group first and leaves it again if the entry cannot be installed.
The membership is given back only if this join took it, not when
-EADDRINUSE says the socket already held it. Installing the entry
either succeeds or leaves no FDB state behind: vxlan_fdb_create() frees
what it allocated, and "vxlan: leave FDB state and flags unchanged
when an update fails" covers an append to an existing entry. That leaves
vxlan_vni_add() only the VNI itself to unpublish. It does so with the
helpers vxlan_vni_del() uses, in reverse order of publication. It frees
the node through the same call_rcu(), so an RX or TX lookup that still
holds it under RCU does not see it freed. RTM_NEWTUNNEL is now sent
only on success. Commit aa6ca1c5c338 ("vxlan: vnifilter: send
notification on VNI add") sent it on failure too, because the VNI then
stayed installed; a VNI added without a group or remote still gets it,
as that commit intended.

vxlan_vni_delete_group() is not reused here. Its guard also fires when
only the device has a remote, so on such a device it deletes a default
entry even when installing that entry is what failed. Since
vxlan_fdb_parse() accepts any NDA_SRC_VNI, that entry can be one
installed out of band.

Ido raised the missing rollback in review of a vxlan_igmp_join() fix
(Links below), and the automated review of v4 of this series raised it
again. Both failures were triggered in QEMU on net-next with the limits
above, without modifying the kernel or injecting errors, and showed each
symptom described above.

Tested in QEMU: test_vxlan_vnifiltering.sh gains a case for each failure
later in this series; both fail on net-next and pass on this series,
with and without KASAN and lockdep.

Changing the group of an existing VNI is left as it is. It leaves the
old group before joining the new one, which lets a swap succeed at the
membership limit, so a join that fails there still has the new group
recorded. Fixing that needs a transaction.

This is ordered before "vxlan: vnifilter: account the default FDB entry
to memcg", which makes installing the entry fail routinely at a memory
cgroup limit. It targets net-next, as Jakub suggested in review of the
earlier posting.

Fixes: f9c4bb0b245c ("vxlan: vni filtering support on collect metadata device")
Link: https://lore.kernel.org/netdev/20260323095544.3311285-4-bestswngs@gmail.com/
Link: https://lore.kernel.org/netdev/20260324133449.GA460138@shredder/
Suggested-by: Ido Schimmel <idosch@nvidia.com>
Cc: Weiming Shi <bestswngs@gmail.com>
Cc: Xiang Mei <xmei5@asu.edu>
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v5: new patch, ordered before the FDB accounting patch that makes the
failure routine (review of v4 6/7). The missing rollback was noted in
Weiming Shi's vxlan_igmp_join() fix and raised by Ido in its review
(Links); the changelog says what it did in QEMU (sinfo bot). It
supersedes the separately posted rollback series:
https://lore.kernel.org/netdev/20260911215203.3054653-1-alishmery18@gmail.com/
Unlike that posting it carries a Fixes tag, which maintainer-netdev.rst
requires for fixes regardless of the tree.

 drivers/net/vxlan/vxlan_vnifilter.c | 50 +++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 07aa641f16e8..6e896ddf658c 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -606,6 +606,7 @@ static int vxlan_vni_update_group(struct vxlan_dev *vxlan,
 	const struct vxlan_config *cfg = rtnl_dereference(vxlan->cfg);
 	const union vxlan_addr *newrip = NULL, *oldrip = NULL;
 	union vxlan_addr old_remote_ip;
+	bool joined = false;
 	int ret = 0;
 
 	memcpy(&old_remote_ip, &vninode->remote_ip, sizeof(old_remote_ip));
@@ -633,13 +634,31 @@ static int vxlan_vni_update_group(struct vxlan_dev *vxlan,
 	if (!create && oldrip && newrip && vxlan_addr_equal(oldrip, newrip))
 		return 0;
 
+	/* A new VNI joins its group before its default FDB entry is installed,
+	 * so that installing the entry is the last step that can fail, and a
+	 * failure leaves vxlan_vni_add() only the VNI itself to undo.
+	 */
+	if (create && group && (vxlan->dev->flags & IFF_UP) &&
+	    vxlan_addr_multicast(group)) {
+		ret = vxlan_igmp_join(vxlan, group, 0);
+		if (ret == -EADDRINUSE)
+			ret = 0;
+		else if (!ret)
+			joined = true;
+		if (ret)
+			goto out;
+	}
+
 	ret = vxlan_update_default_fdb_entry(vxlan, vninode->vni,
 					     oldrip, newrip,
 					     cfg->remote_ifindex,
 					     cfg->remote_ifindex,
 					     extack);
-	if (ret)
+	if (ret) {
+		if (joined)
+			vxlan_igmp_leave(vxlan, group, 0);
 		goto out;
+	}
 
 	if (group) {
 		memcpy(&vninode->remote_ip, group, sizeof(vninode->remote_ip));
@@ -647,7 +666,7 @@ static int vxlan_vni_update_group(struct vxlan_dev *vxlan,
 			vxlan_vnifilter_seq_inc(dev_net(vxlan->dev));
 	}
 
-	if (vxlan->dev->flags & IFF_UP) {
+	if (!create && (vxlan->dev->flags & IFF_UP)) {
 		if (vxlan_addr_multicast(&old_remote_ip) &&
 		    !vxlan_group_used(vn, vxlan, vninode->vni,
 				      &old_remote_ip,
@@ -850,6 +869,14 @@ static void vxlan_vni_free(struct vxlan_vni_node *vninode)
 	kfree(vninode);
 }
 
+static void vxlan_vni_node_rcu_free(struct rcu_head *rcu)
+{
+	struct vxlan_vni_node *v;
+
+	v = container_of(rcu, struct vxlan_vni_node, rcu);
+	vxlan_vni_free(v);
+}
+
 static int vxlan_vni_add(struct vxlan_dev *vxlan,
 			 struct vxlan_vni_group *vg,
 			 u32 vni, union vxlan_addr *group,
@@ -889,18 +916,21 @@ static int vxlan_vni_add(struct vxlan_dev *vxlan,
 
 	err = vxlan_vni_update_group(vxlan, vninode, group, true, &changed,
 				     extack);
+	if (err)
+		goto err_unpublish;
 
 	vxlan_vnifilter_notify(vxlan, vninode, RTM_NEWTUNNEL);
 
-	return err;
-}
-
-static void vxlan_vni_node_rcu_free(struct rcu_head *rcu)
-{
-	struct vxlan_vni_node *v;
+	return 0;
 
-	v = container_of(rcu, struct vxlan_vni_node, rcu);
-	vxlan_vni_free(v);
+err_unpublish:
+	if (vxlan->dev->flags & IFF_UP)
+		vxlan_vs_add_del_vninode(vxlan, vninode, true);
+	__vxlan_vni_del_list(vxlan, vg, vninode);
+	rhashtable_remove_fast(&vg->vni_hash, &vninode->vnode,
+			       vxlan_vni_rht_params);
+	call_rcu(&vninode->rcu, vxlan_vni_node_rcu_free);
+	return err;
 }
 
 static int vxlan_vni_del(struct vxlan_dev *vxlan,
-- 
2.53.0

