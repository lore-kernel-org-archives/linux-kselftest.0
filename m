Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032493AC0F9
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 08:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069998; cv=pass; b=FtIY3+FAGqKWE2VQ7T0dItXpvvTtJuV8NLFZxgGBo/ugOYTGN+lSCS7oejgwzdpXmZ7bqhbS+Q1kgP3llyxUMxGG3EY7mrupFNlO4l2w5a9XZ3AS6SIcd/A7uOsyehKhH7oEug5ewOP7GxoVq8RSYttfaJrzgQoAWasb5MLElbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069998; c=relaxed/simple;
	bh=51K1dSOwx77FUDK5PTj+zi2/Idf/3F0Kn/F+IWkeRRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5e7u0qUTqMauoqdwOgXaJuJ3ItIvTSCHvp0JcSoS9mhVzr0fIgYIm3VtZZKrg8mFDGzC9HPUx5Aw3KKkvBTmm0FsCnTQOpU72sg/Y2fpWTfC2o8inagRC+BfmTPhBwuP27NLAO9gOmZqdNTjneo36N+09gaLA3wOgT4b1w+sDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OlifcbZO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ic7fnvAq; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OlifcbZO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ic7fnvAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776069996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o0213UnEMOod9W6HJe+rSGORixl1p8NPdPniRuWrrH0=;
	b=OlifcbZO55P92m2QNBhlREE7cdhfVlEyap8L8UH5wJmax9qb7i9wfqDSUg3qWAjHl//4st
	TDrP2cnN5ubzeh7JsqkjNyon7soBpe0J3d82YptTU14jGasnJnQX5cfwAKIi5xuC2kJ8MM
	WQxInbVsxYSNhgMHcBasGFBXWTkl8wc=
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-CdhpzapkPruBZL4sLQ27mw-1; Mon, 13 Apr 2026 04:46:34 -0400
X-MC-Unique: CdhpzapkPruBZL4sLQ27mw-1
X-Mimecast-MFC-AGG-ID: CdhpzapkPruBZL4sLQ27mw_1776069994
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso5873601eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 01:46:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776069993; cv=none;
        d=google.com; s=arc-20240605;
        b=ORQfF3rTAF0syOM9qVpQyc2wIf8eekc+nGbfEp+ZPrDK0aXRjMB5LxhCkHS6TgZEq3
         nWvVxYmfwh8Dz7TmPG1iC/wmSA6r69fIghYXvl+yImBxdfMQsXM/qmb70YelNrBC469U
         RkixRS59ZfJxsrHlgSEtWyUCUOiJRIctxmHLF33Ho/dkTB3+cVaKYd1p8Zk+OJYBGP/y
         1DKohhapLvntp0s3LIP+qz0QdgaQy4IVYm0hUKBmgbhTN64O/H5JA7tGSSyCDsNxNmuP
         EcIUcmO/69JhisfrynY+M5ulmWpaf6aiyTTvTGPxm3YtpKm/AI6V8IoD1ECVx99ZBTfa
         c2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o0213UnEMOod9W6HJe+rSGORixl1p8NPdPniRuWrrH0=;
        fh=VqrrCpkTKfi07L/n2pd1MZ0H2pSG8GYVoNm7E3Ed46w=;
        b=hDp6Zsn7YiFLkdw+i+8aKSk2P2HgYUSzkf0RnJiCqom6KJy1teGmjMgfEmAOi631AW
         KkwfnrbsInDGlrq1cKWyI/+aHYyu+Tytpz3Xb8xEJ745nxZp8+fYSbYoUfooz0LPbsV7
         EdeOS6DJTZYfVDJImzJL7bORWLMsGeOWRqwdVZhxG+xJz342u5HIlRbVHegd2XSdNZzZ
         RHMAT2wROQgIh2iSjvMEbpn8jd7mQoOzhy2dNGs/fntJqe3IGMb/gfHgmg7Jt99xMce3
         LNZA6twZXZnjfHnsmrZCze2ekjGR9RerWdwCIcFsDSi/LW+VVng5KhISYRaNR2I/8uDk
         WLjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776069993; x=1776674793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0213UnEMOod9W6HJe+rSGORixl1p8NPdPniRuWrrH0=;
        b=ic7fnvAqxwC8JgJpSOH+2y0gTHukPpqikAlhxckE1oE7ccy5rjEcNbHcDcBn/QZ0/j
         u3PljoHYsXNPtswTAdn7mQiCSCgGNC7EF39NnOpbkMerJxYQH4p3iR1PWU5K6/y2sNus
         tNEJgwzDTZY6EtWACtRoytgfGEwvI+Fxz9PHD5364qdBkhv5o8XxsGEkaGY1qGAg29IW
         0CDuoe7ptAeBrkzrPkWUsZ2BTtoV5/d1gDvEZ3CX8jEPJBcTnOeaR4CCRcQQkNCTdWno
         5zewRTJUnZegp/htVFW7zOuuHGgAr3+sVlT/RW5KpVfMiIFBnVdCEf3u0ipREhAbg88U
         FAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069993; x=1776674793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o0213UnEMOod9W6HJe+rSGORixl1p8NPdPniRuWrrH0=;
        b=lRnU9g+SEsqP+8k62PlLM1Wg/iIADrb6WZ7Q77SDITcLpTzXBfeJkJ9Oyc3f/wAe3K
         ghPnSssFFW/oYneuZzDEc7M8u2eLPGOHRBnK3dlOTgBtvzUM4b5YakCIOkTRZgL+eMlU
         3x+mQ1Pd8LFk19Cs3dwHL+5Nsdpi1Gz4PoPpT6kikIVj3ohAbHt/g8cVZNGpb0RAk3uA
         NDwl593gSBtYWD+bDNjYyawqjhiOQPeQ7PKJOM9lUxGamAV723YktsTQ8hW8ya3tQ6tW
         O6ApR/k+BX33oCHxLKynamjLcGOzAzSraeSioDLn2gJWe+qqX8MIbaKOBBpo9QECn5QW
         GwOw==
X-Forwarded-Encrypted: i=1; AFNElJ+k1RCzPoTMnzYbR5iikwnPUOMtDaztu0GpwWoYGrpGhLNSXdCWvx1/PlCAN8f7lC/ySfKyvqcdHTQX5Q5Oi5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8cPpzMYofV8dKg846FJP/acUumWzZ3I5Zk5Kbyj3DfYaQANSd
	7oTAaQKQAu/FupyS9O5Ip0PFL3pNQMRrC7II2Ygdu9C8dg4U+WR5G32pQ8vql4oBx+MATmGPdfC
	C7hC51/zHfl/TXWm/R/2DA20B7eWU9kzIgsi7TGt3HtitPoDJ0zyVPrBOxwcXw9vcTSg0YfaPG0
	BAiEIJlZE9+2gJ22N9UMr5mbjrxCw2Rwpey/nxFaUQxw4N
X-Gm-Gg: AeBDiev7QjAHSTV0fdZAgSgr5LTnDqzxNpkyRR/qIXhykz6eAu7rERraGTKLADSxh9N
	7GT63XYTG95Q0xFSHYvB+MBnkpcX+yHpvVG3VhF1m0plhxv/EE6XosdGHbuIqQLmLzvs1n5gmyD
	Mc0eTe74Ad/6NwRsre4ZUq9KxTXN+U5KIZu8eEETF1YQFbRL/0EBfVS8jrMJQIbnAqhYjnAES3T
	6jZFQ==
X-Received: by 2002:a05:7301:fa0e:b0:2c4:b8d6:45d3 with SMTP id 5a478bee46e88-2d5877991cdmr6669852eec.10.1776069993409;
        Mon, 13 Apr 2026 01:46:33 -0700 (PDT)
X-Received: by 2002:a05:7301:fa0e:b0:2c4:b8d6:45d3 with SMTP id
 5a478bee46e88-2d5877991cdmr6669840eec.10.1776069992889; Mon, 13 Apr 2026
 01:46:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402063714.55124-1-liwang@redhat.com> <20260402063714.55124-7-liwang@redhat.com>
 <CAKEwX=M150Hw0Ncs69SCWRr7J+vK5F0biotkz=MSFvFG3rgjow@mail.gmail.com>
In-Reply-To: <CAKEwX=M150Hw0Ncs69SCWRr7J+vK5F0biotkz=MSFvFG3rgjow@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 13 Apr 2026 16:46:19 +0800
X-Gm-Features: AQROBzATy_Du7HEcqoEpfm3ecefJ913kdNeZVB-cXtC9R6JcAITrAGqsNlgA3uk
Message-ID: <CAEemH2e76jseObPh5oj7H7KB9kJeucWeb5zSy_f74YMy-HcShA@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] selftest/cgroup: fix zswap test_no_invasive_cgroup_shrink
 on large pagesize system
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, rppt@kernel.org, david@kernel.org, 
	hannes@cmpxchg.org, yosry@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com, 
	mhocko@suse.com, shuah@kernel.org, chengming.zhou@linux.dev, 
	longman@redhat.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	Michal Hocko <mhocko@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosryahmed@google.com>, liwang <wangli.ahau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 8:29=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Wed, Apr 1, 2026 at 11:38=E2=80=AFPM Li Wang <liwang@redhat.com> wrote=
:
> >
> > test_no_invasive_cgroup_shrink sets up two cgroups: wb_group, which is
> > expected to trigger zswap writeback, and a control group (renamed to
> > zw_group), which should only have pages sitting in zswap without any
> > writeback.
> >
> > There are two problems with the current test:
> >
> > 1) The data patterns are reversed. wb_group uses allocate_bytes(), whic=
h
> >    writes only a single byte per page =E2=80=94 trivially compressible,
> >    especially by zstd =E2=80=94 so compressed pages fit within zswap.ma=
x and
> >    writeback is never triggered. Meanwhile, the control group uses
> >    getrandom() to produce hard-to-compress data, but it is the group
> >    that does *not* need writeback.
> >
> > 2) The test uses fixed sizes (10K zswap.max, 10MB allocation) that are
> >    too small on systems with large PAGE_SIZE (e.g. 64K), failing to
> >    build enough memory pressure to trigger writeback reliably.
> >
> > Fix both issues by:
> >   - Swapping the data patterns: fill wb_group pages with partially
> >     random data (getrandom for page_size/4 bytes) to resist compression
> >     and trigger writeback, and fill zw_group pages with simple repeated
> >     data to stay compressed in zswap.
> >   - Making all size parameters PAGE_SIZE-aware: set allocation size to
> >     PAGE_SIZE * 1024, memory.zswap.max to PAGE_SIZE, and memory.max to
> >     allocation_size / 2 for both cgroups.
> >   - Allocating memory inline instead of via cg_run() so the pages
> >     remain resident throughout the test.
> >
> > =3D=3D=3D Error Log =3D=3D=3D
> >  # getconf PAGESIZE
> >  65536
> >
> >  # ./test_zswap
> >  TAP version 13
> >  ...
> >  ok 5 test_zswap_writeback_disabled
> >  ok 6 # SKIP test_no_kmem_bypass
> >  not ok 7 test_no_invasive_cgroup_shrink
>
> I assume the test passed after fix? ;)

That's right! This patchset is targeted to thoroughly fix various bugs.
I rerun it too many times on various arches. All works well :).

> > Signed-off-by: Li Wang <liwang@redhat.com>
> > Cc: Johannes Weiner <hannes@cmpxchg.org>
> > Cc: Michal Hocko <mhocko@kernel.org>
> > Cc: Michal Koutn=C3=BD <mkoutny@suse.com>
> > Cc: Muchun Song <muchun.song@linux.dev>
> > Cc: Nhat Pham <nphamcs@gmail.com>
> > Cc: Tejun Heo <tj@kernel.org>
> > Cc: Roman Gushchin <roman.gushchin@linux.dev>
> > Cc: Shakeel Butt <shakeel.butt@linux.dev>
> > Cc: Yosry Ahmed <yosryahmed@google.com>
> > ---
> >
> > Notes:
> >     v5:
> >         - Swap data patterns: use getrandom() for wb_group and simple
> >           memset for zw_group to fix the reversed allocation logic.
> >         - Rename control_group to zw_group for clarity.
> >         - Allocate memory inline instead of via cg_run() so pages remai=
n
> >           resident throughout the test.
> >
> >  tools/testing/selftests/cgroup/test_zswap.c | 70 ++++++++++++++-------
> >  1 file changed, 49 insertions(+), 21 deletions(-)
>
> LGTM. Thanks for fixing the tests :)
>
> Acked-by: Nhat Pham <nphamcs@gmail.com>

Thanks a lot!


--=20
Regards,
Li Wang

