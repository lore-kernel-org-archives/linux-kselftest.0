Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D97D3DC4B1
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 12:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278949; cv=pass; b=MG728Dqv01ydBO2/EqO6ulGNm6uSy2+w//EBpAzIAtwm7zFkAYbJn6aLhdggB+C3s6azyQbYdFAoYFjzU7Lk1lCt3Agh2bdz6LGTBDu0RDGaCL3DvhZGvZxMnX94soxnQoC1/XNiaqgYkibBreLcbOkpg7pykIzIcToHSG8+0KI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278949; c=relaxed/simple;
	bh=oRXMjiqgwTC/r0B+cekSleDJHDasn8/cI7Xt0wnhyII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C2HTKhROkCot6zPxiUFZ01DjeSNH5nvAWC+pIfv42P5iReleExHqDwKUBLkAIMcMPVhd36pZx5Sm0+Nl/nxZ2c059ig02ytwtOBbJXN1P+MlaqKMrFwiBzRK9qKCwv0u/JonHwjMAq+Fr2AOiVrTMLh4ZSG9zYmM6WhEJYL3HuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lxheSFPb; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lxheSFPb"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-515548f390fso971cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 05:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779278946; cv=none;
        d=google.com; s=arc-20240605;
        b=C5mWGZZ0GtZTZfpWYnXfxP/oqDhs6xRIWLJAF3HCW54BNX/Adv61Cg22Q6lhUcZQDS
         V75Fbhi8rcSV7QS/ffQ/VTqQ3PN7V0tINP/uIls9z3tIU/1jfZPLEMemRwHIwNaBiiMv
         LY+hdn22V53P8DOAF86ygVy2b9YOsef+HhDMwpwPPBM293F0qU7M6HXvpoQdIw1coAqw
         Z9HdRbxNrchTopVUtBHP9MF8egPBShVf26eiyVv5ja8pie9XOYsLIpHbqefmj18ILefx
         pWMsebNnHDjj2VrTW82nEkUt4SoS++yvD1UfWs0z9tv1v8HZPgP+hMA+GvnumO1dRCLt
         gdtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dQto/QC4w3qzIENzIqyf+q0L9QCeoBT0563P64KzKcU=;
        fh=NSvf+GSq3j81kvQ8ai6nh6cqikS5q/PyRaLg/+dGK6Q=;
        b=X2iNBWwQ0Q0eHhMqRQYRJkL3ispKuHUB0WdtStHudfhoCkKmzR6Xl6Z7RFb0QZPdTP
         iT5ApZRzI/5qD702Rw4o2UrsjfOwF1Ovg/Hjuh3P6ephtJwBVtnOB+DEYXG5olWq5u5h
         clHuN7khxPdN6bL0MuWR/Z6P33LuL2XkHOUk7iEq+rziwGq6N4/6pX5zeaRdHsU9HCLL
         T8wly/0pNp4dGL83hrlmYePCjf1jUfsBl1eCNQj4vTP4GlY4t207sBlVueALSL4QklMH
         EUJAUbBsOonv8bhkujN85aaZo7qOgFHDRe8ShKb4RRmTNMUcBXuUCqMzOYXnyqvk1HM2
         vTkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779278946; x=1779883746; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dQto/QC4w3qzIENzIqyf+q0L9QCeoBT0563P64KzKcU=;
        b=lxheSFPbLKdsf6Cw6OkNWGtPn8QgXSKey05Adunq59HegTrtjbr9qFHStJLSHc0KA5
         21lGo1fCaKOElqdUJ1X1BXc080JF2b/AbhRdiedVEIdKdgbrrhMLc1qYzXR26ENLe74l
         5PxDJo2mrp/uceeIspBuw9YhY39C2WaZDEm3NIQ4CvmG2YgJr6h2lz4EZnrO4RQPwhQ/
         Xupw3rQUxVsjlBVn4XNf2VDkLPGhc4xALhl1sX6tTPFpd+HP+H7L5+/FWST2gkhwtczp
         tfxWNpJEUtltl4j1nLFMs6iK8iIeeaSFY/kasH+jI913B9Zi5eEIlXTTzdfiwPcV29cq
         X+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779278946; x=1779883746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQto/QC4w3qzIENzIqyf+q0L9QCeoBT0563P64KzKcU=;
        b=rSMiIwuenIjF5doWaaYDT0m00xVP99P05pYY2RKNL/tYaTHhtfnwX5vVyDEM5yidFI
         y4yg9ClaPwYewrqC+khimgcrL8BoxEq+IK+jq810moipSuBZ+iOZSpXulqIZ2Lig5jcN
         u3426nBS/nVIFgNZ2wQ/0yNRB7RLpm2MMyUdmQ3ZLnoWj+Y7HZa7VoxQJC/Xr+deBA68
         D5ivLNgonkKhZtY/H/ZV88DDaglJIAA3rLNtBtx4GbvKFdAfnkKvE/sD7wXoJSp2hywc
         5kam64gXFEA2pjedBXKbdyUuHEryp8nNptvxEaXZOk/lTYRnZ0HqIhMwaX52VmCQMvmW
         n3qw==
X-Forwarded-Encrypted: i=1; AFNElJ/z82dMaduiz6cnCzQHhxJPLW+cmnzF9JqyWYJvafSNo9KE5aua38Y+7AZ4FC73qdCFaHmSA5y8Bm5k4ai1/wM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHrFhhdxQRT/AkeoTASaUdg8q2pbuneead1ieUhiGN3LdgbDUN
	zMBM31zGNqHlEbTHCzVg4z6NoeJJOO0GdcmY143JYYjHQSPKM0Yux3CXK1k923mygQTxKROw4Ia
	+mqzjGVC3Jt7y/OQDp0SpkZ7iNVLTwPhxwTWMXPcH
X-Gm-Gg: Acq92OGOxIGTkQbRsusBjniXvW9gJISJlzMUKbpVy+oVq5G4vYWX7NHhVekfkHMkzua
	i6jP7YjbcSsIZEVmAsK80lN4M+rDBtz0rI/DodpXz6zkhTHLHUBeFFNpazW2kRBpD/nfQBBg9NT
	wT9ojzm6JNzrPKNiDhuUA67+Kt+/lp3xFnzhsv0BkWQZI7gkuDCYzq2+TTP0HXzWWsAgFiZsH8W
	1rjO4e/BAu8oBuxAB5cOpGA9j3nIXzA+xY6vdCT7wluqRXhpFjk32BfNn5mWZ8sa17utnNYqnV5
	3UBh6ieT+mk1/MGx8JE=
X-Received: by 2002:a05:622a:8c5:b0:50f:ce97:3b84 with SMTP id
 d75a77b69052e-5167937f1fcmr45990921cf.6.1779278944775; Wed, 20 May 2026
 05:09:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-5-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-5-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 13:08:26 +0100
X-Gm-Features: AVHnY4Kn_wj-UY2TQuxJGnGGFJjYyy0y_byFgvzUVgqLd3Jhr51sOjcVOWq6VeM
Message-ID: <CA+EHjTw-cUM=FrJevtSDtR7K6MwUfGfOx21LMFDn7DAy5bFzYw@mail.gmail.com>
Subject: Re: [PATCH v6 05/43] KVM: guest_memfd: Wire up kvm_get_memory_attributes()
 to per-gmem attributes
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
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
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Implement kvm_gmem_get_memory_attributes() for guest_memfd to allow the KVM
> core and architecture code to query per-GFN memory attributes.
>
> kvm_gmem_get_memory_attributes() finds the memory slot for a given GFN and
> queries the guest_memfd file's to determine if the page is marked as
> private.
>
> If vm_memory_attributes is not enabled, there is no shared/private tracking
> at the VM level. Install the guest_memfd implementation as long as
> guest_memfd is enabled to give guest_memfd a chance to respond on
> attributes.
>
> guest_memfd should look up attributes regardless of whether this memslot is
> gmem-only since attributes are now tracked by gmem regardless of whether
> mmap() is enabled.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  include/linux/kvm_host.h |  2 ++
>  virt/kvm/guest_memfd.c   | 31 +++++++++++++++++++++++++++++++
>  virt/kvm/kvm_main.c      |  3 +++
>  3 files changed, 36 insertions(+)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index c5ba2cb34e45c..28a54298d27db 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2557,6 +2557,8 @@ bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
>                                          struct kvm_gfn_range *range);
>  #endif /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>
> +unsigned long kvm_gmem_get_memory_attributes(struct kvm *kvm, gfn_t gfn);
> +
>  #ifdef CONFIG_KVM_GUEST_MEMFD
>  int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>                      gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 5011d38820d0d..f055e058a3f28 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -509,6 +509,37 @@ static int kvm_gmem_mmap(struct file *file, struct vm_area_struct *vma)
>         return 0;
>  }
>
> +unsigned long kvm_gmem_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
> +{
> +       struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
> +       struct inode *inode;
> +
> +       /*
> +        * If this gfn has no associated memslot, there's no chance of the gfn
> +        * being backed by private memory, since guest_memfd must be used for
> +        * private memory, and guest_memfd must be associated with some memslot.
> +        */
> +       if (!slot)
> +               return 0;
> +
> +       CLASS(gmem_get_file, file)(slot);
> +       if (!file)
> +               return 0;
> +
> +       inode = file_inode(file);
> +
> +       /*
> +        * Rely on the maple tree's internal RCU lock to ensure a
> +        * stable result. This result can become stale as soon as the
> +        * lock is dropped, so the caller _must_ still protect
> +        * consumption of private vs. shared by checking
> +        * mmu_invalidate_retry_gfn() under mmu_lock to serialize
> +        * against ongoing attribute updates.
> +        */
> +       return kvm_gmem_get_attributes(inode, kvm_gmem_get_index(slot, gfn));
> +}

Doesn't this imply that all consumers of kvm_mem_is_private() should
validate the result using mmu_lock and the invalidation sequence?
sev_handle_rmp_fault() calls kvm_mem_is_private() without holding
mmu_lock and without any retry mechanism. Is that a problem?

Cheers,
/fuad


> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_get_memory_attributes);
> +
>  static struct file_operations kvm_gmem_fops = {
>         .mmap           = kvm_gmem_mmap,
>         .open           = generic_file_open,
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index ee26f1d9b5fda..4139e903f756a 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2653,6 +2653,9 @@ static void kvm_init_memory_attributes(void)
>         if (vm_memory_attributes)
>                 static_call_update(__kvm_get_memory_attributes,
>                                    kvm_get_vm_memory_attributes);
> +       else if (IS_ENABLED(CONFIG_KVM_GUEST_MEMFD))
> +               static_call_update(__kvm_get_memory_attributes,
> +                                  kvm_gmem_get_memory_attributes);
>         else
>                 static_call_update(__kvm_get_memory_attributes,
>                                    (void *)__static_call_return0);
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
