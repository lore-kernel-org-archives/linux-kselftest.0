Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF58282F06
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 18:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777575002; cv=none; b=pN7csBSgMWRWidwLiE2agPSX+f3PwWLHuhzPA8Eqkfs2YLMPlXpB7z5dUaPWFVToKUd3lrwLM6vqfGc40VqI3DVYU+0K3/hdovaAfnv/zCmBo4encbHTqTjbvaWpBq1K1w7n7NNpC5C66bHcrhERHIWN1ZzN6GmRSil+hHp+ZBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777575002; c=relaxed/simple;
	bh=EVxBSe1cl6Hz0Z3bsdHs1uU5HbZhyoI+ifzwQrVlJGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXuQ6kdJzjDmReJg01FObDR4S+TI46i/6Ui2lFRJE0WKu3rxrYkx7+egdfvuu8hEncDNWw9c9oaNbXLEJ/UCdVCQY9s3aYjMaVv7kO+YF0X9WqPrqG57pyUARro+MyZwdkHrmY23yL5LYeoE30bH2Je3gb4kz8bpAyEVE3go9W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RgxsQmm5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RgxsQmm5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777574999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hnKl9OZc44JsdkvruemasdPKEjlnDZ5531kZfhlSZpc=;
	b=RgxsQmm5GV/TePgd+Ryj4uLmgnVn6IyfJAEE0OJ3y4BBqty66zlDNtBZHuUOnvMBYBTbda
	Tw/dRfZzGEkj2LO13FFOv8PQev0bHGZ4AQq7iy/lMPS4aCqEKE813ATR0qye0/J1pl0d7h
	9POM108dr5jMarXsjoJsubldLY75/Fg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-Htk-Rb5SPDeHZqzOM3f6sQ-1; Thu, 30 Apr 2026 14:49:58 -0400
X-MC-Unique: Htk-Rb5SPDeHZqzOM3f6sQ-1
X-Mimecast-MFC-AGG-ID: Htk-Rb5SPDeHZqzOM3f6sQ_1777574998
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8e8950b3ee1so347437185a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 11:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777574998; x=1778179798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnKl9OZc44JsdkvruemasdPKEjlnDZ5531kZfhlSZpc=;
        b=FQtgrlp9CQoMfNdT2dbqqj7s7+Ozk1lie65ao2EtxkT65VhFH9h77qJx8NwxATJnhM
         5LyxEyP/1pQ5hYmIgfbiEOu0WeYlUPDQGUqM4T+ollECc9ygU/7uluaCVdLAR92Jvuff
         A/tJbJ7ZETI/Sq3krevliitT6uK5OzPt7Ys6jaR0CA7/TfcSMCzteQtZjU4rlxWjW+XR
         o7Pfnl1KOid5YD4TZeoyNDoE6qq+UFRK4p0CTjxTq8lXeRGIBVYbNAvcTojg72YGKIco
         /H4gAB4rAOR3LTvbPuYkIZjO4iIjXL2ZzW3EV3lz+5ylN0p+BP98+X3zD1vSawdsPz5W
         GAAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/stcJzVk/Pb8v230MRK6fmvi/z5u508l6tM6rfgiCs2U02fOdiQp5iLn1nZv1FZWGiU1a6hBWUmHg87L8pV2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAkzX0jqv/26uvIvn+Zku4/6B/llpE88n/BiXNp1IjG/bKOvT5
	OXQzYwnMopipeFyD4FMnw39zFcMJQ3MeqiVxHLVPBE9CrehJBz/KHRg6tx4qYfMk7+5R5R/1YCq
	mRJn0CE9tgfTSnAH+mCalyw9nJTTV1lroY5aE/8QNV0YgIRsluOyIAzwlwixRiEMnFEfoLA==
X-Gm-Gg: AeBDievQqzXscI+pb3+ksnES/Oqa2DjxIj8ezadiAacIPr8/2T2hTxVYkq2TcL1FkUL
	IK9X76WBEXgLuMlQXI8tB27fcNStRmAv29K/wKtz57sWV5xWh3XPsh14P9hZK+386ZuHpEIOBGO
	VepLnyYdtsbNeyu69/DMdPbGxnRfOxPTlQ4dEofixAgayEwTlJk6zcTM/YQwCZ5wrZ/RpzG/pAD
	PX0Idqg4V79xZI3Dgit1DxX4ZIEWIFE/1MG8kt1dq015WwhxOgslsl0OmeQSL8Bb6eNgyVuBPob
	W+XqZglFMqq3kXgf5jp0cPrOSJb9eMDM4G2jWW/z1Fr2f3nNYaYiVtFiNmWN7mHK71xXxiLdV1J
	9p68Zr2bYyU1jDx6pGQPDrNZD3SKtILstoPF567YAVaD+Ac9SKLII4lT+YF0z06PWWHWJyQfENh
	wTouhz5Nvn1oD4GZXbMMskatg=
X-Received: by 2002:a05:620a:4803:b0:8d6:874c:a763 with SMTP id af79cd13be357-8fa8922add1mr662277485a.49.1777574997775;
        Thu, 30 Apr 2026 11:49:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4803:b0:8d6:874c:a763 with SMTP id af79cd13be357-8fa8922add1mr662269985a.49.1777574997162;
        Thu, 30 Apr 2026 11:49:57 -0700 (PDT)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-22-70-53-202-134.dsl.bell.ca. [70.53.202.134])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fbb430fed8sm39960585a.41.2026.04.30.11.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 11:49:56 -0700 (PDT)
Message-ID: <4beb6000-7d00-4ee6-a482-daa90c7502c3@redhat.com>
Date: Thu, 30 Apr 2026 14:49:55 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 52/54] selftests/mm: va_high_addr_switch.sh: drop huge
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
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-53-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260428204240.1924129-53-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-28 16:42, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Since va_high_addr_switch takes care of setting up huge pages, there is
> no need to set them up in the va_high_addr_switch.sh wrapper script.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Luiz Capitulino <luizcap@redhat.com>

> ---
>   .../selftests/mm/va_high_addr_switch.sh       | 41 +------------------
>   1 file changed, 1 insertion(+), 40 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/va_high_addr_switch.sh b/tools/testing/selftests/mm/va_high_addr_switch.sh
> index 9492c2d72634..01c15fe3c799 100755
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
> @@ -77,43 +76,5 @@ check_test_requirements()
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
> -retcode=$?
> -restore_nr_hugepages
> -exit $retcode
> +./va_high_addr_switch

