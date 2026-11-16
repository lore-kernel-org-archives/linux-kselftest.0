Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812513;
	b=xwyF+nouDc2jDwefnWrBVBwxosSC301boQod9qgTw+uAuN79UJTC5EUDLkNFh0VYNmdU
	 WMP4E685xQJGar0MUtkiqYpsSEO9ot1qgoq9iSNUREOhSRSBlbYnNU9cEPg3q8drTql78
	 IksM350o15czrC2DgZvHeZvP9hLOojakEm6XCUkfnFGmObhbiKVueCxVHsT4GjwZN6YM0
	 a3ZY8Q1o0WikXrtAfp6xYj1vMqHDHuIQYM+47bYkRecz2gwkrtMAreqZcbI4eqDhCT1oL
	 gTKLItGDTkheIL3MDdnSPkZEA/b7sz17v4gMA6j6uiydPItmWhGCyc2Uib7Rm9t7KVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812513;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=8oCH6XC+liX1SVUHDFPJw0slOUl6aJW30d6QU4zbVWw=;
	b=RMkuGrSkW0UR+uc3CbZeV6z1yXAxgMWcrfDsi5nwasntrZFkmYpzKG29aZxJnr2FBbC7
	 K/fm0hn1biB0EnZa/k7gSdW0jveAeD/yGeacEFrMTHobXW4K8AtWTWFIf28Q4lKbKsdeI
	 aedVI8QuyLpofXeNuay3frDpb6xHbzhaMCqwDQ+jjOKG/BO7cPwqwKGQkfh3HMRYVlDXB
	 N2Jw50xpmIab4gaW34MQn+0KtLcboYzfWYXVqKKAZlD1zyyT18e78fgUKhkzt/aPlexns
	 PRY/5qtzj67GNJ1kr3Q4C4QOX2B4MjMcYqMuUgjWfmiUuHFc20r59ccKBiLNkXmaLuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=nwJhAOGk;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9913606A31C;
	Mon, 16 Nov 2026 07:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9913606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=nwJhAOGk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=8oCH6XC+liX1SVUHDFPJw0slOUl6aJW30d6QU4zbVWw=;
	b=nwJhAOGkQsbbp7/qNOE8irIS9xvAcgD0oeiR0r0qtW+Jz6o/Eidr1QHeX8xT7v
	PylJqImPFnywn4PhjlDdsEQ9hjA9p6E7M3bQpmyZP9dsH2ufAXSyscPqGm36bVgc
	BOipbzNJZDuu+gmj4NspwUSGWU4qV7mPMEPMSjHjo7E0Q=
Message-ID: <206b5151-c527-4b7b-8694-dd9c6cfd916f@163.com>
Date: Mon, 16 Nov 2026 15:00:56 +0800
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
Subject: Re: [PATCH] selftests/mm: Handle implicit read permissions in
 madv_populate
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 chenxionggui@lanxincomputing.com
References: <20261112031811.56500-1-evers_chen@163.com>
 <64e1c24f-08fb-437e-80c1-e5b486d15200@kernel.org>
Content-Language: en-US
From: cxg <evers_chen@163.com>
In-Reply-To: <64e1c24f-08fb-437e-80c1-e5b486d15200@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wDnD70oqvpqdH8PHg--.13365S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw4rZr18CF15Kw4xtF15CFg_yoW8XF4rpF
	W8C3WYgF4Dtw17Aws2yr10qrs5Jry8Gayjqw1rXFyqywnIk3WftrW7KayYka4fJr4kWw42
	9a95WFyDAryqvFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UknY7UUUUU=
X-CM-SenderInfo: xhyh22pbfkv0i6rwjhhfrp/xtbC7AkOGGr6qilLogAA3J

Thanks for the suggestion.

Agreed. Since this behavior is specific to RISC-V, a simple 
architecture-specific check is sufficient.

I've simplified the patch to use |#ifdef __riscv|in |test_prot_write()|, 
removing the |/proc/self/maps|parsing and the additional PROT_NONE test.

The updated test passes all 16 tests on RISC-V with Linux 7.2.0.

Since the original patch is already in Andrew's mm tree, would you 
prefer a v2 or an incremental fix?

Thanks,
Xionggui


On 11/14/26 03:02, David Hildenbrand (Arm) wrote:
> On 11/12/26 04:18, Xionggui Chen wrote:
>> From: Xionggui Chen <chenxionggui@lanxincomputing.com>
>>
>> The madv_populate selftest assumes that a mapping created with
>> PROT_WRITE cannot be read, and expects MADV_POPULATE_READ to fail
>> with EINVAL.
>>
>> However, some architectures, including RISC-V, may implicitly grant
>> read permission to PROT_WRITE mappings. On such architectures,
>> MADV_POPULATE_READ succeeds, causing the test to fail incorrectly.
>>
>> Check the actual VMA permissions through /proc/self/maps and adjust
>> the expected result accordingly.
>>
>> Add a PROT_NONE test to verify that MADV_POPULATE_READ still fails
>> with EINVAL for mappings without read permission.
>>
>> On RISC-V with Linux 7.2.0, the original test fails 1 out of 16
>> tests, while the updated test passes all 17 tests.
> I would have said, if RISCV is the odd one, special case it and call it a day?
>
> That would keep the changes to test_prot_write() to a minimum.
>
>

