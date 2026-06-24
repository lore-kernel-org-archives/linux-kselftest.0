Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C7C3321DC
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 19:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328090; cv=pass; b=OwCfVDAcDhOx+ro3S93Qx1AJNwDNR2Nugb9awzzxB/i0Iz4zgR/n+TD/O86LZCA7g2PtvwMA2PMCxe74d5mbUhDYELU9i5chahxaGGSu5qFhzlVkwzNSsG81DPnOhhSM/U6nvOtR/xBOdCyPsE4Xv4x0nHdWdJSnvyD33VzsQAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328090; c=relaxed/simple;
	bh=UP+Dr5MrbTzrKOKcZX0iQlCSzBjZ6w5Lp2OCqKc9Uds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TpWZ6258hQ77NMOjZj04JZcZ2HFAablPepyRWTzOng1v1JN1NSuq2VWnAoVlPb5deSnxm828cGQlLMOnfhOQE7gl29NdF8MxdgCA1EU0TJ8ttjcAgTKJLmIcYJoxjnJnDDVDYUGY0TDRn2TTejjGTL9v1TuVLBcGkl0w8wp3SsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vyjKq4HD; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vyjKq4HD"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5177d1ff061so52921cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 12:08:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782328088; cv=none;
        d=google.com; s=arc-20260327;
        b=OwR/4Y5RQXrydz+yyGzsN1HpHsN8i4Swe23C2qZlQeg8aZvTo39Y08Qj1YAUYE4MyQ
         d5rpTBH4m9yUDTb4PWXtITDAsuUkvzy7QKHLECiC88xayiwcfuXRpFfB6VYiYAwPa9os
         FJDudKOUEwXMC8B1fx1sUaP9lTQ+k+dQbj5qPCv9KGMpemsO9p7h64TR/GUzsobXc98J
         DUQlNMkzRhwF4x4NfvHszgwKvBFLX3gfeKHWA5b8jYYQXZlUzGlUK1LWbITDDSqY28x2
         JquMb8oN28jRvp2nq8+ZiD2bYO7NF0PRK3IljyFVqTFK0/fQ6R7C2mI9t/VP4gNtzyf1
         OeNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TYok/yKaRGCFgGghY1Qu2/NCTVWG+h4PYN0XraBeOm8=;
        fh=jgoGgMYP5+n7uvDHPWiWtBqgOrLmS3IA0cg3cnjxyB4=;
        b=iKSV9XZgAPMDxpSg7INlBDbOK6TkN8pzJ9fGXzDuh9nvqhvKeBuQy9MzpLCdwcyhLK
         aE1UEBa6MxsZ3zlNvsk0eHzBLmXpd+sXVxDuR2/f2quxeBXRzLjGl+c9RtjKbSrgsSD/
         HDf6JyMWwNRUvINLEPIO+bcmocCpnHKmL8qKmcGEDYvRWuu80VHC6EiXsBnKdAxtJz1N
         I+6HTzBlo7h6F5fspLfDwlkiD3ivlgqMz0U/O8aFCXrQaD0znr5Ub2VnMpy0Yp+CFZBE
         OgrHmqYDl6BRZeoU7Uq7T74Erp/rkyYDRVwygetaSPDu8yAVp0QSrmNXoP/K6s6QkqBh
         Rmaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782328088; x=1782932888; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TYok/yKaRGCFgGghY1Qu2/NCTVWG+h4PYN0XraBeOm8=;
        b=vyjKq4HDhyOZZLC37t9qCK5n7DBNlBckmKzrCG4i30jvmigF3gC4uA3yV53d7UmnSH
         fU3di4SRXb4jZ8JnO0c/10AtnyIpfUBlsJ20bccijySXF/pLnuCpabU7elZ/xQsJ/dIJ
         Wq2Rs/QTDAWXN/IMm7OypN2q7mtv5n48pPEZcjaDX0aqMt3zr66rijgBfxY7FOpITl5g
         RXrkrOn7CcQJOjZ0R3po1ujJT4AztnZyj3Avv4EJwV4/TOo+sBefDXRON/GS4D2MoZkH
         CCzMYCV7PIJN5l3UzE+v5JAqhe2ivTik+7DWYtWmwSFoWLWIcF8TXTYjF0yEuPr6QP37
         1Wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328088; x=1782932888;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TYok/yKaRGCFgGghY1Qu2/NCTVWG+h4PYN0XraBeOm8=;
        b=EnlBgvnaWwsYMtVuHvEWcVlttopujYIcYJkndiELoos/QnaIZqJNvmGXqV4rx/avfB
         c7TzYy20BQO/5q4f7YSEzSvGDXH74EWUGfRC/N6RGp4Zz6g7nAtB102IK0skkJAyupC8
         525ZgxGGgwCMPkbdCsTT8o+NT+KybSz3iikf3kthpaIaJe5H6iTTkTcymidE2ca7rIcT
         PBR/FKJjmwgDPpUoHamGvY29ekVXGyKXTqR2/Ucbmc8IuI63EjXY4h4nHhKhFsDCXEbg
         TYaPMcxsIy4pMkIbZJgBk6lflJknGXJGSU/QSqeqohql5sLUMkrrAoiMWwSomWIpRs6S
         srFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gXWTriyusvnXiKMnMYHwWdJ8Q83o9QsUg1IL1RAi/KTQtrozDFVz+Rsy+HmPEwfxf/3VAvJsjqcL416/n2wc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkR9lNqsMKCCVFMHhHaJSc/eRsnsxHQU8EY3ya6Qf2R7S95mz1
	PjkEIFdDR73o5ezCHSz+UPfJl+TdDTHocG2tHUjBwYH1sVLU+/ij7e/HhGYSI4FJTGefKOUSsKh
	5heRNIc3/uezapSZH1mGZ7KQUAmgGFtQ/4PyAX+6R
X-Gm-Gg: AfdE7cmyl2kFooKrHXGGUsvkgjy5dgcPD5zpqtYTlKeE9vGMdIo3jJ7bqgYOy7EaMrb
	RopH9obkmKOKRvQi+3CXeK94C0d49e9e/pcchhlAu0bUXEj7K6qtElR1zj5fyTTbjpg+0TOfSmz
	Wh+ou88vcBQSuMZKZ0qCNBOKw8lih9mgdDRgEpPIppSH6DH5jqT8J/zfhZ+baOF4pdwEWL+A5oG
	HMWfbU0RiRzSzaQ4lRBAWATYy34te0+y5Y+EpObmV19RMqyM141hw4fBdHBgOI0N9pLF4ttyQ==
X-Received: by 2002:a05:622a:aa89:20b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-51a6ec225f4mr979921cf.7.1782328086856; Wed, 24 Jun 2026
 12:08:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-28-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-28-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 24 Jun 2026 20:07:29 +0100
X-Gm-Features: AVVi8Cd8t5YxMdE0Ng1SGfAxSm9nIleavoz2HxsrURbnpplSd_eJ9V_CBlxTVmc
Message-ID: <CA+EHjTwoMC3iZ=NVLCX7eypj3gwV4Ja4gLMoWsCwbXTd4980Vw@mail.gmail.com>
Subject: Re: [PATCH v8 28/46] KVM: selftests: Add support for mmap() on
 guest_memfd in core library
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 01:32, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Accept gmem_flags in vm_mem_add() to be able to create a guest_memfd within
> vm_mem_add().
>
> When vm_mem_add() is used to set up a guest_memfd for a memslot, set up the
> provided (or created) gmem_fd as the fd for the user memory region. This
> makes it available to be mmap()-ed from just like fds from other memory
> sources. mmap() from guest_memfd using the provided gmem_flags and
> gmem_offset.
>
> Add a kvm_slot_to_fd() helper to provide convenient access to the file
> descriptor of a memslot.
>
> Update existing callers of vm_mem_add() to pass 0 for gmem_flags to
> preserve existing behavior.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> [For guest_memfds, mmap() using gmem_offset instead of 0 all the time.]
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/include/kvm_util.h     |  7 +++++-
>  tools/testing/selftests/kvm/lib/kvm_util.c         | 27 ++++++++++++----------
>  .../kvm/x86/private_mem_conversions_test.c         |  2 +-
>  3 files changed, 22 insertions(+), 14 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index d4c104cb0418f..0cacf3698b259 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -700,7 +700,7 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
>                                  gpa_t gpa, u32 slot, u64 npages, u32 flags);
>  void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>                 gpa_t gpa, u32 slot, u64 npages, u32 flags,
> -               int gmem_fd, u64 gmem_offset);
> +               int gmem_fd, u64 gmem_offset, u64 gmem_flags);
>
>  #ifndef vm_arch_has_protected_memory
>  static inline bool vm_arch_has_protected_memory(struct kvm_vm *vm)
> @@ -732,6 +732,11 @@ void *addr_gva2hva(struct kvm_vm *vm, gva_t gva);
>  gpa_t addr_hva2gpa(struct kvm_vm *vm, void *hva);
>  void *addr_gpa2alias(struct kvm_vm *vm, gpa_t gpa);
>
> +static inline int kvm_slot_to_fd(struct kvm_vm *vm, u32 slot)
> +{
> +       return memslot2region(vm, slot)->fd;
> +}
> +
>  #ifndef vcpu_arch_put_guest
>  #define vcpu_arch_put_guest(mem, val) do { (mem) = (val); } while (0)
>  #endif
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 9b482778f7379..d5bbc80b2bf1c 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -978,12 +978,13 @@ void vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>  /* FIXME: This thing needs to be ripped apart and rewritten. */
>  void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>                 gpa_t gpa, u32 slot, u64 npages, u32 flags,
> -               int gmem_fd, u64 gmem_offset)
> +               int gmem_fd, u64 gmem_offset, u64 gmem_flags)
>  {
>         int ret;
>         struct userspace_mem_region *region;
>         size_t backing_src_pagesz = get_backing_src_pagesz(src_type);
>         size_t mem_size = npages * vm->page_size;
> +       off_t mmap_offset = 0;
>         size_t alignment = 1;
>
>         TEST_REQUIRE_SET_USER_MEMORY_REGION2();
> @@ -1055,8 +1056,6 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>
>         if (flags & KVM_MEM_GUEST_MEMFD) {
>                 if (gmem_fd < 0) {
> -                       u32 gmem_flags = 0;
> -
>                         TEST_ASSERT(!gmem_offset,
>                                     "Offset must be zero when creating new guest_memfd");
>                         gmem_fd = vm_create_guest_memfd(vm, mem_size, gmem_flags);
> @@ -1077,13 +1076,17 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>         }
>
>         region->fd = -1;
> -       if (backing_src_is_shared(src_type))
> +       if (flags & KVM_MEM_GUEST_MEMFD && gmem_flags & GUEST_MEMFD_FLAG_MMAP) {
> +               region->fd = kvm_dup(gmem_fd);
> +               mmap_offset = gmem_offset;
> +       } else if (backing_src_is_shared(src_type)) {
>                 region->fd = kvm_memfd_alloc(region->mmap_size,
>                                              src_type == VM_MEM_SRC_SHARED_HUGETLB);
> +       }
>
> -       region->mmap_start = kvm_mmap(region->mmap_size, PROT_READ | PROT_WRITE,
> -                                     vm_mem_backing_src_alias(src_type)->flag,
> -                                     region->fd);
> +       region->mmap_start = __kvm_mmap(region->mmap_size, PROT_READ | PROT_WRITE,
> +                                       vm_mem_backing_src_alias(src_type)->flag,
> +                                       region->fd, mmap_offset);
>
>         TEST_ASSERT(!is_backing_src_hugetlb(src_type) ||
>                     region->mmap_start == align_ptr_up(region->mmap_start, backing_src_pagesz),
> @@ -1129,10 +1132,10 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>
>         /* If shared memory, create an alias. */
>         if (region->fd >= 0) {
> -               region->mmap_alias = kvm_mmap(region->mmap_size,
> -                                             PROT_READ | PROT_WRITE,
> -                                             vm_mem_backing_src_alias(src_type)->flag,
> -                                             region->fd);
> +               region->mmap_alias = __kvm_mmap(region->mmap_size,
> +                                               PROT_READ | PROT_WRITE,
> +                                               vm_mem_backing_src_alias(src_type)->flag,
> +                                               region->fd, mmap_offset);
>
>                 /* Align host alias address */
>                 region->host_alias = align_ptr_up(region->mmap_alias, alignment);
> @@ -1143,7 +1146,7 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
>                                  enum vm_mem_backing_src_type src_type,
>                                  gpa_t gpa, u32 slot, u64 npages, u32 flags)
>  {
> -       vm_mem_add(vm, src_type, gpa, slot, npages, flags, -1, 0);
> +       vm_mem_add(vm, src_type, gpa, slot, npages, flags, -1, 0, 0);
>  }
>
>  /*
> diff --git a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
> index 1d2f5d4fd45d7..861baff201e78 100644
> --- a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
> +++ b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
> @@ -399,7 +399,7 @@ static void test_mem_conversions(enum vm_mem_backing_src_type src_type, u32 nr_v
>         for (i = 0; i < nr_memslots; i++)
>                 vm_mem_add(vm, src_type, BASE_DATA_GPA + slot_size * i,
>                            BASE_DATA_SLOT + i, slot_size / vm->page_size,
> -                          KVM_MEM_GUEST_MEMFD, memfd, slot_size * i);
> +                          KVM_MEM_GUEST_MEMFD, memfd, slot_size * i, 0);
>
>         for (i = 0; i < nr_vcpus; i++) {
>                 gpa_t gpa =  BASE_DATA_GPA + i * per_cpu_size;
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
