Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF1376026;
	Mon, 17 Aug 2026 22:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787006638; cv=none; b=qOeIB8AqfXg8YJtsPVsmTWfdE5XruMywO1DCuphTQ5mvoGR49fub2E+NOmnlHwgTJoaazzv3x8d6aoob9T1gJEqwTIqhyFJAoEB0AojNARE0WRHrzGlWJKRCFzM3KE7O/LOrnIAHfoOdo5IQhD7vZ5Y+oiM5ivOpzhQqqybtcZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787006638; c=relaxed/simple;
	bh=dPeCTHxEi3vhM86lvUQ3fmhqQpOHuP1lcym6ZzrBHmM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=tPObl0YZsXCDi2o66PwwJdlDPKBRcotY/M35PGHp6sJNkV+Go1UZL/hLN5bb7uLwVqZ1pV/taxcp/OeE/X5CpindHgLiGLW7ga3fj8Vao+iFkEZPb7OggOlf4qKg9cXbW2cqM1U00IczxXssbKbDxW9sdSAPUWYuzsGurq8PnLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TPOisz3A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TPOisz3A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30ED81F000E9;
	Mon, 17 Aug 2026 22:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787006637;
	bh=mv5AoSo9/V0u2RCFCjv3YwIVFM6rx0xjD7lOevDqBWs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TPOisz3A30UyNq8RNZ+f9HpJtnVxF51K4jyNTwK+waTu/skKZczVEKcqy9M+SqgXL
	 5ku5F0lb8G5Fn4abRVfM0aHSqEPAUBeVc0H2cKhKiT5+GAaLmsSLweLjNz7RIQVQ47
	 DAG7o8I3CZtEa8cOmb7Q4qm2UiUCODJeMxV0dKTA=
Date: Mon, 17 Aug 2026 15:43:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org, David Hildenbrand
 <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah
 Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/secretmem: prevent uncharged mremap expansion after
 fork
Message-Id: <20260817154356.552ccde5d279f6e0a9ef0ff2@linux-foundation.org>
In-Reply-To: <20260813225328.2010303-1-4ncienth@gmail.com>
References: <20260813225328.2010303-1-4ncienth@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Aug 2026 07:53:28 +0900 Daehyeon Ko <4ncienth@gmail.com> wrote:

> Secretmem mappings are charged against RLIMIT_MEMLOCK and marked
> VM_LOCKED because their pages are unevictable and removed from the direct
> map.
> 
> dup_mmap() clears VM_LOCKED on the child copy, but mremap() uses that
> flag to decide whether an expansion needs a memlock limit check and
> accounting. An unprivileged child can therefore expand an inherited
> secretmem VMA past its limit and populate the added range.
> 
> Add a VMA open callback that marks secretmem copies without VM_LOCKED as
> VM_DONTEXPAND. dup_mmap() invokes the callback after clearing VM_LOCKED,
> while the original charged mapping retains its existing ability to grow
> within the limit.

Thanks.

> Add a selftest that verifies expansion of an inherited secretmem VMA is
> rejected.

And that's a nice touch.

> Fixes: 1507f51255c9 ("mm: introduce memfd_secret system call to create "secret" memory areas")
> Cc: stable@vger.kernel.org

AI review might have found what appears to be a related bug in there:
	https://sashiko.dev/#/patchset/20260813225328.2010303-1-4ncienth@gmail.com

Do you think that's pertinent to your fix, or should it be addressed
separately?


