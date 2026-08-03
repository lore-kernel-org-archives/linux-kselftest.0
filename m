Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0A23890FB;
	Mon,  3 Aug 2026 23:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785801474; cv=none; b=AN6QWkeIVauzD2N2Afpd2mOb8duNPTJ3qBHQxgf61OD5qrGcv9wITJ2Fb+P9RjwXLKvhFJY/zZYT9lUzoAUqGFBpjYzH9xpe/EdKh+R2Sq092HLrugwan5GyaBByGW7QdNVNdmSTlthk/3xOqXPInOu2w+g2mGMrTwl7SKu+hvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785801474; c=relaxed/simple;
	bh=/SsWzifS+2M/ME29g5IPm088xVvIfUU84iPO2JBgyEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MnzJZ2BTvNj/5lD+vLCxFBuYvoIE+53GcZApI5M6qsTwloQ1lYCZWbJ/Inj2uhRHT6JJqOA/5QXJrROn3KogOihINqikYyGxtWlJlIR8kIg6vXxA7x2Z2A9Wk59zrCTAY45/jqpwUEOTp5JxceXM7K4Wgg2CTNClDDpqUiNrm7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XcD4DoDJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XcD4DoDJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F751F000E9;
	Mon,  3 Aug 2026 23:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785801471;
	bh=XZmYc75+xUIj1m8RE7awP8Cx8x9wPSvBtIIHehJ0UPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XcD4DoDJ/afmjHhO9gRYV15U96Xfhh/5gguJGfPtTRA4iznd979IRwH3Hx7OeCucr
	 ldSt26dtSUl6O8cY39bU/XRe6Vm9L5xDcstWGUxWOKQlwFh3M3s6kpU2saae7edste
	 LHu99zPrhWrVQXEcfJaFpHz6OYNXCESV+4TAOvrlf6WKb1v9TQOL8K8FfwpKX7xjOH
	 AMNvPY7Da8Dj+dNgC3FUjPJpPsonSrDm4mNq625X/BtZajNVqMKhXcCbL530B3yVGk
	 pSxq8PcesGxXRXPPnbYdBrnoxLWUyQk2KagZHHlKEJm80fkLkshUTQaZRaQneem2JK
	 SPuDAeqiHDPCg==
From: SJ Park <sj@kernel.org>
To: pratmal@google.com
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Yosry Ahmed <yosry@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Liam R. Howlett" <liam@infradead.org>
Subject: Re: [PATCH v4 1/2] selftests/mm: rename local_config.h to local_config.h_gen
Date: Mon,  3 Aug 2026 16:57:42 -0700
Message-ID: <20260803235743.87939-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803221732.3651981-2-pratmal@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hell Pratyush,


My recipients checker found you are using the old email address of Liam, so
added Liam's updated email to the recipients list.

On Mon,  3 Aug 2026 22:17:31 +0000 pratmal@google.com wrote:

> From: Pratyush Mallick <pratmal@google.com>
> 
> Because local_config.h is a generated build artifact, un-ignoring all
> .h files in .gitignore causes it to incorrectly show up as an untracked
> file in git status.
> 
> Rename it to local_config.h_gen so it no longer matches the !*.h
> inclusion rule, preparing for a subsequent patch that switches
> .gitignore to a pattern-matching approach.
> 
> Update Makefile, check_config.sh, and affected test sources (cow.c,
> gup_longterm.c) accordingly.

Looks good to me.  Thank you for accepting my humble suggestion or reordering.

I found this patch cannot cleanly 'git am'-ed on mm-new, mm-unstable and even
mm-stable.  Maybe rebasing will be nice?

> 
> Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Pratyush Mallick <pratmal@google.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
