Received: from mta0.migadu.com (out-136.mta0.migadu.com [91.218.175.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B55B489873
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 17:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824965; cv=none; b=B8bFGxaa8eihIHpkUGorDCr8fXooUIuGi577g/ncMpStNsqgbnYd2R/SHGC80ZYLTX1XC14XUjtOjF9QsyQXExXfsC/xtZ6Y832cx5xEWp2OA5PkvJTFhQmjl5JvjISsvpET2ZgV9wFvN5P84v0dGYUY6M8tBuA1XgNYt3d3ILY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824965; c=relaxed/simple;
	bh=qDv/NSdW3MzL+jLfvuFsv4SG2honLhUx5uSId8sNcR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQlpexlvlqaiWrXNjpyttVUZCtLgldq68+0FXfAB6O8uc0xCN1xwRDXtrmbiNSOmsj5F54fFTWQLjvR/h6cNp8+c0MgCbjzabPMzlCmPnmc+Zc9vbvSf3wERYz3X0SOY7yGs1C4CuI94ZTf1z7m9QGqaOwGYnKLMDRncXapi0EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VaL6JJ3g; arc=none smtp.client-ip=91.218.175.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VaL6JJ3g"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qDv/NSdW3MzL+jLfvuFsv4SG2honLhUx5uSId8sNcR4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791824961; v=1; x=1792429761;
 b=VaL6JJ3g8i4Pdt7XxbObuaXCKyDmWhc86BRkg0sHdBRYyHQnDrK1V6FA04GApWfmEJSyEqoJ
 IPAjuMO/ZN39dM17KKjtzN0nzHg70xc6CmsVbI1Auzi6sOefPw9bGAfyaSapsRsBMtvzW79BuM1
 1TVlpck7WcIGktWcVrtQ7V9s=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 91230e58bb63eacf;
	Mon, 12 Oct 2026 17:09:21 +0000
X-Mizu-Trace-ID: 91230e58bb63eacf
X-Migadu-Flow: FLOW_OUT
Date: Mon, 12 Oct 2026 10:09:19 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Sasha Levin <sashal@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Amir Goldstein <amir73il@gmail.com>, 
	"T.J. Mercier" <tjmercier@google.com>, cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] selftests/cgroup: free the paths returned by cg_control()
Message-ID: <as0UNidNPx1Nblll@linux.dev>
References: <20261011223358.2327625-10-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011223358.2327625-10-sashal@kernel.org>

On Sun, Oct 11, 2026 at 06:33:38PM -0400, Sasha Levin wrote:
> cg_control() returns a path allocated with malloc(). The two callers
> that pass it straight to inotify_add_watch() never free it, and pass
> NULL to it if the allocation fails.
> 
> Keep the path in a local variable, check it, and free it when done.
> 
> Fixes: 5313bfe425c8a ("kselftests: cgroup: add freezer controller self-tests")
> Fixes: 2de27980e1d46 ("selftests: memcg: Add tests for IN_DELETE_SELF and IN_IGNORED")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
