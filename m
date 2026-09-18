Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1408D1DF248;
	Fri, 18 Sep 2026 19:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789761057; cv=none; b=WC1oujm32tsxDoMBHGeuLZTen/8e77C8ALuNnD+90k58o92E9MnimTbjUQi4k3RQ3d/TEDftiDmJNgRzYaC3uu2FF2CoSmvPajRO+Ji1bk6vf7BPWtSEpKXcz5PjVMo1gp9Z3dWYnYqLJpVbVwk7atpNzsDUcqFSuoFn/gF+GPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789761057; c=relaxed/simple;
	bh=zYTZ+a3hvb3MO2zc8985ACXIphue/Oi0UNjX/6mxJ2Y=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=TuWkgGppkLXRG4ieIdDgj9jMLvz/VMw16O/o8TpkplhNN2D/FejPAoYxaWK3TxcvsanhPeGamkKgXRFiKYCdiXVHEBd/2NBpfnpa6ObnEyKujv4Biv35h5iwSYM1Uu4KbptTWIsK6QH+L0ReJxtZQz7jJm1LIx9TDPnVk95Ityc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=t6x4ghAH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="t6x4ghAH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A521F000FF;
	Fri, 18 Sep 2026 19:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789761055;
	bh=oK9evgZZNkEjZWEHUtv6caDlyb48jPUVEPSBClyBGM0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=t6x4ghAHbv1VQgBHnN35Y+v+6gqPbE3L6Oh7kMmnGTgCMMB4pAn0U1Lhso5WvJBoR
	 7GbAJGyG1fjkTcbZyD18iQn+XdKkW1L3338hN+7gJ/4Hmc+U3ghxTOooh7a+NRbMXt
	 OSxfaanc6e+ZMBl8vAr7031V/wto/32CRB9nR4kA=
Date: Fri, 18 Sep 2026 12:50:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Jason
 Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu
 <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>, Zi Yan
 <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain
 <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang
 <lance.yang@linux.dev>, Mark Brown <broonie@kernel.org>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Muhammad Usama Anjum <usama.anjum@arm.com>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/6] selftests/mm: separate GUP microbenchmarking
 from functional testing
Message-Id: <20260918125054.f22d85a4def29dba081fd07e@linux-foundation.org>
In-Reply-To: <20260918112234.195857-1-sarthak.sharma@arm.com>
References: <20260918112234.195857-1-sarthak.sharma@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 18 Sep 2026 16:52:28 +0530 Sarthak Sharma <sarthak.sharma@arm.com> wrote:

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

Thanks, all queued up.  Including [1/6]'s read_num() fix.
