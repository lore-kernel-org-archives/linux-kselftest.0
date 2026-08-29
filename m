Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D4D369990
	for <linux-kselftest@vger.kernel.org>; Sat, 29 Aug 2026 05:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787982626; cv=none; b=heN+xmkQ6ga1hHpioi2NDEVYbzESOavQCuXOEBYoTHJ6TFZP5TnfQmJuJYgBAPnbpFWYX6Zka5XKg/bihck84JHQZlFKn8D4KeeQmCDkqlR+SQs8rCvmRqsDFjaqRNE+hwXVgAmZx3OIzibT+kuxjGsi3dERShcHcJUIUqIWfdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787982626; c=relaxed/simple;
	bh=Z+A8Tz7FckQ9L2HOE2LwzbrR7eujbvyPlVNZTZIai2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IiXV+r4coRTdOZ0zO9dTGVAG8IDQylybNYGjjRiPTlsm2BszdPrKvxC/yk1AKkkMbotnsxl1lZTNk3xjbsZb1Sd9C2drr5fNYhISdjalfwd76dZIhaePHnY4BwctGIKDzd9HbjQAbZVI+Fwn69fKzbzHunRxwUAMSBzX6KEYh6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GicLlpl+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GicLlpl+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495590dde14so15687405e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 28 Aug 2026 22:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787982621; x=1788587421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ukS+6O6VUnt+grJqSVzkQJWIYuNE2DdB1/VCqDk7Wk0=;
        b=GicLlpl+0dShPSzzFHsX+0hw752r/IAaqQdMRk81ppy7F8ryPOJQX7oGojnRirEM7N
         wdIqOY20pTEr7hFLb55QfMpUk9bEk2ikoJNmf7EgX05jbjuR+gnn1d6kRZ+RDubCkqZN
         IopSkTmu5DShb7DlLpC+dG1v1vSj7IZpmVSmvm4V+0SF7N4aF8cuF5cyCPCg32qxYJu6
         wVTz4lzHpGgeY70OZMYO3sLTuz1SBn2+YcSVZE3kqwDWd+rduClgiY6Z4JCci/Bw1NS6
         A+UUKUP0BvoxkUPt5W0tpBo0VkDowT6Ph75zczE/cm3BK9i5N+b4zkkqADVhYVbDkVPB
         LzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787982621; x=1788587421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ukS+6O6VUnt+grJqSVzkQJWIYuNE2DdB1/VCqDk7Wk0=;
        b=NggfVgQaPU7ZheRGhdZrHZ3jwenA8Gt47qQUOdaGUgw9NucBgcKUCBUDEmePrtHIa6
         MnK6AEH7uVLCCAPSP3C1hL77UEaNQaz+ujsscc3555hjTD84XkmAYRBduEuCMCVHZTNK
         qXfZYLkm32xK1235DuT+YUtYnIJP1hmDNb4fkn2tBwWbf32VMzLPxIVampH9N8K7yhp0
         Yb8eDznqkAdTiRW1hu/XLDKStz+MHq61YHdvfnWTvNsv0uGZEiNnLUMLhYL/IKGt5u5q
         dcem4Md8U9lYEgpLtpXwBqjaGAOFuZSAqc0YNKubhc3SBUR12xnlZclU9C3RTuQ+VmQU
         ZPwA==
X-Forwarded-Encrypted: i=1; AHgh+RpWG7juGW/M/OQlVmcO+iEScDoRkWKB0EKh7JPmxD8shEw7apvfKUvKv+XEAcRvuv/ayqtu1r3ztSzoGS4ex4A=@vger.kernel.org
X-Gm-Message-State: AFuF++nGnErWcieyUnxmNrpG5ZuK7GZWr/z5mareQvULTVEIWCxV54ND
	sBHntqLasuav+vm//8Yy8SWTa9rxKg98jJXF8tSJ0LI+hi5FwaXGHIWu
X-Gm-Gg: AR+sD11G5eGkk4wnofFbhPHXUWtA2MCvs4APGRqaUJGQEDYdj42L4UXOb5Xupf/QXJe
	s6x0EyEZkT3LeN6WyMps0pktZKxYdUiox7aii+5q8vBbt4/gdQPdeqGkRywh9E+00PN40JU2Q04
	JiaH7YbKTKOjj+zQTI+Lw2oFXpbygKmNd3VKC2Gfsevja3MHg+crpvM27sH6LuRLvMF0TxOse8p
	KOljwq5l5oGrv1CeI5ocD234EEDPHSbGIdMlWSUm5oZHlfEYAgmPVmAUFb6AAnOOCQ3APTPQJ1x
	FPIuSCqb/HQc5UMD/npv4ZpGpuhjsy4UBdwmHznhz5UH5K8Br2hBRC0GStCuVtqjcVRqYx1gwcr
	wj6D/RhqYeQ4Fo8G2Z1lqa+MgNkg7JnUKhpYcC7PLMUuEsWDomoB3N2bSMoZTof23usbAc/AIDq
	ZwXgU6bIe7dJktz9HhArctaIBCl+W9H0vernrqLcgJWkF8gmuWmFopigLMfPqzAZ/TJK4fw6tHh
	Q1ag7WVW/2jT6cCECVy+PYFxlrXjIsWzSNaV5kBtK/haqXNzzV2uGcH1zwrYdnNnfEknWEvONLi
	moZhBXTp0qlY43Y4YUpR
X-Received: by 2002:a05:600c:4715:b0:499:cd34:f7c with SMTP id 5b1f17b1804b1-49b91c26a01mr172319715e9.5.1787982621199;
        Fri, 28 Aug 2026 22:50:21 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-015-136.77.7.pool.telefonica.de. [77.7.15.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca3e642dsm35357485e9.2.2026.08.28.22.50.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 28 Aug 2026 22:50:20 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/2] KVM: arm64: Return -EINVAL for an empty SMCCC filter range at base 0
Date: Sat, 29 Aug 2026 07:48:54 +0200
Message-Id: <20260829054856.70549-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KVM_ARM_VM_SMCCC_FILTER rejects an empty range (nr_functions == 0) with
-EINVAL for every base except 0. kvm_smccc_set_filter() only rejects a
range if its inclusive end, base + nr_functions - 1, is below base; for
base 0 that end wraps to U32_MAX, and KVM then tries to insert
[0, U32_MAX], which overlaps the reserved Arm Architecture Calls
ranges, so the attribute returns -EEXIST instead of -EINVAL.

The request is rejected either way; only the errno is wrong, so this is
a minor UAPI validation fix.

Patch 1 rejects a zero function count explicitly. Patch 2 adds the base
0 case to test_invalid_nr_functions(), which only covered a nonzero base
and therefore never caught this.

Tested on an arm64 KVM host in VHE mode running under QEMU TCG: a small
userspace reproducer gets EEXIST before patch 1 and EINVAL after it, and
the smccc_filter selftest including the new assertion passes with patch 1
applied and fails at the new assertion with EEXIST without it.

Karl Mehltretter (2):
  KVM: arm64: Return -EINVAL for an empty SMCCC filter range at base 0
  KVM: arm64: selftests: Test empty SMCCC filter range at base 0

 arch/arm64/kvm/hypercalls.c                      | 3 ++-
 tools/testing/selftests/kvm/arm64/smccc_filter.c | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)


base-commit: 548e7bcd0c5460ddcbca9600cea603ebeebf4da7
-- 
2.39.5 (Apple Git-154)

