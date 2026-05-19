Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90A03438BA
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 18:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214030; cv=pass; b=PdX+uIDSMbo0yRYY6hSq3v9zpBEEixl4X9GUfVDmjRaWDHiqLXIOryOIts2iDFs3QpKs/0KmatfSuZOXTB21O0sq7GApTe5Y8CShmxZDpv9jcFdsj8WbGS6IQf6PH1OLMQi7VQRDduqTDNhYWfh6gBvqb7/c7fdmb3Ubp9EZNfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214030; c=relaxed/simple;
	bh=xWuRtr4K/5gUdgYtvuhsDbR4Td/jrXMBs73+p4Eyg4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kd/w98KmiCDPslH+MiPGbworInHewCnfS4DUB6LihZ9yJ6smZKHSunjMFsRwxCsjRxHTVfe3DmYG1vwlvdDdLdnS0/8gxKSuyQMGJedYhv4dlNh/fy3IKq3K+0vpLgQooOFzCrMIB8kYLPW1xDfk4iZsmAjY9+LApu6HXWr8nP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VyNnfYft; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VyNnfYft"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48d1c670255so295e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 11:07:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779214027; cv=none;
        d=google.com; s=arc-20240605;
        b=NBJmPUmvayTmiEZOVXry6YMhQN9FwIBVV5yXODtnirfaCZAT0IGn6eoy2uR3tuiTi9
         auf4+E+4tpj0HAC5tdLbePpvWCv7L7QagmDsYDygYV6UkHfGtqDq/3FDGD+i94bdx/WZ
         NYmd2XeMsClQkptui0VBnDMBom3tM1ZUzH3urCFy/EF0Zr5QSSAhVnI3qXswM4B3+FH/
         b7QaIxJn88bXGp9CMaY8Q/L0RBTBKmh2JIpoizhoiLD0gsY1RyuGJ48xOME713wk1Web
         Pdq3ONYCegcA3OH+BpzVq7lE4/UDYDy/S+RJ+9xCOy8DbH9jwcOOdFVXao7Vr6mfunS5
         wKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xWuRtr4K/5gUdgYtvuhsDbR4Td/jrXMBs73+p4Eyg4o=;
        fh=wMqNwGFzDYtlqF/leSGjEt7jyK2etJ3M43UW67ItFjc=;
        b=HIg2pT+cA33gvUbaJTIPWcM7m868wRFS1AoupQqWdyAySBjW3yVkUOWlqzuWm2jFIE
         zhzU0e0r/w6sshpftt3QYEVcvtXQALK8ejU3R7Mg1npTo3Qh44rcbPsXIVx5sQNlir2o
         oSaOSzOijWJujU3zwGLF2U5hTqfXftOVIhuRC1lCoRmbaM+Fe36SCZ+B3Ms7H6ej5B9P
         yjNx3fuq9U3tv9NBzi+M3i9SUX/r+IU83TZp4tYdaF6pdllQi2zpAIxdv9eM/bvFAvKC
         Czn7/Y4IIVeFbio2qsMtdL28Er4zIx7rZ9lUL1st+v3LRaklGKTMJ3yubGj3lBUHUkGZ
         rKUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779214027; x=1779818827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWuRtr4K/5gUdgYtvuhsDbR4Td/jrXMBs73+p4Eyg4o=;
        b=VyNnfYftN5Zm7O1g2zyDlanIBedjkc47HlTLcNZ8DlZPYbkSWMxSMsRf/CSz/2X/qd
         tkFfv1f0AYulKDrFrLqicAKcw20yqGpc2OkOBAEpUtwyIzNd1kxo64awQjdv3IrxYX1t
         Oh+W9sZAKcEkARL23u68EYToymkAIudI8ZmkttSx9pxJS/AqQ1pWHFuufcC7lDArQGOi
         0NRrUBPaWOWepg197ofEZXkMKb85xn4S3yqEm78eNuhF88mLGEM2VqYLO4A2nCiyhX+7
         0r8nJ5g0e60NJsAhHU7/NimQjv7wvNc6d/BhMwDku/SKQrdBipRznT+XwjDJFvO2rL8f
         GU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779214027; x=1779818827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xWuRtr4K/5gUdgYtvuhsDbR4Td/jrXMBs73+p4Eyg4o=;
        b=R/NcMvbIwKEJrKmfVxnGsB/jENh1wcuxL6WSLq+M/VIwhQqoHs7CGFk74cJKgRoDxv
         l9yRxpQJ96EqDYsWZ6+F6KIRuM5xXo40arq4H2VrfllWRInCY5U+Tqu5HsJA6W+qKh2e
         HNKmCkP1+3IYyC78dv9B195S6GrEeZ0ey7c8m13lwjmVsXRQoD011LZj1QVmrze9i3V6
         icar9b1QG2B8FnpKvFi0W5QG1oPTgRLxJ81iaS7X04ywFGAAj1Jk4juHbB6QrYnTjXii
         LJjhekFbaNl1unAtTdzNiokXQ1UI2sLTQ406uwHgIsB0b7wD8o7Bxdgp14vIFmT06u6D
         +rBw==
X-Forwarded-Encrypted: i=1; AFNElJ/tiwp0GzYz0P3AsTbIziKoAFwqejlaj3azgMKueLczJ6PqZXoWNDMJrZi5euX/YCwhA/SHhkq52yqhG9BZS6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwivZ5pK1JfBNlzUOYt9TQQzFBA9swvc5F6HlgA+z+KG39J0q7v
	QuP/c+DXVm59661MOxChn9XRHvYdarofLaZvl63x8P3d3OEkzAo7dis2JV6+sbj20FmFqCDgqX4
	PJmDpM1SM8710Hm7gERNM+U29M2xyPbxvWjY5HmY4
X-Gm-Gg: Acq92OEIrgdXrEwao+6fXVfj65VXhY24OCiCG2yCClAumLzrETxxR+I2WY+qKz2vjyl
	VZZWkZDwEe+38ktCIxXXmH0hROqMaU7TFsCyMz4TSi2f/fp1Tvvm15qlCDr3okQPKXC6uc2t0hq
	hyh9AW0KFdgM7KfRNXzKYcmk5HkfCxxC5GIwscmN5/a1t34Qj6FVhZu6MKyemDnOQPS2sRc0eN1
	Rk7CskWMeLQ7s3IATVW5loUVVeiAN7t9eTl+UJCHAl20bKSiW9PyaTI6RgcBbdwJ7CXPKcw5Sxa
	YA1iiG9QGwgNhJm5drd9i9eO7v93QgkNoThuC/ucUs7k+vIl542UXuo7BnY=
X-Received: by 2002:a05:600c:828f:b0:485:1a54:9407 with SMTP id
 5b1f17b1804b1-48ffa06d607mr4555145e9.0.1779214026686; Tue, 19 May 2026
 11:07:06 -0700 (PDT)
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
 <CAGsJ_4zyecY6E-=Tm4_couT7uoM9LMcFdTMUPkZAjj4zUKE-dQ@mail.gmail.com>
 <cb84c2ee-9de1-4565-b2e0-60984721228f@amd.com> <CAGsJ_4z121v4tK_3+j-hkD7HH0gH3w8tWD8nk0CwRhFE5T+4Og@mail.gmail.com>
 <8a13b1ad-f1be-4ef4-905e-0d9828ae8cb5@amd.com>
In-Reply-To: <8a13b1ad-f1be-4ef4-905e-0d9828ae8cb5@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 19 May 2026 11:06:53 -0700
X-Gm-Features: AVHnY4ILqt3aAhuKzQVtfjO_TWAUc-lBkfBsfy8pZGOgOTZtrN6Xce9TENH_RxE
Message-ID: <CABdmKX1o5FeR697DGdExhSDAzdLBN=y4ijpA2SZyisC6ThYKbQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH RFC 2/5] dma-heap: charge dma-buf
 memory via explicit memcg
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Barry Song <baohua@kernel.org>, Albert Esteve <aesteve@redhat.com>, Tejun Heo <tj@kernel.org>, 
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

On Tue, May 19, 2026 at 12:10=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/19/26 01:00, Barry Song wrote:
> > On Mon, May 18, 2026 at 3:34=E2=80=AFPM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 5/16/26 11:19, Barry Song wrote:
> >>> On Thu, May 14, 2026 at 12:35=E2=80=AFAM T.J. Mercier <tjmercier@goog=
le.com> wrote:
> >>> [...]
> >>>>>> I have a question about this part. Albert I guess you are interest=
ed
> >>>>>> only in accounting dmabuf-heap allocations, or do you expect to ad=
d
> >>>>>> __GFP_ACCOUNT or mem_cgroup_charge_dmabuf calls to other
> >>>>>> non-dmabuf-heap exporters?
> >>>>>
> >>>>> We're scoping this to dma-buf heaps for now. CMA heaps and the dmem
> >>>>> controller are on the radar for follow-up/parallel work (there will=
 be
> >>>>> dragons and will surely need discussion). For DRM and V4L2 the
> >>>>> long-term intent is migration to heaps, which would make direct
> >>>>> accounting on those paths unnecessary.
> >>>>
> >>>> Ah I see. GEM buffers exported to dmabufs are what I had in mind. I
> >>>> guess this would only leave the odd non-DRM driver with the need to
> >>>> add their own accounting calls, which I don't expect would be a big
> >>>> problem.
> >>>>
> >>>
> >>> sounds like we still have a long way to go to correctly account for
> >>> various v4l2, drm, GEM, CMA, etc. In patch 1, the charging is done in
> >>> dma_buf_export(), so I guess it covers all dma-buf types except
> >>> dma_heap, but the problem is that it has no remote charging support a=
t
> >>> all?
> >>
> >> No, just the other way around
> >>
> >> DMA-buf heaps can be handled here because we know that it is pure syst=
em memory and nothing special so memcg always applies.
> >>
> >> dma_buf_export() on the other hand handles tons of different use cases=
, ranging from buffer accounted to dmem, over special resources which aren'=
t even memory all the way to buffers which can migrate from dmem to memcg a=
nd back during their lifetime.
> >>
> >
> > Hi Christian,
> >
> > Thanks very much for your explanation. So basically it seems that
> > dma_buf_export() is not the proper place to charge, since it may end up
> > mixing in non-system-memory accounting?
>
> Yes, exactly that.
>
> > My question is also about the global view for both heap and non-heap ca=
ses.
> > After reading the discussion, I=E2=80=99ve tried to summarize it=E2=80=
=94please let me know
> > if my understanding is correct.
> >
> > for dma_heap, we have the ioctl DMA_HEAP_IOCTL_ALLOC, where users can p=
ass a
> > remote pidfd or similar information to indicate where the dma-buf shoul=
d be
> > charged, as in Albert's patchset.
>
> Well that's the current proposal, but I think we need to come up with som=
ething more general.
>
> > For non-dma_heap dma-bufs, we don=E2=80=99t have an obvious userspace e=
ntry point that
> > triggers the allocation. So we likely need other approaches. We could e=
ither
> > move more drivers over to dma-heap, or introduce something like
> > DMA_BUF_IOCTL_XFER_CHARGE, as you are discussing, to let userspace expl=
icitly
> > declare a charge.
>
> Yeah but that's not only for DMA-buf, we need that for file descriptors r=
eturned by memfd_create() as well.

memfds get charged on fault, so an allocator shouldn't currently be
charged just for creating the fd. Unlike system/CMA heap buffers, the
shmem backing a memfd / udmabuf is LRU memory, and swapping the memcg
owner of those pages is a more-involved process which is not supported
by memcg v2. There used to be some support in memcg v1, but it was
removed. Commit e548ad4a7cbf ("mm: memcg: move charge migration code
to memcontrol-v1.c ") said, "It's a fairly large and complicated code
which created a number of problems in the past." So I'm not sure how
much appetite there would be to support it in v2 for this.
