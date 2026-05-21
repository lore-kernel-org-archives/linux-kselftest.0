Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E8C388E63;
	Thu, 21 May 2026 21:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779397956; cv=none; b=mKgXNpHf2PmslQcmVsGZnK6jQSxXTAo7EVWHVDH7PyAL7u8eMvWM5BcyFJQQJKg0caDeZfCEGMMHYR0QwKjqjMJnrRIxtmKgo5wSrbXiFtILdwq1PmX1cSy9szyHq5Z3X/fEDUXxu4DYthnFhWDamtaOIZMgrYkRgK0TjDz5ApQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779397956; c=relaxed/simple;
	bh=Hr/yUhwM7cGBwBR44W7wr4shxXf+/+xRp9xAQPRFAr8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=UwOnXCzGU5DFNJ7z8X9AAF55T7lL78asSXz9eJw0VDrl1nfJq30oh2FqbiogTtjmjXYwB9MXN4wep0HtA3OKEYn9bnJj0D61NKrL3XSHyyBmtuPm+Owt0xP1tMr8TueOIAh5J2R+uoni/h/PcityEGAzDsoIIMWhb9WXzUbbNkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=d0RsQynw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="d0RsQynw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77D81F000E9;
	Thu, 21 May 2026 21:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779397954;
	bh=QwEt4mIDZBAaZP8xdG8j5xHhMPLfzuZ5i194Vs+Abws=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=d0RsQynw3/k79yoqJV7pG+aioLaMxrs7vXrCZ3WDlCiNXJ52DAvm13Ud7jzo8A+zI
	 tpkMUW+MUbjSsBZki8CL6Ukn06SCGGA0LEeE9JySxY53H2oSMimvg6hP7a9PMfVsxa
	 jvaLJr/81d6Dp2hM2MtNl76oSORWcdgHoQTLL5nM=
Date: Thu, 21 May 2026 14:12:33 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal
 Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard
 <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Leon Romanovsky
 <leon@kernel.org>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, Ryan
 Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Mark Brown
 <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 0/4] selftests/mm: separate GUP microbenchmarking
 from functional testing
Message-Id: <20260521141233.40045d34c91193e2e45e6f1e@linux-foundation.org>
In-Reply-To: <20260521111801.173019-1-sarthak.sharma@arm.com>
References: <20260521111801.173019-1-sarthak.sharma@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 21 May 2026 16:47:57 +0530 Sarthak Sharma <sarthak.sharma@arm.com> wrote:

> gup_test.c currently serves two distinct purposes: microbenchmarking
> (GUP_FAST_BENCHMARK, PIN_FAST_BENCHMARK, PIN_LONGTERM_BENCHMARK) and
> functional correctness testing (GUP_BASIC_TEST, PIN_BASIC_TEST,
> DUMP_USER_PAGES_TEST). Mixing these in a single binary means functional
> tests cannot be run or reported individually and run_vmtests.sh must
> invoke the binary multiple times with different flag combinations to
> cover all configurations.
> 
> This patch series separates the two concerns: tools/mm/gup_bench for
> benchmarking and tools/testing/selftests/mm/gup_test for functional
> testing. To avoid duplicating HugeTLB and related file helpers, the
> series first moves the common helper code to tools/lib/mm/ so it can be
> shared by both selftests and tools/mm.
> 
> ...
>

Thanks.

> These patches apply on top of mm/mm-new.
> 
> Changes in v3:
> - Address v2 feedback from Sashiko

Sashiko has thoughts on v3:
	https://sashiko.dev/#/patchset/20260521111801.173019-1-sarthak.sharma@arm.com

Probably that's incorrect/ignored material which also appeared against
the v2 series.  But sometimes it finds new things so please scan the
output.

I'll hold off on this series for now, shall see what reviewers have to
say.

