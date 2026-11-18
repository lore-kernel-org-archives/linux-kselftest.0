Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983974;
	b=xrIrl53Yy95uvR3xsIhNOoAC4SiQxPzNpkjhkoF+kWnwnIwVPkBTP/ObXH/M9htd3bFj
	 Qz9Vyy+BBAHQZjoXk1tQ1tKikvnTh1AoxO+4Ay4Grp0sksR5HQo4/zQscwPcKIVOaqvGK
	 OAnb4E859g3cgP8J2u0teIer5c621w+MpvHf8UP0xvEMRU+f64Q871kueyRWLN0GEz9iZ
	 rBMoU+RIg4zj5VMF+aUYaUScI4lLZo9uWNAHLRcJlm82iwmgYE7KkYZbxXGol8ltwGZqK
	 dzgCnTrHysxhp7C+e/Rpp+QXHPUTOkqOboE6cNx1/7P1FbTf0rJ+gcAvmov/LiuqOxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aoczeufkw3DOf+e+V7z0I3M4e1H07M0CJBQzemDHKiA=;
	b=p0oU0Nt/FrQmCONPxgS7kM9qUU0o0lCWfuVcGwvdpWU2Oaj6eDTKNx2xwNEkPYvud3ha
	 NA2hEHMd9PJN5wZ8APn5XnS2BrkVdv1slDcgUn6XCqR14VFDr8or8PJSNi79PqOt3Zfgt
	 L7iPcrLzuBr8876GrY0KfuCtK89DMbXA4c4DVlgYjrMyCVXTWxd6R5X+T5mcCADzmiUal
	 R070NcES8keDbkTwXJVl3oSET8oPgsTG63gK7wMFXjp74U2Uc8kaTOiik9rAvaeYNVGkU
	 X9qrjtDay4v7aXs0MsFm8Qb90v2N6waecjQ61uIbesUbOyzvM1gAE2cL/RDU2pOBZtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fraUT9mF;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDFF606A32C
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 06:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BDFF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fraUT9mF
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso312426a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 22:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794983974; x=1795588774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aoczeufkw3DOf+e+V7z0I3M4e1H07M0CJBQzemDHKiA=;
        b=fraUT9mFHK9og4458A+ZbVxONdM9BrGJ9bX9Kp+OXfOb9NeYDjpjCoMbZ3cosjdsMn
         txiPE7W0rSaEf6Rdy/FOVk+s5d/sQgGj6gQk10guHUGKBpu48l79tsHDhP0JZSV3loy1
         o+U+vaM7FiIUxLHy8H203NdhjTNa/PwgWsZmYJsGI6EFuy5C3kevAHOPznWFUWQRiH2U
         51eUSNNAAZGU6Iv/R/NaaPS3WRRIkms3+8XzRq2W3VRPdRnJ1VKrsqVELlStAw4b7Qm4
         WS2QFQgW5GrAXtfKCa3TcnSRclBlAspk+NpBzi+1QhTcpWQ14Kg2VjF8Egcy/6bHgo2+
         HPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983974; x=1795588774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aoczeufkw3DOf+e+V7z0I3M4e1H07M0CJBQzemDHKiA=;
        b=PoaPjx/rVw/NTgpuYveVEmZEXwVTgtfToaSba4RZK8a9U1M/V/w8gD//XnjIDvOt9H
         71JKDBX0dOZrqlDcYpsCWxLpshCAh0VowQUQFv9O/RyT3UCev9H+QHBy5wxTB0wgHnZc
         Xk8uK85Cjcs0pRFpRpEbkMUTwCFeROgzoSU7ikaq/7lfxRPJnsYrMwUAEpgkK1kuW67B
         /9HxgqOOzMQikD7rF7d1OsRNGi0pEn/S2P0iRYkFxaUaQbes5ekvFtLY9NE7991S6iZo
         9vTFGS2EhIPEoO52f7BRSmniNiVnwktnxUtVoyvPlIkXJkyA7lAO99mwMQbjlwLSpFG0
         EtKA==
X-Forwarded-Encrypted: i=1; AL+hErHuDjbzsbCK9rdchHGz/1Q3op4Pi8VONQCNwxFaqtM1djRIHq9AgRM170UGlkVykjVaZkexRfAoEpJtHxdQAio=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zUKWZUxyAb8nNHXeuIZkY6YzbhDNkEmvF9ivFzVlA/5zgttiT
	VMEkaz2n77pUsN/vRKWirhsAlxjEEYsjjN+uPLYMAnaZjJtGqJrBhh3a
X-Gm-Gg: AZFdTZfNZCgy3+RqXK2pxSE8vU3z/5GZd8CH5F48fVHt+GNH2HMDgiHEQYgHLOvv2fB
	tXMDHbhetlvo8owID/4MKOr8nuKdGdSUbF1kgpRpegs1qm/eCW0OakJXisger6w/e41Hqk5fhDg
	4c3/T6VgF7LepimY6C/GF+fmrSkww2NxL572fF7+LnKbdjfVlfsrwVwLEJrcQ6NszL7RPcsBSZe
	CsWxt0nOoCzso/U9DPWbPvbNzvMJYnx/OWttKGzga0MVw6ZoT8ozma+FC0Nzg+zDARS3U9HmFCP
	H8tenxPXECuAtQF7vlGV/Zq9ptnPrTg4kBNNLpgvg0aeiN7isVdxah5BFpeBDujvTcUZGl4oyRz
	6hcLr3X2VCaO7UdIj3wOcc1N77XMe20miFvCZ1bx/ccsq0zrfXjuOLaviEiPJfVznpruI1A7tMc
	9fURMIdsvahodpdAlbOPu+byUEfa1SJFC/J52Jm04CtwgE7RfvsWBdyRbi5XWWTphpD0Kzkx2e5
	OKeenVnq4maeWthfpZP0NRKsfas5eJJn+vKxOy2yUIFS3+jMgMB+K3ggDJgxUiN3ORRHDTW64Be
	t9TEgb1zKLSD0CzoDOrjSLXhZWnaPA5Uk5ZA1s294a2qMi2G7AXTpaiIq49CHrHgXYNguz5aY4C
	prWnSgasBJoK+1gfbe/TMkm6gX5ziCNnyrNpCkhK98RaG7urscBb3
X-Received: by 2002:a17:90a:d445:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3b3d06873d0mr1539328a91.2.1794983973868;
        Tue, 17 Nov 2026 22:39:33 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([104.28.235.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c03e04sm2562322a91.15.2026.11.17.22.39.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 22:39:33 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: netdev@vger.kernel.org
Cc: jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	koen.de_schepper@nokia-bell-labs.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net 1/2] net/sched: dualpi2: refresh head timestamps after trimming
Date: Wed, 18 Nov 2026 14:39:21 +0800
Message-ID: <20261118143500.dualpi2.1.543a9a1be910-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118143500.dualpi2.0.543a9a1be910-zhiqizhangg@gmail.com>
References: <20261118143500.dualpi2.0.543a9a1be910-zhiqizhangg@gmail.com>
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

Reducing limit or memory_limit in dualpi2_change() removes packets with
qdisc_dequeue_internal(), bypassing the timestamp refresh performed by
dequeue_packet(). The cached c_head_ts and l_head_ts can therefore refer
to a packet that has already been removed. If a queue is drained, its
timestamp remains nonzero.

get_queue_delays() continues reporting an increasing delay for the empty
queue, and calculate_probability() uses that delay as input to the PI2
controller. Partially trimmed queues also report the delay of the old
head instead of the retained head.

Refresh both cached timestamps from the internal queue heads after the
trim loop, while still holding the qdisc tree lock. head_enqueue_time()
returns zero when the corresponding queue is empty.

I identified this issue and reviewed the fix. I used OpenAI Codex for
root-cause analysis, drafting the fix and this changelog, and assistance
with regression-test development. Codex also performed automated
validation; the archived results are described below.

I reproduced the issue using Codex-assisted automated tests on an
unmodified arm64 net-tree kernel in QEMU, with real AF_PACKET traffic
in an isolated network namespace and HFSC ls/ul shaping to retain
packets. No source changes or fault injection were
used to trigger the bug. The companion kernel selftest covers C/L
dequeue, full and partial trimming, mixed queues and no-trim changes:
the baseline passes three controls and fails eight trimming checks;
the fixed kernel passes all 11. Runtime coverage is this DualPI2 selftest
on arm64. I also used Codex to build arm64 Images and compile the modified
object with W=1; additional build coverage is in the cover letter.

Fixes: 8f9516daedd6 ("sched: Add enqueue/dequeue of dualpi2 qdisc")
Cc: stable@vger.kernel.org
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 net/sched/sch_dualpi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/sched/sch_dualpi2.c b/net/sched/sch_dualpi2.c
index 4947def7c4..79eba7209e 100644
--- a/net/sched/sch_dualpi2.c
+++ b/net/sched/sch_dualpi2.c
@@ -938,6 +938,8 @@ static int dualpi2_change(struct Qdisc *sch, struct nlattr *opt,
 			break;
 		}
 	}
+	WRITE_ONCE(q->c_head_ts, head_enqueue_time(sch));
+	WRITE_ONCE(q->l_head_ts, head_enqueue_time(q->l_queue));
 	qdisc_tree_reduce_backlog(sch, old_qlen - qdisc_qlen(sch),
 				  old_backlog - sch->qstats.backlog);
 

base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.54.0 (Apple Git-157)

