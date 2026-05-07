Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F9A2ED860
	for <linux-kselftest@vger.kernel.org>; Thu,  7 May 2026 06:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135722; cv=pass; b=mN+t8gvOHsEkM/xaFsA0ZM31bApP9cXmlo5alj4pl2vB7IaAX204RDhNwFOqLsXLjheHoNI2pmaawbgBQghchdbtzAb/Vj0qL6Yyfen01kSMydvNj6Byh2bw/HbwiGoqiu+A2XeCjr+BjbDIyMPT924qtuu8xxTeByWPJMpclO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135722; c=relaxed/simple;
	bh=1e5QWdJdXYo85SIoew9kJElgC5BVkyxCQhjqgrYoXKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sTeSts788P1rUfyqI7/n8QZxYKTtX9C7wzRjnVxGKysPB2MqGHG4NeZJhISIv1KQzooo5toIcuBbD0LbTH3JdwK4rQZVNlpk/cF1zBDl6nyGYHMu+YRD+au/pqwQxKH0gdvLo4UVhnVU20qXYaPcBsZ1HOMyiJ7brju38d3FMOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KFFihbVI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=B3IjTEko; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KFFihbVI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="B3IjTEko"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778135719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BmF8e40h90ljVl04zACNPWVQcQh3Q1EW1p6gC9vnX28=;
	b=KFFihbVIJG4kE9rDZOUB7cYtWDy3+tbLM+pJfHzh1QZwgX5tUnv4g2hIOqE7ZFt63RLv7o
	upPwq1l+xfDBRbqEHbUISAZoWbtMSHCPZ2qv7AVhn1mPIysh/DsJMxzaMZHOXHoAZGwIcp
	nh2NIjg6cqBNnk5tDtDbB06ygTTWMuQ=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-UBAtT3G5OzyGbOZen86llw-1; Thu, 07 May 2026 02:35:17 -0400
X-MC-Unique: UBAtT3G5OzyGbOZen86llw-1
X-Mimecast-MFC-AGG-ID: UBAtT3G5OzyGbOZen86llw_1778135717
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-65d8659ae23so90791d50.1
        for <linux-kselftest@vger.kernel.org>; Wed, 06 May 2026 23:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778135717; cv=none;
        d=google.com; s=arc-20240605;
        b=NwE1hB+dqxXkPvXpHGm6N9xUM3qnrivUfyfdJEv7O84YPyo2Gdnp0XItJxWiRs4yz8
         T8Tt2fsUBO2iWl1ivjW9xXSzzcwAZvYuCD7N3n+O1/cvDGHSsIdVMZdgSxP/VsTjFQOG
         xXmGquvoioSvKjged3EJxM7EIfND2lBkgjsPidIzmtcISXQHfnief7Pr/bdYbl5SXgU0
         JyZcSwzzbKUz819kvBr+rMGlMigSR+SjHrAce52Z93664MBpuL563OMdPgCBIaodU2mn
         X1paSbbKP05zjz9+gl241waaWafvedLX0Vih0wTb1R8INWzBoDKjZAC2Jh9nq/p3zR1x
         FM/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BmF8e40h90ljVl04zACNPWVQcQh3Q1EW1p6gC9vnX28=;
        fh=3+93P+P9W9AsEl82Lm34qd2GmQyl6yDKCg2l6F1zNuc=;
        b=KvU8dwUTya258HUuF+gqDAcdfEK3joV+oqL6w9qiMo+7nj+yxeDYpBmvbl2sNbvn8g
         cKnOwObEBwLlor7hemdzxJaaijyGJ0NZr0mSf3AONJXsOPSSXMGuKXmIqa1VvDvIHm1g
         kF+C0obcmxwadpZVmJvQDxvDaeMG9kb6IyRJ1wdrrI2ijDo5AkKpKjwIcthIkuz1P3+5
         yo6lT3Bju5v7L64Q76d+YvrggPBCQNKUox+zXFjx2Lx1YirgHwyKeP8bV1a1WdYxbPhN
         2asqmAmKVL4UkEABJslzyZLlUQjmfVxnLSTNzuY67tVj1la+Qt5O3bUo/b8DIZKkR7hf
         Ho5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778135717; x=1778740517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmF8e40h90ljVl04zACNPWVQcQh3Q1EW1p6gC9vnX28=;
        b=B3IjTEkoYCKaxqLOVvghrAWTGPQ+CSJAHZDruS1jDc34+tlAtlnFgojqh6cUFopktv
         At1lJiEMpIBnSIFXUci1VdrTeftWTVo3ZxOzYwP7WI5db3xAKfn0xx3OFvLqKQzQCD8K
         1YaR73w6pecOa7I/WHBXeH2lUVoJ7cF6e3HM9HyRW+op0XDscsTndK4ddGj28Gjvp/xe
         jvXsZIQAd6lDqEvLRC5QJzOBVtQT8RtUp0RhZtS+sksgpGS4PAfbsV1wT81rVzQ3T2F2
         PpEUJqqlTuxE3sJJ84dR/ud5LDvvL9O8K2rb1yW6KTTZo+zPcKz1vcBHtNArvscxJozH
         Ie7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778135717; x=1778740517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BmF8e40h90ljVl04zACNPWVQcQh3Q1EW1p6gC9vnX28=;
        b=cAADZxmWZ6j5AcLwTDRUGK/o07aFfk2xq134XvQ/23jAWNTc9ba6m8Jd96tvjWLker
         Qw8ChOqzy12Rs6bSXKk/q463rEST09npyKe+tAz7AAlojqpcaeME55wm38f3/uXAZWtZ
         0BXzGrroAzorTPV+G4Sf3yfaAtjzO/uX335BF/3NQgVGYxR0iUdOIUwlSb70HSbbTLEb
         LkKi4gKqJ0scBiNOXJvJxyArp7zbZjEmEAOTh83G5rayiHDtABxPeahKa+vF0Oo7qjo7
         iM331kXySP1OVM/J/1ieFSb+qt8Vhk9FUVn+QjbIko+JEjJRbd+X9X6cMMlKFAIery4d
         TXFw==
X-Forwarded-Encrypted: i=1; AFNElJ9kMf2Kvcz/O100vavp/UY0uwfVs/4nZtI2+4iAWNYg+nqGWA8KNJkzTa+o450yeWjexi+nSQDZHV2PBqQO3UY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy35tfXAWcwV5ldFw75hUFyjOcuY3pmoqJh0cVDFiXD08VCrb8w
	rtopL7pgCPyZYPwBKs40c77OTclFl63bWdZKT8goXmbcmFV9lvozsZKhvQptNTeGOS+2boj7CKH
	WVJf6VyJ01voN8jdIqbOo4hC0hAeFdRkcyfTMFn707qsZMI25T9dw3JJPXwjrGh7Mrwa7wolN3+
	p7hfycoINVc17cp2xoLPScx97bVQP4BXjnTgi+sjit8Zt6
X-Gm-Gg: AeBDiesGZwvISCv9VD5VX+HdFQOipaTTvBMcLWY/A1dBywptwXM80g8Z+HNiYsdaQbx
	jG5WFygY8KAduTmv/JXgMLxJfXFGA8cJJBWLYv+aF7JNqvixXT0p3Si6+nVwUnTOZqTMTF6KGNq
	NPZ6xl8etVoaTJ0mjme8QaQfiSriiCw0VoEyHX20c9xjDjLynrbeIiuXU6DvSMo2EPr6Jg1FUXR
	g0UajNHpEFnJA==
X-Received: by 2002:a05:690e:4145:b0:658:e45a:e477 with SMTP id 956f58d0204a3-65d7e72eademr1206513d50.2.1778135717217;
        Wed, 06 May 2026 23:35:17 -0700 (PDT)
X-Received: by 2002:a05:690e:4145:b0:658:e45a:e477 with SMTP id
 956f58d0204a3-65d7e72eademr1206480d50.2.1778135716760; Wed, 06 May 2026
 23:35:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429152924.727124-1-ziy@nvidia.com> <20260429153538.727855-7-ziy@nvidia.com>
 <7e42faea-9f55-4722-a426-94be7fc3a49b@redhat.com> <61FB928B-03FD-4852-BED5-4E453ABB706A@nvidia.com>
In-Reply-To: <61FB928B-03FD-4852-BED5-4E453ABB706A@nvidia.com>
From: Nico Pache <npache@redhat.com>
Date: Thu, 7 May 2026 00:35:28 -0600
X-Gm-Features: AVHnY4Lrljxe6KvxlSyOqNI3gvAzejJ0XLC-pzb1vAYqjO_YkbxwJ0hvJkZ60ks
Message-ID: <CAA1CXcDj7Y7Z26f2o211fYewgrfBNOS7SfZ8Xroiv1ObC8dDRw@mail.gmail.com>
Subject: Re: [PATCH v5 11/14] selftests/mm: remove READ_ONLY_THP_FOR_FS in khugepaged
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Song Liu <songliubraving@fb.com>, Chris Mason <clm@fb.com>, 
	David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Lorenzo Stoakes <ljs@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <shuah@kernel.org>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 7:15=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On 4 May 2026, at 18:11, Nico Pache wrote:
>
> > On 4/29/26 9:35 AM, Zi Yan wrote:
> >> Change the requirement to a file system with large folio support and t=
he
> >> supported order needs to include PMD_ORDER.
> >>
> >> Also add tests of opening a file with read write permission and popula=
ting
> >> folios with writes. Reuse the XFS image from split_huge_page_test.
> >>
> >> Signed-off-by: Zi Yan <ziy@nvidia.com>
> >> ---
> >>   tools/testing/selftests/mm/khugepaged.c   | 131 +++++++++++++++-----=
--
> >>   tools/testing/selftests/mm/run_vmtests.sh |  12 +-
> >>   2 files changed, 102 insertions(+), 41 deletions(-)
> >>
>
> <snip>
>
> >> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing=
/selftests/mm/run_vmtests.sh
> >> index 3b61677fe9840..854c5c3e3a6ae 100755
> >> --- a/tools/testing/selftests/mm/run_vmtests.sh
> >> +++ b/tools/testing/selftests/mm/run_vmtests.sh
> >> @@ -490,8 +490,6 @@ CATEGORY=3D"thp" run_test ./khugepaged all:shmem
> >>    CATEGORY=3D"thp" run_test ./khugepaged -s 4 all:shmem
> >>  -CATEGORY=3D"thp" run_test ./transhuge-stress -d 20
> >> -
> >>   # Try to create XFS if not provided
> >>   if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
> >>       if [ "${HAVE_HUGEPAGES}" =3D "1" ]; then
> >> @@ -508,6 +506,14 @@ if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; the=
n
> >>       fi
> >>   fi
> >>  +if [ -n "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
> >> +CATEGORY=3D"thp" run_test ./khugepaged all:file ${SPLIT_HUGE_PAGE_TES=
T_XFS_PATH}
> >> +else
> >> +    count_total=3D$(( count_total + 1 ))
> >> +    count_skip=3D$(( count_skip + 1 ))
> >> +    echo "[SKIP] ./khugepaged all:file" | tap_prefix
> >
> > This leads selftest runs to always litter the output with SKIP when run=
ning this with the wrapper
> >
> > make -C tools/testing/selftests TARGETS=3Dmm run_tests
>
> Yes, this is intended to let people know one case is not tested and skipp=
ed if XFS cannot be created.

Yes but it prints after each test case run, not just the khugepaged runs

>
> >
> >> +fi
> >> +
> >>   CATEGORY=3D"thp" run_test ./split_huge_page_test ${SPLIT_HUGE_PAGE_T=
EST_XFS_PATH}
> >>    if [ -n "${MOUNTED_XFS}" ]; then
> >> @@ -516,6 +522,8 @@ if [ -n "${MOUNTED_XFS}" ]; then
> >>       rm -f ${XFS_IMG}
> >>   fi
> >>  +CATEGORY=3D"thp" run_test ./transhuge-stress -d 20
> >> +
> >>   CATEGORY=3D"thp" run_test ./folio_split_race_test
> >>    CATEGORY=3D"migration" run_test ./migration
>
>
> Best Regards,
> Yan, Zi
>

