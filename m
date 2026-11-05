Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893883;
	b=FiP/y4cIFYyOOkYUk+hA59yu9MzEwc68VUTXzT7hMaNITgvhPALg6Sx1P1yejcJLjvYo
	 aaIgkz57npOWmQPIV4xLT7cldIAOr9R4SG6IRFMDJ2V3GdrQhwPHiU6dlg4fJRbzCpdcN
	 L7SG5BRVcuxdsrmZNY0qI6DOiDYF5kBOFyX7nKaqujt+cxzsy0M1YlC2Yf4YbA1ulX0to
	 i8E7UGyLhHN2yht1TOwSr6yVAdDeKIKow920VQc79HODZoHyaLeYo0ArWNtqDF0596S4Y
	 8ZPJ9iB8bieRn1fhcm26tHec81RRo5bV+Tc6v/wGaKAXvGA0LW+K123qxmDsD1phm8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893883;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=vcoQZXzUSKAjGDFyua49S/KsemIMXjn1uFYHAPFPdCI=;
	b=FmeCHjN9bTdKL7PdR2nknuhKF0mSDTV/cwV3HTj9oIokprIQZm/lmUKo2MKCNGU4Nbna
	 r9lPQuIHQIY5j5IEv7Yx95g30OJ0aVqo7VYkcxdjp2rCXeQkLfYxQbvYHURVd8+ggKKdL
	 E8BS8NxW30SL8XnZb14OUQy1AGwxd2g35mduFKeArBtZ321y0MJzN9aGxWK9yCedVPdjF
	 g8MRwrpKEwNKpMrQJ5/L0anESP4tHCVVGnkejpklnMeKAUYW1icZ7kDG7dQ2fnqEjc7aJ
	 ZHafuREp1PaH8mdg7aMENvp2OuN3/rR9RF1px+3QMJ4xyNYEPnsu9fN9bO5WmbOtmng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eh4uz2E8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC504606A330;
	Thu,  5 Nov 2026 15:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eh4uz2E8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0F11F0093A;
	Thu,  5 Nov 2026 15:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793893882;
	bh=vcoQZXzUSKAjGDFyua49S/KsemIMXjn1uFYHAPFPdCI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=eh4uz2E8DxtizBT/qw3y4t094WXgVTrlelAfeVdHut710Alzy8V538PI4x5YiPXtx
	 dUZN/TLFUPezR/ZFZdb8a2vqFcYiL+xJSsb5A/WXzlmAW6IW/6W33uWRMz72HjFxBN
	 UuvaPkB475995+O8hLONeDFXuN1nPYMooDLgiPBV+tdTqyS2Bp/Ms2HEwag44Xy/ak
	 E6rLjZoD9W40NZ/US2DZe2ptZO2+8eIQVgeETJrjQkLVMgd54Nx2NeTYDtghhq1i9P
	 P505FsGRfhntdBL8X4cU+bTOsiZx9vW4qVZJoiM2on8vYmFykyrh6gy2Yakd1tVc4e
	 qZ442+tMryYTg==
Message-ID: <e135e15d-6a93-4856-a7ac-30977a2a2b5d@kernel.org>
Date: Thu, 5 Nov 2026 16:51:14 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: skip split_huge_page_test without the
 split_huge_pages file
To: Zi Yan <ziy@nvidia.com>, Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Lorenzo Stoakes
 <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261105030242.1241448-1-sashal@kernel.org>
 <4B926B36-D797-4861-B6D6-27E8D7870287@nvidia.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <4B926B36-D797-4861-B6D6-27E8D7870287@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 16:19, Zi Yan wrote:
> On 4 Nov 2026, at 22:02, Sasha Levin wrote:
> 
>> Every case in split_huge_page_test goes through
>> /sys/kernel/debug/split_huge_pages. When that file does not exist,
>> because debugfs is not mounted or the kernel has no CONFIG_DEBUG_FS, the
>> first write bails out of the whole test and it is reported as a failure:
>>
>>   Bail out! write_file(/sys/kernel/debug/split_huge_pages): No such file or directory
>>
>> Skip the test in that case.
>>
>> Fixes: fa6c02315f74 ("mm: huge_memory: a new debugfs interface for splitting THP tests")
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>> Found with KernelCI's NVIDIA lab, which runs the tests in a chroot
>> without debugfs. Tested on an AMD EPYC 9655P with KernelCI's x86_64
>> build of next-20261104: without debugfs the test now skips, and with
>> debugfs mounted it still passes all 62 cases.
>>
>>  tools/testing/selftests/mm/split_huge_page_test.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
> 
> Thanks. But I do think we need a way of specifying the necessary
> Kconfig options for selftests. Oh, we do have one:
> https://elixir.bootlin.com/linux/v7.3.1/source/tools/testing/selftests/mm/config. Can you add CONFIG_DEBUG_FS=y to it while at it?

Just what I was thinking.

-- 
Cheers,

David
