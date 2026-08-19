Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E922F3C1F
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 07:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787123146; cv=none; b=MOMyEwVxaKg1Bwjsa0gOCO3fL6YN6F34cwpYCNBKV0kXqORrXNgcbJrHMLyFqsQGHjIpCz9/vsoG3n1NSOh3DVAyypx2YXagZu+20YidVV7Lurea3y8hqjT6uINYczo0W9XfKO8ZgaArBp6OSofXpaJfNDR++8kQKxfVSyKE/G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787123146; c=relaxed/simple;
	bh=d2D/XwMx/SOv681vOnzK2+ESK7vhI/atSHzc4LbbiXM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=c/q3Vz7Uy9GgXM/3MIxnSmCDQfNnIQUdCU6MF/HEpVUU5Y2h1tCg78sUaEwKZ0DVjd4uHqONAz1sSPU05O/SYkT8vRWtdtuRi0u8ilo3/Pvbx22S0cg9HFDVA81Lt7JfPF9VYmMM3ZO0HL91DGku4OnQNTZCRn3daBAKGNk7XlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jasonmiu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qRlZD0Rt; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jasonmiu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qRlZD0Rt"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso977831a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 00:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787123143; x=1787727943; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/5Ut30PM1D32BzO4CJAfeJOZxs3sCO17fFGXnkufLgM=;
        b=qRlZD0RtyJuWx4BSo2Fy8GMBPzVznLj6I9EcQm1YzDHy13m1K67dBVVj8oRFyINgw8
         G+2s/s5bsT5xs1c8oOUCBiQAR/WhzC36mNz00sJNcr94eag1OsjDqVHx6WPf5KSL5hMX
         6sPHAFz7msZwMqSk4v1fHeKTXGmWjE24YnifzoqcPIDpUGkMQvMhnGgp1dA/1R4ib/F+
         7Hd1El1UB2c6J2vJev0CkB8+jI3zGnfkMXdgTcMNUTI93vVk0krPWR0wfGLfrDprdekM
         4U5XTVFH8XouEay0IEcv/inqfK8VW4c1mABYKOM2AQlLhM2n3ukhNZXm2p1odSSDOJKZ
         yp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787123143; x=1787727943;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/5Ut30PM1D32BzO4CJAfeJOZxs3sCO17fFGXnkufLgM=;
        b=deFkxLRJRGB+X5N9YumyuMhsk8hi1c2+8vSSRnmJY97EB/DIIbf5hOKzdAP44P+Ved
         CJa24kb+5NSZIft/Sao77wcOkHShf1pXjs6Kwnb7waFtvdVt6LY63+CU2xe2ISC5/5X6
         xXWYMBT86pw9R+ckXnK5puF7wM3494jlB3IxsBxN6xBCqWj/lJ24E4tVUhnKWsY2AsGr
         Wsc8+IyZLOq2b3/t09IardS6H2ODVfByRFlJOYC/H2X7S4COB24UtzZVorEUVvIYNnlf
         rw88oBuInKReVOCtzQ/g+XyzqBZQu7A68g17KPhNXDZLVz3x5z2ljMJf+OkdK7JmnQyJ
         3eWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9VzHPESltekI3oPWnZRfBskzwfTKdEGXhSAi6BItYPeZtzJlEA/PxG6ay1YtzeYz9XhyOh2FKg106+NxZmJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN7ePH1v0TyfBn0PZV4e7EvXEyosk2qoFu9ZCI1fmjUG90BWrR
	+k7pNEhzlDUBJkw+544r5KWYPoLiJTmWGxGJH62QErVMAxbj69ziso1aCMPJ5QnvUFlF3jIoLjX
	vu9P6F/FanV2BLw==
X-Received: from dleg1.prod.google.com ([2002:a05:701b:4301:b0:13d:2ef5:67be])
 (user=jasonmiu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2d85:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-3958127ae44mr4871724a91.14.1787123142847;
 Wed, 19 Aug 2026 00:05:42 -0700 (PDT)
Date: Wed, 19 Aug 2026 00:05:35 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.737.g08866a6d13-goog
Message-ID: <20260819070538.2404983-1-jasonmiu@google.com>
Subject: [RFC PATCH 0/3] selftests: mm: introduce page allocation stall reproducer
From: Jason Miu <jasonmiu@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, David Rientjes <rientjes@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Greg Thelen <gthelen@google.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, Jason Miu <jasonmiu@google.com>
Content-Type: text/plain; charset="UTF-8"

Background
==========
Under severe system memory pressure, system unresponsiveness often 
occurs due to page allocation stalls. In commit 94e0bcde055e ("mm, 
page_alloc: reintroduce page allocation stall warning"), David Rientjes 
introduced a warning mechanism to emit a kernel log when a page 
allocation takes longer than 10 seconds. This log is used to correlate
a frozen system with the system memory state at the time of failure.

To further debug and analyze these allocation stalls, we need a 
reproducible test case. This patch series introduces a new selftest 
designed to artificially mimic the severe memory pressure scenarios 
seen in production, allowing us to observe the resulting allocation 
stalls.

Patch Series Architecture
=========================
This selftest creates memory contention by saturating both userspace 
and kernelspace:

1. Kernelspace: A generic kernel module (test_mempress_timer.ko) binds
   timers to every online CPU, continuously executing atomic page 
   allocations (GFP_ATOMIC | __GFP_NOWARN) from a timer. This behavior
   simulates a massive influx of networking allocations. However, such
   stalls can be triggered by any mechanism that allocates below the 
   per-zone min watermarks, which forces the page allocator to 
   continuously loop when servicing user allocations.
2. Userspace: A Python script creates a memory pressure scenario by 
   spawning a primary memory hogger process to lock a percentage of 
   system memory, driving the system to a low-watermark state. It 
   simultaneously spawns concurrent worker processes that intentionally 
   overcommit the remaining memory to churn anonymous pages.
3. Orchestration: A Bash script constructs a loopback zswap device and
   coordinates the execution of both workloads. The memory pressure 
   situation is designed to last for 15 minutes by default.

Experimental Results
====================
We executed this test on a bare-metal node with the following 
specifications:
- CPU: 224-core Intel(R) Xeon(R) Platinum 8481C (2 Sockets, 2 NUMA)
- Memory: 503 GiB RAM

Test parameters used in the orchestrator script:
  ./page_alloc_stall.sh 80 64 2.5 50 memtoy/memtoy
  
- 80: Primary memory hogger limits memory by locking 80% of RAM.
- 64: Spawns 64 concurrent memory worker processes.
- 2.5: Workers overcommit the remaining freely available memory by 2.5x.
- 50: Allocates 50 GiB for the synthetic loopback zswap device.
- memtoy/memtoy: Path to the external binary used to allocate memory.

During execution, we mimicked the memory pressure scenario observed on
production systems. Under these conditions, we observed page allocation
stalls occurring across various processes, highlighting the resulting 
system unresponsiveness:

  [ 7467.002149] watchdog: BUG: soft lockup - CPU#156 stuck for 21s!
  ...
  [ 7561.805279] cron: page allocation stall for 566 secs...
  [ 7668.275609] systemd: page allocation stall for 673 secs...

Test Execution
==============
This is submitted as an RFC. We are actively seeking feedback from the 
community on this testing methodology and integration.

The primary objective of this selftest is to establish a measurable 
baseline for page allocator responsiveness. This baseline will be used 
to validate upcoming improvements to the allocator, and will serve as 
a permanent framework to prevent future regressions.

To run the selftest:
1. Compile the kernel with CONFIG_TEST_MEMPRESS_TIMER=m, 
   CONFIG_MEMCG=y, and CONFIG_ZSWAP=y.
2. Execute with default parameter values:
   ./tools/testing/selftests/mm/page_alloc_stall.sh

WARNING: This selftest is explicitly designed to exhaust system 
resources and heavily saturate the CPU. The machine will become highly 
unresponsive. If executed remotely, active SSH/network connections are 
expected to drop.

Credits and Dependencies
========================
This test depends on an external memory allocation tool, memtoy, 
written by KOSAKI Motohiro (https://github.com/kosaki/memtoy), which we 
utilize for handling the underlying anonymous mappings.

We would like to extend our thankfulness to Shakeel Butt 
<shakeel.butt@linux.dev> for graciously allowing us to reuse some of 
his original ideas and module implementations in this test.

---

Jason Miu (3):
  lib/test_mempress_timer: add module to generate kernel allocation
    pressure
  selftests: mm: add script to induce userspace memory contention
  selftests: mm: add script for memory allocation stall test

 lib/Kconfig.debug                             |  11 +
 lib/Makefile                                  |   1 +
 lib/test_mempress_timer.c                     | 140 +++++++++++
 .../testing/selftests/mm/page_alloc_stall.sh  |  80 ++++++
 .../selftests/mm/page_alloc_stall_pressure.py | 235 ++++++++++++++++++
 5 files changed, 467 insertions(+)
 create mode 100644 lib/test_mempress_timer.c
 create mode 100644 tools/testing/selftests/mm/page_alloc_stall.sh
 create mode 100644 tools/testing/selftests/mm/page_alloc_stall_pressure.py

-- 
2.55.0.691.gc56d675ccc-goog

