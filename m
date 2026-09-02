Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBEF2F7EE0
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 03:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321182; cv=none; b=nf7oggt5blm+dWo6gXrjpvE3mHynIyFmOixItSjP9ns/Kleo6dKrKfBVG50xvDxGlaD4ps+4yukAAkAPVZmywsWkS07GMVz+GMlA9ZQGfsyZMFYIYBvUkDMwXy5SdRG5BRKCAns2LGuE0VKySxofYhbT9XVAWy1KP+zrsHUOJ9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321182; c=relaxed/simple;
	bh=VQTV+1Df829D0KhYI8z888n05bpJmIInGDkIRqI83Dc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IZI0KhH2qrMSspss1ndtle1SwbMjWOIXk9Ec7qnmn0k+fe/l8pz9MS6GMjH/XILXrQygMetKyg67jsHkfqoIeTL720CwmnbEaA0i5WpTnkQn/nVpGZQHrYWIVzdi3GZvfoMLim5r82GGaTiQYjn8/MvM7pngiOSWMpfSRAnoy1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R11sKAf7; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R11sKAf7"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso652725a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 20:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788321180; x=1788925980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eVrMymMIOAYqNefktBqX7HmVpjK/XEfS+UGqRqDmQdY=;
        b=R11sKAf7JKVK39dLQ8o/woiFTtSlAdpyYeQ8aNeUuRpexJ+kUt1XFVDcFwvKfpu5Z5
         a/SGO3Q83DCee6NHy3qbsWK3tEGHVYt9BhadL1HPZRocX7i2ml+2TkJVow+1pG/NlqfS
         X2A+N/GMrZoMPo4Chuna82RJdVyO5UAbL86ltcwi2bgHYcU+FvlTmWJadeEju0njjuKq
         /9em3X8VNdEHJR/KGsibeWQlZO5vtCLMTHgDavUCyBgdikT5Kk0Q4ZnEybHYdcYqmTkh
         lhkbhnWKK3Mj8NXarZM/BLap2VKzmi2JZHr5nZOVh8KV3liX2ncZAeAbLufV8fhFvTAC
         aT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321180; x=1788925980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVrMymMIOAYqNefktBqX7HmVpjK/XEfS+UGqRqDmQdY=;
        b=eAz1IMIUn6lo49PbdBRP44tCZ3TQZ0A91bVaOdnli3IiGMSVmmKFzNjx1NegCGDZX9
         7vvk8KcqkAYBOWyEUdxXUo0Zn4lvEx9Fsr72L4Z46HH20w2yH7TGKqp8+hhjYxYJMq6H
         5Zztcpz2bV/p+oWa8vG20RA/QNVDGsTVC4ntpP4qnFBtQvTAGZdqUHXedBbdZAUbo3mt
         3Q6/fcZZLqOSEV1aZyd1Bxvy4vl6fzrwao7aNk8zSrhvzeqCtmbEEVx/vyKkSBQbDdss
         /0uTHOfA31H+CfztgIv7++tM5GTpX2Cq0ZyTkZ9mHjR639hbLAuju1VtWIrPyQzrOj5k
         kT/g==
X-Forwarded-Encrypted: i=1; AKwUvBzTm62ZSj49gAM1bB5tFvlB0vMszv/EAwknh8LixpGCzjrjmAY1Vn7JJ498ulcqIQNPRX6m4hgLHr5qSl5yKN0=@vger.kernel.org
X-Gm-Message-State: AFuF++lIj1mQS8MsaWzfxs1YFSMgsjVQMiqhaCFz7c4axaZDzQyb6Hru
	JIx7xMpme4ozerD1W6bH5gCveB/Rr7uYWa/R/rJxsgISx2RSJmTTGOiB
X-Gm-Gg: AYBFou3WsPGARlZql6xEB8VbdxhPOh8RHqEgpDwDQZv06Gw7wpkokxd88ptgyYTmtWq
	oWzNAnKzZsvq3UKIODhdZJyEdnDw2CpDbdECqDjDPUNI9OULZNN1Gro1KrsFz79iKdnJFPUz15m
	vc2UOG3ACD+um6oBMM5PJEYdQ+XYTo4P9zwsuikj0SAOXtbn+X70dyStlQivcMD7FOhFVKCUxCB
	Sp8rg26cCcuDc1BNjgANro9aUXAWZ3TcNRMjU7vqn2z22xiivUvnO/La8CFlSwUtdofW7Q7B3AZ
	Dw8pmVfHF1TeQHVTEqBR02m2yqXEfTAL/0O0Z4CgZXAaTzFDIXHr7gQLME868YjxX3474PU+U5p
	meIrwYTGiN0BwrZWjB0a4Ttt/L37JlYW7yTPe+NlExCX6vbLcTE6Obs19QrnblYAk9jpqDqbkKJ
	EG2r11CCl88kewwTxNz9lxj2Iqvq/QA0d4VKcwD8Xmg+YJegqhJA2pm02ON+cKFOjAplXdjHh/v
	UF2Qu/bgJPcT1lF8To0Byyx/4jOo8B2K4U3t9kHtJb2TpjJzc0ilKV/42DjirHO
X-Received: by 2002:a17:90b:4fc5:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39aedfe18c0mr2965060a91.8.1788321179932;
        Tue, 01 Sep 2026 20:52:59 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:5fdf:d463:f07:1882])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b7987csm2502377eec.16.2026.09.01.20.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 20:52:59 -0700 (PDT)
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
Subject: [PATCH net-next v5 0/3] net/sched: sch_fq_pie: add per-flow class statistics
Date: Wed,  2 Sep 2026 09:22:28 +0530
Message-Id: <20260902035231.81866-1-hemendranaik@gmail.com>
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
per-flow AQM state (prob, delay, deficit, avg_dq_rate)
via 'tc -s class show', following a similar pattern as FQ-CoDel.
---
Changelog:

v5:
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

 include/uapi/linux/pkt_sched.h                | 23 ++++-
 net/sched/sch_fq_pie.c                        | 90 ++++++++++++++++++-
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    | 33 ++++++-
 3 files changed, 138 insertions(+), 8 deletions(-)

-- 
2.34.1

