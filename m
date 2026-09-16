Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B591B4223;
	Wed, 16 Sep 2026 01:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789521322; cv=none; b=rjCDIRwxQmc4NuvmmpeS8IRPK8IBRU10+u72M+ewVF3Qj2QvtTbLczqdqk0/D91MjuU6jfl/lBQFOgoa8hzDI/KjhOpX8mcJ1ZOx8o1EoDasvCcRmCvVNlzgqZVUseqf2MKcfJ8UPc0Q6MrgdCjoDCSIvkbz3JnWbS4vXbEH9Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789521322; c=relaxed/simple;
	bh=LjUwx0Nq5KTl0cndzlFsUqSwPnKaVWLCHqag2SYfJDQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ZC0qN9OA7QCdurcb2qArtbBxpbZ8F/ZUTbm60F4ZjvSNhUWRBqqfsVEBn2HdqMBxDwGdlNpNVECV007fdVMi5IMm5mId9tkJooa4JRFOO05F11VAfECJhJQjp1UWQ+s6f2dt0B/UKVDmkaQ2xyIT1LQYr1ng54frksq5wjKKRhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AUVm1lBJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AUVm1lBJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58EE1F000FF;
	Wed, 16 Sep 2026 01:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789521320;
	bh=XuQDZikRv9jj7fQ5oAHaP13olV/99KYu+eiNYZt//68=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AUVm1lBJj70j8iqZrzQ1fp/ueoOLFAKmyvLXcuvW6liyZeYvuNXpyoTxXSd5DK5h+
	 E708l/TD4IbwQwiwzx0h6LvU9909pVVWHhvzM5JTwL5IgghscAtdBgdFta5vpPGtYb
	 Vc2vhtdaDEQUBe74tqvrodB/VxTHrrgzQwZ9f4ig=
Date: Tue, 15 Sep 2026 18:15:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry
 Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
 <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Lorenzo Stoakes
 <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>, Shuah
 Khan <shuah@kernel.org>
Subject: Re: [PATCH 0/2] kselftest: mm: fix intermittent failure khugepaged
 test
Message-Id: <20260915181519.648c2962143b761cf02efd17@linux-foundation.org>
In-Reply-To: <20260915-fix_khugepagd_fail-v1-0-bb6f04c8759f@arm.com>
References: <20260915-fix_khugepagd_fail-v1-0-bb6f04c8759f@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 10:21:35 +0100 Yeoreum Yun <yeoreum.yun@arm.com> wrote:

> There are intermittent failures in collapse_max_ptes_swap() and
> collapse_max_ptes_shared() when using the khugepaged_context:
> 
>   # Run test: collapse_max_ptes_shared (khugepaged:anon)
>   # Allocate huge page... OK
>   # Share huge page over fork()... OK
>   # Trigger CoW on page 1023 of 2048... OK
>   # Maybe collapse with max_ptes_shared exceeded.... OK
>   # Trigger CoW on page 1024 of 2048... Fail
>   Bail out! Unexpected huge page
>   # Planned tests != run tests (26 != 23)
>   # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
>   # Run test: collapse_max_ptes_swap (khugepaged:anon)
>   # Swapout 257 of 2048 pages... OK
>   # Maybe collapse with max_ptes_swap exceeded.... OK
>   # Swapout 256 of 2048 pages... OK
>   Bail out! Unexpected huge page
>   # Planned tests != run tests (26 != 17)
>   # Totals: pass:17 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> This happens because khugepaged may collapse the pages before wait_for_scan()
> is called, causing a sanity check that expects uncollapsed pages to fail.

Is this something we should be testing for?  If I'm understanding
correctly, success/failure is dependent on timing vargaries inside the
kernel and that isn't something we can reliably test for.

IOW, should we say "bad idea" and just delete this test case?
