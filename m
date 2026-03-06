Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AF4392C5C
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772801362; cv=none; b=HZebSetOJUNtnOtWxSDkFbOoc/GqD4w1sStLrsuoSh8CvfSCE+NLE85oe+NhMcs3GTvreHa4u+8685c8GATuB5w1XGdN8f3Xt3CHswaodauItydGXrWBsF9YKA9Gw8Rc8em2uDThiMUbREDHJ7BtbMtAYVEEve7X8e7b1i2JgG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772801362; c=relaxed/simple;
	bh=KKJoiskobJLPVewH28+LF9Y4Ux/Lu7qzp3YYxz5tn6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QgsUy6jNNF0GXpTL2dtsBAZHcAy146FCLT42goghvdahWHgmkhuL94z9subRXJkGRidYlsT85WlWBoxI+H+8JfT/aYxz517yI2ZjXpe2w4g9+anYvF0xwcbZfHQOivQKHtARoQMcamj6NNPhes8KiDAjQLvjw5FF9+pQUMOf/hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiBLVXcS; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiBLVXcS"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c738d1fa6f1so1051877a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 04:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772801360; x=1773406160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=URwHQdDNBcfpjPgIZZmBOCF4w8QPrTIvO91J8esIlCE=;
        b=YiBLVXcSTIHj8ILpc+aaeq5OtipuOIIV15UYYThMLCMSF2XadjAiyQ4GteUBdwgMEz
         tCuwl34h4PZ1iM0MI/+9uhWaiZ/yc040U4O55X52PU+9/kXNJ8G89PbhxySSktWqiktH
         mqdqKaXe0mQ38g2RjjcOGO6Lr4pPExw9D/wdyMvyeLhagG/AQrL2WAqvvXqZGTkmdReL
         Jm3eMpeYJMhROqyv/OTyB6Qkt+UvaJodh4uh6rUT4bQ9JNdtwL04mWsf4faR+ONpmUK0
         kIPT9ygP8jRVKZ2mxdFws5ETDRkPrZMARRvb4dDw5xGO3SrvAyfny39fvNWn2JSFDUOu
         4aRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772801360; x=1773406160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URwHQdDNBcfpjPgIZZmBOCF4w8QPrTIvO91J8esIlCE=;
        b=lNn4QZHkEHwPt/+q2t0mRADSOhIFWZxBOwuWVI7NvjEAmtLFLUurO6PER1JCqwVe3B
         JZxKCt8MFuc0cP9b3cZkLe//p7U0ZfKO1j4aPgPSrbtM8KwxwSS8Hmsqz/+IX1lQv/od
         opmRIGGsQk59+Tfwr3ianDeX7hGHswf3RnpOvGniToi4Ixo9UPgaL5SnM5Beoop259d1
         u3TExku8Les6xs6GWQIEFMbzqofXFkScVNWkPgWb63ZbmaKdIYDOCPAlk5wwSotyBPfW
         Y3KZYyzJe2JuckPIbzhxVq+O5qEHbjRo8w8fUUpYfT+kVB3B+PIW5ffPQoEXv4kOkEsh
         TS3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlv29kXQ2/Uj3emqyq7XhB7XOmc06m02isRmnLQwakqTyAc7vcQ12U3EtG7rLzOpswXY/b6EOzLD0KYjkcipA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn4ysDhiFX3S3efIqXjrRshR9Lql/uor+9XUI9FbGClAqMcr4Y
	e0bD85I/RkgekEPZLcTGdeYdaY5y6A56l1ARfkONsXF08qYuw+7zXoRo
X-Gm-Gg: ATEYQzwXrG2nWcNYVGPwr9TprSn+aWziZbBp6eCpEgcnJvYppJYlUe5r9uoJWXKZSDT
	/4NVdsWYfHRdr3EHVE+65fKxchOtSgS0SKgJ0FR/kVl3p7frP0ZUY0RwwsWgKztSA8UvGBDzkU4
	VVRtV29/aZqWXsyYQUW1Nf0W+Y3tSaLaHu/4AJBgzrBLtmcZcvj8s2AEBT0encyy3gl70TPKenW
	Nf+7qOSeo8JMgd02rRaL8hthEnV/Vq8dFVs18Ug0KMGSrCooTUQX8fh9TkAeG8lSfc6Ow8tqb1M
	Mj5esdMqccWe5E7TTBItCcYkac2fowprkwm45IHi6W7lCE/0KZX7mXLtWqEcfZGZxjhN4j88eQt
	Rvfcj5UT4LXIula87b/u4B+adsIFBeKtlPCqnINclewr68YFNvw2CB+vHMR8jbgxDiQmH1E9VzA
	Zhb31XkDL1C9grUJSWq42agR+g86iE3e8AlwBhir37tQUFr6WhrucVMq/Cy4+24zaW3vRlo1Q3U
	pc=
X-Received: by 2002:a17:902:f78f:b0:2ae:6829:d550 with SMTP id d9443c01a7336-2ae8246596amr19671075ad.23.1772801360439;
        Fri, 06 Mar 2026 04:49:20 -0800 (PST)
Received: from mi-HP-ProDesk-680-G6-PCI-Microtower-PC.mioffice.cn ([43.224.245.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e78f77sm27712845ad.21.2026.03.06.04.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:49:20 -0800 (PST)
From: zhidao su <soolaugust@gmail.com>
X-Google-Original-From: zhidao su <suzhidao@xiaomi.com>
To: tj@kernel.org,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	linux-kselftest@vger.kernel.org,
	Su Zhidao <suzhidao@xiaomi.com>
Subject: [PATCH 5/5] sched_ext: Document scx_bypass_depth migration path
Date: Fri,  6 Mar 2026 20:49:01 +0800
Message-ID: <20260306124901.2653465-5-suzhidao@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Su Zhidao <suzhidao@xiaomi.com>

scx_bypass_depth is a global counter that will be moved into
struct scx_sched when multi-scheduler support lands. Add a comment
explaining why READ_ONCE/WRITE_ONCE are used despite bypass_lock
serialization: modifications are serialized by the lock, but the
value can be observed locklessly from softirq context (e.g., in
scx_bypass_lb_timerfn()).

Signed-off-by: Su Zhidao <suzhidao@xiaomi.com>
---
 kernel/sched/ext.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index c269e489902c..b1e5a95682c1 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -33,6 +33,12 @@ static DEFINE_MUTEX(scx_enable_mutex);
 DEFINE_STATIC_KEY_FALSE(__scx_enabled);
 DEFINE_STATIC_PERCPU_RWSEM(scx_fork_rwsem);
 static atomic_t scx_enable_state_var = ATOMIC_INIT(SCX_DISABLED);
+/*
+ * Counts the number of active bypass requests. Protected by bypass_lock
+ * inside scx_bypass(), but read locklessly (e.g., from
+ * scx_bypass_lb_timerfn() in softirq context) using READ_ONCE(). Will
+ * be moved into struct scx_sched when multi-scheduler support lands.
+ */
 static int scx_bypass_depth;
 static cpumask_var_t scx_bypass_lb_donee_cpumask;
 static cpumask_var_t scx_bypass_lb_resched_cpumask;
-- 
2.43.0

