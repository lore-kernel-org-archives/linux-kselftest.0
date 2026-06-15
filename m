Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF184183C1
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 17:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781545183; cv=none; b=tR4w0mhRxuRrifUL/JnR9KrgEwTJstgernH9gvzI/AFp2xCjyFxOe6fO2oaa27spQF3Q1NSjPpUwTg8gO2rL0y38y523DUb7NuwLMh6uTnV0XrjvYAS7Y68T/fhlBBglcPi95DZ0L6Di6qv0G7cAtTsLilxeaRXIsg+FX0eOpxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781545183; c=relaxed/simple;
	bh=R3Ew4UG09Tlztc6dINQgLDygyhYIKiJlxV2UJACXXFw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FVWiVtz99QuaAcREpiBPW+CIUuVM2w2Bo0n1oGDb/PpQvHgVWexKGwUM8wdHKdZHkv/usBH+7BqEKcE1TEXb2FqufP0BmDtVFQeNLw1TH/cj9EnXVh883oEseUvfFvoquXygYegNd2rPkwUlzwbi4cPtDU3lR/S9AHAuWdgphiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qyj6Ikc/; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qyj6Ikc/"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-842208d5b0eso2977132b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 10:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781545181; x=1782149981; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zt0anKDYS0gqDu93ubQsMfBghI6qH1md1eoQ9mMVUKo=;
        b=Qyj6Ikc/P175iZr7A3e9uPRusC3iyGEcnwbNOabEdBMby653PGwTTMzaCJA1eCnHVo
         8bEr0ql6WwV726XfhH3q39ugNyhu5MeoD5lNZ7CWUeojXfnHIJSylW7I/nY4gcyiMkYy
         snXcckzTWP3NPGd7O5eCW6Vldw/J9jyJGa+ETKkQ3NUrKMlbq5tWFIYgUo2gQeudOyzl
         6BzZJaa9jvNHAaYN1/581a/Zazf5msOfdE88ACFdjxAi2S2tQpskGWpHCYyjiOSh6EVk
         gmTKwKYZOq/zrWy0NCBVNZtN5ovRdqI/X4aJpUHTIo0XBZhefTN+La0+hLTV4QlsiT2I
         3G9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781545181; x=1782149981;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zt0anKDYS0gqDu93ubQsMfBghI6qH1md1eoQ9mMVUKo=;
        b=Dhf+aJd0R8Uiz7ShP72dQf2O1tYwAgPlbHgOGCMh6O7Ti6Cd78JJUGJLn4ROejJBRN
         09Gs7rc1md/lN8oNObn4GOvmV889kEm+VTrbvuII2uAcz6H004jl51og7p3s/fw2bUlE
         hjtJBv9Elp8FD+kuWKaXpYBe2UM2/FqNGJbZF5BVco1FwWabbP4HUDDdZ3dyYdGfT+MI
         CBKWPHUM9SzAUriB5L8BdNtQhFk1xjeha9QWQFP2gfMbk+4DH47OY8uktcpPVWnjqDOh
         HZpWg7HKXmZtLUTN8vSCXHXgqkbhCsraF4rirLxWnFiAp7gbYdqnzbhg7KMD80xXRx0x
         +M/A==
X-Forwarded-Encrypted: i=1; AFNElJ/IjAHYL34rFc2jPDg8J2wR7qv+aE8MeECGb/u6thV2uku9rkfmuChTBHkI1n5AwCarwy4sEA8laz7Qex35pjc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn09Kwzt8VpAPFVj2gugvWSTMzNKyVIy9961chfNAEkJRaV9j6
	wqqNyDC1PqEMlBSgLF/r+zQOh0z4gWXCF5XEf+2o3rqcEr8j7AwWY4X6vCUrj3e6rblau230ZVS
	vuYxnEA==
X-Received: from pfbmy22-n1.prod.google.com ([2002:a05:6a00:6d56:10b0:842:6be9:dfa5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ac01:b0:842:6c02:2fa1
 with SMTP id d2e1a72fcca58-8434cec1cd2mr16474936b3a.39.1781545180989; Mon, 15
 Jun 2026 10:39:40 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:39:27 -0700
In-Reply-To: <ai_aczmeH2IA6JaB@raptor>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260611-shivank-gmem-migrate-v1-0-2d266bfc6f95@amd.com>
 <ai_XK__RTXMCEcCG@raptor> <ai_aczmeH2IA6JaB@raptor>
Message-ID: <ajA4z_Wkb93cTW4m@google.com>
Subject: Re: [PATCH RFC 0/3] KVM: guest_memfd: folio migration for
 non-confidential VMs
From: Sean Christopherson <seanjc@google.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Shivank Garg <shivankg@amd.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	David Hildenbrand <david@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Ira Weiny <ira.weiny@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Pankaj Gupta <pankaj.gupta@amd.com>, Ackerley Tng <ackerleytng@google.com>, 
	Fuad Tabba <tabba@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Nikita Kalyazin <nikita.kalyazin@linux.dev>, Patrick Roy <patrick.roy@linux.dev>, 
	Pratik Sampat <prsampat@amd.com>, Ashish Kalra <Ashish.Kalra@amd.com>, linux-fsdevel@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Jun 15, 2026, Alexandru Elisei wrote:
> Hi,
> 
> On Mon, Jun 15, 2026 at 11:43:14AM +0100, Alexandru Elisei wrote:
> > Hi,
> > 
> > On Thu, Jun 11, 2026 at 01:05:07PM +0000, Shivank Garg wrote:
> > > guest_memfd folios are currently marked unmovable, so the kernel cannot
> > > perform NUMA-balancing, memory compaction, etc. This is unavoidable for
> > > confidential VMs (SEV-SNP, TDX), since memory is encrypted and copying it
> > > needs firmware assistance. However, for non-confidential VMs (like
> > > Firecracker), we can migrate the folios.
> > > 
> > > This series enables folio migration for non-confidential guest_memfd and
> > > also lays the groundwork for migrating confidential guest_memfd later.
> > > Once firmware-assisted copying support is available, those VMs can be
> > > made movable, the confidential folio content can be copied separately,
> > > and the destination folio marked with FOLIO_CONTENT_COPIED so
> > > __migrate_folio() skips the host-side folio_mc_copy().
> > 
> > I always thought that one of the nice things about using guest_memfd as a
> > memory backend, as opposed to host userspace mappings, is that the host
> > cannot unmap VM memory because of KSM, automatic NUMA balancing, hugepage
> > collapse, compaction, etc, acting on the host userspace mapping of the
> > VM memory, and outside of the VMM's or KVM's control.

+1000.  It's not just "nice to have", it's a core design principle of guest_memfd.

> > I think it would be useful to preserve this behaviour, even in the absence
> > of confidential VMs (i.e, guest_memfd file descriptor created with
> > GUEST_MEMFD_FLAG_MMAP).
> 
> Just to be clear, I was thinking that it might be useful for both
> behaviours to exist (migratable and non-migratable) for non-confidential
> VMs, and allow KVM or userspace to decide which they prefer for a
> guest_memfd.

For the purposes of this discussion, we should separate the physical act of
migrating pages from the features that trigger migration.  As I said in last week's
guest-memfd call, I am a-ok with supporting page migration as a mechanism, but I
am dead set against supporting NUMA balancing, KSM, LRU-based swap/reclaim, and
anything else that goes against the goal of guest-first memory.

If userspace wants mm/ functionality, then use anon, memfd, hugetlb, shmem, etc.

Shivank, what's the immediate motivation for this series?
