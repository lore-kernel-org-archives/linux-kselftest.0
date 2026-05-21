Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A573D7A0F
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370222; cv=pass; b=r9c7cHAr/NSDXltCvyvTTG6AzKgulPjL1T7f+e8vfhdBR2n9xbHYJ6cjc+GyzJnS9d3iEzvJTXjNUWYBiO7t0E3aekxF7KPVYUONL2Uh38C7qDncBXm4NPxD2aIgiI0GPdzSRhIkwNIOFZUCZowZPAzQHgp1aIMx9dS1PwXBYWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370222; c=relaxed/simple;
	bh=rf2fbns6mOkK4Zz993uC2XOU6G08aILoYRXzFHnjEAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bw801t2NxpQbwTC98iNh6DlIsVr2Q0dMcG7/C6vAS6ynul0f6n5Ej1UjlNy75JqLRJMm0FwuquFB9csX0ho3la3sLX0S4m2OzyjtGr9ljKMFS8sQB7bkPr+c2U4OJqCrWcagKP7gMbjt5gDcQprAe6lB0K5ZPvmILMHvxVOg3+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RTO7YWsT; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RTO7YWsT"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50e61648f10so39021cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 06:30:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779370218; cv=none;
        d=google.com; s=arc-20240605;
        b=TrOOo65idzxquOcDTusb2NCFZU8K/oJFBHBOlk9lMYKsegr2s+/9/4tC8uu/2aKzz7
         pcbHQe5XYlPrvzzU/q0qD5xszxrjE3bBPhigmFeL2KBTXtdxVn0xCFfTVwomx/XWAFBs
         6UDCbVPPPGe0D8UMcGP2Jk6z2WHAEOSsPTkCsqc9Kidx9SJNBPPst9oAZ/J9WvbkFfga
         oOZUvp3MDs7T+M2Ydfcy6+9WPDilJhWsvwGME/iIJp9KVF9mCniv3GIOIy9OSfd7XDHJ
         lMR/L4ivs1rSDypDpTZI1KiRkCIYtR1qOyCaQLrlXYW0boyniIGwtBpulYtpZyFPT+ja
         3cug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iwMA7nMY573fkX+5mD/InfckLTj4HhiPS4RhTrsDllw=;
        fh=4AB4wy+7suxLnlsUANBzhYh5whGnk4/6yJL4VEtuerQ=;
        b=SstGYnk+ZUpe5NeDU1MBibWLw4inwkVKL3PBrepofQMqfSpJ/o7pDsJ6JJChVcA1h0
         5Z2RmROAR81h8MSqtcxQWshTtDcP5EL5LG2ILdB+s9jrw2GS84ywRtM0tCBp1BKj7A1v
         Jv5LxfwUZblb7tQayylQ86MiDA4kSAaipC/HfJUUP/OuCs21KNb9M912XGPZjHlQ1/yb
         zjucnaGVKlksv7LUuK/15mpLKsUk/xJNHXvpry1dnYjLg+uTEdUqsndSuc5DVirEUYxI
         tZsA9rV9HDYzFnOfbnDFyv0yA7blPhloPiMCxXCET8E7WgvOO5Ds5SO4ff6YIaVOeCBk
         cAOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779370218; x=1779975018; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iwMA7nMY573fkX+5mD/InfckLTj4HhiPS4RhTrsDllw=;
        b=RTO7YWsTbnDeSFeAzh011MCcYOZQEReLkZZz6Tg1B8Bg5M3NYvNBJUjEu9TZpf0mkw
         y+TGvH+ZydMOZv7RSPvTR5p6jbqXeO3TzZ0g6C6E5LhZ9rKKQvi6awDHrvfR/VxVMnu5
         tiiE5K/aESAZoIdzB7NMa69VtFTyypDzLPRzclMAdtHu/m/ghPXd1kyuNjDCz2z3GR5a
         6+HV/a8IvyRxpBL5VeKwki33RaA/OrEQXWoIcTOVWKKSJGc36ZT02UePTpg3D9PEuYKv
         0D8tgIw0ZAgCloMGLbcLM3EQBir3pxHrpvlfivooDZXOyQFgQb+sw1CzOaWgCFo0+Xfo
         lwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779370218; x=1779975018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwMA7nMY573fkX+5mD/InfckLTj4HhiPS4RhTrsDllw=;
        b=Rglg1xg2q+oS9Yyno0BKz17pllAXasnSvcbRLOrVGfPyfp5/LH/MEQQNd5QMkjXcG4
         AxNrQuV0jzbfKhVeFkSUa7JFZkQNaZZx+azuUkHkMv8BJza8aU/+QiwixN/eHB/y6c2f
         IGvEmkWf84IXNT+EXxrU7ob26sqBCNPTimayja98jVCoDo4UovYRst2LTMG9Zp7y7IZD
         6HyVaegeFpheNyXtbZcmSDw6ATbD27RdQUMggYW/RpNvLogJijqR9ZrS9y8AV29AU2jU
         KKa1KSbHrsqrpKngl7KlipYpv7QA8S/yA/zaMd84VQqxqzrVeAeT9Ru7KctOslDAuTY1
         YG/A==
X-Forwarded-Encrypted: i=1; AFNElJ9FciTdrmb9WYYqNJ9ov9W5Zyx8FEW5kPQNYY4dTiXpP52D4Km2cqBmKNORcDubD0++K+ttZ1FqAwgQ8sT3zhk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaiHdeQK0CLPaT1QYD6WU0ivphwMW2aK7gsvUfYcQTQ1CiDzVv
	7hN2Fg7+6hKQ80P3S/OhUIf574KfcEw2ubWkIv1OrfOFgu1Z8Bo7pi1S3J0otgIULA+WbY/vLl3
	ReNYTU1QkFJbbDJBbWpP6w0qH0mdyekc7G02amZGH
X-Gm-Gg: Acq92OGZtMd3a1xpigwEd30sPfPziwjGXeK7gUpTLVx3Ijpx50sGXaDhy7zgrb4LDkZ
	vHhYFJ1j4OBGDJLyFdlnZkGJYyR0pDV+USfQuqH0JQlrTGFMBRWdWeyEmLhtsVSwtfhBkHvZk6E
	Ir/Gsaemmd0pyFji0jarPk8eGwAR1E810ap8CmYe0jwvjyL5A4dKRuwpQOK97p2AfYLXWle3qK2
	Yy7SC6ES94MdupUE3zdJdhHY0AljR8SVuM66Btmmc1ydynyZcf0QTgBRyci6zKcKwo11waJsjc0
	5MsTeJ1fVkJwYvzt868NM/cXEARCzg==
X-Received: by 2002:a05:622a:180f:b0:4ff:bfd9:dd31 with SMTP id
 d75a77b69052e-516c52f3a46mr9684061cf.5.1779370216975; Thu, 21 May 2026
 06:30:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-16-91ab5a8b19a4@google.com>
 <CA+EHjTxcadguOfOo7RpJVtAzcY5JAFZTbrAT_wcN6akMi8gCUg@mail.gmail.com> <ag8BmtzxTlcuA_zy@google.com>
In-Reply-To: <ag8BmtzxTlcuA_zy@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 14:29:00 +0100
X-Gm-Features: AVHnY4LwO5a6KnCwO_nS2hLkyezQ0CT4SoGe3eTfLFP9egS879lHs2YrlxKCX6M
Message-ID: <CA+EHjTwA_qOnbKhGSDxo_nbsXRqTM1zY1Jqs1drn24PTv-fNPA@mail.gmail.com>
Subject: Re: [PATCH v6 16/43] KVM: guest_memfd: Use actual size for
 invalidation in kvm_gmem_release()
To: Sean Christopherson <seanjc@google.com>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, ira.weiny@intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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

On Thu, 21 May 2026 at 13:59, Sean Christopherson <seanjc@google.com> wrote:
>
> On Thu, May 21, 2026, Fuad Tabba wrote:
> > Hi Ackerley,
> >
> > On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
> > <devnull+ackerleytng.google.com@kernel.org> wrote:
> > >
> > > From: Ackerley Tng <ackerleytng@google.com>
> > >
> > > __kvm_gmem_invalidate_begin() and __kvm_gmem_invalidate_end() actually do
> > > not specially handle -1ul. -1ul is used as a huge number, which legal
> > > indices do not exceed, and hence the invalidation works as expected.
> > >
> > > Since a later patch is going to make use of the exact range, calculate the
> > > size of the guest_memfd inode and use it as the end range for invalidating
> > > SPTEs.
> > >
> > > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> >
> > Want to look at what Sashiko has to say? Seems to be a real issue:
> >
> > https://sashiko.dev/#/patchset/20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4%40google.com?part=16
> >
> > If I understand correctly, the fix should simple: use
> > check_add_overflow() to validate the offset and size parameters in
> > kvm_gmem_bind()
> >
> >    int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> >              unsigned int fd, loff_t offset)
> >    {
> >        loff_t size = slot->npages << PAGE_SHIFT;
> >    +    loff_t end;
> >        unsigned long start, end_index;
> >        struct gmem_file *f;
> > ...
> >    -    if (offset < 0 || !PAGE_ALIGNED(offset) ||
> >    -        offset + size > i_size_read(inode))
> >    +    if (offset < 0 || !PAGE_ALIGNED(offset) ||
> >    +        check_add_overflow(offset, size, &end) ||
>
> Eww, TIL I'm not a fan of check_add_overflow().  Burying an out-param in an
> if-statement is nasty.
>
> >    +        end > i_size_read(inode))
>
> This is all rather silly.  @offset and and @slot->npages are fundamentally
> unsigned values.   I don't see any reason to convert them to signed values, only
> to convert them *back* to unsigned values (when stored in start/end, because xarrays
> operate on "unsigned long" indices).
>
> i_size_read() obviously has to return a positive value, so can't we just do this?

lgtm,
/fuad

>
> diff --git virt/kvm/guest_memfd.c virt/kvm/guest_memfd.c
> index a35a55571a2d..9c6dbb54e800 100644
> --- virt/kvm/guest_memfd.c
> +++ virt/kvm/guest_memfd.c
> @@ -640,9 +640,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
>  }
>
>  int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> -                 unsigned int fd, loff_t offset)
> +                 unsigned int fd, u64 offset)
>  {
> -       loff_t size = slot->npages << PAGE_SHIFT;
> +       u64 size = slot->npages << PAGE_SHIFT;
>         unsigned long start, end;
>         struct gmem_file *f;
>         struct inode *inode;
> @@ -664,8 +664,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
>
>         inode = file_inode(file);
>
> -       if (offset < 0 || !PAGE_ALIGNED(offset) ||
> -           offset + size > i_size_read(inode))
> +       if (!PAGE_ALIGNED(offset) || offset + size > i_size_read(inode))
>                 goto err;
>
>         filemap_invalidate_lock(inode->i_mapping);
> diff --git virt/kvm/kvm_mm.h virt/kvm/kvm_mm.h
> index 9fcc5d5b7f8d..3cb5ef86d0d9 100644
> --- virt/kvm/kvm_mm.h
> +++ virt/kvm/kvm_mm.h
> @@ -72,7 +72,7 @@ int kvm_gmem_init(struct module *module);
>  void kvm_gmem_exit(void);
>  int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args);
>  int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> -                 unsigned int fd, loff_t offset);
> +                 unsigned int fd, u64 offset);
>  void kvm_gmem_unbind(struct kvm_memory_slot *slot);
>  #else
>  static inline int kvm_gmem_init(struct module *module)
> @@ -80,9 +80,8 @@ static inline int kvm_gmem_init(struct module *module)
>         return 0;
>  }
>  static inline void kvm_gmem_exit(void) {};
> -static inline int kvm_gmem_bind(struct kvm *kvm,
> -                                        struct kvm_memory_slot *slot,
> -                                        unsigned int fd, loff_t offset)
> +static inline int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> +                               unsigned int fd, u64 offset)
>  {
>         WARN_ON_ONCE(1);
>         return -EIO;
>
