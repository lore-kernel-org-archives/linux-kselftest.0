Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5F8445AE0;
	Tue, 25 Aug 2026 13:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663931; cv=none; b=Kldp2GnxcbYwKMdRgPGEafjrx9/iueTMZkhXKBr5BSwLfw4CMHOiIeXI034vryDeiCBb/e3hcMpSS8xzxQukJdRYXIv/n8jybbtaHvNXdjw7gFjvSDjoeRwO1P2SbEUzT3NTgmTTNa7mXL30htbXtXQdhEV173Di4BL1HqyUEBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663931; c=relaxed/simple;
	bh=oqx4vw6gp8Mj0VrjxvBO3V7o0meDa+xwNBbns4qZeZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=suxJE8BPD0bIlB1zyjqdkT/AzPvMZTaw1BmQzrV0NXfAqCSq/oA38H5iALrcjQCeSRu+vhYJWlmPsvryYB6LIcQYlrzYuojY9Y09+AvqEVDMK48HtcwN9LDTL9xyINvbluOFCUkLR4GbTtRRLptuQNbqr7+lGqhjViG5K7S2eAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tosz2tLY; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tosz2tLY"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 903D81A9A;
	Tue, 25 Aug 2026 06:18:44 -0700 (PDT)
Received: from [10.164.19.33] (unknown [10.164.19.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 95FA03F66F;
	Tue, 25 Aug 2026 06:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787663928; bh=oqx4vw6gp8Mj0VrjxvBO3V7o0meDa+xwNBbns4qZeZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tosz2tLY/eQrRQrkLmdgQFx72H66rn94BA/7jp2lmSTuv5n21hCcBicIY1XlxZRZr
	 nWmSFIQeYFGukbCsW+LW6qCipcPlNYPNqtQ+mk7baZJ0SPwQjs0KZ7y7n0rESswu5x
	 R9jFpFM33OYXwBO/AFl9VK63sZA4HwkmswLAO7fo=
Message-ID: <482ad8b2-680d-4682-80e4-baf4023bcef7@arm.com>
Date: Tue, 25 Aug 2026 18:48:40 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: khugepaged: remove str_dup() usage
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260825-remove_str_dup-v1-1-0ba2121a820c@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260825-remove_str_dup-v1-1-0ba2121a820c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 25/08/26 4:50 pm, David Hildenbrand (Arm) wrote:
> We don't check str_dup() return value and never free it. While both
> things are irrelevant in practice, let's just clean it up by working on
> argv[0] directly and avoiding the str_dup().
> 
> Nobody after us needs these parts of the argv[0] string anyway.
> 
> This patch is inspired by previous work from Anshuman Tewari [1].
> 
> Link: https://lore.kernel.org/r/20260821114416.12255-1-anshumantewari123@gmail.com [1]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

LGTM

Reviewed-by: Dev Jain <dev.jain@arm.com>


>  tools/testing/selftests/mm/khugepaged.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 1d2d6bd72fd2a..83d27d069c413 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -1227,7 +1227,7 @@ static void parse_test_type(int argc, char **argv)
>  		return;
>  	}
>  
> -	buf = strdup(argv[0]);
> +	buf = argv[0];
>  	token = strsep(&buf, ":");
>  
>  	if (!strcmp(token, "all")) {
> 
> ---
> 
> base-commit: 169393fff5d1ec2690934067eeb95544ff5ebdd7
> 
> change-id: 20260825-remove_str_dup-bb089e93094f
> 
> --
> 
> Cheers,
> 
> David

