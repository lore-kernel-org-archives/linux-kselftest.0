Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFD03A874E
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 14:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805813; cv=none; b=mR7kLw5mmzWpb9nne9k6dW9dMMvKbmlD4WHV3/z32YWm4GGj49IgKMiaKJIBiGkGDVOthipQQVgbrpPik2D2/kWXDi1okQzguajUgoFcyeDmyWSNf5luc98etoJotnqRttj8GUUXUQUqEoZD5lvK1BDqH5VQryiTcJLVXf2JxPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805813; c=relaxed/simple;
	bh=yKSrxm0w7R7rf8DwTeSORUdpLC62zlDW3KpKzJo1uZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HofnAVdCSo3JXeuO28bOOBUda7xiQ/bSGXZZ03UvMoYjJmW+Y5IkyZKgnVt6Bn20L7vJPXgD1z1TZtRVtPjssypHlvkffdKoR6MclWGI/bmp2cvQv/AhugM0GSKcdwTiXZTxAnTZ57VaWsYF6LoNe13gnrlNCgbuLkd8gEawuE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQNQ4AAz; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQNQ4AAz"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ab39b111b9so43334885ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 06:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772805812; x=1773410612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=InKX+d5TOMIn4QLgyy6Fu4JN4MhM87tVHkjnRlVwYog=;
        b=eQNQ4AAzvn+Itz+x4WSH+3mNbJIl7yneMjQmoSNJPwW/gPyN5zsp1GVh+MceHVqbDq
         1WHfiSTYz2B7s857TW3dffgVIrHPc68oZV5u2YyoVY08avcRW4kOZJvXWMa2ZO7OAzk8
         ma5aUib+qWvDkZlaOGwics8u4U1HE/hkyfhwgjbaLWvkBO6XXZQq42r/35GIXAsyUEH3
         wk8gvYcveBOPwD14aZOeldNjEWoFHL22bu0FCzsI1CIMq1jSUnQT3kWXyHOfarI+c1Yp
         ZzDwSaG4GtcYh6FdotE3E2jyFdJgClGvHi2aaq4PJDirWvxRfFaiWIK75CEUAr1UV9Ko
         TB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805812; x=1773410612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InKX+d5TOMIn4QLgyy6Fu4JN4MhM87tVHkjnRlVwYog=;
        b=Wnp+FhBzCeZWUohZFIwG7MuWZ/vq1EilHKP3ogEzYBrwLzMsV7mSsrUodsQCHlkRZv
         g0rlcZZg2sfnmmcghs6M414IRjjJiDxPtS+XNtfe4wfp4IUUz7qKdwnDHNmoBjyoGSLd
         hzVpFEVgJhirgyZCiaVXssWatJZm5rrchve/+z2+YeqTRQCfKg7gYh/0G3yI9wYjxRkL
         R6mgevoOEnSVM8hQziYFuZkbb8yExaDTM//APfeh0JByU24ap5Htgl7W5Got9L34Ajj4
         lgYfKHQ+fkLI7UzG4TRukouH7YnVhNFuDEcV234QufU63Tbc9yCsZkA6esZHqwrUTNVh
         hnLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbFCIvx0vWT7ycbDz2grj7h9q4KqtWSqcEBHROFsW2+jgfREA+503upGfRCtN7FmeKf5ZJW9Y8YJJPwowMtNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXDNA3kGnQCE5gg5OA6Ar7KGtj2cUe2G6BGsQ1BhVQ/hVjtYsc
	2dHlwDFjNcsFoz30PS5IqW0PxcSYbhbJ6DgXsnC9YUGHYRHsaaedG742
X-Gm-Gg: ATEYQzygOB817w5oOHpnW7TZtKcW5kCTY1dr4udYdbhgrZWnzR60leVDv1L1eVSl1LY
	FKFU+HwVtwtWDSki1CAWh+V3x4W+rozBA7fQtjcnL+YO+tnVklMqJW15rYf9/fhUOOWXjJyGu97
	kyagxWecQ4KbxlDeYCoyMkXOikcsmy2C5KjFjyEaJquhz6ehLhkdtzbZwwpewnYW12vzjbfnHsH
	tSZuQh4igStdf6Mrz3UXVbZVMRHeci/15s3GlrrUiUN0272w8SM5pGoXdZRdwMEQrjOmiglQmK2
	kCbCu0q7Uu+/+svIWlKDWdjEGrM3d+NNPBaTmqEE1TzwNW+FerDl6n+REnhsaL1vACWOgexbWR5
	WfD8yagfYGGxJlgkv18HRKASd7+73lRowb3MlZYcpNP94+ofZwRuZGfxE4uVG12zDsWHUEBttCq
	u3x/mCcrPtzK2XpZ/uOntmPlPrCNSQBt6hrTjjCiq+YSmjLiLopDSRrq/QKks7aq6qPe4gne1zg
	Mk=
X-Received: by 2002:a17:902:c401:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2ae82455273mr25656635ad.22.1772805811507;
        Fri, 06 Mar 2026 06:03:31 -0800 (PST)
Received: from mi-HP-ProDesk-680-G6-PCI-Microtower-PC.mioffice.cn ([43.224.245.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840ccb6csm29134715ad.92.2026.03.06.06.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:03:31 -0800 (PST)
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
Subject: [PATCH 0/5] sched_ext: bypass state machine cleanup and selftest
Date: Fri,  6 Mar 2026 22:03:20 +0800
Message-ID: <20260306140325.2710927-1-suzhidao@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Su Zhidao <suzhidao@xiaomi.com>

This series does a small cleanup pass on the sched_ext bypass code path
and adds a selftest for the bypass mechanism.

Patch 1 removes SCX_OPS_HAS_CGROUP_WEIGHT, which was marked deprecated
in 6.15 with a "will be removed on 6.18" comment. We are now past that
point.

Patches 2-3 improve the bypass code in ext.c: add inline comments
explaining the bypass depth counter semantics and the dequeue/enqueue
re-queue loop, and replace rcu_dereference_all() with the more precise
rcu_dereference_bh() in scx_bypass_lb_timerfn() which runs in softirq
context.

Patch 4 adds a selftest that verifies forward progress under bypass
mode: worker processes are spawned while the scheduler is active, then
bpf_link__destroy() is called (triggering bypass), and the test confirms
all workers complete successfully.

Patch 5 adds a comment to the scx_bypass_depth declaration noting its
planned migration into struct scx_sched.

Tested on 6.18.7 with CONFIG_SCHED_CLASS_EXT=y; all existing selftests
pass.

Su Zhidao (5):
  sched_ext: Remove deprecated SCX_OPS_HAS_CGROUP_WEIGHT flag
  sched_ext: Add comments to scx_bypass() for bypass depth semantics
  sched_ext: Use rcu_dereference_bh() in scx_bypass_lb_timerfn()
  sched_ext/selftests: Add bypass mode operational test
  sched_ext: Document scx_bypass_depth migration path

 kernel/sched/ext.c                            |  29 ++++-
 kernel/sched/ext_internal.h                   |   8 +-
 .../sched_ext/include/scx/enum_defs.autogen.h |   1 -
 tools/sched_ext/scx_flatcg.bpf.c              |   2 +-
 tools/testing/selftests/sched_ext/Makefile    |   1 +
 .../testing/selftests/sched_ext/bypass.bpf.c  |  32 ++++++
 tools/testing/selftests/sched_ext/bypass.c    | 105 ++++++++++++++++++
 7 files changed, 165 insertions(+), 13 deletions(-)
 create mode 100644 tools/testing/selftests/sched_ext/bypass.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/bypass.c

-- 
2.43.0

