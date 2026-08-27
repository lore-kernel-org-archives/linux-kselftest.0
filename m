Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6313644D4
	for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 04:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787805960; cv=none; b=s6YtFRD02puE8fU7UJ/0vFRJr0rDmfpU+WAWQRR3nQMMuckCQcfe1p1VCXrmGFnQRlnAw457YvZay6hEmDWoegoz+HA3UvwtL4OWe+lv5txlv0txp1KkPzFFqK5dewEyvA8hIcSOWBxyBkv++pUKIL2XMShCy3EzVUeOm+aCpvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787805960; c=relaxed/simple;
	bh=1bR0L/i/r0ruNCYRAsQhnwMGkWpHML0zh6aU/+3swc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WUe3LE7Mpf2pB5A6RC6N/fabc3L2fvHAkvqm8xydkykolHHLFUS/sPSkZTGrJiATlH1Rwmxr/sHzY3OzftuJkFJBnZJV6uKrBu59W6JkjbbxeiGjfuN5vKSybV2tsZCiMHcbSGC1Vv9wVv333MqtAGzO+dj3GsLQQ3C2bYjJL5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5sNm6Es; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5sNm6Es"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so1777155a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 21:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787805958; x=1788410758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nKSTRHENFmZ28a4EDL5zBN3EU46+ZLuR2U8w20FjDuk=;
        b=H5sNm6Es3nDLYJpKey2VsIXbU6oSJ3bEwuoMCrJxAELD3U7/MQEagbTkl90Trjnban
         Pb6NeQMpNx88yOBhq6mFxC55EUxHk9kg9Z+doRITj0wIJDpKBSa3fHiq6BNDTEcNGJ+a
         oNfXECmA3tHWQkm9KUTNt2g/AiBLsD4rj1AoUtc+xP892Zvzdkiwj2Gg69nbevQDgVE7
         qiqiwA0htM5Ymin4g64Xeg1z3Dr6xHJ8cHIGIZ2kSHdo3ZdXMt0vmde5byL9ORxpc7iV
         lAgPsb0Rc2OfhoW45BK5SDbyHSUQ/6DnKZaxSM2lRml9xV8udUrT51Ub7wilVSndBBb4
         Rcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787805958; x=1788410758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKSTRHENFmZ28a4EDL5zBN3EU46+ZLuR2U8w20FjDuk=;
        b=bO5AeC6rKJE/0DllR8LQmTRTknye8R6jVb41e031ThPcfu/vJFZxUBB+eYiGZ+Ho4X
         tX4VHNVvSGHxt3+LVKC1WmrevrtcpEseorWmu8mBb73tUeiv4BSO5/T5rWnFSkSCeXHe
         L1lhlG/lXVCeiYtxCw/lFM8J0tozunyJLxMmeTK89nLBZT9F+4/FIJNXbrWixVFNN4Dc
         3BKNraB6Ffkj0cYacKY0piyrRXK6C90Yl89grWvlqz8A/HHSynz+InQi6nx3zwEKS/Ou
         RV9sLZQAvPyobJL9Ds3xRMZAEpuvv9NZEoXFsGC4xGiMjKbS/8ZH7FIC7d1jK6Bwd7kQ
         gRxw==
X-Forwarded-Encrypted: i=1; AHgh+Rq353qEmDUEdamwQNsINK5/Ls75ChJ2c36t3QMPjw/HSnkNTandN+zZs1NQiJDhIDCK/KocQ8MYXGQFL3aFl+A=@vger.kernel.org
X-Gm-Message-State: AFuF++nQwcFGwUi3PC5IVgs70HqdwbzXcWq+Mynh7iHt95XhOAka1urM
	23/PGgMJnbpJPWWYojHsk8kLXFRnhWQwexOuKltA7Jxiv7k9RWhgupQfNFzC7tif
X-Gm-Gg: AR+sD12fkRRjoJ4Bryv6KZu0nfRSu9J2UPsHhzRABFAxpWZVlSQoKyPQp7nbEU7VsK6
	sZd0pOV9+d4NzTXWVTBLuca2droinw2GU6LBoZnMBijTP/MsQ1iP8lkFg2ZhhkWHg/ela00MJoi
	Tkcb4naY7cY9YRw+bWvHJrAPL2VQd9T3Zx+S/v5ps8/0YjBIAudq2Xk2jWNdVAo9CKrYuTQDguc
	w9+5J+BtfsGE6rHyOeHCxQZarECsvDhSl4iDuDTf2n9w8vxxI3KoQlNSYZpAhK6bkhqWjHN4D7t
	4Gw/z7t8EkcsVgMdjrYXUKOxCxJeJIV/VrbuNvXWTnUfYz38NYBjsUzns8uHvvHZnAHjFjsrl+2
	5RfwMdoIpdC/FhVSGtBcMe7ZCuFt0qZz3gnwcKXXN0fSVTX7nsF7TRcjps63sicdIsnvRPRMEtb
	a8IEgbCBpDhE7PP6LXEnaFBH2J7+KvI/X3RmkVRZPR9ZCSDrXrw515Mlls6gQF5jW6MVHadNPzJ
	grA9/woUmY=
X-Received: by 2002:a17:90b:2885:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-3966d5c1a78mr25551800a91.15.1787805957924;
        Wed, 26 Aug 2026 21:45:57 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3285a5f96efsm2270583eec.11.2026.08.26.21.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:45:57 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] KVM: selftests: Actually test PV_UNHALT
Date: Thu, 27 Aug 2026 10:15:32 +0530
Message-ID: <20260827044534.2900285-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_pv_unhalt() only checks that KVM clears KVM_FEATURE_PV_UNHALT from
guest CPUID when HLT-exiting is disabled; the feature itself has never
been exercised, hence the FIXME.  Patch 2 tests it by halting one vCPU
with interrupts disabled and kicking it from another, so that reaching the
instruction after HLT is proof that KVM_HC_KICK_CPU was delivered.

Patch 1 adds the helper that patch 2 needs to learn a vCPU's APIC ID from
the host, rather than open coding KVM_GET_LAPIC as a few tests already do.

Changes in v3:
 - Handle x2APIC in the new helper.  v2 always applied the xAPIC shift and
   mask, so it returned 0 for a vCPU in x2APIC mode on a VM that enabled
   KVM_X2APIC_API_USE_32BIT_IDS, and truncated IDs above 255.  Reported by
   the Sashiko AI reviewer.

Changes in v2:
 - Pass the APIC ID to kick in a1, not a0.  KVM reads it from a1, as the
   in-kernel guest does in kvm_kick_cpu(), so v1 asked KVM to kick APIC ID
   0 and only passed because the halting vCPU happened to be vCPU 0.
   Also reported by the Sashiko AI reviewer.
 - Halt on a vCPU with a non-zero APIC ID, so that a kick sent to the wrong
   vCPU can no longer pass by accident, and enable that vCPU's APIC, as a
   guest using PV spinlocks would: KVM only routes the kick once the vCPU
   is in the APIC map, which is also why xapic_ipi_test enables it.
 - Move the APIC ID helper into apic.h instead of keeping it private to
   the test (new patch 1).
 - Report the return value of pthread_create()/pthread_join() rather than
   errno; they return the error directly and do not set errno.

Built and run on x86_64 (AMD).  Untested on Intel, though the kick is
handled in common code and delivered through the generic LAPIC path.

The helper was checked against every way KVM reports an APIC ID, comparing
it with what the v2 version returned:

  xAPIC vcpu 0..3                     want 0..3   got 0..3    v2: 0..3
  x2APIC vcpu 0..3, legacy ID format   want 0..3   got 0..3    v2: 0..3
  x2APIC vcpu 0..3, 32-bit ID format   want 0..3   got 0..3    v2: 0 0 0 0
  x2APIC vcpu 300                      want 300    got 300     v2: 0
  guest renamed its xAPIC ID to 0x2a   want 42     got 42      v2: 42

For the test itself:

 - On kvm-x86/next, the whole selftest suite builds warning-free and
   kvm_pv_test passed 10 of 10 runs.

 - Also run inside a VM booted on a kernel built from kvm-x86/next, i.e.
   against the KVM this targets rather than the host's.

 - Whole x86 suite with the series applied: 61 passed, 24 skipped, and
   set_sregs_test failed with "KVM allowed invalid efer bit (0x100)".  That
   one fails identically without the series, i.e. it is the host kernel.

The test was checked against four deliberate breakages, to make sure it
can only pass when the kick really works:

 - pass the APIC ID in a0, i.e. the v1 bug: the kick goes to the wrong
   vCPU and the test times out, so this version does catch it;

 - drop the KVM_HC_KICK_CPU call: the halted vCPU is never resumed and the
   test times out;

 - clear PV_UNHALT from the kicking vCPU's CPUID while enforcement is on:
   the hypercall returns -KVM_ENOSYS and the test fails with

     0xfffffffffffffc18 != 0x0 (kvm_hypercall(KVM_HC_KICK_CPU, ...) != 0)

 - remove the halt: the bounded wait trips and the test fails with
   "vCPU never halted" rather than hanging.

Hemanth Selam (2):
  KVM: selftests: Add a helper to read a vCPU's APIC ID
  KVM: selftests: Test the PV_UNHALT feature, not just its CPUID bit

 tools/testing/selftests/kvm/include/x86/apic.h | 20 +++++
 tools/testing/selftests/kvm/x86/kvm_pv_test.c  | 97 +++++++++++++++++++++-
 2 files changed, 116 insertions(+), 1 deletion(-)

-- 
2.43.7

