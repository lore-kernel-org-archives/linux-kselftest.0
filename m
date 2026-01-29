Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E2E335554
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 23:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769729342; cv=none; b=EDYIF4l08XipVwn911IWE6FFUszFXOYpIdFijxfOmCRqL/LUFZWJpDAmHSRtrrtj2sGDVmledeoCds0Cw3DKOpy6bQZrk/GmX1fkIqNPLM40uw9KxnTjGJt9wir3enZo5vWz68lX1caKzgUexClLy4nhi+sZMTouF40ctN058ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769729342; c=relaxed/simple;
	bh=62qGoba01/4xKWg0SglqZtm4/p5doWh/TYXL8RIiyWM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qCxtrH3ozLnKEamaju4cQWo5oWktxfL5xk9lSCqpUVTrWXUJYPDZv0gnRLZrmKi8JYoDBbfwnvIxrWWI2AysUbYp/hVQcBAXKT8XPyxGUBHGMkK6iuH51mvtAYEhj2doCjAx9chyFiChTqGoPvn7fffugVz4uHRcyA3XGxHHRnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0XLr8odv; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0XLr8odv"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a13be531b2so14361595ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 15:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769729340; x=1770334140; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HJBNjw3RNtSCw9MLJW2nzX+EmjmcAxr1O5/9KOr8e5k=;
        b=0XLr8odvwuV7xaep7IlZFUMR+vzmU1qF6/u8rRPZS3maMKhzu765yIORvqC+1G0b8L
         eRCSso7R2NlNZTIA5EnOY7y0eg24MZygdnzqSWikHeXx7uKc6beLSgi2fjPEvdZ4jTtf
         LBYYaQeUT6apdG39G9qrDr4nmKKzPyZFbD6bwOZYA4J2arik0Iv3Z0G5o1Xd7lDzbhKU
         kGM1kI5oo6fzDFpHqDrllS4D3AwGAyuHtSiLMYxd3PY+SqWGBKMBEQNH3Cv0ZctBVE+B
         GZCubZTtiYOJ1bunmey+bhHNFsTEgNDYBYlIh34neBvWwaRA6nD0rhIvL8jP5efdjXqL
         X5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769729340; x=1770334140;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HJBNjw3RNtSCw9MLJW2nzX+EmjmcAxr1O5/9KOr8e5k=;
        b=GqoNRUSp+NuCB6R5eUnMarGdf2gC3Vmpe7nJWWdESzpdbHs68sWdZK/IANkTW0mT7i
         GyVh3Z8vtDIviGMEGT8liFRIyEoyoNAnQhSMsKv3KcU4M6KvqNCw9LwUAZARyv1Spq3x
         nALy0/xn8vFHu8uyBpMv1tBXRUCOJBW7n0aT9acBR54i4JJtaV002LLgHqDTmhpueW6w
         ltbngRkVjcup/Psg0ORdTlYneU2EGzB7LVxh12XF4FwamwcRO0XdHSIyWmi3wxd7UdzM
         a+Rtc+Y3MGd3j7hAVTemBfxvVhN5ozvI5lR2DnBZXs6S36bdFNFUSnEyQ/7OqJi0rAG9
         MGJg==
X-Forwarded-Encrypted: i=1; AJvYcCVUTh0ueBlFg6CF0hPkCcSU73w7ypN6c7AoZZ+VBS78sR02oKcUwraEWAEvFymzR1joC+MYwZ6mRg8TnjYTBJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCcVUm58e04qJurK+K9ZqbPuh3KncGIxOJv5kvir5Rue8jFX8e
	oCDHMH0NZ8K8+n21MCe5+HRY2aPeHCkAjpusW3MiBR6AHPFm32kbxhKX/00HBGfu90C9PRClyMJ
	dB0vfSqLEYlZR5w==
X-Received: from ploc15.prod.google.com ([2002:a17:902:848f:b0:2a0:86eb:ac5f])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:cf01:b0:2a0:d629:903c with SMTP id d9443c01a7336-2a8d992f074mr7921925ad.30.1769729340083;
 Thu, 29 Jan 2026 15:29:00 -0800 (PST)
Date: Thu, 29 Jan 2026 15:28:05 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260129232835.3710773-1-jmattson@google.com>
Subject: [PATCH v2 0/5] KVM: x86/pmu: Add support for AMD Host-Only/Guest-Only bits
From: Jim Mattson <jmattson@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: mizhang@google.com, yosryahmed@google.com, sandipan.das@amd.com, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

This series adds support for AMD's Host-Only and Guest-Only performance
counter eventsel bits in KVM's mediated PMU passthrough implementation.

These bits allow an nSVM-enabled guest to configure performance counters
that count only during L1 execution (Host-Only) or only during L2 execution
(Guest-Only).

KVM updates the hardware event selector ENABLE bit at the following state
transitions to ensure counters only count in the appropriate mode:

  - EFER.SVME changes: Enable/disable Guest-Only counters
  - Nested VMRUN: Disable Host-Only, enable Guest-Only counters
  - Nested VMEXIT: Enable Host-Only, disable Guest-Only counters

v1: https://lore.kernel.org/kvm/20260121225438.3908422-1-jmattson@google.com/

v1 -> v2:
  - Fixed various style issues, including indentation, comment
    placement, and comparison to 0 [Sean]
  - Replaced "hg_only" with "host_guest" [Sean]
  - Reversed the polarity of the dormant/active logic [Sean]
  - Removed the pmc_hostonly and pmc_guestonly bitmaps [Sean]
  - Added a refresh helper that iterates over PMCs during transitions [Sean]
  - Introduced svm_enter_guest_mode() and svm_leave_guest_mode() [Sean]
  - Moved transition logic from VMRUN/VMEXIT emulation to the above [Sean]
  - Moved architectural definitions in the selftest to pmu.h [Sean]
  - Added a test for neither Host-Only nor Guest-Only [Sean]
  - Refactored the selftest to program all 4 bit combinations
    simultaneously, reducing code replication [Sean]


Jim Mattson (5):
  KVM: x86/pmu: Introduce amd_pmu_set_eventsel_hw()
  KVM: x86/pmu: Disable Host-Only/Guest-Only events as appropriate for
    vCPU state
  KVM: x86/pmu: Refresh Host-Only/Guest-Only eventsel at nested
    transitions
  KVM: x86/pmu: Allow Host-Only/Guest-Only bits with nSVM and mediated
    PMU
  KVM: selftests: x86: Add svm_pmu_host_guest_test for
    Host-Only/Guest-Only bits

 arch/x86/include/asm/perf_event.h             |   2 +
 arch/x86/kvm/svm/nested.c                     |   6 +-
 arch/x86/kvm/svm/pmu.c                        |  42 +++-
 arch/x86/kvm/svm/svm.c                        |   2 +
 arch/x86/kvm/svm/svm.h                        |  17 ++
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 tools/testing/selftests/kvm/include/x86/pmu.h |   6 +
 .../kvm/x86/svm_pmu_host_guest_test.c         | 199 ++++++++++++++++++
 8 files changed, 270 insertions(+), 5 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/x86/svm_pmu_host_guest_test.c


base-commit: 1a424e9e0616db91010f08e5985bcc6edc504205
-- 
2.53.0.rc1.225.gd81095ad13-goog

