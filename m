Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C766E22156B
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 15:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771341335; cv=none; b=LnErL5s93T0ufs4fLj0WMl9dzuPlfAnE8Idf2CpJj97xAI/iphMx6X8yl1uw+tzLw1zgBx+0bOscL4QXiG5+kkQfDbbXJkYE+fuatODREE3favkKkGk56IlL9UKmU/E2zz9yxUVmbc8FmMpnnFRrg88dlXc79QjcAN1bhaBVXto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771341335; c=relaxed/simple;
	bh=DpNNFc9XPWWBvgNO44WeTKEE00rNsn/v40cyQu/gPGE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pOWrYUXkJSdZEyqd9/ZRfj22LIqIAyrKQhy47Lh9otmLC1HAsKaPBIZpFGpYLE39pPxbXEQlD8FRLWew9cP31hfomxKI/88iXZBhGgXD9eBLRfSB5NpOWK2GCUM1VQja8is4fQ34npPSuG9f08KpJijR/5itJA/3UHAYLkDMj8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eOeRvHrd; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eOeRvHrd"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c6e18ade2c2so3057202a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 07:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771341331; x=1771946131; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HPh5d8pZ0/N2pmYYWL0hS3cj+T7x1Qno8FKMpGo1Eao=;
        b=eOeRvHrd2dEpIIC87Oc9/OLfKUZBhVoGSDeIYvh8DzhgWwi09NkPIqmzxtvEyS+0+H
         cxybSMkWH3i67aP4A3ty0ktPnYxy8m1eek6+zV0jSlQxryf2Yn5iqqJq1o9hDGP6TTZz
         GG1K3W31ctYmxEneVYTkblu+qCQeb0Q3ozJ941eXVabE1gG8pqkUfr8wfy79ZAd4yAvD
         a8YVn7XZYc0Fcebf12Qn3nZ6DgXtGh9N/UQhbYcPFCPn2ojEPEPC7uLdyzyPL7ylem8C
         vD+WHQbqCmLZmhc1FQIdZj13N8SG9FX/y4cklMuzek38GHUECMbBNieH76mOfezplKXv
         xzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771341331; x=1771946131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HPh5d8pZ0/N2pmYYWL0hS3cj+T7x1Qno8FKMpGo1Eao=;
        b=hpUj8iVZgcclb5VpEqZkSTtsN1poaMsauH3o+6StMIynq+Onef+f/tTpRqEtZXyHBS
         L//MV5Kfx/yWx1cBQ0vN2GHf9qsuIKNIgTaraZEc7nBD1TN2DjSdMD0VhG42WX9jnulX
         +vIz4jJcY4EMguFBYSQkkAqNv4I70a15FOLvuPntPOpXaeb71aRwrVP9lnyzCSx/aqLb
         KPo/BWmq4gF04ZX+kxeBdcR+EVBcBBDLMSphyQQcH2OEJhPBaSl0kqnsgnQXUW8buT96
         mLE8mi+bn1RzBNIWxlfJk7oDupfOPkyfgeV/ZWl7XzfmKfiqQwPWVNI63lo2SgBThWXG
         aOGA==
X-Forwarded-Encrypted: i=1; AJvYcCWxSyCVtV4PuEa5M/Lm52bDgJqg3rPi/JTtT4L2y9VEYH8Mh9q5KCMhS/b22/SUea+Vcra2CunNBqQhz7+0IMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzRaOI2lSksUonucQgcSAFB9eJLRZObiwh1d9ien+CBr7BtY2P
	+XCGpH5LctfP0q0eAtI6ETv+771LRTUD1su8ZzB3qAQ5nEq/dROukW8v2r67PWcGsA1Ecteg5V5
	FRqOWSg==
X-Received: from pgbcv6.prod.google.com ([2002:a05:6a02:4206:b0:c6e:2a5a:51cb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:e347:b0:35f:b243:46cb
 with SMTP id adf61e73a8af0-3946c6df211mr12345864637.12.1771341330830; Tue, 17
 Feb 2026 07:15:30 -0800 (PST)
Date: Tue, 17 Feb 2026 07:15:27 -0800
In-Reply-To: <20260217014402.2554832-1-ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260214001535.435626-1-kartikey406@gmail.com> <20260217014402.2554832-1-ackerleytng@google.com>
Message-ID: <aZSGD-EGSR3Z5Qyi@google.com>
Subject: Re: [PATCH] KVM: selftests: Test MADV_COLLAPSE on GUEST_MEMFD
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: kartikey406@gmail.com, pbonzini@redhat.com, shuah@kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, vannapurve@google.com, 
	Liam.Howlett@oracle.com, akpm@linux-foundation.org, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, david@kernel.org, dev.jain@arm.com, 
	i@maskray.me, lance.yang@linux.dev, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, lorenzo.stoakes@oracle.com, npache@redhat.com, 
	ryan.roberts@arm.com, shy828301@gmail.com, stable@vger.kernel.org, 
	syzbot+33a04338019ac7e43a44@syzkaller.appspotmail.com, ziy@nvidia.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Feb 17, 2026, Ackerley Tng wrote:
> diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
> index 618c937f3c90f..d16341a4a315d 100644
> --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> @@ -171,6 +171,77 @@ static void test_numa_allocation(int fd, size_t total_size)
>  	kvm_munmap(mem, total_size);
>  }
>  
> +static size_t getpmdsize(void)

This absolutely belongs in library/utility code.

> +{
> +	const char *path = "/sys/kernel/mm/transparent_hugepage/hpage_pmd_size";
> +	static size_t pmd_size = -1;
> +	FILE *fp;
> +
> +	if (pmd_size != -1)
> +		return pmd_size;
> +
> +	fp = fopen(path, "r");
> +	TEST_ASSERT(fp, "Couldn't open %s to read PMD size.", path);

This will likely assert on a kernel without THP support.

> +	TEST_ASSERT_EQ(fscanf(fp, "%lu", &pmd_size), 1);
> +
> +	TEST_ASSERT_EQ(fclose(fp), 0);

Please try to extend tools/testing/selftests/kvm/include/kvm_syscalls.h.

> +
> +	return pmd_size;
> +}
> +
> +static void test_collapse(struct kvm_vm *vm, uint64_t flags)
> +{
> +	const size_t pmd_size = getpmdsize();
> +	char *mem;
> +	off_t i;
> +	int fd;
> +
> +	fd = vm_create_guest_memfd(vm, pmd_size * 2,
> +				   GUEST_MEMFD_FLAG_MMAP |
> +				   GUEST_MEMFD_FLAG_INIT_SHARED);
> +
> +	/*
> +	 * Use aligned address so that MADV_COLLAPSE will not be
> +	 * filtered out early in the collapsing routine.

Please elaborate, the value below is way more magical than just being aligned.

> +	 */
> +#define ALIGNED_ADDRESS ((void *)0x4000000000UL)

Use a "const void *" instead of #define inside a function.  And use one of the
appropriate size macros, e.g.

	const void *ALIGNED_ADDRESS = (void *)(SZ_1G * <some magic value>);

But why hardcode a virtual address in the first place?  If you a specific
alignment, just allocate enough virtual memory to be able to meet those alignment
requirements.

> +	mem = mmap(ALIGNED_ADDRESS, pmd_size, PROT_READ | PROT_WRITE,
> +		   MAP_FIXED | MAP_SHARED, fd, 0);
> +	TEST_ASSERT_EQ(mem, ALIGNED_ADDRESS);
> +
> +	/*
> +	 * Use reads to populate page table to avoid setting dirty
> +	 * flag on page.
> +	 */
> +	for (i = 0; i < pmd_size; i += getpagesize())
> +		READ_ONCE(mem[i]);
> +
> +	/*
> +	 * Advising the use of huge pages in guest_memfd should be
> +	 * fine...
> +	 */
> +	TEST_ASSERT_EQ(madvise(mem, pmd_size, MADV_HUGEPAGE), 0);
> +
> +	/*
> +	 * ... but collapsing folios must not be supported to avoid
> +	 * mapping beyond shared ranges into host userspace page
> +	 * tables.
> +	 */
> +	TEST_ASSERT_EQ(madvise(mem, pmd_size, MADV_COLLAPSE), -1);
> +	TEST_ASSERT_EQ(errno, EINVAL);
> +
> +	/*
> +	 * Removing from host page tables and re-faulting should be
> +	 * fine; should not end up faulting in a collapsed/huge folio.
> +	 */
> +	TEST_ASSERT_EQ(madvise(mem, pmd_size, MADV_DONTNEED), 0);
> +	READ_ONCE(mem[0]);
> +
> +	kvm_munmap(mem, pmd_size);
> +	kvm_close(fd);
> +}
> +
>  static void test_fault_sigbus(int fd, size_t accessible_size, size_t map_size)
>  {
>  	const char val = 0xaa;
> @@ -370,6 +441,7 @@ static void __test_guest_memfd(struct kvm_vm *vm, uint64_t flags)
>  			gmem_test(mmap_supported, vm, flags);
>  			gmem_test(fault_overflow, vm, flags);
>  			gmem_test(numa_allocation, vm, flags);
> +			test_collapse(vm, flags);

Why diverge from everything else?  Yeah, the size is different, but that's easy
enough to handle.  And presumably the THP query needs to be able to fail gracefully,
so something like this?

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index 618c937f3c90..e942adae1f59 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -350,14 +350,28 @@ static void test_guest_memfd_flags(struct kvm_vm *vm)
        }
 }
 
-#define gmem_test(__test, __vm, __flags)                               \
+#define __gmem_test(__test, __vm, __flags, __size)                     \
 do {                                                                   \
-       int fd = vm_create_guest_memfd(__vm, page_size * 4, __flags);   \
+       int fd = vm_create_guest_memfd(__vm, __size, __flags);          \
                                                                        \
-       test_##__test(fd, page_size * 4);                               \
+       test_##__test(fd, __size);                                      \
        close(fd);                                                      \
 } while (0)
 
+#define gmem_test(__test, __vm, __flags)                               \
+       __gmem_test(__test, __vm, __flags, page_size * 4)
+
+#define gmem_test_huge_pmd(__test, __vm, __flags)                      \
+do {                                                                   \
+       size_t pmd_size = kvm_get_thp_pmd_size();                       \
+                                                                       \
+       if (!pmd_size)                                                  \
+               break;                                                  \
+                                                                       \
+       __gmem_test(__test, __vm, __flags, pmd_size * 2);               \
+} while (0)
+
+
 static void __test_guest_memfd(struct kvm_vm *vm, uint64_t flags)
 {
        test_create_guest_memfd_multiple(vm);

