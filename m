Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4B931D72E
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 16:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108852; cv=pass; b=g3STXByTSz3toGHUUYURTZJiVepiC8V6hVVlRK3w9f8xAwYVu29YjzgRv4EwDX+PUR+7s0ubW6F0sfOBI6rnxha7vByrHxAYRU8jp8Sm8ITTPjb4P87BNX7n88RhgqCza4FLO0WYaedx6rZP+/BzgpGHToqt7x6DCeFIHFfMdQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108852; c=relaxed/simple;
	bh=fQ9u6M0LEtNdmbZaJiOxxdck6uUaOgszsocHjSKtjkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=piGqpuLLteMqLo2wwR+O9PloshkqF2suRxOpZVLfaagW4FHfCxgAqpgZTd5i5vjQpcG7yM+NgrtMRJbtmmM7OseOvJEeNv7+ooty3gz/ki+PcAEd0r9BemIUvI9gTWokOHfhNPH1PMRvf9k5tkanBhFjVqzWffye5Ce5gFZ+y2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i4xagkwq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aC5F0PRS; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i4xagkwq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aC5F0PRS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781108849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=69ovsGaFESoFtofuBYPpSJ5R+TtHCpzN/Ba3LcguZSY=;
	b=i4xagkwqbm+AcaN6INl3cKTpHo5Z/BhuPD/87MjOiRAmqXV1Zws2eDAPfa3Eql0OpTRLgh
	c3QzzO//lIRrHPldJyjfo/jOQny+Acn2etSHOTo/k/dUwk7onZnjmalb5nderA/gPqN9li
	EdWcA+0jQ5wz7gAguHsejvJr4gqvhjc=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-6mOHR1jmNka5g16CndGwzQ-1; Wed, 10 Jun 2026 12:27:27 -0400
X-MC-Unique: 6mOHR1jmNka5g16CndGwzQ-1
X-Mimecast-MFC-AGG-ID: 6mOHR1jmNka5g16CndGwzQ_1781108847
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-660555be5a0so10667857d50.1
        for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 09:27:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781108847; cv=none;
        d=google.com; s=arc-20240605;
        b=SyMqsHStl6CjMjfPqfNtMNiMF6LE1npeNz8IlGwt53ZdWXqGP/IqDwjJ9E9zWygFjC
         fvoO8W9loh6GOQ5wEtxLp6ACpdbiVk8AqQ1h7SfK0sxH+wwnGHQhFJmcqzVP+srreURt
         wj7ZUa0EYusOXTmuxRK8mrg8B/38M7JrvWsDRhf473BMdPRaKqrJnnjlcKcg2DTELYrf
         BOY2GPcd7tPg1kjsJwoQJk58oCBSfo/nl9wMRjUeaFh5d3vcw+XaUso7bWDpyoFtXJVB
         rXXEfsb5AO5RIEnzeeTzUF41gARd94x3lCDo5aVm8JPL5c2lL8SSb3mXoN/ZC7CjZQzb
         ljvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=69ovsGaFESoFtofuBYPpSJ5R+TtHCpzN/Ba3LcguZSY=;
        fh=cIBgODfxchtPlteVH68q9j4nGwViOLwBt8fpqZL5YkQ=;
        b=JnG5kHB0/LytfU7LZh+6ozX7F0CfrI6PFdhUQdXf9znaRUOSofmJv5XZ0gS7zojw+T
         c/wPjlqvJykBHa8hByN0xweb0kIacxt7WNG+Sopkv+CtIh47verC5Bp23D+vf1XBw19D
         OribV8D22hwr2Y/1p4Qy3e1IApNLgqdAn8Uwo9GBr/aGeWzMgdbUFLQPHGbAq928MXlL
         HrWgsTi0YP6t+7d+huLvdUETVrR5UDv/gQ8vjGIRwgxIRJJc2eztqjqc4xNhrA2UghMw
         LjSIkuIJ959Ag50mGy9ZOgHVBLBQZvFW2cE0N18YvcT1Uh0QJelfPVtHsGsDJrGx6gED
         81aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781108847; x=1781713647; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69ovsGaFESoFtofuBYPpSJ5R+TtHCpzN/Ba3LcguZSY=;
        b=aC5F0PRS/Jcr6hgM7BSurG5kMOQ0oHaND7oLwui2GWNenu291Rt2F8c9R0MxOx924r
         JBNaAl55p0LbDsIbL75OQ8XqmvG1KyLAKygkIybmvgSv8pvz9BpOM/RwFxTUle6ngcXM
         2JPGYUCkjtNWDsOgD+Ysv73TaD2hyNoNI9rxkwisekfoa103lwDBNpSuw8rUjmoHZRJ9
         kF4xiRQ5Uocl6gF4TVQnPkoE+GLIvcbEtf3II8vX8YBV07+H/TETbiOvLDlJK4jMgEd1
         /RSUYdjtBlHwB6Sw7HaeNXZ+F5T/bE0VI+JtLdxU1WPETDak/YvkoCL57t44KQVLqchl
         ZI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781108847; x=1781713647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=69ovsGaFESoFtofuBYPpSJ5R+TtHCpzN/Ba3LcguZSY=;
        b=Vr3ZXl+PNovsdSFuInMsMfJ5vN/0UVJN/pAuEp/HI8C7Yt2qUknxCQlaBCCbK5IQuR
         ohW+sYJEZxgcLfUbPlsmP0R0CPHCrjfK5yna/JFNNcjemXqPdAWwKHiTh2Tf+cl4d/ek
         k36AErz9+GxuujBJmbmr48HF0hH0HEOB8ap7tXnxv3fbEV0fd8cW0s8wK29XLJ+hk8lM
         bR3cjZ9iBBLBmw3H8Er/QCBwgXlXfQC/33NTuEs25bfnbIdA8qZaudy7VtcH604Ratyi
         GjrzRjT32fHJ27nSJqvMcZbqlEKtFWutIQPQFnnDzsGp4ssj88L+kgRwyTPPSYmxfYtB
         wJ1g==
X-Forwarded-Encrypted: i=1; AFNElJ+9FFvuoYAg73RQd/eVWWdpO1vN1iknJXG2CfWCtV8vhRF5zeR7Obm45Li+C1S9OSL+jj97PZuD9wPbGDZPvQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCzNXKNO628LVQbonemfnoDQ+nEYqStv0aZ7psj7sYz+5GHygX
	sPYwdJN4OucE7CSZ0+yvibBwGFANqYV94eZS0ZxMZxKMMWpTd87QkV9V0lPK0JACxF2HQDdRi00
	eGYl7hkasXEAgAB1wBYCu0RuYmFha9PC80PLhLy3RWAg5RKZdvt/43lqGoPkKCsQs/SHyqc/plz
	H1ao4zP2FIrZZXVZio6bVdU6hL6nx+jdkmLC+55xthYKIy
X-Gm-Gg: Acq92OGAZJPp66OaC8qyggEewXyCkOUFDeuxcCbkl1CnuKTRHhUflfwyRWJESiKh9oJ
	3Xz1IHIxaDj9HnHHbG5uIhH/4muRVWA3mGnGNcjhh4DKQbh787WhXdJrjMmjvb5IedREI4RFjk2
	84iIlg0JAU3OYxqLL+low2nV6NosBFiR/89UJTr96op8GoqMCpL25ITPvJcMnScpuExgVXN2u+V
	18sOd8EoitMmAw=
X-Received: by 2002:a05:690e:d50:b0:65d:8f98:6bb4 with SMTP id 956f58d0204a3-66106e64201mr21406006d50.29.1781108847102;
        Wed, 10 Jun 2026 09:27:27 -0700 (PDT)
X-Received: by 2002:a05:690e:d50:b0:65d:8f98:6bb4 with SMTP id
 956f58d0204a3-66106e64201mr21405961d50.29.1781108846569; Wed, 10 Jun 2026
 09:27:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Wed, 10 Jun 2026 10:28:14 -0600
X-Gm-Features: AVVi8CdALWmcahZhXPy-FoKykTlzQjK3gHyZEyMMwkE0KtxNZmEvvR6Rmyhf5Tw
Message-ID: <CAA1CXcARRvYChZbxfLg1oTh7RdKGqJUFg7M_vCK162v0ncKhVQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] add shmem mTHP collapse support
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	hughd@google.com, willy@infradead.org, ziy@nvidia.com, liam@infradead.org, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 4:29=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> (Note: this patchset is not targeting v7.2, but posted for early feedback=
.)
>
> This is a follow-up patchset for mTHP collapse to support shmem mTHP coll=
apse,
> which is based on Nico's patchset[1].
>
> The shmem mTHP collapse strategy follows the anonymous mTHP collapse appr=
oach:
> track present pages via a bitmap while scanning PMD ranges for collapse c=
andidates,
> then use the bitmap after the scan completes to determine the most effici=
ent
> mTHP order to collapse to. Built on the basic framework added for anonymo=
us
> mTHP collapse, the shmem mTHP collapse implementation is straightforward
> (Thanks for Nico's work).

As promised I will review this series :)

>
> In addition, I have added some anon/shmem mTHP collapse selftests, and no=
w all
> khugepaged test cases can pass.

Thank you for doing that!!

I was just working on adding the anon mTHP selftests. Any chance we
can separate out those bits and just send a series for adding anon
mTHP selftests without the file-related changes? Then your series adds
the bits you need here for shmem collapse? Thank you for doing all the
heavy lifting there to generalize those functions :)

Cheers,
-- Nico

>
> Note: I have not yet enabled large order collapse for file folios (file f=
olios
> currently only support PMD-sized large folio collapse). Although file lar=
ge order
> collapse would be more straightforward to implement after shmem mTHP coll=
apse
> support is added (requiring some changes to file_thp_enabled()), I think =
this
> still need some discussion on whether it is necessary to support other la=
rge
> orders collapse for file folios.
>
> Comments are welcome. Thanks.
>
> Changes from RFC v1:
> https://lore.kernel.org/all/cover.1755677674.git.baolin.wang@linux.alibab=
a.com/
>  - Rebase on the new code, and update to use the new functions.
>  - Add more test cases.
>
> [1] https://lore.kernel.org/all/20260605161422.213817-1-npache@redhat.com=
/
>
> Baolin Wang (11):
>   mm: khugepaged: add max_ptes_none check in collapse_file()
>   mm: khugepaged: generalize collapse_file() for shmem mTHP support
>   mm: khugepaged: add an order check for PMD-sized THP statistics
>   mm: khugepaged: add shmem mTHP collapse support
>   mm: shmem: run khugepaged for all shmem mTHP orders
>   mm: khugepaged: allow khugepaged to check all shmem mTHP-sized orders
>   mm: khugepaged: skip large folios that don't need to be collapsed
>   selftests: mm: extend the check_huge() to support mTHP check
>   selftests: mm: move gather_after_split_folio_orders() into vm_util.c
>     file
>   selftests: mm: implement the mTHP-sized hugepage check helpers
>   selftests: mm: add mTHP collapse test cases
>
>  include/linux/shmem_fs.h                      |   4 +-
>  mm/khugepaged.c                               | 174 ++++++++++++----
>  mm/shmem.c                                    |  10 +-
>  .../selftests/mm/folio_split_race_test.c      |   2 +-
>  tools/testing/selftests/mm/khugepaged.c       | 195 +++++++++++++-----
>  .../testing/selftests/mm/prctl_thp_disable.c  |   2 +-
>  tools/testing/selftests/mm/run_vmtests.sh     |   4 +
>  tools/testing/selftests/mm/soft-dirty.c       |   2 +-
>  .../selftests/mm/split_huge_page_test.c       | 139 +------------
>  tools/testing/selftests/mm/uffd-common.c      |   4 +-
>  tools/testing/selftests/mm/vm_util.c          | 184 ++++++++++++++++-
>  tools/testing/selftests/mm/vm_util.h          |   8 +-
>  12 files changed, 492 insertions(+), 236 deletions(-)
>
> --
> 2.47.3
>

