Received: from mta0.migadu.com (out-226.mta0.migadu.com [91.218.175.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A65A476CD2
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 10:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257635; cv=none; b=AMHN8fQHtXmffOvQk8OUThK0Q8vOi1YjsT2uiNnLoX8JgAIvVf3/tWA8B1jI9C04b/IOsynVw/GnMArWO6uuvwkUhdVf4t6MZ/s9OTq38plHXgwmVbxsgeZIXVALhviejVcNaG/bZrCycJwhUppOvMZWIz+qff1tbnVkldXMt04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257635; c=relaxed/simple;
	bh=AVdE0MD+h6o2Np6u6CwnfB0M91U/Y/LHHzhpZ1Tty+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lUMpGyX9ITZcta98DZCXlsef0GkRm0wldVI6m2DMIKQgWoRcANdE/+WW5eymq0ZWn102oCPb6hbdySaK6qwhO2pDejkSiBrlxm2/AePRA8z9EXHPsDEfD6dqwSY7r6Qmfa8cnnTLE8uF5ztMYo0OqpWJYy+/U0WO0naAMlJnb00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PG1qq73J; arc=none smtp.client-ip=91.218.175.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PG1qq73J"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AVdE0MD+h6o2Np6u6CwnfB0M91U/Y/LHHzhpZ1Tty+I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788257630; v=1; x=1788862430;
 b=PG1qq73J/gbFs2XAVqm2eIa3SXXB8e9HswXoJCBJUTWfzCUxMR81+m8pPiKsrZM6SVWOr1wv
 8sEFzyz/mpZCgDKMbp1Tkl23K4/o1A/gJebCLQM394no3n7trkE5uj9/r1mmyvP11smM2r4RW0f
 8bJVz/zJ25Qyh5RKjpJ18o3Y=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bf09f446172915da;
	Tue, 01 Sep 2026 10:13:50 +0000
X-Mizu-Trace-ID: bf09f446172915da
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b2a73da7e1so6500e87.0
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 03:13:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwsdQ81CirZKMENd2zlSVKMHKQ6GPWWuYYz502nYlSPYeiiCG0Le9I8tBR+0PnQ7vs8km4nfot+7rpUsKZyyk8=@vger.kernel.org
X-Gm-Message-State: AFuF++kYhSC8wTw6fb7YU4bPlTzzLZKsQiMoH3xQNlShI63wn1hFTvRL
	xp3rMNwlBgr76/YAIgdjFmEsoPLZ3NGVGGSQy9kKfTMkgPN+sDCCZtzFm+1K5z/PUIUQVY3S5xb
	WiQENo80gztUHAsJjSOKVFZ1WiB9WLqaYfvl1ZFdi
X-Received: by 2002:a05:6512:3e0c:b0:5b2:a5e9:3aba with SMTP id
 2adb3069b0e04-5b5ff28cff6mr137091e87.6.1788257629010; Tue, 01 Sep 2026
 03:13:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830-gmem-inplace-conversion-v12-0-85e5fd25252a@google.com> <20260830-gmem-inplace-conversion-v12-12-85e5fd25252a@google.com>
In-Reply-To: <20260830-gmem-inplace-conversion-v12-12-85e5fd25252a@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 1 Sep 2026 11:13:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTz5phoUdE9W_FY846p9hUSu+dGtnz4JMUFN3eRxpjVQGQ@mail.gmail.com>
X-Gm-Features: AcwNN1VxSYWT9NZrhIzgE-QIHtarTDbXrfKaWL85aQCa702UGFBp2Nv9VWlrElc
Message-ID: <CA+EHjTz5phoUdE9W_FY846p9hUSu+dGtnz4JMUFN3eRxpjVQGQ@mail.gmail.com>
Subject: Re: [PATCH v12 12/45] KVM: guest_memfd: Always fault from guest_memfd
 if in-place conversion is enabled
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 at 01:25, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> If a guest_memfd memslot is created but the guest_memfd does not have the
> GUEST_MEMFD_FLAG_MMAP set, KVM still fulfils guest faults by looking up the
> memslot's userspace_addr.
>
> Set KVM_MEMSLOT_GMEM_ONLY if in-place conversion is enabled so that the
> guest_memfd's memory will be used for both shared and private memory. With
> in-place conversion, guest_memfd will be the only backing memory for the
> memslot.
>
> No validation is performed to require userspace_addr to be a mapping from
> the associated guest_memfd because even after validation, userspace is free
> to remap something else at the provided userspace_addr.
>
> userspace_addr will still be used by functions like kvm_read_guest(), and
> if userspace_addr does not match up with the corresponding memory in the
> memslot's guest_memfd (whether userspace_addr points to the wrong offset or
> some non-guest_memfd memory, etc), that is a user error.
>
> Requiring both shared and private memory to come from the only associated
> guest_memfd simplifies invalidation in stage 2 page tables. On a PUNCH_HOLE
> operation on a guest_memfd, the invalidation is now guaranteed to be
> invalidating only memory mapped from the given guest_memfd.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad


> ---
>  Documentation/virt/kvm/api.rst | 22 ++++++++++++++--------
>  virt/kvm/guest_memfd.c         |  2 +-
>  2 files changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 90a29424c54c8..668886f50024d 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6381,10 +6381,16 @@ mapping for userspace_addr is not required to be valid/populated at the time of
>  KVM_SET_USER_MEMORY_REGION2, e.g. shared memory can be lazily mapped/allocated
>  on-demand.
>
> -When mapping a gfn into the guest, KVM selects shared vs. private, i.e consumes
> -userspace_addr vs. guest_memfd, based on the state in guest_memfd, which is the
> -sole authority on private vs. shared memory.  See :ref:`KVM_CREATE_GUEST_MEMFD`
> -to find out more about the creation-time shared/private status.
> +When mapping a gfn into the guest, guest faults are always serviced from
> +guest_memfd regardless of whether memory is shared or private.  KVM determines
> +shared vs. private based on the state in guest_memfd, which is the sole
> +authority on private vs. shared memory.  See :ref:`KVM_CREATE_GUEST_MEMFD` to
> +find out more about the creation-time shared/private status.
> +
> +userspace_addr is expected to be the mmap()-ed address corresponding to the
> +right offset within the guest_memfd. Any mismatch between userspace_addr and
> +guest_memfd is not validated and is a user error. userspace_addr is only used
> +for host-side guest accesses such as kvm_read_guest().
>
>  If in-place conversion is disabled, KVM selects shared vs. private, i.e consumes
>  userspace_addr vs. guest_memfd, based on the gfn's KVM_MEMORY_ATTRIBUTE_PRIVATE
> @@ -6490,10 +6496,10 @@ specified via KVM_CREATE_GUEST_MEMFD.  Currently defined flags:
>                                 page tables. Private memory cannot.
>    ============================ ================================================
>
> -When the KVM MMU performs a PFN lookup to service a guest fault and the backing
> -guest_memfd has the GUEST_MEMFD_FLAG_MMAP set, then the fault will always be
> -consumed from guest_memfd, regardless of whether it is a shared or a private
> -fault.
> +When the KVM MMU performs a PFN lookup to service a guest fault, the fault will
> +always be consumed from guest_memfd, regardless of whether it is a shared or a
> +private fault (unless in-place conversion is disabled and the backing
> +guest_memfd does not have the GUEST_MEMFD_FLAG_MMAP flag set).
>
>  See KVM_SET_USER_MEMORY_REGION2 for additional details.
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 0afe1468d2d9d..e41802944756b 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -746,7 +746,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
>          */
>         WRITE_ONCE(slot->gmem.file, file);
>         slot->gmem.pgoff = start;
> -       if (kvm_gmem_supports_mmap(inode))
> +       if (gmem_in_place_conversion || kvm_gmem_supports_mmap(inode))
>                 slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
>
>         xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL);
>
> --
> 2.55.0.897.gb25b4bd76c-goog
>
>
