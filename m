Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0BF19E992
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 05:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786424440; cv=none; b=npjlfnnaHuPvDdkTUHIJF9Gpzi0a9ct1hXyTdVhPPz9uWLdg+tKxF9uXjOj4uiXRzXyEyo+xFJu06OO7NmhAO5hKtI4mX0xU3uqk6I6S79C3vvTqHjF0P6E0ds9noaOIHzobiiktoY7k3jaX+B/Fp+B0CnbVPFPhHcaVotCurO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786424440; c=relaxed/simple;
	bh=96uq6DR7meULD6e0vhzPQPh15pvpeq+zRFpv9E5X/6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k3iaO5jdd07n4ABIoXCzQozJ3JcDoEGj9M/bGUCDlNKwJsWmeGcQtwDa1Gn38FkLN8oujybD6MgHJFzT6AOhEqeFI6VZVKHjsmTObevEpfPi1PtuxBPNa+69TQv1g+DWib/f4cMgfRJRxRT75TIzBU/BhC5f8LLGQBeJAq4Ixnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYHzDPko; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYHzDPko"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caced6038eso7194465ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 22:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786424439; x=1787029239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FBt9KUApkZajktq9wAzF4z4ZyRD+OJ573CFHiv7VWA0=;
        b=iYHzDPkoHjgPlLHZDfmYvwom/bPp6Cn9Omlpl5zozv6+d7k1ftI/naWS+sMJnJ+VP0
         p/VFswwjVZxl5mGCZ7efIdvdrknGyC04MbXnRVFxribHxXTh1DAw668piiDPsYPfGzli
         sWSPfEmQdTZE0THikrA+sQ8+0bCUaCjzmJ0XkH3tOj2eaDekijprW33piUYKKr+JXCND
         VUTgayFwzkQRCN1ocvnJAo2StqPOytDqOGko6LWvoaJPFbAevjDYUEUkaxeCa2HWOHFL
         VbpdNdkiggQjK+PeHy+/Y7EuVvN+E+NSaRurB/lM7w6iA5kGoxKwr3PbUvy+1Ajcj2Nt
         9ELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786424439; x=1787029239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FBt9KUApkZajktq9wAzF4z4ZyRD+OJ573CFHiv7VWA0=;
        b=g4eJR+KSUp9y06s9Dy0eN3132fVvDZTswvkOx4fnfqtmVQfc9XTarR9oyHQ6R+NxSj
         c7M62QMqKcKgfKmArTPvReMEb+1fzmBBFmgIuFKm3bHZqV9R5dplDPEdApxrEHj7dit4
         mzyiw6E+I8E65Ww3U9H4VmnSllZnTeEdp5EPOWfBrojbuy1Pwh1YVUx0K5CDYBHkuwxl
         a9E3hMIDbgM0dedVqdqa4LlJwm6ho0TLsMbFbClieKW0sBTa4BUZk4UuwkjcNHnaNv4h
         Ym2QIPWfR5McdMxBO/ZS6zVBe9NvyODPFylVXgqVIudoRK0w2A20jW4c8MJ2cHdLDMUs
         ukeA==
X-Forwarded-Encrypted: i=1; AHgh+RrOkvAEQhdC/zFWyf/GVJnFVmSrMk6AzvFMLt55CXA7slwkNRN+QMVYeIEAQwibSvcJHJI6cl08F9tukujYrGg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Lr/8vFO13TNwR/bly2anpZdRzgUMvg+tTtBYNyiUdqlI8rjO
	xbbLcN5k/0aO4nGO4Z7VpXZVtF4Qmx4c84fG2/q8K2V7X+AM5BJ6l81t
X-Gm-Gg: AR+sD11PcYeGG2Dt3281gBHR6mpYH646ldmGY4GCF1s/EvjrunQnGGM0xf4Xfa7DTAg
	w+iLdsLDeYm2mtZENAaMQNDE82a2PeF0IlkTjNj/Ue/Ypyqbg9X2q2SemWtswZIQkT9fJB9L5oz
	muVXkxkLgDBF1RTTRuL1DhhAmpxez+C0kPsZVahimA8wlM6rSdL2iIW4PkClLLf/GwJTUbt49yb
	j/OB/3Li1khKKhzlpIl/+Kohb3JSDziJNKVdBzsn7mnYwL7/0ISmjcEhd0y6MbAxVa54MM+b5qR
	aCxYz4S5BKIZqyF7S/f5ALfYtQRNs6noFJsPXaZBeAZY1KshLwWX3aQFo6o/EAxN7cceS7MhtQM
	FAOK2VrmYCxB5rFLEM6XnEavRsFYNGOC0TzfALv7yG1zYpEtWUg8kjFg1S/zQoubIKR/zgOqjUI
	5JHducZyVolJ7Xs5TSETmm7yosz7kWq0LiuMYZ2bRKo/XWhAtjdPVmIbBhJyuEbR9hFFL+uMOAK
	Ho=
X-Received: by 2002:a17:902:f64c:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2d3187e903bmr5964185ad.7.1786424438583;
        Mon, 10 Aug 2026 22:00:38 -0700 (PDT)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c64e10011sm535444eec.28.2026.08.10.22.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 22:00:37 -0700 (PDT)
From: Gokul K <gokul02k@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] KVM: selftests: Fix two VMs leaked on early returns
Date: Tue, 11 Aug 2026 10:30:27 +0530
Message-ID: <20260811050029.530698-1-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two x86 selftests create a VM and then take an early return that skips the
kvm_vm_free() at the end of the function.  Both now jump to that existing
cleanup instead.

Patch 1 is the plain-SEV path of sev_smoke_test(), which returns straight
out of the UCALL_DONE case instead of leaving the loop.  The SEV-ES path
next to it breaks out and frees correctly.

Patch 2 is nx_huge_pages_test, which returns as soon as it has confirmed
that disabling NX huge pages is denied without CAP_SYS_BOOT.

The two patches are independent and either can be applied on its own.

Found by auditing every function under tools/testing/selftests/kvm/ that
creates a VM and later calls kvm_vm_free(), looking for returns in
between.  Seven other hits were false positives, mostly returns after
REPORT_GUEST_ASSERT() or TEST_FAIL(), which abort the process and make the
return unreachable.  Two more that do look real, in get-reg-list.c and
arm64/external_aborts.c, are left out because they belong to different
maintainers.

Compile-tested only.  This host has neither SEV (kvm_amd sev=N) nor hugetlb
configured, so both tests SKIP rather than run.

Note patch 1 touches sev_smoke_test.c, which an unrelated patch I sent
earlier also touches [1].  They modify different functions and do not
conflict in either order.

v2:
 - nx_huge_pages_test: goto the existing cleanup instead of open-coding
   kvm_vm_free() before the return, matching patch 1 (Sean)
 - Drop the claims that these paths never exercise VM teardown, and that
   the nx_huge_pages path is not obscure.  Neither justification holds
   up: teardown still happens, just at process exit, and how often a
   leaking path runs does not change whether it should be fixed (Sean)
 - Rebase onto current kvm-x86/next

[1] https://lore.kernel.org/all/20260807071026.195503-1-gokul02k@gmail.com/
v1: https://lore.kernel.org/all/20260808081050.408657-1-gokul02k@gmail.com/

Gokul K (2):
  KVM: selftests: Free the VM when the SEV smoke test's guest completes
  KVM: selftests: Free the VM when NX hugepage disabling is denied

 tools/testing/selftests/kvm/x86/nx_huge_pages_test.c | 3 ++-
 tools/testing/selftests/kvm/x86/sev_smoke_test.c     | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.54.0


