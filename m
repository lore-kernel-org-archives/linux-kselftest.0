Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BA8273D8D
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 16:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776874834; cv=none; b=OmKpF0MHcl/mr0KAn3VEzOlxvxkHX6JCYX+EM/IX5/ID4tMspHbVcfWJof7+0QbpGe4LY0f4O2xjA0qZzacWwKFWh/r5nxv/In0C3z6qwa5UvXRls4CN+NCoM62jOkND9drllHWf6E8sS1aTU2YwdR5bmT5ZwIXN4cB/c9EzSsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776874834; c=relaxed/simple;
	bh=n/S7vPnvJmNtAFJIqx5WllUTObHXM/ewm6P1txHuil4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p/43uEMhtthZcu5ED3VHkq6Aogouk0V5yLBJfYaj1eWLlJle2o8U8G4fypSORSdLKajUFkP9RyZKevR1y4aOObatuthUXDPryjlbbgGSB6+UmsJvLIlll4ClH0umxj+vup3uYAYBI02jxMXWcypqZmwH+WFW+7tHTTuqsBOM6M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbP39Br/; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbP39Br/"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b25cf1b5f0so31358485ad.3
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 09:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776874832; x=1777479632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uDUW6WhwrCJ7taB0c1YRxQrTIsJfdmbhxi5mlzhuoqQ=;
        b=cbP39Br/cDQ8FofZ4leFFhMYLNqjZdM0uykI6a+qswMzaUdObYjY2+l/vvahUki3Vm
         Cn73du18QJgLtaae89lXWkKbMkvSpFtjDv9ImuqO5Qb3IDbnq0Eg8qAJWCfhh7VitZPf
         ZObmJd8LrVICvy0sSbRfKqkT2ulvpNOyKvDUQPWkSQ6OaaLDrXt3z7MfKm68mVGuuRa/
         Jb7hiTGBgIcVYeEWvKlnfeFgrZNj8bO7a/RXA7nUI+UURIKILO5olfSfyeIZHayeIXFA
         VMisY8NETnWojl7ccGMwMIf6jeIC0DtILkQun3DqLjcyONCfJL7TED4vEn+eyxItqAJL
         u7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776874832; x=1777479632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDUW6WhwrCJ7taB0c1YRxQrTIsJfdmbhxi5mlzhuoqQ=;
        b=RIeKRntuRed/woCEk+8jMAfwacuTjOdhvlMNeYD5FSX6BXnGM8sTNFTV/mWALc+VZo
         JGiuUQsEM00h4zsa96Q6CKeCNvOQLliWH+oJPGN6vKwLfLfVF+KHsDC0LJ2EEuE9OqL1
         jhnFPHruGwOJkgX3bFJtiYPN2V14bqiVBAUPgasKUE/qOMz6Q0TAzUpULKoXJF5m1neu
         VSaSdJKB97t957of624uJjn9dWM8hrNObo+GE+qSn5QRr+gpzMD3xmFxdRQKBLdqSsfc
         RBtmF39zgQp1cl6jcm+v1Shib7UCBd/QZvfhY6Hy8o1EILPBSx62S95dtmfqOXzQOgEV
         uaBg==
X-Forwarded-Encrypted: i=1; AFNElJ8TMaN9pOXiJ9VKEUZtRZahjd2tAoLeb0TkzCu1t+yPT8mjj/8eoLu8B/GdbPDQmn4jO9YYkvVjE4f0C6t+DKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTFOEOGrT7BDRrby8GV1ZB3D4axWh4v9kx4H/Jy0vb7oIslQWP
	ggBb6DNzhy92zY07FaBHS4VN5pdWqKKb2DOclgWU9gV9a73U3kwOCa1g
X-Gm-Gg: AeBDiesEytRLaxIoBE3S05VDnI+wCMxMSAYwE3wEX59AMoOt3xl7yM0drK98mw008WF
	RptQEkenP4a6GCAndqwBiCt1eZMlhCJpLVnoRMVogM+w/IblP+wUNnW7yLpPB5HzQHo8OQP/Pji
	GNQMBr6RCoLnQgKo9cl6okRxHGWhwrJAHagirBrEKeE4bWcEZTCNHqzZb8ZlY6Ne/2NCkFkIMSt
	T4tExAWIl47E23A2BeMuZE0J97e1crOZwKJKbU5ilFsWVktEiYIbpRUUu+2kfbc8D/H0urj1DPO
	YrI2sOXuERbv8ix76qHyxgwTP/jTKf6L/PGnisdMiUzWhLCtfD96H7NGpMbWWkzD8NsCIAceYVk
	h7iPFsMB+cpS6kLn5qsNkATnrklEsIv1dW9iQA9/EQjolof/4X1cvq6MAi1ja7KNQVFFCWrzJKC
	WiGJNThzlfu+xtACd5gRlyD7TMZgw+cN8QovKoaDlbQwZfUqlxYXx5E1fOzDWSsu7Q00MmF15iR
	qsBRRjD/etqLntTrBzbpKU=
X-Received: by 2002:a17:902:e546:b0:2b2:490c:410e with SMTP id d9443c01a7336-2b5f9e5db09mr233759325ad.7.1776874832224;
        Wed, 22 Apr 2026 09:20:32 -0700 (PDT)
Received: from SLSGDTSWING002.tail0ac356.ts.net ([129.126.109.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cdd1sm170335445ad.38.2026.04.22.09.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:20:31 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: vinicius.gomes@intel.com,
	jhs@mojatatu.com,
	jiri@resnulli.us
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	vladimir.oltean@nxp.com,
	shuah@kernel.org,
	xmei5@asu.edu,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH net v5 0/2] net/sched: taprio: fix NULL pointer dereference in class dump
Date: Thu, 23 Apr 2026 00:19:57 +0800
Message-ID: <20260422161958.2517539-2-bestswngs@gmail.com>
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

v5: only call qdisc_put(*old) when *old is non-NULL and not
    &noop_qdisc (Paolo).
v4: https://lore.kernel.org/netdev/20260416185501.647884-3-bestswngs@gmail.com/
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

 net/sched/sch_taprio.c                        | 13 ++++++----
 .../tc-testing/tc-tests/qdiscs/taprio.json    | 26 +++++++++++++++++++
 2 files changed, 34 insertions(+), 5 deletions(-)

-- 
2.43.0

