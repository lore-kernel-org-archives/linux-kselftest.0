Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06AD403B07
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 09:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590959; cv=none; b=kFs+i3t1dSKVosx04IHts8T0tRmXMy/E51aIVTIifRod8gy8tehgsVrtLEAXeu6qQulGigLBWb+PYoF9wa0OR0Ga6CM5Yuqud5+Ow39/ZUZLMSe6z2Xh4V03vIvMaA/ztBlr9nwkdWIUzdIoKZv3w7OOpq9e6EWr+8hwssRGU1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590959; c=relaxed/simple;
	bh=pdMmpZJCv+StAJxQjGBnq4nulDEDCbuKp7xLyLbTHHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iTqIvjma5CNz3zYnfju3gkJw6xgio2ytqE85X6+BRnhywnSOAkSvy5gzYJk9KUhNw9JCUtbHy/SiaykphdMgmQumhQ2Z2sjiyn2eSmJgDR0OuqHG/uxxbqplaPQdRjoLlCA45oHq2pRxK/FPqk/zkqBnKWc66KS/7+0EMGEA2wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=N54syBis; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="N54syBis"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47d70879764so1162033f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 02:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1783590955; x=1784195755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfMuLF2nfHbgRgmO34SL3Jj6SviYlx2uzsjm64OYl7Y=;
        b=N54syBiswM9Yk8e2fpr9lVVBcEETybUF1tI5udYUpv4oHGx0pm3G3j9HCZ0uWX4EAM
         zY719SAoQ3LW8R/m2rwbA4CFuMt2dcW0dmkpd9T7mJTKi+a7bjKgQrdi/Isj/Rxofy3R
         DrcnkJAw8aLRzMMqVe4q+I07EuqfeHV4RThu/3+rQoUCzpLdwTDG0Y0c4v6dWTQqdhr3
         qJ1JlzrGKOoBwqssop5hmxZplWSMNUv3d+kgOIHp4DJC6pax29POn/xpxZcIDhYZzGQ6
         ONEAmkPd3b5JHV9gnmkB1e/Z8Iu7QIUY2jEeV3TUODc8BVSFY6vFrH2XVJlKDn3AbZyZ
         KtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590955; x=1784195755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfMuLF2nfHbgRgmO34SL3Jj6SviYlx2uzsjm64OYl7Y=;
        b=HYAhHhbrsQ2vfLYIKyA0+lmKhwNovH0fh+Pc5VEnbv8xREOyC7DM0WzXv2HQBvqNfA
         clsdgMSPXrM7ENq7nZ/geXNO7Z5TZkuXmAnfHe3uMODh2jdGcplV09syXDTWv3MX07Fo
         wD47Ak9kRiXuEtsluGCoNTJznSNftyd1GMVr9IMDXl2znZnh2MJROliwtu+WOBlVP6L6
         BUz3ib+7D8Zi+VFUSIN9wUg8ONI7ZJNxj9cSa4bFcdHKvwK4KzW2smPmFd3nWMVAbe9n
         4eCX2Iwx1bNJnygUD0j/TaVI/3wi5owpeRZMOtHsxP+Rry69q6nrncO5MoqF06blGEP1
         K5Lw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/hmEldeze93/w+f3fZlxtNrNfcMiyb7KQLp/mHJexEPXPvd083iyUBVeByMvkHqmx0DI1cNpSN7zIFWQY92I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOz3+ffhwy7Lk3IBDYLrP0YQwyOa17nrX9lOSsn5QVPQAISFds
	kIz33Xf3x9uGFLik8HRj4Ml7kvMY2zcaGjzTdfOFnUhLxXnGLYz1ST55MjYVZ4E2x/c=
X-Gm-Gg: AfdE7ckJ/712D48BzfL2H3qpArQkiCQ6D+YhniINamv0qWs4tky4e+8Udb1+8VTw1pY
	Qx20Z3UsAHOmMpIUKmSQITJLuDCpf7ALxPdpb3MbBqi7ZZbG7+qKqiDQeuZEUjgARTryGJXfARI
	m3+3mxjLlrwPoertxmtWUPdF7+xinzgTZ+Uxx8SddNzMoCAtIrYZcbkRSNZTOCDTVm3be50UmSZ
	Yfbf/Ho8XuKleiZSkSrRU82I3rgIyMFLEAzAfVGDQelp4AGtinvgob4ahWqUMsCvk2aVAGWqavi
	9K4rOlwMZEeff0pRYYILrCnIXVQ5Qvguae8hLhpMh5l2evy0iAmNJ2p9zEsxiX9x8DiF3tJay9J
	/dBGVoYatQ8wLO5CFqo1+U3wMEty/OeioF0KPHCkxddQOoi64ReL/kMTQL/y/BJs0Z9x59Ab9hV
	dhV6KUvrLsH2oXiG6dAn6esA==
X-Received: by 2002:a05:600c:83c6:b0:493:b8cd:2555 with SMTP id 5b1f17b1804b1-493e690497emr64042885e9.3.1783590955326;
        Thu, 09 Jul 2026 02:55:55 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e6ccsm50293284f8f.5.2026.07.09.02.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:55:54 -0700 (PDT)
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
	wenjia@linux.ibm.com
Subject: [PATCH rdma-next 06/13] net/smc: Look up the pnetid ib device within the net namespace
Date: Thu,  9 Jul 2026 11:55:25 +0200
Message-ID: <20260709095532.855647-7-jiri@resnulli.us>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709095532.855647-1-jiri@resnulli.us>
References: <20260709095532.855647-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

Scope smc_pnet_find_ib() to the caller's net namespace so pnetid setup
cannot bind to a same-named RDMA device from another namespace once names
become per-netns.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 net/smc/smc_pnet.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/net/smc/smc_pnet.c b/net/smc/smc_pnet.c
index 63e286e2dfaa..ff9c9c35cc2f 100644
--- a/net/smc/smc_pnet.c
+++ b/net/smc/smc_pnet.c
@@ -304,13 +304,18 @@ static bool smc_pnetid_valid(const char *pnet_name, char *pnetid)
 	return true;
 }
 
-/* Find an infiniband device by a given name. The device might not exist. */
-static struct smc_ib_device *smc_pnet_find_ib(char *ib_name)
+/*
+ * Find an infiniband device by a given name, restricted to the devices
+ * accessible from @net. The device might not exist.
+ */
+static struct smc_ib_device *smc_pnet_find_ib(struct net *net, char *ib_name)
 {
 	struct smc_ib_device *ibdev;
 
 	mutex_lock(&smc_ib_devices.mutex);
 	list_for_each_entry(ibdev, &smc_ib_devices.list, list) {
+		if (!rdma_dev_access_netns(ibdev->ibdev, net))
+			continue;
 		if (!strncmp(ibdev->ibdev->name, ib_name,
 			     sizeof(ibdev->ibdev->name)) ||
 		    (ibdev->ibdev->dev.parent &&
@@ -408,8 +413,8 @@ static int smc_pnet_add_eth(struct smc_pnettable *pnettable, struct net *net,
 	return rc;
 }
 
-static int smc_pnet_add_ib(struct smc_pnettable *pnettable, char *ib_name,
-			   u8 ib_port, char *pnet_name)
+static int smc_pnet_add_ib(struct smc_pnettable *pnettable, struct net *net,
+			   char *ib_name, u8 ib_port, char *pnet_name)
 {
 	struct smc_pnetentry *tmp_pe, *new_pe;
 	struct smc_ib_device *ib_dev;
@@ -419,7 +424,7 @@ static int smc_pnet_add_ib(struct smc_pnettable *pnettable, char *ib_name,
 	bool new_ibdev;
 
 	/* try to apply the pnetid to active devices */
-	ib_dev = smc_pnet_find_ib(ib_name);
+	ib_dev = smc_pnet_find_ib(net, ib_name);
 	if (ib_dev) {
 		ibdev_applied = smc_pnet_apply_ib(ib_dev, ib_port, pnet_name);
 		if (ibdev_applied)
@@ -518,7 +523,7 @@ static int smc_pnet_enter(struct net *net, struct nlattr *tb[])
 			if (ibport < 1 || ibport > SMC_MAX_PORTS)
 				goto error;
 		}
-		rc = smc_pnet_add_ib(pnettable, string, ibport, pnet_name);
+		rc = smc_pnet_add_ib(pnettable, net, string, ibport, pnet_name);
 		if (!rc)
 			new_ibdev = true;
 		else if (rc != -EEXIST)
@@ -1170,6 +1175,9 @@ int smc_pnetid_by_table_ib(struct smc_ib_device *smcibdev, u8 ib_port)
 	struct smc_net *sn;
 	int rc = -ENOENT;
 
+	if (!rdma_dev_access_netns(smcibdev->ibdev, &init_net))
+		return -ENOENT;
+
 	/* get pnettable for init namespace */
 	sn = net_generic(&init_net, smc_net_id);
 	pnettable = &sn->pnettable;
-- 
2.54.0

