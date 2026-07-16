Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56748424D48
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 13:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784208219; cv=none; b=e3mbIfGhMWSuokszG8pHK8caLTNuyvbKLLp1ZRngiA95aSZ3T954hZAn0RNVU4gXjnun1nn99TqmNV/PAUullvVtf75glWPbCt/NQ2kLeLvBverQe0eTLV8k0vQLK+Dn67X2xA1X/CGaEr/D7sRcml/+IDUUtmev9mWk4O00MHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784208219; c=relaxed/simple;
	bh=DZOG7H+X305alvcfYyKRY+OmEfAdQKwMydMDvfsKbqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pk2TsZ0mf6z7yTQBH/AftU/JQgfpImkXZMNeS7XOu+Oxmwe7SFZH54OuQF8yPzPXdMWYXi2un4xMfX6nUP78H9nkFAsd91FPtq5ugMaNi1FivIZ4mP4UWdcaMTEVFi3FbWHzejXHF5K5E6f378WHYd0QhRpoAGyQRNPXh7jtuCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=bN/WIsyc; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="bN/WIsyc"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso46848715e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 06:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784208215; x=1784813015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hvdgg/J5f+MIG37tkYT96k3bKW9qtjOneXBYLVa18U=;
        b=bN/WIsycRyjenY8fmlziexThg5Td82HX0pUBuXFZEzB6+P5V2/GnigsN/2VjlHYcHY
         QbxXufmRDw+AyZyrA93fJmzFTg/vjmdEvzDhnLQpkvM4aV/S9SrpPr6vgkKb+rFJCEg/
         AXqv87EogTaFDe7AEwmg98hKhy6QYRad+MA+gjPUHEi+zpktyWYL7fxqCysyRpAKa37x
         bkTcxr/ZqQaHjltMnaQl3XIiTtZ8HBdFmPesjWwsjf+XqLDnOG4hJebnO+DJIKUajYoB
         agbABX/5B3Gld+tH4iL7AF20hbcrkIptHg4Cg/8H29z6nXYb01pXiIp1LNIwL77/Mudp
         ZEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784208215; x=1784813015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3hvdgg/J5f+MIG37tkYT96k3bKW9qtjOneXBYLVa18U=;
        b=eIjmknjuS5CdtZCBuFOivY6P8LymKBcIdz3cgaehSMhPXyiT3icPNoHzqHvCyy4egS
         hEwv4f0KZ1c7uaSLOnhV9fiHavxwEoGYHD6I0SMo5PCSgOt3IriIxObsrD6IVTVjLe9a
         ywYV81zppdscy0uxzRhvjawcCls39vjdr8mJtowAizDjq6PlloBXM1XMS2paykVUEvRL
         1fNw9oSGi0yguC3+zh0KImk5mOU86fCjCF65t6pQ4go6FNvUuf3nl1t1rr+iOx7eZASN
         Ya5Rj9ltOsA+qx4FjMVRML95vo5bPsf0ZR4BfdArFZW31Omyshp/T05GV0sbxtWeytNh
         119Q==
X-Forwarded-Encrypted: i=1; AHgh+RpuF2kSq7Uj39YZczM9nTO93Mnr53jCVxckMBlk/+RFevMruGZpTp/PTkNy+wnNaKOGuZQJk+HCcUwhjWZxcYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsfKmeziJul5jPtVpklREd071RfqFoYAp/5fPRlqsabIxpCz6P
	Ie0c82YSgat00TvPlAyjLMcDkxUjWsZo0CxMrZWirmO2X7TKzYL42+smK2ax/C7eoJA=
X-Gm-Gg: AfdE7cnhFD6YrPZWFqh9voFt5oq5qbt9QcOSChY00nqsHZX5BShVkeC/Bsua11vea5b
	IMfhwfCm8fqB+OwqrixEv/wgkEpt6oFYgC7goIB4Ygi+BtJfGTfb3RhaTRmQIcKF3k8dkjnut60
	W4LgI/VuxgZ9VLH3EUmioIbfNekgVqIbd5G2Qt3FYm3gFnpqUPq+IpkZVnfl18ewsAqrjda8em+
	+FHa47W5JckQvHcKnMIAswYnzxyEiQlWZBLJxDUy5TX0zYR2GW0JagQ6aweEJrO6zcFNsYfhyoO
	nBW7OXjlidHvzpyMkVGhHO6pGnvpcBvnIEhRg4CE1176BvyErMGjcWb4OoEtTdjaHnXJXMJcYY4
	CNAbmSBAkBLgHOl08DSy2S+sI/kbFMIAgx5BYp1jj9r7edqSoGPyneNnUT+9rtRMKVrw5CWXvVJ
	FHdNwLlqXJJpA=
X-Received: by 2002:a05:600c:c87:b0:493:fd5b:2d5c with SMTP id 5b1f17b1804b1-49515904a8dmr140034755e9.22.1784208215371;
        Thu, 16 Jul 2026 06:23:35 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e8c41asm60535985e9.9.2026.07.16.06.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 06:23:34 -0700 (PDT)
From: Jiri Pirko <jiri@resnulli.us>
To: linux-rdma@vger.kernel.org
Cc: cgroups@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	jgg@ziepe.ca,
	leon@kernel.org,
	parav@nvidia.com,
	mbloch@nvidia.com,
	cmeiohas@nvidia.com,
	roman.gushchin@linux.dev,
	bvanassche@acm.org,
	zyjzyj2000@gmail.com,
	shuah@kernel.org,
	tj@kernel.org,
	mkoutny@suse.com,
	hannes@cmpxchg.org,
	alibuda@linux.alibaba.com,
	dust.li@linux.alibaba.com,
	sidraya@linux.ibm.com,
	wenjia@linux.ibm.com,
	yanjun.zhu@linux.dev,
	cui.tao@linux.dev
Subject: [PATCH rdma-next v3 04/14] RDMA/nldev: Report net namespace move errors through extack
Date: Thu, 16 Jul 2026 15:23:05 +0200
Message-ID: <20260716132316.1495242-5-jiri@resnulli.us>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716132316.1495242-1-jiri@resnulli.us>
References: <20260716132316.1495242-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

Thread extack through the existing net namespace move helper and report the
main failure reasons from the core path. Keep the existing move UAPI shape
unchanged.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 drivers/infiniband/core/core_priv.h |  3 ++-
 drivers/infiniband/core/device.c    | 24 ++++++++++++++++++++++--
 drivers/infiniband/core/nldev.c     |  6 ++----
 3 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/infiniband/core/core_priv.h b/drivers/infiniband/core/core_priv.h
index 3bd5bb7135a3..aaf330b0d333 100644
--- a/drivers/infiniband/core/core_priv.h
+++ b/drivers/infiniband/core/core_priv.h
@@ -356,7 +356,8 @@ void ib_port_unregister_client_groups(struct ib_device *ibdev, u32 port_num,
 				     const struct attribute_group **groups);
 
 int ib_device_set_netns_put(struct sk_buff *skb,
-			    struct ib_device *dev, u32 ns_fd, const char *name);
+			    struct ib_device *dev, u32 ns_fd, const char *name,
+			    struct netlink_ext_ack *extack);
 
 int rdma_nl_net_init(struct rdma_dev_net *rnet);
 void rdma_nl_net_exit(struct rdma_dev_net *rnet);
diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/device.c
index c0b6613dba4c..366bd8463c07 100644
--- a/drivers/infiniband/core/device.c
+++ b/drivers/infiniband/core/device.c
@@ -1871,18 +1871,22 @@ static int rdma_dev_change_netns(struct ib_device *device, struct net *cur_net,
 }
 
 int ib_device_set_netns_put(struct sk_buff *skb,
-			    struct ib_device *dev, u32 ns_fd, const char *name)
+			    struct ib_device *dev, u32 ns_fd, const char *name,
+			    struct netlink_ext_ack *extack)
 {
 	struct net *net;
 	int ret;
 
 	net = get_net_ns_by_fd(ns_fd);
 	if (IS_ERR(net)) {
+		NL_SET_ERR_MSG(extack, "Invalid target net namespace fd");
 		ret = PTR_ERR(net);
 		goto net_err;
 	}
 
 	if (!netlink_ns_capable(skb, net->user_ns, CAP_NET_ADMIN)) {
+		NL_SET_ERR_MSG(extack,
+			       "Missing CAP_NET_ADMIN in the target net namespace");
 		ret = -EPERM;
 		goto ns_err;
 	}
@@ -1893,6 +1897,10 @@ int ib_device_set_netns_put(struct sk_buff *skb,
 	 */
 	if (net_eq(net, read_pnet(&dev->coredev.rdma_net))) {
 		ret = name ? ib_device_rename(dev, name) : 0;
+
+		if (ret == -EEXIST)
+			NL_SET_ERR_MSG(extack,
+				       "Device name already exists in the target net namespace");
 		goto ns_err;
 	}
 
@@ -1901,7 +1909,16 @@ int ib_device_set_netns_put(struct sk_buff *skb,
 	 * changed and this cannot be blocked waiting for userspace to do
 	 * something, so disassociation is mandatory.
 	 */
-	if (!dev->ops.disassociate_ucontext || ib_devices_shared_netns) {
+	if (ib_devices_shared_netns) {
+		NL_SET_ERR_MSG(extack,
+			       "Cannot change net namespace of RDMA device in shared netns mode");
+		ret = -EOPNOTSUPP;
+		goto ns_err;
+	}
+
+	if (!dev->ops.disassociate_ucontext) {
+		NL_SET_ERR_MSG(extack,
+			       "Device does not support namespace changes (no disassociate support)");
 		ret = -EOPNOTSUPP;
 		goto ns_err;
 	}
@@ -1911,6 +1928,9 @@ int ib_device_set_netns_put(struct sk_buff *skb,
 	ret = rdma_dev_change_netns(dev, current->nsproxy->net_ns, net, name,
 				    NULL);
 	put_device(&dev->dev);
+	if (ret == -EEXIST)
+		NL_SET_ERR_MSG(extack,
+			       "Device name already exists in the target net namespace");
 
 	put_net(net);
 	return ret;
diff --git a/drivers/infiniband/core/nldev.c b/drivers/infiniband/core/nldev.c
index 77a758080148..8648e95700bf 100644
--- a/drivers/infiniband/core/nldev.c
+++ b/drivers/infiniband/core/nldev.c
@@ -1195,10 +1195,8 @@ static int nldev_set_doit(struct sk_buff *skb, struct nlmsghdr *nlh,
 		u32 ns_fd;
 
 		ns_fd = nla_get_u32(tb[RDMA_NLDEV_NET_NS_FD]);
-		err = ib_device_set_netns_put(skb, device, ns_fd, NULL);
-		if (err == -EEXIST)
-			NL_SET_ERR_MSG(extack,
-				       "Device name already exists in the target net namespace");
+		err = ib_device_set_netns_put(skb, device, ns_fd, NULL,
+					      extack);
 		goto put_done;
 	}
 
-- 
2.54.0

