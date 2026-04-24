Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6494A3CF688
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 15:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777046147; cv=none; b=Gle94+2tvc8vj2w743ngHBQqYaGU8uc+YZmHAWlhdelUDt+tl11Yk3XA+In3+yvSrCTbLayct0z8CuZpEDcvYhc+XUyhVH1aXKLKS9ZPq9u/bJu3bYszLSdJsa+kjlKvq6nePCJTze1EvHP9D9KVnamoJUVK9eGHXMcnXs9C+nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777046147; c=relaxed/simple;
	bh=LZ1g410fGp9cQzldzvNuJ90pocHt3VissIO7Xj+d5+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDUpzCcdAwEvGzzgs/7U9GQctOoVPX9/3pi1xyNDg/eDdnhfRpf+kKY0FgByAT0J+RwSuaW2Zldsggmni1LzqxC5+9jvReATBabqRdIbMs8liW1VetIBGV38ktpUjidscCbaMre0wiYD/GQUCoTmHS2UO2Yu0j0TjBV6VN1+I1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eyIPXdrC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EUBEQbAk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eyIPXdrC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EUBEQbAk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777046145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qLmU//rnAAA5yNF6Ee9JskKj79xD8INjyMeyu+N95bA=;
	b=eyIPXdrCyXs6HcPqszAVrsCQuSSmAK6cTv07bGV0QgxhdzuI/hgtZYKLwRAEXOL7VPKkF+
	AJsysCaJJat/HdfIICE4RcVvyasL3psA2hCb7AuI0IY0gWCcj6QiDvI5qJWhv8lDmNSlT6
	GhobYteBdQnYM/sg0BP4dZZ5VAWvQyM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-Mh6V3r2NP3yMKNP-NiQfOA-1; Fri, 24 Apr 2026 11:55:42 -0400
X-MC-Unique: Mh6V3r2NP3yMKNP-NiQfOA-1
X-Mimecast-MFC-AGG-ID: Mh6V3r2NP3yMKNP-NiQfOA_1777046142
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fcdd579e1so36121531cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 08:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777046142; x=1777650942; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qLmU//rnAAA5yNF6Ee9JskKj79xD8INjyMeyu+N95bA=;
        b=EUBEQbAkbuNfos+bk1ZVgR3yyz+3sYi2/npQVvto4J3EOkqB1553h1EZ45IOMkFADF
         syoO3jVLZO1ij7mS0IVGuI8KRsg/XIcSMpXCRYzQqM6m3OsfMuQown9Tzoxw4IKZHl4t
         /6uFTJQaS1/BuRURFHtbaKMgwkWdmncOJigOEM9Z1MDM88ZxzJxYaagpCRSQNCuVoISk
         Myeq/4wAmlLFF5Eg4US2OYW5azIHcjhEvxuQ6ZBTO5KqDffjorfx9QYyeFtiP+0sMqLA
         L3sTNLVw4gbgkzLRhoi44pNZ9DghKLfwMxDnEkOSOwqcGP8MkbSDVfqkic7RcoU8oPoo
         /xNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777046142; x=1777650942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLmU//rnAAA5yNF6Ee9JskKj79xD8INjyMeyu+N95bA=;
        b=g5NZLXuq0SRCDV18A/ihNMi7z7PkXrPjQsN+VJmiRHjOVHXMN0PkZfFZMRdEBaSUTi
         E6qSqkiu65GDVB13JSo7w9RUBrA/JS4COOByJreVu6h09wW2NtyU3mkxjCpAY+C2t5Uc
         a4XOL38yRdx5up9mzPQHl+kR/sIQdpF+DuTZ9seWIkvAjpLfO1Ey+Ri2VfjknT7qG+T+
         iX05pfAi4DEsD9cj1sQmtgrCNYUouvLEB2RzwrtKZcPiJGgcsfhlB86SM0/dedOZeg0Y
         HGdz+qjg04C48C/gPCeSei70R5I+c9bCLmonFyiZmsJPr3qLLy2SRpYVNIv+DTLqCN0l
         Dv8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Pgi4xlS4zTAy0SKP/IX+eGQc1XxHRBuuR1IYvTlW/O48uO3bK0kLads6MqJJYNmHDvjgQd4cMO8ynSZkWJsw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx24xgm5B1KSE8nqJ/ZUrPU7PHe0foFhVitYVjrcPaEmeuPXThc
	IcZASqdCnK2HWUJmjI3iGt7nRTzMK1yy/+srLqBPNV8jSDcFZ93FBb0/elxQ6YmVVw3jYFId7p+
	FHJfxNLbUuuTnpCCiETfTafVXLAGGQkc6l8/0xCix24LD/nnKbKgkHKQigdtmSKIjSifF3A==
X-Gm-Gg: AeBDiesA82M3FzafUAuU+VrScWAc83MElYq1vjU3x+R0ocZKE+x4WelL689H2XuhsyC
	WvNaRaTMc/UOUYlV8r2zR4CNqENB4wB7s1QteipcL0Gyz4J3sfFGLEX918JHhGG0OFqiBxYdi3n
	DHn4SU0Jedq5b1WpC1TMGt0P994zY87TF2EwhFziQoG7wEytIr0yi3C/TsTMt/Xt0id3T/wnThp
	qxK67e82gi7SMYYe5eO3T6Iu02A/nYh7EqeDFfu7xGpMOTveiLXyqjwO0GDdwsb5FAU5gvIceCl
	tz7sU+IBfqLywA1QZqgCqVO0Dm1e+dV+z8OeW+T6UOs+vvo0jDywQUB2F3R7+NgHyNtLTyUDvhA
	j05N0uVhQS8lWLaDdf3BBfsbhucAkgw5hukfdaz7BwNA9hkRHay0URkM3pg==
X-Received: by 2002:ac8:5892:0:b0:509:3cd:b22f with SMTP id d75a77b69052e-50e36b41242mr499700301cf.23.1777046141632;
        Fri, 24 Apr 2026 08:55:41 -0700 (PDT)
X-Received: by 2002:ac8:5892:0:b0:509:3cd:b22f with SMTP id d75a77b69052e-50e36b41242mr499699791cf.23.1777046141002;
        Fri, 24 Apr 2026 08:55:41 -0700 (PDT)
Received: from x1.local ([142.189.10.167])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fafe9674csm148150631cf.3.2026.04.24.08.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:55:40 -0700 (PDT)
Date: Fri, 24 Apr 2026 11:55:39 -0400
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
Message-ID: <aeuSe0PY-g10KNUF@x1.local>
References: <34f75083-29a3-4860-8a6e-94551d37ac6a@kernel.org>
 <aed6fHLrIdahbdY3@thinkstation>
 <b77d559b-215e-460a-a268-e63b8273ef42@kernel.org>
 <aeorZMvKwu8zKX5i@thinkstation>
 <aeoxnuGKO3uqS2kG@x1.local>
 <aeo5IPpQi7onyjTF@thinkstation>
 <aeprnnccJeyHB2rt@x1.local>
 <aes7b17nG0cXrtEd@thinkstation>
 <aetZUOINzfTXChLL@x1.local>
 <aetyhki-UD70dyRL@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aetyhki-UD70dyRL@thinkstation>

On Fri, Apr 24, 2026 at 02:49:58PM +0100, Kiryl Shutsemau wrote:
> On Fri, Apr 24, 2026 at 07:51:44AM -0400, Peter Xu wrote:
> > On Fri, Apr 24, 2026 at 11:34:48AM +0100, Kiryl Shutsemau wrote:
> > > Both page_idle and the LRUs (legacy or MGLRU) track accesses on physical
> > > memory. We need visibility in the virtual address space domain.
> > 
> > Yes they are, but ACCESS bit isn't.
> 
> A-bit is not a reliable signal for userspace working-set tracking
> because the kernel itself is a concurrent consumer. It is exactly why
> page_idle needs PG_young on top of the A-bit: PG_young is the "kernel

I assume you meant PG_idle.  I actually don't know whether PG_young is
still actively used anywhere in the current code base.

> ate the A-bit but the page was actually touched" escape hatch. And
> bringing PG_young into the picture puts us right back into physical-side
> tracking.
> 
> > For migration, see e.g. remove_migration_pte() has:
> > 
> > 		if (!softleaf_is_migration_young(entry))
> > 			pte = pte_mkold(pte);
> 
> remove_migration_pte() only propagates young-at-unmap. It does not
> cover the common case: A-bit cleared by reclaim before migration
> started. The concurrent-consumer problem is what breaks the signal,
> not the migration boundary.

IMHO it's a separate problem, and AFAIU it was well solved at least with
old LRUs with PG_idle. It's just slightly unfortunate it doesn't yet work
with MGLRU.  Also, when the extra bit is in folio->flags, it only works if
both the consumers are reporting per-folio, not per-mm.

I'm actually curious whether there're numbers or solid proof showing that
in your case the per-folio perf is too bad already to justify a new per-mm
API, like RWP.  It's because currently this proposal is still so far very
much about "let's implement a swap system".  It really doesn't yet have a
lot to prove on hotness tracking POV.

Not asking for a time-consuming test immediately, but IMHO these should
really be solid clues to first justify the overhead with current rmap in
production.

For us, we know the overhead in theory, but we never really measured how
much.

Even if so, I don't think it's unsolvable.

I want to explore if there's something that can still be generic and work
for per-mm tracking.  I believe if we can have some bit in the ptes, then
when mm reclaim code walks clearing ACCESS bit and sees some vma is being
tracked, then instead of setting PG_idle, it can just move the access bit
over to that special pte bit, and only to this vma this pte.  IIUC that'll
benefit from both worlds: fast HW-accelerated access bit, and no minor
faults.

Would something like that worth exploring?

-- 
Peter Xu

