Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1403C3D9531;
	Fri,  9 Oct 2026 05:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791522803; cv=none; b=XOvPpaS6Spv9v0xqKlJcXSXKY69uSPEbxab/SSNcGSq44r9atDGhY2DcALOC/b0sHKIfvEhj8MH4YJHVceEItnDKOjHAwAQwcFn7uKTg0z8GNKXAeoMRz3GMVrApVV69GgL+xfTJOk7e/6xXKgwh+EL2cFFGWa0ex9ysmZb1Qso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791522803; c=relaxed/simple;
	bh=Up5VW3WVYfkQh6zMtdnmrrbOJdA1MRxjQ2hW3bVNq4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MujLhxQplOSToCeXaYa1fMqD7dJpa09M88S4WXY897SdyP9qKgyrXSX/srlFUm6tbsSE/ZKP7y/kj/rtul5LlH0EyVk9HP4tST9rFXF24Y+1gYDKZwsTq+B/7wbnA0Y/lVEr5AQo1o81UlW1vF7qDmOqUPpx381uxRbLjsbQA6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UHYExIGv; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UHYExIGv"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D20B21570;
	Thu,  8 Oct 2026 22:13:16 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00AA63F8C6;
	Thu,  8 Oct 2026 22:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791522800; bh=Up5VW3WVYfkQh6zMtdnmrrbOJdA1MRxjQ2hW3bVNq4Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UHYExIGvLJG3xry06wgT+mB5czOQPwgieOVRyN5R34Wtc2hZfpp6E9BP3strDb0Ro
	 ThxzcoTixdbzkjzZV8R6Pj5EIq8j60y9ZSdDy2rQbk8FpcD8Hqux2VmlqDpYDt/1Aq
	 RcNK3rtmclPaeyQhmtuhkmFMK0VmstvzCEmFltU4=
Message-ID: <9a936154-fca0-4657-80f8-dd736bed7e38@arm.com>
Date: Fri, 9 Oct 2026 10:43:11 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] kselftest: mm: introduce size_to_shift() helper
To: Yeoreum Yun <yeoreum.yun@arm.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>
References: <20261009-fix_hpage_macro-v5-0-54378ae45add@arm.com>
 <20261009-fix_hpage_macro-v5-3-54378ae45add@arm.com>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20261009-fix_hpage_macro-v5-3-54378ae45add@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/9/26 6:57 AM, Yeoreum Yun wrote:
> Introduce size_to_shift() for future users that need to
> obtain shift of a huge-page which is other than pmd_psize().
> 
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---

LGTM.

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>

