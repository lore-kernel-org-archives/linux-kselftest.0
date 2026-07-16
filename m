Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C299429028
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 13:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784208243; cv=none; b=MV24Wd2frWMnLwlTIefRveVA5WpBReoeSfdsDflI3v3QVCcGZSRCdYNl8AKAVJbUinnjHFPrEb6ECj6NpaLeokVSM/5bp/qOtHVreX2KnR0MgsnM3rHMUf/fk0JovEnGzrlAoUM9cdSxxFiKcimYAu4yM7QmXEHs2w0OklXWVRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784208243; c=relaxed/simple;
	bh=2JgBpAWc31ZSpkYiSaZDvjmnHKEA4A5V63g6j0fsopU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVDV2z5tqtfLCCfjvwj/oo9WZIRku7d78UqyAZ68PCdYkYdnU+VtVa62BbLR+I/TZ0mN8t4dFuviSq4uycC6oO5iBWaN7fJbgy2V9WyLV4yLDhIy41xPVW/Sv5IRrgTI5DazkF0a/RWsb7ES5dm1rW6VZ/aGJY05ikCKtRLFpfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=z3W7Q/Vp; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="z3W7Q/Vp"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493e497643fso16342845e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 06:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784208239; x=1784813039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jsn8I3x6C8T9FLWqok7MXQBFznxd0+GMkoGzBjmbnHQ=;
        b=z3W7Q/Vp0l1NU8deNMLBoNbWyYcuLSpHkGAkibaFWx+4p5jEFFZ1wg3/PeOwjquSrJ
         sG7/2NBJZ5Nb3jRXFFnRU9GOGQb3igJw5xW32mJkvID9oA/m5S2Nqb68z9FBTAgmeHXu
         C0LIrMOGkrRSBK8h0FKbm3uBJ7+UnaKSSidEnSMUbdDE7TYfwFQFfIHVssaQMAkuzHsx
         djL8B02CPgRwTlxHvbaAlVARHmjE+8X+af8JYFk1NOPbG0Psv9FNgDpinZEKCjP06S3/
         cN5efKRCLZyH+IDqW+lkn/BoBP6otHCF7S/lk4FepSBtK4mllHKdFLEOQfAQt5TgKepd
         9aIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784208239; x=1784813039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jsn8I3x6C8T9FLWqok7MXQBFznxd0+GMkoGzBjmbnHQ=;
        b=mlQaPmB5upzb6plaUM4VrffYqeRV23c/RYhJvlrLN4reB/+9tmetP0MXNZmV3iNYyY
         bVj/5KZAXy1vd81lIZCzXPos0TvJpvlQspHRLRdM5aavvV7CM+wacfgsvU0UVQs++ref
         6cSLy7BpAn15sv9PThyd8KwPEw0STwBsmdQ4J4ZmKv/C8M54Ut3Sxx08/xS5ZD/7IDMO
         kiWxiswupx9iJFqiKphmm7SOhKS5TfXkP0SC9CN7N5G2bjXmzO1zH6G04y27dCS0Edxw
         iu5jJMNqhanmhhvFKlfciSWCqoK7j4LTewLnpHWjGj7gOVefdyEoeY6Cxk3mI0Uk/tmD
         b9AQ==
X-Forwarded-Encrypted: i=1; AHgh+RrOaK9YNHMP9H68fJY+kxBH6i7Jp3l4TbYdnBTyBAZF2qnNDCI/aaqvWZ1AXSgy1lVsLlzA/SItG7tSHTXW6lQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhFkVx3xbBm781KlpVrfinnKAroZQFQfkl2ZO0aSGaAcqEqSrF
	1kQBJAMFfUvZnfus7UC7qcY77MN6Z/Mw8wP6T4/EAIDXPQ63bgGsI1kmnXXG2NUA2FM=
X-Gm-Gg: AfdE7cnE+D63Nb4MyZ6AQCZfbCs7/VE9Z0GUFlW9vNEoXHB2ZCCmDMeSMFsHNxCWeyh
	iK003Acs1TVCVefuvHSsNCgeHkln9v7oKO1OcI59gf9NxypebjAtLseQuk8HXW8bTrWoojOkp7d
	4Kf8uK1bEtT3KPI3+uyZtMOfvvpBkc14oJ3fzNBCVPujgOi/hd3J/r2h1s/zyliYVxU0KIDe6ls
	7lRaaCHHvi6Uczm6qIOv4YbrRh1CtyfkOvo/G7fjKwjMaWKBZcsJ2zg6EY/pLDLl960cD2pXjPg
	RlagIAWvATHhgYswAqoIADy86NEK69Rv63HJPvR5+3CmmXGW8nuKngIE8iy1BuPABG1c3tCqYbQ
	nRrW8MPN8UQZ8USL4NM6w6nqOBDNEJU9EoPT6YXPmrrZ6r78/LC1VkCmxQ1vm7ModBsxDpVDuQ0
	FwX+7Jm+bE7+Q=
X-Received: by 2002:a05:600c:6089:b0:493:b7cb:c5f with SMTP id 5b1f17b1804b1-493fa8afbb6mr218943975e9.11.1784208239547;
        Thu, 16 Jul 2026 06:23:59 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e8c47esm60892495e9.8.2026.07.16.06.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 06:23:59 -0700 (PDT)
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
Subject: [PATCH rdma-next v3 10/14] RDMA/core: Document the SELinux ibendport net namespace limitation
Date: Thu, 16 Jul 2026 15:23:11 +0200
Message-ID: <20260716132316.1495242-11-jiri@resnulli.us>
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

Document that SELinux ibendport labels use a global (device name, port)
key, so same-named RDMA devices in different net namespaces share a label.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 drivers/infiniband/core/security.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/infiniband/core/security.c b/drivers/infiniband/core/security.c
index 9af31d1d9d70..a82c46965416 100644
--- a/drivers/infiniband/core/security.c
+++ b/drivers/infiniband/core/security.c
@@ -700,6 +700,12 @@ int ib_mad_agent_security_setup(struct ib_mad_agent *agent,
 	if (qp_type != IB_QPT_SMI)
 		return 0;
 
+	/*
+	 * SELinux labels an endport by (device name, port) from a global
+	 * policy. If devices in different net namespaces share a name, they get
+	 * the same label; distinguishing them would need net namespace support
+	 * in the policy language and tooling.
+	 */
 	spin_lock(&mad_agent_list_lock);
 	ret = security_ib_endport_manage_subnet(agent->security,
 						dev_name(&agent->device->dev),
-- 
2.54.0

