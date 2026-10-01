Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D4C492E3A;
	Thu,  1 Oct 2026 11:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855698; cv=none; b=jLWc2B4SvYuxIRon+ivUTpicKaViHiQCUt4ln9cpwynJVvVcY6T+HXlu9hC+eJGpARdoLpja+DEoTbrdJ1axeXFrL5eLrhnDGKyVMcBbsOjkjuOHlecrYEEUYl8Hi1y2Qb19iwDeWmBMT8/vIFqzcNkeBu/z/UjIK85LFkKTn1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855698; c=relaxed/simple;
	bh=rzmufa4Kqn6bEBtHIpnt4ZYcOfZ5AY6DtrGgvHe45ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D6KSw73Y8qIFvFBOSeTta+AUHVPWtVVv+5P3z8G9tSNf7Znc3DcZJWnbN/4yl62Do4dNDz8aJLk0Q3UAHigz6l9GgpJhCU+i/Q0JefbD9tOtZfHx47FhlQFK5uKMPH93P0rF3r+OiKLyFw2EjWMpUwaO2tOkVDf06ehYMDQo5sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuS+Aa6R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuS+Aa6R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B7B1F000FF;
	Thu,  1 Oct 2026 11:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790855687;
	bh=4XiWQIb0DJcd5roPqLH2iaW6jTBbzH4eyhLmxNAjUkA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kuS+Aa6RvZp9uiMlrv4r9B/FLkKGL0P7bmQMyLkYG/msM5BqyPmhZqtLD2F7gMPvA
	 4SXTiGXT/Bf13GqiT8uM9eghr1Zf7JMbuxRqNNxmDOqdVeQe32OD9NE2Fcpo8yLnId
	 hU1UVFbOIuWtvR0lddZcwAVHXjI6vF2aKQ1Cef0QaoKmGsT63dOL5ZYgv+l5gGyHqQ
	 WK2U4KXKwGkJWCL9F9EsSepaXx3lvlTa0oat2yYhnMKtUjyV8+pj3+Gzneu7j1vA7v
	 z9+gW+ERfcLzNWv7ZohmqhvC6vw9ar/ZgMa/K5857+kRqo+eAAbPMSSKYrVtcynSdv
	 RB8snvC3lA0Pw==
Message-ID: <3d13be9d-a4c9-4123-a047-67371fa4586e@kernel.org>
Date: Thu, 1 Oct 2026 13:54:40 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 4/9] selftests/mm: mremap_test: correct multiple
 VMA range size
To: Sarthak Sharma <sarthak.sharma@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Kalesh Singh <kaleshsingh@google.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Park Tae-sun
 <ts930@dgu.ac.kr>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260924050009.19974-1-sarthak.sharma@arm.com>
 <20260924050009.19974-5-sarthak.sharma@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260924050009.19974-5-sarthak.sharma@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/26 07:00, Sarthak Sharma wrote:
> In the test mremap_move_multiple_vmas(), pages 4
> to 6 form a single VMA. But the helper function
> is_multiple_vma_range_ok() checks pages 4 and 5 as
> one range and treats page 6 separately.
> 
> Check all three pages as a single range and skip
> the page 6 iteration to match the actual VMA layout.
> 
> Fixes: d53f248258e1 ("tools/testing/selftests: extend mremap_test to test multi-VMA mremap")
> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
> ---
>  tools/testing/selftests/mm/mremap_test.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
> index ba9b7f7566d0..869df22d46db 100644
> --- a/tools/testing/selftests/mm/mremap_test.c
> +++ b/tools/testing/selftests/mm/mremap_test.c
> @@ -373,7 +373,10 @@ static bool is_multiple_vma_range_ok(unsigned int pattern_seed,
>  	for (i = 0; i <= 10; i += 2) {
>  		int j;
>  		char *buf = &ptr[i * page_size];
> -		size_t size = i == 4 ? 2 * page_size : page_size;
> +		size_t size = i == 4 ? 3 * page_size : page_size;
> +
> +		if (i == 6)
> +			continue;
>  
>  		for (j = 0; j < size; j++) {
>  			char chr = rand();

What is the impact of this that it warrants a Fixes? Will the test fail?

-- 
Cheers,

David
