Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8A93C9EEF
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 09:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269910; cv=none; b=h3O+1psP7NHRgnW8TiwQvA9nKUGW5pABsbcRjFoLVvXJ0At4pdQR6k9kwMAkLXa22FGZrnk0sccQGfEJk0hpP2Ztb7lXlZZnAvKtZmIYhhFHGf4kJ+xv+9xNsClx/0MR/8SZa6bICM67VY72uNmUzO3DUmPFqz6BUq50gjB5Cwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269910; c=relaxed/simple;
	bh=ee4l0aOGqFxFUGDSrtNnbR9tcK9dlPFdi7ukZJVzNFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlB5H3V/hAoiS1nGLYYOrg34gzKo3FTImNLntFhFUZ6CbaMLk+bQ7pInGTl+gYwjG3Qs9o0+AaAezzKku+19oGRVZ/bwTyK+zZveGK99yFlgebF192/SAUiR6diZUSKlLj7gbqtpegO6Ezgg23ofTy4nvwRxbnwSpk31YBKWQL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGQ1dvJi; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGQ1dvJi"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67c2b4809baso10459406a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 02:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779269906; x=1779874706; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVTQmbrETv5mK3lzRRB7IS3srcOG1eF8+E4fWkWcGbg=;
        b=hGQ1dvJioRf5Gl1fgXt5kWURz1Z8y+4mgIBIPpVU2Qfw9VC2SJynUaGKgovp4plGQ5
         PqyqF/23Br0aLNCQEIG6dhqFc0J9t/ZrPY1x/lkszoYyLybKWUgrgOR6oXVSd3Y6aIOZ
         kwRxpOB7bKMVzstL3wWR+nFuQ2aucdASQyflqXaxpw4eV/Rb8Pv8447+uNa1lbbLNn9w
         aNkXFKIn96A1uAtmKBpNLBpoyNQy3I715vwEtYupDwfhxKJhj12pzjC1qHo/uYdYNztz
         hzLxig6PRPAiUcyK+q7nQXzTA5R5N04Aa3xTjlhoTejdQfPBG4ViRafkK9Ut4sCYdT8q
         0VlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779269906; x=1779874706;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BVTQmbrETv5mK3lzRRB7IS3srcOG1eF8+E4fWkWcGbg=;
        b=Bl5BMXnlP1CJZqRPIp+3L7tgvy5t/tsmc2avez/XAQ9KK7203NSA6jjz3uy6Z6Halx
         FJsLBvIOYgjco28iP8MrRvNNqInDlL3febpaECi1gwNGvauwxuzxgidpK2dnneCX+fcf
         USBlgimzYT/o6szIbUcRSGGTtR+nciW/Jbaa7VDo1Wxfnk7Vz8sDmyhMRF3vtffk2Rwh
         8txeC8982Wy/EFFcPoSSblAJNYW5vcnRfs78ipxhNkxJZyP1jP2RE4kK231MOoeyy2d1
         LLPcZkNS88G35LQK/hkcLEolb884dZcPnt/jQH5Ntp9RIaO93dcaRI78j0Mvt7V4lp/a
         CtzA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZCAN0E+EzI9YhJegYDpII4+axi2gW9A1chAN5Bq8Ks72UJPTRVpVKh0oIEphXDFUcwpIQcHTww70AYGa8m6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBfoimRd+yNlcKcGHB/5zVhTrywkvtdsZwPTPPAt7HCtsLcCS6
	3dvy7dxb3l5kzcXpJ7SodoC0yTzbL1RbHOygAMiCJJdeJ93BdGzeU/C6
X-Gm-Gg: Acq92OFiEsmSRwjHs4mQk0qEwjtgvaBOxP7fiRp9wG+W3sP3UFbOhciOO4AIxTeLgxO
	PQvd9Bc+LfYA9SVt/vpMEm9284HAzfJ28SzqyUwICM4BYRqaiVRwPTb4I03En6RNxq86dQERXzf
	nFM/8gQkiCY+zqNVBGqkmKrpljV2t2UnN0/AtRIxBUDfqK7Lpt3PqECSKu3lkUMZGo8W4Nomawe
	5bAYnOlIXEBqGmpCheLwOmeFKlIDmvJn+ZlK89aTdOAC0rLXVppYQfro6wj7e09bHeV8NscJnTw
	uXKpaKA2sPW1RvPN2YYiQKuPa1AiPiCv00Q2vmkKqIbieFBom2SHlTDR/BFuzAZZkuO2meNQtrB
	FwXSG8SdE1lNudKp4Fs9M3EW66WN0rVbWAbaBkqo6CXv+aWVeR6TzDq8AjfVUqvVaQ2Kwu6U5ek
	s/F4dIplcRq8MISStStsiq3N92nuJjQn8N
X-Received: by 2002:a17:907:8d8f:b0:bce:267f:19cf with SMTP id a640c23a62f3a-bd5177bfe13mr1418541666b.12.1779269905399;
        Wed, 20 May 2026 02:38:25 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c28c0asm848870666b.17.2026.05.20.02.38.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2026 02:38:25 -0700 (PDT)
Date: Wed, 20 May 2026 09:38:24 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Dev Jain <dev.jain@arm.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
	david@kernel.org, ljs@kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: close fd on write error
Message-ID: <20260520093824.eannlavh64fpxyrz@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20260520020336.28914-1-richard.weiyang@gmail.com>
 <20518530-12e3-4731-9b4a-54cc950239e2@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20518530-12e3-4731-9b4a-54cc950239e2@arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, May 20, 2026 at 09:21:48AM +0530, Dev Jain wrote:
>
>
>On 20/05/26 7:33 am, Wei Yang wrote:
>> When create_pagecache_thp_and_fd() write returns error on
>> /proc/sys/vm/dropcache, it just "goto err_out_unlink", which left fd
>> still open.
>> 
>> Use "goto err_out_close" to close the fd.
>> 
>> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>> ---
>>  tools/testing/selftests/mm/split_huge_page_test.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
>> index 460fa1f606fd..f30402ece608 100644
>> --- a/tools/testing/selftests/mm/split_huge_page_test.c
>> +++ b/tools/testing/selftests/mm/split_huge_page_test.c
>> @@ -469,7 +469,7 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
>>  	}
>>  	if (write(*fd, "3", 1) != 1) {
>>  		ksft_perror("write to drop_caches");
>> -		goto err_out_unlink;
>> +		goto err_out_close;
>>  	}
>>  	close(*fd);
>
>LGTM
>
>Reviewed-by: Dev Jain <dev.jain@arm.com>
>
>
>I asked AI and it points to another problem:
>
>for (i = 0; i < nr_thps; i++) {
>	if (is_backed_by_folio(page_area + i * pagesize, 0,
>			       pagemap_fd, kpageflags_fd))
>		continue;
>	ksft_test_result_fail("THP %zu not split\n", i);
>}
>
>ksft_test_result_pass("Split PTE-mapped huge pages successful\n");
>
>"If one THP is not split, it prints FAIL, but then falls through and also prints PASS.
>
>It should probably jump to out after the failure".
>

Thanks for AI.

It looks we should "goto out" after ksft_test_result_fail().

-- 
Wei Yang
Help you, Help me
