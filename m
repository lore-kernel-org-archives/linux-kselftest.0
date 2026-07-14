Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DCB47DD59
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 14:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784039379; cv=none; b=VxXbbNW6Ur5RlX/26Tuqr3gs/pcE66HSQgamfXzb+Op3EDUbp8gCCAh/i1DP11WvhH29xnFZAlKx2bi6CbwnIkhjGP8SW3oGqmT/7BKhj+F5OfpKDshCb9SfG6GlQ+Grqs60oOvmmhCFTwEjoAuIKOYjX3sBJKYeC/mYVo7ZqvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784039379; c=relaxed/simple;
	bh=fj0Q6ihUmYqKUkY8KaHXFWF5Aioa8BtTYy9MtuieBMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qci1+vKSox3x9d+TTHMZqWyC+d1XIffv8+sgKQn7DvpgPe83QRMPuTisHOAgnVd8pE1Pq9K+vjPuW0RjfldqJ47p2FLWmd+iGUeiiUDgYK8cvbqTG+wfuIIc/tM2L53XO8Q8u2bbjY2/Tf46RO10V62MbKYmbZoyT9FkwvZJ6o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=Rw5eW6pp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="Rw5eW6pp"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47db714766aso616235f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 07:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784039375; x=1784644175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q+RolV7SjzshTN5zqSzxTVIaSTGOodHrW0P7odUB/p4=;
        b=Rw5eW6ppmDIrndA6q1mBhiSrnWhnU2hXHfxl2KFtVK1zkFOxQ43DK6GNmKOJP0oX5q
         r3vwazSVBJXfppL7Hoi94Ew9DpoaJut7vGKVwOYJ8an9S2GM0nQ7Oe3jGQcJVXuqWiua
         P9pqV36DnvKqa+LewDRIhJTP2Qfnov4Trpk3SgB/Znf3aIF8a7Jb+Fft3Etng1+OQBG8
         nlajd3Mu024JqN050emv6K2zEa6bKNEL0URvLDxBJSz9kSUx1T2f51I0X3H0sB40oVht
         z7O38q89XSmUmFTTh3hg/YndietSfsrcqhAaQtd3sKVGd6Yzniz2akLTlCOK6RLGw8lW
         /4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784039375; x=1784644175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q+RolV7SjzshTN5zqSzxTVIaSTGOodHrW0P7odUB/p4=;
        b=ePYXLc97aECR0O2yNhzGjz1posjdjNweBygXy4bh6Hga/rUyIiSTocuhphXkI1c9u9
         4JwrIh35asA5s3KFCBLjwFCtKpsCDUG9M5btYV3KRiXzr51gdtgHTDwZCJjhcBJNY+D+
         K9nU+6brpehuAcOpOxjCsPouA3GPSDjhvKrEAeQ6gIDJNvu4jc5eNJSxgYxQ1+2TzeRt
         xH+4gR+51lJPmzamvUV55cvs4u5AlcJDDHGZiJmpvMNS1LTX+0v8df1IuXKiGGZ8Z+cS
         ju0y4c7M7nTmpAZMc1GDvSSy7W/A8M9BVAPi3c75vwyuHZH0d+h8OHR8a5RveDZipFSt
         fwvA==
X-Forwarded-Encrypted: i=1; AHgh+RpfgH5EtrgYMT9ANxTGs7O1sm+MQhoWD7JMhI4yvdTASGZY4YiuZFb42xB9XOt7wBLhrQKfP/56vNzmCHvh1sM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6s0APprAQpN32tRiZWOdtEx/28FkBIfD7rrUvXwYMsZ37pOUR
	9wvjVqMkobldKhxRf8ZkDzt6YLJu4Vyy+Sfv65BvvjF8H4rzH8PuIV6BETXUElg0RXg=
X-Gm-Gg: AfdE7cmXvELETUNHuN/1H4QcypATVS4ajBJsdBzZKF0QJ02NoOyF55ZuCHghUybNKAW
	pJvMsfJi7PImD7JQ5j7jXUu4kkv9YLmUAbhwEuH1f9a2b+oLmM/kvZodZ+JIjnUyurfHKiqmu5B
	e3PWxskuntGitotcW9sUpZMcN/QSlZB7IcCGXU711J/telILKgPv8VKp8H6XpgR0a+wega8Art1
	RyKde5Am2xvfciAa1YqrepZbHHZCPdHT8fNIpqKCdOcKl+j5+LgNqH27FvwvKsMukXRMrL32Qpe
	CEAJve5CuTfT1/eU6znUlH2ROtiPC1/wYmOCjOdLz1sVnwGO/4Xkh9SAmqVu5VQL0udnJ9eEZ+J
	zpyJIHFgznLmeL5jEMsZZiLtweF20oY3BiuJTveZmqMyUsJjDG1vdiLd8xXNRUEGJ0BYXf5cIKG
	bao980xhvAkRl56wng4Z2skw==
X-Received: by 2002:a05:6000:1866:b0:478:7019:e5ef with SMTP id ffacd0b85a97d-47ef6986d21mr22449614f8f.21.1784039374656;
        Tue, 14 Jul 2026 07:29:34 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c9cc3sm8626412f8f.35.2026.07.14.07.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:29:34 -0700 (PDT)
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
Subject: [PATCH rdma-next v2 01/14] RDMA/core: Pass the net namespace to the device name lookups
Date: Tue, 14 Jul 2026 16:29:14 +0200
Message-ID: <20260714142927.1298897-2-jiri@resnulli.us>
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

