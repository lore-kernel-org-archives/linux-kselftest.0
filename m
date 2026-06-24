Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B90A37CD2E
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 19:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782329202; cv=pass; b=OsHyHFQ+6dXADo8QdJIYF08OdGFXcchN3LH0iqLYQOvzR8at+CZ0FIj9XBoI2v/2OVsyg1r1G0aZAWg5OGMk+4lwAbhVbXGX04BFDVwRVDWLhMmY3FCM10wvjc3CZJ2pfgw4MT5icx11nf9kbUS1mLZ+G45m5nAXXIEc4LXdLzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782329202; c=relaxed/simple;
	bh=twcHfAFi0y+ft7B9oCr1+JB4Kl9qeBvn6Oj93bDxxCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mN8QZ7yj8zldXGs3iqG2o1GLYnXqApqBUpYeKBktG4YWmBDO6Wtz9hfEzUhjUBh8+cSOuuTZnkjxxjjO6aQiTq9s+VssaWzSoDnDNqJiaXAKsWI4Rin/Sm189uSPK2hhUJPiBAGa7jRPXr1OoO5eCPkBTVeGCtvB/quBp1tY2rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MgQ7Fw79; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MgQ7Fw79"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5177d1ff061so58621cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 12:26:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782329200; cv=none;
        d=google.com; s=arc-20260327;
        b=JzPkfarvcrSjwGaNP/qXVUKJhORZBZt9vX2FOxbYPLucoTjqJ2m+LR03YcnOoTRHG2
         96wax0XcW+OgZVkfOquXGpdyG5lT1e9u/x+6zpwCvZx2HkFk5KSK7GICPCtI0cDvH3mv
         LIOo9OGrDsttx1GTaaGOFnXxqfx7YeQvFdhdU9kX0pfCMllMl3EwVwXtwwMolxcR6XDR
         U33W0dsrHS5jOQOprGNOe9DDahhtVHXyYtk2CPHg6DOL9q3/hYECi4Rn0bFcckWA7IaP
         Elxuuvs7frv8uoY5+UQbtgJQrEu+bcEueGMV0IKd0vXgFh+XpizhPFxa61/5mz3beram
         Q2Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YjWrR34fw6nkV452WVsUflbv5W3gEPx2vCWL5i8qEHs=;
        fh=3mKk94hP/1GwU0lh+PkAkjXo1QJlxrH80jc4U/VdMuE=;
        b=QjEJQDUIBpM0fbJMW2M10YB4Kh0jg3UTk7q5s9s++V58lN3cM8iSlhnur382vFr1I/
         WzKjcq6GADVyHvzSZ+Oa2SiXkIjG+CgGbgZ7DR75cQ/p7WCeLWU40etNqyaww8Ic96oP
         MdrylNAU90c3Rw1cwyeCX5tICyeAd1JiMw+C5z4dB399I0hOQbZQ2pK4L7G5Mw6u2Yt6
         9YslWPkZjudU2nShgYfTjwdigacq0ekxDrJtJw515kRbx8KVysnwxk6bG8QAtONvzp59
         HxDtM5W1Q+RQgysy5z+JqCOo3sCN3esV8EICg+CTYqN6mTrF2D9dMjWOzKBCuq1UzN34
         NXAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782329200; x=1782934000; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjWrR34fw6nkV452WVsUflbv5W3gEPx2vCWL5i8qEHs=;
        b=MgQ7Fw798vij/H05tNvvBq3PKRUwX6PUnhO3oKP52YtAhvCXKJ5DYxWv0fn2RjuX79
         74XZEzqYCkVz5rllDIOzrlOgACt9ygzwiukBgPjaCyd6nosd1mjXK3lXS9jxI2a+t6Pf
         rhRZHc6Wfi/JISDedsIFFGACUaPsZg6+yw4XmOpx25amBdHweNxSM79xMwyoY/Mg1+Lo
         nI2auJk/n5qUIsd2NHBU+5jbqphLCj+X8Z+L4TXm3gaBo4gAJjJV5e8uP8dxfwjXSniq
         e5u7dAZ3pWT149JrXUEDsOLOzDTbWwDIo6B05RJTJQBpKI3V90ss/XZ/YS+1h8+uZkc6
         t+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782329200; x=1782934000;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YjWrR34fw6nkV452WVsUflbv5W3gEPx2vCWL5i8qEHs=;
        b=J7Bom4d5ovZbugkJX0jr7QR9Iyd4HUyuikroJlgo2TT5VgIC+EPtFddhvMD0NEB/GH
         lBB7xeFzKZNvsqJe8nVUCqbYKGLrkfGpgL2JmQBy7X5HvMQGLmA6ux5wvAm6Z6/FjW0E
         7OQZss9DGAQ62YNOyWW2vqsChb4RP3kN0iwOWzPmZ+uPIV8BRyScfviwmW1wMGYLSxiG
         hoTC32EpXyeq2hGHrZpXk/5CshUc9ZtjMP0XufDi8a9qwxB+BonynTT1CeyuJLENXri+
         5MfbBwCzzM7OeIntNkCIS6GQpGRx5yMTUiMWv0Ui5cRzK17ZV3fVLffV2NMS/MKADril
         3LqA==
X-Forwarded-Encrypted: i=1; AFNElJ/tCgbzHIZ/p5xm26VCVO7HB/QdRl0789hz2dDAFRdKzgZ5md3855/KADdlUG97hvUaOwxhcAZqjhfoPp3Zb6g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7b9T8Xb5EQqnUc9Q5lCUbrOiQYCWt67WzGvf86ujrAcVLMP+E
	5BHiVd+1aUz3C36fjrB/cDSL6QD4v9QVp7VkpOjps2zz0OprQyWLbdha9XbXX2ITntRtYk+771q
	CllDmqUNopUD82Sk/4DLzQpA5nBg3rQAtFtTOfhle
X-Gm-Gg: AfdE7cm/8SuGTFDMae9aPU32Pmxm/Sexvq9vd3mypmCyatA+l4uJjT3PWqqUG+aFCq0
	0lZ1qYWoca7SMdVJ2TJOj/D5bgQ4vsBUhaChLRlADPymgSKH5pH5Wl6argz4dlPHf9cDtmLlXho
	/6E/ZdkhaKkbTpluEZ1owqihnN2I1wpV53E+ORln3fu0MhNDTLXB9ojWdCTOgSHX2ubRgZ2c9FM
	meJVx54+Jmn8R8XBsPwodKVLCUhTjrN3mfnfxXR4w1Mod6gxzoST3PxHgN21eu4UDAczO+xXjqj
	1ttOaJn0
X-Received: by 2002:a05:622a:a0b:b0:50e:38f0:ccb2 with SMTP id
 d75a77b69052e-51a6ec5b17emr1608501cf.15.1782329199083; Wed, 24 Jun 2026
 12:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-29-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-29-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 24 Jun 2026 20:26:02 +0100
X-Gm-Features: AVVi8CcGG2L_WGfgpW6JtuTQk7CHKKes1x1HHlBx2_zfm1i0mgNuuyxx0bG7ikM
Message-ID: <CA+EHjTw5dJ4HRoN5OxeKaFTgQrstUTVcb6-x3xgWEa-BBk3ZQw@mail.gmail.com>
Subject: Re: [PATCH v8 29/46] KVM: selftests: Add selftests global for guest
 memory attributes capability
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
> Add a global variable, kvm_has_gmem_attributes, to make the result of
> checking for KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES available to all tests.
>
> kvm_has_gmem_attributes is true if guest_memfd tracks memory attributes, as
> opposed to VM-level tracking.
>
> This global variable is synced to the guest for testing convenience, to
> avoid introducing subtle bugs when host/guest state is desynced.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/include/test_util.h | 2 ++
>  tools/testing/selftests/kvm/lib/kvm_util.c      | 5 +++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
> index a56271c237ae9..51287fac8138a 100644
> --- a/tools/testing/selftests/kvm/include/test_util.h
> +++ b/tools/testing/selftests/kvm/include/test_util.h
> @@ -115,6 +115,8 @@ struct guest_random_state {
>  extern u32 guest_random_seed;
>  extern struct guest_random_state guest_rng;
>
> +extern bool kvm_has_gmem_attributes;
> +
>  struct guest_random_state new_guest_random_state(u32 seed);
>  u32 guest_random_u32(struct guest_random_state *state);
>
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index d5bbc80b2bf1c..b73817f7bc803 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -24,6 +24,8 @@ u32 guest_random_seed;
>  struct guest_random_state guest_rng;
>  static u32 last_guest_seed;
>
> +bool kvm_has_gmem_attributes;
> +
>  static size_t vcpu_mmap_sz(void);
>
>  int __open_path_or_exit(const char *path, int flags, const char *enoent_help)
> @@ -521,6 +523,7 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
>         }
>         guest_rng = new_guest_random_state(guest_random_seed);
>         sync_global_to_guest(vm, guest_rng);
> +       sync_global_to_guest(vm, kvm_has_gmem_attributes);
>
>         kvm_arch_vm_post_create(vm, nr_runnable_vcpus);
>
> @@ -2286,6 +2289,8 @@ void __attribute((constructor)) kvm_selftest_init(void)
>         guest_random_seed = last_guest_seed = random();
>         pr_info("Random seed: 0x%x\n", guest_random_seed);
>
> +       kvm_has_gmem_attributes = kvm_has_cap(KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES);
> +
>         kvm_selftest_arch_init();
>  }
>
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
