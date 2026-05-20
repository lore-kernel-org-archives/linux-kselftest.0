Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F3B1A316E
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 01:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779241769; cv=none; b=tifTA5B69R21WGhxgjBr6G+rBFi/uluktdDIPYW6gxlsEdV/ufthHcrDIx/LQc/oq8itX/Hw3XtYKkKSWyNup7snxkmPZtadaFyf3JfX2hTm5HxzSHiSeUKfuw3j4PIJmeJsnnBV1ajKY0JWfjwSdo+TtgDb7mLQHtT0ExUkQgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779241769; c=relaxed/simple;
	bh=7EM+JfkwMRjx4vKgzSPCXPtP8Hs4LizMJhdeXnEWxgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKPKONh5ngOxNJZpvOQQyjGvax4E0cqMuHMWOTa1jbecnbw6GRPa5w5UA9FR8I94+pUASv0XPK6w30pXuh5rv5JPj2nXlGsjP78IXcovBwJqeKbq+aYZb4X8o5irpza59NCIvq8TfaOy7b4tYYazDQAJTge8WsUm4aaUrDAercc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kusVFY8P; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kusVFY8P"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67c9616b4feso7720014a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 18:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779241766; x=1779846566; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbAWmpIeWrmIKRd0AiWx+CX2tvOghhIGhH7OVpuTfyA=;
        b=kusVFY8PKQLvTB+KtmwXcmVcvfP+4Fe81ZMcHgpevoSvG0kRoNwibFUVwE1xIul09X
         1IlbCu35Ubtx7eNA8d9Ql26vvl+SRefZRSCN7pX2i3gLdB+nVpWcsBVBxTYGCgcbViL8
         cqDS7Vi21fuzkHVc8MRMh3ymFoGeULI9hetGfMAd5mtUt73AVvzAvXOvmruiv0x1vWkp
         xsrOOCJz86IqeVngqILyWlAAUWmLrV9Yq2lEqyPZuALcAbIRdYpTu4FkGLid0If2aK01
         iyHFHZEn/mTOO7LbbUo4YCv0upaLswCR0O6nbl36aGll8Tjlea2Q91kJPjRO/qJtfbAG
         41XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779241766; x=1779846566;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GbAWmpIeWrmIKRd0AiWx+CX2tvOghhIGhH7OVpuTfyA=;
        b=Rea9Nst2JaXp6+96oWZd5REZgXy9HHy2BdJJHMtZRImQR3GDjvePOkuodA+QyZZWFz
         husaxJWnjj6jWM0edz8RjwgHKnz+B04C3cYpmxsXJr0utoc8dSeFd4Y3G3KmexYUaEUX
         q3XvZEV2bIaXlndz/tNTbHKud6meDXbkwm46/c2Y1dOTontXU9p8yQ/xKHc5tfIdNyPT
         1bfn+Caf7DTkCmQok0m/QfgNd18wVPUfPuExA+m8o53/3pKf9utH34MafoBQ+zI3OrOc
         x9w11k1x6VQpT+7rjwDI58I1b7ncLZRzfJ2hkbmgGwBYHco2GWb/84K9K7YbwuA9IT9P
         uDgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eSAT1In4CzfXD4JJA5rXnBUokPXteQFFH5yFo8RBEp6AYzFC0AzEZcy+iiMYRq0Ts3Zqh7noDY/o7zBEggaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS+DMWfQ9xo0BqyRAzXhCH4K0JaVRWd885cUzDfGg9Suc6GiCl
	1ad9snkuEKZRt/GYYS+vzwNcGr35oAKBNOEXoDl/SYDk1moj3TrStLa1TbPztg==
X-Gm-Gg: Acq92OGAGbAqh/1raviMBa+eNt5dmLwAZH6AHMFphXWDn5//Lgqu2dbn7lkq20BHYZZ
	NUmRi5UJHGCfSq2x9TRs7ZJHLIKWv4ZMjieXvltRzh3nohvFKHUSE/fC/IaBjcP97Spau9lQM0h
	zGig2jxB286zKvoO/atvclkeaPbLNQ7qRnJK6HQgqWdRJDEcK50wTot/NMV2iYRLg2HnOZA8ZjZ
	wGMbja2EnaazAcf/fDN+xcxO5JibB7JpgN5bKcJsphsylJxAazOej29eVOexLXToTzrgLFNQi+U
	AIKFxtLdG66mk67MzMrWF4ZEOHIK+hR+b0oBJUrf0OAoEG3z07BFI+b0v/eIjHqYGDFjoS1E/iz
	Wbfx86vbJUj/Hep1OuwcXx1y8UZMXMYYmwvWPREBy/GLpW3/egRYngBCkrxBNXJBvSxKwlRfR4i
	RpSKK2BCvtyvgcWNgL/TVIcyh8NefxiCTz
X-Received: by 2002:a17:907:8dcf:b0:bd1:2c29:a6ac with SMTP id a640c23a62f3a-bd517992f0emr1317114866b.44.1779241765510;
        Tue, 19 May 2026 18:49:25 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4ded99dsm770246766b.30.2026.05.19.18.49.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2026 18:49:24 -0700 (PDT)
Date: Wed, 20 May 2026 01:49:23 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Wei Yang <richard.weiyang@gmail.com>,
	Vineet Agarwal <agarwal.vineet2006@gmail.com>, david@kernel.org,
	ljs@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: check file initialization writes in
 split_huge_page_test
Message-ID: <20260520014923.zowt3fimptgzgju2@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20260512074924.27721-1-agarwal.vineet2006@gmail.com>
 <20260515092211.qkmaxcofxwfdexld@master>
 <20260518163553.447a45c54a3d419b9bb916ca@linux-foundation.org>
 <20260519025141.lguv7mrtvqgqpltc@master>
 <20260519121813.4b188b21f7280d6e1d9a55e1@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519121813.4b188b21f7280d6e1d9a55e1@linux-foundation.org>
User-Agent: NeoMutt/20170113 (1.7.2)

On Tue, May 19, 2026 at 12:18:13PM -0700, Andrew Morton wrote:
>On Tue, 19 May 2026 02:51:41 +0000 Wei Yang <richard.weiyang@gmail.com> wrote:
>
>> >Not understanding - cab you please describe more completely?
>> >
>> 
>> I mean do this below.
>> 
>> diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
>> index 460fa1f606fd..f30402ece608 100644
>> --- a/tools/testing/selftests/mm/split_huge_page_test.c
>> +++ b/tools/testing/selftests/mm/split_huge_page_test.c
>> @@ -469,7 +469,7 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
>>         }
>>         if (write(*fd, "3", 1) != 1) {
>>                 ksft_perror("write to drop_caches");
>> -               goto err_out_unlink;
>> +               goto err_out_close;
>>         }
>>         close(*fd);
>> 
>> On error writing this fd, /proc/sys/vm/drop_caches, we forget to close it.
>
>Oh, OK, that's a buglet.  Please send a formal fix sometime?

Sure, I am glad to.

-- 
Wei Yang
Help you, Help me
