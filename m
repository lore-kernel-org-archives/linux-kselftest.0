Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72543264D9;
	Mon, 11 May 2026 08:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778487963; cv=none; b=BTO6XWIcxzlJclfYLTdumvTkg4OtL/zhFRY8Y0dJfEkafwlg7X1sTqQGjQtTinsrDjaMzrxslgXrUWfkAKCos74FfOlV7awwi/wkprrOEO3bXBkEEDudOy/tmfZLFP9sRUhzwL15rwyA8ScSag+cFXKJWH7qclmHXsCF/Hc4q30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778487963; c=relaxed/simple;
	bh=ZDQHQLuS8vxCZNeF0Ws0yf2AAH+PPN2lndIWRaleKbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fzfb7EGtD2p0sjLNxdzF0o2BAAmmpuhcD30oOlUJz7Cu7y0ECMadgzTgqXgNqn5FrErHz73j1pzbYKepKlimCs3S6eJGQsXAY0YKtM8k5IMuJCRxXNByYrSJE5WelGi5kDUqX95qtCF0zErqtpiO6S2MxuXN+jR/dzRA42FcWwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ax0unyIU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ax0unyIU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF52C2BCB0;
	Mon, 11 May 2026 08:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778487962;
	bh=ZDQHQLuS8vxCZNeF0Ws0yf2AAH+PPN2lndIWRaleKbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ax0unyIUwrRzYEOomZasRiJU217mNdPoVVP6q2CixVpusu8IPhKniQZT2CEAT/z+M
	 SWAy+Umhg0c1hWX3gJMlz9454TLUzRX0WiwB8HILKVnZ8EsmBuLf+ViQ7DqniWvBga
	 65X+KXKS16KECvfckRJ00w3cDpj96sfOEXO4fm63pGnZZi6WdK44Jwz+Ib5et5PxwA
	 b00scRHQkOKDxPJ8NEKoWXN15+guBJHOxHkD04qgmk6LYZUgRzWcCRUCevdUG0Yc2Q
	 trw9OIXC3R8sC0Tzp/viOilsoWGB5CjWgr1zseYTuzll14N4EieIaEodivYsjZ7mYS
	 clipQTrv++wRQ==
Date: Mon, 11 May 2026 11:25:51 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Luiz Capitulino <luizcap@redhat.com>,
	Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3 42/54] selftests/mm: hugetlb-soft-online: add setup of
 HugeTLB pages
Message-ID: <agGSj9-IJXVNJOI6@kernel.org>
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-43-rppt@kernel.org>
 <55538154-c46a-4504-a976-ce66e2555534@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55538154-c46a-4504-a976-ce66e2555534@arm.com>

Hi Sarthak,

On Tue, May 05, 2026 at 12:45:52PM +0530, Sarthak Sharma wrote:
> Hi Mike!
> 
> On 4/29/26 2:12 AM, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > hugetlb-soft-online test uses open coded access to /proc to determine
> > availability of huge pages and fails if there are no enough free huget
> > pages..
> > 
> > Replace open coded access to /proc with hugepage helpers and add setup
> > of HugeTLB pages to the test and make sure that the original settings
> > are restored on the test exit.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> The test is hugetlb-soft-offline, so let's change the commit title and
> commit message to say "offine" instead of "online".

Good catch :)
 
> I have run the test before and after applying the patch. Before the
> patch, it failed with an mmap error when hugepages were not
> preallocated. After applying the patch, the test correctly allocates the
> required hugepages and the test passes.
> 
> Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>

-- 
Sincerely yours,
Mike.
