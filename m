Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B85647DF8B
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 14:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784039413; cv=none; b=aB2BRGcdMDygMFaf+/I6TSVmaJkYEWf/uUmWyIRKxc1EMmbgQbu025JwcAvE4mfRcfHcjAuI3PX7Qx81+MDo+iBJOFKjpJw0f2VEW0VyBvTvAoriMk9/jyVEtsFRvJ0oQYM79sI+Pk23HSdI50ZHbqcP0eqRwayA5oA44ccUGlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784039413; c=relaxed/simple;
	bh=2JgBpAWc31ZSpkYiSaZDvjmnHKEA4A5V63g6j0fsopU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qltXtn1keSZnDH+a9eSizGZBW9oIIPcXj0xLPD5QDdrcNOxszHtvDL2RNPKJIyZaOvLC04IysD2t9c3YpZMWirL4VQvxI+9ljTNSh1fuvkGD96Sqkxmf8dzPvBxOPtlw4iXG5wF/MhdByUfMOBoGEai/q65bJSjKG+HfXk/xf+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=tIplLQKz; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="tIplLQKz"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4758bd3731bso814713f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 07:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784039409; x=1784644209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jsn8I3x6C8T9FLWqok7MXQBFznxd0+GMkoGzBjmbnHQ=;
        b=tIplLQKz7ETUgWcKFbHl0CWUrXenVkiXEyO3ng32niwGV71m/oIlqG0zutHaXUDmTn
         YXtlbK43Zle+QsSGZvahavbXjyKpupb2yhLdTwQbwyu+aE9aBLPKB3MzuH0tBTFbi0Fo
         w28wbfwUYeOoAbbs+DS1Ue++EkO7RQuVFmDxcSdN4t7lZTR1biPzQzSHco/so5vimC5y
         l0qcL1mvsChAugvRgeaMTPj6i43RpPrLaqRnILoJihFe1XIWbF0x3xz0Ge0wsW+I1E4d
         TGcE3lOQNqAJlhvSQ+hwOpokRo4GvE9inrTL/mcdyaB1TF1T59c/Ci8fOGj0LoYRID2V
         AgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784039409; x=1784644209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jsn8I3x6C8T9FLWqok7MXQBFznxd0+GMkoGzBjmbnHQ=;
        b=gkpYbXLPvRv6anbz8v3ZGCix7BV+C3zMe1l+vuVf9kX1RoQxfgEsAZHUg7olKZ+fyN
         9st9EgwojZIQLFkkWAWr2qkj7IcL9SdgpXxVhUHIEvWQ7DuSP8s17lghpA7x7NoTJNru
         2SJgbcUaIqiXgKdcCe54G1+fegid27MGa3Ic5XHkMMtctO3hSfNRzNopcElW0hFVxTno
         Az00D/llQsrxUoQ5F7K+AHnkrzjZzLM5BD+aWW6qZYozE/EZi/voxKpdUpbkJWF9anBK
         RDbkDuOb2SDWz9ytDoylErk8/xg5g7V0T97MHf0l6L1/rfYut+TQouRumFpMad/UvNId
         bjhQ==
X-Forwarded-Encrypted: i=1; AHgh+RoY2fIgJxiPe+BLYTD8ofR52HaVfJItsb+RGOOFOO4nqdTOr4gN9vtN5xQI0miTqke0Mu7/qexcQfwveHfr6EM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtuFzSd7f0o2MpXAWnquhfN1fk1gVXBux5FayE4bEcNvZwNwUZ
	XfKydHVqJyXT04MRa4q9u6skSfn6BvR7CxS7CMq+YpRhkpwJtCql3i0RmWub4fBN0NM=
X-Gm-Gg: AfdE7cm2qah8aaYCqBD/PnPHh1JWqjHo/YF9l6AXxmNOK9qg40UahlArrcDsFpiAzn2
	Ue+sOSuDrqT6EO5FNLwldVzoYf6BZ0B2K7Baw30Q+e/ny5SavsqBYT7yapKb3o40VHRdki8sgE2
	L00MWUftr5OPzcf/UXWpBv9j2jgO8JcJ+XfUQXTF+5frGROT/2jkbI5AN1MhWRcLRZ2LdckUlUw
	284r0SM32HDuOLPYiy/dCMEj0FSPVIessobOBYy0PqaYc0wR6O8nMGPL57Pls6R2IA6wDdk1HQ4
	dTIgdRXjqS/upORXvs4anqIEZmMn5zFypRruvjNyFgHDkgkv0UUJ6x1JzfLtCoxSpTRhXJHNYmc
	83W7Klz6raKQtN2qCcWOBoxbHgvL4MJxntl/h/IksFb3zFPTlg0RJTGrCgU2XmtXeqbL/jOkySr
	wQjbbD8lIT9HFLIvsAl1nGLA==
X-Received: by 2002:a05:6000:480b:b0:46f:1b89:999 with SMTP id ffacd0b85a97d-47ef69910b9mr23198373f8f.30.1784039409490;
        Tue, 14 Jul 2026 07:30:09 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635082csm9292456f8f.7.2026.07.14.07.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:30:08 -0700 (PDT)
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
Subject: [PATCH rdma-next v2 10/14] RDMA/core: Document the SELinux ibendport net namespace limitation
Date: Tue, 14 Jul 2026 16:29:23 +0200
Message-ID: <20260714142927.1298897-11-jiri@resnulli.us>
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

