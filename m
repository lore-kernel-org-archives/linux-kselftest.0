Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC0B36E46C;
	Fri, 24 Apr 2026 13:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777036770; cv=none; b=qnBGGpjeS5RtEIYpH7EfCcs9bbVR9XBAnvrZ9Cvqr9nv+TBMo5HiH1wQ/6RePqnaNXn3S4cOwvF+fH1aeaY438QmR2zm39QjYu8fHmRZgaavvZf0cejz7B2pXHUxDHLeNK7vPju8a5+Y51JtexENC01L0+o1eJFVNmKLJAyqQs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777036770; c=relaxed/simple;
	bh=9oviElGuemGAVi46Q61CGwpxVccZVcmFAcX0wffBesg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=riErNTW8UqIwr8hlOFdWGht6SkauWwtAH0N7R+b0GVy/rR44H54w/JH+cBqjYb2woK5+QZVsCXr42qQl0SlakRF5xkq1t8YXHSh79jY/L9Qg+6hhs7cMo4KNZ6F3HZWC37Qb+uImmPozumEmnwi66vH9SYKST0eUoMscy2tYXtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=i9X1T2X+; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="i9X1T2X+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sXX8DCyTeaTt4IdZmkdODt+bPlX1tsjH9okoeWinoGE=; b=i9X1T2X+j7Rh8FdSDr4hl4IDUK
	zsnG28/uG4V+Ypkb0qn22B3vMKmhwi58tajOcz0klI4b66gkS+auXluE/FJDxwEvVBi+LcWgjWN9R
	r7Gl6Ur74cwqK+Uj9caVGY2/pNnZ2iz9rBqyvwp+sGbSEsmWpMyLo0Rm44dMsm6raXUZSQ0n5C1gR
	q8DGKOuyUxXP7CCGXYrJsWG/YWLOqVwrzavUkJnknsGwIXZV6alWMkBDIismCv94L5wireRkMUmPC
	ludTMUXCkrlAnWE2FWrQBVY2jTlZKd92I3KTBBq2njwzHO0NeWCUF7uJ0tOEe8dJLRFAFiQgIx7C+
	OGYmjLGg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGR7-0000000FBlQ-2Efw;
	Fri, 24 Apr 2026 13:19:13 +0000
Date: Fri, 24 Apr 2026 14:19:13 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Breno Leitao <leitao@debian.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v5 0/4] mm/memory-failure: add panic option for
 unrecoverable pages
Message-ID: <aett0XmQ1EPSDdnY@casper.infradead.org>
References: <20260424-ecc_panic-v5-0-a35f4b50425c@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424-ecc_panic-v5-0-a35f4b50425c@debian.org>

On Fri, Apr 24, 2026 at 05:23:58AM -0700, Breno Leitao wrote:
> This is a common problem on large fleets. We frequently observe multi-bit ECC
> errors hitting kernel slab pages, where memory_failure() fails to recover them
> and the system crashes later at an unrelated code path, making root cause
> analysis unnecessarily difficult.

Who is "we"?  Please attribute your patches to your employer by putting
their name in brackets after yours.  My ~/.gitconfig has:

[user]
        name = Matthew Wilcox (Oracle)

