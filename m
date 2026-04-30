Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6E233D4E9
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777563754; cv=none; b=Vy7sq6TycPYJx5/D6QA/I2g3wr9NdcPV7YkXTfLcs/6vkqnOX6fPiyxKnp/ZH/ZcxQLrRZg189cOtFlnT8Bl2NDe2gWO/6Hhgn2LxHYHCxxFPZaNzzqd0CdaCeGcY7KONrw7H3D+NtmSigURNqZAvgbYvHG+FHzpxxiKWDPCK+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777563754; c=relaxed/simple;
	bh=414dV0w5349LLjdyb3ko0H75tg0jXraSuOz0SGmGXw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gGS20WYAgvX6Rm1pboX6eAE8fMhNIh6mFcZ2ganyP9L9iPf6WhRBu+4fZtSBigS00yLMmHtNSV1VLtgDcx9n3aEPYq0P14lJ0ejk05m3WZkWwwbFXxMM8eVrVbQiAp13sYbOhaweW0cbw2JC3vcwlI8TR418BpneLyhV6xKqxuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=biiMSzRj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="biiMSzRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777563750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jWlOrGB3uzSP7r2d6xQ9PldArz9tx4N60VGyQKuxC4s=;
	b=biiMSzRjrUmJbYHLeKb8z3AiHYhbYfe32Qg3Ibeuzafg/RI349OtW/e1prMoN2msUPPD6m
	E+USxduwndt6oPAwg2ro6OFVys3dJyByujc3yLhIoJQNRaS0UV1AblXCAN+ZArDpJuoIj3
	bDUKfKBlq6QKk44vegwr4Dp1KD/YBZc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-FnaEe53jMnOloYLqQFf72w-1; Thu, 30 Apr 2026 11:42:28 -0400
X-MC-Unique: FnaEe53jMnOloYLqQFf72w-1
X-Mimecast-MFC-AGG-ID: FnaEe53jMnOloYLqQFf72w_1777563748
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e136aff17so18087201cf.3
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 08:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777563748; x=1778168548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWlOrGB3uzSP7r2d6xQ9PldArz9tx4N60VGyQKuxC4s=;
        b=S8Mzfk0EHWQ/syOWGxiw9LR2vegJ0QjK/RhIOaigdFFAyutskG7r3vwAuZGMgAiloa
         SdVeuvUpyuAcQW0z3A/4GhYwn+t+EHCBeEieXIJ0tN6pCChzRfONVGQpp6wf7eWbamPr
         vEs5kCg3QK2gQHlHmoaVxayPM+z4KVmubinHlc3wii+rr30EVwMAdAP60hSzVeBlKDN1
         xBKacpBPu7y2Iw0c4+2M/mdmRrg5cOYJrq6Jk3ZFzxHBaSpK7yxPI4aMtkVNKsj7OzPm
         zkvB/QWnPGUoNDKDsIJuiDInMxMHCcZ9bNbXbq7ObbZ5SgtnePq3z1O4SxSoVKgU1OPv
         lIgg==
X-Forwarded-Encrypted: i=1; AFNElJ9c8KscwPhI63jWI8e1F/9Boy1iGnnz/m5QpHK3LOwz3PBjGru+4RUiJSkK6hKYRd2Z7ZCqTWG/WDZYNKYS7J8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDmDsrUwq2pRc5Jfzp/0r3EW35Pga+UkVX9neqPCAzaGEHaHYt
	btUnfXcWZXL7sPbl/lpGi++SJ6JVq7GapXeKDm1E6enuuuCz2kxbI/6mnOgmV3Itu49nuO74iPS
	JMHwq77FvZTlkVmy5dn7VS5KP1VjTlkXpYBNuu/O3ldo6nETSHD/SbvbIhI10y2VaYWMiPg==
X-Gm-Gg: AeBDietwvrPeKnNYIBH7pJoQX1kCrVR3XyCFUE6pQ0AFYorNFKcqvhAa26oEnlmxGNs
	cyDPh4wJCCSM4KRrHq+BMzHlgR+N3NwGJ2rzQEgRrcy3JNw/uUMI13FermhuBW14J2aYveuyZPq
	EKNFO2Stfn1jaj/tS/EzaA/U4XgjBRNIIfp4ikQ+nZTeRpuYQKNr4kXvj+lB8G+qAcgLRfZaDG4
	FjwCo8YdeHBR8qNnMBqD+u5GWvHWmAUmDgs1Pj5NX9i+bQSCRnjDAd73MlLsD5IM/+cdhu3cAUr
	ROU0jiW4G+WL3akHd9xvD8VYHQymNezqE+er0xEEakHcDzr3uREnIRBWYwo5tjE68jdEnhPu7x2
	RyMfg1o4PtKoyp/jdoieNXxnks8DIEqOQ+Hg=
X-Received: by 2002:a05:622a:8ca:b0:50b:526c:541c with SMTP id d75a77b69052e-5102ae320bbmr47576391cf.50.1777563747828;
        Thu, 30 Apr 2026 08:42:27 -0700 (PDT)
X-Received: by 2002:a05:622a:8ca:b0:50b:526c:541c with SMTP id d75a77b69052e-5102ae320bbmr47575841cf.50.1777563747268;
        Thu, 30 Apr 2026 08:42:27 -0700 (PDT)
Received: from [192.168.2.110] ([70.53.202.134])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5103b605192sm1164301cf.24.2026.04.30.08.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 08:42:26 -0700 (PDT)
Message-ID: <14348c25-a272-4cd8-a9d9-fe8673fb0487@redhat.com>
Date: Thu, 30 Apr 2026 11:42:15 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/54] selftests/mm: va_high_addr_switch: use kselftest
 framework
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lance Yang <lance.yang@linux.dev>,
 Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Sarthak Sharma
 <sarthak.sharma@arm.com>, Shuah Khan <shuah@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-21-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260428204240.1924129-21-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-28 16:42, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Convert va_high_addr_switch test to use kselftest framework for
> reporting and tracking successful and failing runs.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Luiz Capitulino <luizcap@redhat.com>

> ---
>   .../selftests/mm/va_high_addr_switch.c        | 41 +++++++++----------
>   1 file changed, 20 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/va_high_addr_switch.c b/tools/testing/selftests/mm/va_high_addr_switch.c
> index 51401e081b20..5d38735ea60e 100644
> --- a/tools/testing/selftests/mm/va_high_addr_switch.c
> +++ b/tools/testing/selftests/mm/va_high_addr_switch.c
> @@ -257,40 +257,35 @@ void testcases_init(void)
>   	switch_hint = addr_switch_hint;
>   }
>   
> -static int run_test(struct testcase *test, int count)
> +static void run_test(struct testcase *test, int count)
>   {
>   	void *p;
> -	int i, ret = KSFT_PASS;
> +	int i;
>   
>   	for (i = 0; i < count; i++) {
>   		struct testcase *t = test + i;
>   
>   		p = mmap(t->addr, t->size, PROT_READ | PROT_WRITE, t->flags, -1, 0);
> -
> -		printf("%s: %p - ", t->msg, p);
> -
>   		if (p == MAP_FAILED) {
> -			printf("FAILED\n");
> -			ret = KSFT_FAIL;
> +			ksft_perror("MAP_FAILED");
> +			ksft_test_result_fail("%s\n", t->msg);
>   			continue;
>   		}
>   
>   		if (t->low_addr_required && p >= (void *)(switch_hint)) {
> -			printf("FAILED\n");
> -			ret = KSFT_FAIL;
> +			ksft_print_msg("%p not below switch hint\n", p);
> +			ksft_test_result_fail("%s\n", t->msg);
>   		} else {
>   			/*
>   			 * Do a dereference of the address returned so that we catch
>   			 * bugs in page fault handling
>   			 */
>   			memset(p, 0, t->size);
> -			printf("OK\n");
> +			ksft_test_result_pass("%s\n", t->msg);
>   		}
>   		if (!t->keep_mapped)
>   			munmap(p, t->size);
>   	}
> -
> -	return ret;
>   }
>   
>   #ifdef __aarch64__
> @@ -322,19 +317,23 @@ static int supported_arch(void)
>   
>   int main(int argc, char **argv)
>   {
> -	int ret, hugetlb_ret = KSFT_PASS;
> +	bool run_hugetlb = false;
> +
> +	ksft_print_header();
>   
>   	if (!supported_arch())
> -		return KSFT_SKIP;
> +		ksft_exit_skip("Architecture not supported\n");
> +
> +	if (argc == 2 && !strcmp(argv[1], "--run-hugetlb"))
> +		run_hugetlb = true;
>   
>   	testcases_init();
>   
> -	ret = run_test(testcases, sz_testcases);
> -	if (argc == 2 && !strcmp(argv[1], "--run-hugetlb"))
> -		hugetlb_ret = run_test(hugetlb_testcases, sz_hugetlb_testcases);
> +	ksft_set_plan(sz_testcases + (run_hugetlb ? sz_hugetlb_testcases : 0));
> +
> +	run_test(testcases, sz_testcases);
> +	if (run_hugetlb)
> +		run_test(hugetlb_testcases, sz_hugetlb_testcases);
>   
> -	if (ret == KSFT_PASS && hugetlb_ret == KSFT_PASS)
> -		return KSFT_PASS;
> -	else
> -		return KSFT_FAIL;
> +	ksft_finished();
>   }

