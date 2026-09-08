Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D5A501F36;
	Tue,  8 Sep 2026 10:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862558; cv=none; b=ehbDs/vsnjiEt1AOIMFdUlaZhCqtnpYN0oWhUtmnuAhjrMSvOeA4523v896ODW6xfzF3XdQ+BlaBRdbSI9jWzjXi7/LPnkAlCPjFwx/k8qLQVZixkCuPVeeJj2g2x7j0Lrlz1B21Ztw1W5GxO8yBoMXtXxMs36yw6X9RppF4QKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862558; c=relaxed/simple;
	bh=KBdy1R4tq5Vf6wdLqlx52WKKhoV0g8IVACV6XjTV20U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=efaya6p1DZI8dHdqehCe2KrQX+V2EGNgijD1cH+y395mkdRXm+8I+cUlpVgL0iHGJyXTb72NWFs/vFq5jeh+RLPXWcXMzb6ARkZMPnFMMdeDSB4zxz7mUCMVWddPd7501TdBWiqme1ItlJJqmpXHX9kbS1KsazymqGjyUZNHsaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPlt8z7j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPlt8z7j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCED91F00A3A;
	Tue,  8 Sep 2026 10:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788862556;
	bh=ekjkNjyquBfVj0KUaXkP0qTUEnu6sauJ66A70KU2iAM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kPlt8z7jZmNtunlUzwNDs8G6avxVAMsAD5cPfdkaobbL7+WfVWyPofROj6KBDOnvS
	 32cslRcICIzEoo24KXgU2CT3g+SyznrFPBm7ratNwixpf4yLwLE7TgYJxyGEEUte+4
	 NOmK6Z4vDQxg64SpI9oIe6qTREXaEwLSaB2bJKk86vXY83KmzFPJGQqN8Ae15zjOgz
	 ql1QOtj43iaqQqaLLsjESsy9iEWnOuMQo716zHsbRulSrtKNsSf+D3qpGq+cJQADHY
	 fRsvFByfuaepL5ab9jTt/exrvglxG2dO/N5OM9EdTFs9GvfPEAkRYspWPVH3Nrt7ZR
	 ca5x/QANDt6ew==
Message-ID: <adaade14-6ce5-4a7a-9510-8ff99ee66eca@kernel.org>
Date: Tue, 8 Sep 2026 12:15:50 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] selftests/mm: Validate selections and scope
 memfd_secret setup
To: Tianyi Chen <hi@tychen.cc>, Andrew Morton <akpm@linux-foundation.org>
Cc: shuah@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, jsavitz@redhat.com
References: <20260906135444.749144-1-hi@tychen.cc>
 <178886112560.138404.1278745290043112298.mm-cli-v2-0@tychen.cc>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzS5EYXZpZCBIaWxk
 ZW5icmFuZCAoQ3VycmVudCkgPGRhdmlkQGtlcm5lbC5vcmc+wsGQBBMBCAA6AhsDBQkmWAik
 AgsJBBUKCQgCFgICHgUCF4AWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaYJt/AIZAQAKCRBN
 3hD3AP+DWriiD/9BLGEKG+N8L2AXhikJg6YmXom9ytRwPqDgpHpVg2xdhopoWdMRXjzOrIKD
 g4LSnFaKneQD0hZhoArEeamG5tyo32xoRsPwkbpIzL0OKSZ8G6mVbFGpjmyDLQCAxteXCLXz
 ZI0VbsuJKelYnKcXWOIndOrNRvE5eoOfTt2XfBnAapxMYY2IsV+qaUXlO63GgfIOg8RBaj7x
 3NxkI3rV0SHhI4GU9K6jCvGghxeS1QX6L/XI9mfAYaIwGy5B68kF26piAVYv/QZDEVIpo3t7
 /fjSpxKT8plJH6rhhR0epy8dWRHk3qT5tk2P85twasdloWtkMZ7FsCJRKWscm1BLpsDn6EQ4
 jeMHECiY9kGKKi8dQpv3FRyo2QApZ49NNDbwcR0ZndK0XFo15iH708H5Qja/8TuXCwnPWAcJ
 DQoNIDFyaxe26Rx3ZwUkRALa3iPcVjE0//TrQ4KnFf+lMBSrS33xDDBfevW9+Dk6IISmDH1R
 HFq2jpkN+FX/PE8eVhV68B2DsAPZ5rUwyCKUXPTJ/irrCCmAAb5Jpv11S7hUSpqtM/6oVESC
 3z/7CzrVtRODzLtNgV4r5EI+wAv/3PgJLlMwgJM90Fb3CB2IgbxhjvmB1WNdvXACVydx55V7
 LPPKodSTF29rlnQAf9HLgCphuuSrrPn5VQDaYZl4N/7zc2wcWM7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <178886112560.138404.1278745290043112298.mm-cli-v2-0@tychen.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/8/26 11:55, Tianyi Chen wrote:
> run_vmtests.sh can reach test setup after an invalid category selection,
> and its memfd_secret preparation can change ptrace_scope even when that
> category was not selected. These two patches address David's follow-up
> questions on the earlier getopts fix.
> 
> Patch 1 extends the getopts error handling to reject empty, whitespace-only
> and unknown category selections before setup. It uses the existing category
> list in usage() and normalizes separators, while preserving the default
> when -t is omitted and the existing environment-selection behavior.
> 
> Patch 2 gates memfd_secret preparation on category selection and executable
> presence. It retains the existing behavior when memfd_secret is selected;
> it does not add configuration restoration or otherwise change that test.
> 
> Changes in v2:
> - Rebase onto current mm-unstable.
> - Extend the original option-error patch with category validation.
> - Add a separate patch for the memfd_secret setup side effect.
> 
> Focused validation:
> - Bash syntax and strict checkpatch passed. All 30 documented categories
>   match the categories used by the script.
> - Parser checks cover omitted/default selections, empty environment values,
>   explicit empty -t, invalid options/categories, whitespace-separated lists
>   and command-line overrides of environment selections.
> - Twelve invalid-input cases and help were run through the full script in
>   a KVM guest. Invalid inputs exited with status 1 before test setup.
> - The real mmap category's three programs and memfd_secret passed in an
>   x86-64 KVM guest running Linux 7.3.0-rc1, including multi-category and
>   environment-selected runs.
> - The guest kernel lacks Yama. A disposable file bind-mounted at the actual
>   ptrace_scope path verified the shell's write condition: the old script
>   writes for an unrelated selection, the new script does not, and selected
>   executable memfd_secret retains the write. This checks script gating,
>   not Yama policy enforcement. Missing-executable behavior was also checked.
> 
> This was focused validation, not a run of the complete MM selftest suite.
> 
> Previous submission:
> https://lore.kernel.org/r/20260906135444.749144-1-hi@tychen.cc
> Review:
> https://lore.kernel.org/r/519ef70a-679c-455f-ba5f-3841730873a4@kernel.org
> 
> 
> Tianyi Chen (2):

For the future, don't send new versions in reply to old versions of a patch set.

-- 
Cheers,

David
