Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E3542589F
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 13:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784208226; cv=none; b=JYM+JahHsFVGqQ9Jga1wpRkV7jEh8fTsmycGhWtKCVDMd0nPUErJKnDfeBYP+ME49Roy3VVkMCRA7VvRNLIXW+0FWCDRVWpxr0cpj/EVHiRnRsPbJ9V0d2cyvqJKuJtXnQdEBSIZQZRTDWI3WEfXIm2tmsDXdM81Rz2fCxZUdaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784208226; c=relaxed/simple;
	bh=pdMmpZJCv+StAJxQjGBnq4nulDEDCbuKp7xLyLbTHHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZH4/v6XUEQaOSUVNhoehDlgtannTalvlMUeix+3iJlL8ZzYjlMGHUndzQKMmBaQ019C67kxcf5VZrHPwgMcOjWuiw+LBMN7/vOG6xARc95WwKXlK8mnSwVE1bWXj1PtM6xTFGJ3snfeI+VjgK//geXJFjnwH/sM2WnRiI0dLvI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=Xd4sPgdG; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="Xd4sPgdG"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47de008b020so388853f8f.1
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 06:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784208223; x=1784813023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfMuLF2nfHbgRgmO34SL3Jj6SviYlx2uzsjm64OYl7Y=;
        b=Xd4sPgdGg6OzjN4YUnTbRDwN59GeQ52siqSP5qyS3L40sUwMWUEj6rtmn//dzLtISB
         jDhOzNMjXJWY0UzUw7c5kj2+G8b0sk9+Wz3KCPdkhVqmgmc59ZfX1YJ21AfQAvOAYGAk
         DBR/s6goyDzYVHdhg1qREYw8Gl4UHgLE+3hoPoU317CrjaMxVSN587eLctoSfjZpNMdd
         GeH/3ie21YQ6ZH0FWB7DJGajs8V5BbfIapAVco1MwXYjU/Y7Iijy7HvDG4s1GSl3E8en
         Wx8yRZ+fPVN2Gb0aVlnXJG7U4QGkA/jQSljGNom4fvLgdiVyXJSYOdxK/nV56K0xVi8J
         oQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784208223; x=1784813023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfMuLF2nfHbgRgmO34SL3Jj6SviYlx2uzsjm64OYl7Y=;
        b=iR4tqbQ5ifaT+3Gv2Bx3WCoHZE7661okj+4PlwiZ0fq5QlqmrefuZ2n75kv1g1YxMu
         HlIRgKaVnpVUExGpDBgbLXS8uspP6nfYwDoa1QGel2vBrcYfTG+gVzpfgbWrTIwG7gLO
         /jzy49tnbjyeQEUREyjQmD19F+qoRaxjOW79DT3VdpknrwFiNj4oaZl7VygUL99cZULD
         7MaoCzaVdaDWX7A8D0xcvvSqbT4qAf4kQDNd2aZhLFzd6SnL45ntltBJK5MTfo6c5zoY
         +3nGztLvfRpqxzGcdqVFlsCf56GReCch+WQXaVRyohIkgTThVDt0BsC4xNzEU0fiPRDP
         G3LA==
X-Forwarded-Encrypted: i=1; AHgh+RrRN89+U78e5O2jutv2uQ601GcqxFzLjhLIHPyettBdgV26FutqNVqciEtJavS/45P3o5GDxO/rVGLPWlkuLOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlPsjju2JxWhP1ayaZYYnvN3poUhiAW1YuuIR8b9k6VSIX4V+X
	9q1bThTjG4hVSAofUbKqx9+/8PoW239LFf9lz/r642HrpsLoNPV38PUC7HUigxgApUA=
X-Gm-Gg: AfdE7ck5XV1fOl46QgoZowu7cWvF1fIXasDfwfgs9aAQxvsjGyxmv8N2W7ItKsyZhwK
	JCl3mbKpODSCtJTBsWyK4LcG2WQUJ1U7N3SunFwzmnx5oQ5FQfwTUwvVSnGhLzd74u/77CTAB4k
	DNCzVvAEfcp9GIW+o4B7nyF8BhmvjBK72s5EPChZMppBjNSwntjV5jLcpETeU8VG2tETvX/gyAV
	s32lVfWAuMSwpk4O88pOvRgmPH+/VpdODvjlLFw+qGE3/z1YFghfquU8LSXBKeJvLwfxzs3VdF2
	A6AaDMnPwhFzg9L8rqj8Ux8hc+dV3k7rcSXYBEj+ikp7D4WAycErFWAJTD9F9OYCITefOT14SzC
	0Ob7cUc7R3uYuPOdxnYlRx0EDizJP0PCMHfkuCCrDcFilU1JUOBqZeca7NvprLJ/ydhOoehXbwx
	l/IT6Vhf8Lfhpcxm3CEdj7fQ==
X-Received: by 2002:a05:6000:26ce:b0:475:f0c2:75ad with SMTP id ffacd0b85a97d-47f5a538607mr3085824f8f.24.1784208223044;
        Thu, 16 Jul 2026 06:23:43 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634e029sm24529624f8f.3.2026.07.16.06.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 06:23:42 -0700 (PDT)
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
Subject: [PATCH rdma-next v3 06/14] net/smc: Look up the pnetid ib device within the net namespace
Date: Thu, 16 Jul 2026 15:23:07 +0200
Message-ID: <20260716132316.1495242-7-jiri@resnulli.us>
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

