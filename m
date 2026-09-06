Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ED9242925;
	Sun,  6 Sep 2026 00:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788654771; cv=none; b=IfBlnmZjQ5FkbU5RwD3AJB7kx4qJ8EWos707pCtJPmi7jHFfEXvsW89ICklZ/n2133MRRPAgMIZERiau7ejfqcHpLdy59CA3JQDv1M8OFIPxeTiEZbewRroOpccnhz+7lBhbc+wrMSEU7C66o7N9rABRzHcy4lm7YCBUklE0Df8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788654771; c=relaxed/simple;
	bh=Yw6hvHNWT3wfKY4Lya23TuKrGdA68e5Y9lvf89DsNQo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=X8Y5VHVymSafwuwjwZ+VsOqmItZhIbfmmpmSwSVGXpUeQb0hL6iWydMMIum331pZlwn4vvQVuebigHJYTe/mbkPertunPtKA3R+brwHQw1G6JlgRUkjnLumgLcncyCdxO1FASHRZK8pYoox0DGn0X+asYY2YbheeBnAX7bWvtgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WgSsm7Ob; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WgSsm7Ob"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF841F00A3D;
	Sun,  6 Sep 2026 00:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788654770;
	bh=JzguznGN4wZaJ4BaohUL/D8OCMllkrYSCH0UgmH3tU0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WgSsm7ObXrMrJfIn8wocZvVmk1viVsJ8i/DGwFzwXHn7BRCWaJrz5waexMh61wfEZ
	 wOeNPp7eJW0KXAVEi1Nn5VEBdxXIymbBCxZnqcn26qOkA5ue3hfCB14lzppG13QxeZ
	 /MOIRI15EcghSoEiYeyN7l8hDKigwnfEu/K10i1c=
Date: Sat, 5 Sep 2026 17:32:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan
 <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet
 <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard
 <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Leon Romanovsky
 <leon@kernel.org>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, Ryan
 Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Mark Brown
 <broonie@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Muhammad Usama Anjum <usama.anjum@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/6] selftests/mm: separate GUP microbenchmarking
 from functional testing
Message-Id: <20260905173249.00f41b2a88abb0aefd217e94@linux-foundation.org>
In-Reply-To: <20260904123631.198697-1-sarthak.sharma@arm.com>
References: <20260904123631.198697-1-sarthak.sharma@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  4 Sep 2026 18:06:25 +0530 Sarthak Sharma <sarthak.sharma@arm.com> wrote:

> gup_test.c currently serves two separate purposes: benchmarking
> (GUP_FAST_BENCHMARK, PIN_FAST_BENCHMARK and PIN_LONGTERM_BENCHMARK) and
> functional testing (GUP_BASIC_TEST, PIN_BASIC_TEST and
> DUMP_USER_PAGES_TEST). Keeping both in one program makes the functional
> tests harder to run and report individually, while run_vmtests.sh has to
> invoke the program repeatedly with different options.
> 
> Separate these roles into tools/mm/gup_bench for benchmarking and
> tools/testing/selftests/mm/gup for functional testing. Move the shared
> file and hugepage helpers to tools/lib/mm/ so both programs can use them
> without duplicating the implementation.

Thanks, I've added this series to mm.git's mm-new branch for testing
and hopefully further progression.
