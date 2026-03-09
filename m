Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F04D36B04D
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 08:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043325; cv=pass; b=vEZplBk2CVYby2yu3UEPmpAX90YhhNwzHMuaX5cGEqJNUdPSUKOmvmIYD1Wxw17Qr1LWUa3INTnYNBae6JMa36Ust/gUgxUPnq00NdVJOeNRDYN35ul7GyAIruNWpn0XuPXOgLiDvrNr3AFXXpLWgHYiREGD66g1HY64VSN4Wvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043325; c=relaxed/simple;
	bh=YZGVdYoM57Ljoy9ZvHaawIawTucwlY62ulstM6rXlh4=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XLhLCIF4kYkTiWRla6RcaMj7y4EmCdKVLIA/bhchrNSccLnaLZf1IgrFv7PuaOpFewWTbeADLFqnqSgNinfiSfEaNwZ0dckukygcJ5ID84Ps6XNEvNYvD/z1+jj9N0y4BzbpHOiNLW6UJUDzZKkFDufcGloWvdwQZd0rxdBNo0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CrUxksLl; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CrUxksLl"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94ddba39060so3086034241.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 01:02:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773043323; cv=none;
        d=google.com; s=arc-20240605;
        b=LVC+S7iFLR65uHsRIFgb7cp6hRnX38PcVPSLFirmQZKZhf3EonYQ6iiLQuBkBNpVax
         DVaIR7MUQtU898baNdZkpdqVFmz0iJA1+9snT6NhMhC5u/I/qTfL5D/50j8twupmxAbz
         NaadI0h0YpoCPWTPJSYJ8UnLzNb0sWRaVkxGTgs+q99G/6+eXM1hHqORfE/7pwkul3sh
         I3DlrjLy2LbleZYOA4xHRxjK/3svTfCzubEGoPg48UIW+LufQOfbXti+Vi5s8wOHi50k
         hn95rPHfDDZm3emiy1JPgbKbugVOHkfT2RzD1k0tAxwPojiu6NNCZNQQMRPOIgOl/Oyj
         umcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=5iKTwpN//vgpsNCCXbcsIw/eIDxxyup8fH8lZJsZvpA=;
        fh=Hrl7H0+N4tvLG4HJ+5We4gdTrSwyLGVswEV+nO4l+0A=;
        b=EqkypYC/R4Vg2G06Io3JLxyJeTuoM7D7+n6IEOJz2x1cTjFNYHduHg2GQ5k3+yO9nL
         ElYA1majRFOfkJluuO/D1rJ1BjPLVvM1LRa1X2dUgxBXyMNRZyhhdhl4yxmA465Qybjf
         Wi45J/1qJx3hKXZBnKli2p+0jrUczA/bfUF5/gr5IXTQKjdhlY6eLcRZ27oKPD4cBkzU
         90bxeO8ifvF68kKJe+lUbxpGLt1hBWsXhISmtU5NfzJqYtYQg5tBRxU+c7J5aAFp9h4C
         h3+y0NUdp7lHmM4WmlNYcf/6TCE/WFTJ+FcyYER0+8Qt+GnnYcpH2dhLE/CSZ9mR6QG6
         W9Iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773043323; x=1773648123; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5iKTwpN//vgpsNCCXbcsIw/eIDxxyup8fH8lZJsZvpA=;
        b=CrUxksLl5ZhEZYNX4dpMjta5jQtWUxaGY397oFvuTSjQP75JG2G1HWvyS6ZqkmPcLz
         XvcQiDeqw5wCuH6rdcu9qevxZJ4edrBqvyLN+jZCBZI7i0QjntVHe94mUXQR9RAv7Nwk
         ksMwRgzT/mrbQvpijMpv6nDY5M9sdyPrX/gKAvNW0TAwXzlaVPNg+nN74qwzVSEyJa8S
         xiQwjlrZcVqPUquT9tTUQ1SgvoYKq7IDxllJoWCewzOM+GDBxkc8iNh3rnjhhhPq6Cn5
         wirgUBRicT7dgfzd8N6KQnfVuHKtoRamt4sJI6b9occkPgO7COKShMIAgo3vpP0oPYpP
         YNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773043323; x=1773648123;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5iKTwpN//vgpsNCCXbcsIw/eIDxxyup8fH8lZJsZvpA=;
        b=FR8idtAfGUl7HqQQORaut9iL+aPQn4xPYuBByHILBgTbikRrwyvdHoO+xbDvQw4+Xi
         Bb6Cfgmkx4EEWc46MPTgXdWatC+yCAxnpfki4gso+2Lo3NO8Z7yQTLW1RHhftPdOdnNA
         xs+g4Lqddb/V0Nz/l2wwd4CFMlV9foQaE28dSMIvkJhkWrNSDRs9/tvJ2K1X+eQ75RMx
         jNcdCNWPJ03p4VrdHhSm63KW86DzxjnfAhMJ5X24hxZxa9MVV5noordgN5wpF6bD/9GB
         mvkGtBYI7Bixva9lGmv2A0aOOlzhit78xPG98S8B12n2u2rMo5+lTmqUXGIZhFom+XKL
         d4tw==
X-Forwarded-Encrypted: i=1; AJvYcCXEJhWCh+lQg4ppRci5Tf9luWD7wVvHZ5i3bfRNdF2LsnUA7rogHs/qtqOKUf7XC9b2DlMlXFpMYy+KT2hUkdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi/EF1OXZ32+6ayeHa437M7fQquaLYSRXap2+FpcE92rIOkBSm
	SEesyYhElWtQX2vsM0qjGsJgedkCztTVeAuFee3ReQxA/hU+FcP0v7S5mgwoS6NyACYVnO3Dijy
	u/QP+e9ig3uSr+N392+RKY4k75HZK+PxgrUy3OG/S
X-Gm-Gg: ATEYQzx3A0QSxu+z7lEl9H2QI6OQTiNvB4hGqMB9PeGF6VcIdYU9/ebhAVXWQ0ZgS+T
	NpqJO2PyKsk1ke+FM78AntdF7j3U8NogiGqZGG1SX1V/5UCxoUT1tejchHUZ8pCUVuo/Qr2x61D
	EgObgpkXvrwEsxAUQOEQUHoOvXW4APOPGclMtFnIL3iFO7gBUfY3PjIelWu9B9mrw5oQJO/F3Vj
	M9jm9CE15NPvHGZKOFzy7U5X3KzIg7QZSxVXPEMLv6mTD8KQAOGG/9n8Di2JYykEyIBUUw98SEq
	AJtNaNWXeq/evHSQDfvWHGjyB6SO9Mkc1dpPCNwachI3R0mStEyGkhY7fJlHc1Mw/eujBw==
X-Received: by 2002:a05:6102:4194:b0:5ff:cee8:660c with SMTP id
 ada2fe7eead31-5ffe61bf0d2mr3868411137.31.1773043322886; Mon, 09 Mar 2026
 01:02:02 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Mar 2026 01:02:02 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Mar 2026 01:02:02 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aahNprLw0_Cdhzxp@google.com>
References: <20260225-gmem-st-blocks-v2-0-87d7098119a9@google.com>
 <20260225-gmem-st-blocks-v2-2-87d7098119a9@google.com> <5097ff66-b727-4eac-b845-3bd08d1a0ead@suse.com>
 <aahNprLw0_Cdhzxp@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 9 Mar 2026 01:02:02 -0700
X-Gm-Features: AaiRm52tdsuammFV80Tf5JuKg-WPQwxrDNCct9c5X_bV6T_IkMHGIVZ0r4R166A
Message-ID: <CAEvNRgFwyqY0q-PTvMGjK82rxvbCfPxK8-RUPML3w_8mzAk8xA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/6] KVM: guest_memfd: Directly allocate folios
 with filemap_alloc_folio()
To: Sean Christopherson <seanjc@google.com>, Vlastimil Babka <vbabka@suse.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	rientjes@google.com, rick.p.edgecombe@intel.com, yan.y.zhao@intel.com, 
	fvdl@google.com, jthoughton@google.com, vannapurve@google.com, 
	shivankg@amd.com, michael.roth@amd.com, pratyush@kernel.org, 
	pasha.tatashin@soleen.com, kalyazin@amazon.com, tabba@google.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Mon, Mar 02, 2026, Vlastimil Babka wrote:
>> On 2/25/26 08:20, Ackerley Tng wrote:
>> > __filemap_get_folio_mpol() is parametrized by a bunch of GFP flags, which
>>
>>                                                            FGP?
>>
>> > adds complexity for the reader. Since guest_memfd doesn't meaningfully use
>> > any of the other FGP flags, undo that complexity by directly calling
>> > filemap_alloc_folio().
>> >
>> > Directly calling filemap_alloc_folio() also allows the order of 0 to be
>> > explicitly specified, which is the only order guest_memfd supports. This is
>> > easier to understand,
>
> That's debatable.  IMO, one isn't clearly better than the other, especially since
> filemap_lock_folio() is itself a wrapper for __filemap_get_folio_mpol().  And there
> is a cost to open-coding, as it means we risk missing something if there's a change
> in __filemap_get_folio_mpol() that's beneficial to guest_memfd.
>
> As Vlastimil said, if this greatly simplifies accounting, then I'm ok with it.
> But the changelog needs to focus on that aspect, because I don't see this as a
> clear win versus using __filemap_get_folio_mpol().
>

FGF_GET_ORDER() indeed caps the order at 0. I was overly focused on the
earlier line where it did mapping_min_folio_order(), where I thought
other code could possibly influence the eventual order.

I'll revert to __filemap_get_folio_mpol() in the next version and see
how that goes. Thanks!

> And if we go through with this, we should probably revert 16a542e22339 ("mm/filemap:
> Extend __filemap_get_folio() to support NUMA memory policies"), because guest_memfd
> is/was the only user.
>
>> > +static struct folio *__kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
>> > +{
>> > +	/* TODO: Support huge pages. */
>> > +	struct mempolicy *policy;
>> > +	struct folio *folio;
>> > +	gfp_t gfp;
>> > +	int ret;
>> > +
>> > +	/*
>> > +	 * Fast-path: See if folio is already present in mapping to avoid
>> > +	 * policy_lookup.
>> > +	 */
>> > +	folio = filemap_lock_folio(inode->i_mapping, index);
>> > +	if (!IS_ERR(folio))
>> > +		return folio;
>> > +
>> > +	gfp = mapping_gfp_mask(inode->i_mapping);
>> > +
>> > +	policy = mpol_shared_policy_lookup(&GMEM_I(inode)->policy, index);
>
> This is a potential performance regression.  Previously, KVM would do a policy
> lookup once per retry loop.  Now KVM will do the lookup
>
> I doubt it will matter in practice, because on EEXIST filemap_lock_folio() should
> be all but guaranteed to find the existing folio.  But it's also something that
> should be easy enough to avoid, and it's also another argument for using
> __filemap_get_folio_mpol() instead of open coding our own version.
