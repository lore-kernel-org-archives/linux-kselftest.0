Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277CB424641
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 13:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784208208; cv=none; b=irE6tjYgYRRjxOzPT3sgS29THDa4XZWyIzW+JysSvPKFzpz1pBYqrLDR3J9wXoY4zO8QNWVuUXTffTkO2rNfMS7UQLt3SFLwx6XyLVJr0f4yaXKGhlcVTxJpLy+otf9pXEBTIeP1NuDjR9HsvlMs9vkPhSjIAcMlxJPhXtoMhzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784208208; c=relaxed/simple;
	bh=fj0Q6ihUmYqKUkY8KaHXFWF5Aioa8BtTYy9MtuieBMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAYYzPaVdKaVqEpfbSChwY6aGKSvCl1KWj4TfF114Y2CnpLZbwbctjGLNRWQK3MktveXI01PF2dFaUFyMIC2+24lazUbfAq0qjbyQiTaU7jSXaPiAarZGG/rsn9+/JHFPi95ZDzjMxWWs6V4Pd0w0HE+EZFv3YWUIfQjjG0aG+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=qox0pSLi; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="qox0pSLi"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c733f15aso58474515e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 06:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784208203; x=1784813003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q+RolV7SjzshTN5zqSzxTVIaSTGOodHrW0P7odUB/p4=;
        b=qox0pSLiefj3H3b5yXgGce7hMBs+nGwFP0fXP8ildlEPyWKU71V/Mc/7tx2RbhA+k0
         phHG0aca3QdBs7SYgG+hnJwQVpwpKX39JOPQpMtME1P6gikJBkk0v5PX5CZlwRz1WZsJ
         8iCVsVxGrqxkRJBp9caqDo1ON5i09Nws0QKBJNaH8PgPpF2hgkLHHGTI45Yu/yqnyQkD
         Mf22PCSNPxX8QTqLcud/saM45nIDPtMLogkkSNDbON9i4WaLfYpdh6p8K3xao0rASsE1
         jyt3mjXWyyRPovgPNYlD68FzrJJluk9vjuSiWT3d6O3RQPLuwZvlFCgAcW8WFC0ZQClO
         aavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784208203; x=1784813003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q+RolV7SjzshTN5zqSzxTVIaSTGOodHrW0P7odUB/p4=;
        b=Od2K5RZ2tM13AzKUHvlwrAEsUTcrNZvpjoK2D5ZQa/gPuoipNym7oamOB3cYdnvjs3
         9Zfzy1P/Y9Tv4ZvtWKzK0e6Er6ilgHpWyKKx6OKej0I0z7ABEen4E78QhZEvLc/l40hf
         Yign3yJpIfsLKwDwB9J2VmxO+YEQDKomVeG0nQs0jZVaoSQ600su57CTVwUBpJHlVYyG
         uUKBz7Twinocmja1ZpK+TUsYXNa11StYF8VTVOPV8T9dyAyNaIfeIlzrVDYkZV6+5dZD
         RGyiIyTRHBgFd5DQsKTVFhEU+adVFviCULdzXhUllSodtJYW4X+x57XspUDst/HKzlgN
         FTHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbWKkmIZzdZGItIRNYNwOQjXuPLyx20TndjubP1FJ3TNf5HCp5vTde6zXCs8hLBGF3h3CGEwfrTKMWv6nEJZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRugohSl4YQ9CibD0+hqXDsgRvWFH+m7QMaY26cxx3KiPmuiP8
	LPraX8gmNmL2rA2Py55mTNRw0awCOLIAJpCT1PEMTn3sRk/6ge3yl7u6E+5jICiJU+8=
X-Gm-Gg: AfdE7clpqmgSmfeP7wKeCAB+n3N8U2VjTrnUuRqRTRnu+WzETfvPA99M14/pDP5cPeZ
	dxIUb2HiyMJjjXvM+RNZiPiSLLv+Db8qbP8Oce8srZWs1o4mdbsfFbW/NKeOUw4MSugb5UFpV7d
	f+soSbcLn2s4hAXWjQHbVqXynXEOjHMwfYRwK/ncjfRRkZW+mFPWQRqSEeNWWidm+WmVF89bgAI
	pTook1u0m9UqGbDICMSzJddOUByObk3JIdsg3S05IJL1bolYapxzWNnKS+quiSY5ErIK1raOWiy
	ehU277kySK3AcyoVJ6sfrVS3pzfsiR84ETLz09DO/7T9MKT005QFbHizpagnKc988Z3ZdLDsSM6
	b588GAjgkEVlKT7HbR1nIhpTz+kdHaiTerPN57RQkaDc/A9ieTqlUrYe53fUjVr2lWuW0VRmZXa
	dNSv+5SqNHEC9GK9ZIObyd6w==
X-Received: by 2002:a05:600c:a00b:b0:493:f261:d295 with SMTP id 5b1f17b1804b1-4953f1552bfmr62260225e9.4.1784208203243;
        Thu, 16 Jul 2026 06:23:23 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541eb02b9sm55456605e9.11.2026.07.16.06.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 06:23:22 -0700 (PDT)
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
Subject: [PATCH rdma-next v3 01/14] RDMA/core: Pass the net namespace to the device name lookups
Date: Thu, 16 Jul 2026 15:23:02 +0200
Message-ID: <20260716132316.1495242-2-jiri@resnulli.us>
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

Prepare for per-netns RDMA device names by passing the target net
namespace through the name lookup and allocation helpers. Keep current
global uniqueness behaviour.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 drivers/infiniband/core/device.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/device.c
index b8193e077a74..de610f52c9b2 100644
--- a/drivers/infiniband/core/device.c
+++ b/drivers/infiniband/core/device.c
@@ -351,7 +351,8 @@ void ib_device_put(struct ib_device *device)
 }
 EXPORT_SYMBOL(ib_device_put);
 
-static struct ib_device *__ib_device_get_by_name(const char *name)
+static struct ib_device *__ib_device_get_by_name(const char *name,
+						 const struct net *net)
 {
 	struct ib_device *device;
 	unsigned long index;
@@ -395,7 +396,7 @@ int ib_device_rename(struct ib_device *ibdev, const char *name)
 		return 0;
 	}
 
-	if (__ib_device_get_by_name(name)) {
+	if (__ib_device_get_by_name(name, rdma_dev_net(ibdev))) {
 		up_write(&devices_rwsem);
 		return -EEXIST;
 	}
@@ -435,7 +436,8 @@ int ib_device_set_dim(struct ib_device *ibdev, u8 use_dim)
 	return 0;
 }
 
-static int alloc_name(struct ib_device *ibdev, const char *name)
+/* Pick a free index for the '%d' style @name pattern. */
+static int alloc_name_id(struct net *net, const char *name)
 {
 	struct ib_device *device;
 	unsigned long index;
@@ -462,15 +464,22 @@ static int alloc_name(struct ib_device *ibdev, const char *name)
 	}
 
 	rc = ida_alloc(&inuse, GFP_KERNEL);
-	if (rc < 0)
-		goto out;
-
-	rc = dev_set_name(&ibdev->dev, name, rc);
 out:
 	ida_destroy(&inuse);
 	return rc;
 }
 
+static int alloc_name(struct ib_device *ibdev, const char *name)
+{
+	int id;
+
+	id = alloc_name_id(rdma_dev_net(ibdev), name);
+	if (id < 0)
+		return id;
+
+	return dev_set_name(&ibdev->dev, name, id);
+}
+
 static void ib_device_release(struct device *device)
 {
 	struct ib_device *dev = container_of(device, struct ib_device, dev);
@@ -1223,7 +1232,8 @@ static int assign_name(struct ib_device *device, const char *name)
 	if (ret)
 		goto out;
 
-	if (__ib_device_get_by_name(dev_name(&device->dev))) {
+	if (__ib_device_get_by_name(dev_name(&device->dev),
+				    rdma_dev_net(device))) {
 		ret = -ENFILE;
 		goto out;
 	}
-- 
2.54.0

