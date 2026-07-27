Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAC22EDD6B;
	Mon, 27 Jul 2026 14:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161151; cv=none; b=A0YVdNhPx+QJZackTfSGPYQ/euQ2ogcAV7jPWgWxWCYxr7w8FdTUupREo2ttYGitOiZ94B113dg7TVfIrgTZoVtHqJ/wAqNQBOQan2MkjCkuOGhhq3RW2Z56kgq+/VaAg4LpmbRtTz54kF2ZhjF9s+CCR0253lGwKovFwgrbc2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161151; c=relaxed/simple;
	bh=nOo4q7EBanSw+rQza1vfbux4v50WfxcoDfWBOiwYJPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uSqmrRH7H8gJazZHduCNbDptJYH/+XbRRiwo+Ja3bXLDDscADcyIXKmDVG3a8DjNN+vWl8Q4ykWZ5aGftm9pZy3k+RRkGPyU5tNXyk2OG39HWgABX3Qm53j2r/HLzBQU4KEfS/LZyWkY3Di5LYS3DRSebJZdy7Y/4tqtQY5JaNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=niDUXSF0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="niDUXSF0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA551F000E9;
	Mon, 27 Jul 2026 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785161148;
	bh=SHR0wK14/4dXsi/tFV+pSIDb0Red1/aui8E/xX1Ll+o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=niDUXSF0pS2+Q4icyVkjQeECEicW20N7bbljqPs0J/bbAGPthPTJ2dA6qnJ95m/Sa
	 Fwd4YsH0S76pJamz/lR4a+Zb9//2kUtxWFddKMiTI4p/qDfwLaxbAtfu6XbHfSoCS8
	 KB82tQZH1C9GwxXRmDOG51clurtpzmGM+ZE7YUjuW7p8IpYymWRDFhKcdpAAlD8EFs
	 jLse1g8ot50w5BPFA6sP6J6oPjBeuoO4aUNfJ6CjRBEj7Dpe/Jd279IZYtOl/Wrqd/
	 lFsVL2RqzdcEPih3MoHTT7z95RM3C7a8sMn1xSHNG+5uO837+3WX6LpwG5dR7CtnA/
	 9aOll2xBMLnuA==
Message-ID: <de6f893a-4369-4ec4-b47d-517ce0c29558@kernel.org>
Date: Mon, 27 Jul 2026 16:05:41 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 12/12] selftests/mm: add a slow-GUP content and COW
 test for mTHP
To: Mike Rapoport <rppt@kernel.org>, Rik van Riel <riel@surriel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kernel-team@meta.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
References: <20260724222934.1463812-1-riel@surriel.com>
 <20260724222934.1463812-13-riel@surriel.com> <amX19fK0YVIEonfI@kernel.org>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <amX19fK0YVIEonfI@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/26/26 13:56, Mike Rapoport wrote:
> Hi Rik,
> 
> On Fri, Jul 24, 2026 at 06:29:34PM -0400, Rik van Riel wrote:
>> follow_page_mask() now batches a PTE-mapped large folio (mTHP) into one
>> contiguous run for the slow get_user_pages() path. A mis-batched run would
>> hand back the wrong pages or a stale COW copy, which the existing tests do
>> not catch: gup_test checks only pin/unpin integrity, and cow exercises COW
>> mostly at PMD size.
>>
>> Add mthp_gup_cow_test. It forces 64kB-only mTHP, writes a per-page-distinct
>> pattern, then pins the region on the slow path (PIN_LONGTERM without
>> USE_FAST) and compares the bytes the kernel copies back from the pinned
>> pages against that pattern.
>>
>> The test covers a read pin, a write pin, and COW after fork(): a child
>> write-pins to force per-page unshare and checks the copied contents, then
>> rewrites its copy while the parent verifies its own contents are intact.
>>
>> It also reports how many pages sit in contiguous large-folio runs, so a
>> kernel without mTHP shows light coverage rather than passing vacuously.
>>
>> Assisted-by: Claude:claude-opus-4.8
>> Signed-off-by: Rik van Riel <riel@surriel.com>
>> ---
>>  tools/testing/selftests/mm/Makefile           |   1 +
>>  .../testing/selftests/mm/mthp_gup_cow_test.c  | 213 ++++++++++++++++++
>>  tools/testing/selftests/mm/run_vmtests.sh     |   1 +
>>  3 files changed, 215 insertions(+)
>>  create mode 100644 tools/testing/selftests/mm/mthp_gup_cow_test.c
>>
>> +
>> +static long PS;
>> +static int fails;
>> +static int tap;
>> +
>> +static void ok(int cond, const char *desc)
>> +{
>> +	printf("%s %d %s\n", cond ? "ok" : "not ok", ++tap, desc);
> 
> Please (instruct claude to) use ksft_* helpers for printing messages and
> tracking failed and passed tests.

I'm afraid we won't have time to keep repeating the following:

Documentation/process/coding-assistants.rst

* Reviewing all AI-generated code
[...]
* Taking full responsibility for the contribution

-- 
Cheers,

David
