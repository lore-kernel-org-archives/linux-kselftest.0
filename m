Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B8D38F24D
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 22:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770071449; cv=none; b=G/KAsSm5wwtX9EsIGkYgSz1qZqgXJnaoxK+/Ke6585kNtGsX7DycbL0kz4dcWHGA3rpnQs1msJ7pzYwtprtiVdxlbElvn+EqT6nR3Rv7P/Y4KAbcbIMbtFEut9kYzKiaqnsScKAuoWm5rYREs1jd6jgdcDiSh6wzaq2W7EKgkSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770071449; c=relaxed/simple;
	bh=YQ7vghy6iPiCmmppyfPIjFNiGfoJTWlfU3Be8SHjUzM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M8WZs5Svj0sPVPXtRIV+O7oFiSmbnRG5N/mszwoP7NLXVsO+zfoPVmMEIE3qL0AuLUY8w4ZkJIipJ41LthdTei5PE2swF9BjzVPdFmal02lLPbgq1QICCy4Fdagral55xzylULGv4/2kCUDCZDhbzGTUNO4Ih5dJlT202VEd+4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4Z1apTp4; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4Z1apTp4"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c5539b9adbcso10173459a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 14:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770071447; x=1770676247; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IqgrZDQenyQmm0cZP5zXs+974AvbEIjqzYG83TJ833A=;
        b=4Z1apTp4muvUwooA4ntaHFar3qXIwYlA/ENbBlRu52pyzGD370uiMX7vPuDlImFdi+
         PvX2Gt3o533C1UXWNIm27AuiUJBpfTk2Athnpqc8b0r3cHw55YTPX3AZJX4XJKRCFgBC
         hgYlor2xzmoA1Ywu/eHzmPZKyKhem/9z85K+ul1Z2yaaCFebkdgv0RgYPwXoZFrDAkI9
         v7vcTQ8WzU/Qej4joeAEoknaZgn0ULBrLBDHVk353gg+5aJXwh/+a4O11hgCKelUp4s2
         rHiu1tfDvrBCIs+kMg/Oj+RDJ8N7UVtOw63L5PGGUqK6BkFONJaXvYwcUSpu65v5P/wZ
         njeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770071447; x=1770676247;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IqgrZDQenyQmm0cZP5zXs+974AvbEIjqzYG83TJ833A=;
        b=Ip27dJokM2JBSMaHfFc1recd+JQj4ATMdqkFWin7RS9/GBxB5YDai8MxHIqP+aWPBN
         Cyx2u9TlpdR07elrRalkH4XPEDVoGiDBZd/66BKkPMq8svGg+gecLaywiGDM7N4tOeMX
         m9yD00BZZKKxhePdPLTYSjIrphW0Ju8nMt6/vxcKjkFqPGfiL7fTTMVLw0PTsIR9hOBC
         6qTvH6XdgUevgkXr/0LHGRVcv8Qjk2sVHa0Wec8p6YM3rxcq+nhLxkoZtma7jGKX8E8/
         0Jijqn5Q/byiS+8eQuzNvcqoxvxgH/ohYHM4MUKtXRsVRDVsWHwfYWhz+cdZipmH3UWd
         17lQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4zWJr2m724iTvRURRzhZ+FOhiAvM6clpxDTgMf/Zjiv7JNDMTHTFFGNaHF4I8LxYyYo6tpe2mlfAvxRAVRlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKyBF3MJmHYH6WZ2yC9HZjQwtLHphM0keClK+6BbCubDJw0wpd
	19gMvvIcWmsBdxKhx0fd4yjbLrCs2PG7JcQJlzAhwer12MrMoX5QR28PFo5D3T9sX96sTEpfYju
	hrQUv94jrcKCoMgTsIGjCriIAcg==
X-Received: from pjte8.prod.google.com ([2002:a17:90a:c208:b0:352:de3b:3a0f])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6f8b:b0:366:581e:19e9 with SMTP id adf61e73a8af0-392e003b878mr12850841637.19.1770071446974;
 Mon, 02 Feb 2026 14:30:46 -0800 (PST)
Date: Mon,  2 Feb 2026 14:29:53 -0800
In-Reply-To: <cover.1770071243.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1770071243.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <5956e7349ecad58fca4e42d2c4966798b232724a.1770071243.git.ackerleytng@google.com>
Subject: [RFC PATCH v2 15/37] KVM: selftests: Add support for mmap() on
 guest_memfd in core library
From: Ackerley Tng <ackerleytng@google.com>
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	bp@alien8.de, brauner@kernel.org, chao.p.peng@intel.com, 
	chao.p.peng@linux.intel.com, chenhuacai@kernel.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, hpa@zytor.com, 
	ira.weiny@intel.com, jgg@nvidia.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, maobibo@loongson.cn, mathieu.desnoyers@efficios.com, 
	maz@kernel.org, mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	mlevitsk@redhat.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, prsampat@amd.com, qperret@google.com, 
	ricarkol@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shivankg@amd.com, shuah@kernel.org, 
	steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
	vannapurve@google.com, vbabka@suse.cz, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Sean Christopherson <seanjc@google.com>

Accept gmem_flags in vm_mem_add() to be able to create a guest_memfd within
vm_mem_add().

When vm_mem_add() is used to set up a guest_memfd for a memslot, set up the
provided (or created) gmem_fd as the fd for the user memory region. This
makes it available to be mmap()-ed from just like fds from other memory
sources. mmap() from guest_memfd using the provided gmem_flags and
gmem_offset.

Add a kvm_slot_to_fd() helper to provide convenient access to the file
descriptor of a memslot.

Update existing callers of vm_mem_add() to pass 0 for gmem_flags to
preserve existing behavior.

Signed-off-by: Sean Christopherson <seanjc@google.com>
[For guest_memfds, mmap() using gmem_offset instead of 0 all the time.]
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  |  7 ++++++-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 19 +++++++++++--------
 .../kvm/x86/private_mem_conversions_test.c    |  2 +-
 3 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 81f4355ff28a..a64aae271a6a 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -678,7 +678,7 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 				 uint32_t flags);
 void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 		uint64_t gpa, uint32_t slot, uint64_t npages, uint32_t flags,
-		int guest_memfd_fd, uint64_t guest_memfd_offset);
+		int gmem_fd, uint64_t gmem_offset, uint64_t gmem_flags);
 
 #ifndef vm_arch_has_protected_memory
 static inline bool vm_arch_has_protected_memory(struct kvm_vm *vm)
@@ -712,6 +712,11 @@ void *addr_gva2hva(struct kvm_vm *vm, vm_vaddr_t gva);
 vm_paddr_t addr_hva2gpa(struct kvm_vm *vm, void *hva);
 void *addr_gpa2alias(struct kvm_vm *vm, vm_paddr_t gpa);
 
+static inline int kvm_slot_to_fd(struct kvm_vm *vm, uint32_t slot)
+{
+	return memslot2region(vm, slot)->fd;
+}
+
 #ifndef vcpu_arch_put_guest
 #define vcpu_arch_put_guest(mem, val) do { (mem) = (val); } while (0)
 #endif
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 6daeb4f945a0..ce2b0273b26c 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -946,12 +946,13 @@ void vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint32_t flags
 /* FIXME: This thing needs to be ripped apart and rewritten. */
 void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 		uint64_t gpa, uint32_t slot, uint64_t npages, uint32_t flags,
-		int gmem_fd, uint64_t gmem_offset)
+		int gmem_fd, uint64_t gmem_offset, uint64_t gmem_flags)
 {
 	int ret;
 	struct userspace_mem_region *region;
 	size_t backing_src_pagesz = get_backing_src_pagesz(src_type);
 	size_t mem_size = npages * vm->page_size;
+	off_t mmap_offset = 0;
 	size_t alignment;
 
 	TEST_REQUIRE_SET_USER_MEMORY_REGION2();
@@ -1030,8 +1031,6 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 
 	if (flags & KVM_MEM_GUEST_MEMFD) {
 		if (gmem_fd < 0) {
-			uint32_t gmem_flags = 0;
-
 			TEST_ASSERT(!gmem_offset,
 				    "Offset must be zero when creating new guest_memfd");
 			gmem_fd = vm_create_guest_memfd(vm, mem_size, gmem_flags);
@@ -1052,13 +1051,17 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 	}
 
 	region->fd = -1;
-	if (backing_src_is_shared(src_type))
+	if (flags & KVM_MEM_GUEST_MEMFD && gmem_flags & GUEST_MEMFD_FLAG_MMAP) {
+		region->fd = kvm_dup(gmem_fd);
+		mmap_offset = gmem_offset;
+	} else if (backing_src_is_shared(src_type)) {
 		region->fd = kvm_memfd_alloc(region->mmap_size,
 					     src_type == VM_MEM_SRC_SHARED_HUGETLB);
+	}
 
-	region->mmap_start = kvm_mmap(region->mmap_size, PROT_READ | PROT_WRITE,
-				      vm_mem_backing_src_alias(src_type)->flag,
-				      region->fd);
+	region->mmap_start = __kvm_mmap(region->mmap_size, PROT_READ | PROT_WRITE,
+					vm_mem_backing_src_alias(src_type)->flag,
+					region->fd, mmap_offset);
 
 	TEST_ASSERT(!is_backing_src_hugetlb(src_type) ||
 		    region->mmap_start == align_ptr_up(region->mmap_start, backing_src_pagesz),
@@ -1119,7 +1122,7 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 				 uint64_t gpa, uint32_t slot, uint64_t npages,
 				 uint32_t flags)
 {
-	vm_mem_add(vm, src_type, gpa, slot, npages, flags, -1, 0);
+	vm_mem_add(vm, src_type, gpa, slot, npages, flags, -1, 0, 0);
 }
 
 /*
diff --git a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
index 1969f4ab9b28..41f6b38f0407 100644
--- a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
+++ b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
@@ -399,7 +399,7 @@ static void test_mem_conversions(enum vm_mem_backing_src_type src_type, uint32_t
 	for (i = 0; i < nr_memslots; i++)
 		vm_mem_add(vm, src_type, BASE_DATA_GPA + slot_size * i,
 			   BASE_DATA_SLOT + i, slot_size / vm->page_size,
-			   KVM_MEM_GUEST_MEMFD, memfd, slot_size * i);
+			   KVM_MEM_GUEST_MEMFD, memfd, slot_size * i, 0);
 
 	for (i = 0; i < nr_vcpus; i++) {
 		uint64_t gpa =  BASE_DATA_GPA + i * per_cpu_size;
-- 
2.53.0.rc1.225.gd81095ad13-goog

