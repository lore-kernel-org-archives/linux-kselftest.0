Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5F2222597;
	Mon, 17 Aug 2026 15:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786981029; cv=none; b=dj2zgFu265eRCusS6t4USLR/buRc4XMpMr1KYoFvZXEUQ5OnPG4YJYZr/fI96POSta/g8ZIyCMQ7ioAhNS5Ng200FSj8ec275sHzyGkwc55bkZ2BvDVyJ05GJ5I0y/HwkSRB+aLd80VHRP18DHO2faaKaBciFx0F4Ux4e/pAhnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786981029; c=relaxed/simple;
	bh=Lq8S4KyCIQ2zIcu/qUjZ64Lwjmhb7UJ5gjGjbTMLsHE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jG+rlXi/9taZeVhbYzSPF2BtIrhdcH54sJYZ+SysZxFpEEko7GibPs0W+0ltz0l2wumiQI9QEG4oDvB1DItAFQzlOlmovlNY+pA5JsvSxC/iBMSGyTtkzgo/RGJ2uNXLSXM0zV/Og49Yaj45s3yLAQuZZBs5VoqgPzt0hy+gaNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dDnIm5Jd; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dDnIm5Jd"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 297001688;
	Mon, 17 Aug 2026 08:37:03 -0700 (PDT)
Received: from [10.2.198.93] (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E01183F673;
	Mon, 17 Aug 2026 08:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786981027; bh=Lq8S4KyCIQ2zIcu/qUjZ64Lwjmhb7UJ5gjGjbTMLsHE=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=dDnIm5JdpaOigqiWjHMFyPCLfIQKrdkFAkOAp0xg7bnE4VWgGnQi+bTRR08FU6Gsm
	 NiWWbiQ6k7VqAqUr78RjVlcEIMVFw1UL3XkFnchABg6+DnRtddDI3voFMliWalELVr
	 XXBTVm5O4umADdQWlHLumZwD50h0r/c9hURvdVhs=
Message-ID: <c8eda67d-34f1-4179-a1d7-ca2c28b2992e@arm.com>
Date: Mon, 17 Aug 2026 16:37:03 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, linux-mm@kvack.org, shuah@kernel.org,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 surenb@google.com, mhocko@suse.com, peterx@redhat.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] selftests/mm: emit TAP header in uffd-wp-mremap
To: Song Hu <husong@kylinos.cn>, akpm@linux-foundation.org, rppt@kernel.org,
 sarthak.sharma@arm.com
References: <20260815080716.3596514-1-husong@kylinos.cn>
 <20260815080716.3596514-2-husong@kylinos.cn>
Content-Language: en-US
From: Usama Anjum <usama.anjum@arm.com>
In-Reply-To: <20260815080716.3596514-2-husong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/08/2026 9:07 am, Song Hu wrote:
> uffd-wp-mremap calls ksft_set_plan() without ksft_print_header(), so its
> output is not valid KTAP.  Add the header, like the sibling uffd tests
> (uffd-stress, uffd-unit-tests).
> 
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
> Signed-off-by: Song Hu <husong@kylinos.cn>
> ---
>  tools/testing/selftests/mm/uffd-wp-mremap.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/uffd-wp-mremap.c b/tools/testing/selftests/mm/uffd-wp-mremap.c
> index c973d6722720..572c2516e874 100644
> --- a/tools/testing/selftests/mm/uffd-wp-mremap.c
> +++ b/tools/testing/selftests/mm/uffd-wp-mremap.c
> @@ -347,6 +347,8 @@ int main(int argc, char **argv)
>  	struct thp_settings settings;
>  	int i, j, plan = 0;
>  
> +	ksft_print_header();
> +

Reviewed-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>

>  	hugepage_save_settings(true, true);
>  
>  	check_uffd_wp_feature_supported();

