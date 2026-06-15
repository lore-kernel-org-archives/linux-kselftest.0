Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E26F29B79B
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 23:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781567198; cv=pass; b=J7DzCVeNkytepPVtf1n5bR4QkSKSe3BxHMYkQgor3opd77QYXfngYArNmd75QeN4PiKJw6X0qLPPP6TAtN2vGaaPbL5jfw3mu9qcnnWTIcGpvQvScB/T8Y8hphh8d66Mza3lA2uqCv0RWW4AoSgcBzVcldCRwGQjk3ATXT/Cf74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781567198; c=relaxed/simple;
	bh=I+nWA545jB467TF+kyDxBRzn7JtAPzZzw87eodkUA64=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TNRPblhoBMlP5QF9QLgEQP0gkSYOfRscuhEKYUei4AVs5fXweOzpHhxfVDNODSdyeXjGkVk1qEq3nKpC/YyZNta0tYH28QGvx9BVh2jbAQhO7Co09dlKongFake/YNHn9Q5UtZW2QkN3s70+5PFXwUuhmUxe1Aac2VtCCKBHxVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rly6qVG+; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rly6qVG+"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-137d464c47eso2955875c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 16:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781567197; cv=none;
        d=google.com; s=arc-20240605;
        b=hS8lPc4qmCAfLx1a3Tlnr1jQRNTLpBzONdL78ysPA7aEIC2khEWGa9gf2MEpvzKUuJ
         igBIjwm8k248WkvCiqeApvrTEb1gJhi5YC8289bZFFjRb1AIg8QSnhsl+8wWZk7Wq4ZM
         MniX66ZOxWjc2kg96V03uRekLeHd4fjpRc4MO+GFD5Y5XjzVT4pLqC+1M/EBQc9sqD2C
         zQ0hOyWSdQWOsnUZAKBm0cjgrA9108yhReJLlYSauuJEcOqHMtZHUdirL9imyOOzbHtJ
         0AYEDx2HxfGBi5JbVdgSpLCeHFQbabJXxNtWgG6vPhxwkZjxcKjzqGQxH/OvJxs9yOlz
         xeZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ObEUf0E9nYIpFpN+Yp639n4XU8L7FHa7f/UlfLhBApI=;
        fh=K7HcppcX/PJdCpSsQnZ5/eOQZSU69kRMRQ0MqgPARdc=;
        b=CVfZ5zEHi57PnjUiMLwSq0Sl73fXbr7sVkcV3l+F5shqY3nfKKnSAkdNtiZC8DhZ1D
         /WobC3k16fLeLhTHg+h9w/HrcKngqm6M2LBvmtJRpg8nNsAwUQFdmpuxAo6uvGPlIDbU
         EkPDG802poIwKBW7YKdtHQGPfuP+E+nJ+pbxmnyjDpPCAsWQQb7aL5+w4R/uv6t11h+h
         KmYe/otqSRTpz8M3JWBiybJ4HY/l007XmjJ6a46jyJ7fTRCbQuolgSjt7pxXc8Ijf/kJ
         OcMGRWgg1yc5i3+Siu6Crlc4vs0l7+fXwJgwNQNeL0dlMW+9JZtPo5W9qWjMS3E2PrAp
         /mGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781567197; x=1782171997; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ObEUf0E9nYIpFpN+Yp639n4XU8L7FHa7f/UlfLhBApI=;
        b=rly6qVG+rEc97y7p1jhaWZFn3d8zaElfwB+oOC2zY40JMwUH7U1ePj0nHbZNRJ3WKC
         mog1SDUxpLbPFTw4PQbwesnVQtKSQXlMAAycbY77cThnqtTGQMGyALt7rgQCnwjjNAXC
         m4BVuJDeatlGDTByUCvlfi4aS7dCh0n7+iBrk9nP3BxfYcEpeei19l+ZuZ3LLgEpL7ek
         wgm2x1dVEgtgrXa+gMw4KQXTMvo1F9Aw9Iq4uVT7xovP/hccDSsfTJBiugI8KD58p9ee
         RkbyishiJ5jazgJcwjDVJjfwlMsSKxpFuokxveEeNpJXMfTHe+YT+ZMOXIZ8LcPx0Hbm
         N0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781567197; x=1782171997;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObEUf0E9nYIpFpN+Yp639n4XU8L7FHa7f/UlfLhBApI=;
        b=Ld3ahQNr/vON8aI+Cths/cXJyqCPhg4EOrJZ7bEbeZQTPMB0J8EOdHtIEH5zLUQLbj
         FmYAMGO7oCrTiV/7LJ4Y2BwCLsZ+uT0HUKwWhKRuDVbN1vdfM83jQiEwlyoNy5DkXMKn
         LJ+mK4wsOktiwhtZXnw9PCVrIPvfG9AQT8Ewr2yuQTDwRp6qSXDBCDVdFfW03WV7NllM
         8g7fBimRZAX8VyQXrsdwoNMolMYiZ4RbP0AnfDuQJ30QVsUURspVBMN2HjwQXc3l2ks3
         lywjtacpsRmI4z+AlfO87HtYNJhxaLNZBBoVi9QMhUw4rOWDtnfr7RSO2/s35fYZPXO7
         zOnw==
X-Forwarded-Encrypted: i=1; AFNElJ/7Eisftwxx6w06O4Hb3ujexrKhzMe8VIWo786LuGlEZylDs53ypzDlOk/Ju3RELH/8VLQ/FTnj6ejZodyCk9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YycQnV0sjOJu+vKiUeNp1xx+HvaF+iIWZDT6j4mkrqPqMOtu+PG
	9oY6INtfWXjHMFzk/bUgxrNSJJ5vcnR8TSwY8BED66RcXMDMayRMP/zwXUq6ubyi7gX4brphd5r
	p7RNPzZ8eZN3csEbwmHAxx6mC/FP55HhHYc/DSuKd
X-Gm-Gg: Acq92OEvvF+5/p6bUYxt43hPFkJLIyWZA3Fk0riVY+fZhJIg2BLvCmB68Qn2kjZTdW4
	jc239sPeQaUQOCqMjFq6Vr0qImZ5bf/Nnee6unKf03COOmqh0PJv89moiRDoLI8WjxlcNBmV1HM
	JckKxvxX9dE9P6b4UntL/sxJ3GazCndnCEV5JFryS5G9etAKzD2lBzY6Uwc8M2JS7zC1wocOsNg
	j0WMk/ZgVziJvSQqjBVHtYWdDnUVR64egj+ZRFFPjSYUH3+8vtAwDNNkXalzaVghIofC3Q2nsjo
	D5H9QsW3Dcj3fzQql8NXp5jxUIUexw1H3coOWoNfbW7LTdPF9yyhC8GmFGDZ/Zp02J3h
X-Received: by 2002:a05:7022:689a:b0:138:40b4:6cf9 with SMTP id
 a92af1059eb24-139858102f4mr725236c88.19.1781567195936; Mon, 15 Jun 2026
 16:46:35 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 16:46:35 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 16:46:35 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260521-tdx-selftests-v13-v13-13-6983ae4c3a4d@google.com>
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com> <20260521-tdx-selftests-v13-v13-13-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 15 Jun 2026 16:46:35 -0700
X-Gm-Features: AVVi8CfMUcsxFfG3l14C_ZxMq1_qiC853xZ-90KAH7coZFexwbjDcBX_tp12FV4
Message-ID: <CAEvNRgEBiivp9tOHZnFmWvF6ek-Ar-m2B+hb=-H0dgAcM2=z8Q@mail.gmail.com>
Subject: Re: [PATCH v13 13/22] KVM: selftests: Set first memory region as
 shared if guest_memfd
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
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
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> Set the initial state of the first memory region as shared if it is
> backed by guest_memfd, so that the KVM selftest framework functions can
> populate mmap()-ed guest_memfd memory the same way memory from other
> memory providers are populated.
>
> For CoCo VMs, pages that need to be private are explicitly set to
> private before executing the VM.
>
>
> [...snip...]
>
> @@ -495,14 +497,16 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
>  	vm = ____vm_create(shape);
>
>  	/*
> -	 * Force GUEST_MEMFD for the primary memory region if necessary, e.g.
> -	 * for CoCo VMs that require GUEST_MEMFD backed private memory.
> +	 * Force GUEST_MEMFD for the primary memory region if necessary, and
> +	 * initialize it as shared so the selftest framework can populate it
> +	 * exactly like other memory providers.
>  	 */
> -	flags = 0;
> -	if (is_guest_memfd_required(shape))
> +	if (is_guest_memfd_required(shape)) {
>  		flags |= KVM_MEM_GUEST_MEMFD;
> +		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
> +	}
>

Just noticed this while hacking some SNP tests.

> -	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags);
> +	vm_mem_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags, -1, 0, gmem_flags);
>  	for (i = 0; i < NR_MEM_REGIONS; i++)
>  		vm->memslots[i] = 0;
>
>
> --
> 2.54.0.746.g67dd491aae-goog

I think this patch should fully buy into in-place conversions, so we
need to also set GUEST_MEMFD_FLAG_MMAP:

@@ -483,6 +483,7 @@ struct kvm_vm *__vm_create(struct vm_shape shape,
u32 nr_runnable_vcpus,
 {
 	u64 nr_pages = vm_nr_pages_required(shape.mode, nr_runnable_vcpus,
 						 nr_extra_pages);
+	enum vm_mem_backing_src_type src_type = VM_MEM_SRC_ANONYMOUS;
 	struct userspace_mem_region *slot0;
 	u64 gmem_flags = 0;
 	struct kvm_vm *vm;
@@ -503,10 +504,16 @@ struct kvm_vm *__vm_create(struct vm_shape
shape, u32 nr_runnable_vcpus,
 	 */
 	if (is_guest_memfd_required(shape)) {
 		flags |= KVM_MEM_GUEST_MEMFD;
-		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
+		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED | GUEST_MEMFD_FLAG_MMAP;
+		/*
+		 * TODO: Clean this up together with vm_mem_add(). Use
+		 * VM_MEM_SRC_SHMEM to tell vm_mem_add() to mmap
+		 * guest_memfd with MAP_SHARED.
+		 */
+		src_type = VM_MEM_SRC_SHMEM;
 	}

-	vm_mem_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags, -1, 0,
gmem_flags);
+	vm_mem_add(vm, src_type, 0, 0, nr_pages, flags, -1, 0, gmem_flags);
 	for (i = 0; i < NR_MEM_REGIONS; i++)
 		vm->memslots[i] = 0;

The VM_MEM_SRC_SHMEM is a bit of a hack but imo that refactor should go
with another series to clean up vm_mem_add().

The above code was working for TDX because vm_mem_add() without the
guest_memfd MMAP flag would leave region->fd as -1. Without
setting src_type to VM_MEM_SRC_ANONYMOUS, the assertion in vm_mem_add()

  region->fd == -1 || backing_src_is_shared(src_type)

would pass.

tdx_init_mem_region() was called with the anonymously mmap()-ed address,
which turns out fine.

With the above change, we would also need to call tdx_init_mem_region()
with NULL for source_address.
