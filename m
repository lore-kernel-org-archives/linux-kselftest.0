Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208237;
	b=K1OvFitiCM6FJGRXrNxjDjg2NMvST1IDT0aS9NIA5lhze4TocCd0y5hzhLrkWPUU0QCn
	 XLAGtt4MSCGaMxwLEyQ5u9KZkEVCafihgzQmzCWekOiYZyRXllBP07Z6NAHgXf6+MKtQs
	 aqB3ZMLv4HVqPBf/flB85qJW2jmhyxMOpTg0/aItO/Ihf96I23g1Y69TLjoy1J7VqJQxt
	 VE6bZcMquCMqQZAptME2YXfB2hyMRTKw3evnjCzbwrBIJtFkVWU7FkzkoRcl8twLqVS43
	 6AvFXx+TeakqP1sD8TqPfPKOr/Du/x9wSpSWUX+Ow1Uxpllkm6N7ZL74B2irEPhbCPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qMu+E00+xLkfpIW7uvacAeDC12OVnUmiLpjE/Y+qhVQ=;
	b=LTut/12XmgVh+it7rmdRLBFeeOgtL67+msmQz10i16deM9/C6mtty/xG9nAnRx6iZ3Pl
	 zfp0abKi4mxf8mUVzgQj6L+0IR8PyD4Kd6bZgylMDOhOWEBVZ8lZuq6fTzwWLc2fT1v1Y
	 IdH43xljzGDlWCh5IKpwxgY5LrNGsrYtSo9yAqRr8V5+OK+JrimmDsJPqmh9ktr5aBNAI
	 9c4UB2G7HCMFpRIVx8wDcwDXY4wBqgL41lu1QjLUx1JrF4kSsEAufR986h5PGQlFFOlKo
	 zT7717wtNwGr+1vgyO5O1jfRTrj1wTcUMLPFzORHNhwvpcBN5Cenb9z4rm6N3htefNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N57GV0WI;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BB4606A330
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 07:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5BB4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N57GV0WI
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1989107eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 23:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208236; x=1794813036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qMu+E00+xLkfpIW7uvacAeDC12OVnUmiLpjE/Y+qhVQ=;
        b=N57GV0WIWarWe3ZrYQQvE6FGtouwvf0dlkbJO492VMsz9IM9FmnXH6L78Hqel1qF6H
         IPTMmSalKejGbC8ehdfpK0qEdGKyViWoTij3Lz8eAqBwiBHb9kTZilsqmX5Ex7DJu1gf
         DMQI9x4p0YY2nOYnthUt6WRSFp60B59bcozRolgKhVosh9JEB8RkGeQiD4y7WRYUYlv1
         OAxduc4g9dUu6gBXqpEUlPIYPrjm0dfP/LcaHY8dQ95XH3P1snUqlx1fiyBduB43x+n3
         p0Ths6cpvC/zDADpFqJ9rm4OA8NBlf4D/zf+YUoBB+MAjFisBkOx1NPzdGUZ3iUoYHuO
         05Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208236; x=1794813036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qMu+E00+xLkfpIW7uvacAeDC12OVnUmiLpjE/Y+qhVQ=;
        b=QYtmNYbm1niTuRltPVxBrKco62nsKvcxCuLt7UzFuKCI5YryYG7JSzWAh8xWpdvXoh
         1TOCmu/VMPgfezKeJOPv4PTMianoHeLuZA6O6YDIWkdx021HaMbjuToOdeidLF/hp3EH
         2dTNtEnP/mmctaBZA/kcWHDIZ0BZ3dm4GZ3Tdswd3QXAu9kXoCeDy+CNu334LdCyJURQ
         BX2luQHHdPyyaslc/n+FCTOlMngJgeHz2At7BA+xIVOlba0yM9cjFSYJ+vcbeQnndhHd
         F1FJiOySA81TWemq52ITC1FokSOtMmTZ2fcMaGw1pZRPFW4gzIU8UoxXusANJtazw29z
         Phrg==
X-Forwarded-Encrypted: i=1; AL+hErE/pD3fYqlWbldEfI45JMel8tt/02dEsWcyEBOgnHqBSUFO2wIGl/zbgJFeSyo/T69jaMarHo8oC7+Q6F1DOWs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PXKy46iLDq/uOk2Gz0bAkCO86qao9AXu2JuxWkVY7NZw6Uzbl
	EuJ4dJogTL/XITrr54pfusxgi12k6W5alUGTXuZTcka9fB6vvToDTW6z
X-Gm-Gg: AYBFou2jRt4CRPoxXY8yr35eliwsrpifAT2jtG4ZwZ4rJo8IDinqJUR6THX2U7LzUGI
	NZMcc/kcGxazkFbuN4hb7f9zG9ds4BVXBbbLqTxCvic5RS6FeusEZu0QejIggxJz6Aby4aXjBDG
	qH9aqkUvVnNVFMZHM2uRibr9rYYZPVO/etHZDCmJavrGMOcUD2S3+Axna2mFQl99JMF8GczihaP
	llU/uG59SZE3jQVT3RJDKTpISV1nVSvPJJAgnacDeDzsSvlZBBbtem7B5wPMJG/Tx90wjneoUNB
	Nj5tDIjCBqL1Qac5Hzh/wGJubi4ukmoBNGwGBolzxggbA9f6KcnYeUgGveCapazvJc/HhGxCUz+
	ccyNBkbNf7L9+CJgdVqPaUO+fKxpAR1XbeCz64Ov9KpEg/SCG5RHLHYNv+RRgzXZTqn7BuhkRbn
	+xpEZHbPMuwS96ugXJ7TtCXuGH+H2g2Sbj4WVG+bZ98E4E0LZfl7EsT3N75uiQ2+lRM7mj9GjJ3
	zVDxPB3M3sbwHeKqQFKolyqxkT80UU01FIkM/odxJN1F2S2kdQTIw1UiqZnr04jUFSrCNkDsxm/
	HKoly3pNzQoFShoZJGHrh4DNjKfhKaidtrjZewK1sYp6Zx3kXBCLJ4kVnQ9u5F4POUDLIdLEeQj
	9WLwzAhIQxJ7ErUEiSdDH20+YGpTDW3FEH3SbAEILil8KQ8Jp7w==
X-Received: by 2002:a05:701b:4558:10b0:1b3:a9c0:6a3e with SMTP id a92af1059eb24-1b3a9c06ac8mr3048889c88.29.1794208235645;
        Sun, 08 Nov 2026 23:10:35 -0800 (PST)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:cc96:e14b:76e:f8f1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm13443513c88.4.2026.11.08.23.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:10:35 -0800 (PST)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	donald.hunter@gmail.com,
	ast@fiberby.net,
	toke@redhat.com,
	liuhangbin@kylinos.cn,
	j.koeppeler@tu-berlin.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v10 0/4] net/sched: sch_fq_pie: add per-flow class statistics
Date: Mon,  9 Nov 2026 12:40:13 +0530
Message-Id: <20261109071017.438478-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FQ-PIE runs an independent PIE controller per flow but exposes no
per-flow statistics. This series wires up fq_pie_class_ops to expose
per-flow AQM state (prob, delay, deficit, avg_dq_rate) via
'tc -s class show', following a similar pattern as FQ-CoDel.

This patch series is accompanied by a companion iproute2 patch series that
will be posted on net-next as well.

Both the kernel and iproute2 patches can also be found in GitHub:
- https://github.com/H-N41K/linux-net-next/tree/fq_pie_class_stats/
- https://github.com/H-N41K/iproute2-next/tree/fq_pie_class_stats

---
Changelog:

v10: 
- Update Documentation/netlink/specs/tc.yaml for fq_pie

v9: https://lore.kernel.org/netdev/20260928043358.6866-1-hemendranaik@gmail.com/
- Add a blank line between structs in commit 1/3.

v8: https://lore.kernel.org/netdev/20260922205924.32173-1-hemendranaik@gmail.com/
- No code changes since v7.
- Reword commit message to reflect usage of div_u64().

v7: https://lore.kernel.org/netdev/20260919060125.38063-1-hemendranaik@gmail.com/
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

Hemendra M. Naik (4):
  net/sched: sch_fq_pie: add per-flow statistics via class ops
  selftests: tc-testing: add fq_pie per-flow class stats test
  net/sched: pie: correct tc_pie_xstats field documentation
  Documentation/netlink/specs: tc: describe fq_pie per-flow class stats

 Documentation/netlink/specs/tc.yaml           | 32 +++++++
 include/uapi/linux/pkt_sched.h                | 21 ++++-
 net/sched/sch_fq_pie.c                        | 88 ++++++++++++++++++-
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    | 27 ++++++
 4 files changed, 165 insertions(+), 3 deletions(-)

-- 
2.34.1

