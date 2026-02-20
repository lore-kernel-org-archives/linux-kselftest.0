Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49631316919
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 23:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771631687; cv=none; b=fHB2rPMRtRL7LI70vyJbGJreEa0LDU5Wg8bspGwMZBkI+qO3niZH9omqPSV9ABE3/jT28mjFkFckGQr3/kb4H97R9XwDj+hrGWXvklWu3ocxN5QDoPrIeKeUk9EPkSjQQd5iU0LC1gcf6hivc7tMNa9p0MqHXrjArYi6zwVTFhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771631687; c=relaxed/simple;
	bh=xQmQKRSPkBcxt00vHcqWtQXUDsYhNrAym2RYyWUg24I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WHxjofAraaLBJtoNqvMvyDT3hEcRCrdifBuc5irTdnf/59sbTYLQAXMbm9v4kkElBeyBN1IVW+/NJMYfIYqgmGvNrgjLRjawsZTp4qReMlsNG0kEgnHlrdn6zJMQUmO04AaGJWRLaoJaxKubZWko6US4kIkEhAqJf8bEmtl8C7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qoE+6pNO; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qoE+6pNO"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-824f75919f4so7778826b3a.2
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 15:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771631686; x=1772236486; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E9n+rIu6TMqcCjcRNbiRVZNUoVIfjXuiOSfksLOomjk=;
        b=qoE+6pNOvS/ZI0NNxvdrAFIf0hO7DnsYTxcfI+eyG16jewTBVNDXf/N/WGLB9CVndG
         EJfC9TldM9kDI82Nq7m6u+TxGE2JQGDM5WBUdCcb9psiha36QVquYsncNlj137DuwwvI
         X6PCVJJdM9VWu1Ytp7W+f1xToOw8W55CDHs/2EGAs1M5TdyLnSZ8wToQE0JlQt18LU/o
         kjfktnsi0YzNdA+LA+AHxA0jQqx+Lms8PgK8jp/geP5568ctBFYNbwfx4S/EQiFCv52b
         RLeHzmtr2SC/SEJsnUfawnklqxDfCmJO1iWEXibRf/5iLW/3Qj66pz3prNJMm8XebG2U
         Wiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771631686; x=1772236486;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E9n+rIu6TMqcCjcRNbiRVZNUoVIfjXuiOSfksLOomjk=;
        b=PCq3se2NsmMSoVUj0ArZAdX7suN36B68iDVXLnp9SZRSWK0v8rUzwfKoF9Xdx+JFFo
         onxcJeezTQcoj2ZstVPmYRwkD4KWTiW4ubnhG/BMRfBa6OF4cSv62la1Mzss5boxFWts
         lkSvv6jE9xiOhGZ3uoehDU6QKXk6wdXyBfTatQS9E/6Nq7DF2oJccA3empGNpIUc+GMx
         9zpWkVSag5Qya5cP1egzm3yK6O//mYJjiy8ZfXsgTDyh1oz5SH3GGuhRj/2JIT1yQTHX
         RsDDRPjgxPYhtZGmkpYXnxhCZnaq3QVgwXw3AjF4yrmtWErfy0q51Grvjk3eJplZEAL+
         lRUA==
X-Forwarded-Encrypted: i=1; AJvYcCX8pQLBVb590RBJ07YLl4yHPW/bDT/+UtY899sL2/uySXpnCBKXnJvqQFblNrnqMboZCDSALRTbDtbdm0RIzQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFBk744Cu5KwhfXNWVdyJ/vsarLzXnoV8DybFCvo8vhKv6vi6d
	+wNNlNwQSeyAHsWEcpicDt3AFHZxLNgUj/u+3UH9H8xAQt2wssMmxxsPZOlp21WX2496wzvvitM
	B0B8SZfM0LCfJF+tc2YFkGMsYpA==
X-Received: from pfbjo15.prod.google.com ([2002:a05:6a00:908f:b0:824:bfe3:b54e])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:b92:b0:81f:b3ce:17a3 with SMTP id d2e1a72fcca58-826daa20081mr1165866b3a.48.1771631685524;
 Fri, 20 Feb 2026 15:54:45 -0800 (PST)
Date: Fri, 20 Feb 2026 23:54:36 +0000
In-Reply-To: <cover.1771630983.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1771630983.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.53.0.345.g96ddfc5eaa-goog
Message-ID: <8048d04f150326d1e2231318aa9f1b3fce3e2e2c.1771630983.git.ackerleytng@google.com>
Subject: [PATCH v2 2/2] KVM: selftests: Test MADV_COLLAPSE on guest_memfd
From: Ackerley Tng <ackerleytng@google.com>
To: kartikey406@gmail.com, seanjc@google.com, pbonzini@redhat.com, 
	shuah@kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: vannapurve@google.com, Liam.Howlett@oracle.com, ackerleytng@google.com, 
	akpm@linux-foundation.org, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	david@kernel.org, dev.jain@arm.com, i@maskray.me, lance.yang@linux.dev, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	npache@redhat.com, ryan.roberts@arm.com, shy828301@gmail.com, 
	stable@vger.kernel.org, syzbot+33a04338019ac7e43a44@syzkaller.appspotmail.com, 
	ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"

guest_memfd only supports PAGE_SIZE pages, and khugepaged or MADV_COLLAPSE
collapsing pages may result in private memory regions being mapped into
host page tables.

Add test to verify that MADV_COLLAPSE fails on guest_memfd folios, and any
subsequent usage of guest_memfd memory faults in PAGE_SIZE folios. Running
this test should not result in any memory failure logs or kernel WARNings.

This selftest was added as a result of a syzbot-reported issue where
khugepaged operating on guest_memfd memory with MADV_HUGEPAGE caused the
collapse of folios, which then subsequently resulted in a WARNing.

Link: https://syzkaller.appspot.com/bug?extid=33a04338019ac7e43a44
Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../testing/selftests/kvm/guest_memfd_test.c  | 70 ++++++++++++++++++-
 1 file changed, 67 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index 618c937f3c90f..0edbc7cf6c1ad 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -171,6 +171,64 @@ static void test_numa_allocation(int fd, size_t total_size)
 	kvm_munmap(mem, total_size);
 }
 
+static void test_collapse(int fd, uint64_t flags)
+{
+	const size_t pmd_size = get_trans_hugepagesz();
+	void *reserved_addr;
+	void *aligned_addr;
+	char *mem;
+	off_t i;
+
+	/*
+	 * To even reach the point where the guest_memfd folios will
+	 * get collapsed, both the userspace address and the offset
+	 * within the guest_memfd have to be aligned to pmd_size.
+	 *
+	 * To achieve that alignment, reserve virtual address space
+	 * with regular mmap, then use MAP_FIXED to allocate memory
+	 * from a pmd_size-aligned offset (0) at a known, available
+	 * virtual address.
+	 */
+	reserved_addr = kvm_mmap(pmd_size * 2, PROT_NONE,
+				 MAP_PRIVATE | MAP_ANONYMOUS, -1);
+	aligned_addr = align_ptr_up(reserved_addr, pmd_size);
+
+	mem = mmap(aligned_addr, pmd_size, PROT_READ | PROT_WRITE,
+		   MAP_FIXED | MAP_SHARED, fd, 0);
+	TEST_ASSERT(IS_ALIGNED((u64)mem, pmd_size),
+		    "Userspace address must be aligned to PMD size.");
+
+	/*
+	 * Use reads to populate page table to avoid setting dirty
+	 * flag on page.
+	 */
+	for (i = 0; i < pmd_size; i += getpagesize())
+		READ_ONCE(mem[i]);
+
+	/*
+	 * Advising the use of huge pages in guest_memfd should be
+	 * fine...
+	 */
+	kvm_madvise(mem, pmd_size, MADV_HUGEPAGE);
+
+	/*
+	 * ... but collapsing folios must not be supported to avoid
+	 * mapping beyond shared ranges into host userspace page
+	 * tables.
+	 */
+	TEST_ASSERT_EQ(madvise(mem, pmd_size, MADV_COLLAPSE), -1);
+	TEST_ASSERT_EQ(errno, EINVAL);
+
+	/*
+	 * Removing from host page tables and re-faulting should be
+	 * fine; should not end up faulting in a collapsed/huge folio.
+	 */
+	kvm_madvise(mem, pmd_size, MADV_DONTNEED);
+	READ_ONCE(mem[0]);
+
+	kvm_munmap(reserved_addr, pmd_size * 2);
+}
+
 static void test_fault_sigbus(int fd, size_t accessible_size, size_t map_size)
 {
 	const char val = 0xaa;
@@ -350,14 +408,17 @@ static void test_guest_memfd_flags(struct kvm_vm *vm)
 	}
 }
 
-#define gmem_test(__test, __vm, __flags)				\
+#define __gmem_test(__test, __vm, __flags, __gmem_size)			\
 do {									\
-	int fd = vm_create_guest_memfd(__vm, page_size * 4, __flags);	\
+	int fd = vm_create_guest_memfd(__vm, __gmem_size, __flags);	\
 									\
-	test_##__test(fd, page_size * 4);				\
+	test_##__test(fd, __gmem_size);					\
 	close(fd);							\
 } while (0)
 
+#define gmem_test(__test, __vm, __flags) 				\
+	__gmem_test(__test, __vm, __flags, page_size * 4)
+
 static void __test_guest_memfd(struct kvm_vm *vm, uint64_t flags)
 {
 	test_create_guest_memfd_multiple(vm);
@@ -367,9 +428,12 @@ static void __test_guest_memfd(struct kvm_vm *vm, uint64_t flags)
 
 	if (flags & GUEST_MEMFD_FLAG_MMAP) {
 		if (flags & GUEST_MEMFD_FLAG_INIT_SHARED) {
+			size_t pmd_size = get_trans_hugepagesz();
+
 			gmem_test(mmap_supported, vm, flags);
 			gmem_test(fault_overflow, vm, flags);
 			gmem_test(numa_allocation, vm, flags);
+			__gmem_test(collapse, vm, flags, pmd_size);
 		} else {
 			gmem_test(fault_private, vm, flags);
 		}
-- 
2.53.0.345.g96ddfc5eaa-goog

