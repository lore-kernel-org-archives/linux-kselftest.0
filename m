Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE9631D72E
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 16:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775492298; cv=pass; b=YJTgjaots7/MrQf2q7ciMgonxcK8Nba5ancYcJLETKNvvkYZ1y5oSuz3avHz8TGcBuJ6fYyKslgZ5SvIb9s0zIlFjMn8Aj4NuRYxFPp1sKyyX5Xn5V6r21UgOVKrG/ot5uyEflZIuMMa0mGRc8G1X7+wIs8sUsCIuOZtgnwBW8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775492298; c=relaxed/simple;
	bh=Sx2PROwTq3F7LwsAWn5/F82tCZkIr3+uQglxsvyYeyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XwaB44fFao+PFeNbPSFRHvbe/BhQy+mROTkrlh2PiypyZYAcY/zujoRQkBt+EZVS7YYW62u6k8aqFO7c05rqmT0pHPPwZ/I7IM7wvzPAM5pjqwSKUy2N9ExAjUBliAqZUUU70/4DZH4htARjFR3h1NVRnl/5OseplcsctejYtLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RlLkC7yg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=m0CsCown; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RlLkC7yg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="m0CsCown"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775492296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6y77XvnI+Mo2VOk5fqGJ7LyYJ/iXdioOpfeqZJmaEik=;
	b=RlLkC7yg4IBd7ns0ST/m+OmUaBgr6RrzcA8EYdQnEM0n+PZcNsSgiMF1vUmN4nUo1eesbA
	A07CviY2y30c7CZJw0PztQYFjfbOytVeqUA7cSG+Fq6zv/fGaFq2P5ZKwhvJ/FkxolIALG
	uAHqFCD4Wsnp9hM33qIWmOr1/w2rh2g=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-vxhfIBQxOC2Exmj2PZ3VNQ-1; Mon, 06 Apr 2026 12:18:15 -0400
X-MC-Unique: vxhfIBQxOC2Exmj2PZ3VNQ-1
X-Mimecast-MFC-AGG-ID: vxhfIBQxOC2Exmj2PZ3VNQ_1775492294
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6501bab91baso7153127d50.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 09:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775492294; cv=none;
        d=google.com; s=arc-20240605;
        b=VlPIbDinDMM6EqXGePzxzRmALQ68oB5sxdeP7UV1Fdqg8lGNneB0qptYLi6MDHiWn6
         MU1Ly6GctFtker2tGAS7la59Ei1uGPxkodZGsVI0sCOIffe02bySB/kH2S8p9wkE8AGh
         NNa6QNWpa4topkqcxT3fzpfaNOPFWegrjTR6HdMgUPGVDEpNy6l4DS+v3uIP6+gMUCOY
         Pb0ESwLDfjtdlFTIvOMUCCdD1jTSwWu/5ChXDSn+VK605ViP+vytE04S8DN/Srft8Puz
         ev0eiI7CTfjLQJDrEluyy8wclT0aNQdSB1/v7v3ET/dLRilBul/fCspak3XrTLvhQiS0
         CFDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6y77XvnI+Mo2VOk5fqGJ7LyYJ/iXdioOpfeqZJmaEik=;
        fh=/cZC1gfgTpqgm5xQVRHZp2Ro8vSXvaTXOIPcDarApJQ=;
        b=ZFeMsFXPpMaf7CmhO9Q7k7H9lnDwPUu+9syqb6wRrhJHrMtwJHw6/ykqR8P10ghjQS
         PabA4Yy7H7L8naeWtzNJmASlrcUg7H50k/W9L4fZKCiXVA7EMEe4IcMs+1VF1TXc5tYZ
         0pSW3Mu+1JVA5+7hZzjk8bekIBGSYFya1q6v8mDAURWhCPEfeWvlHaKeNvgD22qtIdso
         zpziayOXWzUuCl3VQeuAreWNkyfPKjXY7MiOrSn80tBmcoP3ovcreTszKMRka318vcPG
         Zl9VvS1y9Oz7lHWHmrW0eUblv6lNzcZI7AD7eeUF7PoPJgdaQLtHVjPitlZvQdX9HITk
         UyHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775492294; x=1776097094; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6y77XvnI+Mo2VOk5fqGJ7LyYJ/iXdioOpfeqZJmaEik=;
        b=m0CsCownH60XUKHXy5xxIjn1/Dmiq6QRWQ1Uw7wo9+06jplbmFMAPxMSJ71Rrw57wW
         27SD8QUL9gdLl7OjqvMMCVLff+dm27CxsJ1W8+uPYMgIiwrZEiUx3+IIn8KRuAnrnkbS
         zXm0bfCQNEUDUFTtx3bPwCLCYe2Q6hcfFyVK0lxGqzkoVuITF+4dyzKbpiFvKjYuPSe9
         YRlZsfxPeXyOJEIZbWtfblkO6iO3utO/36kN3AYojjhgI4zKMzIw2vBkPpto3JO71o0S
         KaWxrxa+8XDzeg2TGAgeafZM2HQ1BGyWH4PTKY/DBMnq6m7STq27GncYVzf9IVY0GvFc
         nNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775492294; x=1776097094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6y77XvnI+Mo2VOk5fqGJ7LyYJ/iXdioOpfeqZJmaEik=;
        b=HmJiK+ukeAza/Xbh0zvRGiKP/mM+DIhXMDl37V1wcGKu5La1blAUdd1Iez1jBbIeJQ
         9EyWMhuCVCgGqAm/7eEZOby22WX0LE6xX9jr2sQckVKc/5mceBL8MarnswyepWMyz7qp
         jKw8QwpsQ3vIht8O/YCfFH2ujHYrQRcf2XjwVVOjqVOdNvO1+Sk81d/fo1DBkp6Lyr8K
         LBe1hvEnM+LQLq6B+/vbz7vo7O/R6VmbvCWZ+Xy6cJcThpQjlYR+HW5Ojt0fWFRG6erY
         m4g4C9nr/1SgdOol/Yj6RuR0JhA4uQlHDtPaBV+cq3AriVeuP6dTNZH+1rq6OK+IFLjl
         Rx0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVi4O4+E11AscDG4NbR6nihVyapjHvI+9nUmTxQ/G9sj1Z/n5U+L7qoJ8IpQoLjfqPNzyynk2oldxzYIxOvbRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCZ2OFZTdtyq8kB65o5A8nXwcoI/K3aMkPPUEfRpxelhJpMbCM
	LaO64HsIKo4vhOESH3hyztoisFU6gqE+ubITOmwqdWHH2VcasPL5ZtPeXKsRKnGelTV/S13bRAB
	v/bdBJ32IDKUsm6zeuIPXV/r1KsOXRQqMGCN7t8lnf5TrsyX3FSJ/cFm/Mif57mthvZ5szrOJce
	AKI7FAzdhos4Hk0Tm2nmRLT7yhQHJi4gjuZgxroVDtrQ0s
X-Gm-Gg: AeBDiesKZn/HPEtm0VLXGGSrhg/1oD1vKLLU5JbfsPBJsb5edyHWxwy7zkxaHzd4i4n
	h+n1gtSQUS5pHKb/bMKaimzCjvCxOzNhfBeBHomkbg/kMIIAzCeLfD6WK5YqJkY1RdAt3ctX+QB
	vyCJOF7/Hz7fPgOAz/JxkYt66L0KJQcQ1h5kL+hyXBh5ffkmYzd+LaqHKyJvfZew5kTG1K6VghF
	fNroWYA
X-Received: by 2002:a53:d9d1:0:b0:64e:a3c4:aabe with SMTP id 956f58d0204a3-6504873ee85mr9904474d50.26.1775492294256;
        Mon, 06 Apr 2026 09:18:14 -0700 (PDT)
X-Received: by 2002:a53:d9d1:0:b0:64e:a3c4:aabe with SMTP id
 956f58d0204a3-6504873ee85mr9904421d50.26.1775492293619; Mon, 06 Apr 2026
 09:18:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327014255.2058916-1-ziy@nvidia.com> <CAA1CXcCmue7iX3O9RLo7wR5EqASvJGCLraw1+iQMZ98BiMJwrA@mail.gmail.com>
 <737AA503-E522-4F01-B78E-AB6C6B2E89B0@nvidia.com>
In-Reply-To: <737AA503-E522-4F01-B78E-AB6C6B2E89B0@nvidia.com>
From: Nico Pache <npache@redhat.com>
Date: Mon, 6 Apr 2026 10:17:57 -0600
X-Gm-Features: AQROBzCfrg9zP5e6CbYyk2TsG4-q8UqeZvpk1DLrJKBq311IS7ZVoH1gcE7n3p0
Message-ID: <CAA1CXcC-vggwd-Z3h_PAfSk8U0ZvoQH-FpwhD=9XZHUnEGkcTg@mail.gmail.com>
Subject: Re: [PATCH v1 00/10] Remove READ_ONLY_THP_FOR_FS Kconfig
To: Zi Yan <ziy@nvidia.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Song Liu <songliubraving@fb.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <shuah@kernel.org>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 5, 2026 at 7:59=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
>
> On 5 Apr 2026, at 13:38, Nico Pache wrote:
>
> > On Thu, Mar 26, 2026 at 7:43=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
> >>
> >> Hi all,
> >>
> >> This patchset removes READ_ONLY_THP_FOR_FS Kconfig and enables creatin=
g
> >> read-only THPs for FSes with large folio support (the supported orders
> >> need to include PMD_ORDER) by default.
> >
> > Hi Zi,
> >
> > Thank you for tackling this :) Ill try to review the next version as
> > I'm a little behind on this thread.
>
> Sure. Thanks.
>
> >
> > Should we guard collapsing READ_ONLY_THPs with a sysctl? My fear is
> > workloads that convert READ_ONLY THPs into writable pages (assuming
> > this is common/possible; my understanding of FS is rather low),
> > leading to storms of thp splitting. Do you think this is a real
> > concern? I guess this is also true of read-only-->writable fs-THPS
> > even without khugepaged, correct?
>
> Why would a read-only THP need to be split when it becomes writable?
> After this patchset, a read-only THP can only be created on a FS that
> supports large folios (to be precise PMD THP). That means any write
> to that read-only THP would just change it to a writable THP.

Ah, okay. I was misremembering some stuff.

The concern I spotted earlier when investigating read-only THPs for
khugepaged was this:

For frequent yet short-lived writes on read-only pages (e.g., package
updates, log updates)
Wouldn't we get destructive cycles of cache invalidations and refault storm=
s?
Imagine such pages are shared (library, execs, etc) across many processes.

When these files are marked for writing we must invalidate all of
their mappings, destroying their Page Tables and PageCache. Now all
processes must refault these mappings.

Once the write is complete, they are eligible for read-only promotion again=
.

The part I didn't understand (thanks Claude) is that this truncation
path in do_dentry_open is only taken for mappings/Filesystems that do
not support large folios, as only those filesystems track
mapping->nr_thps. Furthermore, with FS that natively support large
folios, khugepaged does not need to re-collapse these pages, as even
if this was the case they would be refaulted as THPs.

TLDR: My concern is not a real concern.

Cheers,
-- Nico

>
> Let me know if I miss anything.
>
> >
> > Cheers,
> > -- Nico
> >
> >>
> >> The changes are:
> >> 1. collapse_file() from mm/khugepaged.c, instead of checking
> >>    CONFIG_READ_ONLY_THP_FOR_FS, makes sure the mapping_max_folio_order=
()
> >>    of struct address_space of the file is at least PMD_ORDER.
> >> 2. file_thp_enabled() also checks mapping_max_folio_order() instead.
> >> 3. truncate_inode_partial_folio() calls folio_split() directly instead
> >>    of the removed try_folio_split_to_order(), since large folios can
> >>    only show up on a FS with large folio support.
> >> 4. nr_thps is removed from struct address_space, since it is no longer
> >>    needed to drop all read-only THPs from a FS without large folio
> >>    support when the fd becomes writable. Its related filemap_nr_thps*(=
)
> >>    are removed too.
> >> 5. folio_check_splittable() no longer checks READ_ONLY_THP_FOR_FS.
> >> 6. Updated comments in various places.
> >>
> >> Changelog
> >> =3D=3D=3D
> >> From RFC[1]:
> >> 1. instead of removing READ_ONLY_THP_FOR_FS function entirely, turn it
> >>    on by default for all FSes with large folio support and the support=
ed
> >>    orders includes PMD_ORDER.
> >>
> >> Suggestions and comments are welcome.
> >>
> >> Link: https://lore.kernel.org/all/20260323190644.1714379-1-ziy@nvidia.=
com/ [1]
> >>
> >> Zi Yan (10):
> >>   mm: remove READ_ONLY_THP_FOR_FS Kconfig option
> >>   mm/khugepaged: remove READ_ONLY_THP_FOR_FS check
> >>   mm: fs: remove filemap_nr_thps*() functions and their users
> >>   fs: remove nr_thps from struct address_space
> >>   mm/huge_memory: remove READ_ONLY_THP_FOR_FS from file_thp_enabled()
> >>   mm/huge_memory: remove folio split check for READ_ONLY_THP_FOR_FS
> >>   mm/truncate: use folio_split() in truncate_inode_partial_folio()
> >>   fs/btrfs: remove a comment referring to READ_ONLY_THP_FOR_FS
> >>   selftests/mm: remove READ_ONLY_THP_FOR_FS in khugepaged
> >>   selftests/mm: remove READ_ONLY_THP_FOR_FS from comments in
> >>     guard-regions
> >>
> >>  fs/btrfs/defrag.c                          |  3 --
> >>  fs/inode.c                                 |  3 --
> >>  fs/open.c                                  | 27 ----------------
> >>  include/linux/fs.h                         |  5 ---
> >>  include/linux/huge_mm.h                    | 25 ++-------------
> >>  include/linux/pagemap.h                    | 29 -----------------
> >>  mm/Kconfig                                 | 11 -------
> >>  mm/filemap.c                               |  1 -
> >>  mm/huge_memory.c                           | 29 ++---------------
> >>  mm/khugepaged.c                            | 36 +++++----------------=
-
> >>  mm/truncate.c                              |  8 ++---
> >>  tools/testing/selftests/mm/guard-regions.c |  9 +++---
> >>  tools/testing/selftests/mm/khugepaged.c    |  4 +--
> >>  13 files changed, 23 insertions(+), 167 deletions(-)
> >>
> >> --
> >> 2.43.0
> >>
>
>
> --
> Best Regards,
> Yan, Zi
>

