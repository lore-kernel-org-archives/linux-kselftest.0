Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E75392811
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 22:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774563906; cv=none; b=ZEeMeEcaA1YICeFRtYoR1vWeuR0u0cMkUWUIH3X9jRm86NykWVJg5n8wGWPXuz6GGUxHhCAlWGoLcebT7r2AJZnvqC9CU6apHJtYD6GyjKH8uk0sftbTQgz4vC963KnLfXJrql2HsbOvM2dEl/oT3OGxItsCxI7TGJCQGpHF0o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774563906; c=relaxed/simple;
	bh=J0YJXMjPxx1mE3N73hm/V0s/FuuGhfZqzFLf682Q2KI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TCyyDKtu4GMhzKfaPFzU/5qJxz5kG+ZEiRVeckls/g72Ie9xtcp52bWRP4zWu4oqlSmLsZBaX7AteL+lU3We6rXZOczilDL+0RFBO5dNrHcqYZ//nm+l3os1bLy8WhNCzO02zHCU4EDVAnISKVeud9TyFbx7e844IB0KgSwFwMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p1QJ5K6n; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p1QJ5K6n"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-35c2d274b6bso295377a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 15:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774563904; x=1775168704; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N0AfLg74ibzAu140IbuS6KqPXC4lmrO5NcvdvIrpN3Y=;
        b=p1QJ5K6n2i7jEDSOJuzBQXOAY7YTVTWj9LG1VmdEaPLdlVEPe4zKcIsvnfyMf7lbOW
         FpP5stW7wARhgdGEmywgDOAek6WhG3ypJG2rE5TJYhefPQ7PXgTijBl+wKowIQD4s5Fv
         +ibZiXGsQgYXuBDVYWhOBYVTpnSltYikEuXN7IdPBoIFGSLlSlSwsBKCMS6oCNYRM6HK
         Xyw8MkCCrM/GhkQStzy0S5ywdMtVSy6qFyRYbk4bWE6FWGPz1P4Gpeijkas2iejWlXNQ
         /AJOkoe038+pZwjQMWzEXL8/NI6+/iZ/5rxuYFz9JUUaWVgq3rP6vTgxza2gTqpz9itQ
         vXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774563904; x=1775168704;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N0AfLg74ibzAu140IbuS6KqPXC4lmrO5NcvdvIrpN3Y=;
        b=ckk4bMaQ0mZEpHrsp0w8+s8tBCs06rkueT1lg1aEb5RSilP75+z+etBOGQc+nazFj9
         5DDMHAOtyQrAGuuPrwZGfDqQ3p0v7qPviMNufS2DyGWRTnsQ4MIijuepdrFedUBBwW8J
         zZcmAt7eNSSeSqqds1UDQ4I5rMwhLZ5W9wbLfbYCu+S/iB7MmG/pUSRubpIz7bSWNawO
         XMC+Y7FohPIb5MI6yHfj0cOa7AJsUwodvW4h2Pwqtgibook1cihLNRXG+ey9QrpjmEo9
         Ua2A3Cnhwb7EwMBggQpeRGJeTByz3tzoXv4Evck4siOGdfiOaSB3IPrFaQFX9IlM4TyP
         RAHw==
X-Forwarded-Encrypted: i=1; AJvYcCV+dawvEQXTBG2z7yA7Yh9oaRjcUjU+Pqy8WaaD7stXwVHnN0gaWYjJzEBYNx7sj2q5jRKbGjywKYCpQNHWSNM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdrl0iXY8YTohXLppfYnMW0h6USfaWPWYqQtrGC+E8XkL+gqYQ
	n3Fc2TvIhW+10mDyXNOaXCgHCW+CJk0RhWQpva/w6A4D+KEHz3D9PouI31QkGhW0xTZYNSGluXE
	5rZwtMHcCfzCd0rSpemtqHAN/xQ==
X-Received: from pgkk190.prod.google.com ([2002:a63:24c7:0:b0:c74:0:159])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d814:b0:35c:2c52:36fd with SMTP id 98e67ed59e1d1-35c2c52382fmr821726a91.6.1774563903368;
 Thu, 26 Mar 2026 15:25:03 -0700 (PDT)
Date: Thu, 26 Mar 2026 15:24:28 -0700
In-Reply-To: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774563861; l=5219;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=dxbgvaJqRZzv2vGZ9u5pjomGspaIbZaRbW4aKAljf7k=; b=wV0d4J61F+88MMmUOEj8SB8tpW2u2ELih6nXIkge/TuEF4oY1ccRCo7VZ9HK9VqJJRu358hu/
 9pcZhQytEw+C/MBAPE/saZD1ovxLtloKGpZJ2GX1KLWmd0vnkFDA9wg
X-Mailer: b4 0.14.3
Message-ID: <20260326-gmem-inplace-conversion-v4-19-e202fe950ffd@google.com>
Subject: [PATCH RFC v4 19/44] KVM: selftests: Rename guest_memfd{,_offset} to gmem_{fd,offset}
From: Ackerley Tng <ackerleytng@google.com>
To: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sean Christopherson <seanjc@google.com>

Rename local variables and function parameters for the guest memory file
descriptor and its offset to use a "gmem_" prefix instead of
"guest_memfd_".

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h |  6 +++---
 tools/testing/selftests/kvm/lib/kvm_util.c     | 26 +++++++++++++-------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 8b39cb919f4fc..b2d35824f2a72 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -690,10 +690,10 @@ int __vm_set_user_memory_region(struct kvm_vm *vm, uint32_t slot, uint32_t flags
 				uint64_t gpa, uint64_t size, void *hva);
 void vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
 				uint64_t gpa, uint64_t size, void *hva,
-				uint32_t guest_memfd, uint64_t guest_memfd_offset);
+				uint32_t gmem_fd, uint64_t gmem_offset);
 int __vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
 				 uint64_t gpa, uint64_t size, void *hva,
-				 uint32_t guest_memfd, uint64_t guest_memfd_offset);
+				 uint32_t gmem_fd, uint64_t gmem_offset);
 
 void vm_userspace_mem_region_add(struct kvm_vm *vm,
 				 enum vm_mem_backing_src_type src_type,
@@ -701,7 +701,7 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 				 uint32_t flags);
 void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 		uint64_t gpa, uint32_t slot, uint64_t npages, uint32_t flags,
-		int guest_memfd_fd, uint64_t guest_memfd_offset);
+		int gmem_fd, uint64_t gmem_offset);
 
 #ifndef vm_arch_has_protected_memory
 static inline bool vm_arch_has_protected_memory(struct kvm_vm *vm)
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 610cb32ff207e..3b64fbadcd88d 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -947,7 +947,7 @@ void vm_set_user_memory_region(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
 
 int __vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
 				 uint64_t gpa, uint64_t size, void *hva,
-				 uint32_t guest_memfd, uint64_t guest_memfd_offset)
+				 uint32_t gmem_fd, uint64_t gmem_offset)
 {
 	struct kvm_userspace_memory_region2 region = {
 		.slot = slot,
@@ -955,8 +955,8 @@ int __vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint32_t flag
 		.guest_phys_addr = gpa,
 		.memory_size = size,
 		.userspace_addr = (uintptr_t)hva,
-		.guest_memfd = guest_memfd,
-		.guest_memfd_offset = guest_memfd_offset,
+		.guest_memfd = gmem_fd,
+		.guest_memfd_offset = gmem_offset,
 	};
 
 	TEST_REQUIRE_SET_USER_MEMORY_REGION2();
@@ -966,10 +966,10 @@ int __vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint32_t flag
 
 void vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
 				uint64_t gpa, uint64_t size, void *hva,
-				uint32_t guest_memfd, uint64_t guest_memfd_offset)
+				uint32_t gmem_fd, uint64_t gmem_offset)
 {
 	int ret = __vm_set_user_memory_region2(vm, slot, flags, gpa, size, hva,
-					       guest_memfd, guest_memfd_offset);
+					       gmem_fd, gmem_offset);
 
 	TEST_ASSERT(!ret, "KVM_SET_USER_MEMORY_REGION2 failed, errno = %d (%s)",
 		    errno, strerror(errno));
@@ -979,7 +979,7 @@ void vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint32_t flags
 /* FIXME: This thing needs to be ripped apart and rewritten. */
 void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 		uint64_t gpa, uint32_t slot, uint64_t npages, uint32_t flags,
-		int guest_memfd, uint64_t guest_memfd_offset)
+		int gmem_fd, uint64_t gmem_offset)
 {
 	int ret;
 	struct userspace_mem_region *region;
@@ -1062,12 +1062,12 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 		region->mmap_size += alignment;
 
 	if (flags & KVM_MEM_GUEST_MEMFD) {
-		if (guest_memfd < 0) {
-			uint32_t guest_memfd_flags = 0;
+		if (gmem_fd < 0) {
+			uint32_t gmem_flags = 0;
 
-			TEST_ASSERT(!guest_memfd_offset,
+			TEST_ASSERT(!gmem_offset,
 				    "Offset must be zero when creating new guest_memfd");
-			guest_memfd = vm_create_guest_memfd(vm, mem_size, guest_memfd_flags);
+			gmem_fd = vm_create_guest_memfd(vm, mem_size, gmem_flags);
 		} else {
 			/*
 			 * Install a unique fd for each memslot so that the fd
@@ -1075,11 +1075,11 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 			 * needing to track if the fd is owned by the framework
 			 * or by the caller.
 			 */
-			guest_memfd = kvm_dup(guest_memfd);
+			gmem_fd = kvm_dup(gmem_fd);
 		}
 
-		region->region.guest_memfd = guest_memfd;
-		region->region.guest_memfd_offset = guest_memfd_offset;
+		region->region.guest_memfd = gmem_fd;
+		region->region.guest_memfd_offset = gmem_offset;
 	} else {
 		region->region.guest_memfd = -1;
 	}

-- 
2.53.0.1018.g2bb0e51243-goog

