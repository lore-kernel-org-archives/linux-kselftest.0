Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACFC3542F6
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 08:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773648352; cv=pass; b=tEHing8Hg8Q57/mkj/Dv+9xsuNauTQxr19+rTan/Uu6S4vTgkUo2cqmrgLO79D0ujp8jFf1AhvF3hDPLUEPGxcu9vLXk9TS8SVHMjB9hKMUZivKg0OvSq9RPBwJn5C035pMDe4ni6Me++PTANjRQfJg+SWinr3P/U2Ec4p2CmZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773648352; c=relaxed/simple;
	bh=bdScPVnsSaD+D5rBbEd4IKRSFhQUqItHVl2QejrINfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IaRi1Ql/PDQfXulnIze8xHuyMo/OdUu0Viuih6hbTl3XYhoWi+n08rJgi1NH2pntzW0FM6Wn/7MNDxYBVXATvZyGwG96dA0IIpWteXM6z6ntuXoDeTpmTZEr+CwZEcbOe6Z4xrIxulbMgag4GP5MGmu29Y83WWWng8YRjRiJkBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FuSwyXkl; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuSwyXkl"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ad79dfb6eso4618270d50.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 01:05:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773648350; cv=none;
        d=google.com; s=arc-20240605;
        b=Wc0YmNyIldxrLN9ToZmfJtxtEbi80x7SW31jHvxRez8Fou1VUkjTEaAmxCVXLj+bxc
         2cToHtOwEEXpSsHHhFUeq0gogLz7eGPDLlyGKFzDVFqdaPtFm+aTRGfmrHN4oZP3PNwP
         k+EUCdyTQtRdhjtL6+qw1O5MdXALc3KtVMi9x5rdwwSN1ntIjIKdaQi1VvKNVmlesfwV
         uwcn6xpwtnzdKEy0K2lBycDoVzsr04HqUOeNIyPtFArgPjrlo915IpHV93QH+VMuHu8V
         fIIzRWHxWp9Z+zi1nLsuDu4m4Vlww7xpHDyI95LKPlAyApBEV6aNA0QerwC6PqsO7yje
         BCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ntlsUflN+hnqA9YBuYkxoTPzbyNwVTClPHMLwCnFBWc=;
        fh=JvD4ZsrBgfnGnLpevv2o7VhR+KHuBQ49YU4RHwvNQoE=;
        b=B7NSjM5IE07mZGYjjxVxmYUbAHB85SZvKYsPUGJGX67CWP5Pn+F3l7YcVnwPIq+OIq
         Wf1wVgBRez6pjCQ0x22cE0VjaAeurFDowvz2tDMGdmYha4RjLvYM4Vh88G2PM6XEkhE1
         UTOur6BUsAt0NBILygficzyIrxW08CNqQf2JVRoAwIuOeQ3YUfZVbonDOnyfOdnHWU2x
         3HRU0b/nTMiZUwMh8y/bmrL4m1MSMcQeoqbS3ck4BsWiI6DrdkS4VbLOUt5hozSpW/6L
         JJUse6gV6aOo+fjM5a0rgWjdWD0/qBeOSCbRKGIZ6Eeo7DU/vD6lmZ8njLay4meHO0sm
         TM9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773648350; x=1774253150; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntlsUflN+hnqA9YBuYkxoTPzbyNwVTClPHMLwCnFBWc=;
        b=FuSwyXklUE/poytXURUHX/DPQ1FTJfK6frPQRRVIrgta/Y4hU4hwwj03fNcY/ecnU3
         jb94vHMIWfZyrkiinHkoaIbYNa+Fy/gd6imhppOgtsa+JZX0pjUv2nP6WPaWa2NWjgot
         wk+Q6yzdnsXo8xIz+hFB4epdRP6LtLlxz57aX/MKn1ZjYrt4WeX11NhLidJ0wc4VXETO
         I3ekAmw2vKA2f7H813ZcK9uOgeTnKfImab4Z8Cqu7sqzyaSgNCKmteIYBCS3CFC6xMpW
         GWg40cQ1fm7wXAtKy4suZFX08HbRTvIaojdJ8ikAtoDE3pIAE5mhOZap4tvtkSUtqBMO
         oCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773648350; x=1774253150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ntlsUflN+hnqA9YBuYkxoTPzbyNwVTClPHMLwCnFBWc=;
        b=YzY60epqB92dlBarm7J3edsGgHewJUOIgXIYQ69WzzzNrNnCoNU6L6Dn7wAhDrDErS
         cOCY+bldb+7a0h3aIdfQ9fgnrIX9bnqgpNyinJ202ihFFtBmAlGck4hez6ig65T8kkkA
         fr3AZYFBJhYZ3HCEdq9rS7B3wzu0VO+3X5XNTP1dBtW+/I2AXc2+zwxbq7qLMwxXQBM7
         Mi3JKN97Jd5sT248KOfb2KjoZ+D5akhSzEHLd8i9Lal+sQ6VJEu+oOK51ZiVDYZm7vtd
         WvdnTUpx+32PaqtpPoJ+lfk40MNo38tLgnVnFLNj49Wx33+ALqY3E3pdy3kFN2UtjvcI
         RwlA==
X-Forwarded-Encrypted: i=1; AJvYcCVseUuLP+8w7ORDomLtFEnY/YPfI8oOU9pgr7fw0ONCP/DGVlmlGpo5Vb7DVNdk6sOquZWgrHmbHveYZ3mTNjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLsJ9S9xzmVz3gS4SCBEqYf6hLuGQNnc91sfTxEPkfe/skOW19
	Kbzxd0Ep3VOGjjEyYwhZ2hp5rOOmM4U7BsFwbBU27XBZDh44azV6w8lIngi+qbZX3le1Bmq/mwU
	F6TlErB4yLG4y0idHieQQ5HbRGKLDXMU=
X-Gm-Gg: ATEYQzw92dSXZjlR0VlqbVXI75eAP0MhwMnnmxN3/wVBl/Y8dUx0cpDpiVgOSmTIY67
	32KapEMptIbwZ/RD7JIvt4BzfGPOAu+/qYNT6K5QQ37v8t5TWTPJbBE/RvpsNpW3kWMzpnk6qc8
	P1MFOCiZWTQdRCwer6wkyzDqSCl3wQdWUyGd+obE4hSIFWPp5WiDtmxSlU5nxsyEiGSxWeYV8/N
	zYMbkXmbVQ11PwJH59WT0Ict+4hSDSZ+FnA9uw+3WJqw7yyR+tcFapt3axHYR0qlYq1mUKrTFJp
	GjwWiFYh4VUptMFDvio0Caj7VKOD6bed1WbRc3Ylg2GljCOhVIxIUDumBoiw79fKWSUAwFK/
X-Received: by 2002:a05:690c:c50f:b0:79a:3cea:9153 with SMTP id
 00721157ae682-79a3cea9472mr55394387b3.13.1773648350077; Mon, 16 Mar 2026
 01:05:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306171815.3160826-5-rppt@kernel.org> <abe1FHyYinvfLYnw@hyeyoo>
 <abe15T7cA1B9lG4F@hyeyoo>
In-Reply-To: <abe15T7cA1B9lG4F@hyeyoo>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Mon, 16 Mar 2026 13:35:38 +0530
X-Gm-Features: AaiRm53AvxoTI5kbBO9SnbBGaJXcRPFivylwR41z7fGjYuzu7XmFh4zaFD0j-wk
Message-ID: <CADhLXY5ydBZL5gUQZCJnSTgc=8U0Xhaj_BtvgdBtPSmWh3NTEA@mail.gmail.com>
Subject: Re: [PATCH v2 4/15] userfaultfd: introduce mfill_get_vma() and mfill_put_vma()
To: Harry Yoo <harry.yoo@oracle.com>
Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, 
	James Houghton <jthoughton@google.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Michal Hocko <mhocko@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Oscar Salvador <osalvador@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, Edward Adam Davis <eadavis@qq.com>, 
	kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 1:19=E2=80=AFPM Harry Yoo <harry.yoo@oracle.com> wr=
ote:
>
> > It seems there's another attempt to fix the syzbot report from
> > Deepanshu Kartikey [2], which I didn't take a deeper look.
> >
> > At first look [2] looks a bit wrong way to fix to me though,
> > because it allows operating only on a single VMA nothing should really =
split
> > or shrink the VMA if somebody is holding the VMA lock in read mode
> > (and the validation of the range is done while holding the lock).
> >
> > [2] https://lore.kernel.org/linux-mm/20260316070039.549506-1-kartikey40=
6@gmail.com
> >

Harry,

You are correct that once vm_refcnt > 0, nobody can split the VMA.
However the split can happen in the race window BEFORE vm_refcnt++
in vma_start_read(), and CHECK 2 can miss this if mmap_write_unlock()
completes before CHECK 2 runs.

Here is the exact race:

vma_start_read():

    /* CHECK 1 */
    if (READ_ONCE(vma->vm_lock_seq) =3D=3D READ_ONCE(mm->mm_lock_seq.sequen=
ce))
        goto err;

    /*
     * RACE WINDOW: vm_refcnt is still 0 here!
     * UFFDIO_UNREGISTER can run:
     *
     *   mmap_write_lock()    -> mm_lock_seq =3D 11
     *   vma_start_write(vma) -> vm_lock_seq =3D 11
     *   __split_vma()        -> vma->vm_end =3D 0x4ca000
     *   mmap_write_unlock()  -> mm_lock_seq =3D 12
     *
     * writer completes entirely before vm_refcnt++!
     */

    __refcount_inc_not_zero_limited_acquire(&vma->vm_refcnt, ...);
    /* vm_refcnt =3D 1 now, but vma->vm_end already modified! */

    /* CHECK 2 */
    if (unlikely(vma->vm_lock_seq =3D=3D raw_read_seqcount(&mm->mm_lock_seq=
)))
    /*
     * vm_lock_seq(11) =3D=3D mm_lock_seq(12)?
     * NO! writer already finished and unlocked!
     * mm_lock_seq incremented to 12 (even=3Dunlocked)
     * CHECK 2 MISSES the race!
     */

    return vma;
    /*
     * returns split vma with vm_end=3D0x4ca000
     * but vm_refcnt=3D1 (lock held)
     */

Now mfill_atomic loop runs with split vma:

    while (state.src_addr < src_start + len) {

        /* iteration 1 to N: dst_addr =3D 0x1b1000 to 0x4c9000
         * all within vma->vm_end(0x4ca000)
         */

        /* iteration N+1: dst_addr =3D 0x4ca000 */
        err =3D mfill_atomic_pte(&state);
            mfill_atomic_install_pte(state->vma, dst_addr=3D0x4ca000)
                folio_add_new_anon_rmap(vma, 0x4ca000)
                    VM_WARN_ON_ONCE(address < vma->vm_start ||
                        address + (nr << 12) > vma->vm_end);
                    /* 0x4ca000 >=3D vma->vm_end(0x4ca000) -> WARN! */
    }

Without my fix:
    CRASH at folio_add_new_anon_rmap

With my fix:
    if (state.dst_addr < state.vma->vm_start ||
        state.dst_addr >=3D state.vma->vm_end) {
            mfill_put_vma(&state);
            state.dst_start =3D state.dst_addr;
            state.len =3D dst_start + len - state.dst_addr;
            err =3D mfill_get_vma(&state);
            if (err)
                break;
    }
    /* catches split, re-lookups correct VMA safely */

So both fixes are needed:

Harry's fix (state.len):
    fixes state.len uninitialized
    mfill_get_vma validates correct range
    in the first call before loop

My fix (bounds check):
    catches split VMA that slipped
    through CHECK 2 during loop
    because writer finished before
    CHECK 2 ran
