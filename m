Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A66D4EBAED;
	Fri, 18 Sep 2026 12:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734359; cv=none; b=IXwK1sgmUtJNnQ7WytCMn4yLjBEH4jK8Z5eDCracWaa1O8XIz1CWJw81ICVIpwUHdOqpr+DffmVVUQ9Qvr8zs9peOBZLlJMoBQ6xEIkTY+vwT6UsO3Rf6XHGqi1uW9XL/ZPm1Fz8aQ9uKGWh+x/D6EmJdrmAuMhtmHzwIEEMjiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734359; c=relaxed/simple;
	bh=bzLjVbV2XLshhPh87slsfNupz1y3zpt+smqxp/pTH6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TsVwigd23g44az/p+7uCj0Z3AIH15bjO5E0vf7cs3hzPhk8aB1LBYUkR/JAsKRhKg/YZ6eNXMVDt2oVw6njwZtxL72vOQwdCJefgiRroMW7lraF8MMev2DzcByQlGs+gvMhKJ0imPW6DLm5VZ976xXKa3YjAUFfls/BGrblMmU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=J6Yr5t9j; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="J6Yr5t9j"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DEA2168F;
	Fri, 18 Sep 2026 05:25:42 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5F223F86F;
	Fri, 18 Sep 2026 05:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789734346; bh=bzLjVbV2XLshhPh87slsfNupz1y3zpt+smqxp/pTH6E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J6Yr5t9jOHufl2Hjx55B6CUtsmoGSJkiZNp3ty7YyOQ789q6L3J/hEyTjh9dj/T3s
	 lVGkdOZmKzRKHURxizUKFUkeVaVfK4NHxPl+UXNlgRa99qTclq23pmBEtuOkXQpgjZ
	 QkcEm7i1eGR3tTmvJygym8i+Vxa2Mt+KlUeGCixw=
Message-ID: <937939c3-ae9a-4148-a601-0f8876216423@arm.com>
Date: Fri, 18 Sep 2026 17:55:36 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/6] selftests/mm: make file helpers return errors
To: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Mark Brown <broonie@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Muhammad Usama Anjum <usama.anjum@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260918112234.195857-1-sarthak.sharma@arm.com>
 <20260918112234.195857-2-sarthak.sharma@arm.com>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20260918112234.195857-2-sarthak.sharma@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/18/26 4:52 PM, Sarthak Sharma wrote:
> Change read_file(), write_file(), read_num(), write_num() and
> write_num_ignore_einval() in vm_util.c to report failures to callers
> instead of exiting from the helper.
> 
> Make read_file() return a negative errno on failure and 0 on success, so
> callers can distinguish a successful read from an I/O error. Also make
> read_num() reject negative and malformed values.
> 
> Keep write_num_ignore_einval() silent for -EINVAL while returning other
> errors to its caller.
> 
> Update callers to print diagnostics and fail wherever required. Modify
> a comment which implies write_num() uses ksft_exit_fail_msg(). Also add
> a helper print_file_access_error() in hugepage_settings.c to print
> TAP-compatible errors without a kselftest dependency. This prepares the
> helpers to be moved to tools/lib/mm without a kselftest dependency.
> 
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
> ---
Hi Andrew!

This fixes an MM selftest build failure in patch 1/6: read_num() changed
its interface, but hugetlb_nr_resv_pages() was missed during the caller
conversion. I'm sorry for missing this.

Can you please apply this fixlet after this patch and before the next
one? Sorry for the inconvenience again.


From f7cfae95a1d0554ea03df320d91641979a9ac473 Mon Sep 17 00:00:00 2001
From: Sarthak Sharma <sarthak.sharma@arm.com>
Date: Fri, 18 Sep 2026 17:40:50 +0530
Subject: [PATCH] fixup! selftests/mm: make file helpers return errors

Convert hugetlb_nr_resv_pages(), which was missed when read_num()
changed to return an error and store the parsed value through an output
pointer.

Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/hugepage_settings.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/hugepage_settings.c
b/tools/testing/selftests/mm/hugepage_settings.c
index 9a63420d0744..6f3abd357385 100644
--- a/tools/testing/selftests/mm/hugepage_settings.c
+++ b/tools/testing/selftests/mm/hugepage_settings.c
@@ -515,10 +515,18 @@ unsigned long hugetlb_free_pages(unsigned long size)
 unsigned long hugetlb_nr_resv_pages(unsigned long size)
 {
 	char path[PATH_MAX];
+	unsigned long nr;
+	int ret;

 	hugetlb_sysfs_path(path, sizeof(path), size, "resv_hugepages");

-	return read_num(path);
+	ret = read_num(path, &nr);
+	if (ret) {
+		print_file_access_error(path, ret);
+		exit(EXIT_FAILURE);
+	}
+
+	return nr;
 }

 static bool __hugetlb_setup(unsigned long size, unsigned long nr)
-- 
2.53.0
