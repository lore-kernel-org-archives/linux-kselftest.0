Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B9D376497
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 23:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405457; cv=none; b=RFpyRYEJH9byjAuqIchAAhybWzbRGVCiViMBAWKoBDNKY0C+7peb9m2O1GD37Q/CGiqH40rmm+yHyj8xoebPmPGBqZ2N6vNtgHT6Zsb3oWnTMoJVZJ9fn30lmD/yUVEYjPNscD4k/xKv6fT4Pw3gRm0JItNnPi6LzYEziMqKFPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405457; c=relaxed/simple;
	bh=2vsQeSx+1A1q3XOu0xejVLQWVglIzn9/j5BiP/t6qxQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uUpnfSnDGx2mVosLR02N6vTtpfIOsgaTaLKFtctz218Ru7C3/k0a28Ft4prZZaU99UafK5yPU/AdyRydn+17Dryrbe+tcQE0hycYoYqJQHMSTsNBW0U/Q1jRLcQz7+ZLnB7eRmnao08A3g+s1d1kgGcKhjgb/UQ6kXxLVYlWMfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q9xVHij6; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q9xVHij6"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b458add85aso70999575ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 16:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779405454; x=1780010254; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMW2hzqKIiJOAnHmxoFNGrFaTnzCmmooxhb6UYQuxwA=;
        b=Q9xVHij680XJMG8zIDRGQWzk7VrZssf3d6QO+bX/s+QtwjvfmIL4Cc2qvWeMQY5aQA
         llI5AfKO7U28DISaJKkjFecIh9TcBqfz6Fke79RsJYK5tDV0Ttvd+e+NMZptwzuduuer
         TFfIjhr1o5PQ7yfuxmUR8CpRDu4l08St81X1cUTiQI6ikmk+DoN7ScurI2KcYrEYU/W4
         RIeEzPLW809y/c8Epdwx82QCyOfvTBXdaJTpCbairlHwM6KCgH7cQqkrY4hFdppo764Z
         KdlxwEUGdwUr2Tb+rysySj3n5IhLWNf1GvmZ7TpnXRQJBAAgJoSlB+lPevTXctTwnCVf
         XW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779405454; x=1780010254;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMW2hzqKIiJOAnHmxoFNGrFaTnzCmmooxhb6UYQuxwA=;
        b=lhq0+G60YG5dK9SNJyXKlIKjczsb95XcNSdzEq/Vzkau+agJbzs8PvL/WY9Xf77DdM
         CeaCTGzUJsgSh8xWdjjNfM7IDaYSy3ngamfoNAh8fqJPFyuN2Ev7pkZplMiXLD5KrrST
         RmoO5xPK/TC/WcJkbb7iHw738ozFBXwx1swoP3hzlHXnB0WdKLntByn4js62V3/qI4n6
         is2t7ACklEsW+HWS3KdxZFSQXTAHJnF/Bqtvx70bffAH2exKKQ+23U8GLEtCs0C8+yxE
         z5eui1yK0QbJKlsQq2GiLGWGsHN5DpSS6CWrr7c0pEGkTIhGOBq1KXoB+6FZa6EFX7zG
         ZXAA==
X-Forwarded-Encrypted: i=1; AFNElJ/OByt6GbfNNbY1qs/xw4v79Cp/rVY7ijQNLX2hwOJRjBebqeT8P+rIYLieini83nkPu/QXiymH921uoVbvDqc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxthb2HY6CbF9eEfAt0LY1bljjkE11to9+wzZclt7Cqaz6qDatq
	GCziDo0tM/imRo4djA2HYgeTiFAxAmrCsOGGA0/bZD53x25zMxo85JoTkwfHdEICYchjUeOfXIE
	Oqk/9Zg==
X-Received: from plbky6.prod.google.com ([2002:a17:902:f986:b0:2b0:b22a:e6ef])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2446:b0:2bd:2439:25e9
 with SMTP id d9443c01a7336-2beb073a217mr8724975ad.40.1779405454203; Thu, 21
 May 2026 16:17:34 -0700 (PDT)
Date: Thu, 21 May 2026 23:16:54 +0000
In-Reply-To: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779405439; l=2055;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=2vsQeSx+1A1q3XOu0xejVLQWVglIzn9/j5BiP/t6qxQ=; b=QLbF+qF+jvwNKoJMNZqmTPEK2KUYuH4T+RynDV6W9IpZjfp4BqRXn02+mT8N0u1xqWIwrE4AK
 Ll2nxFt9Q87AQQ5+lKvY9Hhrh5YRujIkDXXeae0R0//OnF0iOaEKPOM
X-Mailer: b4 0.14.3
Message-ID: <20260521-tdx-selftests-v13-v13-13-6983ae4c3a4d@google.com>
Subject: [PATCH  v13 13/22] KVM: selftests: Set first memory region as shared
 if guest_memfd
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

Set the initial state of the first memory region as shared if it is
backed by guest_memfd, so that the KVM selftest framework functions can
populate mmap()-ed guest_memfd memory the same way memory from other
memory providers are populated.

For CoCo VMs, pages that need to be private are explicitly set to
private before executing the VM.

Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 9a29540fff40..1bab7d76a59c 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -484,8 +484,10 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 	u64 nr_pages = vm_nr_pages_required(shape.mode, nr_runnable_vcpus,
 						 nr_extra_pages);
 	struct userspace_mem_region *slot0;
+	u64 gmem_flags = 0;
 	struct kvm_vm *vm;
-	int i, flags;
+	int flags = 0;
+	int i;
 
 	kvm_set_files_rlimit(nr_runnable_vcpus);
 
@@ -495,14 +497,16 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 	vm = ____vm_create(shape);
 
 	/*
-	 * Force GUEST_MEMFD for the primary memory region if necessary, e.g.
-	 * for CoCo VMs that require GUEST_MEMFD backed private memory.
+	 * Force GUEST_MEMFD for the primary memory region if necessary, and
+	 * initialize it as shared so the selftest framework can populate it
+	 * exactly like other memory providers.
 	 */
-	flags = 0;
-	if (is_guest_memfd_required(shape))
+	if (is_guest_memfd_required(shape)) {
 		flags |= KVM_MEM_GUEST_MEMFD;
+		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
+	}
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags);
+	vm_mem_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags, -1, 0, gmem_flags);
 	for (i = 0; i < NR_MEM_REGIONS; i++)
 		vm->memslots[i] = 0;
 

-- 
2.54.0.746.g67dd491aae-goog

