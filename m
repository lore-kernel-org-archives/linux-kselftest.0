Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876D84446F0
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 14:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784039409; cv=none; b=kwFpuiLCg+Wjmgbzx4fa9Wt62oyDP0YFVKUgINLt2/BHn2/tc6WYNVsiZKlW+Nx/5jZdyUxDXXFpbs/WWJEvEraYYC3JzInxkjDUIc8V0lwq9ZMwguJ/Erf6vxkj35uPRcW9KX4ojdXFtbVcnisIjBJFLb6qUka18cZp4oaiAuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784039409; c=relaxed/simple;
	bh=BtV4YlWqSeeVkZLMl7O/Z8uUv5IQpghIyehpmENCIJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B9MhDJ8GFhaDFIxvlxzYqCtf+PuOrJgrvgyEnNXWH9xwTd1POSv/q0q7H6ObJ8xpQrnfHVNvh8e1k3QlS1lLVZjwoQM/I6R/5vaMQuEtrJpskcbU3RYSocBgDQsG/kDLfFOD+OjKuZICGrzSd8iQjXE9qTbX9chlCbh13/rMn8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=I7Cipxac; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="I7Cipxac"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4758bd3731bso814601f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 07:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784039406; x=1784644206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FMAXl1cpFneAc8qw41p6eJ7Eq0JeDqgZ4KunEwtw9x4=;
        b=I7CipxacfACQpBFzIV0kdiLsjH5YL5uPNxzHlbHayWvwPnGxpp1AO0dMJrbzcxvSUl
         aCylOdGhA3eFZXX4JRiJp07w6lK/t9MQxdIZqq3/3WC99zUtr6HpuzPg8iDpn/7RfEzJ
         s8AuqXVNyt+oRczuvATMLob05+A+bqb1SXzWcwQRp8KZZsrmavsbOPjpNyTlOPnVoQ1Z
         6S36h90AoKqJaFoKIQr3fSvoV5fZre8VuL/0h/VROorQBUc4MCatVt6O6vTBaHLBT/2G
         jlrdJPB8XDtAAcO3DeEsbp23rLvH0yJ/z4rqIeOhY5QxVSJpr2JH30/qwQ4CEz1x96yt
         rDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784039406; x=1784644206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FMAXl1cpFneAc8qw41p6eJ7Eq0JeDqgZ4KunEwtw9x4=;
        b=X8i4U2ajTH1EVRIPBwa6NIGwWkXpwCnTlRJ67NdmSirOqjCLPX7Sr5ybvpTsQNBpLu
         N6LXnKQd1Ip74h/aGqogLpdY0iVvHpKcgphu2eJncB3BiMJXTRQKpBk5bzYzn8Z67gf/
         /wJQpW+IxSkpmvoGWF6lao9bnAAWgHBnPzc4EFdZzDaMKwhecTnssMZwidShomRPg7to
         0Q5aipPFqUk9nZ2PkgmCdeRshXmIHB7Fn6Nf3aNxPrn12AcT3z5jxef6JQmvy+UaW/Y4
         AOfuKbrONfjkU203FcXcbBF+2wLtXZZq4R/vm4QuObYZ7X4z+nL73leaRxUsir6MMyk4
         mRBw==
X-Forwarded-Encrypted: i=1; AHgh+RoxckvJjdJHzjzqN2pBTTjQ5fI5WPno9IuiDsHzQ13aSL1p6wUFw4GgTN4UKBb67MYLCWPGhEC44BOGscGWkEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMd9CYGHGnPtWqwAZnCmUR6FRcIoCrF0ru8qfjIaAvS1RiQyxA
	1kieUB4f+AdHhG7RG5NX5wrvNKvLAJPUhq+Ecr+9jkSfSM/j17kxm26w45JJWiBfgkM=
X-Gm-Gg: AfdE7clWSZJqw5opgAKBgeVlLb528dl4bO5YfBvDsINAT7fzvCOOsLVHHhsU83Z2I7J
	VQJH8CPt1Fy+4LUaCq8leI0NTVJzTW9raAHdoWqgxPANTMowbR8IuHwSTUDS2w+e2BZ/7XMGR6t
	vo+4MLNch91NI5xbxg0F4+ThgLlQ2uPBrqOgW+OuoXPcYibd5LnA57/IPKxceFwdUM5YcSY2b+t
	Za9s1dpJ5zTprBLi5wPQmQoRRAnBqPw83BMCCxJKlvPhn/Ag/wUWU8C239mDxIpxsTokglyfg2S
	sXkVOnr2szpJ5i0HbytqPyHlfoFLNlta4ucNlTJPWQKZlJdAc1XgHy2okczPKYDrhW6rWQ6Lfn0
	6wc7HIcwbXIpwoj4jKMJNW4Tj6/X9u2R4Z4ZbSWkcGBEr/6mQLnDqHOygu374xcRz/sWo6jY4IG
	B/9LwzbKRiMyzldCiX/TvE9A==
X-Received: by 2002:a05:6000:184d:b0:474:3708:c8 with SMTP id ffacd0b85a97d-47f2dcc0d79mr16328082f8f.15.1784039405669;
        Tue, 14 Jul 2026 07:30:05 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634e029sm9366983f8f.3.2026.07.14.07.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:30:05 -0700 (PDT)
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
Subject: [PATCH rdma-next v2 09/14] RDMA/cma: Document that CM configfs cannot be net namespace scoped
Date: Tue, 14 Jul 2026 16:29:22 +0200
Message-ID: <20260714142927.1298897-10-jiri@resnulli.us>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714142927.1298897-1-jiri@resnulli.us>
References: <20260714142927.1298897-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

Document the rdma_cm configfs limitation: configfs is global, so same-named
RDMA devices in different net namespaces cannot both be represented there.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 Documentation/ABI/testing/configfs-rdma_cm | 4 ++++
 drivers/infiniband/core/cma_configfs.c     | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/ABI/testing/configfs-rdma_cm b/Documentation/ABI/testing/configfs-rdma_cm
index 74f9506f42e7..739f7b6a1259 100644
--- a/Documentation/ABI/testing/configfs-rdma_cm
+++ b/Documentation/ABI/testing/configfs-rdma_cm
@@ -12,6 +12,10 @@ Description: 	Interface is used to configure RDMA-cable HCAs in respect to
 		for this HCA has to be created:
 		mkdir -p /config/rdma_cm/<hca>
 
+		Note: configfs has no network namespace support, so this
+		interface cannot represent two devices that share a name in
+		different network namespaces (possible in exclusive netns mode).
+
 
 What: 		/config/rdma_cm/<hca>/ports/<port-num>/default_roce_mode
 Date: 		November 29, 2015
diff --git a/drivers/infiniband/core/cma_configfs.c b/drivers/infiniband/core/cma_configfs.c
index 891e52afb8f4..c389d4e37b6b 100644
--- a/drivers/infiniband/core/cma_configfs.c
+++ b/drivers/infiniband/core/cma_configfs.c
@@ -65,6 +65,10 @@ static struct cma_dev_port_group *to_dev_port_group(struct config_item *item)
 	return container_of(group, struct cma_dev_port_group, group);
 }
 
+/*
+ * configfs is not net namespace aware, so a name shared by devices in
+ * different namespaces resolves to the first match here.
+ */
 static bool filter_by_name(struct ib_device *ib_dev, void *cookie)
 {
 	return !strcmp(dev_name(&ib_dev->dev), cookie);
-- 
2.54.0

