Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD71E3A4F35;
	Sat, 12 Sep 2026 20:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789243487; cv=none; b=s+bPSNPO9KLZCpq5qq8GPnmsQkJzv2WlE32NM/ZzqWQS9/Xjl8UZy/aIKacLsORU6KTOONhVbEpVEOOQam7+A5T9McH5CZf43Fex3Eiu8GINWYXb/8Wlzl1vp3wKr5iC8cY8mROIFYd5J1EMJ3oLjy5VUJ639MwEDZAf+xbAvUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789243487; c=relaxed/simple;
	bh=tmEvGZIL5vXtpEuXE0uOBicD54Gwa1umGdgnpskAWmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U7ZKL24ko537UtM3ouQ8gYiE2rKBz9vZE6S+zVchOUklwWajI2ayEkUO0GQaD0jpmBOz7KAp4m4PSfvjhr4m/Rh3oDb9iyNJNzNxvkIftsNyUGn3ynVe5SLrXlTki9pcsXWG+eiJRZWQEoPrCBqK61cytXiYN7VrLxGYa9+7xws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+vwqfpX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+vwqfpX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130461F0089C;
	Sat, 12 Sep 2026 20:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789243481;
	bh=/AJ0OU1zHH0UlnOeZ0jiSbZa3MIGsSezQQ1wIF4XSOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k+vwqfpXqzzfRi36rfEy+tXdwhyFHr3lJiYwBz0pey0vSVr3A3BFqahfvILJZ1A1v
	 c72Ip/mYWbvtbA8Rj3xZ0JvWLpBuJBPB3darhsza86m9V77FZjBf2p54DhXXwgfeU1
	 sYsn77nhTdin21a9O32B3VEOwXthJVqSOeEmKt8FeedgRSFtV47WsKGYc+7AtAudEP
	 /ReavesP+2Oejcy50vjl5eLNyRSk+KtPKbXeJy7rj9g9g3O3/ukGmYZYs2OsnZOQRb
	 JPFUxLe5YUlu25C6mwJqU1w7ne8yfS48fIabau0D/MhQ46lG5ODjjCplQbFYTLVgyI
	 xDj5T/wennp+w==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	daniel.zahka@gmail.com,
	willemdebruijn.kernel@gmail.com,
	donald.hunter@gmail.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 2/6] psp: don't report the main netdevice's ifindex to associated namespaces
Date: Sat, 12 Sep 2026 13:04:22 -0700
Message-ID: <20260912200426.121025-3-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912200426.121025-1-kuba@kernel.org>
References: <20260912200426.121025-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PSP device is visible in a netns if any of the devices (eg. netkit)
are associated with that PSP device. In the main netns we show
all the associated netdevs + their netns id. In the "container"
netns we show only the local devices. But we were listing the main
netdev in all cases, even though it's meaningless outside of
the main netns.

Report ifindex only in the main netdevice's namespace. Absence is
already unambiguous, the by-association flag is set exactly in the
messages which no longer carry the ifindex.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 Documentation/netlink/specs/psp.yaml | 2 ++
 net/psp/psp_nl.c                     | 7 +++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/netlink/specs/psp.yaml b/Documentation/netlink/specs/psp.yaml
index e9c2ee7e28e0..f3266763c325 100644
--- a/Documentation/netlink/specs/psp.yaml
+++ b/Documentation/netlink/specs/psp.yaml
@@ -38,6 +38,8 @@ name: psp
         doc: |
           ifindex of the main netdevice linked to the PSP device,
           or the ifindex to associate with the PSP device.
+          Only reported to the network namespace the main netdevice
+          lives in, an ifindex has no meaning outside of it.
         type: u32
       -
         name: psp-versions-cap
diff --git a/net/psp/psp_nl.c b/net/psp/psp_nl.c
index f91665748dde..b57366b5e032 100644
--- a/net/psp/psp_nl.c
+++ b/net/psp/psp_nl.c
@@ -294,13 +294,16 @@ psp_nl_dev_fill(struct psp_dev *psd, struct sk_buff *rsp,
 		return -EMSGSIZE;
 
 	if (nla_put_u32(rsp, PSP_A_DEV_ID, psd->id) ||
-	    nla_put_u32(rsp, PSP_A_DEV_IFINDEX, psd->main_netdev->ifindex) ||
 	    nla_put_u32(rsp, PSP_A_DEV_PSP_VERSIONS_CAP, psd->caps->versions) ||
 	    nla_put_u32(rsp, PSP_A_DEV_PSP_VERSIONS_ENA, psd->config.versions))
 		goto err_cancel_msg;
 
 	if (cur_net == dev_net(psd->main_netdev)) {
-		/* Primary device - dump assoc list */
+		/* Primary device - report the netdev, dump assoc list. */
+		if (nla_put_u32(rsp, PSP_A_DEV_IFINDEX,
+				psd->main_netdev->ifindex))
+			goto err_cancel_msg;
+
 		err = psp_nl_fill_assoc_dev_list(psd, rsp, cur_net, NULL);
 		if (err)
 			goto err_cancel_msg;
-- 
2.55.0

