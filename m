Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DA821767D;
	Thu,  2 Apr 2026 00:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775090682; cv=none; b=rinDrnHymZDoARU4C6hn2hme1fj/9DXd68b/4knWbqHeOMGG8bRHlQgYMMJOmFUjAKtDEdFWGMqGZtJl10Djcm9Rz2sTr8wJV9lNOUt18hBI9P2B5GxVLK0fFcKcxcr/Cjc09OBbs/WnSfe7/pCxu+Siwfx67hv/jn/7gABrdVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775090682; c=relaxed/simple;
	bh=GnHscPrNJRppDEXonawDI1TlSlpSxWRDtvMK8mVhTkg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kQWWAN/fPoJghSDQYve9C2Iv53xOTkQ1ml004uXIYFOe4oVUuwXjbPfOMvN+XeyxuJkBymV1kIImGi+mIqYReKqlYU2IGiRZUBC6r9FEGhKTrxdQ8YnPdBrJPmjcX6BHHImYZugjTIGYfT1CV7XJ8d+kHUKSlCK6G/xqudGZZNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HA/tmooA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HA/tmooA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD0EC4CEF7;
	Thu,  2 Apr 2026 00:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1775090681;
	bh=GnHscPrNJRppDEXonawDI1TlSlpSxWRDtvMK8mVhTkg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HA/tmooAm7H0WnStcyUYwNwCrxEXDDjkCXD8RRMBEBxkJmTWFMu9+AXrRydUGHzU1
	 DSdPbQJ0TMVDvsj4SHJBuCZvEOLxbj4HNdamPG5v9/aOnwqxKrwRph4/HY1P7xSSkm
	 dfY8bLps097wtInJHSQhc/5nmZ67k9zwObuphCTg=
Date: Wed, 1 Apr 2026 17:44:40 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Anthony Yznaga <anthony.yznaga@oracle.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, david@kernel.org, ljs@kernel.org,
 Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
 Jason@zx2c4.com, shuah@kernel.org
Subject: Re: [PATCH 1/2] mm: fix mmap errno value when MAP_DROPPABLE is not
 supported
Message-Id: <20260401174440.0f85ea303f0a027b50d99e5d@linux-foundation.org>
In-Reply-To: <20260402003417.438037-2-anthony.yznaga@oracle.com>
References: <20260402003417.438037-1-anthony.yznaga@oracle.com>
	<20260402003417.438037-2-anthony.yznaga@oracle.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  1 Apr 2026 17:34:16 -0700 Anthony Yznaga <anthony.yznaga@oracle.com> wrote:

> On configs where MAP_DROPPABLE is not supported (currently any 32-bit
> config except for PPC32), mmap fails with errno set to ENOTSUPP.
> However, ENOTSUPP is not a standard error value that userspace knows
> about. The acceptable userspace-visible errno to use is EOPNOTSUPP.
> checkpatch.pl has a warning to this affect.

Sounds very reasonable.

EOPNOTSUPP is clearly a networking thing so what on earth is it doing
coming out of mmap code?  Our poor operator is now looking at a networking
error code and wondering what this supposedly non-networking
application is up to.

But just that's a pet peeve - I lost that one decades ago.

> Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always lazily freeable mappings")

Nearly two years ago so I think I'll add this to mm-unstable for
7.1-rc1 and shall let it trickle back a little more slowly than might a
7.0-rcX hotfix.


