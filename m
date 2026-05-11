Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F49B4D8DB5;
	Mon, 11 May 2026 21:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535262; cv=none; b=B6J8LWG0KactRA0nJ/Mv6BfYbktz4LQ1iIzwFgAecnqn1KxdjKnu0VzrIIjFWWQmzclUu+pDFsVCytx7JemAKNTNaTyGIaWSh8E8c7YEYSOrsoK8d1fNLHTVK+4ViqQRnQs3dQVyMurdhgQnz4gI8DmRxvG6/qC2UToTf8nrDA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535262; c=relaxed/simple;
	bh=UqVonophyFqbSxTsEU+N90w0I2vG1qI/ghSqvSUUGSI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bMfiUlQOP13+8Lp1b9x+8Hww5BXqp5aoRQtgfPnOtfEdJKAeS8Aml7Z/ZPf2V2+hW7ODurxRyUMXi5EZ7gv8vbnvZdKKEAw7ZcQLR6IdcXwPRPPdRMhVZFEPWKj2gAo4tv8fSQz26ojdi04qUbQbUs9KBYTjL2ryPikCHm+vwgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=z5AwNJFH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="z5AwNJFH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F033C2BCB0;
	Mon, 11 May 2026 21:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1778535262;
	bh=UqVonophyFqbSxTsEU+N90w0I2vG1qI/ghSqvSUUGSI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=z5AwNJFHumsQBI/26Qv1iSRJq+NoavFvavQK2LRR3VO3yI8ukXBvVvR+IUjvc+f5c
	 NLsmkapcJI6brRzk3jhvNyWysUuEaQ1NIN2kcVyXL2farfbpLeJB3qxyWfZtHdFkAY
	 gQ0OZAEu8/eVRmUaKxIqnTCYL7Th3e0EkfjJ8bIU=
Date: Mon, 11 May 2026 14:34:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Barry Song <baohua@kernel.org>, Dev Jain
 <dev.jain@arm.com>, Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lance Yang <lance.yang@linux.dev>, Li Wang
 <li.wang@linux.dev>, Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes
 <ljs@kernel.org>, Luiz Capitulino <luizcap@redhat.com>, Mark Brown
 <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>, Nico Pache
 <npache@redhat.com>, Peter Xu <peterx@redhat.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Sarthak Sharma <sarthak.sharma@arm.com>, Shuah Khan
 <shuah@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka
 <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 00/55] make MM selftests more CI friendly
Message-Id: <20260511143420.b1dcf710e99baa48d1c37209@linux-foundation.org>
In-Reply-To: <20260511162840.375890-1-rppt@kernel.org>
References: <20260511162840.375890-1-rppt@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 May 2026 19:27:44 +0300 Mike Rapoport <rppt@kernel.org> wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Hi,
> 
> There's a lot of dancing around HugeTLB settings in run_vmtests.sh.
> Some test need just a few default huge pages, some require at least 256 MB, and
> some just skip lots of tests if huge pages of all supported sizes are not
> available.
> 
> The goal of this set is to make tests deal with HugeTLB setup and teardown.
> 
> There are already convenient helpers that allow easy reading and writing of
> /proc and /sysfs, so adding a few APIs that will detect and update HugeTLB
> settings shouldn't be a big deal. But these nice helpers use kselftest
> framework, and many of HugeTLB (and even THP) test don't, so as a result this
> patchset also includes a lot of churn for conversion of those tests to
> kselftest framework (patches 7-19).
> 
> @Andrew, I think it's good to go now.

OK, thanks, I've added this to mm-new.

> I'm sure Sashiko will still have somehting to say, but there is really a lot of
> room for imporvement in our selftests and with Sashiko being overly pedantic
> we'd be stuck forever.

Fair enough ;)


