Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5DC44E021
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791554908; cv=none; b=nTMfhjc7W88MqHVsNfXW6nrgjsS3NNDB+JaltCxqOrmEXrmrAIZ7jHkASerTue62uJ7J7EgAfI3kpf7AYBMNpdw7FQsNzekIsVRxlDecRkFYsWLWtGMPVA+P97kclF8xh8vKxVC0D6qFIYFHsVqUxyR5ZfinKbK9Jpk3aNRxsss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791554908; c=relaxed/simple;
	bh=5mSG/NBC8w5GCzj2/vawyONk6X286OkVdeh9HuVTQqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbYXdnT/L2Ojhf5gj/L5t1KClriX06yuy+FvBgPQVsHUq7JMOGXNCvxyWIlTtzSwvf/alP7H0BR0Trg08BJDtlpYb5XAyYrZUGvBV4NTKWfcEw0FNugv/vDLcvtE/wYP072LVV0XL45BTsRNMYXuR2hHEJCYKth1ITAEcuoP9Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHC0hauX; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHC0hauX"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2dc8cb0decso648108866b.2
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 07:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791554901; x=1792159701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UHiu5xDsf5v+fCY0BZIG/GtuTiSDrErnjbooFDt37U8=;
        b=UHC0hauXuv8K6JL3Cz1iG7f5QfHzerrC4XvyKd072iRfK8eq0qziwY1MOZzR3tw50z
         YdFgd457fuZU2Xeo5vVMTB72OKdnHPYKdj+qr93S+P0dZQrciVFVN8CRANIhWyd2grXd
         EEZvkNXPm2GY1Idn2bp4p2VzZStusXv3UQ3ytkAqq/NfZWx9xrRyY1eJet/4q5ikiU04
         9qS8S+P6cPXJYpDtFeTzdETV1+triRbv+esdAZPkVjgNUYeQsli17opltLDDXIfF6Z6k
         acNKGy0dWUEMXlsYu6YdVKivyxCsU9aCj1TLHzO4mWgd4zFi+7NJDJB22pLIr07xJh6N
         /u/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791554901; x=1792159701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UHiu5xDsf5v+fCY0BZIG/GtuTiSDrErnjbooFDt37U8=;
        b=xSPAqVx9KGXDIBDHGgyqzu8pWfhWTg+ZfgYqTk1mr8TyikpIEVwpaAKfDidtqKirVw
         bWDUSdBGCycxtBiGKFBSLV6lm2BR53lJNxIhuBuBZjLpZ7EmePbLHWAxNQEVrBHPcWyB
         h9t9kLMhjchRfhxaWtU0TixSuuxm0xAhsz4ru1pqPJ6x/kUw9pE/Z/pJYz3fj5H94JB/
         0GXd41ZQjltFVN1BiN9P1vnhLNwoixE6YA+JgUr4YKX/f1cvnT44GKESfist47xUKKTZ
         bb7Z9mCh/R6bfW6gF3CVqPfEJsXpSyoDhAcJSMQLyXS+NC2vflofMDWkRYCEITYJbTd/
         BnlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbzPpOLDPjcWyiMpvDkvuWZRpKwhuNve3s07YWe8X04xwTg9mz1wxczX8lXecfXlMyxRWtXc5KtSG5aCmTEQI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHudBoQYccUn6BlcGbuntov1m8jqPv5Qrzy85sBrYH94Cd4YyR
	zlzFhkV7Qw1LjJaIKlHkSKLQ6Yx+YyLUrvlYCxKIgV4YsY3k5OqIsrnI
X-Gm-Gg: AYBFou1d6auCNY9LpZHy0P5BuB27ZbDi4DtqQkOWZXgj+zCHEFBYJi8RdjHrdVRlrbR
	F27JySi5J7TUcCZ5M9qTxgfU/fl7cTm2HP0/8MEisrYJXdb4RBHjyBT5UE0SDpRPaqm0fyTqiST
	KX0zI5/NNHtkuyirG2uGLTu2DoeelQulj5iyqczD/q3NZ93a1qyp0e2kBVXRFUnQlmhFN6s62Ua
	ZrQTrgerka6tSb9xqHglYMS2yJ8nsdGddWG6Sif81283UNR1B2AUx9lxSeEpj5MnyjCGUuBW0cK
	4ZdOpcz+Eg1rsT7JuaJ1fyso8lbBJyhZWw1XTBFdMm2Pdt4icKtb2nwLF15wxCCrQJ0+zzm3+9w
	W2Q8jRyvY8CaNFeU18a/ILA7AaGS2zD5GzuiYR51nKLeMvodh/sZ3OKrOaYIfkrxQvbxzDxkPqr
	8Vb2tn5kFEvJl1f9MnRVWjxLEd+bCHsIJnvr+6RGI2L6iDvcbNmjDHDsZSeuGJdZesekqvmpVW2
	B+pR5EwjDOXzN2gJ0youknBZV6Uk4t3zMDXRQ3LINVPTxR8iSzJnuso5lgsBjH9+3ndGpz8i8Ws
	SDo=
X-Received: by 2002:a17:906:c110:b0:c2e:32d3:1b5 with SMTP id a640c23a62f3a-c31aa079e98mr201069166b.32.1791554900723;
        Fri, 09 Oct 2026 07:08:20 -0700 (PDT)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3bbc9sm97535866b.20.2026.10.09.07.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:08:20 -0700 (PDT)
Date: Fri, 9 Oct 2026 09:08:12 -0500
From: Ming Lei <tom.leiming@gmail.com>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests: ublk: make the fault_inject delay a pure
 timeout
Message-ID: <asj1TNs1XLIAzUQ6@fedora-laptop>
References: <20261008-bug-ublk-selftest-fault-inject-delay-v1-0-a96af7ead06e@gmail.com>
 <20261008-bug-ublk-selftest-fault-inject-delay-v1-2-a96af7ead06e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-bug-ublk-selftest-fault-inject-delay-v1-2-a96af7ead06e@gmail.com>

On Thu, Oct 08, 2026 at 10:45:40PM +0800, Qiliang Yuan wrote:
> ublk_fault_inject_queue_io() queues the delay of each I/O as an
> IORING_OP_TIMEOUT with a completion count of 1. Such a timeout also
> completes as soon as any other CQE is posted on the ring.
> 
> With more than one I/O in flight, the completion of one I/O ends the
> delay of the others, and ublk_fault_inject_tgt_io_done() reports every
> early completion as "unexpected cqe res 0".
> 
> Pass a count of 0 so that only the expiry of the timer completes the
> timeout.
> 
> fio 4k random reads for 10 s at queue depth 4 on a fault_inject device
> with --delay_us 1000000:
> 
>                             before      after   expected
>   I/Os                     2263170         40         40
>   mean latency             16.3 us    1.000 s        1 s
>   "unexpected cqe res 0"   2263169          0          0
> 
> Fixes: 81586652bb1f ("selftests: ublk: add generic_06 for covering fault inject")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
Ming
