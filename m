Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF01447D45B;
	Fri, 14 Aug 2026 15:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786722963; cv=none; b=lfaytitfYAaIuYKDAKfN9+UbXfE68wJkj9s1elUFU6jhHvWBV+Em3YTFeYzeYU3uYaR4UeBqyH6QrrxqQIIl79UJSWIgrws0ln8FKaKF/PwULvh0ccUw5WQr4UEOuGbTFr5YoIasZsnCtS2IwPneb18bKB36MDFcbDTMHL1w3a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786722963; c=relaxed/simple;
	bh=aXLH830KRw6jEj6tj1rhcXgTkVaSyfklE5cFzPIhQLc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eaVX3mqtCg6vf9xMZTBgwT4VxSxWRYOXQR6/G0xnXO8KY7fWfmC0aKUNp0s00wMGaZclCFk+tpvDE2XM5m4ri+MCeBizE0/4g6DWf99AyLJbizGkQZyqRArQzyogI8h2Mvsi8PPKcwE7vhQDMr32CSUsFRuoJzu6E2IvyfVEvOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCetFngu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCetFngu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6689A1F000E9;
	Fri, 14 Aug 2026 15:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786722962;
	bh=9DQjE2R24G7K7jhL5NOUbQDIB10xSYNhKWyYZgFwgd0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=GCetFnguBnq+naz9WxGFP5E4L8NeNtmJwgq9mtNDPGAxOvzZKqMlHQ3ZiDW7I5jcV
	 ecNKm7zKXNbsHPzuGW0a2xbLmrN5XMjIodonL35Bmct+QRfQYkcOBApYyIhcdf5rqp
	 SXaTB4BVzObuhXSndTfYkiTOpanknB1KniUxfWl19wCoh3BgPOsyCLSuyUqS+HXm5Q
	 s69qBRn1bmWUlyo/x0Q66m2v+EAofhOkiXbzzoAP2vx+X3KAFbtQB+aJcEK8iZTqL9
	 FdT7r7VA+OxkERgC7Ejf/7YnMB+RJkumhejPWkrNBSjSqp1TZQQI6PeCXrZSpt0f+F
	 psN0e8ReSUUBQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Usama Arif <usama.arif@linux.dev>, peterz@infradead.org,
 andrealmeid@igalia.com, dave@stgolabs.net, dvhart@infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 mingo@redhat.com, shuah@kernel.org
Cc: shakeel.butt@linux.dev, hannes@cmpxchg.org, riel@surriel.com,
 d@ilvokhin.com, kernel-team@meta.com
Subject: Re: [PATCH] futex: Avoid hash-bucket locking for mismatched waits
In-Reply-To: <f5459ad9-6fab-4924-a06e-c7c4f30c2667@linux.dev>
References: <20260731192624.140399-1-usama.arif@linux.dev>
 <87v79lm0kk.ffs@fw13> <f5459ad9-6fab-4924-a06e-c7c4f30c2667@linux.dev>
Date: Fri, 14 Aug 2026 17:55:58 +0200
Message-ID: <87zeyolmr5.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Aug 10 2026 at 13:35, Usama Arif wrote:
> On 08/08/2026 10:19, Thomas Gleixner wrote:
>> On Fri, Jul 31 2026 at 12:26, Usama Arif wrote:
>>>  
>>> +	/*
>>> +	 * A mismatch here refuses the wait without locating the hash bucket;
>>> +	 * a match is rechecked under the lock below before queueing.
>>> +	 *
>>> +	 * get_futex_key() runs get_user_pages_fast() only for shared futexes,
>>> +	 * so their page is resident and the non-faulting read suffices, with
>>> +	 * the locked path recovering if it does not.  A private futex may
>> 
>> That's a fairy tale:
>> 
>>        get_futex_key()
>>           ...
>>           // shared
>>           get_user_pages_fast();        // gets a page reference
>>           ...
>>           folio = page_folio(page);
>>           ...
>> 
>>        out:
>>           folio_put(folio);	       // drops the page reference
>>           
>> Thanks,
>> 
>>         tglx
>
> I will fix the comment if the discussion in the other thread hopefully
> works out and there is a v2. folio_put() does not immediately evict the
> page; however as you point out it removes the guarantee that it stays
> available.
>
> get_futex_key() has just resolved the shared page, so a non-faulting
> read is "very likely" to succeed. If it doesn't, we get -EFAULT and will
> then reach the existing locked check and continues to do what is done
> without the patch.

What's the point of that exercise?

If the user access fails and it can fail with a page fault because
it's preemptible context, then the operation is done and returns -EFAULT
to user space.

This special handling of private futexes does not buy any value at all,
actually it adds a pointless conditional and makes the code
incomprehensible no matter how much effort you put into a comment.

Thanks,

        tglx


