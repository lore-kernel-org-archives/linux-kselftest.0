Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FCC4C77B4
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 17:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781198637; cv=pass; b=kdNSpgXhN5p5FsFdm0xlGYup3FcV5ikxU5b7q4mGLcgjA53bqIN0/hjycRuKA1wodC6jgNQtdskIJO23Kn9QkTjZdupPMVUsHdwmkVMYOupk1xkrVY/uALswDuahJkzXPzA9PYrKduK9NnGTkX9UekYcVQFLkmhXGMqAt0jgML4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781198637; c=relaxed/simple;
	bh=BRUbF8a1/YdKwOWAmSCK+aolTBIptfvRyOxs9xpjn/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehgk3CWK2ebyI4+Myg3ehFUGomfJKZ3PxErBi9H1etMa+iwAkyfEeO/QkNmSPF5716RSEeSE8Hrw1L8EBHKHvF3yPISF+N7s53KMrR3IV5opcXD51Bh0D2+7QUTb0ttzzezXFBtaE1Rydr04swC6jYQZDwyuBs8FZo6dTI73b4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KkvNm6Z1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IOKvUK7Z; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KkvNm6Z1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IOKvUK7Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781198630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6i8jLVdQ9iH7gHU8yzBEQmG3u/XRRqWxD3Id53UKfb4=;
	b=KkvNm6Z11ybdrl0st+1xRzs1NbFpbWKLtQTKBAZFyfT4/n49k1/aGYIofZokL6eZ9G+u6G
	hqqWnV7hZ3l6UozvW2D0m5snWdjWByr3LLQ7eq4Nf4Se+fDTylMfJ7rb5kS9KN0kJlMtbl
	Xqw7RYxiguujzje1h1NfSec3wvPrLVs=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-QTbkAK2gPgWXGdDBqZTobA-1; Thu, 11 Jun 2026 13:23:49 -0400
X-MC-Unique: QTbkAK2gPgWXGdDBqZTobA-1
X-Mimecast-MFC-AGG-ID: QTbkAK2gPgWXGdDBqZTobA_1781198629
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6607988ca90so170004d50.0
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 10:23:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781198629; cv=none;
        d=google.com; s=arc-20240605;
        b=ELC6GUNJ0HVR4jcgOlesg2Nd/ypO1bdz/uZLpL47hRwhOTkrVhyF9OrJj4z2gPzxn4
         Hdwix61bARYqIf7IWbABp5dDqwDTyce+WgXiPkLBUB/6SLa51DQHfOLUuD7x1ZYJPvj9
         F/5b4G6eoEiEzWMrI2wdVpLYzRz0+rdFqK85ZQ/dpnud40NHHW6fkD8ZrV93YdYgAyRy
         he0wbSfMOTxiFq/xtdRYWJR1+2iYoqCy1avAIZuahljXeUhQ9o2MfXF7VuGryymxpMEL
         4BRnXSH/CCJQUp+fM5T94WRSG5OwBIecHzo72tazfrNoXS5Z5lJuWuFif56n8YTqhkKv
         iXlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6i8jLVdQ9iH7gHU8yzBEQmG3u/XRRqWxD3Id53UKfb4=;
        fh=rOO/URUWiNjvtuVWr+xvuKiPdfJJc785A99L4sutFxc=;
        b=hBFhAUH7uzCHigkg5iNO9+PSTCmO3YrciR9pt/OsOO3Gk7rUrUpO1wi89OEQ/cwu89
         b6S3h8Y6B/WeYEk9X0R18Zg91wIhokC13UoZ5urOIAm9bKvtwD037dgyBm/nMxG+WEB5
         wnunhPrzBV+1ikBBYwQVqSyZTQOUUft+skpo0LdB7fC40lA4469zvZY6mUxM8SN2Yr0S
         Ed0e23v0zkW5tKEMwVb6N7s+GWQ/p5DfQJ4lPYJkCEw7UlZpQ7AnTYcc6BaEBjJZ74s0
         Nz+IdqwmLo0WcD0eixnAYuVk63wbm3Itrx4ekCnGlAUqvSr+nQ2UueDByQ8+czio3isY
         LCIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781198629; x=1781803429; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6i8jLVdQ9iH7gHU8yzBEQmG3u/XRRqWxD3Id53UKfb4=;
        b=IOKvUK7ZdxEWi/tvkQfXWtESvDMLX3f9nZGqBPpOZS0qmT/OvmXsLGccXlcdIk7UkJ
         QDVqlaoqSBXprj1PniMc+M//kWzyR3IPVt5zZDAdj7Jjb+KczJ4hsEbb+1cD5NAWa68l
         RQE6St/rqpm447g3RwFoO0LQEJFkCK5lgrpyAWtQbqWh1hKt0yCRsjGKJebxoS5S+Q2x
         ejZDws873WKJKzCoWG5CBiAxgaP1MVFONG/EwxOJ5ZCsI2DNlXcJdYg9tE4KH9nYLkAg
         4Iw3Rb1MKN6yG7UJuRgeC4N31/jyyL9DI1wLmobD1QOkTFMThAOtzOCX4EcTX7yp607Q
         7FrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781198629; x=1781803429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6i8jLVdQ9iH7gHU8yzBEQmG3u/XRRqWxD3Id53UKfb4=;
        b=on+0olpdTYfc/mVstv+gNJ44IdsyKzkltxNjwggVxvuqTpCvLWr/g4lmMG7gyMXc9A
         fhrtoHdfMyswCIDyXv+SzQJFoOHJW8fPtW2o2FxB+CHbQBO/o6XWuecZSnZX8cDi0Bdw
         o+hIH521DfzKYyt7OynHRDSTpxOP1Ow1RApaC7sDSZORuPT3Vr4IrD+0Q/Qm5ukdryb/
         3aV6TQPN2z3IznjvhzVssFxBVMdCrKQ03jU10p47XG8LTbxo6l/PGjTMryRqyHrmjq3q
         3AT/gQYHqg5Y8JnDaBDiKH5xZsi2JovRpEyO77oBdVtqZo3ssK+vm0H2y8gYDML5fPRB
         MCzQ==
X-Forwarded-Encrypted: i=1; AFNElJ8c2MWBj/RETe3a+C8HPK43mxO2kkpBl2cXbXnKsSFeVDZAV7JJIfmQGQKXXjfBXWwRgjGklhdKnFU0rtaazkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaWlldJpLoMgU1n5ATI7gxQl1jaGxKYs6sinlIskAFokEZrB4m
	BxdPch5MZqEimVqUic1MdewJyvPWGT6HLZHLqLAoylocKuuAWXuGVKv7Jqg+IkFVZ4ZNhnP9L1i
	YlMUDqgKza0byZqjtga8KAJ886m+lRKWRpVrZPg0KrjR5HqoT8OryammX23F0w+JREbqUSJmxKI
	xcELkmcgTGS3jlOmEZ2FR1eivuK7Q4ijOp7QkR2qQNkQnh
X-Gm-Gg: Acq92OGuDyXVi5LUmCSE+QdPTsxIS9EwnB8DIJ+rNMczWxzowRjcr6C56eqU24wSyxc
	ffQ86mDcXYHyrWi0P2XffxG7+5tC8zUT+ciHAVhXOoF8mRcE/490aHgNtasqntGVREQwAeDphsP
	rmsBz59c/OVNQxK4SwmfGWecdMZzq/Vbt0vqg+Ckg7s+P/t73OyJjk4M93og7RXCRLUrm7xDKUa
	dX9
X-Received: by 2002:a05:690e:12c8:b0:662:5ec2:8e3c with SMTP id 956f58d0204a3-6626960d510mr2985914d50.4.1781198628575;
        Thu, 11 Jun 2026 10:23:48 -0700 (PDT)
X-Received: by 2002:a05:690e:12c8:b0:662:5ec2:8e3c with SMTP id
 956f58d0204a3-6626960d510mr2985896d50.4.1781198628052; Thu, 11 Jun 2026
 10:23:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c5401e8d-0b46-4cc0-88b3-f438d610e73b@redhat.com> <aireq_jrgKH0zsNy@lucifer>
In-Reply-To: <aireq_jrgKH0zsNy@lucifer>
From: Nico Pache <npache@redhat.com>
Date: Thu, 11 Jun 2026 11:24:36 -0600
X-Gm-Features: AVVi8Cc9AyMT0x4hZewByKSnvCI7sNJtuPeLPz0ZADonrkvnlD7gQM_HjWEylw0
Message-ID: <CAA1CXcDbynmd=otyCFdM3W9gV7HseQ2qREMXGU2ngwbHwofwcQ@mail.gmail.com>
Subject: Re: [Bug Report] Elevated PMD nr_anon after running selftests
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Linux MM <linux-mm@kvack.org>, linux-kselftest@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linux-cxl@vger.kernel.org, 
	"David Hildenbrand (Red Hat)" <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 10:39=E2=80=AFAM Lorenzo Stoakes <ljs@kernel.org> w=
rote:
>
> On Thu, Jun 11, 2026 at 09:58:55AM -0600, Nico Pache wrote:
> > Hi,
> >
> > While testing my mTHP code I noticed that mm selftests caused an accoun=
ting error in
> > /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/stats/nr_anon
>
> You're not giving any details? how does this manifest? How did you detect=
?
> Output? Etc.

When running my mTHP tests, I always have a terminal with
watch grep . /sys/kernel/mm/transparent_hugepage/hugepages-*/stats/nr_anon

I noticed that when I ran selftests the 2MB count remained elevated
even after the tests finished and the system memory was returned.

e.g)
/sys/kernel/mm/transparent_hugepage/hugepages-2048kB/stats/nr_anon:34831

>
> >
> > At first I thought I might have caused a regression, but when retesting=
 with 7.1-rc5 (without my code), the issue was still present.
>
> Seems to be a regression in your editor's line wrapping... ;)

Haha yeah still figuring that one out :) The guide on setting up
Thunderbird recommends wrapping at 0 which seems wrong...

Hopefully I have it working correctly now.

>
> >
> > This issue occurs in two mm selftests:
> > 1) hmm test
> > 2) migration - private_anon_htlb test
>
> OK that's useful, but what exactly happened? Any test output?

Tests seem to be ok (although the HMM tests fails, but that's not new)

>
> >
> > I spoke to David about this and he suggested the following diff which s=
eems to have solved both issues.
>
> Whilst speaking to people off-list/elsewhere etc. is totally fine, I'd su=
ggest
> engaging with the community as the first course of action is often a good=
 way of
> resolving things.
>
> Even if things arise from private discussions, which is also totally fine=
,
> please do give sufficient context so that the community can engage with i=
t.

That was my goal here :) Perhaps I fell short...

>
> And I would suggest that ideally you phrase things such that you are aski=
ng the
> community as a whole :)
>
> >
> > David would you like to send a formal patch or patches?
>
> So on that point, I understand you're asking David specifically because h=
e
> suggested the patch, but I feel that you'd get better results making it c=
lear
> that you want community input :)

Yeah I didn't want to just send a fix that wasn't authored by me, and
I didn't fully understand it. When I brought this up to David (during
a separate off-list conversation), he suggested fixes within minutes,
and asked me to test. This was the formal follow up.

>
> As one might misread this, and perhaps other such occasions, as you feeli=
ng THP
> =3D=3D 1 person, which I am absolutely sure is not how you feel, but phra=
sing things
> a little differently would help underline that :)
>
> Kernel review and maintainership can be rather a thankless task, so detai=
ls like
> this matter I feel! [and I realise I probably screw up on this regularly =
too so
> we're all constantly learning :)]

Yep! Still learning (and often failing :))

Cheers,
-- Nico

>
> >
> > Cheers,
> > -- Nico
>
> Thanks, Lorenzo
>
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
> > --
> > 2.54.0
> >
> > For (2) he suggested
> >
> > diff --git a/mm/migrate.c b/mm/migrate.c
> > index d9b23909d716..9fd50ea25d2d 100644
> > --- a/mm/migrate.c
> > +++ b/mm/migrate.c
> > @@ -590,7 +590,8 @@ static int __folio_migrate_mapping(struct address_s=
pace *mapping,
> >                 /* No turning back from here */
> >                 newfolio->index =3D folio->index;
> >                 newfolio->mapping =3D folio->mapping;
> > -               if (folio_test_anon(folio) && folio_test_large(folio))
> > +               if (folio_test_anon(folio) && folio_test_large(folio) &=
&
> > +                   !folio_test_hugetlb(folio))
> >                         mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_=
ANON, 1);
> >                 if (folio_test_swapbacked(folio))
> >                         __folio_set_swapbacked(newfolio);
> > @@ -623,7 +624,8 @@ static int __folio_migrate_mapping(struct address_s=
pace *mapping,
> >          */
> >         newfolio->index =3D folio->index;
> >         newfolio->mapping =3D folio->mapping;
> > -       if (folio_test_anon(folio) && folio_test_large(folio))
> > +       if (folio_test_anon(folio) && folio_test_large(folio) &&
> > +           !folio_test_hugetlb(folio))
> >                 mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_ANON, 1)=
;
> >         folio_ref_add(newfolio, nr); /* add cache reference */
> >         if (folio_test_swapbacked(folio))
> > --
> > 2.54.0
> >
>

