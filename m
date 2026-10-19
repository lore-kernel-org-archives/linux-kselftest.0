Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34DD3BC696;
	Mon, 19 Oct 2026 06:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792391124; cv=none; b=bv+Px4/Z2QGJ3JgM7gj++YJ9s8T9ch70R5fX2jYbj+xHwP69QpfGOTucmH6J3XBB+6lByBwIZUfErwGzyLPY3HXCBqPi4qcKivWZnjhEN+MVz93Tf3/VrkdHugnSaTfMMrGY6MoUXknteeegC5qADiNtNhRtU2gf+FWkA528T80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792391124; c=relaxed/simple;
	bh=55RfTNFBQ9bYI0TDGXnU655P/5to3Zf/3l6pm2G36ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WE9xri4Pj+r26c3fhF3NkSyVD/YZXx722cmRV4FYJjc12rdJTEkIFLgeri35h4r15vEQ24ytrRfVgPJuEz+v77wz23JAKPsABCHQpSyxbvovnGqHC0q+lPJthvKXU/13wE5HhMtSm3ec41/c3PmXKYBbc37Erb2Fij6c/842mWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PAjLuW7o; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PAjLuW7o"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E13A1477;
	Sun, 18 Oct 2026 23:25:17 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A8423F673;
	Sun, 18 Oct 2026 23:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792391120; bh=55RfTNFBQ9bYI0TDGXnU655P/5to3Zf/3l6pm2G36ns=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PAjLuW7oV1dFsO9RUkEDuhzNJVk/QIY1FdzjBlsdfuae1ojCAEHeWbysLZQS33AuL
	 91afN7as3b2wVL8PgRS7QalzNL3VJmXu5G34VBJSycUtx5kDnNHbQGuFmbHivrXfdR
	 PWNX8NdAERb2KexXuzG3pP1o8xO/AUzTHsFH5Gv0=
Message-ID: <d7b1711a-44aa-4169-a250-227a172f4125@arm.com>
Date: Mon, 19 Oct 2026 11:55:12 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: keep ksm_tests on small pages
To: Qiliang Yuan <odys.yuan@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Usama Arif <usamaarif642@gmail.com>, Yu Zhao <yuzhao@google.com>,
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261018-bug-selftests-mm-ksm-tests-nohugepage-v1-1-55ed54bdad35@gmail.com>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20261018-bug-selftests-mm-ksm-tests-nohugepage-v1-1-55ed54bdad35@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/18/26 10:23 AM, Qiliang Yuan wrote:
> ksm_tests fills regions with identical data and checks KSM's counters
> after merging them. allocate_memory() maps these regions without any
> THP hint.
> 
> With mTHP enabled the regions can be backed by large folios, which KSM
> splits before merging. Splitting an anonymous folio maps its
> zero-filled pages to the shared zeropage, so with use_zero_pages=0
> those pages never become KSM pages and "KSM zero page merging" fails
> its count. "ksm_tests -Z -p 10 -z 0", 20 runs:
> 
>   THP setup                     before    after
>   default                         0/20     0/20
>   every mTHP size "always"       20/20     0/20
> 
> Map the regions with MADV_NOHUGEPAGE, as ksm_functional_tests does.
> ksm_merge_hugepages_time() maps its own THP-backed region and is not
> affected.
> 
> Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when splitting isolated thp")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
Tested the patch by enabling all mTHP sizes as mentioned. Before the
patch, the test failed and applying the patch fixed it. So:

Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
