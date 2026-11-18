Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795046369;
	b=TGiVF21ll70QenvO1CSaLBmHPnnph+LwI0Gx/4cnkpngDXIH5xbDBdIqFkGhKKALExH1
	 GeXNBh33Pq11GHa2LPa7ZgmQD7TDwQt/JlKkU5jniEyFfZf48SyHwGkT0ZfTlnFKenz0T
	 n/ZeI9aLzjpMv/Fjz2FCKPsQ1ZwPPra/41auHJ9wmf1wNJUnVc+Zq+FR6VrB01buwDntH
	 0C/ll4xBsRjSk7pEVmtRIdDmziLunTg1E2lRiF0jhLRXyBHOd0GSwj6pahZVSIPaRzsll
	 LREGvdejxU1u/0BjY68N15rYUC15aWgui56xn00q6lGLD4ZrCua8n3H2ebuWcQRtAXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T6R/PYV+nSxp1UtaMco+VKM8S4ufxpCmVV0RFQLraMg=;
	b=Bw2snrcl4MDEnhgzJUDu2Da0+pJyO9PUYoPBQeQTvwgiohC0pTMLia5qqRCm51oHotYP
	 HfEI6Jk72G91yQZLSkiZ2mMZELavByXVooQZpAzhtDtr6RObVWGJZRykwiZ4kSHvHI7tq
	 gLcFFI2fBCdY88RBwLF4vUTApqJdIzOGuNs1W39AGFEhexRX84POP4F2QUU8M6tDmYoRa
	 zRwgz0211YMHj5kYnoHQ2YrlWLKDLwu2k43dffDHd8WSnLNzrQxD7K/eKk8K/sGsyAppK
	 prcmgaMNk3eHBgAugZJcqhH9FuIBCtK8iww2GqNfjaXXVTlh1Oghp3szVAfBvAZKewg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crosse.dev;
	spf=pass smtp.mailfrom=crosse.dev;
	dkim=pass header.d=crosse.dev header.i=@crosse.dev header.a=rsa-sha256 header.s=google header.b=LTwTP1XC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525B9606A32A
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 23:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 525B9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crosse.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crosse.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crosse.dev header.i=@crosse.dev header.a=rsa-sha256 header.s=google header.b=LTwTP1XC
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so1043151e87.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 15:59:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795046367; cv=none;
        d=google.com; s=arc-20260327;
        b=HG82GWm8mEmwpbqGKU01hSJKlslS4akrzFa++xXuW489nl6z0Slp4vtkJK8jGbmiK/
         Qq8LR6o/ZZVVK8K20e3wJ+5tv0bq69OdJbVyT60B99sFQiXuwQERsW33azrFxrVnqNwl
         Y4Hu0o3pfgZlT7e6vS9WCHVuAYopOfDzY1868irDgomNKW8uWwQvlln5/Zo5FHgMEi0W
         tiXk+89uodp1Fv3fq8SmgbbkNMhSttC/Nc7IE3m9bE8ETbcCBLK5YamSn2vnruYxzvBp
         ENsJsTeoFv6cVxDyAl+HVybsWb/nscD4k/cUhqfho/HEUN+xDdvdwDsJVxkOj7LChmWZ
         2Qpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T6R/PYV+nSxp1UtaMco+VKM8S4ufxpCmVV0RFQLraMg=;
        fh=liZzhsPW3j947lTT84Fr4MLVs/ogNafzdAhOrV54fIc=;
        b=Y/WTXka21aEmFFhRSmQj0q1bfAKdx/STkzdLTUVolq8dVHG1nAUE2x0c4hpX3t+a8b
         8t84zHCitPhSZ0fLNLnJXI92kx03Ano1HuCYM91Zm7IkFBUj2cyaKNU6zhIRyXnyL4Gw
         +IZX79dfSsUm8cMBt9D/oU95vEz+w+ukxuND7zROPAjDgvRwuoua50R14jW3WlkiRXli
         Lwt8xS6ecMz8aXUWZmTnq2aYd8/RLMK75K6gXvZ0anOJzLjqDWn1nRKx5i2JGJamWc2R
         Qg+z9/xygRq+KCKZpzU4ldudrdEZ0xxWehG75KrvIuxK0+4M/1vt9eACRozR0Lp3tGg3
         AfVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crosse.dev; s=google; t=1795046367; x=1795651167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T6R/PYV+nSxp1UtaMco+VKM8S4ufxpCmVV0RFQLraMg=;
        b=LTwTP1XCBdKUZG4tfRx5wu4oUSByB7xTmM/n1Q8XIc0hQR8QE2hdg+rfBBDhF/eA0V
         iw7ZxjM3xQuOqYSkpaGatIzPD8HZZ80rLBrykozLkXddarwEtW3/YMyRlM3D8h1TqRgb
         iR/K44rgcU6P9QVgvvGwwgJEP5fGU27fYldrXpacoMjmUhzMrHG4b39ain/oV2x+2pvO
         fOp1zDPrICIi8ISvwZhv8KYNFpserQpR6Dtn1JAZZVuqhFoBX/ADF3q8FCZkLtuvHlCx
         TavY2I8r7iKpl+lQCUNOo1/YFUE9XUtHzq/Yi+dSmDd9/hrva4MF2S833V4E5N3KD9WY
         LP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046367; x=1795651167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T6R/PYV+nSxp1UtaMco+VKM8S4ufxpCmVV0RFQLraMg=;
        b=iFi20uOmUC954u/rdOPi2cO0/LpGv58Ap0A6LgzKMDS7dN7eNQ77giRffnMIANoMWa
         zJ5eZgpYk+T8qcnveLPTIWd3JTWKHAfyShCvpv3yqkaLjJAP/K+O+Aej25aF2vDvQgE8
         axjQQ9SgL3RXrk5q3ac8Cnol2tj7y8qoA2XdXPaywzdPNa23dqnVf0PwR3Vphr2Wfn9V
         DmOZiY6Kr1rml43N/svrDJTIDiOPF8upprLPnT6nZ35+G8xYsY/iHLKGoAbcPPG+9Rrr
         UjNWNn8sW7runWfJ+bBbykLf6AvX4AS27aNyeX6MAjEy6dRp9kl0O/NnHKZ5LU6AuxiY
         cItQ==
X-Forwarded-Encrypted: i=1; AL+hErF1a00cSr57KW7r05L7NJPMFCU7CBBi5ZNkEU+132wODi7bwZSI/7VsW1X1K4dYZOuQYri8XJ65RlFmwZ/OW3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qEO19cUEhCNOwRPSf6E7++QelQqGk0evsTwhMapr2HUwI36JV
	ju2voq8ssFNHYM3fJ0EFuSNXET+hDdIrWGs42E+SPHPvUhj559ea/Lab+e11wYMtCiW5QdsHHGR
	xQ24JC3mcbBYV8W1Z/xwVRkTdyqkZ9NQdvZtgp1DAag==
X-Gm-Gg: AYBFou1Ey2y/b1DxfgSepAEcZAlj50MgoXaroTF/3MZO1bPqAisdSy2rXZy3rQgIrDg
	aOPa+qZKjxRnlxRusl0bw919rKqFY1GDfSklDKz7dQp/2xQnDEOAhWGzpkwAhGSslqEUI51QEns
	FTG02T1Y7abbSmZiCERhk9X8UkaG/wraru8QBtQtaB50VdmGjpcUtg4RJYbQp4ZnASWQya3zvYD
	Vj6B/Njkq450qnH3FT4ktNZhOV1AUtTDPOKexYmoJ0VZqnoF6y+oKcyPN5F1XIijc4MbFGzBuuj
	ApA1n81Hn73HuViSCy9/8uww7h4g+T4Ia4o1x3tgNfZnqN3vomB98nmyrxAsaswSddkxJEZOus6
	ltteX3/JfwptpZC04Nrb8TFKYjEEQYd/o9x0Z
X-Received: by 2002:a05:6512:10d1:b0:5b8:f81b:dfea with SMTP id
 2adb3069b0e04-5c1aa2ce5d9mr1273317e87.62.1795046367239; Wed, 18 Nov 2026
 15:59:27 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-mmpop-populate-v1-0-9c561d178d11@crosse.dev>
 <20261118-mmpop-populate-v1-1-9c561d178d11@crosse.dev> <e32482de-295a-4e26-b6ae-5b8b58f8b98c@kernel.org>
In-Reply-To: <e32482de-295a-4e26-b6ae-5b8b58f8b98c@kernel.org>
From: Harrison Crosse <harrison@crosse.dev>
Date: Wed, 18 Nov 2026 18:59:16 -0500
X-Gm-Features: AclHuK_1VAQDAg1dH3obLDVFJKWckiVyn_K5qUH1FINUpBm1FFDjoVLIC7OItpA
Message-ID: <CAAFYBzy=Rf+gtYBkHfR9MpmakDrZBpOEfk-rLxUtRo7RfiFy+g@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/gup: make mlock() and MAP_POPULATE handle
 VM_FAULT_RETRY properly
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jan Kara <jack@suse.cz>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Let me take care of this (or find someone more familiar with that code
> that can help).

Thanks for taking this over David!

Harrison

On Wed, Nov 18, 2026 at 6:25=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 11/18/26 22:56, Harrison Crosse via B4 Relay wrote:
> > From: Harrison Crosse <harrison@crosse.dev>
> >
> > If every read of a page of a file mapping fails, mmap(MAP_POPULATE)
> > and mlock() of that mapping do not return: the task spins in
> > __mm_populate(), submitting a new read of the page on each iteration,
> > until it gets a fatal signal. Touching the same page gets SIGBUS, and
> > madvise(MADV_POPULATE_READ) fails with -EFAULT.
> >
> > The first fault on the page reaches filemap_fault() with
> > FAULT_FLAG_ALLOW_RETRY and without FAULT_FLAG_TRIED. filemap_fault()
> > releases the mmap_lock to read the page and, because it released the
> > lock, returns VM_FAULT_RETRY before it looks at the result of the read.
> > It cannot report the error then: a fault that has released the lock
> > returns VM_FAULT_RETRY or VM_FAULT_COMPLETED, and neither carries an
> > error. faultin_page() turns VM_FAULT_RETRY into -EBUSY, so
> > __get_user_pages() stops at that page without an error, and
> > __mm_populate() calls populate_vma_page_range() again at that address,
> > again without FOLL_TRIED. The page fault handlers and
> > __get_user_pages_locked() retry with FAULT_FLAG_TRIED instead, and on
> > that attempt filemap_fault() reads the page with the lock held and
> > returns VM_FAULT_SIGBUS if the read fails.
> >
> > Commit 631426ba1d45 ("mm/madvise: make MADV_POPULATE_(READ|WRITE) handl=
e
> > VM_FAULT_RETRY properly") fixed the same loop for MADV_POPULATE_* by
> > calling __get_user_pages_locked(). That does not fit here:
> > __get_user_pages_locked() retakes the mmap_lock itself and carries on
> > with the GUP flags it was given, while populate_vma_page_range()
> > derives those flags from the VMA that __mm_populate() looks up again,
> > and may skip, after each unlock. Retrying with a NULL locked instead
> > would drop FAULT_FLAG_ALLOW_RETRY and FAULT_FLAG_KILLABLE, so a
> > userfaultfd range would fail rather than wait, and folio lock waits
> > would not be killable.
> >
> > Instead, have __mm_populate() remember the address of the page whose
> > fault released the mmap_lock. When the next iteration starts at that
> > address, fault in that page alone with FOLL_TRIED, as
> > __get_user_pages_locked() does, then continue with the rest of the
> > range as before. The retry reads the page with the mmap_lock held, as
> > filemap_fault() did for a page that was not uptodate before v5.1, and
> > as the other GUP retries do. With a persistent read error the retry
> > fails with -EFAULT: mlock() returns -ENOMEM
> > (__mlock_posix_error_return() maps -EFAULT to it), and MAP_POPULATE,
> > which ignores populate errors, returns the mapping. A fatal signal
> > still ends the loop, with -EINTR from __get_user_pages() or, if it
> > interrupts the FOLL_TRIED read, with -EFAULT. The other callers of
> > populate_vma_page_range() pass a NULL locked, so they cannot get
> > VM_FAULT_RETRY and are unchanged.
> >
> > Reproduced with ext4 on dm-linear over a loop device, with the eight
> > sectors of one page of a file mapped to the dm "error" target, on arm64
> > (Debian's 6.12.116 and v7.4-rc3) and x86_64 (v7.4-rc3): mmap(MAP_POPULA=
TE)
> > and mlock() of the file were still running in the kernel after 5 second=
s
> > and ended when sent SIGKILL. On 6.12.116, the block layer tracepoints
> > showed about 280,000 bios a second being submitted and failed.
> >
> > The analysis, the patch and this changelog were prepared with the help
> > of an AI coding assistant (Claude).
>
> Yes, that's rather obvious from looking at it, thanks for documenting tha=
t :)
>
> Thanks for the report!
>
> [...]
>
> > +              *
> > +              * filemap_fault() reports a read error only when
> > +              * FAULT_FLAG_TRIED is set: on a first attempt it release=
s the
> > +              * mmap_lock for the read and returns VM_FAULT_RETRY what=
ever
> > +              * the result. So when the last call released the lock at
> > +              * nstart, retry that page with FOLL_TRIED, and only that=
 page,
> > +              * so that later pages still get a first attempt that rel=
eases
> > +              * the lock for the read. Compare the address because nst=
art
> > +              * moves past that page if it is no longer mapped, or its=
 VMA
> > +              * is skipped, when the lock is retaken.
> >                */
> > -             ret =3D populate_vma_page_range(vma, nstart, nend, &locke=
d);
> > +             tried =3D retry && nstart =3D=3D retry_addr;
> > +             ret =3D __populate_vma_page_range(vma, nstart,
> > +                                             tried ? nstart + PAGE_SIZ=
E : nend,
> > +                                             &locked, tried);
>
> Yeah, that's quite the ugly code. Let me take care of this (or find someo=
ne more
> familiar with that code that can help).
>
> @Yeoreum, do you have some spare cycles?
>
>
> --
> Cheers,
>
> David
