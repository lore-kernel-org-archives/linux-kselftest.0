Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A61392829
	for <linux-kselftest@vger.kernel.org>; Sat,  8 Aug 2026 08:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786176675; cv=none; b=jFSyIox36OTdm3tIX6mUWDxDzqU8ZHiSktWBRpDaDGcOvdPsLAikZn0/6+qJgG88wDIX+mHjH+tp9umVi7LoRIBUsRTQZ6rBPnXDEmCjJ/kj38eKwciWjmY/hwAD1eoMRx3HQSvBGKvyd3uXDl57GueRa3t+SwolCIl7yQeCC9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786176675; c=relaxed/simple;
	bh=lrC44I8iM/31bF4d4aI5ZoY4vfzbALhpHlYJjauf8dI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qdOHzt4DfS6ReDY2UyWUSajxy5n1pUXsSqPFgl/cLvJ7tNWlWRee1IbJ6je+PbmzkQGYJ01nbmGtUUGRdrqOam5SdRFZY9orKiSZ0GFu1bCNI7r0MXhRiiHViGBAxUHuZRLpgtvVuAbPAc88D+GtUbEogpqlsHYw/Yr9l36wpD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTBw2R30; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTBw2R30"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9aea40d799so118573a12.0
        for <linux-kselftest@vger.kernel.org>; Sat, 08 Aug 2026 01:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786176673; x=1786781473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wux81zj1Lg+H9qFJc6k3PJIeFmxAFwN6X2fCIKjgs3Q=;
        b=BTBw2R30csVw3GOoGpvRoEGzCEaaKUwTfG3930kwuMxABiZg0TxbiJnM6qTe9IJ2al
         Dog/pOsMhbJL+13DEHCgTfIIbMcKshUSeYUCDWQi0aWRGEAAYTRgAMPwuPhkOXvQJO2A
         cJlJukzY+/+gMhAl7H06JuVpzwwveRLJIwJKo44ZfjmF3PSadApJzqFffgu/RqrQhZdg
         pVzfQC/V22Yl9ztdPwKZ1i1D4Tq5uKE9B6xkSGBd6HJgTdWQgrOffYjBBqBzdewKqlzr
         BQymPEufd4r7BbQ23Ee/5u915IDZOFxz5XJoCB2ax8x5Vc0ArZ62Gtck+a8nfieRHXoB
         x9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786176673; x=1786781473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wux81zj1Lg+H9qFJc6k3PJIeFmxAFwN6X2fCIKjgs3Q=;
        b=iBJRXHOnBOIbREj4XSomxRCVefrWvXTTLNUyzDmyaa26Lc/vNaPRqLkptZ6dFEmQQA
         vqEOXmTaZl7R6o/Mo8c1A3BmOE9Sn2eIaEiS4i6L0KAVlktT3J4Bp7lmcacR30N3P/kC
         WKt6EL4YjJsnymtxC4gPdSzcbIABNe6TClAef2Qs6uSdfTFWqabjyip5G9qYYO8kdIZA
         36ErqIC5QUFBAsBjnoCuQxVSOEyeYuIKQiKJd5qZsPjkmMsDz2ruK+hQjaRXufEvLeIZ
         G6YxZmzxou4YyzBLrOU0CSaGlI+1Fxnoo/k9V25oFvgKodfPV53/hI/dr3GHON3Fadp1
         j9uQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtIJ2V5LTGtUPMN7CdfLoSrUYmM/Ngu9icyNxk67TxZvi642ixyUJtdjIXjBKGUcnB46coV+UFF0RWTcTkXcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTVLPe7YdOl9/getimfRcxb41ZOIi/QAsXegXXZU5gwfRb/6SJ
	iqpPnS9Ca83ADUajBhVsyu4rKJYYejc2HOAv8bVW3ygyiGGn7F4ygLcr
X-Gm-Gg: AR+sD13VM6IicFSlF8IZL7aQ07Q+EMQDC30IGBau3imolfDBS/+NadZckX6tCRUi4FB
	Cx00v3IzcRo4iEMO+yIQ024zmyPAZR+oHf/GQ42JRSkiHEAdDanAZvVXhXyxyKd5VUNi6PlhdHy
	nGoil9BnPNKoaDk1kJ5YofhvU5TUx8uFXhSQOHdGex+pvssM1sl8D5IPHnBqWQolLNjJcVyQxw6
	0ZcfsQBy8pjUt03a1bsVDjeNUPyRWL2DCS7Q+tfVVcR7cQwmsUuQGDTwKkVLvFBKsKQGiDLSgRu
	eP6rvzaToLsPkdCii5obRE2PcnVrrhKDLCMcN5lzJOUe2xv++EqSswg/oO48abbijNlJYT/aQ0i
	YfMfBCvCj6cMZ5MrtlBtS1zbVMc2m4/Bzp63vvUivM1xaUjD/9VV8mSPzi90QurZveyDygPdw0A
	BzaivtWGV6gbCvjdCRVt4yJ67Wj8xMcdGcAjKGOjiY9O3/6uPbpWTCpcIP7NVGNpQ7OyHNm05Fd
	Q==
X-Received: by 2002:a05:6a20:430b:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3cbce8d4439mr6418307637.17.1786176673027;
        Sat, 08 Aug 2026 01:11:13 -0700 (PDT)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a754dsm15208279eec.11.2026.08.08.01.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 01:11:12 -0700 (PDT)
From: Gokul K <gokul02k@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] KVM: selftests: Fix two VMs leaked on early returns
Date: Sat,  8 Aug 2026 13:40:48 +0530
Message-ID: <20260808081050.408657-1-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two x86 selftests create a VM and then take an early return that skips the
kvm_vm_free() at the end of the function.

Patch 1 is the plain-SEV path of sev_smoke_test(), which returns straight
out of the UCALL_DONE case instead of leaving the loop.  The SEV-ES path
next to it breaks out and frees correctly.

Patch 2 is nx_huge_pages_test, which returns as soon as it has confirmed
that disabling NX huge pages is denied without CAP_SYS_BOOT.  This one is
not an unusual error path: nx_huge_pages_test.sh runs the test without
CAP_SYS_BOOT for any non-root user, so a normal run always takes it.

Neither leak causes a failure today, since the process exits shortly
afterwards.  They do mean those paths never exercise VM teardown.

The two patches are independent and either can be applied on its own.

Found by auditing every function under tools/testing/selftests/kvm/ that
creates a VM and later calls kvm_vm_free(), looking for returns in
between.  Seven other hits were false positives, mostly returns after
REPORT_GUEST_ASSERT() or TEST_FAIL(), which abort the process and make
the return unreachable.  Two more that do look real, in get-reg-list.c
and arm64/external_aborts.c, are left out here because they belong to
different maintainers.

Compile-tested only.  This host has neither SEV (kvm_amd sev=N) nor
hugetlb configured, so both tests SKIP rather than run.

Note patch 1 touches sev_smoke_test.c, which an unrelated patch I sent
earlier also touches [1].  They modify different functions, do not
conflict, and neither depends on the other.

[1] https://lore.kernel.org/all/20260807071026.195503-1-gokul02k@gmail.com/

Gokul K (2):
  KVM: selftests: Free the VM when the SEV smoke test's guest completes
  KVM: selftests: Free the VM when NX hugepage disabling is denied

 tools/testing/selftests/kvm/x86/nx_huge_pages_test.c | 1 +
 tools/testing/selftests/kvm/x86/sev_smoke_test.c     | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.54.0


