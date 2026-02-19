Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADC022759C;
	Thu, 19 Feb 2026 09:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771492049; cv=none; b=pAU0R3xcMPi/irXh43X2lYT4uYeXgSJ31cj7L+Cz6k6Jcy/qW9iuEjycZfMu4qK6UmM6aqBZVCGFSB2RkABcrkgIoelTPrwCZpXof3UsnBHoDkXf4+PeK1bE1ufR3/rXEkLrS/f6KH75+8oBa3evqBOuOkms9nptf+FXvlT3z/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771492049; c=relaxed/simple;
	bh=xfSbSFMOR5WWZYkD/q8j+zwbninOKJZFgeYouvFQ3AE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O2VU5cybvafRH8JYnGcrTOiia4tie0iCcaKWQrolxgtlZHnO6OFbJnhLMKpi2iFsSsbvAEgiC9MEmqWCvidk88FxSWxzPh+uGoSuQ2yFwZ4imvuVL/as/1aQH/sC8LPr4C/1QEnZCTs5vFvAnV2vIVRcRMtuVKEZQstvMi1HUKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1GqSZMP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1GqSZMP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6394AC4CEF7;
	Thu, 19 Feb 2026 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771492049;
	bh=xfSbSFMOR5WWZYkD/q8j+zwbninOKJZFgeYouvFQ3AE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o1GqSZMPrLBpAUuJqza5bmDUQOVrBe3F6G2X89Q+yFPp6HbKLgeegbzCQMYLF8520
	 HTrLyJ1UYcreRqV8EClqLPD+9cfzx/nWsT0/8i324e0c267AXaxKAmdh3uFk+70knL
	 4cb/AkERs8BbCeRxozLoV84DS6jgXQ/32HbrNGyG8eoDAx3g/QlCzxLrxY22CbVE3l
	 dnYW8BDqZ61K2ort8T2c1Z/luTvGXoItq8BHs+vJdnQBN4xZVSTPuZj4qFV6pCNpAr
	 BhgwMwQlSP3jDokl3tJEdZZ3oYxd5Aru3ZaR7VIQHBY6/4Afi+kbIOOCNzQjzDvAlD
	 Hv+PPrP+ihZGA==
Message-ID: <8a06e724-7def-4c61-b340-ef1b3cd8100b@kernel.org>
Date: Thu, 19 Feb 2026 10:07:24 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: skip migration tests if NUMA is unavailable
To: AnishMulay <anishm7030@gmail.com>, akpm@linux-foundation.org,
 shuah@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260218163941.13499-1-anishm7030@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260218163941.13499-1-anishm7030@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/18/26 17:39, AnishMulay wrote:
> Currently, the migration test asserts that numa_available() returns 0.
> On systems where NUMA is not available (returning -1), such as certain
> ARM64 configurations or single-node systems, this assertion fails and
> crashes the test.

Single-node system (my notebook)

$ ./migration
TAP version 13
1..6
# Starting 6 tests from 1 test cases.
#  RUN           migration.private_anon ...
#      SKIP      Not enough threads or NUMA nodes available
#            OK  migration.private_anon
ok 1 migration.private_anon # SKIP Not enough threads or NUMA nodes 
available
#  RUN           migration.shared_anon ...
#      SKIP      Not enough threads or NUMA nodes available
#            OK  migration.shared_anon
ok 2 migration.shared_anon # SKIP Not enough threads or NUMA nodes available
#  RUN           migration.private_anon_thp ...
#      SKIP      Not enough threads or NUMA nodes available
#            OK  migration.private_anon_thp
ok 3 migration.private_anon_thp # SKIP Not enough threads or NUMA nodes 
available
#  RUN           migration.shared_anon_thp ...
#      SKIP      Not enough threads or NUMA nodes available
#            OK  migration.shared_anon_thp
ok 4 migration.shared_anon_thp # SKIP Not enough threads or NUMA nodes 
available
#  RUN           migration.private_anon_htlb ...
#      SKIP      Not enough threads or NUMA nodes available
#            OK  migration.private_anon_htlb
ok 5 migration.private_anon_htlb # SKIP Not enough threads or NUMA nodes 
available
#  RUN           migration.shared_anon_htlb ...
#      SKIP      Not enough threads or NUMA nodes available
#            OK  migration.shared_anon_htlb
ok 6 migration.shared_anon_htlb # SKIP Not enough threads or NUMA nodes 
available
# PASSED: 6 / 6 tests passed.
# 6 skipped test(s) detected. Consider enabling relevant config options 
to improve coverage.
# Totals: pass:0 fail:0 xfail:0 xpass:0 skip:6 error:0


What numa_available() really checks is if the kernel supports NUMA by 
trying get_mempolicy(). If that fails with ENOSYS or EPERM.

That should mostly (cases we care about) be the case if the kernel is 
compiled without CONFIG_NUMA.

So a better description here would be "On kernels without CONFIG_NUMA, 
this assertion ..."

Given that tools/testing/selftests/mm/config does not include 
CONFIG_NUMA, I think we want to add here

Fixes: 0c2d08728470b ("mm: add selftests for migration entries")

Acked-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
