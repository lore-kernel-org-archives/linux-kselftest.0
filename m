Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DC53E49DC;
	Tue,  4 Aug 2026 09:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785836916; cv=none; b=tWlWsZZvTCy6qjzUhN7ayPdEuc4W3PKrMkLnqXILWZuzT/CEJP2nacq8CwuMFkLCnNhzyIGcURvaHvMCqgMyaFIMfKQRCdfTfsSLeHV2FfGr5OMUyYQ9YjANhyPUBQMEFb3S/8WMLiccAfwj5P+5Qy01DKE6MMyjSycDZneQy+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785836916; c=relaxed/simple;
	bh=NpOsAKdTV9O4eAB58GhjrvM5EzfGhqVVwYxYhQfLgEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPYvjrB0xoxiDKEX1hifRzffL50mHJNd6C4z8ohatSnXDwskHvDvT12/6s4MXnipGBzK/e5IhaCg8O+MYenzIxO/TkR/H3pLwwaBEIrZMV0jR+H2AACjdGi90dYlQb12nFc9XD5PHwpyjzum0+Xdm2pRbogMPTzmVNpqSieDKvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h46r7BYs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h46r7BYs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9901F000E9;
	Tue,  4 Aug 2026 09:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785836913;
	bh=N6NTU6QcE6hiGH8G9khVllML3QHJN3xw49Y03LvnRQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h46r7BYsaBRM78hsvC/08Tocm36DW+yFmy2FdVL8MHMFyh+26apNqPD2pCGPaDe1v
	 VCOY+ndcxPEwRsxZ9PMO62PnUJ6Z0s6R+SjhpMSUKRMOA0o5NqQVjxgglsDqKJzxSc
	 ILqTB1vQHAWFIUlYFybWXBlJ2Y6Lw4ZaFldo2CL1+4PtLuYTq3rOVZ51x0sRqIbWqm
	 Y5Fz+QIakuQPjo0mIA+uReGLz5w3uattg/4v8P44KHjWAMYuQr2S7FukXkJg4BPlaP
	 uwRjcrXB1cng/9EUGLmXF/REvrvZk4Rn0YrJTYcfD6FgzeX5q6kLrIQfROht15MvT0
	 lLLIarH0yY9Ug==
Date: Tue, 4 Aug 2026 12:48:27 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Warren Xiong <warren.xiong@ugreen.com>
Cc: akpm@linux-foundation.org, shuah@kernel.org, david@kernel.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: read memory information without popen
Message-ID: <anG1a-caNs7xEcQS@kernel.org>
References: <1785720615-5826-1-git-send-email-warren.xiong@ugreen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1785720615-5826-1-git-send-email-warren.xiong@ugreen.com>

On Mon, Aug 03, 2026 at 09:30:15AM +0800, Warren Xiong wrote:
> read_memory_info() invokes two shell pipelines to obtain MemFree and
> Hugepagesize from /proc/meminfo. It does not check whether popen()
> returns NULL before passing the result to fgets(), and it does not call
> pclose() when fgets() fails.
> 
> Open /proc/meminfo directly and obtain both values in a single pass.
> This removes the unchecked NULL path, closes the file on all paths, and
> avoids dependencies on external commands.
> 
> The compaction test continues to pass after this change.
> 
> Signed-off-by: Warren Xiong <warren.xiong@ugreen.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  tools/testing/selftests/mm/compaction_test.c | 43 +++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 16 deletions(-)

-- 
Sincerely yours,
Mike.
