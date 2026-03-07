Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E327D36C59A
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Mar 2026 07:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772870201; cv=none; b=LraUvK8XgvOVbzx0Wi/iDFjFAa5zby4SA1x+55DPJObYRox4HuA1E874HS5zrt2WvLYOAFTa8rjMZivGlRbunWe6wnGhbb3HndHTpGDBpxRF6mH8t842l31gE242O24H/ne5kOCFRNBfvfElYgZ34IWY+QdwGsdsiFxRcd+hwLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772870201; c=relaxed/simple;
	bh=vgs6OvFfhn6LgRJBXvD8e7DncJV6JvlCX+BURozjQ2k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pzvAc3SPyLyI3Yy5EYbCKSl67fSEoE7NCDmQG46hVGpOW7DJnOLXd2tYx/CAjAHOmgIcFsF81Vn+g9WJ+37wLd9sR5Trc182Dnn1fwejMafYoqjWCzPw+gMVxmz3YO9/Cy8v3HG5tz3w7AMb89zqdknuiCr+MuLZ8d8rkbk+wUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fu0GlI/z; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fu0GlI/z"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772870197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUMKZd8SUAnYq8W0a6TH01hT+Tx21DpSkFW2LXP37DM=;
	b=fu0GlI/zl5ja55xkrM7JyjJBPHBj8t0QJ8svzuKM0F+NRBDIiGgoq5RabgEzEXdoO99UYS
	M+PO5Ox3nfwf9bLMoBkepgn6+CCOu6T9EtDLJtekdILvHjSQALTsbdwvq29BeaHBISx0Zg
	K3U/CxovfcYBxM/Ujbk56LjfaEcfY1M=
From: Zhu Yanjun <yanjun.zhu@linux.dev>
To: jgg@ziepe.ca,
	leon@kernel.org,
	zyjzyj2000@gmail.com,
	yanjun.zhu@linux.dev,
	dsahern@kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 1/4] RDMA/nldev: Add dellink function pointer
Date: Fri,  6 Mar 2026 23:56:08 -0800
Message-ID: <20260307075611.3410-2-yanjun.zhu@linux.dev>
In-Reply-To: <20260307075611.3410-1-yanjun.zhu@linux.dev>
References: <20260307075611.3410-1-yanjun.zhu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The newlink function pointer is added. And the sock listening on port 4791
is added in the newlink function. So the dellink function is needed to
remove the sock.

Signed-off-by: Zhu Yanjun <yanjun.zhu@linux.dev>
---
 drivers/infiniband/core/nldev.c | 6 ++++++
 include/rdma/rdma_netlink.h     | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/infiniband/core/nldev.c b/drivers/infiniband/core/nldev.c
index 2220a2dfab24..48684930660a 100644
--- a/drivers/infiniband/core/nldev.c
+++ b/drivers/infiniband/core/nldev.c
@@ -1824,6 +1824,12 @@ static int nldev_dellink(struct sk_buff *skb, struct nlmsghdr *nlh,
 		return -EINVAL;
 	}
 
+	if (device->link_ops) {
+		err = device->link_ops->dellink(device);
+		if (err)
+			return err;
+	}
+
 	ib_unregister_device_and_put(device);
 	return 0;
 }
diff --git a/include/rdma/rdma_netlink.h b/include/rdma/rdma_netlink.h
index 326deaf56d5d..2fd1358ea57d 100644
--- a/include/rdma/rdma_netlink.h
+++ b/include/rdma/rdma_netlink.h
@@ -5,6 +5,7 @@
 
 #include <linux/netlink.h>
 #include <uapi/rdma/rdma_netlink.h>
+#include <rdma/ib_verbs.h>
 
 struct ib_device;
 
@@ -126,6 +127,7 @@ struct rdma_link_ops {
 	struct list_head list;
 	const char *type;
 	int (*newlink)(const char *ibdev_name, struct net_device *ndev);
+	int (*dellink)(struct ib_device *dev);
 };
 
 void rdma_link_register(struct rdma_link_ops *ops);
-- 
2.52.0

