Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B243BD646
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 11:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031511; cv=none; b=CBdI2yQfCdfDU7HG2U1GJx1hCoz/ML7sjN/WbkxrcXH87ANQVWGRJYSuA7yPY04057rZcHNbg6+7yCVxBwQdU3B1dVP+BK2UDSPLwa12UD9dGWYjKZbIklvzyAckYTxLd+qoi3R8U7uj6EL06z+/i8w8lxkr7iRdTnyXNJBvBho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031511; c=relaxed/simple;
	bh=IXqkzhjdS3SL5Z8Nxy9tqGO8aU/DK+0un1yN9Rbn0xE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5lp6wCYc1I+5Jv6s3+ZUN/vq7UFObcUSaJIJG3127+xIF9OYPxCSGo4WAACBpa/0f8I+PYvIUd2ayE/JPB2dotopGp7+smIkQ+bbYR7Q0F1bfHVyE8SMFEOg4uvMRplMvWTiRQiVAjgk/l8FzzvMGzWC1IxSXwe3ql4/b+S6Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WtwYNfEx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KdQ9Lijl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WtwYNfEx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KdQ9Lijl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777031509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GPTaXwfQ0pC1v72UmTco14ZekCM1pyHL+NlaDMIoFPc=;
	b=WtwYNfExDRDHNJodo1Pt6+HhZzPSTR8wR8+ymtag+VmiDeApi4kAYCslbLT7xNvK1I+FCB
	dTeCzwQ66dDTjFus/ESs3LnmTmU1RjCzK8a8P26qdyJ/0noL9+wx0THWuCLhuoEpsgbGe+
	bvpBr19XoVAn2sCZ/bUtsr0QYqZna1g=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-CcMhVCaBP0meZNp16jDXhA-1; Fri, 24 Apr 2026 07:51:48 -0400
X-MC-Unique: CcMhVCaBP0meZNp16jDXhA-1
X-Mimecast-MFC-AGG-ID: CcMhVCaBP0meZNp16jDXhA_1777031507
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d5b5d607d1so1520847785a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 04:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777031507; x=1777636307; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GPTaXwfQ0pC1v72UmTco14ZekCM1pyHL+NlaDMIoFPc=;
        b=KdQ9LijlYdyIePsA96+0tQrmQ/2KInYM+BppFx9SFezDqQyzH06iA1iHysYqS0fgeV
         BXBu4HfK5C5yhLx+xc/nvy1Rx96JCNzAursLSYlEtYnA/X5hIN+Anejxf/treDAJG+1L
         w2I/O7qyBPn2iIeDPjNRCGLlZWw7OflePeRzMeXjyG39Ua2rdln5FzRU02xDUd3f3i+V
         5mH55cBxZzAum7NWuy5IJGRxG4eC+z6H6Y+qO430IcgUrDL4Am/huCZG9i6UMxC1yq3I
         gpkT8SwvitwqTy3i8v++Udr4KLgg4Nm4OdWTWgzJY6F+/r2S7rCcmTvyz1z/MHkrqR0V
         MSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777031507; x=1777636307;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GPTaXwfQ0pC1v72UmTco14ZekCM1pyHL+NlaDMIoFPc=;
        b=sbWs0fd50V0PyjkJFkdBBPl+y+gXs2z9GzgUzwWUNZF6rXLOFPVTsSm4AOpK3ZHekW
         7wMNiXF2mQJ+pfJyYw2eCqH3/4RoCzwnsXC5UHzbgeke623CazQxKpCWdecS4sfvtJ6/
         lsNO4DHH18D/LWL9rTt9k5cAoqJ06h6OB7DXahU0B8YL65OjGBSA5ilW5Yoo/qd+MeV/
         eDNvhUxC88jb8Fe8K0P2mMzo9OAXN7lzI1iV7rXvK0vkuTlEyStazgUdt4GvJldxthpo
         4HtgroDbGAuwKkSywvItwf2T2bAp5BazgVwSPgIUb0fuz1YEAW7u632ZnvTghMy+7wB1
         Yavg==
X-Forwarded-Encrypted: i=1; AFNElJ/FqwkqBESNkuGBveFC1KNTqoU9e9eCJyByAke3xwhPOSPrd+Vto5IX4W5UTAeK7TU5HfLcOdznRwQ1yoqyfFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw59o4tOpsJ/NzzQH6uVehwRpeJx2GqmfsGmUdYgldtW0x9Gy3i
	4WdWfCkyMVoPu4wKgBDh/3b+JDhXNf8hI3ONUyU4XrgLQmgTdcO5+ULa4hMWF9+v21yqNQPFdyl
	joEE/+zsVzOFidZzL4SrC999P53Ia1fkOqfQXKiZUU/artirQE+QI9e7kr+EtztnW6mEQMQ==
X-Gm-Gg: AeBDiesUfZMpqM/EbjPMe8i4ICtbNZiFekpOGxnQRvRaKW3bRh0w+wjLuCpoGp0a200
	3UQwsX3XI64CQGUW7/3YBuYyfl71rTrJEnnZaF5E3nXbiZXmQm+h9WRcluethk+laiIJoNB++Jo
	Yl6FDcO1NP81QMtgqfW3dnLP+YlVy8MLyDqGq7OvSMT6wUqlIAMxyGiYYQC4EpJHalHyk606Woj
	P6sXaQwK2Y5WspuORe4V4Mr7yaQ/dFRJ5a8rO4oonU/ia7r2JzoC/PRFpVjxPM2oa0du6lus6yL
	jn/aigYB4NiM3xxx4qSNO8j3q7zrRpY912cVikRSMdBCgR1xXTQZ9lPhPRQ3wMApmiEiCUxut03
	CPDeVq0llwucZKogXpSHQWCgRt1Q6AspCuiUd0y/BbXoWjdUUqL8CPr4UDQ==
X-Received: by 2002:a05:620a:5698:b0:8eb:605f:6cd6 with SMTP id af79cd13be357-8eb605f8de1mr2383251585a.60.1777031507390;
        Fri, 24 Apr 2026 04:51:47 -0700 (PDT)
X-Received: by 2002:a05:620a:5698:b0:8eb:605f:6cd6 with SMTP id af79cd13be357-8eb605f8de1mr2383245685a.60.1777031506710;
        Fri, 24 Apr 2026 04:51:46 -0700 (PDT)
Received: from x1.local ([142.189.10.167])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d64cce76sm1958573085a.14.2026.04.24.04.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 04:51:46 -0700 (PDT)
Date: Fri, 24 Apr 2026 07:51:44 -0400
From: Peter Xu <peterx@redhat.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Zi Yan <ziy@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [RFC, PATCH 00/12] userfaultfd: working set tracking for VM
 guest memory
Message-ID: <aetZUOINzfTXChLL@x1.local>
References: <aeImfRrrvr3UoKtL@thinkstation>
 <aeTnlQUOOh-dHG8z@thinkstation>
 <34f75083-29a3-4860-8a6e-94551d37ac6a@kernel.org>
 <aed6fHLrIdahbdY3@thinkstation>
 <b77d559b-215e-460a-a268-e63b8273ef42@kernel.org>
 <aeorZMvKwu8zKX5i@thinkstation>
 <aeoxnuGKO3uqS2kG@x1.local>
 <aeo5IPpQi7onyjTF@thinkstation>
 <aeprnnccJeyHB2rt@x1.local>
 <aes7b17nG0cXrtEd@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aes7b17nG0cXrtEd@thinkstation>

On Fri, Apr 24, 2026 at 11:34:48AM +0100, Kiryl Shutsemau wrote:
> On Thu, Apr 23, 2026 at 02:57:34PM -0400, Peter Xu wrote:
> > On Thu, Apr 23, 2026 at 07:08:00PM +0100, Kiryl Shutsemau wrote:
> > > > - Whether read protection is required for an userspace swap system
> > > >   (e.g. did you get time to have a look at umap?)
> > > 
> > > I looked at it briefly, so I can miss details.
> > > 
> > > IIUC, in absence of read tracking it doesn't collect hotness information
> > > at all. The eviction is based on fault-in time: the oldest faulted-in
> > 
> > For example, let's imagine if we can have a per-mm idle page tracker, would
> > it work for you to collect hotness info?
> >
> > The other idea is, no matter whether we use MGLRU or legacy LRU, if we can
> > expose a better interface to share hotness info from kernel to userspace,
> > would it be possible?
> 
> I don't see how either fits our problem.
> 
> Both page_idle and the LRUs (legacy or MGLRU) track accesses on physical
> memory. We need visibility in the virtual address space domain.

Yes they are, but ACCESS bit isn't.  ACCESS bit is only about virtual
mapping or any similar mapping (like EPT's access bit).

What I described with per-mm tracking (either we call it per-mm idle page
tracking or using other interface) is about relying on ACCESS bit, not
pgtable changes using RWP.  IMHO It's more efficient and it will also
achieve your goal of VA tracking.

In your case (and also ours), if you're looking for VMs running virtual
machines, I think you need both pgtable's ACCESS bit and EPT-similar ACCESS
bit.  Here what's redundant is rmap, not ACCESS bit tracking.  When both
MMU and secondary MMU supports hardware access tracking, AFAIU it's faster
than RWP.

> 
> We don't care which physical page backs a given guest address at any
> moment. We want to know which piece of the user's dataset is cold, and
> the answer has to be indifferent to kernel actions underneath: the
> tracking must survive migration and swap-out. RWP gives us that — the

This is exactly what we hit...  that's the reason why I was trying to
propose a new API to read directly from swap (swap_access) or similar.

Btw, from another perspective, I believe we could also persist ACCESS bit
across migration or swap out.

For migration, see e.g. remove_migration_pte() has:

		if (!softleaf_is_migration_young(entry))
			pte = pte_mkold(pte);

For swap, it's different.  Normally, if an userapp would manage page
hotness, it will record the hotness within the userspace with whatever
algorithm it wants.  Then it will also survive host swap happening because
that hotness is per-VA.  It should be deduced from any hotness tracking
system it previously used to sample (and it still can be idle page
tracking, even if not efficient enough; when the VM page isn't mapped
anywhere else, rmap is pure overhead, it doesn't introduce false positives).

> uffd-wp bit is preserved across swap PTEs and migration entries, so the
> "this VA was declared cold" marker stays attached to the VA. A
> physical-side tracker loses its state the moment the folio is freed or
> replaced: a refaulted folio is a fresh object with no history.
> 
> Scaling goes the same way. Per-mm tracking of the form RWP does can
> scale with the working set. A physical-side tracker scales with all folios
> on the LRU/memcg, then needs an rmap walk per folio to map back to a
> VA — which is exactly the reason page_idle doesn't scale for this use
> case today.
> 
> There is also a cgroup-level confound: memcg hotness mixes guest memory
> with the VMM's own (worker threads, I/O buffers, vhost-user rings).
> VMA-scoped tracking is the natural unit regardless of the migration
> story.

This kind of further proved you're using shmem and you have separate
mappings.

Again, when with a per-mm idle page tracking these issue should all be
gone.  That per-mm idle page tracking needs to:

  - Ignore rmap so it's VA based
  - Still consider secondary MMUs, hence mmu young notifier needs to present
  - Work based on ACCESS bit (to leverage hardware tracking accelerations),
    rather than relying on a kernel fault to set the access mark, which
    should be more efficient.

The other thing is, could you please still answer why RWP is required for
swap impl in general?  It's not yet mentioned in the reply.

Personally I really feel like we're looking at very similar problems.  It
is a great news to me, because if you can convince me on the new api it
means our use case may likely also adopt the approach, vice versa.

It would be great to share the new interface no matter what it is, instead
of trying to push different ones.

Thanks,

-- 
Peter Xu

