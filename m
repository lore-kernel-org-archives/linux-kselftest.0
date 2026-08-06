Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83544D2ECC;
	Thu,  6 Aug 2026 19:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786044438; cv=none; b=igmFkQFFuCwUq6o5zcaQq6/TXJ4g3B5O4Nw1CpYxeBtsNhCYLJOjBJUvVrqS0sBXWwKefncMnizFMoHmN39FMjlO8n8KsQFpwqRkiNxjZWifgfgH9JoiZe17893ZWH0pJzUX5h42Vh3e25fNRV8pGZTjNmiA0ceF7ovooKfNeoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786044438; c=relaxed/simple;
	bh=JXXAiGpu7pKDmbt+1x8OaaS70BoRNdEgG/qUet+ja1M=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=BFtWCSd1YXfn+HJ7PGCgUywZU3PiqyRIAnID2b8tu6jVgm8GzU3iJhmTDxy++ANqMCxTIt8DrPkYsQGs0j/lLBl44O4+mt/ArGKNjX+NFVqLU9Jw/2Sqbe5Hg1mRhdq7OHD1mTne8ZzoP7WVLFlFrewdVI7s/hNIW8FKUUNLLIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BHfeaGOe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BHfeaGOe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5BD1F000E9;
	Thu,  6 Aug 2026 19:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1786044435;
	bh=/FakDfQK+vOcHqnEJilwJjIVartku7nBkuKc4bqJazc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BHfeaGOeTqu6EldjOfoUEzbZY9uMseNTWlSLVnUsKF+OlK2TOACWNcwNjxSK1IxlN
	 VROpOTuNT6UFbIMpB0T39OueCrFyS4iR4623kR+lPHzCO6QclwpD8YXoy6+mWoOCHc
	 n5Z4UZx4oHmS3zjxMevmRYc0wnwRDr0Ap5oXO8jM=
Date: Thu, 6 Aug 2026 12:27:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Audra Mitchell <audra@redhat.com>
Cc: david@kernel.org, jocolema@redhat.com, raquini@redhat.com, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil
 Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah
 Khan <shuah@kernel.org>, Muhammad Usama Anjum <usama.anjum@arm.com>, Andrei
 Vagin <avagin@google.com>, Colin Ian King <colin.i.king@gmail.com>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Correct __pagemap_scan_get_categories return value
Message-Id: <20260806122714.08ef839853939a22de815db9@linux-foundation.org>
In-Reply-To: <20260806181843.1839943-2-audra@redhat.com>
References: <7d6b4401-e230-4ca7-b64f-c1277fa643b8@kernel.org>
	<20260806181843.1839943-1-audra@redhat.com>
	<20260806181843.1839943-2-audra@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  6 Aug 2026 14:17:03 -0400 Audra Mitchell <audra@redhat.com> wrote:

> Currently __pagemap_scan_get_categories returns the result from the
> ioctl call which should be an int, not uint64_t. The ioctl may
> return -1 on error, which will be interpreted as UINT64_MAX. Adjust
> the return type to use the correct value.

I don't know why these were resent.

It's conventional (and useful) to include a [0/N] cover letter when
more than a single patch is being sent.  That's the place to tell us
why a new version has been sent.

And please see how people are tracking versioning infomation in the
email subjects.

And it's nice to prepare a Subject: which identifies what part of the
kernel is being altered.  I think the main audience here is those who
are scanning subjects wondering "am I interested in this".

So to sum up, a good title for this patch would have been

Subject: [PATCH v1 1/2] selftests/mm: correct __pagemap_scan_get_categories return value


