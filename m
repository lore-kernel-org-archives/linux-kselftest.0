Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBAE480324;
	Fri, 16 Oct 2026 12:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153100; cv=none; b=B3rz71dP/HpYOvpxXkiRyTtQF0k8piVh8U3V6DkupTGRq93p67N5qRuX//vFUL96GWBFHKaq5Q1nIgdqivasJC1jkvfqsIJc6SoOjAiXy3yqndFAg5uS6fC3bBplaRCmY5LHK5RCL9de7lA8kWeOH36YdyQ3I8O7wuMz+MrL8Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153100; c=relaxed/simple;
	bh=ZPRm3vIADOJpy/rrCOlBV/kbvkGxmDZcH+9P05dhEgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vc08oxoWMOvT2jwISa9zxiVHllrwZ4TUakIUwHCKb6UD0Ka8Dn0oMz2qo+7NVdNHqLGoPiNHRjaIbL/+8YgolkL7SwrYwICqbFBYjLaB+7KPdWSoE8seK1a0FDKE7x+L+u7cHQMAUckb45aFgmiLelA85Ns6YhJA+mgz33ta2KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tvRxeJc0; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tvRxeJc0"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23CF314BF;
	Fri, 16 Oct 2026 05:18:14 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE0253F871;
	Fri, 16 Oct 2026 05:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792153097; bh=ZPRm3vIADOJpy/rrCOlBV/kbvkGxmDZcH+9P05dhEgw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tvRxeJc0WPXmr8vAecRZi/jQXP16d5zuGeWuWmsGKUx0tmCcCpOMKvCLZwuhFCV4f
	 M2SqNl4WkSo5J2cxXuNBoGVNEvPpTbGwcwbtMDQmrUAZDqmeEW+6naA3O6YRfODPVa
	 VkJCfMXnQiCAd2zXgAzdOSpGSmQb/PkyqSxcDU+0=
Message-ID: <cba2a01d-630c-42d3-b6e4-b498f10c4b45@arm.com>
Date: Fri, 16 Oct 2026 17:48:11 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] selftests/mm: check MADV_PAGEOUT file permissions
To: "Gregory Price (Meta)" <gourry@gourry.net>,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org
References: <20261014175756.2035176-1-gourry@gourry.net>
 <20261014175756.2035176-8-gourry@gourry.net>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20261014175756.2035176-8-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Gregory!

On 10/14/26 11:27 PM, Gregory Price (Meta) wrote:
> MADV_PAGEOUT only pages out file pages for a caller that owns the file or
> could open it for writing, per can_do_file_pageout(). Any other caller
> gets nothing from a shared file mapping, and only the anonymous COW pages
> from a private one.
> 
> Check that the owner of a read-only file can evict a clean page of it,
> once a writable file page shows that file pages can be paged out at all.
> That test runs as an unprivileged owner even when started as root, so
> that capabilities cannot stand in for ownership.
> 
> Also check that an unauthorized caller leaves a shared file page resident,
> and that it pages out the COW page of a private mapping but not the file
> page next to it. These need root to change credentials, and skip if that
> fails.
> 
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---

[...]
>  
> +/*
> + * The owner of a file may page out its clean page-cache pages. Run as an
> + * unprivileged owner, so that capabilities cannot stand in for ownership.
> + */
> +TEST_F(madvise, pageout_evicts_owned_file_page)
> +{
> +	char *mapping, *control;
> +
> +	if (!geteuid() && !drop_privileges())
> +		SKIP(return, "could not drop privileges");
> +	pin_to_current_cpu(_metadata);

Is there a reason why we are pinning to the current CPU here and not in
the next two tests?

IIUC (please let me know if I am wrong here), without pinning, say in
the test pageout_private_file_reclaims_only_cow:

[...]

> + * A caller that neither owns nor may write a file may page out the anonymous
> + * COW pages of a private mapping of it, but must leave the file pages
> + * resident.
> + */
> +TEST_F(madvise, pageout_private_file_reclaims_only_cow)
> +{
> +	char *mapping;
> +	bool swapped;
> +
> +	if (geteuid())
> +		SKIP(return, "requires root to change credentials");
> +	mapping = map_temp_file(_metadata, 2 * page_size, MAP_PRIVATE,
> +				0400);
> +	if (!drop_privileges())
> +		SKIP(return, "could not drop privileges");
> +
> +	ASSERT_EQ(mapping[0], 0);
> +	ASSERT_EQ(mapping[page_size], 0);
> +	mapping[0] = 1;

If both pages are on CPU 1's per CPU LRU batch here and then hte task
migrates to CPU 2 here

> +
> +	ASSERT_EQ(madvise(mapping, 2 * page_size, MADV_PAGEOUT), 0);

Then this can cause lru_add_drain() on CPU 2, and therefore both pages
do not reach the main LRU list. Thus they won't be reclaimed and the
test can skip here since the CoW page wasn't swapped.

> +	ASSERT_TRUE(pagemap_is_populated(self->pagemap_fd,
> +					 mapping + page_size));
> +	swapped = pagemap_is_swapped(self->pagemap_fd, mapping);
> +	ASSERT_EQ(mapping[0], 1);
> +	ASSERT_EQ(mapping[page_size], 0);
> +	if (!swapped)
> +		SKIP(return, "MADV_PAGEOUT did not swap the COW page");

Also, here we skip if we couldn't swap out the CoW page. Won't it make
more sense to check with pageout_until_swapped() first if pages can be
skipped, and then fail here if the CoW page wasn't skipped after all the
retries, similar to how some other tests implement it?

> +
> +	ASSERT_EQ(munmap(mapping, 2 * page_size), 0);
> +}
> +
>  TEST_HARNESS_MAIN

