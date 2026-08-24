Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4CA3A5445;
	Mon, 24 Aug 2026 07:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558372; cv=none; b=Qon0ktxYvlqbKc650fyqLltgNnRbVuXd4B4ujkxAi+fRbXtxJTTNqpd/h4A41VCbz+gHC5l+2mIbI8bxOB/DFCJUia1OylOKOzKC0Wt4HJcscVnbpwt9mfLUXFsoG9G4+IW+AltuptEYIGDLYG3mgM9PFw4bP/DZT6gzLhmNrU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558372; c=relaxed/simple;
	bh=WwI71F+wqU4O3zVSj6nYnNtXkOGk+GtepcSgy2RQuDM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=XdjJ9pH3tn2a7jPFowhNC196RQOpJ8Ao1/66R8tmFVTDSVb3WvkiVa0Q/cqOGMHabJ53vqmdnX9ukTRzNNdxVqUX2InLAORFuUdFC/22NEHNh3wRBng6MUf5wwerWZUS0/XSs6teaEKXgXOF0DGWuwzF4ZCwucRMuEZExBKC1Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSpgq0T9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSpgq0T9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0D61F000E9;
	Mon, 24 Aug 2026 07:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787558368;
	bh=BXUmGFOCOiethoBewYZqUVfBZTm7jKCobaLxI20OCYc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=iSpgq0T9NjPPpMbN4wVLt8+PTdvKsvoJ2zylkvKvJWSGJ1DYaCY548bzZbcG9udx4
	 2Rkrr9KPPtgQ/c9SpqUDSc42Yrk5z1xUCU+x/wMd+2SHHghXj7M4LfpuZ+6U5c8UuK
	 oLPX86J1834eJ1AHu1sbLYXve8LJUQaFWlAKTKPvm9L3aw1wj0ADUxbc/sMkbMe0Cb
	 0iFM8PQUTZolv7g+qBMQYZPl7Gwuk5eGbCAj+J6TFalMoxGhhvY/wZWJT06QRb0M0x
	 F5en1Deh1osBQ+BgUSUqkV2E3cFCY3YmbjuYAMaUnH6hObqsPbOpGD/nOpUH5AA78t
	 Pdb17IBJPDa5Q==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 3/6] tools/lib/mm: move hugepage_settings out of
 selftests
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R . Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Mark Brown <broonie@kernel.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260813181230.483746-4-sarthak.sharma@arm.com>
References: <20260813181230.483746-1-sarthak.sharma@arm.com>
 <20260813181230.483746-4-sarthak.sharma@arm.com>
Date: Mon, 24 Aug 2026 10:59:05 +0300
Message-Id: <178755834510.3606540.10873606384542050383.b4-review@b4>
X-Mailer: b4 0.17-dev

On Thu, 13 Aug 2026 23:42:27 +0530, Sarthak Sharma <sarthak.sharma@arm.com> wrote:
> Move hugepage_settings.[ch] from tools/testing/selftests/mm/ to
> tools/lib/mm/ so the THP and HugeTLB helpers can be shared more easily
> between selftests and other tools.
> 
> Keep the helpers exposed to mm selftests through vm_util.h where possible,
> and use direct <mm/hugepage_settings.h> includes for files that do not
> include vm_util.h. Adjust the selftests/mm build to compile the moved
> implementation from its new location.
> 
> [...]

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

