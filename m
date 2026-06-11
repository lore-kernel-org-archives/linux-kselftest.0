Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E51330651
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 16:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781195849; cv=pass; b=Rb3kp6h18/tBcqYXYbWHzmc6FJf39hNlO7AP+sUoXnHW87CiwvKamspwHrWnaA+/Pl4kcQRilTGJi8kVqe4IPZm/0nDUv25ysZyaH/AbArmulORfj4ssjP1YPi4532AQny6PGTaoryEHwbCcF9eKNc6YItEDSR2KcnzDHishO7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781195849; c=relaxed/simple;
	bh=YqpjZ2mJYo+OscrePw1sjkzQ+nl0rlFsGa5QD/lhW78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vo2KAV1f5m2LyXteyMnkH3+lGoQsAVfpQlox8ngiVJE9ctIijKNfMNxOTI0XMD2aHdcMiiyTjp59CT+JxhGlonBupVme5VdJ55OlBoEbn/8P/qiXiSs+rPJpGkDvPxPwUGhTV7WyzOgc2IBxp5r8+bdkazse+AEQvwiGe6uCwhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gy7H0iuv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sls/ulgy; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gy7H0iuv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sls/ulgy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781195847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lo2BJAapvZJXWOBDzrRCDmN5WtMov6d+Ohtu+DitNMw=;
	b=Gy7H0iuvwtQLYLxnJ9X3AxhXcQ5dXhoz8rwlEuxg2FJjkLZ4MPuXX4jh9g6qNSuQ3up9h8
	2wjDhIqslmwEUf2GkmQvQlje6Bd8tJ/nVLSU23d67DShuk/vNNB3atFOGK+ACPhODKwf+Y
	Y3pDoHFhki5sLhtkOK0rt2OHNnNn9bU=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-h3g96382O8mUltZQgJNNNQ-1; Thu, 11 Jun 2026 12:37:25 -0400
X-MC-Unique: h3g96382O8mUltZQgJNNNQ-1
X-Mimecast-MFC-AGG-ID: h3g96382O8mUltZQgJNNNQ_1781195845
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-660d7828a5bso167405d50.1
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 09:37:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781195845; cv=none;
        d=google.com; s=arc-20240605;
        b=lVWN5GAJN5L3SLpZuRar1EC+diK8jRrbFE0IZct9UXU0CYZXX9rlttHlgSirjq7Jvm
         0rF+2J2loET8voPNdEaBcQsqAgn8lgGijGEkMqACDxk2osHx3zFxDrMHaBPpc/h7oxkd
         CxsezK+EsTmEaOxuMXCX1wBNIa1zr9UysjlUu1AgaSn+vTLab4N6bpgzVnSbyy5hdnzK
         g3xmiJQHCwRojO/vke6oItU1AxdDXC6fIeceZws/tqTlqJfX1jaSvP3Rnz7d6uxPLT+b
         wJU2GVdyawCiLn6FBRowp52g5THpt0pGlx6m75jkIQ3UGwlYKMWOxggDf7USG4hziUkW
         CsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lo2BJAapvZJXWOBDzrRCDmN5WtMov6d+Ohtu+DitNMw=;
        fh=GzI79nLngE63NS6cmDynk/qZ5ZULcDnX4ZXzFXG88yY=;
        b=cCQmwXGAKZdN+cm4jGBIvbgXog7QQziHr6tcI43WC2mXjYmnrS2guQ+j2BWuuCb1CV
         UsClokRziWOXTv+jG3enTC4mgiDj8GWo0No6w6WIXjWxbHo/v7SEPX6tMbj9lZJZVVIo
         FjBHXjXQDhYSy2glkskfAOi79PcO3T2ZYr5JiqSq0sze97F9E9WCF+/OOjafpk+q8oct
         Q+JuEVKcXHsx0WnBcbLPSaQjhIHCE/1B0MYLIKSB/mERk9cBqPyDoz4axaRT+dxEFoUd
         mt8QAhN1/O2YBbNj5lDfRwRxP7ocLhwDMtoPAzS8g4XKsNs75xTn6z3cZCfkdiKZ9HMt
         6Qow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781195845; x=1781800645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lo2BJAapvZJXWOBDzrRCDmN5WtMov6d+Ohtu+DitNMw=;
        b=Sls/ulgyCvKOSDCRAMQ3/lO8IGrW5PWeLhBrTfgT/9PfJE1tKDxRx/XWf90Q2yG5Uz
         vrVW4ijQbxeA2+FryLzros5G3Q3JjWJxz2ZZuFoiWdlXNOT8D5Wag34+zYK82g8Lvxh3
         DUEUwH9BEi2NIlp/iiY2qEdmNTYhGcebagdqA50KaHM0AbHpX/CgOjaouEh6Zvj6YF3w
         arl+HbuJdcd3TltckQEzW0eNCIn/W7Hrhi3a1Spp9f3tPBe2NEhHkN0fF58GOgYgY/Sm
         ePvSwsIV0BylPeHTLyYkF36OC3rAtH1DgCusCQmKAKxmk2MkMqc7iJxKxxnUVOi4hCRT
         FTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781195845; x=1781800645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lo2BJAapvZJXWOBDzrRCDmN5WtMov6d+Ohtu+DitNMw=;
        b=DHoBsMjDseOmfVy7gZ2JFoXHmaJ74rGvlUpPmH7wxNM12gbIhO6tudJQbw2wNzHapL
         2+VJpo/oXPsZCao7dFv/IUZumgwEOXMGkaAZLyz2yyLFaGcMZ0ydw1vZvMIRqEyemdnC
         82Gl49PNUG68Nw8rW1R6ruFdI8DeNh9E3/EnyVBnkS2e5Wk+UeUiaQCA2S3B+FUVPuyr
         LEhholeQoDH882dlR5FK/4UajGA5Z6IbUZ+80m3qKeBgPBxfe4eAiq778tqR/Zfd4dwN
         MWYg/n+I8IRe3mSxK+oVWqxt9g8oywEtozo8BdNs2ixKKtJ+XnEvX24QL53Ix6t/wiNL
         dPKA==
X-Forwarded-Encrypted: i=1; AFNElJ/Ads9l8cIA6rdfC7zbG7PlOmFI+VC6RWS34unxsff0n6LmYq85FTHY4Lb5Wff+erwJ8J7hg4IQdLCxBmYDOu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC9q21Dba3mcfgF3zwLZev6oA7E7UR8v2ULlG3jaNEUP2QCYLE
	xMBHSad5WgS+VNZG8d6fEmvO7bLu1IfeKgrrZiwV8ySGWTtwdoqpS3+VK/EaW3WFQL+OPiL9Ve1
	4jyqMDPBO6rFuBun/oMu5tso5er8khJyE48pBxcTaCfHF/Zr8XxQc+kUBQl1d0L11HPnEgjMsZt
	hMsPftHgMgrtxAQeLB6JC2zb9QjLxVlf3DvxJ9OSFHV0pU
X-Gm-Gg: Acq92OHizzPSUyqo9tJu2cQMNSlNKJBaxXMTHhq+5Of7JKB4tJn59Dszw7jqVgsdoJY
	z7tK7lQOdZZT8q9uyC4dPVWhQputirKlz9P0//FeKBUW7ao+ZOT2qwKIdyYrLbHQGWWqjF+kePJ
	7ObeVcLhy2B5O3novMY/eVR34UUOYTnLXNu0jfB902xjfFwlIPzZCO2Q6O9JVGaIsxTJktOacwM
	E4F
X-Received: by 2002:a05:690e:1c07:b0:65e:9e71:7942 with SMTP id 956f58d0204a3-66269821a84mr2395917d50.37.1781195845248;
        Thu, 11 Jun 2026 09:37:25 -0700 (PDT)
X-Received: by 2002:a05:690e:1c07:b0:65e:9e71:7942 with SMTP id
 956f58d0204a3-66269821a84mr2395891d50.37.1781195844844; Thu, 11 Jun 2026
 09:37:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c5401e8d-0b46-4cc0-88b3-f438d610e73b@redhat.com>
 <7e7cbc60-e9c7-4a63-9d4b-4e8fcad7bfc0@kernel.org> <58760bd8-4979-4fb1-96a3-eb94f0e8ca0c@kernel.org>
In-Reply-To: <58760bd8-4979-4fb1-96a3-eb94f0e8ca0c@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Thu, 11 Jun 2026 10:38:12 -0600
X-Gm-Features: AVVi8CeRiWREUqKN2Q_Og2MjBU5y5YTHpA1HPOjpENVr0n3Tq-KSA69EjhcH1X4
Message-ID: <CAA1CXcCuk+3T98i01fAbQ-MSDX-f6ZdpE7kTbC_TwKObJ9siwA@mail.gmail.com>
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

On Thu, Jun 11, 2026 at 10:24=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 6/11/26 18:09, David Hildenbrand (Arm) wrote:
> > On 6/11/26 17:58, Nico Pache wrote:
> >> Hi,
> >>
> >> While testing my mTHP code I noticed that mm selftests caused an accou=
nting error in
> >> /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/stats/nr_anon
> >>
> >> At first I thought I might have caused a regression, but when retestin=
g with 7.1-rc5 (without my code), the issue was still present.
> >>
> >> This issue occurs in two mm selftests:
> >> 1) hmm test
> >> 2) migration - private_anon_htlb test
> >>
> >> I spoke to David about this and he suggested the following diff which =
seems to have solved both issues.
> >>
> >> David would you like to send a formal patch or patches?
> >>
> >> Cheers,
> >> -- Nico
> >>
> >> Diff for (1)
> >>
> >> diff --git a/mm/memremap.c b/mm/memremap.c
> >> index 053842d45cb1..683a77dd679d 100644
> >> --- a/mm/memremap.c
> >> +++ b/mm/memremap.c
> >> @@ -425,6 +425,7 @@ void free_zone_device_folio(struct folio *folio)
> >>         mem_cgroup_uncharge(folio);
> >>
> >>         if (folio_test_anon(folio)) {
> >> +               mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_ANON, -=
1);
> >>                 for (i =3D 0; i < nr; i++)
> >>                         __ClearPageAnonExclusive(folio_page(folio, i))=
;
> >>         }
> >
> > Wasn't there another issue with hugetlb?
>
> Just realized that you sent this, but somehow my mail client got confused=
 and
> hid it.

Yeah, sorry. Thanks for the message about the email client setting I'm
probably missing. Thunderbird may actually work for me now :)

Cheers,
-- Nico

>
> --
> Cheers,
>
> David
>

