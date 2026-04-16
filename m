Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CED433DEF9
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 18:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776365718; cv=none; b=fh4pkTmhwMk1wWQXNM/Lo87IwH0ZNtWiakhVux8M3blZo+ZIfmAhRNKKNqd1WLDc4wPUWF8iOmAJjWx0VEQJDaDIpXlOvhVqVtq9v++8z12z1Pztz7YTcDJPRMCuSXCvPD4BZag5zQhF/xjNWK0QBBk1X7n35eGFPzlL78K/oD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776365718; c=relaxed/simple;
	bh=MoPwoKNMJXoJl7pQQMFCQ7qn+Gq+6mglDf/4ddqb7wU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mO2mknR5MSBB3Ax652EK8xu+eX6P2eItTN6Ecb3LvxRclL1SpP3LzmrbCDMR324XSwW6N9NNSSfZ0pzCZccEG3mnrcvD2tqAkP7+IrG8IdzZq5WQHiMuOwhXMNcQDj6nJNTcP/pv/s5EfHqtx7NSp/21xsxLnfhxCohdwihswuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKw1n2ic; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKw1n2ic"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82cd70febc7so5676308b3a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 11:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776365716; x=1776970516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=krdyOM9ukFLYYn2YIwb972SKISC7V1uF7ZqrEut126w=;
        b=JKw1n2ic3dAL93rH1J9U9mcaoY7HC8S2PvRcRt0A/5mJrdyaMeovQQkkByixV+XDID
         v7ssfJU9fY2Y4O68O1fcxUuC0M6OSnZOfmT8O+Z/wvYOZohnp4s7KMEoU+wRyVKD5BH3
         wezdoEHVlNFH5oV27dnb83kCxnUopRN4IFjyNoyP41/VebAr/otMEDbRHbpU7rbjOYpF
         jdqNestNivIwwV3+4Rce7va0KXX7aIj/bkhyQ2IrUoq1BRl9tyz+68gKttstm4OEUsoh
         zeFjzQH/M0bTsku701KQjbD4EeyHX2gheidHdhnmghahnhkfrYz1op/OjMBSHS04uKK0
         M38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776365716; x=1776970516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krdyOM9ukFLYYn2YIwb972SKISC7V1uF7ZqrEut126w=;
        b=kkXEHGzZi7edoP86NaQ0naPPoR7dstytRSJWUzqkU1zs2mcmADkJTraYxsAnp0f6CF
         s8Pf0UZh/Pnwawl+L1FHLTTgn0BAGbW3AtXiHb+abC5m/hkDUgdHv2XAGQ8342/plwp0
         l7q/WFRhWXeZSnhP5lPECdPzqwBfosR05sS90P0uXIeRXsAUGKUmfRZGty60pTCngE5b
         mqi/OyKw6rXFEa9tAy7Aq4MnJ7KH06Uxcx5BZjtmJbBdIj8xdd+oopQ8+W6vE/b3l/dI
         9qIURA6UA/GNWRl1cBf5JTMS985NftwNoIt9T136lG8yM6xUs7RznjI5kOu7TvE6Vw0R
         cm2w==
X-Forwarded-Encrypted: i=1; AFNElJ8w/20LhXbwFJSYX+TZxb3Unz8UHs5VZVSarOne2soXyMxEZfpj304SF9nFo9sqDigGbEQUOqEUGifSCtEi8vQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL9UyC+VFIKShvpMven4AFYmDBp9h6G0FKqn1gE99YkOgr2qSk
	0yQuL8XC5nHTQ7b+R7J9QvqVL3ewV1EYgcmmaXHHfBdCp+Kwnal41Zo3
X-Gm-Gg: AeBDiesIgo4jTgBBeSjuW0GoOX2IbkeDD+mH2u6rvt/5lQN4m4W8wcwdu9ID9fr+Z9m
	utsnoJTD36YWbhEoxiUxuQpjfENF4aZrok5Eo6O1ZpO+aRs1xI9qmYapD4UDlkfAplmvrkb6Ccm
	AwC6d4+/J/oCsUR6un0uQabi13i+2imgycTgDXr2BryDKAhqc3a5vTvZBvqwLH2cT8efiydjpq5
	FXzQ+uh82qizxQ76x1AetJqbAJPR3vSwZJnGKUCltt8YSWjaMGhEG8SjY3S/TcMXC7/2kP2PPvb
	sIeErMcce7ndXnBWLMfTvg1t+0sCL/AZr6yIwgHhEWLCMxY3dXwzdtjBRKSOGS67KAmoAHdgQ9k
	hM5owk1jLmSOcu3yO0C+h44Mud01L/l5J9fWL3twyi1icQugbKf+CplTpc1QStNEjxAWjtUUHlT
	93wIRkV4rWfJ4IDqY2kt0krFgLrggUWvMX9Df1DFyrEo+Mn7ulUUugdgFXuYfaY9n0Q2byFMh9i
	xjovZbSHFa+JlaSdcNTJm0=
X-Received: by 2002:a05:6a00:3692:b0:82f:1b42:11d0 with SMTP id d2e1a72fcca58-82f88807affmr591113b3a.15.1776365716365;
        Thu, 16 Apr 2026 11:55:16 -0700 (PDT)
Received: from SLSGDTSWING002.tail0ac356.ts.net ([129.126.109.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6744b350sm5668181b3a.54.2026.04.16.11.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 11:55:15 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: jhs@mojatatu.com,
	vinicius.gomes@intel.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org
Cc: horms@kernel.org,
	vladimir.oltean@nxp.com,
	xmei5@asu.edu,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH net v4 0/2] net/sched: taprio: fix NULL pointer dereference in class dump
Date: Fri, 17 Apr 2026 02:55:00 +0800
Message-ID: <20260416185501.647884-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a NULL pointer dereference in taprio_dump_class() reachable by an
unprivileged local user on kernels with unprivileged user namespaces
enabled and CONFIG_NET_SCH_TAPRIO=y. The bug allows a local DoS via a
crafted sequence of taprio child-qdisc graft, delete, and class dump.

Patch 1/2 is the fix: replace NULL entries in q->qdiscs[] with the
global &noop_qdisc singleton so that control-plane dump paths, as well
as the existing NULL guards in the data-plane enqueue/dequeue paths,
cannot deref a NULL child qdisc.

Patch 2/2 is a tdc regression test that drives the graft + delete +
class-dump sequence on a multi-queue netdevsim device. It panics the
vulnerable kernel and passes on the fixed one.

v4:
  add selftests/tc-testing regression test (patch 2/2) (Jamal).
  add Assisted-by tag.
v3: https://lore.kernel.org/netdev/20260414104311.74115-2-bestswngs@gmail.com/
    fix broken patch
v2: https://lore.kernel.org/netdev/20260410153902.955227-2-bestswngs@gmail.com/
    also update NULL guards in taprio_enqueue() and
    taprio_dequeue_from_txq() to avoid qlen/backlog inflation (Paolo).
v1: https://lore.kernel.org/netdev/20260330102904.2677818-5-bestswngs@gmail.com/

Weiming Shi (2):
  net/sched: taprio: fix NULL pointer dereference in class dump
  selftests/tc-testing: add taprio test for class dump after child
    delete

 net/sched/sch_taprio.c                        | 11 +++++---
 .../tc-testing/tc-tests/qdiscs/taprio.json    | 26 +++++++++++++++++++
 2 files changed, 33 insertions(+), 4 deletions(-)

-- 
2.43.0

