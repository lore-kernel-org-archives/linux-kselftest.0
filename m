Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5FB3F0AB2;
	Wed,  6 May 2026 15:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081927; cv=none; b=G8jwHI2HEmkTUGL3AE/673I5LQaf8scmFTtKK+ad+1S5Lgw36dGSo2fmPK8DRvf+JtY39pvX9bvZwZoavd4WuQ7fr7FTw/9AECStcTFDKGPzKKMNSROTjC4ST2JfalgwqEjUdGfh+/nqVtIo1K+vbFgCFpwsw4nCYbpkPVY05Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081927; c=relaxed/simple;
	bh=7EWOYQgB1u32sEFotlMXBCyVmyDnIdAZLQsC0sUnM+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B92fy9Ybtv9DgQ96zpouYPLLaBoOm2LcPNa+qly4Dq2klqtkMM3A8mkLGlgFajsPvKR5XwUREiidzYvOVZgZPU4ZOX0FkFGMKJV+hEXSj6fp1vIa0rlHv4oWpY3OffuCkblFUFvRzWP3uw6p0HrpECy+n9tDOld8ZF0duFHVmKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=qjjIyhLA; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="qjjIyhLA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HBfSkJ+ZAj0IKZzbsOscWzm5w5IqhoP97yR5c6JXd3k=; b=qjjIyhLAYnp6+fzWGNQYHTDfMM
	dcIQug2wJEoUes3iojqwilgyNfsTZZsNzrml2u7hAOlBUPV0mOaX18+f+P7JfyKKGQkap35JtApTr
	GGMWo3Xeu1KhmejaIkkUaEHNyTRQFTpchGsurCCHxS/W3A4q7GtjSQyRzJdIMykPhyoWB2bgEwAZD
	m0/7Y2fFAL27EFjrhAWkplpJLJIfpj/o/rPphT1s1BC/ybLVL4N3JUjn27m2jUVvlV+km7EtU3wC/
	cp8mO5EBcC1Fn9qKDps0TKo3abv9aNbX/P+QdjiTrVIoKxEy6ZEtW/v159/j/NKqqzC8qbh7psgKR
	7A+SG5KA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wKeKL-003glf-12;
	Wed, 06 May 2026 15:38:21 +0000
Date: Wed, 6 May 2026 08:38:15 -0700
From: Breno Leitao <leitao@debian.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v5 3/4] Documentation: document
 panic_on_unrecoverable_memory_failure sysctl
Message-ID: <aftfTpgyLRhXPSLm@gmail.com>
References: <20260424-ecc_panic-v5-0-a35f4b50425c@debian.org>
 <20260424-ecc_panic-v5-3-a35f4b50425c@debian.org>
 <20260424054840.a63d80ed01b968caf9d9ef64@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424054840.a63d80ed01b968caf9d9ef64@linux-foundation.org>
X-Debian-User: leitao

On Fri, Apr 24, 2026 at 05:48:40AM -0700, Andrew Morton wrote:
> On Fri, 24 Apr 2026 05:24:01 -0700 Breno Leitao <leitao@debian.org> wrote:
> 
> > Add documentation for the new vm.panic_on_unrecoverable_memory_failure
> > sysctl, describing the three categories of failures that trigger a
> > panic and noting which kernel page types are not yet covered.
> > 
> >
> > ...
> >
> > +When enabled, this sysctl triggers a panic on three categories of
> > +unrecoverable failures: reserved kernel pages, non-buddy kernel pages
> > +with zero refcount (e.g. tail pages of high-order allocations), and
> > +pages whose state cannot be classified as recoverable.
> 
> Before someone asks, I wonder if we should make this a bitfield thing,
> so people can select which of the above three should get the panic
> treatment.

That's an interesting idea, though I think the necessary infrastructure
doesn't exist yet. As discussed in this thread, even distinguishing
non-userspace pages from userspace pages presents non-trivial challenges.

Implementing a bitfield-based approach would require significant
groundwork. If we want to pursue that direction, it might make sense to
defer this patchset and focus on building that infrastructure first.

My preference would be to start with the coarse-grained approach
(current approach) and refine it incrementally based on actual needs.
