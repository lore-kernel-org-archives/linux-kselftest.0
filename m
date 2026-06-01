Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D333806D8
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 06:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296695; cv=none; b=n/Xa6UxplhHP+g441uQaE9hMMwKcIVJh2lU7HXTnxOzdQaon3pXb5OAqq/V+rR/sxxcHdZ7vZSLR3FBrOuEH7Ql6AZMYD3sdKnJVETH/Gr2sd4yCkr2hekhFjFctiHpLUisVSRvu2ZYteDWHmvB7ZSdMwCiyLxTHMLzCkImdm84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296695; c=relaxed/simple;
	bh=4Z68cWQbHaHjRl4qKx+/txXQQy0yeNNJZ1MWOyvxnkQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=IYNM7ZzrtyigXzEFNgfRud795HXojH95jYHroUKyEM/j2vkIQ0QOjnw5cxa6AwQ7LC9iXbKGFIUVDRD40x6+zHdr4VQs8OOYst6ad91cHyL3NqFKArCRTLX7HRCg8p8jIcW1JefKC2YuJI8VzWb1i3ZV4XvgHoK9PKblk/oi8Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GMq+/TZW; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GMq+/TZW"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8423770d72dso1801638b3a.3
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 23:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780296690; x=1780901490; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s1Xgy9a7jLX+LAIw3k6OrwbQIuXbHLeFTJ1qxe52k9E=;
        b=GMq+/TZWdu4wQ//x/+EQS+5HzVEKgUCYmCL/yViTHJRTb910iR+LQH70IjjNV/p2kO
         PObuh5DYria14GvakuhigaaWS6G2XsvNYlfmsojOU3gAnwBrkxzhaaIbvmTOPoSG2TT1
         PRogvjjBX1WSA9m7RwOEJQD29tt34dWQFP5gWdrk51F1YUbjyZWvGny2PHB+eNaMD/qd
         cizv43gBTtqlyM2KW0t8XqfycFXdXuEhRA80/lr4trFCVCUYHT1v/ARGlek2mKQ3iN5q
         oWles3EGNreskPPrXxYKkuexYsO9pLC2tAq8LMbQvsZnRCGsC4J46L5TQTBrMO/20qYI
         0uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296690; x=1780901490;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s1Xgy9a7jLX+LAIw3k6OrwbQIuXbHLeFTJ1qxe52k9E=;
        b=LNlrB4HeCpaYZ14PjcgZ9u3auBf5LZQiZp2w2y457QObApBL2eO03dEYW9bByQTxWS
         j+CDUtGJIW01GUnYOizOcEn+iGaDLNFodtd+LNlW5r/O/zbDzrRj6wwTsvdHZs0Y2pBs
         ponymI3+k8agCF/rP/zJOsf7ltQXXENgCg/v3qYlHCVCFGMEVW97PfAo4QIPgjDzXJoJ
         PTnf4Tv35ekU/TLjhBsI73zSNNiD8W27b0aWeiVhORa+jkXuQoLecLC3UbGp/v2DR8zk
         ZIBs3guogHtJWBRr5n/yrtTgCWde78Ih+n9FDxBYgrL96JmtSRrzn6c57V+Nl6q7YJro
         DP+w==
X-Forwarded-Encrypted: i=1; AFNElJ8yRFHnjPya+AhMa3nq+iR90mIk3B18mqMsJjI/uYAETEg01VY1dewQXtFIXehG7oiyNG/sgjRvOvJoVhV7mPI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx26ZTZy8caw0Wc1b6MvwR5sdaJWRS6tNZxgVRaPdArmfi65uZT
	cKf3oJFGkBbrqrqU2kM43ejJCELZcYEEOWZXXeWljEJxxskLCW2tWwYYoEe0O5Jn8/Lv/r3G6Mz
	XkA==
X-Received: from pfbfa35.prod.google.com ([2002:a05:6a00:2d23:b0:841:d0a9:768])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:9a8c:0:b0:83d:b0a0:90e3
 with SMTP id d2e1a72fcca58-84225478823mr8881643b3a.31.1780296689846; Sun, 31
 May 2026 23:51:29 -0700 (PDT)
Date: Mon,  1 Jun 2026 06:51:19 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260601065126.3623867-1-wakel@google.com>
Subject: [PATCH 0/7] selftests/futex: Migrate requeue, NUMA and robust list
 tests to harness
From: Wake Liu <wakel@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Carlos Llamas <cmllamas@google.com>, 
	linux-kernel@vger.kernel.org, wakel@google.com
Content-Type: text/plain; charset="UTF-8"

This series refactors the requeue, NUMA, and robust list futex functional
tests to exclusively use the kselftest_harness.h framework, completing
the remaining unsent functional test migrations in this directory.

This eliminates mixed usage of legacy ksft_* APIs and high-level harness
asserts, preventing crashes on older kernels, and ensures proper thread
joining.

For context, the previous wait-related migrations are in these states:
- Series 1 v2 (wait_timeout, wait_wouldblock, waitv): Sent, awaiting review.
  Link: https://lore.kernel.org/linux-kselftest/20260526010635.23980-1-wakel@google.com/
- Series 2 v1 (wait, private_mapped, uninitialized_heap): Sent, discussion ongoing.
  Link: https://lore.kernel.org/linux-kselftest/20260525092002.3762888-1-wakel@google.com/

Descriptions of individual patches:
Patch 1-4: Migrate requeue, requeue_pi, mismatched_ops, and signal_restart tests.
Patch 5: Migrates futex_numa_mpol.
Patch 6: Migrates futex_priv_hash.
Patch 7: Migrates robust_list (and fixes an out-of-bounds waitpid bug).

Wake Liu (7):
  selftests/futex: Migrate futex_requeue to harness
  selftests/futex: Migrate futex_requeue_pi to harness
  selftests/futex: Migrate futex_requeue_pi_mismatched_ops to harness
  selftests/futex: Migrate futex_requeue_pi_signal_restart to harness
  selftests/futex: Migrate futex_numa_mpol to harness
  selftests/futex: Migrate futex_priv_hash to harness
  selftests/futex: Migrate robust_list to harness

 .../futex/functional/futex_numa_mpol.c        | 109 ++++++------
 .../futex/functional/futex_priv_hash.c        | 160 ++++++++---------
 .../futex/functional/futex_requeue.c          |  32 +++-
 .../futex/functional/futex_requeue_pi.c       | 130 +++++++-------
 .../futex_requeue_pi_mismatched_ops.c         |  39 ++--
 .../futex_requeue_pi_signal_restart.c         |  67 ++++---
 .../selftests/futex/functional/robust_list.c  | 166 +++++++++---------
 7 files changed, 354 insertions(+), 349 deletions(-)

-- 
2.54.0.823.g6e5bcc1fc9-goog

