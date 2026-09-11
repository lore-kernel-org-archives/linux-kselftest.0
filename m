Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBEB38425B;
	Fri, 11 Sep 2026 04:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789101153; cv=none; b=c69XcI3bQVnoZnDVDPVJsnD89hcw29AvXBNl5wqhfH2Wnz4DZY01NOntrkobWu3CquUsAu1+mtXnnVp372EZgTNFcVxkyURcih4YP2OgGI5rAYXi6pdB3enQSG08JMmb1qxhiheLE6IsWvsG1QmQvagcC7mVsCt0T1YQk0g0FWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789101153; c=relaxed/simple;
	bh=6nIY7vDGZl1HSYvtDHEzSpFXJFmf/2f+RPP48FA6xjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u+pcNdHtjvMj7EKDD/ds/hOfvh8jn+ClFDtNiZGQFVk8Uobv2Xl9lYFt19X9L2VeumdCGsCkx1q5nD5Y4IuWB6NtcyTEjhfr9Uq1ZUz9WFCYIw/aV+FCc4F/0fe7+QPS9R/1AGFssBDo8xQuGAY/cJ4QHECiDONIGveb6HB4Brc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Xmrwydqh; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Xmrwydqh"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75BDC1BCA;
	Thu, 10 Sep 2026 21:32:25 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2D773F7B4;
	Thu, 10 Sep 2026 21:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789101149; bh=6nIY7vDGZl1HSYvtDHEzSpFXJFmf/2f+RPP48FA6xjQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XmrwydqhBZ/vf1ECBYZqTArXWHBOiLel894SB9CwN4Xy7DofCaJ+zOog4ySBEP7Hz
	 4KhKGUpFRrxfJZ2ULqbeOunH7b0q2UHOnOjSo+TkHoCHono2PP0xtQpCYja39Rnbls
	 4gcwvzdWSOE2J6vNY9m5bsFQyw5Lpa2MPLdctktg=
Message-ID: <f7416ebc-f897-4c9b-8266-6aa7c9fd5473@arm.com>
Date: Fri, 11 Sep 2026 10:02:19 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] selftests/mm: add a GUP selftest
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
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
References: <20260904123631.198697-1-sarthak.sharma@arm.com>
 <20260904123631.198697-7-sarthak.sharma@arm.com>
 <b0400430-c3b6-40d5-b476-49189b1cc292@kernel.org>
 <5e0b9365-cbac-4f2d-b915-85edf3093508@arm.com>
 <fadb8870-37f8-46f4-aefb-c21bc3a31e5b@kernel.org>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <fadb8870-37f8-46f4-aefb-c21bc3a31e5b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi David!

On 9/9/26 10:33 PM, David Hildenbrand (Arm) wrote:
>>> BTW, I was wondering what it would take to:
>>>
>>> 1) Turn mm/gup_test.o into an OOT module (would we need more EXPORT_SYMBOL_GPL?
>>> EXPORT_SYMBOL_FOOR_MODULE ?)
>>>
>>> 2) Move it to tools/mm/modules or sth like that.
>>>
>>> 3) Build it with the selftests etc
>>>
>>> 4) Remove GUP_TEST
>>>
>>> 5) Try insmod'ing it from the tools+selftests that need it.
>>
>> This is an interesting change. We can keep this open for discussion
>> here. If required, I can work on this in the future.
> 
> Yes, we should in general try moving all test modules out of the core.
> 
>>>
>>>> +int main(int argc, char **argv)
>>>> +{
>>>> +	char *file = "/dev/zero";
>>>> +	int fd;
>>>> +
>>>> +	fd = open(file, O_RDWR);
>>>> +	if (fd < 0) {
>>>> +		ksft_print_header();
>>>> +		ksft_exit_fail_msg("Unable to open %s: %s\n", file, strerror(errno));
>>>> +	}
>>>> +	close(fd);
>>>
>>>
>>> I'm confused. Why do we have to open+close /dev/zero?
>>
>> This is a pre requisite check. Every test opens and closes /dev/zero and
>> /sys/kernel/debug/gup_test of its own. So I wanted to check before
>> running the harness if these two are available, so that we don't have
>> setup failures for 60 test cases.
> 
> But why /dev/zero? We should understand why that would possibly be required.

This was carried over from the old test, where /dev/zero was the default
backing for mmap unless the user selected another file to back the
mapping. Now since we don't support file backed mappings, we can
directly use MAP_ANONYMOUS here. Thanks for pointing it out, I'll remove
it from this patch.

> 
>>
>>>
>>>> +
>>>> +	fd = open(GUP_TEST_FILE, O_RDWR);
>>>> +	if (fd == -1) {
>>>> +		ksft_print_header();
>>>> +		if (errno == EACCES)
>>>> +			ksft_exit_skip("Please run this test as root\n");
>>>
>>> Wouldn't we want to fail here?
>>
>> mm selftests normally skip if the test is not run as root. So I tried
>> keeping the same thing here. Do you think I should change it to fail?
> 
> If other tests do that, it's fine!
> 
> [...]
> 
>>>
>>> BTW, why are we using HUGETLB_TARGET_SIZE instead of just using the
>>> default_huge_page_size()?
>>
>> HUGETLB_TARGET_SIZE is the target mapping size and
>> default_huge_page_size() gives the size of a single hugetlb page.
>>
>> Using default_huge_page_size() would reduce coverage for 2MB hugetlb
>> pages. The old test set self->size to be 256 MB for the hugetlb case.
>>
>> Now it was discussed in a previous version of this patchset that we can
>> derive the self->size for hugetlb case by fixing the nr_hugepages and
>> multiplying by hugetlb size, and thought 128 would be a good number for
>> nr_hugepages [1].
>>
>> But in case the hugetlb pages are very large, eg we can have 1 GB
>> hugepages as well, reserving 128 GB is not a good idea. So I tried to
>> keep the target size of the mapping as 256 MB, as it was before in the
>> old gup test. If the hugetlb pages are larger than this, we'll reserve
>> only one of them. Else, we'll reserve (256 MB /
>> default_huge_page_size()) hugetlb pages, which comes out to be 128 for
>> the case of 2MB hugetlb pages.
> It's odd that 2M gets better test coverage than 512M or 1G.
> 
> Is there really a lot of value in testing 128 2M pages? Would, like, 2 already
> be good enough?

Yup, seems like keeping 128 pages is not adding an extra value. I'll go
with 2 hugetlb pages to test both pinning within a hugetlb page and
across the hugetlb boundary. This would make things a lot simpler.
