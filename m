Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0128B4DCB25
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 14:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419911; cv=pass; b=myi4irJluRHQrgzB55V2Bri9PuNPRioTvMe//MwHxLyHlL7kne8zrRW9U5rFo8BpOaWeYl4YQtu2ISI3ZiJDpXkSnieS2obqwEZcq/BSjRkzgc0EMsW8geoDuMAR+DuG1scKfShUcFZklukxA2Pd91BCMWY+9aHh8U6qsC0qixo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419911; c=relaxed/simple;
	bh=6FPHXzxOfaEvuVnHK1AKn0tEnzGm7yA7ItjkggCP3w0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CpvCdrbRrtUyv6Xbh00hLJnTGsXbsqojiXojUub9/OShxLrgYjT5TXBRoGY9AjeX9Q6Xfxwq1W7UO903nSDIFmPu9Rv7OO2N4pkkHrCFex9DFoV/lDFdirvsRCQBNtnyxhVXF0Hyih/Sjy/Itr2pa/Qc9Ar0tf7zOIw5dHk2P44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O6PUu6pe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nf9igYyJ; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O6PUu6pe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nf9igYyJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792419909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+XXPCAKR9i1PdeuwWGGQvHpwQuIulYAqTmpYB26s6s=;
	b=O6PUu6peDz/ui711K5U2Wd7FNtC8jrSsWVVK1x/Jn/sFyA56xq1UGGts3lxiJnnE89nzkV
	c0PgYnCPvbZtL5l+Cjw1tLs1qJ7DewFsclgROXuYXuc60rtayWJi+8bpKspdw75FSi21zM
	Es4DF6fN1z3Z5aDl1sx4amqFUtDMUDA=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-46DAsIjfM7i1eXQWEJ1xgQ-1; Mon, 19 Oct 2026 14:25:07 +0000
X-MC-Unique: 46DAsIjfM7i1eXQWEJ1xgQ-1
X-Mimecast-MFC-AGG-ID: 46DAsIjfM7i1eXQWEJ1xgQ_1792419906
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3ab34eca524so5466161fa.3
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 07:25:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792419905; cv=none;
        d=google.com; s=arc-20260327;
        b=hZ1MuqvjrBuKaxa9jEQ4nkaV9zNbovDKJiHnatqzGXfw/Mtn2/p7IgKv69gRR4bmJ8
         5Bo4CfAjBhcXMCvF7y93C9/GakD0fCsNjKC/fFUQVcJuK9as3whIOn202UUvrQZQtjY1
         ZwPt0ikLzr8+6Go4aJhLvvL0fClsDUQWPIIgUipxfV/jeVcOGA/zudr7P/RsA89EdaSP
         vCZ30VKwklgCDBvbX8RBF2q8rdS/a5Adj/m4fLEgT1VaCMzfl7SsuBbiOr6vV5A1+Ud1
         CN50Yrqvxdcb6SpJxCp5W2Ce5UHapnnA+l8ShPyMxMR52lbPm5I2U/73eNO4Stpns/IY
         Uq8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t+XXPCAKR9i1PdeuwWGGQvHpwQuIulYAqTmpYB26s6s=;
        fh=vQO3TaBgst9sJPza0SL8HjPRXVVcF4qnzifQwSRGkjc=;
        b=JzAEppKarHGsiqMvaVYkk1Y+Jxy/DqzmfsSLEgXPs1QegIAt7yTRpR0o7H9P4mUtbv
         5TNjt7GZtVfdbhMiMEKi27wPSVySQX0mLWi7ioNzwIPYoPZwbYfk/qtz26C1FNshGt9R
         dfDnJS/aBmifo3hvxrHoMskOiSHhPIvmZq6Xo2r0IKQI19MJW0smsBrsRUzorP6dxqjr
         PpOjtGee2dlQpj/8lSzmaxOoILl0tuVNrLIyNHMoOv0ZnoEclO+EWOrG20KVFeTOxEWy
         0q/jzHM3dWUfyNjN4y2PHNcWLq3awbHG8jElx2K3cKBK9ybmXMsvDjTeg0UZGC8VWI3Q
         MizQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792419905; x=1793024705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+XXPCAKR9i1PdeuwWGGQvHpwQuIulYAqTmpYB26s6s=;
        b=Nf9igYyJTK3Jgny5BloiiHCM55oHq0P2zoqalGChzEx4oDz6344TGAKHvY2T1b6/CU
         w1xEzcp0ApD7jTG5S/8LMDtlDEo9XLjpBAnRNdxjNcliC1EzSRszcNDfeHBvacKJLuEy
         oJsO3ibSxaMyu7HrC54873FsNsimwXrDxQZ8iQeniKtuEp/ZP70xkNEUy2fTqh1fxMqm
         xLAnIQfvTdqPbynwNp9oEVpLy/yS0Aavt0S5AJtP23h0h4ZAjl4sM1zRzyEauUBoVzUs
         XnXuMfNT94z0MnMMQN1cd98IuIcZg+BRM76AhIkXIWZ2bZ437NMOA8WZxf9C3dADyvFi
         1NMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419905; x=1793024705;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+XXPCAKR9i1PdeuwWGGQvHpwQuIulYAqTmpYB26s6s=;
        b=daNFkApuc+s4ZNmBXpTVkDDSpTCZQ8ej4UeXiPVB9H63b7gMZK3OYspqQQieeXJpe1
         p+5134yCMtUG+F5Wy/bo1cz9u4TbZK+UsrMUjmLkQZRaOyYoUw3MflCbtUFvZsKrYVN9
         JuMgeZSc6kN5CIeXThNr5w2B1zIKjBKcSrwRSVera/wR5z+KoMxRUKOLEgHY79xLH0lm
         NnlaXJlUzP/Hf6026F/HpWX28d326BeSmFzbYEvkCErBSI1f03o0xR0FP6i6pGNW2Lgn
         9p4wCjDwPfGSdQaI4h6CEh9LqxT/uETDTA1pcHyiTl/LjTaVqsgWnafNHnjj0yVtIuay
         UNrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlBVUn8+lQUh/nDESOlq7yWEw6L7iKYrtvGFBf3Z0Jg+ld5qd/Bm8A0tfSE7RHcQsO0gZjETx1/izricCZObA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtfwn8g//MMMrBqeXEFOivRF6sPXQn2hU8CqPDnvy0kUT/kRpP
	dD+kslZ4jnwi9QjoWhcxngGkxkdfYXlpUWrF/jl/VKvwjiiQ30E9jHOKH+7PGSpTzo8fcYC8HI2
	la5LN6zCaQpiBr1OY1Stx8wNcEXOQBd2g2h3Qyo6BBhk3Jpl0+xBz80Ov4h5hzJOTbSDfvKa6BB
	bcmsQOXzvDxAI66KMwVhCyk8qJOsHVRTBfwn0RDhGKLuCx
X-Gm-Gg: AYBFou1Sc6/v4QxLzgQhHhX0QaeTSlVnTyTziVSDu7HLtjsc4uhNr+SAoTSvImuoUBW
	50U4uHchGlTRYk8WA3yJxPWrrquyN+Dj7iA3IfaNzFtgFyTzOH4HQOUEg4/p7vc3QteLSLOE6Yx
	VYeeV+LUIqCjN15R0XEJN7i0Rbfx2Kw8EqW0CioEx8qdk6RUHwVu//KZttRNZ0OEDqd/Xedvs=
X-Received: by 2002:a2e:be8d:0:b0:3a6:48ce:2b05 with SMTP id 38308e7fff4ca-3ab293008d2mr20364581fa.24.1792419905471;
        Mon, 19 Oct 2026 07:25:05 -0700 (PDT)
X-Received: by 2002:a2e:be8d:0:b0:3a6:48ce:2b05 with SMTP id
 38308e7fff4ca-3ab293008d2mr20364511fa.24.1792419905099; Mon, 19 Oct 2026
 07:25:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018-bug-selftests-mm-ksm-tests-nohugepage-v1-1-55ed54bdad35@gmail.com>
 <4a6ddf56-af89-482a-b173-18e181bfc3ae@kernel.org>
In-Reply-To: <4a6ddf56-af89-482a-b173-18e181bfc3ae@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Mon, 19 Oct 2026 08:24:37 -0600
X-Gm-Features: AclHuK8zKZKMm5fTjvg9yQro-QDDhE55HWKI1sJCDKDoRQ2ReZ01Whinkm8cRqk
Message-ID: <CAA1CXcDZuHkPpRjE_f1J9Z_6a-JJokAEsCNg+NKfrNviBTt_pQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/mm: keep ksm_tests on small pages
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Qiliang Yuan <odys.yuan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <shuah@kernel.org>, Usama Arif <usamaarif642@gmail.com>, Yu Zhao <yuzhao@google.com>, 
	Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 7:38=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/18/26 06:53, Qiliang Yuan wrote:
> > ksm_tests fills regions with identical data and checks KSM's counters
> > after merging them. allocate_memory() maps these regions without any
> > THP hint.
> >
> > With mTHP enabled the regions can be backed by large folios, which KSM
> > splits before merging. Splitting an anonymous folio maps its
> > zero-filled pages to the shared zeropage, so with use_zero_pages=3D0
> > those pages never become KSM pages and "KSM zero page merging" fails
> > its count. "ksm_tests -Z -p 10 -z 0", 20 runs:
> >
> >   THP setup                     before    after
> >   default                         0/20     0/20
> >   every mTHP size "always"       20/20     0/20
> >
> > Map the regions with MADV_NOHUGEPAGE, as ksm_functional_tests does.
> > ksm_merge_hugepages_time() maps its own THP-backed region and is not
> > affected.
>
>
> That's actually something Nico intends to fix:
>
> https://lore.kernel.org/all/20260609114619.144416-1-npache@redhat.com/

I will try to get the fix posted today!

>
> >
> > Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when=
 splitting isolated thp")
> > Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> > ---
> >  tools/testing/selftests/mm/ksm_tests.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/tools/testing/selftests/mm/ksm_tests.c b/tools/testing/sel=
ftests/mm/ksm_tests.c
> > index 5fd7792a0d479..140ea833353b6 100644
> > --- a/tools/testing/selftests/mm/ksm_tests.c
> > +++ b/tools/testing/selftests/mm/ksm_tests.c
> > @@ -178,6 +178,16 @@ static void  *allocate_memory(void *ptr, int prot,=
 int mapping, char data, size_
> >               ksft_perror("mmap");
> >               return NULL;
> >       }
> > +     /*
> > +      * Splitting a large folio before merging maps its zero-filled pa=
ges
> > +      * to the shared zeropage, so keep the pages small. Ignore EINVAL=
 on
> > +      * kernels without THP.
> > +      */
> > +     if (madvise(map_ptr, map_size, MADV_NOHUGEPAGE) && errno !=3D EIN=
VAL) {
> > +             ksft_perror("madvise");
> > +             munmap(map_ptr, map_size);
> > +             return NULL;
> > +     }
> >       memset(map_ptr, data, map_size);
> >       if (mprotect(map_ptr, map_size, prot)) {
> >               ksft_perror("mprotect");
> >
> > ---
> > base-commit: 90201351a862182bdabfc1ad1c97b1e1b6ed5931
> > change-id: 20261016-bug-selftests-mm-ksm-tests-nohugepage-1414868db0ef
> >
> > Best regards,
>
>
> --
> Cheers,
>
> David
>

