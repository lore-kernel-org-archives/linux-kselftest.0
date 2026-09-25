Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734762EC571;
	Fri, 25 Sep 2026 12:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340999; cv=none; b=PTfsADnFf2S/FHo8EECVY3y+db1GzxvyOUmXPOzwxKtswBmD8DReVb5H9tKnFFy4idBFsWP4Mw6n5TU8PRdhjNWAf+SWn5x85dOS/BkZ9DAAhyCcCnC/abDzdaHsDo4dy+o0oVAHHq38nNFiSeNPKFCBVTt04CIU0gMAF5WnHoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340999; c=relaxed/simple;
	bh=xm+mooZ0XkAGq6GKU7h4yi+KjgP6Je8ezgCLqOb4z6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1FpMAQfpd+65/EFyKmwOu2YrxbIfyEnicCsXJktiTVQor49SHaL13wNHhafgDsXhzlPpx2Lnz1ZDstAGterts9xroJ/wWlvOoO/MwbNLNaxBS4YRMUdlji+2wuLbI3LbNIcpzAWJh0vcE4B0ToFF+HDG6LkFo5Rcb2j44mAv2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JQPp/4Pa; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JQPp/4Pa"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26934169C;
	Fri, 25 Sep 2026 05:56:33 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A27B3F86C;
	Fri, 25 Sep 2026 05:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790340996; bh=xm+mooZ0XkAGq6GKU7h4yi+KjgP6Je8ezgCLqOb4z6c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JQPp/4PadiQm3gluMM0otFqo8NCqzpexmW4TOx/2YJgBOhy9iBaZzg/USMbgG6i8G
	 464Kwohpyq8Tb2u/dH+SbWe/zxdNlQkRc5bi07RReOMNdr0pxxsl2JAu2PC8Yl/rZY
	 4d8OEjgeYrfLLTzrBon7MlH/RNJHRL4V6f2LIdAU=
Message-ID: <ee423531-e2a0-4915-b089-905bba22d33a@arm.com>
Date: Fri, 25 Sep 2026 18:26:28 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/4] kselftest: mm: remove check_huge_shmem()
To: Yeoreum Yun <yeoreum.yun@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260924-fix_split-v8-0-cba7359d882a@arm.com>
 <20260924-fix_split-v8-4-cba7359d882a@arm.com>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20260924-fix_split-v8-4-cba7359d882a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/25/26 12:41 AM, Yeoreum Yun wrote:
> check_huge_shmem() was required to distinguish shmem huge pages because
> /proc/self/smaps reports them using a dedicated “ShmemPmdMapped” entry,
> as opposed to “FilePmdMapped” for file-backed huge pages.
> 
> Now that /proc/self/smaps is no longer used to detect huge pages and
> /proc/kpageflags is used instead, it is sufficient to distinguish
> between file-backed and anonymous pages since the ShmemPmdMapped is also
> kind of file-backed.
> 
> Therefore, remove check_huge_shmem() and use check_huge_file() instead
> and cleanup khugepaged's check_huge operation in mem_ops.
> 
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
Looks good to me, so:

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
