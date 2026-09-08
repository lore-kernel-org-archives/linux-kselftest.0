Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E8C4F797F;
	Tue,  8 Sep 2026 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862419; cv=none; b=Icf7Yw4IJbQ3B7a6wVI+sG04ASa/VuPlYy8m0PtnajCbqBXLh0nzRIZFD225UgK76XypdroYxsxB87kN6lerVO04je2wAndsKFzpEGsSGUmC/JfHMUR0YcsPaqzaIhfCJFxl7umroN2HLDOf3z8dWXKxpl9BJ4eqvuoq8W5wjjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862419; c=relaxed/simple;
	bh=HMxdTjutqE80QtVvVuEyBqknLXYSR/nBcMooiWNB3x0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXsbmTFGZQnjvGGU8Q8iU8B9N9Z05fgq+/YHnlgcnqYXTBN2V2lGneeI0ih6wElQidf1y07hC3Qh5E2uK5GXz3zd+6sS1V4jTn989I2aLT7aZrdoNlikS3HXMXxs7LYcEb9whzBzyTF0PIEzI82/+4WB8eFkvuByz8mAEjPVbYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OO5YyETh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OO5YyETh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D794C1F00A3A;
	Tue,  8 Sep 2026 10:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788862418;
	bh=s5Rhz3vZATjbgv4L2KAACRCIbtaQyFKnS2m/CL22BH0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OO5YyEThil9/HPDJqoIpj1Ew48vNHqwYqwgFZG09fyVBdWNykF7HX/zrzOp1X+egE
	 c0JHpYD0fJtjE2J/OxgDUrDOrwQGsqY8cKYgf9Nh4dgXFUaDA+mhh21BeAWQHvgO1e
	 FybHHB8M0FbsEEaJmOKRedjFAiQ7Bg8NM0FrJfJQEVsIpxwd6RwIWX/W8mi8tMnKQ5
	 QQQwz6oOprf0KFSJNTTbFexVcGiO+t8E/iKhnsPoayZz2HRcLGqURRC8hsWkOLVJx6
	 Pp0/QHNDZOD2UpFdE/blACWUocYPjIbVp+2k06z5jDSVV0Q1Ql6tx3+Rae0mUR6ZOE
	 aWiFMONpCEtUQ==
Message-ID: <d6ca7f47-39bb-43b4-92d6-63ccc148ebdd@kernel.org>
Date: Tue, 8 Sep 2026 12:13:32 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] selftests/mm: Reject invalid test selections
 before running tests
To: Tianyi Chen <hi@tychen.cc>, Andrew Morton <akpm@linux-foundation.org>
Cc: shuah@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, jsavitz@redhat.com
References: <20260906135444.749144-1-hi@tychen.cc>
 <178886112560.138404.1278745290043112298.mm-cli-v2-0@tychen.cc>
 <178886112560.138404.14562368683011041790.mm-cli-v2-1@tychen.cc>
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
In-Reply-To: <178886112560.138404.14562368683011041790.mm-cli-v2-1@tychen.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/8/26 11:55, Tianyi Chen wrote:
> getopts reports unknown options and missing arguments, but run_vmtests.sh
> ignores its error result and continues with test setup. An empty -t
> argument also falls back to the default selection, while unknown category
> names can silently select no tests and still reach setup code.
> 
> Exit on getopts errors and validate category names against the existing
> list in usage() before any test setup. Reject empty and whitespace-only
> selections, and normalize category separators so validation and execution
> agree. Keep the default selection for an unset or empty VM_SELFTEST_ITEMS
> environment variable, and preserve the existing standalone default value.
> 
> Fixes: 85463321e726 ("selftests/vm: enable running select groups of tests")
> Assisted-by: Codex:GPT-6
> Signed-off-by: Tianyi Chen <hi@tychen.cc>
> ---
>  tools/testing/selftests/mm/run_vmtests.sh | 27 +++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> index d09f9f6a384..836c7454cba 100755
> --- a/tools/testing/selftests/mm/run_vmtests.sh
> +++ b/tools/testing/selftests/mm/run_vmtests.sh
> @@ -96,26 +96,45 @@ separated by spaces:
>  
>  example: ./run_vmtests.sh -t "hmm mmap ksm"
>  EOF
> -	exit 0
>  }
>  
>  RUN_ALL=false
>  RUN_DESTRUCTIVE=false
>  TAP_PREFIX="# "
>  
> +# An unset or empty environment selection keeps the default behavior.
> +VM_SELFTEST_ITEMS=${VM_SELFTEST_ITEMS:-default}

Who would set it at this point?

Can't this just be

VM_SELFTEST_ITEMS="default"

> +
>  while getopts "aht:nd" OPT; do
>  	case ${OPT} in
>  		"a") RUN_ALL=true ;;
> -		"h") usage ;;
> +		"h") usage; exit 0 ;;
>  		"t") VM_SELFTEST_ITEMS=${OPTARG} ;;
>  		"n") TAP_PREFIX= ;;
>  		"d") RUN_DESTRUCTIVE=true ;;
> +		"?") exit 1 ;;
>  	esac
>  done
>  shift $((OPTIND -1))
>  
> -# default behavior: run all tests
> -VM_SELFTEST_ITEMS=${VM_SELFTEST_ITEMS:-default}
> +# Normalize whitespace so validation and test_selected() use the same names.
> +read -r -a selected_categories <<< "${VM_SELFTEST_ITEMS//$'\n'/ }"
> +VM_SELFTEST_ITEMS="${selected_categories[*]}"
> +if [ -z "$VM_SELFTEST_ITEMS" ]; then
> +	echo "No test categories specified" >&2
> +	exit 1
> +fi
> +
> +if [ "$VM_SELFTEST_ITEMS" != "default" ]; then
> +	# Keep the documented category list as the source of valid names.

That makes sense to me.

It's interesting what would happen when trying to run a test that does not even
exist for the architecture. Getting some feedback that the test was skipped
would be nice. But that's something for another day :)

-- 
Cheers,

David
