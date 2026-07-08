Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8457C3F9F49
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 13:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783518939; cv=none; b=GjdnBvSXXGKlK8QkJ9c8m9K0ZByurW38gVfl5JjXlyaKTntlZIPYMgh2Kke9qo0fOptIHV/3hdShtn1on3zb6tbM2A0yPa1OvTAqCnzlKDefrErnwcu4em2fy9HjbwkbbVDl5cxSBNHt4+q1zE6wfqwS2VPpm3leI/xvFjdo4n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783518939; c=relaxed/simple;
	bh=SQGAw42FXt4XG+V4Ly8vHpJ7Sw04TZO294Eo2BUvoQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B4JAc4v8SWVlCw3wfhTTR9T/ceozT6iHOytovNWAXxkILvVDILBbMY5C1myqv0hOUOVPTaK723h1A0+80plWb6upVuW9KVpgP6tQ0JJTlqs68XUM4ii4QNFFg+fsRsS8dJY3URfMIfmUHVoyEF5sybl1/vKvBnHB/w8O/btrm8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ApkfZAPe; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ApkfZAPe"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783518924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DumeYOm4RAsOVh0uQBPFbd4lfQ35Js58LdeDgME4iC8=;
	b=ApkfZAPexPaSLNtsfl42DBx1qyChc5EO2KpX8eeuck2SebANu8tOXOMCQ1T+/zOIgmk5bY
	4ee5xmFvzYgajiV3YeMtkSbdFKoo1DTlJed8IyOX2toProdSQ1KS5WwncTjvJLWvf3O0wz
	lP4gXygReDf/aARZ4m/KTneai1EYZ3A=
From: Usama Arif <usama.arif@linux.dev>
To: Sayali Patil <sayalip@linux.ibm.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Ritesh Harjani <ritesh.list@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Michal Hocko <mhocko@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dev Jain <dev.jain@arm.com>,
	Liam.Howlett@oracle.com,
	linuxppc-dev@lists.ozlabs.org,
	Miaohe Lin <linmiaohe@huawei.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH v3 2/3] selftests/mm: fix ksm NUMA merge test for systems with memoryless NUMA nodes
Date: Wed,  8 Jul 2026 06:55:02 -0700
Message-ID: <20260708135503.180169-1-usama.arif@linux.dev>
In-Reply-To: <78a3b0e3fb94004c0710872c5bab6f7381b7d63c.1783446924.git.sayalip@linux.ibm.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Wed,  8 Jul 2026 12:29:06 +0530 Sayali Patil <sayalip@linux.ibm.com> wrote:

> The KSM NUMA merge test allocates identical pages on different NUMA
> nodes and verifies KSM behavior with merge_across_nodes enabled and
> disabled.
> 
> On systems with memoryless NUMA nodes, for example:
>  #numactl  -H
>       available: 2 nodes (0,4)
>       .....
>       node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
>       node 0 size: 14825 MB
>       node 0 free: 1382 MB
>       node 4 cpus:
>       node 4 size: 0 MB
>       node 4 free: 0 MB
> 
> the test may attempt to allocate memory on a node without memory,
> causing numa_alloc_onnode() to fail and resulting in a spurious test
> failure.
> 
> The test currently checks numa_num_configured_nodes() to determine
> whether sufficient NUMA nodes are available. However, configured nodes
> do not necessarily have memory.
> 
> Reuse the existing get_first_mem_node() and get_next_mem_node()
> helpers to locate NUMA nodes that actually contain memory, and skip
> the test when fewer than two such nodes are available.
> 
> Before patch:
>        ---------------------------
> 	running ./ksm_tests -N -m 1
>        ---------------------------
>         mbind: Invalid argument
>         ok 1 KSM NUMA merging
> 	Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>         [PASS]
>        ok 1 ksm_tests -N -m 1
>        ---------------------------
>         running ./ksm_tests -N -m 0
>        ---------------------------
>         mbind: Invalid argument
>         not ok 1 KSM NUMA merging
> 	Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0
>         [FAIL]
>        not ok 2 ksm_tests -N -m 0 # exit=1
> 
> After patch:
>        ---------------------------
>         running ./ksm_tests -N -m 1
>        ---------------------------
>         At least 2 NUMA nodes with memory must be available
> 	ok 1
> 	SKIP KSM NUMA merging
> 	Totals: pass:0 fail:0 xfail:0 xpass:0 skip:1 error:0
>         [PASS]
>         ok 1 ksm_tests -N -m 1
>        ---------------------------
>         running ./ksm_tests -N -m 0
>        ---------------------------
>         At least 2 NUMA nodes with memory must be available
> 	ok 1
> 	SKIP KSM NUMA merging
> 	Totals: pass:0 fail:0 xfail:0 xpass:0 skip:1 error:0
>         [PASS]
>         ok 2 ksm_tests -N -m 0
> 
> Fixes: e3820ab252dd ("selftest/vm: fix ksm selftest to run with different NUMA topologies")
> Co-developed-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
> ---
>  tools/testing/selftests/mm/ksm_tests.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 

Acked-by: Usama Arif <usama.arif@linux.dev> 
