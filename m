Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186662;
	b=vNG2zffmE0TortbHt3pFPTuL1OuJ8h/uZOBOgDrQ2ClWFRQlbs/hyRLGWivnmrk3s7JL
	 h5neQ7CyMZ0OewsqhPIm83oM+w904ntSLlNn0BsyRt8iWSRlV4bDczSlLisq0qel1YgBL
	 KChMhnSAW76A5FqqqCnv3Zn/G68m4McKJynCbeMoRZXgOxS30V230iwU6RIgVyZj6asuf
	 MSV/fM2Ge1vDxolkhn74t+wI+y0duu7ep3AXT/SPqc3xPHmInuMHsmGuqJzmkOjATc931
	 /TDNiyU5dw+93wqWyAOf6zHVapU565lG6k/a1dfWgEVMvZcpneAvIdTsOugD2TiivGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186662;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=2xCXHplURiniQc9ck7TyMRt3ZbXb6hxVB8xWH2R2PZE=;
	b=sCQQ/3zFmyLjkdiJcEjm3/s1apyaG9ebJobZ0fS2hZi65AdCjsesrkM4/UXoHNxNrbKD
	 6ZsJk5DwBqH5zSYREkbIAkPh9zD3LFIyBZOyAva0iUBx9iv1HZ4BUjww13JCCAWGbJoL2
	 uI6hBaxOrahAy7TXj8oGdFfVA+4QyXprMNkxBOvS8FfPE7Bxub2st5Cs2IwN0QnVlpVp3
	 cQiaxG/HC+kolAREeBZo9k33A6qvgPY2yxY99BRkloe3BavjldJUbUVkoQHeYNi9McuW8
	 PUAEvEX1cBnbZpPPImmt1aRMrqbE0Q8FAjWRX3px8bwBTxrAnNH3aLIZbUj54WvNtrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="HpmChy7/";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2688606A31A;
	Wed, 28 Oct 2026 11:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2688606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HpmChy7/
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF51D16A3;
	Wed, 28 Oct 2026 04:24:16 -0700 (PDT)
Received: from [192.168.29.156] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6063E3F673;
	Wed, 28 Oct 2026 04:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793186660; bh=kBcc9gOJeHW/ZyKtIy3EZx6TqVCzCIfBXbymtxm/ptk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HpmChy7/wSzaK6QVHmfmbok1yQSifFR0m5JhkcZEoFkXWaUFHAsqOwKt5m4nqEwRJ
	 0ek8YjtXV7O1W/lo18XYEHgLN9flJKw7/bzmiGS6/Bvvl6yTZCyMfvaLmRu8elSs+y
	 tOjU3FxS7E3iHLXEr2MVSr1Lcyz8I3VfMl38JNiU=
Message-ID: <f3e0403f-07cf-49be-acb9-671a1467d1cd@arm.com>
Date: Wed, 28 Oct 2026 16:54:12 +0530
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
Subject: Re: [PATCH v3 4/7] selftests/mm: check that MADV_COLD and
 MADV_PAGEOUT preserve shared memory
To: "Gregory Price (Meta)" <gourry@gourry.net>,
 linux-kselftest@vger.kernel.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org
References: <20261019171206.3331374-1-gourry@gourry.net>
 <20261019171206.3331374-5-gourry@gourry.net>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20261019171206.3331374-5-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/19/26 10:42 PM, Gregory Price (Meta) wrote:
> Both hints are non-destructive, but the tests so far only check that for
> private anonymous memory. Shared memory reaches reclaim differently:
> 
> Test the following:
>  - a dirty shared file page must be written back or left resident,
>  - shared anonymous memory is paged out through shmem
>  - a SHM_LOCK'd segment is unevictable without its VMA being VM_LOCKED.
> 
> MADV_PAGEOUT unmaps a shmem page before it tries to swap it out
> so none of these needs swap.
> 
> The SHM_LOCK test confirms the page is unevictable and skips otherwise.
> 
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---
> v3: Dropped Sarthak's Reviewed-by from v2 5/8: added the fixture check
>     for hidden PFNs and create_temp_file(), and the shared anonymous
>     test now fails rather than skips when the page is not unmapped.


LGTM, so:

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
