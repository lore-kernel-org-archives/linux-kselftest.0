Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3D738BF97;
	Tue, 22 Sep 2026 05:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790056720; cv=none; b=kskzJxP/h3BIUyzGY3yZ3Mmq+ODh+NGCon5dVd/rhDzzSDlGtvHPlRnt4SvMiraJyAQJC+qSi9Z+1jcQ3jrXRpo9feUWCugdEF48b5o9u9iclI4mf9ARyz/McV264nLR9JoJxkSrC2QmXRzY7JYwEl0SIz7edi9lomiXAt3ULBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790056720; c=relaxed/simple;
	bh=MiTuCTeGQ65acj8DTKH5Sh3JcSl8FWqU0wkYXsy7OO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eML+WkEPLAIPaSD/cyFZROoNN/0jY2J9CDl1Ac/qSREWGpPMj/Qki+nufQVGOKxqKAA/86gasi3Pv7KbIqrMYJxhG04Mz0lI9L7jLZkPDGpwuqrbx/YeXzq5Zql1FED49fQMHHUKl3fbd10JgBwKajuGJHp5RM60ak0x0FP1klU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShZNu/nC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShZNu/nC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E85D1F000FF;
	Tue, 22 Sep 2026 05:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790056718;
	bh=ThtsqR5Wl7QxxCKokbSVj/6isgE9KJQAZrTvGvTnCjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ShZNu/nCoM9nE2bePF8ETpeKqLEOYSjbX5HcPFir1HgJe+CTqcFYCCijCZX1pdqIf
	 ZTXKxQ5PLfuLaX1yPDaNtKHGGEtuQ7nzfL/h20baRp69Gzyp4AsTlhiLm+oWE1N6WY
	 BQCWqkOGY9oRAhQ0rtE6IsWnHNoun4eKbixPrftWpFZW4rHNXJjZyCve6r706EePoC
	 4B7i9pixgtuZA8dBZd416L+o9WN6at1mCjJP4kMHJyLn2r1VR3+qYQUtBddqWjGmM+
	 n83SKl7RYeZho1oK0IIAFlzJLY7B+ewQN0OvYXiIDHGP9D3JYjgBILDGzQHPt+xZKa
	 hzCdtg71aG+aQ==
Date: Tue, 22 Sep 2026 08:58:32 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Cc: akpm@linux-foundation.org, peterx@redhat.com, surenb@google.com,
	aarcange@redhat.com, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, mhocko@suse.com,
	shuah@kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] userfaultfd: clear the inherited uffd bit in
 move_swap_pte()
Message-ID: <arIZCIiecnNWPtx3@kernel.org>
References: <20260919004630.1159895-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919004630.1159895-1-donggeunyoo.kernel@gmail.com>

Hi,

On Sat, Sep 19, 2026 at 09:46:28AM +0900, Donggeun Yoo wrote:
> UFFDIO_MOVE on a swapped-out page installs the source PTE at the
> destination unchanged, so a uffd bit set on the source lands in a
> destination VMA that was never registered for write protection, and
> nothing clears it afterwards.  Patch 1 clears the bit unless the
> destination is RWP-registered, which is what the present-page and
> zeropage move paths already do.  Patch 2 adds the test that catches it.

This and changelogs read like an LLM generated text.
Please add attribution as per

https://docs.kernel.org/process/coding-assistants.html#attribution 

> x86_64 defconfig plus USERFAULTFD, TRANSPARENT_HUGEPAGE, GUP_TEST and a
> swap device, under QEMU, base 17e7b8eacf4c:
> 
>   uffd-unit-tests                    before   after
>   move-swap-wp on anon               not ok   ok
>   the other 114 unit tests           ok       ok
>   uffd-wp-mremap, 38 tests           ok       ok
> 
>   pagemap bit 57 at the destination  before   after
>   swapped page, dst not armed        set      clear
>   swapped page, dst WP-armed         set      clear
>   swapped page, dst RWP-armed        set      set
>   resident page, dst WP-armed        clear    clear
> 
>   MADV_COLLAPSE over 2 MB at dst     EINVAL   0
> 
> Donggeun Yoo (2):
>   userfaultfd: clear the inherited uffd bit in move_swap_pte()
>   selftests/mm: add a test for UFFDIO_MOVE of a write-protected swap
>     entry
> 
>  mm/userfaultfd.c                             |  2 +
>  tools/testing/selftests/mm/uffd-unit-tests.c | 61 ++++++++++++++++++++
>  2 files changed, 63 insertions(+)
> 
> 
> base-commit: 17e7b8eacf4cac800a4fc89a28729df72a2dabda
> -- 
> 2.53.0
> 

-- 
Sincerely yours,
Mike.
