Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11291258EF3;
	Tue,  8 Sep 2026 05:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846993; cv=none; b=fOHzLEhWKPT5HgOzypPK+hoSt4Jw67KK95uuitMfC6tuelOlXxWiMwtKZpUL1Wg0Cqjk0QW5xHhn0wUVr0fE6Mi0ZkNbKReHOfA0ilA6RLGuA9nFH8iquYvH/mPqq3T99ino1+EKCQhYtvVrQ9ym32OERkszVQ+zt2x2/muGAzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846993; c=relaxed/simple;
	bh=sOMZfPSSdTLgfz3hBoUNe6ytFxzY7bCG8cECAo6gYNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J5xEQJuMbwame+EhttLpkKtT1eBoLAgJ/+ve+jMj8wQ+xDWKGqA4PHUEo8FS/E8x4/xo0VudqVgXX03QqnaRleMPjLjhuUcysUEKv7ETBBNgubTj177OHJcRql8AuKBd1iKM0i5x5ghDmQMUtYOENOV3eZU/QZZlQVQFxV3Wzdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LQfxyU3G; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LQfxyU3G"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3797C1476;
	Mon,  7 Sep 2026 22:56:26 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5CA43F86C;
	Mon,  7 Sep 2026 22:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788846989; bh=sOMZfPSSdTLgfz3hBoUNe6ytFxzY7bCG8cECAo6gYNw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LQfxyU3GO+oro+24KrwqJMvyeWaO8TlfaE7lFJ2A4gY5+v1rxELR+J40yu2uH8l9o
	 /0Zco3/HVf9IsN0KEncrt8Zd8afwYgrX/5YPDmALdrC8oKYnPczHvzVlC1Y73PNHHe
	 pr7B26aAMm/GeInAJJemqJ96LuoWLYgHy7cBfX0c=
Message-ID: <5e0b9365-cbac-4f2d-b915-85edf3093508@arm.com>
Date: Tue, 8 Sep 2026 11:26:19 +0530
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
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <b0400430-c3b6-40d5-b476-49189b1cc292@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi David!

On 9/7/26 8:45 PM, David Hildenbrand (Arm) wrote:
> On 9/4/26 14:36, Sarthak Sharma wrote:
>> Add a new GUP selftest which uses kselftest_harness.h. Cover
>> 12 mapping configurations: THP enabled, THP disabled and
>> HugeTLB, each across private/shared mappings and with/without
>> FOLL_WRITE. Run 5 test cases for every variant: get_user_pages,
>> get_user_pages_fast, pin_user_pages, pin_user_pages_fast and
>> pin_user_pages_longterm.
>>
>> Choose the number of default hugeTLB pages using a 256 MiB target,
>> with a minimum of 1 page and derive the mapping size from that
>> number. This avoids reserving excess memory when the hugeTLB page
>> size is too large and retains 128 pages for the most common case
>> of 2MiB hugeTLB pages.
>>
>> Sweep four nr_pages_per_call values for each test: 1, 512, 123 and
>> all pages. This preserves the coverage previously provided by
>> run_gup_matrix(): 12 mapping combinations x 5 GUP/PUP operations x 4
>> batch sizes. In total the selftest reports 60 TAP cases and issues
>> 240 ioctls.

[...]

> 
> 
> BTW, I was wondering what it would take to:
> 
> 1) Turn mm/gup_test.o into an OOT module (would we need more EXPORT_SYMBOL_GPL?
> EXPORT_SYMBOL_FOOR_MODULE ?)
> 
> 2) Move it to tools/mm/modules or sth like that.
> 
> 3) Build it with the selftests etc
> 
> 4) Remove GUP_TEST
> 
> 5) Try insmod'ing it from the tools+selftests that need it.

This is an interesting change. We can keep this open for discussion
here. If required, I can work on this in the future.

> 
> [...]
> 
>> +int main(int argc, char **argv)
>> +{
>> +	char *file = "/dev/zero";
>> +	int fd;
>> +
>> +	fd = open(file, O_RDWR);
>> +	if (fd < 0) {
>> +		ksft_print_header();
>> +		ksft_exit_fail_msg("Unable to open %s: %s\n", file, strerror(errno));
>> +	}
>> +	close(fd);
> 
> 
> I'm confused. Why do we have to open+close /dev/zero?

This is a pre requisite check. Every test opens and closes /dev/zero and
/sys/kernel/debug/gup_test of its own. So I wanted to check before
running the harness if these two are available, so that we don't have
setup failures for 60 test cases.

> 
>> +
>> +	fd = open(GUP_TEST_FILE, O_RDWR);
>> +	if (fd == -1) {
>> +		ksft_print_header();
>> +		if (errno == EACCES)
>> +			ksft_exit_skip("Please run this test as root\n");
> 
> Wouldn't we want to fail here?

mm selftests normally skip if the test is not run as root. So I tried
keeping the same thing here. Do you think I should change it to fail?

> 
>> +		if (errno == ENOENT) {
>> +			DIR *debugfs = opendir("/sys/kernel/debug");
>> +
>> +			if (!debugfs) {
>> +				ksft_exit_skip("Mount debugfs at /sys/kernel/debug\n");
>> +			} else {
>> +				closedir(debugfs);
>> +				ksft_exit_skip("Check CONFIG_GUP_TEST in kernel config\n");
>> +			}
> 
> You can remove the } else { part as you skip on !debugfs.

Agreed

> 
>> +		}
>> +		ksft_exit_fail_msg("Failed to open %s: %s\n", GUP_TEST_FILE, strerror(errno));
>> +	}
>> +	close(fd);
>> +
>> +	hp_size = default_huge_page_size();
>> +	if (hp_size) {
>> +		nr_huge_pages = HUGETLB_TARGET_SIZE / hp_size;
>> +		if (!nr_huge_pages)
>> +			nr_huge_pages = 1;
>> +
>> +		hugetlb_setup_succeeded = hugetlb_setup_default(nr_huge_pages);
>> +	}
> 
> BTW, why are we using HUGETLB_TARGET_SIZE instead of just using the
> default_huge_page_size()?

HUGETLB_TARGET_SIZE is the target mapping size and
default_huge_page_size() gives the size of a single hugetlb page.

Using default_huge_page_size() would reduce coverage for 2MB hugetlb
pages. The old test set self->size to be 256 MB for the hugetlb case.

Now it was discussed in a previous version of this patchset that we can
derive the self->size for hugetlb case by fixing the nr_hugepages and
multiplying by hugetlb size, and thought 128 would be a good number for
nr_hugepages [1].

But in case the hugetlb pages are very large, eg we can have 1 GB
hugepages as well, reserving 128 GB is not a good idea. So I tried to
keep the target size of the mapping as 256 MB, as it was before in the
old gup test. If the hugetlb pages are larger than this, we'll reserve
only one of them. Else, we'll reserve (256 MB /
default_huge_page_size()) hugetlb pages, which comes out to be 128 for
the case of 2MB hugetlb pages.

[1] https://lore.kernel.org/all/anGyXt_PDImUglIN@kernel.org/

> 
>> +
>> +	return test_harness_run(argc, argv);
>> +}
>> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
>> index 8f1e828e4f39..ae0ab5efabae 100755
>> --- a/tools/testing/selftests/mm/run_vmtests.sh
>> +++ b/tools/testing/selftests/mm/run_vmtests.sh
>> @@ -251,6 +251,7 @@ fi
>>  
>>  CATEGORY="mmap" run_test ./map_fixed_noreplace
>>  
>> +CATEGORY="gup_test" run_test ./gup
>>  CATEGORY="gup_test" run_test ./gup_longterm
> 
> Nice

:)

> 

