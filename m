Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02085342532;
	Wed,  9 Sep 2026 17:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788973452; cv=none; b=K58Pr1cINaZXd58JOTk1fCi92ViHlF3wsxvBGLIlzuONUCxyzE/qimqTE6kN3UVIN2bEh8xVOKnLqCeHb9FV7Zx9j3FF/gMF55WSMTVnbNoidncQGqutKhCAI1QxqI1BH7PDqdeexYHgT9mC2OoX/FsjSRLK/xIozPAsyYJJF9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788973452; c=relaxed/simple;
	bh=sYs5R4esHfmf3aJFLvXHPWoWV+N0/r4PHIMTmyfZ38Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZJyybkEC1bVyQvGACmup2kD1Z0hiG4+/ImkkHQU8LQOMyqPOm7ImCVQPAHTqBLRpOe11Qfr+tuqMFWMg7j6CsBe4y9mgYX0qSc23L0sD2OC/9PxkY1vjkulh1fP30W+GS5MX4vCrp6V85H3RTa3Tg1CJoHMSd3Zy2iXbPsiiC/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KL7POgn6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KL7POgn6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA921F000FF;
	Wed,  9 Sep 2026 17:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788973450;
	bh=lkwv44ETJQmXMk/e//8L25kcENQTJgfQl/TVfQuISwc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KL7POgn61am+C0j55B/xe9I829GKFJnbqWM4Sc/9uo0gsewY7R4uvjHdTY0G8JyPr
	 6s4jQGnZWL5sM9uC2hCRrnpFWpXaFpxgmfIpQLQj0r7sxzWAzGJa3hJdqToLmJ0u7n
	 tRy8znb7vuPr1VTD6e+80AZIlRogFWzwb4pLcfqNoIzli/IEbE/4JkxtDsTf9KkcWh
	 W/omgFBeAIX95D1F4PMYJq/8fyPFdUMvwRXjemECj2YM927HdL21W5BCrdwt0/JajC
	 sYugAQRUycBh3DyaZ8TBz3341pDD48IrCkDOeQ4fRcRr3xh0APtnsMjoI9ZyAHdHS7
	 wWwZtLa2i6Xqg==
Message-ID: <fadb8870-37f8-46f4-aefb-c21bc3a31e5b@kernel.org>
Date: Wed, 9 Sep 2026 19:03:59 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] selftests/mm: add a GUP selftest
To: Sarthak Sharma <sarthak.sharma@arm.com>,
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
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <5e0b9365-cbac-4f2d-b915-85edf3093508@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>> BTW, I was wondering what it would take to:
>>
>> 1) Turn mm/gup_test.o into an OOT module (would we need more EXPORT_SYMBOL_GPL?
>> EXPORT_SYMBOL_FOOR_MODULE ?)
>>
>> 2) Move it to tools/mm/modules or sth like that.
>>
>> 3) Build it with the selftests etc
>>
>> 4) Remove GUP_TEST
>>
>> 5) Try insmod'ing it from the tools+selftests that need it.
> 
> This is an interesting change. We can keep this open for discussion
> here. If required, I can work on this in the future.

Yes, we should in general try moving all test modules out of the core.

>>
>>> +int main(int argc, char **argv)
>>> +{
>>> +	char *file = "/dev/zero";
>>> +	int fd;
>>> +
>>> +	fd = open(file, O_RDWR);
>>> +	if (fd < 0) {
>>> +		ksft_print_header();
>>> +		ksft_exit_fail_msg("Unable to open %s: %s\n", file, strerror(errno));
>>> +	}
>>> +	close(fd);
>>
>>
>> I'm confused. Why do we have to open+close /dev/zero?
> 
> This is a pre requisite check. Every test opens and closes /dev/zero and
> /sys/kernel/debug/gup_test of its own. So I wanted to check before
> running the harness if these two are available, so that we don't have
> setup failures for 60 test cases.

But why /dev/zero? We should understand why that would possibly be required.

> 
>>
>>> +
>>> +	fd = open(GUP_TEST_FILE, O_RDWR);
>>> +	if (fd == -1) {
>>> +		ksft_print_header();
>>> +		if (errno == EACCES)
>>> +			ksft_exit_skip("Please run this test as root\n");
>>
>> Wouldn't we want to fail here?
> 
> mm selftests normally skip if the test is not run as root. So I tried
> keeping the same thing here. Do you think I should change it to fail?

If other tests do that, it's fine!

[...]

>>
>> BTW, why are we using HUGETLB_TARGET_SIZE instead of just using the
>> default_huge_page_size()?
> 
> HUGETLB_TARGET_SIZE is the target mapping size and
> default_huge_page_size() gives the size of a single hugetlb page.
> 
> Using default_huge_page_size() would reduce coverage for 2MB hugetlb
> pages. The old test set self->size to be 256 MB for the hugetlb case.
> 
> Now it was discussed in a previous version of this patchset that we can
> derive the self->size for hugetlb case by fixing the nr_hugepages and
> multiplying by hugetlb size, and thought 128 would be a good number for
> nr_hugepages [1].
> 
> But in case the hugetlb pages are very large, eg we can have 1 GB
> hugepages as well, reserving 128 GB is not a good idea. So I tried to
> keep the target size of the mapping as 256 MB, as it was before in the
> old gup test. If the hugetlb pages are larger than this, we'll reserve
> only one of them. Else, we'll reserve (256 MB /
> default_huge_page_size()) hugetlb pages, which comes out to be 128 for
> the case of 2MB hugetlb pages.
It's odd that 2M gets better test coverage than 512M or 1G.

Is there really a lot of value in testing 128 2M pages? Would, like, 2 already
be good enough?

-- 
Cheers,

David
