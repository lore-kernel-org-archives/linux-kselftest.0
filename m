Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD1037AA98
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 21:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769850; cv=none; b=mspQf3YWjLMlTHaSYwsUIUnt8io8LIgvo7MRRfjZci8BMwmz4gP6lJvdAsMO9eBpjtFfwvHLYiTmI+zEveqCqKCguxNBCJw3yaYK/i4FmSebwd2h97mMlH1FUi09mn77LqQ183psg0mQVqNFHJd2iafKTlIa9FyLIE5hh1NO0eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769850; c=relaxed/simple;
	bh=rhKyWy3HDSVKJmPx51du1HwkVp4/UQTGLlrZn7O8BJE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=WXAXABPMkQ7nuUvPJ61lYjTOYabvqewKKlWAb3T8R19Adnk/Xfk4NwbMEQqa/ie7pPwhlEjrMuDZ0Z7g0Fhq0JrX3qGprt8zncUZ1b5JEdb6btCSidx9B5HRDmcutPKS4ZQ5eBC3JGL0WXBglaSe6vAOo7kpXiGOUvHq5pb2UHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UTBLvzuz; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UTBLvzuz"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so5603740eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 14:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775769848; x=1776374648; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oHIRI7SyBpcFi/wTF8KrrAf70SUxBJx1i0J9E5A6YsA=;
        b=UTBLvzuz4+K04zKfQ8mTB0lIa2f5P/gm8a2N57CrKlbJGb6WPKgUb6JuZG3tvbC2ZV
         O9rPowQQdKgI0U7SMMYgFD1116cUjSsoOYJUt0dC56zkdjpMg8EzvfglDPEmdAqtlr/P
         HSkLvsjvOCxCatrONepNKc0iDJ0/bjV8ghI1xQN6+fG8zLeRjT1a4NwT5wtT/jj1Uv82
         A2tjDf79UAeu6U0HTKZI/zvH6AJidmZzcdEt8HAxsFXKJnaQ2FSyZNTZPClOFVte+Bs1
         MxMax9odD3obJqaUSuorQJTAWiI0b5WyJCP/vbw3h3eSMlBd95D+55FwYBkDvSXIQglI
         VREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769848; x=1776374648;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oHIRI7SyBpcFi/wTF8KrrAf70SUxBJx1i0J9E5A6YsA=;
        b=QN0lcD2E9L8wJAVMne3vUkPc3l2EE3XmMxM8Q8dwlZwdHMyNYuXe8zGRI3dKMQnjeD
         4BOAhCMX1vAWwTsr2QBbu8s1VOtg1EL6fLol213wB+Ms47j1CDt13P5tSaKYrlaezgys
         ROsVQgcSMbpj3b6t7YsjURXFIrd3NO1aRMuUIZ0DGie53B9dIP3/BtYJUd9Sl2CTJWhk
         H1B09/cYToR93R+4X/avCf6YxyAGbyoiYvLjMZGFwotv6XA7h9QjucKZNH7d+FooNTwW
         HGJWk9KadpJmnFxENGRBczqIn5VHNt9Zat4oIUJNeXs8gR7Nf2m2e12vnLup8dRi112y
         9EIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZD3nJNIiyzxrMByPw5BV2uk0OcvR5zVVTncKCeABPMloOyAvui8lY9VZpxUBt3C3tInVYRPDSiPXqTq7+PMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfv2Hs59sJdDn9h/UVlWu7lZfungt/3MkXkUbPxRfcv4gYTvLX
	vPn6D2qKVBgHkgqWOhfK5YgSM0uAryWvRcoj0fHc6Y+hID0ttoommTLFXB9aRgNPJ1c+8hrRIP0
	xbX+8CxLOZe1Urk5YchFcvyijBximZj0rQA==
X-Received: from dybme41.prod.google.com ([2002:a05:7301:18a9:b0:2c6:47d6:488e])
 (user=aniketgattani job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:8c04:b0:2c7:3a7:c79b with SMTP id 5a478bee46e88-2d587e7d714mr482423eec.10.1775769848175;
 Thu, 09 Apr 2026 14:24:08 -0700 (PDT)
Date: Thu,  9 Apr 2026 21:22:21 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.rc0.605.g598a273b03-goog
Message-ID: <20260409212223.2072418-1-aniketgattani@google.com>
Subject: [PATCH 0/2] sched/membarrier: Use per-CPU mutexes for targeted commands
From: Aniket Gattani <aniketgattani@google.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	"Paul E . McKenney" <paulmck@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Ben Segall <bsegall@google.com>, Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Aniket Gattani <aniketgattani@google.com>
Content-Type: text/plain; charset="UTF-8"

This series mitigates a severe contention issue in the membarrier system
call by replacing the global membarrier_ipi_mutex with per-CPU mutexes
for targeted expedited commands.

Problem:
Currently, MEMBARRIER_CMD_PRIVATE_EXPEDITED_RSEQ relies on a single
global mutex to serialize IPIs. On large systems with heavy concurrent
usage, this creates significant contention. The issue cascades into
hard lockups when combined with CFS bandwidth throttling, during which
target CPUs may have interrupts disabled for extended periods.
If membarrier is waiting on such a CPU, it holds the global mutex,
stalling all other membarrier callers system-wide.

Solution:
Patch 1 introduces membarrier_cpu_mutexes to serialize expedited commands
specifically when a target CPU is provided, isolating the lock contention
to the targeted CPU. Broadcast commands continue to use the global mutex.

Patch 2 introduces a dedicated kselftest reproducer
(membarrier_rseq_stress) to permanently test this interaction. It
aggressively hammers targeted membarrier commands within a deep,
aggressively throttled cgroup hierarchy to prove the lockup scenario
and validate the fix.

Results:
As measured by the stress test introduced in Patch 2, testing on an
AMD Turin machine with 384 CPUs (2 NUMA nodes, SMT=2) shows:

Throughput: ~200x increase in successful membarrier calls.

Aniket Gattani (2):
  sched/membarrier: Use per-CPU mutexes for targeted commands
  selftests/membarrier: Add rseq stress test for CFS throttle
    interactions

 kernel/sched/membarrier.c                     |  48 +-
 tools/testing/selftests/membarrier/Makefile   |   5 +-
 .../membarrier/membarrier_rseq_stress.c       | 952 ++++++++++++++++++
 3 files changed, 989 insertions(+), 16 deletions(-)
 create mode 100644
 tools/testing/selftests/membarrier/membarrier_rseq_stress.c

-- 
2.54.0.rc0.605.g598a273b03-goog

