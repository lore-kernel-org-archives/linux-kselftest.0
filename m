Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7529C3D6494;
	Fri, 24 Apr 2026 13:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777037327; cv=none; b=VOGBXeg6jb8+fHRFvG97rntJoku/AsQrlKeRjnfRDG0yCho2w5PuHJo2Y19/uQs4XQUONRuwmtGB7VbytIQGzBtNU14lbbNrgJd1IS/4fyzfO7gmaNyyk6tC6/nEc+1Ji8VOU/+/j9daH3WfZh3xkPkfRTbW4s1YkSgxOX/q138=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777037327; c=relaxed/simple;
	bh=IhfgqdqsMepvSbnRCEvYdIExQH0XA0VhU82KOe48pfw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Q+wGrU0e8FMlNOXqPEoWvvvtNaWG8KpxaoCEm13GuXBUqRvsl7BlT/YcjjK3Rx2vutcw8islR2o6ReVS7MgQ2fsUFNLi2LCGE1kHWPk05gXyq7pYrbMflQtKb1/SlWXoQN0zq8cRJPBSglvARTEdofl2SA4Ccj7QZxi6IFX4+XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KGGRP124; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KGGRP124"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23438C19425;
	Fri, 24 Apr 2026 13:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1777037326;
	bh=IhfgqdqsMepvSbnRCEvYdIExQH0XA0VhU82KOe48pfw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KGGRP124jq93G6t3s0LoBErg/++C25uWv3WaS28c2d0dr5EjZRdlcn9rJmIVD7sS6
	 1dR/yjWyOG34MN9YAW26tHjJ/ff7TDLMAHmqoCKOwecvaobKO9MkU//t5h0X437qCS
	 KlPDQXKOfqBYKs6oJfrZ35BbV3cC6/mWvwlDk75c=
Date: Fri, 24 Apr 2026 06:28:45 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Breno Leitao <leitao@debian.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
 <nao.horiguchi@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, David Hildenbrand <david@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah
 Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-team@meta.com
Subject: Re: [PATCH v5 0/4] mm/memory-failure: add panic option for
 unrecoverable pages
Message-Id: <20260424062845.fd3d9acd12489f15bec7e72f@linux-foundation.org>
In-Reply-To: <20260424-ecc_panic-v5-0-a35f4b50425c@debian.org>
References: <20260424-ecc_panic-v5-0-a35f4b50425c@debian.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Apr 2026 05:23:58 -0700 Breno Leitao <leitao@debian.org> wrote:

> When the memory failure handler encounters an in-use kernel page that it
> cannot recover (slab, page tables, kernel stacks, vmalloc, etc.), it
> currently logs the error as "Ignored" and continues operation.
> 
> This leaves corrupted data accessible to the kernel, which will inevitably
> cause either silent data corruption or a delayed crash when the poisoned memory
> is next accessed.
> 
> This is a common problem on large fleets. We frequently observe multi-bit ECC
> errors hitting kernel slab pages, where memory_failure() fails to recover them
> and the system crashes later at an unrelated code path, making root cause
> analysis unnecessarily difficult.
> 
> Here is one specific example from production on an arm64 server: a multi-bit
> ECC error hit a dentry cache slab page, memory_failure() failed to recover it
> (slab pages are not supported by the hwpoison recovery mechanism), and 67
> seconds later d_lookup() accessed the poisoned cache line causing
> a synchronous external abort:
> 
>     [88690.479680] [Hardware Error]: error_type: 3, multi-bit ECC
>     [88690.498473] Memory failure: 0x40272d: unhandlable page.
>     [88690.498619] Memory failure: 0x40272d: recovery action for
>                    get hwpoison page: Ignored
>     ...
>     [88757.847126] Internal error: synchronous external abort:
>                    0000000096000410 [#1] SMP
>     [88758.061075] pc : d_lookup+0x5c/0x220
> 
> This series adds a new sysctl vm.panic_on_unrecoverable_memory_failure
> (default 0) that, when enabled, panics immediately on unrecoverable
> memory failures. This provides a clean crash dump at the time of the
> error, which is far more useful for diagnosis than a random crash later
> at an unrelated code path.

Sashiko is asking things:
	https://sashiko.dev/#/patchset/20260424-ecc_panic-v5-0-a35f4b50425c@debian.org
