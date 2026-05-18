Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870DB401499
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 12:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106619; cv=pass; b=sPjhb+6R3QZKR8+oUSCmBjgnttiU/0pFPzHNXRgwIh18eYiKjTCvOeUw76voBl1a+t7fpLZMCekv1P+ncc95krSkIxQhe1CsnC1l55n7WnI56KoKKNna+IcK2hv6LDDeeZrEbl05qacDgCI9aNdFQRzTe5nov7KeB9SimJkDdWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106619; c=relaxed/simple;
	bh=GxTu0NfteCWY6YUdX16wT/N4BvT3hXjpZN7hbF/PIrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZV66G6kJF2aFdrXl5icpwu1wB588XCrZbDEUIXhMLxjyypTlHGUrVNgE+p/UIc1/mDNUFE9ctJT+9xfSy4qqFB+HEIp4tYKygiyQOJpFemIe3eKAClcBGG//eYfvOAe7/LdR8VrKlIf+Yne6GirKEoWwGK6zLFCSMW8Ocqf90bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EaU0h4jl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pJBVJPui; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EaU0h4jl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pJBVJPui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779106616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nTNxjctaqLUFv9CjPVEgJLujFyB864ku/zdpEqnLvsc=;
	b=EaU0h4jldrYE8HGaDK8xbT7CoTIiQEJ15dVJu8cZRDWbcZXXZ8fVY/1HdXUjP/uYtNdffV
	3Bo7FsjGFIAYuashqlckZcXsOeysMy//WXm93ZOSu9qV2//Cjp/InR1T90CqFLho14Bfw9
	jXAemOqa5HZn4cWuIkTE3jBvkibMM7I=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-tKyHdkcLNiGsK4ytW20U4A-1; Mon, 18 May 2026 08:16:53 -0400
X-MC-Unique: tKyHdkcLNiGsK4ytW20U4A-1
X-Mimecast-MFC-AGG-ID: tKyHdkcLNiGsK4ytW20U4A_1779106612
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7bd795b6288so25758697b3.0
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 05:16:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779106612; cv=none;
        d=google.com; s=arc-20240605;
        b=VdfEfD5CfjP9w2Strs1+lcb9qj4ntBkbRrOqzHKdI9gmfAy7T9nyV6bK7Ze1ZReAxb
         LI2HaXwdFhFRGkWzLHDnk0yJdMc5p2oxureVweBmM+4IRS5GF5W+lnudqQ6JRnzazY0q
         MY9UgdVzeDXu4iK6Q727G81yhmtGRI490qQc6M4ft5D7h5ydiB5+n0KTD4fhLGL4hBow
         7uiN44RQSqYntzgKaGaPRejYZedYwcW3788rexumxZJoAHEJQ18r2mGh8q1JFQJ3n9hk
         DlvjBqrp4lUot90BR2w/3mNL3nyqKPFzDxdKuc01SxexBgB+cyP7XZPbRbQiPgboStWp
         eGvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nTNxjctaqLUFv9CjPVEgJLujFyB864ku/zdpEqnLvsc=;
        fh=/PxEb5wDSAbZLJsFS7SOMZtQBaH/6dpRTYXC/MLLMXw=;
        b=RHQx+E2IYDXRXCtzIeNGu6AjJkLRpbR4HHRY20wLIQDfe+fqMLcM5dfwcFi+ZyHAMN
         On3nJIGULfo/M3zQlALxmc+P85Jimh2a0yO9KlH7tvJVbQekJQT+it/1/NJV32XrS5f6
         Mg/dZbyiTWPNyLHJ+d5MPW4YdWS9GhNmVPUr3XNMzABije0TODQvVli7Zkun0FlCZ4ui
         MAnJKPKWzUcNnXH5rEfgPzxF8eC3D5Ot35I0tAfaEEKjTd+EVFhnlpe7YjWWmevdWh6F
         C8LpNP3aggaCrOIQYEeFc1cafH/OmvGxtIUtUlX+fIb0nSVfMq9UXrRywjqa4E8BubGG
         w8Yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779106612; x=1779711412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTNxjctaqLUFv9CjPVEgJLujFyB864ku/zdpEqnLvsc=;
        b=pJBVJPuiJ9TppGffJ7/vAPnD/Z2mIYqgiML0AkBYA1lmD/96RwCBB8DnmO7WT60GyV
         jW3ZI87unkDZDW1xghetk6urrRbI8jcT3MHbs4F036uHvin3DbJvk0wV4UVYhrjx+7OO
         hJpJgv6Kpa+Voxr33d9/uf64uTHm3+FVc7FyztyY/lG1ypsZBNQLT4nlkOXQDotGpVvw
         /O6OQltvdVdc9xB5Yh0uKHN4cq1059lXmi/dghfpxCuqIbhEgXnMAVhwkqPbZCvdhj/0
         K25FscMl+T1/3s0pDQ1A8+NmNuixSyESlMeW/b/5L46HmwbaMFwq3CKrmfq/VEc/wZp2
         D7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779106612; x=1779711412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nTNxjctaqLUFv9CjPVEgJLujFyB864ku/zdpEqnLvsc=;
        b=QrtMePiniX/cSGNSSeaXrvfAPqNW4fsoYypJJ8EQx/wTAU7wwgdsotoN2qlpLTwisc
         OQA+iRJLFwYUvCxSqWT620idIYQtsk5R5WppiQXOxsPRhmclXn/6Zh7U6ytHhOVfa3ka
         0RE+OzRO4rpQ09lOVSAn+8oz5oE3w3NYuLwuEVsmhpNe29m83CX9EXvPh9yxWM3n0ITx
         4o608BxwRHi0IpUcFQgOEkVAqvuuHwe6eRLs6N52QY6dweZC3nphV1EaavPeGMyeha/N
         hil/y6mswuCtDJQfrtvYlbKheu1xHkEKPzZKemvnxn4pqO77C071pk6n3ImwyNj0vugZ
         hAuA==
X-Forwarded-Encrypted: i=1; AFNElJ91qdz6oIdCVUZCNtIjHI+Gb8AON8oUP8h9dSfPQ/3+E7ajWQEYAIACMNkMNhquM+PrcFzfjAk2ArtBPMdbLCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzScyWuU6MPbjYIY+FliioRnD1pPIbKcY/iBx3o73NphLYOeJib
	67BNvWo1dUDc/1YyOIZ1IjosFyw97/fLb/ltRqiEVPrRlV50QzY8ZvkADH6bjndxGnPjKxC3QoR
	np/GbwHF41Pw/NAUVQLBCcw2tqk3JluqwPMY/+v5znV2VMpv1q2zD5iomfvgv9DaBIj9vEzhUoP
	t22OLz/JMI6ZBy3hGAKfhohFjaRGW1Vs9sR8jgtay6WAyU
X-Gm-Gg: Acq92OEZL3u8twRmQM2VK8YTPL78zHLZWRAuVPWft/Z7qOBj4Zqm2CPT7+uSx43gA3b
	05itg6/z6y0MQ5Okq9pS3YYxMaOSEG2jnO1unpNERyiL3kiPrJPB0s0bFUQAOqicuHwaDwo0jLX
	+r8+2Tf5IUmj4uvVDYaFP8WLVdhGENCNWP0eEPwvdlKL+B4c+QMIlleX5qw3oK5BY+Wmumo/FwR
	lEyFg==
X-Received: by 2002:a05:690c:18:b0:79a:b440:5c8d with SMTP id 00721157ae682-7c94765b6ecmr126201117b3.11.1779106612329;
        Mon, 18 May 2026 05:16:52 -0700 (PDT)
X-Received: by 2002:a05:690c:18:b0:79a:b440:5c8d with SMTP id
 00721157ae682-7c94765b6ecmr126200267b3.11.1779106611396; Mon, 18 May 2026
 05:16:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-v2_20230123_tjmercier_google_com-v1-0-6326701c3691@redhat.com>
 <20260512-v2_20230123_tjmercier_google_com-v1-2-6326701c3691@redhat.com> <CAGsJ_4xfznffbjOaNKwnN6oZk_H6pqOzYqd1zx4Q9XrocdzV8A@mail.gmail.com>
In-Reply-To: <CAGsJ_4xfznffbjOaNKwnN6oZk_H6pqOzYqd1zx4Q9XrocdzV8A@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 18 May 2026 14:16:37 +0200
X-Gm-Features: AVHnY4KtxiMU87dVIS1J63myR0LimTeIXsyDKnE3-mVGrbnQ2cunkdBN5oMYBbg
Message-ID: <CADSE00LjJcL8P5M-UPEpzZijU70uEmUirnin29N8YR5W5D-oFg@mail.gmail.com>
Subject: Re: [PATCH RFC 2/5] dma-heap: charge dma-buf memory via explicit memcg
To: Barry Song <baohua@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian Brauner <brauner@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, mripard@kernel.org, 
	echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 9:37=E2=80=AFAM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Tue, May 12, 2026 at 5:18=E2=80=AFPM Albert Esteve <aesteve@redhat.com=
> wrote:
> >
> > On embedded platforms a central process often allocates dma-buf
> > memory on behalf of client applications. Without a way to
> > attribute the charge to the requesting client's cgroup, the
> > cost lands on the allocator, making per-cgroup memory limits
> > ineffective for the actual consumers.
> >
> > Add charge_pid_fd to struct dma_heap_allocation_data. When set to
> > a valid pidfd, DMA_HEAP_IOCTL_ALLOC resolves the target task's
> > memcg and charges the buffer there via mem_cgroup_charge_dmabuf()
> > inside dma_heap_buffer_alloc(). Without charge_pid_fd, and with
> > the mem_accounting module parameter enabled, the buffer is charged
> > to the allocator's own cgroup.
> >
> > Additionally, commit 3c227be90659 ("dma-buf: system_heap: account for
> > system heap allocation in memcg") adds __GFP_ACCOUNT to system-heap
> > page allocations. Keeping __GFP_ACCOUNT would charge the same pages
> > twice (once to kmem, once to MEMCG_DMABUF), thus remove it and route
> > all accounting through a single MEMCG_DMABUF path.
> >
> [...]
>
> > -               if (mem_accounting)
> > -                       flags |=3D __GFP_ACCOUNT;
>
> Hi Albert,
>
> would it be better to move this and its description to patch 1? It
> looks like patch 1 already introduces the double accounting changes,
> and patch 2 is mainly just supporting remote charging.

Hi Barry,

Thanks for looking into this series! Yes, in my head I was trying to
keep patch 1, which was taken from a previous, different series, and
then diverge from it starting with patch 2. This would clarify the
difference between the two. But I can see it just added some confusion
(for example, patch 1 charges on dma_buf_export() and then it is moved
to dma_heap_buffer_alloc() in patch 2). I will reorganize it better
for the next version, including your suggestion.

>
> Also, mem_accounting is only used by system_heap.c; has this patchset
> also eliminated its need?

No, mem_accounting is still handled in this patch for the general case
where no `charge_pid_fd` is used. See dma_heap_buffer_alloc() code:

+       if (memcg)
+               css_get(&memcg->css);
+       else if (mem_accounting)
+               memcg =3D get_mem_cgroup_from_mm(current->mm);

>
> Thanks
> Barry
>

