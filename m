Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8AD4E50B1
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 12:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981619; cv=none; b=eg+3OtUluXzkKsJE2qmEsVJLBzgub2gVnoqEznMngOmh5cZKofCMukodFc9v75IEW8Nbh5NDhtEQdAUnlZSGltPwtjCYPi9JcLkPOli2XXGTlye1Z7NUuIX1oxPptFWGJuGrVELRe1s9HgP2mFtSqbjDnbSnskeuESQGhkcfWaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981619; c=relaxed/simple;
	bh=wNXTzoBCRrjBH+Z97Yn4B/LpSXjRiTvMR9N5NBkt17M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3IpdTK6qxjHDymA9EsMF5JQ0QzlLpC5W6Kz0SMHDhV2GrU3FE8J6ywk2ULwFWyCnou20MGnqwnT99NAsyFqf1d01hBMNzHt0wpQ77mhamklHe8uzgzA+LN42Sk7hn0xiGciCNTY3bT4JCz0YBBsC5QI8M/2W1CfL6N7mUXR7zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8DlRiAq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8DlRiAq"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so34344185e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 05:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791981610; x=1792586410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z3ZOxRV/kduEE71z1H7/WaoBF6Ffe2PveVQAPTO2Vls=;
        b=g8DlRiAqfuNYNJfRC5/WVTksJwPTfv/UnVx/FW6s/UoV6mJ5B6guBEbQQI5ZlHTmsW
         yEuR9GjIr1/hngWF1YPv7QqeRDq7mv8g2YB8PpRBSQKeSR9Lx3a5cAqt5vdHFkuLaIM6
         ZZXFfKAKm+/HcuEtZNwUEplX7uHKOm2yVNlCt7Pzqh4/wRj58qWarG/+nKk17/w6VoXk
         TyTyGHiH42j8+M4+PLuJK39i2sMVKtf6g113NfpFJWubp6Pm4p0gJHgVbxjflnurGBZX
         O9jszhm20cLqRFf92QbsD1fLoePYZEO0c1MfpK9vB1oPRcrjmhnqrsuxZXfnwoQyQS6M
         egfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981610; x=1792586410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z3ZOxRV/kduEE71z1H7/WaoBF6Ffe2PveVQAPTO2Vls=;
        b=A2Ae0vkUp/BxWKcSYOFi3vmemAzm8XpX4Nm/SQDArNi0EZTpMKsSstayv8c4uYV8Ih
         kBlT4WbOZJSoRhl/WB9uZtM9xcDWEUqswDHVRHzhjE+pzNG76fVgT59Xi6e4xvtXUdeQ
         pfw7Exlw5ruhfegOI17Y62Hu9ughz/91qoC3bTAXF8sZw+aSBRWwi1VOAMQZvrv4ZOGF
         TjorfizSrpJyEHjpRqz0l2ogdz3ZNKnJ5DS7srWuNzDx5YnaELqed+x409gRR6pvqlrW
         sZV4Ob2QrHHzZqWiqoyTwrsvhgAAp80rZ85MqZstoj3iMnmDvMuI6s5+C93joF+vjKPM
         OmWA==
X-Forwarded-Encrypted: i=1; AKwUvBzTKYjy2j4KrU0FV/Q3UGQ8bKHRG4Ewwzz9usDyE5sbYZjOilFjlBNGnilRNcBhydjwH75FZ5e/Hvu0rjEm5Cw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/F0rQ0vjkRpWHKBb+wJzKocQUXqfsQsAd8m8rpM6OTImPTD/G
	PfR4E5wshvS5SDTwSzl0y0+yo7Cv5oBJWHiBqi/mn0fYE6VPDHARzZ8SzCw1KNP0QwU=
X-Gm-Gg: AYBFou0+9tOWtUNT69dv4ubYT9eJEgOfEMJPo/gdF+XxSIFL5XC92yjTjElC4rgateM
	CW1TXkCeY9c7yJH+3V7IkUk3ik32XcambjOHWH4H+/j7if/AkT2ENJp0Vf3DtUG+uRjK7xbWUtW
	6FeBrlA4tlDGAWldXMQMNJ8rhCtTfzagw0A0Ssut4/+/kFW8Pm04LSjCipbTP9R63D6xzgC79rr
	jEiEJ0yGlsYi4S46iV/Eh7VaLk5g0IuCJ4xmWBCyAFTPIqP1YjKlbAzl3GzQP887Y8R7YY7RNRn
	9jkXrltOWz3JCK0NN0vBpIGiRV6JiHHxTO2Wxm9fFKpjHbVAyQx+9yncAZrfM4x+JpqdLyQJd2y
	qrLXKcisjEjnbXYXR+Gja//Jv1gavgQPaEnpV5N/CqNVwDARfH06A9FNs1FJuOw9VMuKyDW71S3
	qUlQu12ICYD+12TRIJ/Ns/I6SvvqJ1FgpkJenF3fY1Jw/dRYH4AZAis1wUkq8nqrA=
X-Received: by 2002:a05:600c:8b65:b0:49e:6683:d23c with SMTP id 5b1f17b1804b1-4a18e3ef1bdmr287671205e9.0.1791981610296;
        Wed, 14 Oct 2026 05:40:10 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b2ec47fcsm54163165e9.1.2026.10.14.05.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:40:09 -0700 (PDT)
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
Subject: [PATCH net-next v4 5/7] vxlan: vnifilter: account per-VNI memory to memcg
Date: Wed, 14 Oct 2026 15:38:12 +0300
Message-ID: <20261014123814.388557-6-alishmery18@gmail.com>
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

vxlan_vni_alloc() allocates a struct vxlan_vni_node and a per-CPU stats
block for every VNI, both with plain GFP_KERNEL, so neither is charged
to the cgroup of the process that created the VNI. A netdevice's own
struct and its Tx/Rx queues are already GFP_KERNEL_ACCOUNT in
alloc_netdev_mqs() (commit c948f51c1654 ("memcg: enable accounting for
net_device and Tx/Rx queues")), so these per-VNI allocations are an
unaccounted part of a device that a cgroup can grow one VNI at a time.

Charge both to the caller's cgroup with GFP_KERNEL_ACCOUNT in
vxlan_vni_alloc(). __GFP_ACCOUNT only charges an allocation made from a
task in a non-root memcg, so the sole caller, which already handles a
NULL return, is unaffected outside a memcg.

The charge lands in the caller's memcg: adding VNIs from inside one
moves each node into the accounted slab and raises the cgroup's per-CPU
memory. This covers the node and its stats only; a VNI carrying a group
or remote also installs a default FDB entry, whose allocations are not
charged here and are accounted by the next patch.

Assisted-by: LLM
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v4: reworded to cover the node and stats only; the
c948f51c1654 reference narrowed to net_device and its Tx/Rx queues;
rebased.

 drivers/net/vxlan/vxlan_vnifilter.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 2999dd536625..4a631fcdf23a 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -825,10 +825,11 @@ static struct vxlan_vni_node *vxlan_vni_alloc(struct vxlan_dev *vxlan,
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

