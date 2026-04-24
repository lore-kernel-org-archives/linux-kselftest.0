Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCF333C195
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 17:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777051322; cv=none; b=WYTDOkPkVeYp+MnNrvIe21INK4CHNPvXX6T21Yo0gcYZwIGEJMwUCz9H8aE9huo02zRRGOll5iX/Rcmy1OdsCuTsUu81MPig7kxTIJjlZjhPhA3Kwksko4x0PJLCfayqfvE6X/7TJqUW9CIEVBe5FX5XbknihHHqyUJgDjzEMco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777051322; c=relaxed/simple;
	bh=95z0XIt4PiRM0mSi8tZF2ggc5CB4vKKWpTlHtvX8NmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNrJqyyZvBhouSnnE+t3L9U9fv1YRBZ7csaGK9bzFGCC7QtfAMgKViIAoWzv6SssI6TR5nqBSkt86l5mNSLD3BEIc07UzSZBOl3qiGfT2E7EVicE/6ItmvhIHx2cfsJFRzu20QRPiu4yIoRt4RahkPPubMH3proJfDfQ4lWFwrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IUgZOkxi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IUgZOkxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777051320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XlT2C+6GgdAk9z52bJe0h440fytJPDoIRU7OOb/gQQI=;
	b=IUgZOkxi3NEFJHnCg0yhKMiUFvf/g38gi6ltW+gy1tZ+IRaeKVNve1wCPYO29zz5sZeVyZ
	xaIPB4HXjrLa2XdAuf86vSfrbJPRXE1g6GeEfTi2zHzWN3YnimyWmizTlByocoKFQJJhvU
	fBpwje81FE77JNvKe4+Ufm+6/nrecDA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-h8pTSMjyNZuAVi5DjnQTkQ-1; Fri, 24 Apr 2026 13:21:56 -0400
X-MC-Unique: h8pTSMjyNZuAVi5DjnQTkQ-1
X-Mimecast-MFC-AGG-ID: h8pTSMjyNZuAVi5DjnQTkQ_1777051316
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8aca29dcd69so199990906d6.1
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 10:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777051316; x=1777656116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XlT2C+6GgdAk9z52bJe0h440fytJPDoIRU7OOb/gQQI=;
        b=qypC+JFIGQZdQAYyOf11flqT/88rBhnbb/RukF2i5u0LzWDXLk7HjPH5rPogJ7/mvX
         JgMAQfqA7M4PoqFqzCsbKiNRzMIcWVuTgnS2SdTzBmz+poQGSqfXgytXwKEOoUG321Gd
         Rja92bVCRuv8unczyboT2J0fk/mPtKvGkQFiyDKxaO0EUwPL4TOvFvuAI7YnTisfNG23
         NSQaPhaq1dA66IbAqkGL+X+QSkI7HqpMZBPyxjkqpzjWP9TtXn8GElEg9KMdbqZuHU29
         X8rE7ABb3DPbm9qx7vKQ8GWf036kRvexJXST+YBbmdOFF+5yv2wt1ioEoWhOVMBnQfn8
         XnrA==
X-Forwarded-Encrypted: i=1; AFNElJ+mwhhjbiINeLjiFteD/0KJBJLue03B3kixUL0HX38Ezu1fQpRPBUQSqHg39St61Q3NMqMM7KyM5n7HN546U4s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs6NGH5EBc12OE2emot7WgFnv/Oy7i8YJiVjW2/LpO/jwur+Dl
	rvlxlxebsE1mqgqiAuR1DeboIZFuJ82yGgZLLDvTlqHC+Y5n4FBo32IeZ3XkfngMCEl9iJHn20N
	w0NOhQAZg70lLkAclfuJBBA3XAVubHezb5ef4mL4tsx67XqL/K7iyZzCUaVB3/V+quImu4g==
X-Gm-Gg: AeBDievjC0EvSDFi1bFYlQXnQuX253HEA8jsOfOgQk/GVmiFuoctt3QYpKGWg4n38eT
	Dz2EAS4nPXYXjf3AytCX9vHibyjUpmwJ+GRapjPLndRLlbXaHrMr5TJyQg+PCrdvB9CBwyHiiYi
	zKnzQXz7GKscr00ipkjcH7FfNcvs+lMunHhanrC3kWMfZyCuQeGDvfVFxAoB+sv5PfNYHBg7Kr1
	qqoSq5S+kq1YMOLvts9iwNV5e2qfOzFkA9BXOCszM9C6AoaedGNzDJmjGSRyDXMF2l6nrb/Gn+w
	aA0j53N9qayAtPtHqwr2AbK3fYpoCznHuiw+9rViy497UWhyPCExCGL5a2DWgE1gAwfBcznzTFr
	ZZpxRsSSJ/DuiKtgirXewDZI3YOxjabq29R2E
X-Received: by 2002:a05:6214:1d0a:b0:8ac:d13c:1938 with SMTP id 6a1803df08f44-8b0280ffd78mr487358056d6.17.1777051316149;
        Fri, 24 Apr 2026 10:21:56 -0700 (PDT)
X-Received: by 2002:a05:6214:1d0a:b0:8ac:d13c:1938 with SMTP id 6a1803df08f44-8b0280ffd78mr487357426d6.17.1777051315590;
        Fri, 24 Apr 2026 10:21:55 -0700 (PDT)
Received: from [192.168.2.110] ([69.159.169.238])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae97d89sm193980186d6.42.2026.04.24.10.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 10:21:55 -0700 (PDT)
Message-ID: <46971f34-a287-4209-8716-880926e0b8d2@redhat.com>
Date: Fri, 24 Apr 2026 13:21:43 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 51/53] selftests/mm: va_high_addr_switch.sh: drop huge
 pages setup
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
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-52-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260418105539.1261536-52-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-18 06:55, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Since va_high_addr_switch takes care of setting up huge pages, there is
> no need to set them up in the va_high_addr_switch.sh wrapper script.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   .../selftests/mm/va_high_addr_switch.sh       | 39 +------------------
>   1 file changed, 1 insertion(+), 38 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/va_high_addr_switch.sh b/tools/testing/selftests/mm/va_high_addr_switch.sh
> index 9492c2d72634..d66c0fd3cb4d 100755
> --- a/tools/testing/selftests/mm/va_high_addr_switch.sh
> +++ b/tools/testing/selftests/mm/va_high_addr_switch.sh
> @@ -9,7 +9,6 @@
>   
>   # Kselftest framework requirement - SKIP code is 4.
>   ksft_skip=4
> -orig_nr_hugepages=0
>   
>   skip()
>   {
> @@ -77,43 +76,7 @@ check_test_requirements()
>   	esac
>   }
>   
> -save_nr_hugepages()
> -{
> -	orig_nr_hugepages=$(cat /proc/sys/vm/nr_hugepages)
> -}
> -
> -restore_nr_hugepages()
> -{
> -	echo "$orig_nr_hugepages" > /proc/sys/vm/nr_hugepages
> -}
> -
> -setup_nr_hugepages()
> -{
> -	local needpgs=$1
> -	while read -r name size unit; do
> -		if [ "$name" = "HugePages_Free:" ]; then
> -			freepgs="$size"
> -			break
> -		fi
> -	done < /proc/meminfo
> -	if [ "$freepgs" -ge "$needpgs" ]; then
> -		return
> -	fi
> -	local hpgs=$((orig_nr_hugepages + needpgs))
> -	echo $hpgs > /proc/sys/vm/nr_hugepages
> -
> -	local nr_hugepgs=$(cat /proc/sys/vm/nr_hugepages)
> -	if [ "$nr_hugepgs" != "$hpgs" ]; then
> -		restore_nr_hugepages
> -		skip "$0: no enough hugepages for testing"
> -	fi
> -}
> -
>   check_test_requirements
> -save_nr_hugepages
> -# The HugeTLB tests require 6 pages
> -setup_nr_hugepages 6
> -./va_high_addr_switch --run-hugetlb
> +./va_high_addr_switch
>   retcode=$?
> -restore_nr_hugepages
>   exit $retcode

The retcode=$? and the last line are deadcode now and can be removed.

