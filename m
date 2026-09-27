Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87933CAE95
	for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 21:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546055; cv=none; b=YevcflOK2V2SdJs/tu3+tD7S2hK9OmtfC4LkHswE8v5wz6eRWXPy379fw4HaKuCbupAyGvEMAnYsMtvGoa4VvgBsN8jAIexXrONkSsDaLJ/ektRlcWcdNauiZp0ZGHETihahuMj+i4OCEhDutTQsoQlTIjwcTI9KTUKXkt2N9nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546055; c=relaxed/simple;
	bh=sscHr/a0eI+rSyX2APqOJXjosRWL7Frah0IdG2yROFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R5EouTgv26C88BPqS8Wk9t5/au11K0RbfKmaItRSuYVCP8G41aPlQJelm2ytShxPxFtmj7d+jeqoztdELYQdmwl1tKiocZsles5b6aapvAhyRxB47bCHu3I4421NBsW0EHRlYUUkgPfx9RLOr+VP3HNtBMOXemNYetmtetU17Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFrJuvFf; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFrJuvFf"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so7955765e9.1
        for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 14:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546046; x=1791150846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uylNNtWhFrB2xKZW5KF3UySVhmnx4gMhtUpqjfbH9bg=;
        b=MFrJuvFfS+wV+0MljxiIkn57ZPO1HfhRN329+rbFNyYqxXRVZdMsynWI1XYasSXeMZ
         Evw+IOxQ9efJ1mN28e88gymdxYPZUVFLNzKmqhwyUkyd9TKW+eG9HISu9ijg1wgxZoze
         TJQSrpRQ0bRiISjyspsEe4pb/aRQE/ehz5xeOMIrMTGpSC/1lp/rPN+5FfTjWUkVsYXP
         vrrBBDt8zb6QB40/nNBoADXEfMYD6+J2JqclAbk1hHqG+e8jFAmXAH7xfDEcMDf6Zc0X
         Dj4zvWg9Bu4UKzyKoQY2CQE7I/Z22nAbaAt3z9GD9BFLaOH+0lRqXn3claFIV+xUyeBH
         U+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546046; x=1791150846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uylNNtWhFrB2xKZW5KF3UySVhmnx4gMhtUpqjfbH9bg=;
        b=HLsjtY3CB6WHTo1jPDMO8ohj8VGv7wjsnIYMe39nggf9H7ulPd4kY7Y6ZQ8xsPSSRQ
         +XYYuEpccy0xb8+Gg6D4z/O7HPfEcexcpwS+1lwC/QbESh5nHM/Gv7msbC9P47dGH7v7
         OzqNA6ftvreHN3bAGjRS1CzfG8D+XZvs9JL4umKF2O/MvIci8p4ti1eBrH4q76JppNJU
         UTlF9CROSCiRSHEWnqt8IMhCfXKfNe2MWyPWyFhNteBuYRYWKsqbpetfTKXQJzgRFSP2
         sm7tdht38lBkZoPJ101cRuijm3KXIuIU9zUXmgqcKWag1EhvWcko6X4AZee3+p4VRpCm
         YaWg==
X-Forwarded-Encrypted: i=1; AKwUvBz2vb2xRQ93oc15bMYjh2dP0CZTcufrNHUgDGOQs/bHhSuONZkhfMZXa7UhlLvCL0OzSdeVCfI/r8DbDwVdfrI=@vger.kernel.org
X-Gm-Message-State: AFuF++kuSYu0MbPUKFmLV25/qQ1rCFyl+24Z3W7Il2FWvENA9Dbn1GNb
	JJokieoSsJ/pqPB+plJ/Cjtc0ucn2HyxX/AfjwdU44LzKknaWtYOIK+lsoZ11690h0E=
X-Gm-Gg: AYBFou0xYUGttKigqNzcGQd9l8wgZIRa0e/Y2xGa1mOOAGGD5nKWwHf10ni2GpDsENx
	KNqtjaTY++704kE8xQBIA8VaD4Dan4CBBQ8Vj3m84dsFBC8Khdl5LLjTuDGiTmSaB0/piKh+j0T
	iOzR6RLzjgylVi1XhZVmr4qxNQkcOxboiiUwO+S1f+lllA3m0PjK8hH6W1zsWSK7ur17bw4ouj8
	UZp4MXeMGJyt4/Mv82ouBWgjsmWX60zMR1p1m+r7h8nB/BrFmZn9m5RGGd5+fPpnfo1N8QREO9G
	6O63o1QKNspOtPJOItAH4YVVP2lCoXgWlNfIgfhSjPrQS1Ylt2gH9B4nvo/GvT+0amytfgmdQ7v
	XDHOpaXxyP87Jhb9iCmZ2gykzlYEytJ7xoptYMVvMKN6rSEYuxgbEMlQ7WXU+VIYDbXSKNYFx5i
	Xxks3/DYaZXsKfW3Dxh0iVjAL9GarIV6/i6uhQYk9hsh8JJMGy3nMOvXggrPP2LM/54EA+p5i1t
	g==
X-Received: by 2002:a05:600c:1f83:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fe66c8087mr200153965e9.3.1790546046087;
        Sun, 27 Sep 2026 14:54:06 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001922102sm89556865e9.15.2026.09.27.14.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:54:05 -0700 (PDT)
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
Subject: [PATCH net-next v3 5/6] vxlan: vnifilter: account per-VNI memory to memcg
Date: Mon, 28 Sep 2026 00:52:08 +0300
Message-ID: <20260927215209.2581830-6-alishmery18@gmail.com>
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

vxlan_vni_alloc() allocates a struct vxlan_vni_node and a per-CPU stats
block for every VNI, both with plain GFP_KERNEL, so neither is charged
to the cgroup of the process that created the VNI. A netdevice's own
queues, ethtool state and NAPI config are already GFP_KERNEL_ACCOUNT in
alloc_netdev_mqs() (commit c948f51c1654 ("memcg: enable accounting for
net_device and Tx/Rx queues")), so these per-VNI allocations are the
unaccounted part of a device that a cgroup can grow one VNI at a time.

Charge both to the caller's cgroup with GFP_KERNEL_ACCOUNT in
vxlan_vni_alloc(). __GFP_ACCOUNT only charges an allocation made from a
task in a non-root memcg, so the sole caller, which already handles a
NULL return, is unaffected outside a memcg.

The charge lands in the caller's memcg: adding VNIs from inside one
moves each node into the accounted slab and raises the cgroup's per-CPU
memory, while the unaccounted slab is unchanged.

Assisted-by: LLM
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---

Notes:
    v3: replaces 3/5 and 4/5. Account the per-VNI node and its per-CPU stats in vxlan_vni_alloc().

 drivers/net/vxlan/vxlan_vnifilter.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 92ea1fc94f45..3087877ed1cb 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -711,10 +711,11 @@ static struct vxlan_vni_node *vxlan_vni_alloc(struct vxlan_dev *vxlan,
 {
 	struct vxlan_vni_node *vninode;
 
-	vninode = kzalloc_obj(*vninode);
+	vninode = kzalloc_obj(*vninode, GFP_KERNEL_ACCOUNT);
 	if (!vninode)
 		return NULL;
-	vninode->stats = netdev_alloc_pcpu_stats(struct vxlan_vni_stats_pcpu);
+	vninode->stats = __netdev_alloc_pcpu_stats(struct vxlan_vni_stats_pcpu,
+						   GFP_KERNEL_ACCOUNT);
 	if (!vninode->stats) {
 		kfree(vninode);
 		return NULL;
-- 
2.53.0

