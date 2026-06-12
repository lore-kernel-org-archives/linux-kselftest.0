Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C2A3C2790
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 11:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781263281; cv=pass; b=Zso2DcmMUT6FOMvJFoNTzGLVMIvJx5pGMszCVkvdOeYW5woQbyeQK1DRAthxMnnki8g/ET1tdZ9LlC5vSlSdOUCDqDtrUf0UsFiklLMPtWcj+TTkmgb2OaOlEGXlRSuJQI1/qEkUF1flIzpWWA+Li0nS039GIJgtY5jtDqxoupg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781263281; c=relaxed/simple;
	bh=BmwTLn9EjRkQmK9olPEMDQvMYaPtP4a2w40hQBeehAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UpaAKhCBLnkfnowRDpYVx20XMLkcu54v7GOrFKizd+8k+zjcmelDLiY+Kpxi4V1wGkQX1Tj7BIjTPRhGNktnsmwvwO42E5/cic/4anpECKK9uXlbCLQnuKQzzBVtBTMA/U9KDUbicHfIu/aG8FWCkkRjHsD7lznd/OTRRoMuPPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Iy30qJTf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZsXaozSj; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Iy30qJTf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZsXaozSj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781263276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+9FlJSoQ1PrMv3NoMGU38Y/z2migVxYwYPcZc0DtbZI=;
	b=Iy30qJTfcPAUzmw6/EIFHNEvXREFcqC+VPDF+F4XAYV4PHFTzpeZxn7fkaDcdtvvq68RnK
	5n1xmpg7RaHBgh9w8PEHS24qgbqn0h0lK/Z791Bc6bdHkICrNSbxbF9LE716uxcZe2YFtg
	tMzzAvPImvcW+KiKA3iBVPdObFEbwn0=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-gWu4vMHcMquAHkOgAwLPwA-1; Fri, 12 Jun 2026 07:21:13 -0400
X-MC-Unique: gWu4vMHcMquAHkOgAwLPwA-1
X-Mimecast-MFC-AGG-ID: gWu4vMHcMquAHkOgAwLPwA_1781263272
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6603cfb9d71so1250810d50.2
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 04:21:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781263272; cv=none;
        d=google.com; s=arc-20240605;
        b=d689hHQA6LzQ+xdDV9MmhssuKGcKKrvqViSgzNkEDrIbFLSJOnwWX2btKARi9ngDGq
         WfMjcP6owdpubu+Zp6ighnB6SxO3IKl++SxWxU+xFsbY1o2RjjQV8fSa5fQmfCbq1xWn
         O50+2ubo92NnKZMxJb2oryUjWhfw63BqJgyrKdtPbWj2jo8cgaiKUW3HSEccEQiAM5wb
         euVQHHPf598dt7c9N1JOogZe1LB/hGFZ4e+QqFfFau/mlUtlXKIfKnjNJdKPOcX/K7Lc
         D/pOBsI2kDNlCbXeAZXcHnQ1yRAKJJg0o2xYKy8hfTYB9O/iJk6pI/cykJ9nN7zpDrzQ
         EubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+9FlJSoQ1PrMv3NoMGU38Y/z2migVxYwYPcZc0DtbZI=;
        fh=bHiHYyA21vXL29+KVNRPAqOxjG7AnCEKPsSF3eE/1m0=;
        b=UVe7GowIx1lN/bQsf1N7nwuVugnGZexQKGcoBNti01vsfairXvLG2zFg5QdQCdfAO5
         qEJ4F//QzDmZSZEsblPbsBfVidSUvExllmkDiOBesEng1qdQdpB2SbSe3gnzm0+TaGle
         dRyc8gNI455fouGlSrSurSwj5oq2wPDaeSpa/xjQRtiYnvKcebdYNgt/RWes/eh178UQ
         ockDOg6wsh3TaFsVMUlm/Yru8r4Vgzo0bAyS0rb+DhYn9qsCO8SjJZ4crFpBdqhllgJn
         3hGW6yrNOsLRJLSs5fGvvYWMcYRcQtsOQyhekdj+u3VQzhc7wMBYjqcRmhFJm2AUt+HS
         EpNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781263272; x=1781868072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9FlJSoQ1PrMv3NoMGU38Y/z2migVxYwYPcZc0DtbZI=;
        b=ZsXaozSj9uugovMbqmWi50Yvg7iQmgsZ+3WFJjX8D5ykmeu86wcPCx8/RD2x7Cp+nT
         XXim7gVYwbYFwGAiufhhuQF5cicF8NTClziu39c0+VqkRm21yXGkQ1lK/fNJCYvVOaNR
         F3b5JooJqeuWpdr2yqOF3q8LX/IEgPV+oTZkQPhm7L5gXOqkIC8tK/WIJtrX0u8+RXU8
         EH7sy1aMtorPlk/nJyvweqj/wtcj5o9SkcHBPm4RSbY9AZFwbzbCLyKOeop8lf5IVApg
         DStA0U+c6Xin9/mR2mexJrur9/vdfeQIanW8oibSThkJTJY6gEc78WmVUfXx5vQzYzRW
         NRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781263272; x=1781868072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+9FlJSoQ1PrMv3NoMGU38Y/z2migVxYwYPcZc0DtbZI=;
        b=tDu3gnPIrqTgwZ0iGhWeW6QYcFSRNNobtNmaxBLGa8efex3SACmlwZ8TIKuNKARZE/
         eljZ4gpJ+aMNXDpQTstAv371S5nycE0rq6sdhMl26Tg1tv5FshHIYdQ1el24o+sdfS/q
         vQjXmXf6oQJB1oY/3nIG7qMZiUue07AFQ3baN/DPkkO3SwpNS2Nn/UYZP2lKw0kZzv3p
         ANsNjIU75RZuzm4YtQzwWK6Yuirvo00+vru1K/TORfKmoUT7PpwqTBX3rA6uLaZ07ggd
         AK7g9pZnZE9FzzPIutWuD7d2imlPucC1h3uDbzvMgDew19i92xIiJIRYbncFpdCHW4BX
         PriQ==
X-Forwarded-Encrypted: i=1; AFNElJ9O3CPe8E+JVfRodOzuw/Ka4S7BsxMy7a4ALBIXldvXiG+xJaRfb/SvpWe3GP3MFZ2ADhtL4T6Cnho1dYq6Gbw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxISRfcfQvgKUnFjMqa1o6O+wlayPo6035L/WQKjTtLylBp7j3V
	QpiKNShr3eCIFva97scdJvCY+Qkrzfcb3EeshB7FZLgNVKza5Fh50zIvZtF6jNfgUqVmCgt3Boa
	x2M1cSLM36hT0rKMZ1l7a4rdh2lYKHCWtrVOS0uVVF6od4L/VRmHtuMhOWe6nCVZi+mvtfM436M
	ZN/ZxgCVSxpOlQYT/mcVVZLwjsnBrJOv6zVWSgjSAsMjxL
X-Gm-Gg: Acq92OHYUADwSkTo2i9hWrCBhgewGzlv6p0WO/9G1WI3u3UYdn9pBotmwnawkAkS7lH
	HN5jJWKcNG2SbSvo1oYt/ZkaT9q5rwxBRhgDIDxiJRdK0FAql1upGPbKOJF+fckMcOwKhfmpAPv
	UdvMU8pTsbeS0VOAg8DaFN0ccMg2l+t9GN6iQ3JCWbqyaA8b4obHIkA1eV9mFrU84UcxxsOdd92
	n7M
X-Received: by 2002:a05:690e:e86:b0:660:7a4f:9fe2 with SMTP id 956f58d0204a3-66278468075mr1653906d50.57.1781263272493;
        Fri, 12 Jun 2026 04:21:12 -0700 (PDT)
X-Received: by 2002:a05:690e:e86:b0:660:7a4f:9fe2 with SMTP id
 956f58d0204a3-66278468075mr1653865d50.57.1781263272001; Fri, 12 Jun 2026
 04:21:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c5401e8d-0b46-4cc0-88b3-f438d610e73b@redhat.com> <7e7cbc60-e9c7-4a63-9d4b-4e8fcad7bfc0@kernel.org>
In-Reply-To: <7e7cbc60-e9c7-4a63-9d4b-4e8fcad7bfc0@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Fri, 12 Jun 2026 05:22:01 -0600
X-Gm-Features: AVVi8CdNLha-RR1qN40JSwbbQIn5r6XpUlj26RldKCxPkjYT8VOZtB96P7x2nAw
Message-ID: <CAA1CXcDmE3G2K-V0VrzWy=xHUjOwnMcXDJjY+hBV1hxBZUGh+g@mail.gmail.com>
Subject: Re: [Bug Report] Elevated PMD nr_anon after running selftests
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Linux MM <linux-mm@kvack.org>, linux-kselftest@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linux-cxl@vger.kernel.org, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 10:09=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 6/11/26 17:58, Nico Pache wrote:
> > Hi,
> >
> > While testing my mTHP code I noticed that mm selftests caused an accoun=
ting error in
> > /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/stats/nr_anon
> >
> > At first I thought I might have caused a regression, but when retesting=
 with 7.1-rc5 (without my code), the issue was still present.
> >
> > This issue occurs in two mm selftests:
> > 1) hmm test
> > 2) migration - private_anon_htlb test
> >
> > I spoke to David about this and he suggested the following diff which s=
eems to have solved both issues.
> >
> > David would you like to send a formal patch or patches?
> >
> > Cheers,
> > -- Nico
> >
> > Diff for (1)
> >
> > diff --git a/mm/memremap.c b/mm/memremap.c
> > index 053842d45cb1..683a77dd679d 100644
> > --- a/mm/memremap.c
> > +++ b/mm/memremap.c
> > @@ -425,6 +425,7 @@ void free_zone_device_folio(struct folio *folio)
> >         mem_cgroup_uncharge(folio);
> >
> >         if (folio_test_anon(folio)) {
> > +               mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_ANON, -1=
);
> >                 for (i =3D 0; i < nr; i++)
> >                         __ClearPageAnonExclusive(folio_page(folio, i));
> >         }
>
> Wasn't there another issue with hugetlb?
>
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 8a64291ab5b4..0aec894266f2 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -590,7 +590,8 @@ static int __folio_migrate_mapping(struct address_spa=
ce
> *mapping,
>                 /* No turning back from here */
>                 newfolio->index =3D folio->index;
>                 newfolio->mapping =3D folio->mapping;
> -               if (folio_test_anon(folio) && folio_test_large(folio))
> +               if (folio_test_anon(folio) && folio_test_large(folio) &&
> +                   !folio_test_hugetlb(folio))
>                         mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_AN=
ON, 1);
>                 if (folio_test_swapbacked(folio))
>                         __folio_set_swapbacked(newfolio);
> @@ -623,7 +624,8 @@ static int __folio_migrate_mapping(struct address_spa=
ce
> *mapping,
>          */
>         newfolio->index =3D folio->index;
>         newfolio->mapping =3D folio->mapping;
> -       if (folio_test_anon(folio) && folio_test_large(folio))
> +       if (folio_test_anon(folio) && folio_test_large(folio) &&
> +           !folio_test_hugetlb(folio))
>                 mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_ANON, 1);
>         folio_ref_add(newfolio, nr); /* add cache reference */
>         if (folio_test_swapbacked(folio))
>
>
> Yeah, if you have some capacity, please send patches (and figure out Fixe=
s:) :)

Yeah ill spend some time next week trying to understand why these are
happening and produce patches :)

>
>
> --
> Cheers,
>
> David
>

