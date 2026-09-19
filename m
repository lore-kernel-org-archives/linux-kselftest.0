Received: from mail-pj2-f18.google.com (mail-pj2-f18.google.com [74.125.227.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3A0364EB6
	for <linux-kselftest@vger.kernel.org>; Sat, 19 Sep 2026 06:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789797707; cv=none; b=E6O0w4Vw0aSHg7NzCQ0VDXJivZMHQCiekd1boX82UYB09QOmftHG4RLoivRX9gQYrr+3T8pG5VKKHnSD4GSK1mXWeofkOOw51pDop3mApd61LEtWX2TBCH7s83I6d5GPpQXlX3UrcCtTV90SAdWFb7mkufPmADqqX/q3R5XeG1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789797707; c=relaxed/simple;
	bh=hUeiMWsfR0bATJZ4paz6Mb39RCA51W43m3tcsCOn5pM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rbEPecVmBzIitO0InYQ/03JIYNVjPQoYOgvizJSwCyry2pi7iRggm79j/GJwk7thRGaGbf2pEWz8LvO2Fq3hbm+N3NKeJ6Hm5UpIU6FU7nolAyCfG4Da99xgSGGxOqzDeUJjTKYGeACdq4A4TI7zurIAAGh0lKIbiI+sd8bhlbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Od1H3gSv; arc=none smtp.client-ip=74.125.227.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Od1H3gSv"
Received: by mail-pj2-f18.google.com with SMTP id d9443c01a7336-2db22383fe8so9530335ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 23:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789797705; x=1790402505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Yv+Xvj7YTL81QyfNkbhiu6Y+qyJIuCpgzlKFyNsHtY=;
        b=Od1H3gSvRliTw3NzaPiretDlucdWr6i/JkP8dQgbWAUIiRPyUXySSHo1gxsDWheA0h
         qtnhkiqyDcXUAKtrhlc8WdXyJPQ396ETWO6Ernj9s77YsLfIIaPdQ0ZDnW9ZL68x1lDT
         FpVHk2i35cNTtlG4PJPHY5wSBZ4G4QaT6vyl82nF61ciKCgbUNudw+Eo808zx/PDJBWQ
         HdFUV3Uqj39WqYEzrFvEZxKdWT61IvzEd6CH82GpXMFrAl+V7U/iZU59WnkfY86kvx7h
         hWa74eMDJvuOKm6/XPXnfEnPxwqFrol6NfV4KYGskpzYxB+tjPMqbj6L66ZNFdes5oZp
         E2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789797705; x=1790402505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Yv+Xvj7YTL81QyfNkbhiu6Y+qyJIuCpgzlKFyNsHtY=;
        b=MWR8mZ3/d8cWMqtBn8Vf0Lw53bI1pIdOl/gNhOh4gR3syCq+ND+ivlkQj1+yVWjw9L
         iHstufILgTP625a5raaRq4UkTSnhSgu/3X2vN6GjfiqxOuaop2Xir/JrYcumM/zzfLtl
         0RWVwhiY4CfaVkGkA3vUFgWmxHzGfdrqXPYw96eJysxf6vefb9spVCMxwyD+VyFm46gA
         WcZoGcoI5mbJfNzFBHtJUgDWDu1E+6qpIWiEwfBjw2h0KKhvbjS+HFw94dUKH/n17Ja5
         sg3lb15nCScC8ZNhPqbyds4PnNFSRS6yovW/LosYDYviIv3B11vpRGOHmTVd1uJRQSEt
         NDCw==
X-Forwarded-Encrypted: i=1; AKwUvBxD2Atrk6Ncb5wKpRiQp9zl0DjLyuys7WeepzFx+b2piWUEZeHpcgb7TscoKulnXJTaH30TlEo301lH3YQuCOs=@vger.kernel.org
X-Gm-Message-State: AFuF++mEVSgTmY3LHLfLQnaDN/sdqGBVU1Yb3G+pCUiu6K76ClX6FTRs
	5ZDOLIPqfa0jtGgt/hGeqpRBLd7wqYeW0epL/ZR9KYYlCQ6nJsQziLEL
X-Gm-Gg: AYBFou3ssmP5JsuC0xY72mwqZ2BTI1ee1vA15u/TDHARAJVsxrOeC2AP1CTlFap6IvX
	3fo7qM3nXSAfKybT1Mz/byl+FBqvriZvrnKjBwAgL+5hunnQPvI1jLivZ1IofWtpA/8ekjnEHeI
	4foHfZlCkNdip5sH1tsrHX/EL6oOXbLFBHPmXSim/SDm6WDdd+SVm+krSYoeNKD9VerBJlseu0a
	SQWACmxMpQrrO/BdBKI+OcoRzHmNXUvHkx8P2Tj6I3fZLKwhbcxDYCeYFTn84B3XIlQA5lDcWQM
	EZpJXfw6kjzajPbhnpvUVkvv2/4Cxidim0F4HToruuxQg/wuJvQoyZVQh6Y0dwp/G/ibCwowx5c
	9VnhvEEhs7gvwxvWxj4PLP9hAnSZD9fMPi5t2HeRMjyOeuFI9TMyu1j6WC5Xe76Os/fB/rGCjlg
	FiHJKLvM5NyB7myOn4aBhmw8Fk0RgAvMgxSVKHCuizWfYS7pMrIFgKA6+vUiEGAtrWLYOQlSWlo
	FVSSUOSWABXyucNQlmHrBPPKfDal37nQDh+pZ0dhsBG9IKeb6WEML27+q5hv9Yby3jVtZwVN7M=
X-Received: by 2002:a17:903:3246:b0:2d6:fec3:bd57 with SMTP id d9443c01a7336-2ddb1af3398mr80521885ad.14.1789797705112;
        Fri, 18 Sep 2026 23:01:45 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:d11b:773b:fa83:c49a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c33140f7fsm3658321eec.13.2026.09.18.23.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 23:01:44 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v7 0/3] net/sched: sch_fq_pie: add per-flow class statistics
Date: Sat, 19 Sep 2026 11:31:22 +0530
Message-Id: <20260919060125.38063-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FQ-PIE runs an independent PIE controller per flow but exposes no
per-flow statistics. This series wires up fq_pie_class_ops to expose
per-flow AQM state (prob, delay, deficit, avg_dq_rate) via
'tc -s class show', following a similar pattern as FQ-CoDel.

This patch series is accompanied by a companion iproute2 patch series that
will be posted on net-dev mailing list as well.

Both the kernel and iproute2 patches can also be found in GitHub:
- https://github.com/H-N41K/linux-net-next/commits/fq_pie_class_stats/
- https://github.com/H-N41K/iproute2-next/tree/fq_pie_class_stats

---
Changelog:
v7:
- No code changes since v6.
- Rebased over the latest net-next tree and re-submitted patch.

v6: https://lore.kernel.org/netdev/20260917204225.275251-1-hemendranaik@gmail.com/
- Address Sashiko review comments:
  - Revert the fq_pie flows range to [1..65536]. 
  - Also drop the accompanying selftest 83be change.
  - Compute the per-flow delay with div_u64() on the full 64-bit
    nanosecond value.
  - Widen avg_dq_rate to u64 before scaling it by PSCHED_TICKS_PER_SEC.
  - Document the 36 to 64 byte xstats growth in the patch 1 commit message.
  - Fix selftest 83c0. The ping payload exceeded the TBF burst so no
    packet ever reached fq_pie, and the missing -W left the run waiting
    out ping's default timeout.

v5: https://lore.kernel.org/netdev/20260902035231.81866-1-hemendranaik@gmail.com/
- Addressed Sashiko review comments:
 - Omitted .tcf_block / .bind_tcf / .unbind_tcf from cl_ops (statistics
   only being exported; filter attach to fq_pie is now disabled).
 - Dropped empty tc_fq_pie_xqd_stats placeholder; class_stats is a direct
   struct member.
 - Limited flows to [1..65535] so per-flow class handles fit in a 16-bit
   TC minor.
 - Rewrote selftest 83c0 with TBF + fq_pie, ping traffic, and
   matchCount 1 on per-flow stats output.
 - Updated selftest 83be for the new flows limit.
 - Dropped the tools/include UAPI mirror changes from patch 3/3.

v4: https://lore.kernel.org/netdev/20260727164056.106203-1-hemendranaik@gmail.com/
- Fixed unaligned commit message; moved typo fixes to another patch.

v3: https://lore.kernel.org/netdev/20260630183702.170798-1-hemendranaik@gmail.com/
- No changes since v2.
- Resent after the previous submission was deferred due to the
  net-next tree closing during review.
- Updated corresponding iproute2 patch in response to review comments;
  kernel patches unchanged.

v2: https://lore.kernel.org/netdev/20260614125000.6058-1-hemendranaik@gmail.com/
- Addressed ABI backward compatibility issue for tc_fq_pie_xstats.

v1: https://lore.kernel.org/netdev/20260531125314.22492-1-hemendranaik@gmail.com/
- Initial submission

Hemendra M. Naik (3):
  net/sched: sch_fq_pie: add per-flow statistics via class ops
  selftests: tc-testing: add fq_pie per-flow class stats test
  net/sched: pie: correct tc_pie_xstats field documentation

 include/uapi/linux/pkt_sched.h                | 20 ++++-
 net/sched/sch_fq_pie.c                        | 86 ++++++++++++++++++-
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    | 27 ++++++
 3 files changed, 130 insertions(+), 3 deletions(-)

-- 
2.34.1

