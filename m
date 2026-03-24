Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFCF3328E3;
	Tue, 24 Mar 2026 23:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774394686; cv=none; b=Xw+plgXyQVbhN58Rh4U7Ne8ropsHg1kdHy3n/ZY1xICIK4l0ZWLg+hPqAKvbXBN/eguj9ALJ7le9NdcAd6LfX/dQxrcB7AYP3WephI3dkK755GoS7NKp7vV9TWKyTXTYU445+4CngXZJJE1lko/tDrds8ZgpkyGF0TtsiwuT4kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774394686; c=relaxed/simple;
	bh=F4CyAlfEjGscpz8wF0DsMZgmHP8gEaFE9YsHc3AxTIo=;
	h=Date:From:To:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=htq+98AJm7YTXvfD7a9zpjvjMvCvZXJejORU9T/97DS84ZXT9bM6wVrhQLWdBfxC3crq0za7JrPbW+MPr1om4ng7QUOcuMNjnwtzO2cUvT7ax8fEJhah2sX8Eudb2UtlcWF/mW59szs9HyD3qsVw3mL8LeB/1eadQjh4ShqKzRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=19/D0rw3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="19/D0rw3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE65C19424;
	Tue, 24 Mar 2026 23:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774394686;
	bh=F4CyAlfEjGscpz8wF0DsMZgmHP8gEaFE9YsHc3AxTIo=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=19/D0rw31oXccpRiuy7Qx27TjjZIMtt8GhK18BEh9uOrxPAlnmfJJKBPL0+2S2H5/
	 YigBJ6rCxZpPrctE6hrka6hfrrRVGbxxlfelORLM8B4OFGjsGvnO7C0UFPeoaJHD8c
	 tA+4xAnhJgjyu/rvgJVPxwJ5rilQH7y8lQ2iy960=
Date: Tue, 24 Mar 2026 16:24:45 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>, Audra Mitchell
 <audra@redhat.com>, ljs@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 shuah@kernel.org, usama.anjum@collabora.com, colin.i.king@gmail.com,
 avagin@google.com, linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Fix soft-dirty kselftest supported check
Message-Id: <20260324162445.fb353f4d2c85d89bc25be03a@linux-foundation.org>
In-Reply-To: <20260324162324.6efa49422d145afd4dd37dda@linux-foundation.org>
References: <f7fef55d-4334-4d1d-b6c6-b409fea7e2a1@kernel.org>
	<20260320184010.759461-1-audra@redhat.com>
	<20260320184010.759461-2-audra@redhat.com>
	<a4fb1d56-8c10-46de-acf5-9a00ce0db4ad@kernel.org>
	<20260324162324.6efa49422d145afd4dd37dda@linux-foundation.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Mar 2026 16:23:24 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Mon, 23 Mar 2026 12:56:33 +0100 "David Hildenbrand (Arm)" <david@kernel.org> wrote:
> 
> > > +		supported = __pagemap_scan_get_categories(fd, test_area, &r) >= 0;
> > 
> > You have to cast it to a (long) first before comparing, like we do in
> > pagemap_scan_get_categories().
> > 
> > 
> > Maybe best written as
> > 
> > 	long ret = __pagemap_scan_get_categories(fd, test_area, &r);
> > 
> > 	if (ret >= 0)
> > 		supported = 1;
> > 
> > > +		ksft_print_msg("errno: %d\n", errno);
> > 
> > I guess we should drop that, was mostly for testing.

oops, sorry, just learned the difference between "delete" and "send"

I was going to say "unclear why we're printing the errno from a
successful mmap()".

