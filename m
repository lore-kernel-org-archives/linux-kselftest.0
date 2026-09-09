Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E4A566C75
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 14:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964585; cv=pass; b=bonESq1xXd6CjUTkKTqim2KSoejt9QPuXxGCWCrqCGHphiHZn6d64SkusqEbjE+Nwdrm9YWpIJZlk4PK1LBhChO7cAFuYNvqpPnOHOWtmL5pI3gvIzE+DaiXA12L2FOcqaQZ+Z0OgJvNFOPtHW8Ws1smdIxbi7a25VMR6AZEHTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964585; c=relaxed/simple;
	bh=7AyHAWTKyqNTciVM9XLOxi3jtsvJfGFJongziGZ+beM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4BJDJvVkbVfNQy5NVcH9pfHfZFtkoqcxRG76chnsRLG24nmPkNSzspWbaId16cM4kyp1i8mB5aUb2WoGqPqdwNBaq1xrVbJ3Mlwap1xdf6wSyeHrxkHoETgZ1HEA6suJZSr4thBDaE8Pr+DZS0K6otIZRj6p2FZpboX6sYKOZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dGsiYTKa; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dGsiYTKa"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-90cc0ebbf4bso51086296d6.3
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 07:36:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788964582; cv=none;
        d=google.com; s=arc-20260327;
        b=f92p7BDGxcZ4+XX1UfYi00gI+3laRYhEFSsvPD5C74o0WOKwO6zls9fT5WKCAT/rZr
         nX4D0OmE7QEJSmoXestADu51LBAoVZFfeXC/WBm1ybQHaFDpx27j2aM+/ytM21IrQJz0
         mXKb3yono/EYaVgJUX/UVDC3M7bgYPINglBf+K42yZs+Dj+WXB+uQ9mEYXrp4UuQJVKH
         M0rsEXiEWbuMWXgiRFJQEMy8tlS+nxnwzBSa7DzlLzysXon+w9gI8W62p7D2RJsh3ZVz
         iv7aYBhdia3ewBKI2b8QHbuAgvdRSty0NFD9tXwN7A1Cjna73Bfiwjy7Cw1RCMiEKoxV
         35ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=WOdNfCxlVFqMCNwG5WAXrbnbeG8MIfsFEPI5I8fCsWw=;
        fh=YBX9m1DRH6Pw1AfEuf6tQGo1qDoNzNl1Vx0Cd0M89Rc=;
        b=Cs+1eMBYaL2x/jXJmGp2JiWM8P5wxysPeASDZJOpXPM1l3o2vWpA/Fyz6/KWggtQiy
         2zcC2EuViQPt+0d304xcS0tufCc5piE/bhk45VUIeqcxbhvQIhNJwZ/Je5OX8XiGvmv5
         gdxOcsTXvRsqKAJ8SFosOctFwCiZu9D9lnD/lAHgT1PXbjTeNl96+tdBFeGsKFMnkPDy
         Wkw1sHP5V/qm8s4lye9gn4v61O5KNbh1qrc2bUSnnsoqYMF67HZVIthQb9vFGP2bxUTq
         l4ccOKObuKDfpz4n8U5kkQX5NtOk4IsAML01ASTpwmUhU4qgEfoSOYGn7IdMbcFnA2/u
         as7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788964582; x=1789569382; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOdNfCxlVFqMCNwG5WAXrbnbeG8MIfsFEPI5I8fCsWw=;
        b=dGsiYTKaFp9FGDwKvEsAeUcOdGsL74uWemUti0nr4w33aRRJErCdwdKueOTKyD5QAJ
         JIjJ3YKQ9H32NXQen63CtE80VKgenxExiWL/Ev/1cBnKtjnJMqQvmW3q/0+CS6BeRl5y
         QYuFNrMPHAH+uboqqIpzvVcd+PcqQTVq9vi3hojyk58+7B92Gg/DHY6VZ2DIInsq9cBR
         fkR2wDtUxI2pb8qZiYYKUIq5ifPOyPhDqTR6QBmjuzp0in7cZyOKFEr4g+MoEzc3H1b+
         M2lFJkShzuoJ8Ezbui+5tOjMjTZL6WiKCYg0lSc4oA0ZGb5l5J76QdQv/3qkxmW/gcCW
         yEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964582; x=1789569382;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOdNfCxlVFqMCNwG5WAXrbnbeG8MIfsFEPI5I8fCsWw=;
        b=nK5ufBihH/wFzvTtl/diCVbHZ1D6lNGUs21uspaBfwYdOFaDFFGSI6DQqjjfX9je1N
         zQV7oATNceTYKdLSzgictJzdX+W8jp5L29g3wLM2cOECE3zFBQuVveWqzGsqmS9jxCrt
         AcMtDk7kBMeKsyYu2tltxVtF1qg4zCQYUGj/mR6PGoixWXajv6j3WCAcR2Nw6BwYU/Ct
         QRm8IqmnE4BGi6nYCu7yeRxNdXlBL7cDQ0eQNPmOUV40zn6gqcQ3NiCX3EBDyi1qEoF6
         FLvTv9hE1EJExMR0lqK4+AyQcPCycN7PjL6S4QZ3p6xpyafkTplEYyw2aC8B4j+sXZ0f
         tIUA==
X-Forwarded-Encrypted: i=1; AKwUvBzLW35TSqdT2Cj3vRM3a0nLh1PbXNIzD5B+D+uXsqb/a54fEStNgvfMIzCNSIC409fI7Kf2+YkxXgcE0Pkax8E=@vger.kernel.org
X-Gm-Message-State: AFuF++lDxzr5Mpo7w+CRrEURwtbMU2/EboTl09u20JX/1P3WpBFsYmsc
	Ih8Ad+FqPErsUChngX7g1g8QZQxp1/2R5t7xKLM4c0pRMd08oG/+eX6oAqECOT0iD1IhzI2VjTv
	BNneuuSVHzNf2ydJf33NncdBgXBL6pO3f69A7Bmeb
X-Gm-Gg: AYBFou3DEDzaMAFz3zivyXAcE7EfnTmVSs/Zgk7txbrEsVenzhIiE/w0Q9zeEvAUW6c
	srFaphN2LGUFJ3GVHXaBWqvXBDJ6qv6CKQnVWybTGqq9qDUW1hp1xLUptBpOVQAaDZOyPrYreXm
	vKddVaaagOAot4B9xg51XOgatSw63F/3Y889YyjF/OxY1roHP/kOnLmSFori6PTykRUhgjIhIsz
	J3fyDjldFUtjgM4xtysLBgNW2c92wNmeIAGmdU/FGcDjHVklL9pDhLWcRmdj2+4oUIu9/Y8uanf
	TwIqPh76JlfGZke2L6EJ7LJpIv3Ilh4Myc3lSHwFH20Qn9emiCecMeTiyZwpLUv3++StbJLr4gU
	pn2Rv1+ZeCLU=
X-Received: by 2002:a05:6214:2f8c:b0:910:3451:341 with SMTP id
 6a1803df08f44-9103efb48afmr490270826d6.32.1788964580576; Wed, 09 Sep 2026
 07:36:20 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 07:36:19 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 07:36:19 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <apetw3aqXSawLBt0@yzhao56-desk.sh.intel.com>
References: <20260830-gmem-inplace-conversion-v12-0-85e5fd25252a@google.com>
 <20260830-gmem-inplace-conversion-v12-12-85e5fd25252a@google.com> <apetw3aqXSawLBt0@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 07:36:19 -0700
X-Gm-Features: AcwNN1VdQII_SBwvozqnLJxonm84Qmsr9AHJ5M73oMtr5q_ETKWllQrAhks6iFI
Message-ID: <CAEvNRgEmO-R35susJd+U+k-nB_yFE_gfh+ACrnaOR=ECJdWGuA@mail.gmail.com>
Subject: Re: [PATCH v12 12/45] KVM: guest_memfd: Always fault from guest_memfd
 if in-place conversion is enabled
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Yan Zhao <yan.y.zhao@intel.com> writes:

> On Sun, Aug 30, 2026 at 05:25:13PM -0700, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> If a guest_memfd memslot is created but the guest_memfd does not have the
>> GUEST_MEMFD_FLAG_MMAP set, KVM still fulfils guest faults by looking up the
>> memslot's userspace_addr.
>>
>> Set KVM_MEMSLOT_GMEM_ONLY if in-place conversion is enabled so that the
>> guest_memfd's memory will be used for both shared and private memory. With
>> in-place conversion, guest_memfd will be the only backing memory for the
>> memslot.
>>
>> No validation is performed to require userspace_addr to be a mapping from
>> the associated guest_memfd because even after validation, userspace is free
>> to remap something else at the provided userspace_addr.
>>
>> userspace_addr will still be used by functions like kvm_read_guest(), and
>> if userspace_addr does not match up with the corresponding memory in the
>> memslot's guest_memfd (whether userspace_addr points to the wrong offset or
>> some non-guest_memfd memory, etc), that is a user error.
>>
>> Requiring both shared and private memory to come from the only associated
>> guest_memfd simplifies invalidation in stage 2 page tables. On a PUNCH_HOLE
>> operation on a guest_memfd, the invalidation is now guaranteed to be
>> invalidating only memory mapped from the given guest_memfd.
>>
>> Suggested-by: Sean Christopherson <seanjc@google.com>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>  Documentation/virt/kvm/api.rst | 22 ++++++++++++++--------
>>  virt/kvm/guest_memfd.c         |  2 +-
>>  2 files changed, 15 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>> index 90a29424c54c8..668886f50024d 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -6381,10 +6381,16 @@ mapping for userspace_addr is not required to be valid/populated at the time of
>>  KVM_SET_USER_MEMORY_REGION2, e.g. shared memory can be lazily mapped/allocated
>>  on-demand.
>>
>> -When mapping a gfn into the guest, KVM selects shared vs. private, i.e consumes
>> -userspace_addr vs. guest_memfd, based on the state in guest_memfd, which is the
>> -sole authority on private vs. shared memory.  See :ref:`KVM_CREATE_GUEST_MEMFD`
>> -to find out more about the creation-time shared/private status.
>> +When mapping a gfn into the guest, guest faults are always serviced from
>> +guest_memfd regardless of whether memory is shared or private.  KVM determines
>> +shared vs. private based on the state in guest_memfd, which is the sole
>> +authority on private vs. shared memory.  See :ref:`KVM_CREATE_GUEST_MEMFD` to
>> +find out more about the creation-time shared/private status.
>> +
>> +userspace_addr is expected to be the mmap()-ed address corresponding to the
>> +right offset within the guest_memfd. Any mismatch between userspace_addr and
>> +guest_memfd is not validated and is a user error. userspace_addr is only used
>> +for host-side guest accesses such as kvm_read_guest().
>>
>>  If in-place conversion is disabled, KVM selects shared vs. private, i.e consumes
>>  userspace_addr vs. guest_memfd, based on the gfn's KVM_MEMORY_ATTRIBUTE_PRIVATE
>> @@ -6490,10 +6496,10 @@ specified via KVM_CREATE_GUEST_MEMFD.  Currently defined flags:
>>                                 page tables. Private memory cannot.
>>    ============================ ================================================
>>
>> -When the KVM MMU performs a PFN lookup to service a guest fault and the backing
>> -guest_memfd has the GUEST_MEMFD_FLAG_MMAP set, then the fault will always be
>> -consumed from guest_memfd, regardless of whether it is a shared or a private
>> -fault.
>> +When the KVM MMU performs a PFN lookup to service a guest fault, the fault will
>> +always be consumed from guest_memfd, regardless of whether it is a shared or a
>> +private fault (unless in-place conversion is disabled and the backing
>> +guest_memfd does not have the GUEST_MEMFD_FLAG_MMAP flag set).
>>
>>  See KVM_SET_USER_MEMORY_REGION2 for additional details.
>>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 0afe1468d2d9d..e41802944756b 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -746,7 +746,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
>>  	 */
>>  	WRITE_ONCE(slot->gmem.file, file);
>>  	slot->gmem.pgoff = start;
>> -	if (kvm_gmem_supports_mmap(inode))
>> +	if (gmem_in_place_conversion || kvm_gmem_supports_mmap(inode))
>>  		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
> I like this change, which actually enforces in-place conversion -- when
> gmem_in_place_conversion is true, if userspace sets slot->userspace_addr to a
> different backend, the host and guest will no longer be able to access the same
> backend.
>
> However, since gmem_in_place_conversion is globally and statically specified, it
> essentially disables the coexistence of VMs using out-of-place conversions when
> gmem_in_place_conversion is true. Previously, VMs using out-of-place conversions
> could still boot successfully as long as they switched to using per-gmem memory
> attributes. Is this change intended?
>

Yes, this is intended. gmem_in_place_conversion is intended to be global
for the entire host.

> On a separate note, is kvm_gmem_supports_mmap() still a necessary requirement
> for setting KVM_MEMSLOT_GMEM_ONLY? When gmem_in_place_conversion is false, if
> userspace mmap()s the gmem but sets slot->userspace_addr to a different backend,
> should the KVM_MEMSLOT_GMEM_ONLY flag still be set?
>

Before this patch, requesting an MMAP-able gmem will set
KVM_MEMSLOT_GMEM_ONLY, so if we change that behavior, we'd be breaking
the existing contract.

If userspace requests an MMAP-able gmem and then sets up
slot->userspace_addr to something else, I think that should be
considered user error? MMAP-able => use gmem for all faults has been a
thing since before this patch.

Just like how there's no good way to check and maintain the validity of
the mapped memory behind slot->userspace_addr in relation to the
provided guest_memfd, the mapping can't be used to determine whether to
set KVM_MEMSLOT_GMEM_ONLY either.

>>
>>  	xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL);
>>
>> --
>> 2.55.0.897.gb25b4bd76c-goog
>>
>>
