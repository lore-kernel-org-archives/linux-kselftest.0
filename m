Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1424052B0;
	Tue, 11 Aug 2026 16:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786465234; cv=none; b=IHle9A722IUt3FrAEz7MAKD5pRA2QDsliovFUmLO4cOPPQjN1326tXR0k6FA2uZtDrJVAexy+HoNlriS09+iWctfVhbHkefJ2d63xcJ0J1g2OQPqH3HZaYzyTgx38jSoaigDNNLd9rksE4A8be0WrZUxQG19iwkpDd576mFpIA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786465234; c=relaxed/simple;
	bh=Re60urUOvm6o+j43K++p0tEN/xkz34z/sPtq/lKiMm0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oUypo9YWh++X6NMbcsw5S+kLVTbv5dnfic1rwrGE9nkX+cHxr+h69tJI8WK4TfMbHA0yAgIIQdhDwoq4RFVl3hQNXqhzoC+6zJktZvFtft/pGTKb6kOPstF67goDypCjbljPSoer13LjPTS5dId919UPSvc+h6gnQUu7TqGIKlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=acTIzyrQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="acTIzyrQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C0581F000E9;
	Tue, 11 Aug 2026 16:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1786465232;
	bh=rABLzlg0u43+P339RMNGZnI+bssjGoZAX7d22G0Ys3U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=acTIzyrQRgh1FIirEmgF/tH7NRIIlVSax39cdCWA7OWihUsPz3hnQWANNtJJr0ViB
	 p/pplBIzwCxHcSImUCPEffJVZXYhcFHJgmXdvRqzLHFEWm+Y1NPc7dm352kpJMwVSX
	 apLW+KJT15K+EgM+v3CsoZBxt1YFrEWdbnr3eAMk=
Date: Tue, 11 Aug 2026 09:20:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko
 <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH] selftests/mm: thuge-gen: fix test_shmget() for
 PAGE_SIZE check
Message-Id: <20260811092031.8e6eadf43c3df4c1c6005ec0@linux-foundation.org>
In-Reply-To: <20260809-selftests-thuge-gen-fix-v1-1-1919f4b3d12f@kernel.org>
References: <20260809-selftests-thuge-gen-fix-v1-1-1919f4b3d12f@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 09 Aug 2026 11:03:35 +0300 "Mike Rapoport (Microsoft)" <rppt@kernel.org> wrote:

> Commit 49a4e7186b08 ("selftests/mm: thuge-gen: add setup of HugeTLB pages")
> changed thuge-gen test to use common functions for reading hugetlb
> attributes from sysfs, but it missed that the original read_free() function
> special cased PAGE_SIZE tests.
> 
> For PAGE_SIZE tests, failure to read sysfs was ignored and read_free()
> returned 0.
> 
> This allowed test_shmget() to essentially skip the check of how many huge
> pages was consumed when it ran with PAGE_SIZE.
> 
> Commit 3199b0c09efa ("selftests/mm: fix read_file() return value check")
> fixed the common read_file() to actually return error on failure and this
> exposed the issue in test_shmget() that checks the number of free hugetlb
> pages even for PAGE_SIZE test, tries to access
> 
> /sys/kernel/mm/hugepages/hugepages-<PAGE_SIZE>/free_hugepages
> 
> and obviously fails there.
> 
> Gate the checks for free huge pages on size != getpagesize() and initialize
> before and after variables to values matching PAGE_SIZE test.

Thanks.

> Fixes: 49a4e7186b08 ("selftests/mm: thuge-gen: add setup of HugeTLB pages")

Which is in mm-stable.  I'll plan to slip this fixup into mm-stable
later this week.

