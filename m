Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39FF46AA8B;
	Tue, 15 Sep 2026 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461571; cv=none; b=Z6YFP0rTAlrlJA1aOUAm8fBKdpiVXRwwII3o+44Z9dZq1/RVK3FII3ECTVAFVyZr5ce269pEU9LplErsfWv6Rami0GmMhy5SNWFPYOjJu8Sjrqytfq5RU5ruNCU7uAtxxSkkGM0VrwdZtXQFz7uWkftQEfshe5boM96EOwwEckM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461571; c=relaxed/simple;
	bh=yHlIrOdPfLjj9Gu8t0QO/KBvaVLhX4WuZRnvoHBDFI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+0LSZVnLW9NUBY+6NRN/dy6wanm1b+tnd44qhKJRruqv22moim9CF36LHlDkyuMcXsh0Lpmw353ssewfpB315wwzgm9NrPJcmhHva/p92HXGXqOB1loHM8dqcpr9oFKO2znZBD+zUTA6ycap3LE6yNHI4XYCS5FBUWnln5nXuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZQ+8sTEO; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZQ+8sTEO"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 963E0169C;
	Tue, 15 Sep 2026 01:39:24 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1D203F7B4;
	Tue, 15 Sep 2026 01:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789461568; bh=yHlIrOdPfLjj9Gu8t0QO/KBvaVLhX4WuZRnvoHBDFI8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZQ+8sTEOSXh+kPQv2ubox6sTg5+iNgLqJuOkCnT+cygDDQ9XBo7U6XJaXymP1pGJ+
	 Y0DmwYp1Zo0S2RIxo6AMwXMKi0Cw0M1zWx99eH1J1EXwt/XnrQjnJAF3bhvS8fMaz7
	 9qNmLrgH0LmpVPxUIkfIWBGKVDlRCIz9VcfSw9kU=
Message-ID: <e6caa3e6-084c-442b-8d0e-e851ba75914c@arm.com>
Date: Tue, 15 Sep 2026 14:09:18 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/6] selftests/mm: add a GUP selftest
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
 linux-kernel@vger.kernel.org, Rik van Riel <riel@surriel.com>
References: <20260911110950.200240-1-sarthak.sharma@arm.com>
 <20260911110950.200240-7-sarthak.sharma@arm.com>
 <891915e3-3333-45f3-81a8-1ad38fa7ee37@kernel.org>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <891915e3-3333-45f3-81a8-1ad38fa7ee37@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/11/26 9:18 PM, David Hildenbrand (Arm) wrote:

[...]

>> +
>> +/* Just the flags we need, copied from the kernel internals. */
>> +#define FOLL_WRITE	0x01	/* check pte is writable */
> 
> BTW, it's odd that we support passing GUP-flags ... we should probably switch at
> some point simpler attributes (bool write) or custom flags (but we don't seem to
> need many ...).

Agreed

> 
>> +
>> +/* Page counts exercising single, THP-batch, partial, and full-mapping GUP. */
>> +static const int nr_pages_list[] = { 1, 512, 123, -1 };
> 
> 
> Would we want to calculate 512 dynamically at runtime using the PMD pagesize?
> Could be something for a follow-up patch.

Yeah this can be done.

> 
>> +
>> +#define GUP_TEST_FILE "/sys/kernel/debug/gup_test"
>> +#define NR_HUGE_PAGES 2
> 
> I'd call this "NR_HUGETLB_PAGES".

Okay.

[...]

>> +static void run_gup_cmd(struct __test_metadata *_metadata,
>> +			 FIXTURE_DATA(gup_test) *self,
>> +			 const FIXTURE_VARIANT(gup_test) *variant,
>> +			 unsigned long command)
> 
> We prefer two tab indents.

Okay.

> 
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < (int)ARRAY_SIZE(nr_pages_list); i++) {
>> +		struct gup_test gup = {
>> +			.addr = (unsigned long)self->addr,
>> +			.size = self->size,
>> +			.nr_pages_per_call = nr_pages_list[i] < 0 ?
>> +				self->size / psize() : nr_pages_list[i],
>> +			.gup_flags = variant->write ? FOLL_WRITE : 0,
>> +		};
>> +
>> +		TH_LOG("nr_pages_per_call=%u", gup.nr_pages_per_call);
>> +		ASSERT_EQ(ioctl(self->gup_fd, command, &gup), 0);
>> +		ASSERT_EQ(gup.size, self->size);
>> +	}
>> +}
>> +
>> +TEST_F(gup_test, get_user_pages)
>> +{
>> +	run_gup_cmd(_metadata, self, variant, GUP_BASIC_TEST);
>> +}
>> +
>> +TEST_F(gup_test, pin_user_pages)
>> +{
>> +	run_gup_cmd(_metadata, self, variant, PIN_BASIC_TEST);
>> +}
>> +
>> +TEST_F(gup_test, get_user_pages_fast)
>> +{
>> +	run_gup_cmd(_metadata, self, variant, GUP_FAST_BENCHMARK);
>> +}
>> +
>> +TEST_F(gup_test, pin_user_pages_fast)
>> +{
>> +	run_gup_cmd(_metadata, self, variant, PIN_FAST_BENCHMARK);
>> +}
>> +
>> +TEST_F(gup_test, pin_user_pages_longterm)
>> +{
>> +	run_gup_cmd(_metadata, self, variant, PIN_LONGTERM_BENCHMARK);
>> +}
> 
> Heh, is there actually a reason why these kernel things are called _BENCHMARK?
> 
> I think they are really just tests that can be used for benchmarking ... the
> measurement logic is entirely in user space.
> 
> We could consider cleaning that up as a follow-up.

Yeah this can be worked on as well.

> 
>> +
>> +int main(int argc, char **argv)
>> +{
>> +	int fd;
>> +
>> +	fd = open(GUP_TEST_FILE, O_RDWR);
> 
> Could do
> 
> const int fd = open(GUP_TEST_FILE, O_RDWR);

Okay.

> 
> 
> Thanks for doing that!
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thank you David!

> 
> 
> I think reasonable extensions will be to execute tests on all available mTHP
> sizes and all available hugetlb sizes, similar to what cow.c already does.
> 
> Can you look into that as part of some follow-up work? mTHP support will be
> interesting for testing some of the patches Rik has been working on.

Yup, I'll take that up.

Apart from the indentation, const int fd and the NR_HUGE_PAGES rename,
is there anything else I should incorporate in a respin? I think other
changes would require a separate series. If you want me to fold any
other change in a respin, please let me know.

