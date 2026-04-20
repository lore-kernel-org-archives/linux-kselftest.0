Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A4830E0E5;
	Mon, 20 Apr 2026 09:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776676803; cv=none; b=HyVnRV8GNQYVI41nn0ISO+uLNIKuNdmCjhaIoHugUDJXDyagAMutW8in7J10jEfkucJ1bXW0tE8XMKEJqNbfAwULXC2BznL8mK+CTwKRtr2fwBu3ZkoJ2rZ3gJHYUb/ShAyEZvIDaPRIGxZpocpoAJBGcJYxBcH75LTzsxMPV3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776676803; c=relaxed/simple;
	bh=l7We2lzrn0rwykgmQ297ASg/aplyptJQ9fcEc9kC5wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjOlwIg+IXpJa2whIwFxuvG0LXHtXZl1w/KhyxqfeI4JMDhs2P00CyH2UN2X6kIgOMZz3QWKr8SDpwMAN/01A60PWT+Dgu0gqxTOt7bOX1++5T5ChN1A3WB3XRHlCgcfp7A2IjOqn3D+4D4RtZfnXmneuqeXa/67pRGGdJ0PvO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHwAnR+k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHwAnR+k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB54C19425;
	Mon, 20 Apr 2026 09:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776676802;
	bh=l7We2lzrn0rwykgmQ297ASg/aplyptJQ9fcEc9kC5wI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AHwAnR+kA/5sGR9O98GtTLl9HG/iXsHupIIGjGjLrepNxyB2UZrSbWpi3bTO/wUpn
	 ruBsJzi+li8gcRsxOfD3/BbwAcSafZeEmRp+knTdW0nOTOk3tQ0K9MCxwBLXJX5Hl5
	 I3CyuIcy8QJnXesb6HUF5FNWwO9ViCHZhbVjp/72wDgL26nccfqL/9SLfcO7l/6seS
	 30Ot4C0zKgD3JCf8hvZsgWS3+lb1eNVbISrhnkiBFnpECEeAlcwQcUn4GWSx1ifLQ3
	 JBdA9XvAhdJkEf0jicvSjiOfzt0HDB8AWH14KlDKXlUhRCttiqgU2c/0+/S+r4fyXY
	 Of/wLNA1eoNiQ==
Date: Mon, 20 Apr 2026 12:19:51 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 00/53] selftests/mm: make MM selftests more CI friendly
Message-ID: <aeXvty_LE4v5XLq3@kernel.org>
References: <20260406141735.2179309-1-rppt@kernel.org>
 <ee6bbac9-b375-4413-a771-6d32c7afda67@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee6bbac9-b375-4413-a771-6d32c7afda67@arm.com>

Hi Ryan,

On Mon, Apr 20, 2026 at 09:37:03AM +0100, Ryan Roberts wrote:
> On 06/04/2026 15:16, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Hi,
> > 
> > There's a lot of dancing around HugeTLB settings in run_vmtests.sh.
> > Some test need just a few default huge pages, some require at least 256 MB, and
> > some just skip lots of tests if huge pages of all supported sizes are not
> > available.
> > 
> > The goal of this set is to make tests deal with HugeTLB setup and teardown.
> 
> Hi Mike,
> 
> I haven't had a chance to review this series properly, but the intent certainly
> seems extremely valuable!
> 
> I thought I'd share some configuration magic that I always use when running on
> arm64. Appologies if I'm teaching you to suck eggs...
> 
> arm64 supports multiple hugetlb sizes and (at least in the past) the magic in
> run_vmtests.sh only reserves for the default size. As a consequence, whenever I
> run these tests on arm64, I always boot with:
> 
> hugepagesz=1G hugepages=0:2,1:2
> hugepagesz=32M hugepages=0:2,1:2
> default_hugepagesz=2M hugepages=0:64,1:64
> hugepagesz=64K hugepages=0:2,1:2
> 
> Which reserves 2 pages of each supported non-default size in each of 2 NUMA
> nodes, and 64 of the default size in each NUMA node. (This would need adjusting
> if using a different base page size).
> 
> My recollection is that this effectively overrides what the script was doing and
> is sufficient to make all hugetlb tests run for all hugepage sizes.

My goal is to let the tests themself set up the right hugetlb configuration
without forcing it neither in command line nor in the wrapper scripts.

On x86 I can run all the tests in a virtio-ng VM with two nodes and no
kernel command line overrides. I suppose that should work on arm64 too.

There are some additional settings that such a VM would need to avoid
skipping tests that presume swap or a real filesystem, but that's more of
virtio-ng limitation.

> If it's possible to get this non-default hugepage size reservation logic into
> the tests themselves, this will make the mm selftests much easier to run on
> arm64 with full coverage.

That's what the second half of series do. E.g for cow tests:

https://lore.kernel.org/linux-mm/ee6bbac9-b375-4413-a771-6d32c7afda67@arm.com/T/#m62f23b835061449bc6249afacf993bb32ea11234
 
> Another observation is that "secretmem.enable" is currently needed on the
> cmdline to enable secretmem so that the associated tests run. Not sure what can
> be done to make that simpler?

Looks like you're testing really old kernels :)
The secretmem default changed to "enabled" from 6.5 ;-)
 
> And there are tests that depend on having more than 1 NUMA node; I always run
> under QEMU with 2 emulated NUMA nodes. I guess that's really just a property of
> the HW, so nothing to be done from the test harness.

Right, test harness can't do much about it. It's either run in a virtual
machines with 2 (or more) nodes or enable NUMA emulation in the kernel
configuration and the kernel command line.

> Thanks,
> Ryan

-- 
Sincerely yours,
Mike.
