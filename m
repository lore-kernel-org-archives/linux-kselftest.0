Received: from out-181.mta1.migadu.com (mta1.migadu.com [37.59.57.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4063DCDA4
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 12:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.59.57.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786365336; cv=none; b=D4VxVBaYt4gMXjwkyEk3/ulfAm/7W/+Sg5sIVlpb94cG1eUvUhWZv/QkahB+/USXqw5Tx7CJAah4cucM3jO6pwfy1zBP83K4nher3KTTQW83LmnvQO2c7XjMXXPF+Q/8iOApKWdYRi/8+Vw5A+ITF/dgD03XLiHNJkPF5GZjpGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786365336; c=relaxed/simple;
	bh=tRnvbtYXXCCKv/R1JrVdB/SKpOD72ax0iFaEP0Nnlsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ok9wCLM9ydjghHjngLoxzksbDMl0qxvs9O40dD1NFSlBPjQyk0eRvn/8XmaXwNIh/SrpqRglrm6BDzyod9BiazgDGCY+R5rxHuLwaU8mf0rW2DRe2gADLd9iiMs7CQQtf1Zfw6Zcj1mQrnbvuImcoYPnOcdJsXvzi1E7PPjps08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NQFDq2nt; arc=none smtp.client-ip=37.59.57.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NQFDq2nt"
Message-ID: <f5459ad9-6fab-4924-a06e-c7c4f30c2667@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786365322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=15Js+N4mozVEN5C+cYHhkHu3+3LYuHv7DvmUOqotyTU=;
	b=NQFDq2nt7rbjJxe+rSKhPLPFXPhLFOcxnW1Z8iLmmZI8a86U/DP3eRehZ+Oabqg9Gsg+qf
	H56Ux5RguUFjlNW8urmGSj6A/WMeJRCvZ/reRDjvldpQVeNjA9XIXyTG1M5m/kEiqgmiHI
	813RZpia5ls221YsD7hjBUZukm/5mo0=
Date: Mon, 10 Aug 2026 13:35:03 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] futex: Avoid hash-bucket locking for mismatched waits
To: Thomas Gleixner <tglx@kernel.org>, peterz@infradead.org,
 andrealmeid@igalia.com, dave@stgolabs.net, dvhart@infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 mingo@redhat.com, shuah@kernel.org
Cc: shakeel.butt@linux.dev, hannes@cmpxchg.org, riel@surriel.com,
 d@ilvokhin.com, kernel-team@meta.com
References: <20260731192624.140399-1-usama.arif@linux.dev>
 <87v79lm0kk.ffs@fw13>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <87v79lm0kk.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 08/08/2026 10:19, Thomas Gleixner wrote:
> On Fri, Jul 31 2026 at 12:26, Usama Arif wrote:
>>  
>> +	/*
>> +	 * A mismatch here refuses the wait without locating the hash bucket;
>> +	 * a match is rechecked under the lock below before queueing.
>> +	 *
>> +	 * get_futex_key() runs get_user_pages_fast() only for shared futexes,
>> +	 * so their page is resident and the non-faulting read suffices, with
>> +	 * the locked path recovering if it does not.  A private futex may
> 
> That's a fairy tale:
> 
>        get_futex_key()
>           ...
>           // shared
>           get_user_pages_fast();        // gets a page reference
>           ...
>           folio = page_folio(page);
>           ...
> 
>        out:
>           folio_put(folio);	       // drops the page reference
>           
> Thanks,
> 
>         tglx

I will fix the comment if the discussion in the other thread hopefully
works out and there is a v2. folio_put() does not immediately evict the
page; however as you point out it removes the guarantee that it stays
available.

get_futex_key() has just resolved the shared page, so a non-faulting
read is "very likely" to succeed. If it doesn't, we get -EFAULT and will
then reach the existing locked check and continues to do what is done
without the patch.
