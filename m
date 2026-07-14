Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D253047D95E
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 14:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784039377; cv=none; b=a9b8VqZyv+novcxZYDMyzXY2nCw1vE8jLPSTVYrwElC/7ITFYcKl63Rct46WA7wb+OoVK1IswpW5KoC+qDbFbqslQODeSkaWIVS4hzuITrGE8paQJkUMitdo0ft6nzT/fM56EQijHJYdD4qFXGDpMvCz+3At4SmQzIXruQX5VgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784039377; c=relaxed/simple;
	bh=HV4KXx3jCDo5tnyS2SR083CFGU4A98rHzoR25fN+NeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u5ZXO3PfOM068/SW9XWXK02dGMW7rBzjaXr1uFWbDb0x/svvTkVo60W3PneGlMMovLD7kCM8LvDZvDw7G0GRwaoQhUmvG+iGMxI3NIcPXNEX7ZvtZYvWHI8fvhws0hXyNcMZmayyIxH07O1jPtwgcqFqk7eYguarx/25KJPSgCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=fHw8f9x8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="fHw8f9x8"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so7451085e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 07:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784039371; x=1784644171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvrKYD5ArwJczv3P3+Ce5/GBU6hZFow7WIOmjK2Noeg=;
        b=fHw8f9x8RZOOPQd8Mm2kUYt4NWzctTLq5X2G/diUH3e100eOXh2xfWHZC3lMNsx2Xl
         FbHBTlfuqaVpv2pAX5O0iXv/ivF0qRh6D4/xBC1qfrSPafw2ykft9iy4nAitxLt9VFn2
         +VcUlbWF/2sg7v3RViTMXZMVlHDYt0BdhY7bFIYOrVcGv3JUF5qFn524qP9RJm92lZ2q
         oTeXvc80c5HvgK7A4q4tlRkcAcxcwuejvsEgKMP1HufBI3gnJvqcg0gKx2SggDVQ74FE
         m4Zux397TbjkfELO+lLOP91U2j2ysQ1gdg6q/QFv7IYn9N9ps20LShRH8GY5it15bbgR
         ksig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784039371; x=1784644171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvrKYD5ArwJczv3P3+Ce5/GBU6hZFow7WIOmjK2Noeg=;
        b=VvyFV1BL4tO36oFJbP/wc4reGC2AIMSj3PSQPXNUBsJBOS5wmKMTUR3orC+fLS5iD+
         3DNUKNUd3T6UDtTapbG2AL6PyExg60mMUD1Qeucy8/ip0b+Xx++rIrO4pGuv5XHd/mfq
         RvKMlVeZQaoJ/zeqbbPB5gCwiEISYx3j2vn/3Z6rJ3Hd/NJg3v+YQbCN1QcIlxOOw4Xy
         holplLj5KH+/uNGrcnB2mlAzKfkRlwb3Ea8xd27lGhR4ZtwtTsAIvvZDLn6h5AIC+sPO
         rWjKNNZBj/2sX4rUEwOUWQt6MyUuwdd/NHE/wJl44YEZ731Ymp4v77Zfm+j7yMCQqZ/h
         SWVA==
X-Forwarded-Encrypted: i=1; AHgh+Rr6KGamyZiNTiRg7RcyqXaqOjB/KjQBRRgMr2YHhoL0qtbKu5AOf7vGdnIUA+nAmGTg+jbJl6QPfcIGyRZLmX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCyiwLSeNH0xXzBCeYy30vF4HoQ2ZDsi92djlJWAqxtM/05CXG
	zPhTIgEobpEcHcDaCi6n6npA5SZ5Yds3y4CAxIchAuUpTwhNQXN0tC49V8XRx37JCO8=
X-Gm-Gg: AfdE7ck5M3muBQkUvgL4rYbcSaG25OZfafTldXwVFE2Q1KiLNIXAv4kLlZZs44SRc+w
	XXoGc+/REnAzD1OJqXNTQH7TtcK6h5/+8eHrOrorL0nabMKsKGRgpjIirVj/vUHa+SeObSzqTxw
	7ixhvfBadjwyR/u1VQyVCUluO4HbZbbWy24NhjJb1a/zV+O+lIKptoi6Zfhfs2VsDAsMEu3RZZn
	hkOWBTC+RvHYppYf7ICFUINOQFnVtLwMf+h1B8QmxKRLDoX3ZPt9ZPHq0FY2Af+1++cyaIzBBE6
	orpwU1Q4rTcg5prIeJAn3/6SR7epgoiFkjAOmFYoxbUAsWxGIn4HgW37tTMmbTh3wkfRo58cZHB
	DAkNK1aRFE78F6WJjexTMklC5cHcbvita+h5e1Cd5cZm1Qi8rsbSVFiUs6+fVCAVjjsnoEQRaHr
	3FBznKWek2N2DtcVdqKvr9SA==
X-Received: by 2002:a05:600c:8108:b0:495:39a9:f8bb with SMTP id 5b1f17b1804b1-49539a9f8cbmr17623035e9.27.1784039370894;
        Tue, 14 Jul 2026 07:29:30 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49506a1fbcesm81645145e9.0.2026.07.14.07.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:29:30 -0700 (PDT)
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
Subject: [PATCH rdma-next v2 00/14] RDMA: Make device names unique per net namespace
Date: Tue, 14 Jul 2026 16:29:13 +0200
Message-ID: <20260714142927.1298897-1-jiri@resnulli.us>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

RDMA device names are unique system-wide today:
__ib_device_get_by_name() checks a requested name against every
registered device regardless of the network namespace it lives in.
A device in one network namespace therefore cannot use a name already
taken in another, even in exclusive netns mode (netns_mode=0) where
the two are otherwise isolated. Net devices have no such restriction -
their names only need to be unique within a network namespace.

This series makes RDMA device names unique per network namespace,
matching net device semantics, and adapts the users that assumed
system-wide unique names.

Scoping reuses the existing rdma_dev_access_netns() predicate, so
behavior only changes in exclusive mode:
  - shared mode (default): names stay unique system-wide, no change;
  - exclusive mode: names only need to be unique within a namespace;
  - CONFIG_NET_NS=n: everything is init_net, names stay system-wide
    unique.

There are two users that cannot be made per-namespace and are
documented as known limitations instead of changed:
  - the rdma_cm configfs tree: configfs has no network namespace
    support, so it cannot represent two same-named devices;
  - SELinux ibendport labelling: endports are labelled by (device
    name, port) from a global policy; distinguishing same-named
    devices would need net namespace support in the SELinux policy
    language and tooling.

Tested with the new rxe_netns_names kselftest added in the last patch.

Jiri Pirko (14):
  RDMA/core: Pass the net namespace to the device name lookups
  RDMA/core: Handle device name conflicts when changing net namespace
  RDMA/core: Support renaming a device when changing its net namespace
  RDMA/nldev: Report net namespace move errors through extack
  RDMA/nldev: Allow setting the device name while changing net namespace
  net/smc: Look up the pnetid ib device within the net namespace
  RDMA/srp: Make the SRP sysfs class net namespace aware
  RDMA/cgroup: Disambiguate devices across net namespaces
  RDMA/cma: Document that CM configfs cannot be net namespace scoped
  RDMA/core: Document the SELinux ibendport net namespace limitation
  RDMA/core: Make device names unique per net namespace
  RDMA/rxe: Allow queue VMAs to outlive ucontexts
  RDMA/rxe: Implement disassociate_ucontext callback
  RDMA/selftests: Add rxe_netns_names test

 Documentation/ABI/testing/configfs-rdma_cm    |   4 +
 Documentation/admin-guide/cgroup-v1/rdma.rst  |   8 +
 Documentation/admin-guide/cgroup-v2.rst       |  15 +-
 drivers/infiniband/core/cgroup.c              |   1 +
 drivers/infiniband/core/cma_configfs.c        |   4 +
 drivers/infiniband/core/core_priv.h           |   3 +-
 drivers/infiniband/core/device.c              | 245 ++++++++++++---
 drivers/infiniband/core/nldev.c               |  26 +-
 drivers/infiniband/core/security.c            |   6 +
 drivers/infiniband/sw/rxe/rxe_mmap.c          |  35 +--
 drivers/infiniband/sw/rxe/rxe_verbs.c         |   5 +
 drivers/infiniband/ulp/srp/ib_srp.c           |  16 +-
 include/linux/cgroup_rdma.h                   |   1 +
 include/uapi/rdma/rdma_netlink.h              |   5 +-
 kernel/cgroup/rdma.c                          |  71 ++++-
 net/smc/smc_pnet.c                            |  20 +-
 tools/testing/selftests/rdma/Makefile         |   3 +-
 tools/testing/selftests/rdma/config           |   2 +
 .../testing/selftests/rdma/rxe_netns_names.sh | 282 ++++++++++++++++++
 19 files changed, 653 insertions(+), 99 deletions(-)
 create mode 100755 tools/testing/selftests/rdma/rxe_netns_names.sh

-- 
2.54.0

