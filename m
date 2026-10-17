Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B1D3B14A4
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 11:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792234951; cv=none; b=YTq88M5NPB6oYMHI4/GemfecrMs1vpAN2LBX9QHbLa5XUTz56C2MqCGh/NsWBtsFAsob8t8R9kTHoGsmvPIX+y5glFTyl2Hh/5BQJUNuwrycYkpXUI/jVhzC79E1iQ5YeBNDS6PW3VcPYrBO2Q1tPtTc33IaSO+LUzKeOsHnjDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792234951; c=relaxed/simple;
	bh=FjGEp2k4FfSPM+tdsngqSEiml++4V5/mJNGAoCdd2oA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OqgEZb67hy1BI1K1g/Wnob8f59vPS6kX4TkgRahScwxEm5mNEUDJoOZE+L9+TUy1ZKBup4fnpr55V6futx4gr+e/dhEXPJXS4atfZpDNzDvjCPCpZtQHqQDkgrzjHvA7LBp1N0mfcpXKIs1UUDSqHjoytr7akY5xrTVlKXbD0Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHuZQpun; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHuZQpun"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9ae391a05so3781885ad.1
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792234949; x=1792839749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EooerGosbt9uNoLNk2R3r8CmWtmPXhr2JTyWgkAeP44=;
        b=cHuZQpunqcDKgEEWM+GEZRfBnCIGjPlwrCxJQX5QcKOO/pp1ON9UIdIoaZVF9EGWLQ
         ydpO4Rp1bQ3Vm9ykUu/sq8VzstLrvMLiMa6fhg/qMh+yTHdtJQ02lhzid4jPb4//r+Ok
         QKRItRLq0gQRej8lQ/8a142R1MEcWEara+aqpwP51OrDWPDoRanzVL2tk7MNOwQjrRNQ
         aaLHhUxO5BbkWLAOaynqv2gR8u0LXZPnuvue4tv90X0PgcsGpXxh9hj6VzL6Nmq8px9E
         KEDsc8JmSmFcGaFtIP+jUy3z+E4CKqWDgSHt86Hi7cffVxSMWfU0saVPvdKy9TU0s+A3
         eUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792234949; x=1792839749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EooerGosbt9uNoLNk2R3r8CmWtmPXhr2JTyWgkAeP44=;
        b=I8VCqBGzXZ1pJMzHR6WlRuQWsrcI41CaQGI3pzwMh0Y4gwr8t7IBVpuiC6k2Qk1Qx/
         RYPEfQuC/GVJx8pTqDUSv4wFJ/mQ74C7FVDJufCYTBDrKOIfv/VNQdPbJRPzrtzgi7jF
         12f0eCuktDKc42RDImuv+OxxaiDd6DMBJaoOYIRHlbbJFxQrt28pxFtwxsii3Q+zV7GT
         yNLdtCVitucAojG6g+A9/OaLJ3E9RTG+21VxC8LRiR5jqmHdM6U85aidSIgfcrcCqgN2
         vkG67E2sLrVxxXflmMImef+sXUD+q+fa7WbkycDr40+xcERqGvAih+BBAVhYXm84ZIJP
         pPSA==
X-Forwarded-Encrypted: i=1; AKwUvBztC8mQVI5GBsx5EFaMVZ9dybUnn5w3GQstXwA5VRYRzmc2ONW/7uOThreooSxrtBeQZJ4liaSNuUN0rcC/BGc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrHAyghxYzf5uhkclgCuNwzChlt/k8jV4KjXlbX0o/tWGA8wBY
	yNr1YPw+V1+gSbwTVwRQNET76LEMoLAygIQkIgoLAdopWKrU3BvXLt2T
X-Gm-Gg: AYBFou2Xx4Hm+nkggZy0JIU+Ij0iZUx6FWc6RB/8olON5glfw0UpaPjPLsD9PpleKKF
	lzRwN3sDtQtyLMc0Iwf94fqnUz6jIxgqI6LpNlXCpNhM6tRKC6lhT0hrKlvjNXWDaQ43y3Ih5Gk
	BVXyb1XPYTgqMT0wD5OgVeOGcQCh+GBKaeQ3JrhV7NAUBJdAdC7VoqH6aL2Of83WYgVhF1iVwzp
	uSzVFgUQ6Sqw3L5X8LtaDRX2xGd5jbFyBgb1DUcEkq2BMEnOybA5ZKB4zzKzLeI5eX+6/EYyje3
	/J84AtbO5U0WhJXMRd44E/eMtqzA1cg5u0BJQx1wf9likkWS+glGmiHtFSfbwYVMRqNmwJDICAU
	lEmfK2kQEvuv5MW0XL5xZA3TX8X5sEzzuMXCd3cnZ04b0h7PeXOBb/fKQU/hdEjZI8pF2E+WFOH
	4LGLXM2gXUXGr4iwzndsPQXfaLlyNpvXZiSKKBZ+rQBnt2R/N4hwiRyis1RhojmIRvtVtRijkdW
	YM35xRXb/1FDgMlecxMgQ==
X-Received: by 2002:a17:903:1a10:b0:2df:a0d4:71de with SMTP id d9443c01a7336-2e9a66ebc71mr15900275ad.0.1792234948529;
        Sat, 17 Oct 2026 04:02:28 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:7c65:ff3e:80ba:b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804dd9sm20559955ad.16.2026.10.17.04.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:02:28 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH 0/5] KVM: selftests: Reserve memslot 1 for ucall MMIO
Date: Sat, 17 Oct 2026 18:02:08 +0700
Message-ID: <20261017110213.46199-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses the TODO in __vm_create() to reserve memslot 1
for the ucall MMIO region. It introduces a shared base for test
memslots, migrates existing test users, and adds a read-only region to
prevent overlapping allocations.

A regression test verifies overlap rejection and continued ucall
operation.

Testing:
- Intel Core i5-10210U and Rockchip RK3588 (arm64).

These tests are changed but not tested: 
- arm64/sea_to_user.c: not enough memory allocation.
- x86/nested_vmsave_vmload_test.c: requires X86_FEATURE_SVM.
- riscv/sbi_pmu_test.c: riscv hardware unavailability.

The following test failures reproduce on both the unmodified base
<8edffbc1f6272db167037e1a8c49b99e9cd04803> with host kernel 
7.3.0-rc1-gd4b7fb647204 on RK3588 and with this series applied:
- arm64/vgic_its_save.c
- arm64/hypercalls.c

These failures are unchanged by this series.

Tharit Tangkijwanichakul (5):
  KVM: selftests: Introduce a shared base for test memslots
  KVM: selftests: Use the shared memslot base in memslot_perf_test
  KVM: selftests: Use the shared memslot base in memstress
  KVM: selftests: Reserve memslot 1 for the ucall MMIO address
  KVM: selftests: Test protection of the ucall MMIO region

 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../testing/selftests/kvm/arm64/hypercalls.c  |  3 +-
 .../testing/selftests/kvm/arm64/sea_to_user.c |  2 +-
 .../kvm/arm64/stage2_block_transitions.c      |  2 +-
 .../selftests/kvm/arm64/vgic_its_save.c       |  2 +-
 .../selftests/kvm/arm64/vgic_lpi_stress.c     |  2 +-
 tools/testing/selftests/kvm/dirty_log_test.c  |  2 +-
 .../testing/selftests/kvm/guest_memfd_test.c  |  2 +-
 .../testing/selftests/kvm/include/kvm_util.h  |  1 +
 .../testing/selftests/kvm/include/memstress.h |  2 +-
 .../selftests/kvm/kvm_page_table_test.c       |  2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 19 ++++--
 .../testing/selftests/kvm/memslot_perf_test.c | 62 +++++++++++--------
 tools/testing/selftests/kvm/mmu_stress_test.c |  2 +-
 .../selftests/kvm/reserved_slot_test.c        | 61 ++++++++++++++++++
 .../selftests/kvm/riscv/sbi_pmu_test.c        |  3 +-
 tools/testing/selftests/kvm/steal_time.c      |  3 +-
 .../selftests/kvm/x86/nested_dirty_log_test.c |  2 +-
 .../kvm/x86/nested_vmsave_vmload_test.c       |  2 +-
 19 files changed, 128 insertions(+), 47 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/reserved_slot_test.c

-- 
2.53.0

