Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F5A470EA8
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 21:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099130; cv=none; b=grK8V0i0RwB67eRsmEY1ikN5X+algrXwIkTR4Yp4BZatOAbhN0cVWP+Cbc8GN+EBR9WLxFIgjcl4c2TzGx9JueSIdZnyWiCYhzo6LoD+AEdXsUWSy/8YsOsyO3wmE01J8wwF7S4Y0A8HyWUG4+BtYNnzSZ+se7C6tcuZxKpYAmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099130; c=relaxed/simple;
	bh=/NFZ2tkWdLR9IJr//ybnRXFokS6ntcalDvGYdtTOepQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fn3YnPlqhMZs1egY+2pP8gHLv8Jp0+MMDZNQ/lAyKivjyH+uXsIOOUMwtbJ/vR/ozw8bVHFCpi2+j+qlKoYuTg5ysiZWILLEY4r4LslWzrrU+HdZEkfmD0Sm4fx1/ky1ljM8lPwONcK3Uf5KRcnRcy8+Z3jaCfUElv+lyzcFjGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=khN6W0OC; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="khN6W0OC"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35f1f76ea84so2450224eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 14:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1792099127; x=1792703927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fxx1tuoEAv/PlgxC62C7y+lSjrcK6Pozoo/S/YtYY78=;
        b=khN6W0OCEp1rzHQ9SUsFrbdYBu9bAh/3wxZV6VuEg1UnmC5JhJActmcc5hJohgyA/Q
         feLZaNO8/uP6SjY2KW0Urj7oUoMv287Vhh7fM0t5+3+adfH74Ef5e8w7ZJYPaibcQYbY
         R5KBmlNN3CpuJMqabLlvPyYlWkXJWjQ8em6fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792099127; x=1792703927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fxx1tuoEAv/PlgxC62C7y+lSjrcK6Pozoo/S/YtYY78=;
        b=szHC5zicxeMAZRNWxR+K4Yl9EZiC4Q3mVr4xTVMKJc2zcbAopHcAqQcGm1WpAO1l61
         59MqqiJZG8W/yDmuFfHfT14Ql111nUH54QGU4TukGWrJAnWwr5Wwx/RQISpM21ZJfJ7K
         CmFu87AgyAvX/DDG8ux6cHW+IqbmgKk70w7+i5NkHXjtdW7kLN5Yjh7b7Pf1Pk7D0lW9
         jUVhGmBBbYrcOK2HuYlF6cU5gmNd14htBZwpMIi2JhsGC3InRb1So2BDga3hBo0tKSQF
         rhDx/Wm9RE43qU+vjk11GGhBNr5c8tqtKr0wcgZ8re6DOYHZTn4TPvUvY7E4zmK+zGOb
         AYJw==
X-Forwarded-Encrypted: i=1; AKwUvBzCzjiWyclg7eabf5QJP/gfX27765NNw+22lJoQk5SPr4ZWl6YlEC5pxRoEGjkcBr7RR5q68l0dOhAabyBSmLs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpGTazj1OhySTbCK70tum4Z+cTCMQssU3BnFCvd6JL1CVZ1dkB
	jBQcz5TdFrsX7Na7NzMzsiaPrS3fnukYUUwwX/tvcScI7FtAR3XTcjn2XlmGmqRnLQ==
X-Gm-Gg: AYBFou1eb6GqZeh1CxUUcc67D73wvh+UQ6YWlJiGB/UTqPGxDZHw+PdVZRyXklaGjvY
	8T0DAGFx2DfRSZhQp/gz34oVp+NYA2TG1SyS2g8fh+DDQimNxfUbYJgAnnba07J50fSJ9DgNM0M
	er2uCwyKqh49xVYoS6hOYO9dk5uqkwzinV0dLphBBhCTb3Vm6HI//RFq0MtrKO4wkebBFrKyvnX
	iJsqZazVqc/SOt5b8Vdywo57+kXwazzPWtAUlvCAo1epblQc/6QRgT0rs5t9azYeqrEAkO3HEb0
	uRlj2p/zsYXbxGzDyF/A92hV+T3tEDbshCmKAHLXF74n3oqZc5a+I6UGNaLP2M4s9QzZnrILoXE
	8YRBNVCiOVcmBaPUZ8LF5X460M9nPLPM3+n9Vy+xIJ+xTEpiua0By6YJckTNO1+MFv3oK6Ebabw
	+MDTjcFPjc2BSJdrcejbIK+vpBZcIc/FABLRcHGS9c83yxXjDEXuZwNTqIxGYJqW/BXFNNUDP+t
	7Kf
X-Received: by 2002:a05:693c:8643:20b0:35e:fd8:3201 with SMTP id 5a478bee46e88-35e0fd83708mr8390127eec.14.1792099122700;
        Thu, 15 Oct 2026 14:18:42 -0700 (PDT)
Received: from exu-caveira.tail33bf8.ts.net ([2804:14d:5c54:4d67::2000])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b859142sm216711c88.18.2026.10.15.14.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:18:41 -0700 (PDT)
From: Victor Nogueira <victor@mojatatu.com>
To: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	netdev@vger.kernel.org
Cc: horms@kernel.org,
	sashiko-bot <sashiko-bot@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 0/3] net/sched: bound the deficit-refill dequeue loops
Date: Thu, 15 Oct 2026 18:18:28 -0300
Message-ID: <QDISC-TIAE.v2.r0.20261015163454@mojatatu.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DRR, ETS, sfq, fq, fq_codel and fq_pie refill the head entity one
quantum at a time until it can send. With a size table that inflates
packets to 1 MiB and a quantum of 256, one dequeue can loop millions of
times under the qdisc lock. This series skips the rounds in which
nothing can send, so a dequeue costs O(N).

1/3 fixes drr, ets and sfq.
2/3 fixes fq, fq_codel and fq_pie. There, a flow can still fail to send
after the skip (throttled or AQM drop), so a crafted setup can still be
slow.
3/3 adds DRR and ETS tests for the refill result and service order.

v1 -> v2:
- fq, fq_codel and fq_pie moved to their own patch (2/3)
- empty flows are credited and removed as the old loop would
- tests reworded, ETS case added
v1: https://lore.kernel.org/netdev/QDISC-TIAE.v1.20261008110502@mojatatu.com/

Victor Nogueira (3):
  net/sched: drr, ets, sfq: skip empty rounds in the deficit-refill
    dequeue loop
  net/sched: fq, fq_codel, fq_pie: skip empty rounds in the
    deficit-refill dequeue loop
  selftests: tc-testing: pin DRR and ETS deficit refill semantics

 net/sched/sch_drr.c                           | 42 +++++++++-
 net/sched/sch_ets.c                           | 41 +++++++++-
 net/sched/sch_fq.c                            | 81 +++++++++++++++++-
 net/sched/sch_fq_codel.c                      | 74 ++++++++++++++++-
 net/sched/sch_fq_pie.c                        | 68 ++++++++++++++-
 net/sched/sch_sfq.c                           | 41 +++++++++-
 .../tc-testing/tc-tests/qdiscs/drr.json       | 82 +++++++++++++++++++
 .../tc-testing/tc-tests/qdiscs/ets.json       | 54 ++++++++++++
 8 files changed, 475 insertions(+), 8 deletions(-)

-- 
2.43.0

