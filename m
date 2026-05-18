Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F2B3FCB25
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 12:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106026; cv=pass; b=te5KD9X0PgWV3l/e3ZgZX/nDj05O/Cs5PGrkUNB2h1IKRFnynJT0QUetKNidkCIo28bIvAdCkVED5lgZA/kCwlIzNvB+QPdtre0uD/ISGEW9dODu+goGR0R8V65XwbXhgWEuqh787I7vyX8SWraXZb/rRsLhwmKDu2opO+6L3Oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106026; c=relaxed/simple;
	bh=EAOhdahq1wTYoi+v3Sd0YHLgR6nzuu2wluSY7LEs20o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNq1lGn6iTfesop8CzOggIoFnDEqCGKZayWxAdN/t3LaaDZEwfnb3JvI5u/ZiKHWQVQv55nPIb2Ve+AaxsbCnSI0wljZ43rRXd+/5loAsG9UfDfm1z4KtZqrbAx5mMlLF7WGJn+SwEMNi+UvXTX9oHi1JJrEZfbV5J+7q/3tpVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GLyg4H6W; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BXRKsefn; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GLyg4H6W";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BXRKsefn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779106020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EAOhdahq1wTYoi+v3Sd0YHLgR6nzuu2wluSY7LEs20o=;
	b=GLyg4H6W1yRhjE8OsNUbVkv2u+oevWCtJ9jGz0FuDXME/PMauUJI3kgtLuLJSvfzYYfdqN
	tizhyuR/gL9TELWoW/0Li2d7AYVmKOG01oFnoiMevjL7RXSZlhWy1l9d5lirBc3Mr+ED3/
	Eep4sLlrfKXOMGpdl17+A2OjVkj8RX4=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-qwABF-41MNKED9UT4N3nNw-1; Mon, 18 May 2026 08:06:59 -0400
X-MC-Unique: qwABF-41MNKED9UT4N3nNw-1
X-Mimecast-MFC-AGG-ID: qwABF-41MNKED9UT4N3nNw_1779106019
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7c0dea734a8so28537207b3.3
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 05:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779106018; cv=none;
        d=google.com; s=arc-20240605;
        b=G75UMSW4kfRBvpZYt37z6WyBIro5npRVFkA6NLASkO36wWC8TDPcmRcjNp79NYdrxA
         khClk2SuLONC9tfC63uixLAWyYmfPWMoXBNZltc/J0pLmfVaCe2b/nD4x13npjk5xyLN
         CLzYZyQAVu0TU4ebDy5daUeFUbTssCSSFdmYiYrWCSNRb3lbJYIsGgmCa4ZDOaKQVydR
         cZKn7w1x39ItKx70+Q298evaFL57ITRDx+Qi4YN2hZ+9EAJ1W5YSpgeTMbY1GbQgsNdy
         YJB5F8EyG7O3QX1EUM+tsTGVZo3uPjgSRTDgQfpmLu5crqk3jjMf5Vpl8NjID7ncNp7L
         iajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EAOhdahq1wTYoi+v3Sd0YHLgR6nzuu2wluSY7LEs20o=;
        fh=dHJZU4A10DMm2dsYJTMp/yu2oYJy/lihx3WckZXZ8tc=;
        b=RqmGuQcfzCVAY7cm8AE9ZbhF6BEbCLVgDyZJZYDK585N9+sUpbCMsZwprve5kzx67a
         jP98yIWlUg4DZDDSujgRDMoxRX2hQg0H/exZxx+eWEZoXCsRBUZ/RA5qnGQ9dx5CLtcb
         SIMhJ4W5THSui7PCLSccuuWyLjkAFXHGooacjNZEVu81y9/MViVpgybz+wzwRx7F/TJo
         362MrbZVI/uN8+06apjnFKTaAjJIWupb18Yn7waXz5Eh66cf3vzq5+8d3/edu7xdXOpx
         aNcIvrgGFOLy478BdeCzOyWafRckV6+K73iHJyt41BAy6TOslbOspIz/5Ij9qpwmTLmo
         La+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779106018; x=1779710818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAOhdahq1wTYoi+v3Sd0YHLgR6nzuu2wluSY7LEs20o=;
        b=BXRKsefnGCMXMhgisrd0MC7Rs/auGleOXoRdtovMvOZlz8JJE1sPikdDhxXtmkWdr4
         /bR5Nt++ZHSOPzEGG8kIY9AOtowwgbNrnZNJT7Y6W0seh1k+P9T6nEGXlvx4bRcI/8eb
         uRRHMtOFb3JcOzXyIK10B/cJAuPoJY0qdSzZ6sCVNfj54b+HQ3HFZbzPQ0hjx7zlOqA7
         an8qq4u22GOl/cyqbd55SH39Y9RLLNTPjU5iCMDhjxvuMlak4x41FhiunXT6fZP/Gtdt
         D75/+eSFwmAZgP5xdE2FoVW7eokz5kyr1zHwu/5Z+MEDZzdcYLOF2T+EslGzUT2ojgbm
         D3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779106018; x=1779710818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EAOhdahq1wTYoi+v3Sd0YHLgR6nzuu2wluSY7LEs20o=;
        b=HGLf7wCKyFSAW1AfTzpJqRdTV+NS4KpH7HLHU+0jRL8sssH3+UBcARCcZrkcsek6H8
         G+Vr4dwIJNB0WyZbtYwifg9kZdP3XXFdz9JiN5OFMEnSNRHj6rTCui6ZXdDnPMV4y4r0
         FDATJagvz1DG55+wzUqa/YMIwfT+AiDuNbxcdg3otJDnrhR77w+6qkQlHWQmpwF7CmPH
         5eYtMXwZiuwvpFaGcxvKA1nG+KYRfOZigSZYtfE0ao+IGpOxSAdH1GbWhkSrmTjvZAFG
         T7skdrpW8W5sjF3pk+hwuaZFsKZMZSHPulEqMcZ2f+1jkMgzTOV82U8OVjJxSBjCdhyF
         RwpQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1IrSc2OSI3h4li4ktU1foHEivMCiEhIz3vZQfXNCFEIK9qpIRToFXaYcm9bpO+OENHtkOKAmh6oAaOaWh8vk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqkrZOXrsaZNADemAYIHFdtNZkSU40P5PRgm6fPP0as10hoV7B
	UzPjVlOnj5rHbWVakBisAq0PQYgHZbfqLhG7geCzTIK5VzAPxxW9DKhbFAcZBC/1vJ9UzVWJloB
	NLrt3L8ypTLR17nrD5UoYDaeP9svC48IcB/BC/FhPAqNhWmF2LBwZBBJ+AchD/KqfPYe6KQlM0V
	jRVslCGxRPpxi59oySYErQ04MHQ8XcR0/iwhn24HM0yF+v
X-Gm-Gg: Acq92OFsrVU0H10BnUBpJsaWyzZcaDTifa8toD+qj7exR4TX1puVJKt2TEIhUBZv3eU
	IPQPJcuGai1lAKc3AS/ZptMZ6bXT2dI2MMNjnZtOaIZM0i00bInqUaMK6LJP82qO9m+IIM2Lgrq
	tV5ODIqJc0Bz/rRHRgBsgfw1h1+OG3STeizSbhGufMNT7uzj8QXIjNFhiE6hw9jfdoJvW+Q2WKw
	N1L4Q==
X-Received: by 2002:a05:690c:e3e1:b0:7c0:56f:5b59 with SMTP id 00721157ae682-7c9599a36ddmr149907247b3.15.1779106018432;
        Mon, 18 May 2026 05:06:58 -0700 (PDT)
X-Received: by 2002:a05:690c:e3e1:b0:7c0:56f:5b59 with SMTP id
 00721157ae682-7c9599a36ddmr149906897b3.15.1779106017837; Mon, 18 May 2026
 05:06:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-v2_20230123_tjmercier_google_com-v1-0-6326701c3691@redhat.com>
 <20260512-v2_20230123_tjmercier_google_com-v1-2-6326701c3691@redhat.com>
 <8ef38815-6ae9-4359-86d4-042554357639@amd.com> <CABdmKX2uwZ12kYJYPJGfWxuMBOJS=64b1GRj72tfB5D=NKM22w@mail.gmail.com>
 <CADSE00Jq_uvNgvxgPze0mEdUd+hF4-DPZkHy0KroWHZzygf4WA@mail.gmail.com>
 <CABdmKX3DhejYBis9htLDnzPrG7vuF3R3URLVNEbnyd61SSsx=g@mail.gmail.com>
 <CAGsJ_4zyecY6E-=Tm4_couT7uoM9LMcFdTMUPkZAjj4zUKE-dQ@mail.gmail.com> <cb84c2ee-9de1-4565-b2e0-60984721228f@amd.com>
In-Reply-To: <cb84c2ee-9de1-4565-b2e0-60984721228f@amd.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 18 May 2026 14:06:45 +0200
X-Gm-Features: AVHnY4K8qpVqb_W68zu-wX_-3BWWvVrVAC2CPBMHXBkSI4OOVylnoTOI9cwLMps
Message-ID: <CADSE00Lc42s2bzXzV5D7t1Enf56u4BVj-yXLp3Yxhm0=qMPvuw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH RFC 2/5] dma-heap: charge dma-buf
 memory via explicit memcg
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Barry Song <baohua@kernel.org>, "T.J. Mercier" <tjmercier@google.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Christian Brauner <brauner@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri- <devel@lists.freedesktop.org>, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, mripard@kernel.org, echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 9:34=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/16/26 11:19, Barry Song wrote:
> > On Thu, May 14, 2026 at 12:35=E2=80=AFAM T.J. Mercier <tjmercier@google=
.com> wrote:
> > [...]
> >>>> I have a question about this part. Albert I guess you are interested
> >>>> only in accounting dmabuf-heap allocations, or do you expect to add
> >>>> __GFP_ACCOUNT or mem_cgroup_charge_dmabuf calls to other
> >>>> non-dmabuf-heap exporters?
> >>>
> >>> We're scoping this to dma-buf heaps for now. CMA heaps and the dmem
> >>> controller are on the radar for follow-up/parallel work (there will b=
e
> >>> dragons and will surely need discussion). For DRM and V4L2 the
> >>> long-term intent is migration to heaps, which would make direct
> >>> accounting on those paths unnecessary.
> >>
> >> Ah I see. GEM buffers exported to dmabufs are what I had in mind. I
> >> guess this would only leave the odd non-DRM driver with the need to
> >> add their own accounting calls, which I don't expect would be a big
> >> problem.
> >>
> >
> > sounds like we still have a long way to go to correctly account for
> > various v4l2, drm, GEM, CMA, etc. In patch 1, the charging is done in
> > dma_buf_export(), so I guess it covers all dma-buf types except
> > dma_heap, but the problem is that it has no remote charging support at
> > all?
>
> No, just the other way around
>
> DMA-buf heaps can be handled here because we know that it is pure system =
memory and nothing special so memcg always applies.
>
> dma_buf_export() on the other hand handles tons of different use cases, r=
anging from buffer accounted to dmem, over special resources which aren't e=
ven memory all the way to buffers which can migrate from dmem to memcg and =
back during their lifetime.
>
> >>> udmabufs are already
> >>> memcg-charged, so adding a separate MEMCG_DMABUF would double count.
> >>> Are there any other exporters you had in mind that would benefit from
> >>> this approach?
>
> Well apart from DMA-buf memfd_create() is one of the things which as brok=
en our neck in the past a couple of times.
>
> But thinking more about it what if instead of making this DMA-buf heaps s=
pecific what if we have a general cgroups function which allows to change a=
ccounting of a buffer referenced by a file descriptor to a different proces=
s?
>
> That would cover not only the DMA-buf heaps use case, but also all other =
DMA-buf with dmem and whatever we come up in the future as well.

I removed a draft adding an ioctl for charge transfer from the series
before sending because I wanted to focus on the charge_pid_fd approach
and keep things simple, deferring the recharge path to a follow-up
depending on feedback.

The main difference between my removed draft and what you're
describing, iiuc, is scope and layer: my draft was an explicit ioctl
on the dma-buf fd that the consumer calls to claim the charge (see
below), while you seem to be suggesting a more general kernel-internal
function that could work across buffer types and cgroup controllers,
so not necessarily userspace-initiated? A kernel-internal function
will need a way to identify the target process, which sounds similar
to the binder-backed approach from TJ [1]. For everything else, the
receiver still needs to declare itself, which the ioctl accomplishes.

```
# When an app imports a daemon-allocated buffer, it can transfer the
charge to itself:
int buf_fd =3D receive_dmabuf_from_daemon();
ioctl(buf_fd, DMA_BUF_IOCTL_XFER_CHARGE); /* charge now attributed to
apps's cgroup */
```

[1] https://lore.kernel.org/cgroups/20230109213809.418135-1-tjmercier@googl=
e.com/

>
> The only drawback I can see is that DMA-buf heap allocations would be tem=
porarily accounted to the memory allocation daemon, but I don't think that =
this would be a problem.

The main reasons we moved away from TJ's transfer-based approach
toward `charge_pid_fd` are: avoid the transient charge window on the
daemon's cgroup; and to decouple from Binder, allowing any allocator
to use it.

Technically, both approaches could coexist, though. Of the three
scenarios TJ described:
- Scenario 2 is directly addressed by charge_pid_fd approach without
any transient charge on the daemon at the cost of one extra field in
the heap ioctl uAPI struct.
- Scenario 3 can be handled by the charge transfer function without
changes to SurfaceFlinger. The app or dequeueBuffer claims the charge
for itself or the app, respectively (depending on whether we include a
pid_fd field in the transfer ioctl). It also covers non-heap
exporters. The con in both variants is the transient charge window on
the daemon.

Both approaches shift the responsibility for correct charging
attribution to userspace: first, 'charge_pid_fd` on the allocator's
side, and the transfer charge on the consumer's side.

Deciding on one, the other or both depends on how much we value
avoiding transient attribution, and how much we need a non-heap
generic solution. With the XFER_CHARGE we can cover both. Thus, the
`charge_pid_fd` approach in this RFC can be seen as a
performance/strictness optimisation, eliminating transient charges to
the daemon at the cost of a permanent uAPI addition to the heap ioctl
struct, but not strictly required for correctness. On the other hand,
if we agree on the end goal of migrating other exporters to use
dma-buf heaps, and scenario 3 is addressed by adding the app's pid_fd
to SurfaceFlinger, then `charge_pid_fd` alone is a coherent/sufficient
approach despite the uAPI change.

>
> Regards,
> Christian.
>
> >
> > Thanks
> > Barry
>

