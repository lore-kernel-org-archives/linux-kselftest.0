Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BD747279B
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183804; cv=pass; b=XdlCxqsyjrhA0XqPnv/Ny1nIFhXeReRoHON05fW6p2Eh370OIh9xBLRCojezt61ticnHouq61Dn5QFyAL9uVN+b5zeu066COShhvJ66+y5GPNQuAKg64XgF+6t9Ro7KSRDO+5L4zVitWCousaiSGqXDRpToKnl/jFm46fYiLpE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183804; c=relaxed/simple;
	bh=vupX0NJyQoj+YpsPS+mWEYXWTs2EEV9LxivCpOIjPNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oUrbbarVPeaaYV//co6wzYx3lTEUpbd218oD59CkLAGuwE6UxKVO01m0atMj+w9vAyxYLLKg33kFD//Gh743Zm2MuYyZk8tqZVsViXLJNq3TlUd57H7fVqo59KonG1v2GVOqyPCJLf063N0G63J21pcIRGwy/sSbntWJdflxQtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TtLgIlST; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KPqn1IrL; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TtLgIlST";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KPqn1IrL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779183801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5x571feKyCrxAyf039bp6xhn3Td73dplWB4PHAo5Mng=;
	b=TtLgIlSTk0kRO9ZPvkrLDs9bgs97tSEGLHjqELywBE1r1nxKee7tyjOPXl+NA1uniPtiD2
	4n4OEGVnU3vAUFTvOKNO/5yAU3aUkfLHlQsMYidVeWmo7s8vS+gNudIRuY14GHNXKGmwL3
	NXmtRi3LU5+Fy0wTn6VTMlQMNF1t7Pg=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-Xg1KrtCkNry_TqogANTe_g-1; Tue, 19 May 2026 05:43:20 -0400
X-MC-Unique: Xg1KrtCkNry_TqogANTe_g-1
X-Mimecast-MFC-AGG-ID: Xg1KrtCkNry_TqogANTe_g_1779183800
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-65d8659ae23so9369282d50.1
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 02:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779183799; cv=none;
        d=google.com; s=arc-20240605;
        b=ZM88Y9geYR/Py5D73WEqQrnqYVVsm7KVS/6waPcOCtgiDbqHXKKckdBzQBds4wNmX7
         pY5WKG7/JHwcY3QGhRdygbxHi4L0Muc4qoBSOW97ynbiRPWp0XoYlrzeFm9IwdeaR08f
         qafPJPDLL8x6PieB0wrYzRTMl029jyhWD29alLBOsDF7CGVzllkDhvjVRO/YL/vn5XAU
         +NxUDs/2HW/MwIRA21f30VuJ49gpU+d/xVgVchLVS5gOahj4qt5i+Hlq288u42wubl+2
         R86H9k4bTXqxYID7HQ6OIgyxXekYbSV1R5jlbhOREzF01btipncdse9gaLN0kBHpUIt0
         Z5Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5x571feKyCrxAyf039bp6xhn3Td73dplWB4PHAo5Mng=;
        fh=cerw5LcoeXL1dtfWP30nOWT07fSvR5QAwT2wGKg4r4A=;
        b=cvstBWqM9iOMifUxj6TsJo0eOMUMi267DtgUzpAERCdKAtnIrs6xXmi5dycBci0PMI
         SIM/tNhWLgdnrFcS8MlH1ZO700BKBgKCsLbNNTrHAJ3M+98NS9M0GkJ1g1bfEfpNfYRp
         r9KNjt3iZS0Es4cDTQ0DpYg6XFHaxD/uEZ1hsI9rHepaJuJYrNGOBXIJgOY6/Eo58e4v
         GSfajMq2j1tDK4x5L2ne7phFcD5GiHP9tecgf3WKaYdjrOS3w3uuKT1bMxlFKuOAO4QQ
         XGq2YcKBqFIs8zxmxv8lV0owGMB/v66N0QruBi4veGWDYu/m6CbKVGqRBwljChEiWR98
         KMDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779183799; x=1779788599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5x571feKyCrxAyf039bp6xhn3Td73dplWB4PHAo5Mng=;
        b=KPqn1IrLOVpiT+kXRx1cIJ/wy0pmC8vIciCxnXaSVniK793kZf9uSDYqJSuTyq4+Vo
         OCOcJDVLp9dLU1aOfW91FAWCNMT4qHX+zhTVBluntj/iGMA7ZVyt9Z5fi7Lew+tUu7ku
         9j6ITpTCdxLhUI99sWiydZmA0jsbdc6nZcTgUez2egzACU3Ib79/E7ng+XiuDOQ+Fe/W
         TopIi2ZMUKYOzpb6fJELqgfefKHR38gF6UMySaCkix6C9FWBChjVsNwmkS6osJsq+HoC
         XIrxaQ4ELApiNy7TGCCBCrh51OJengTn6qb+ftJxbLkB0t8K3VNXyeY1TGxwkf0Z/eYF
         II2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779183799; x=1779788599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5x571feKyCrxAyf039bp6xhn3Td73dplWB4PHAo5Mng=;
        b=TKbf3F4IcO6FFOEKQtAtl3xCxD30lqoySf4Qcc2M+FqzMe2zL3EoBTWvfbfwzw4mrD
         fpENzXLr6t96OqrgVtPNa0ailJ5ye+Ot5GU36JhhTsUtr1q829hQKbFW3cQdRISwvVS3
         ntVDVMdxJaeuwQP9gAh1xwOULfN5eIzKXlZyo74JDAhi60mKcwnfzWlvJ10Jy0nEY2i0
         xNLTz65R9iRaCgltF+vLSBev7FXLzrPHMc/R7CBBY6xocKV5+0Dl9KX8Lc1lygBAWHXi
         Qc9QWmDomAVm44QtS7yk9hpu7MsUbscp8StaFYKdk4VIH89cQWhEuNv1IXZL/aWg1cdT
         vnVw==
X-Forwarded-Encrypted: i=1; AFNElJ83eNrS0rvNFrjJhMm2U4Id4TNJKZqZJS/buWTkMUvpVB8nyZE6cz+nc+QfI6AmZgs4WSBhfRhJBPNcSlDUlS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXsaO179NKlLoiFvbn1WZ6WsYnuF7Rq5r5RU5XSXVC7EGe7QuZ
	IRnHh8ktd/NUan06zqQ27Txs2pqKEkYrxDdpo5zOfawTZ6ce1YFttowoA9IYe2a7BxPkjtLX/CW
	iWbfyaBNfNlIMeG8nDXRYikt7CLeIAM/qHI09WctRPS8BiTmD9xusiJmBt25Oa1jksNxyKwmIi0
	01dDhYG4wfiI4DhxqpkrlDiCmdAy8e+3qeM24o/Dm2gc0o
X-Gm-Gg: Acq92OFS/RR0X7QsGxTIJEnXNoC9yEffTy294fmxtlpQIcnkBnpdiRN4hndbP8NgKNq
	YmQsDRIVrKV8KzoqxF34RIUOOCOrO5IyJ/giBo3yvteT/Rcjw+DrtNLZVkRnKFyab8cbtcou+xw
	eflC7E7SuR2zB6U/y3WZjCppSYOhPd7r4jrhwULw2qCLdYYz5ZDo5Z79V4uVzzoPYgZDpVYw5bf
	ApGUg==
X-Received: by 2002:a05:690c:6e81:b0:7bd:a63d:fe69 with SMTP id 00721157ae682-7c7e6586abemr212584727b3.9.1779183799594;
        Tue, 19 May 2026 02:43:19 -0700 (PDT)
X-Received: by 2002:a05:690c:6e81:b0:7bd:a63d:fe69 with SMTP id
 00721157ae682-7c7e6586abemr212584217b3.9.1779183799106; Tue, 19 May 2026
 02:43:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-v2_20230123_tjmercier_google_com-v1-0-6326701c3691@redhat.com>
 <20260512-v2_20230123_tjmercier_google_com-v1-2-6326701c3691@redhat.com>
 <CAGsJ_4xfznffbjOaNKwnN6oZk_H6pqOzYqd1zx4Q9XrocdzV8A@mail.gmail.com>
 <CADSE00LjJcL8P5M-UPEpzZijU70uEmUirnin29N8YR5W5D-oFg@mail.gmail.com> <CAGsJ_4xwJ7SAhKPJyRtMTw6psTO7H1EcFFpDw0po1W8PX4FE8g@mail.gmail.com>
In-Reply-To: <CAGsJ_4xwJ7SAhKPJyRtMTw6psTO7H1EcFFpDw0po1W8PX4FE8g@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 19 May 2026 11:43:06 +0200
X-Gm-Features: AVHnY4K6WRueJTIRx5g-aAlFuFoKaIp0iRf0U18smAauuYj52IGoBPbNpAKamXc
Message-ID: <CADSE00L00D7yi_DevNsZ8_=VXBVD2eO5FbcM+sv1ZdwgjaiRmg@mail.gmail.com>
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

On Tue, May 19, 2026 at 12:43=E2=80=AFAM Barry Song <baohua@kernel.org> wro=
te:
>
> On Mon, May 18, 2026 at 8:16=E2=80=AFPM Albert Esteve <aesteve@redhat.com=
> wrote:
> >
> > On Sat, May 16, 2026 at 9:37=E2=80=AFAM Barry Song <baohua@kernel.org> =
wrote:
> > >
> > > On Tue, May 12, 2026 at 5:18=E2=80=AFPM Albert Esteve <aesteve@redhat=
.com> wrote:
> > > >
> > > > On embedded platforms a central process often allocates dma-buf
> > > > memory on behalf of client applications. Without a way to
> > > > attribute the charge to the requesting client's cgroup, the
> > > > cost lands on the allocator, making per-cgroup memory limits
> > > > ineffective for the actual consumers.
> > > >
> > > > Add charge_pid_fd to struct dma_heap_allocation_data. When set to
> > > > a valid pidfd, DMA_HEAP_IOCTL_ALLOC resolves the target task's
> > > > memcg and charges the buffer there via mem_cgroup_charge_dmabuf()
> > > > inside dma_heap_buffer_alloc(). Without charge_pid_fd, and with
> > > > the mem_accounting module parameter enabled, the buffer is charged
> > > > to the allocator's own cgroup.
> > > >
> > > > Additionally, commit 3c227be90659 ("dma-buf: system_heap: account f=
or
> > > > system heap allocation in memcg") adds __GFP_ACCOUNT to system-heap
> > > > page allocations. Keeping __GFP_ACCOUNT would charge the same pages
> > > > twice (once to kmem, once to MEMCG_DMABUF), thus remove it and rout=
e
> > > > all accounting through a single MEMCG_DMABUF path.
> > > >
> > > [...]
> > >
> > > > -               if (mem_accounting)
> > > > -                       flags |=3D __GFP_ACCOUNT;
> > >
> > > Hi Albert,
> > >
> > > would it be better to move this and its description to patch 1? It
> > > looks like patch 1 already introduces the double accounting changes,
> > > and patch 2 is mainly just supporting remote charging.
> >
> > Hi Barry,
> >
> > Thanks for looking into this series! Yes, in my head I was trying to
> > keep patch 1, which was taken from a previous, different series, and
> > then diverge from it starting with patch 2. This would clarify the
> > difference between the two. But I can see it just added some confusion
> > (for example, patch 1 charges on dma_buf_export() and then it is moved
> > to dma_heap_buffer_alloc() in patch 2). I will reorganize it better
> > for the next version, including your suggestion.
>
> Yep, I understand the situation now. I also understand
> that you were referring to T.J.'s patch, which caused
> some back-and-forth confusion for readers when reading
> patches 1 and 2.
>
> >
> > >
> > > Also, mem_accounting is only used by system_heap.c; has this patchset
> > > also eliminated its need?
> >
> > No, mem_accounting is still handled in this patch for the general case
> > where no `charge_pid_fd` is used. See dma_heap_buffer_alloc() code:
> >
> > +       if (memcg)
> > +               css_get(&memcg->css);
> > +       else if (mem_accounting)
> > +               memcg =3D get_mem_cgroup_from_mm(current->mm);
>
> I see. What feels a bit odd to me is that mem_accounting
> could either be dropped (with unconditional charging), or
> it should cover both remote and local charge cases.

Good point. If I understand correctly, looking at patch [1] that
introduced the flag, the shared buffer caveats mentioned there are not
yet covered by this approach, so the flag should stay. I will make it
consistent and cover both remote and local charge cases.

[1] https://lore.kernel.org/all/20260116-dmabuf-heap-system-memcg-v3-1-ecc6=
b62cc446@redhat.com/

>
> I don=E2=80=99t have a strong opinion here=E2=80=94it just feels a bit
> strange, since its description is quite generic for memcg:
>
> "Enable cgroup-based memory accounting for dma-buf heap
> allocations (default=3Dfalse)."
>
> Best Regards
> Barry
>

