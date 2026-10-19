Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAF5283FC4
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 12:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413716; cv=none; b=Cc0VfT3gT0AIBIpb2oZ3AJUPXfYOt0J6bbF1ulp3qR1O5WGaMG4FAZ783OCj9YVGI9o8/xorVipVOezsTIWfNG0yDh0SG5c1xxL2Qsg9WfxJjLD0tpFYtK1aGHH4wIetlHGNlgDybnqDookDDKXoRYn//ZAK316Cd2CFdZroPbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413716; c=relaxed/simple;
	bh=gHiozBA4b+Mydjj0WDx+4yc4fZiEG1xZdsLUi/YhAe4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HBSMBKcfzhHJH4E/81zhb35ZKYtN2uy4OQFyHgGUk+8LzBhQC62a/bgGGoHRCj8knnMjG9CVmGN04sGOi8o4ltC0o7B62B7FODMTIkBgNGQXK8OxeWu+nmFkEdskRoQpsPGtnj2PmFZ7P2Vi9TQjGqx8tC7P17lRsjpDQd8MYwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--michalblk.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ubLcBqq9; arc=none smtp.client-ip=209.85.218.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--michalblk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ubLcBqq9"
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c42f98f3571so151610166b.3
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 05:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792413709; x=1793018509; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xG7Y20y+nUaq6lJVPnnQYX7VFSFS/lNQS0CTHINS8qU=;
        b=ubLcBqq9r9QYqQnEApsKR8BOdHC0ijuPA5UQpV1wG5xoiIhjfyyzBhfSXv14cXNQGn
         46S/FO8Hu3IJhucT7TRVXITAGZzI+SeaW+jeAyZA3xws1qsonQvcti/aQ7J3Kh2waXaF
         j6OVlla0oxtyLEonI2SgnyIVfUV8NneuF86H7YIP8dczPGdtMPSTBuHsEpyPPYjCdvoc
         YrUcXn3Ru+gwuPVg3/o52uakrv7brduJ2vPbKjxQjPdyGxmk7lwbwCJiguWSGn3KAZki
         HyqrgxnqC00nGHYcpXch17+UnzPQ3vM9QhDnkvz6ykYjJ/w3BN2ts69ja0R9nSSPpGzH
         yMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413709; x=1793018509;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xG7Y20y+nUaq6lJVPnnQYX7VFSFS/lNQS0CTHINS8qU=;
        b=IZnklXDTLae0IMLcMLMbXtu53OnghVADAgdmsJlD/J0RnU7bHGjp0Dv9bacXXsdPa2
         4ZR5/TY/oFg5gfY0979Injzfv5eC+7JlNsoVyk47Txt1ReQ13IfJJGgs4Ms5XbLRkbu4
         2Je5uoqs5X24KWUw5JCgWDiZ1yhYE8J4bOopX1qqS3nmw5ChqzaBdozW2sfp5fX0Gji9
         +7BFcUjL8FpX9Y2SwR3gxaJzQcFKfRROmA2/gaVX7yE8CDf4xlmOKvq1F3edZTt96VeF
         3ag2Jicww+hendJjykkDmN1bdZ01bSvurP9Dv7XbF3MB0tr+7aoV/j+XtgTQBU+bcCCl
         MKlg==
X-Forwarded-Encrypted: i=1; AKwUvBzY5GZ0QFI0mcf/aviVYnb9DoJXajyOc9lpUwbr5STLijLiNJE+oLwbwHYBimZwUAZLZMs9rNPpI9B5bVwPdTM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK56ikgJt7ProXURfnfcHcu1F+7DyHkOB5xwCgMVLBL5o23nSH/
	p51vHopIWpRd+76c0xHqOijWiSv+CJ8PMiKJdI2pRUAaRG/oB6k+xf4SLAn9S/PT3akOBaEA8p3
	vAKUmKV4AKHuWQ/vBow==
X-Received: from ejcaf4.prod.google.com ([2002:a17:906:9984:b0:c3f:a907:231e])
 (user=michalblk job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c310:b0:c2e:640f:f9f0 with SMTP id a640c23a62f3a-c419a844d6cmr533170366b.5.1792413709199;
 Mon, 19 Oct 2026 05:41:49 -0700 (PDT)
Date: Mon, 19 Oct 2026 12:41:44 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261019124146.3582127-1-michalblk@google.com>
Subject: [PATCH 0/2] sched_ext: Reset runnable_at when a task leaves its scheduler
From: Michal Blaszczyk <michalblk@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: sched-ext@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Kuba Piecuch <jpiecuch@google.com>, 
	Michal Blaszczyk <michalblk@google.com>
Content-Type: text/plain; charset="UTF-8"

A task that is switched out of SCHED_EXT while it's waiting keeps its
p->scx.runnable_at. When it comes back, the watchdog counts the time it
spent in another class as waiting, and can abort the scheduler for a stall
that didn't happen. Patch 1 restarts the wait when a task leaves its
scheduler. Patch 2 adds a selftest that reproduces the spurious stall.

The bug goes back to the watchdog's introduction in v6.12. The series is
based on sched_ext/for-7.4, and patch 1 also applies to for-7.3-fixes.

Tested in a virtme-ng VM (16 CPUs, PROVE_LOCKING): class_switch_stall
fails every time without patch 1 and passes with it. The other sched_ext
selftests give the same results with and without the series (enq_blocked
fails in this VM either way).

I used an AI coding assistant to find the bug and to write and test both
patches.

Michal Blaszczyk (2):
  sched_ext: Reset runnable_at when a task leaves its scheduler
  selftests/sched_ext: Add class_switch_stall test

 kernel/sched/ext/ext.c                        |  14 +-
 tools/testing/selftests/sched_ext/Makefile    |   1 +
 .../sched_ext/class_switch_stall.bpf.c        | 121 +++++++++
 .../selftests/sched_ext/class_switch_stall.c  | 240 ++++++++++++++++++
 4 files changed, 375 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/sched_ext/class_switch_stall.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/class_switch_stall.c


base-commit: 1f5dde349ac2fca1f119ae8de3f0d2f1c2a8d338
-- 
2.56.0.176.g3575e65682-goog

