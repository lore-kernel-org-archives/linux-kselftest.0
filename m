Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB66D42E8FF
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 13:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785503001; cv=pass; b=Uw4EHrHp8TUpdzoFUCzE8Q04VYzgw13ZG3n97JIyRwzjlt7+KI8IoEN8TFtUcuzqbNmQ8VT/SonlskTCUewMXUJaGSZA6ZurmJDeRUZI5VHR73+EVbEegtoIpTdqZnLgtopwiWP4uFi/ezs3okJeTp/epSKtAh0BbnpGAwS6tiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785503001; c=relaxed/simple;
	bh=IMWMnLbQOy6b9tEx6TPxB/pT3EmTOMY8ss6oX8Lyp+A=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqDalm37v+GxcQpsCma228a/s/Yy70id2biLcseuk34e9seI5cMkKVk8yDf8vxmob7N5UfXsPVl9WihERFLfLw/GCBMEWVmErbz0/ji19EmcA/ziL05+78ivGmmZmO8pogIfzl7c7YUtxHGAMyQo7wsmsYDNgHFwj5kP7eReb4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fwvZ3Eda; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fwvZ3Eda"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso989457a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 06:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785502999; cv=none;
        d=google.com; s=arc-20260327;
        b=MS8qpPrcqeOXFgd5WjmlxL49fKPqPeufVaoo1ffxKg3nGVi//BFzxsJ4umRk2juV4F
         JH1v2z38744MvtZNDDB7oRZqP9B6iV9ICajnqsk4VKX0u2d0LbSyyoM4ntiZx7WtACc3
         1iYJlZg1hHGtS/hPkJnPJLPGqLf+dhaSV7R+24Zp0jeVTSwTGp+Wnk1mhwbA3aKvS/FS
         6qeKnqBirQqqId7EbPoWXe+cSJivjh42VkhCPvO/iezaGAp4RQDiDRunz+NkNhqska7Z
         RZvCM+k7DWTPvPxMi0+fqLg4jYbZ2HmcqwNJHxjIhSRn5kGMlrTOEzFn/gd4KtwsQ5q5
         piNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=J+eugezfVQYSMU5tvUvWbSgw3mM0uud+rXMj1ASY7rI=;
        fh=wwJJncy2flLj+N6y/yU1++n5t4UbQMmQzMf4933j9fg=;
        b=E2KzSEXK0XIidNc1hssP9xj1BZ/56F4OpVHejOraOi8cd1aPW4sXFeKxOxxLnIRatw
         auoSjMtW878Qde9y6ExsY/ZXLd/2HDX6gQKYyOy0wy0sD7UVq2FMdrFdoXXREsaut8PS
         HkE1GGerrVaxcexAOx4PzXpOGw39G1/+8EGxjj5639i4/Oot62jFHYDBPZ7UyFjtl2Hw
         h2aQg9jUsUW8FYlFkDt+1FfF20ngAzHzlrXSgehgHnVJdvMB23BQRC1/7Z13SGfglgAA
         FLomxZ1ePkY3bzCQTMXyQMhNjeA15JQT9BoCPEUwgwwnHjQqKILhy1o0CJOhFGanu85Q
         XcqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785502999; x=1786107799; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+eugezfVQYSMU5tvUvWbSgw3mM0uud+rXMj1ASY7rI=;
        b=fwvZ3EdanYTcZntQg6z5shQh35bHMua2dGwtzgsNtVN1L35Ca+5jn+1clB3d+LYIaY
         2tnwbzAC6BXPwagaN9gBMq3A6igRT1JBvctvagRW8irJ3iiVVFWzF4hToJrNY/J/P8PX
         MxtNu44klSDkXSlNu8SAPZxAeAE4C0lcygMDe4swh4vwz6YS0rWN3p2mHyFQOBfvJwfS
         gwotFjae0HUhjyvC4kweshgj7u7WAQWcfl30sWKh1LaCQVdg7oi9JoiYAwVoDu6xoCWI
         wIg9eoLw8FC5vqT4jfLR/B2qLMqFct4yNrtGhCL4V0oUXCtZoCapXg9Fh+8TSOPZeCHB
         Rbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785502999; x=1786107799;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J+eugezfVQYSMU5tvUvWbSgw3mM0uud+rXMj1ASY7rI=;
        b=p7MgdVm3Bcjgiu6HrdR+u9QxlW07nVPXkQw70udg1CkPnhFHo4T6HJutbJVaAhmeRz
         ju/VlFho8mU6fdwM0RzjodijgKgBbWQaOJP4LcGlzIxZ3sCsVmuLvm3r1iS1Peyb2vrT
         CK05QDqKDGnDzj5JO7OajuDagO4tdlQX7qaYbFGtD4oxJyT+zdbnOz0gXZRe89mwFRue
         nlWG02cBzin+sKk7QrysWHlccpo3Nng1rKC03S1EMJXSk0jjyR0iZ7DIvn0ug29D/Teo
         GtEcbzweythJ2yr7XOOuKCgItlAWoQ4ZSJMxWev6cpRoAgW4t/7RW9mpncPW70x85LBU
         DbYw==
X-Forwarded-Encrypted: i=1; AHgh+RqioA4M5gBC68BSMfRL8K7sJtDZ6x4N5+V1y8L3TkLvUA/pDQuCIBxBoOayc7Jb3VJSElYz7IvlPUnpTF879uQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUdNxf9gkcjsemb2LFYqW18rd79nlxb9LttShpWZbZZcI3NaPB
	HGxxYQQCqmbqQXdffiJ03CPg5G/VuuIp4keTnXaIMgHg0/ZZ21r0M1MIYM3DfD3pqB3bNtooZkF
	k7Mv/9lRGqA+2k26x0ccQwdmEGbVYoSvNP9Da8eTh
X-Gm-Gg: AR+sD13fa/LSPGRIyVQUx4H0xt6ETKj+cUxa8w/cMZT9b/dYpduBPrScaI+4TWwn/ha
	Lzj+kkrnW2YgneQUkA6C7TwG3XVhWY3mCuwtSXbjQbFzl7rd4PxGEF+w3xI3ZD0oWI1cFbx61af
	hyyIH8KgW7eDq0Uxe9c+YQ6Xs8IpLL3M6aYx8Eepl5QfFr+1EYfPCOLQX6KqJzVZ7Fo6BtVhgKD
	K4tXGUObqSd1/6ajAKuLcwYM6ZOz2L8Hp5YQiVM5qLHoS459T3G7qJm74n+Yg7ty/BjoWqBqRR6
	beDBnc6DCIhemJYmvBFtm8TpBbjnSo032h/845TxlUwisS//eAH/GMZ1WIo0tn2DxdCT3u/4FZN
	X
X-Received: by 2002:a17:90b:1345:b0:38e:655c:6516 with SMTP id
 98e67ed59e1d1-38fb0e7d036mr2121478a91.0.1785502996836; Fri, 31 Jul 2026
 06:03:16 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Jul 2026 06:03:15 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Jul 2026 06:03:15 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <edc3566b-370c-41a0-a71d-2e4a0e1a94f7@kernel.org>
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com>
 <20260728-gmem-inplace-conversion-v9-14-35f9aec2aed2@google.com>
 <4460e252-b6de-4df3-bea8-0368a9d0f4ff@kernel.org> <CAEvNRgEUQSju2tW_1zMk2=QmveZNtmkjjCZdqVBgBD2JPh0k4Q@mail.gmail.com>
 <a823e3d2-8acf-49d9-a812-ac1bb2136d7f@kernel.org> <edc3566b-370c-41a0-a71d-2e4a0e1a94f7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 31 Jul 2026 06:03:15 -0700
X-Gm-Features: AUfX_myvtAX7kCr1AZOI0RcjaLMvHuuJT4jX9i2y3E3Aj03MfOs1jY1iA4ExW_o
Message-ID: <CAEvNRgEas_9BEV-cNxXu4_wQx8sR2M4_OaW6DEd4=fszALMV0w@mail.gmail.com>
Subject: Re: [PATCH v9 14/41] mm: swap: Introduce lru_add_drain_progressive()
To: "David Hildenbrand (Arm)" <david@kernel.org>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "hughd@google.com" <hughd@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 7/31/26 12:22, David Hildenbrand (Arm) wrote:
>>>
>>> I didn't really like this either, the drain_state thing is really
>>> awkward, but in both usages (collect_longterm_unpinnable_folios() and
>>> guest_memfd), there's an outer loop where if the draining happened on
>>> the local CPU before it should skip straight to just draining on all the
>>> other CPUs.
>>
>> Just nasty :)
>>
>>>
>>>> I was hoping that we could embed more logic in a helper. The history [1] of the
>>>> refcount check is rather sad:
>>>>
>>>> https://lore.kernel.org/all/c5bac539-fd8a-4db7-c21c-cd3e457eee91@google.com/
>>>>
>>>> ... primarily because of mlock() handling.
>>>>
>>>
>>> In the original code in collect_longterm_unpinnable_folios(), I couldn't
>>> find anything that handles folio_test_mlock(), so I was lost for a while
>>> until I realized mlock() doesn't add a refcount to the folio.
>>
>> mlocked folios in the mlock cache hold a reference as well.
>>
>>>
>>> Are you kind of proposing an optimization to
>>> collect_longterm_unpinnable_folios() by adding a check for
>>> !folio_test_mlock()? I hope we can put that in a separate patch series,
>>> I'm still hoping to get this series in for 7.3!!
>>
>> I was trying to avoid messing with the refcount for ordinary LRU cache pages.
>> mlock() should be a corner case for guest_memfd.
>>
>> Relying on the refcount just means that one unconditionally performs a lot of LRU
>> cache draining even though it doesn't make any sense.
>>
>>>
>>>> For guest_memfd(), would mlock() ever apply on a path where you need that check?
>>>>
>>>
>>> For guest_memfd, if a folio were mlocked, unmapping it would fail, and
>>> so the refcount on the folio would be elevated. The
>>> kvm_gmem_is_safe_for_conversion() check in the patch after this one
>>> would fail, correctly.
>>>
>>> I really wanted the caller of the lru_add_drain_progressive() function
>>> to control whether to do the drain (see below), which would solve the
>>> mlock problem by not assuming the use of folio_expected_ref_count() to
>>> determine whether to do draining.
>>
>> Again, the problem is that on *any* raised reference you would drain. I
>> was trying to limit the harm.
>>
>> [...]
>>
>>>> + */
>>>> +static void lru_cache_drain_for_folio(const struct folio *folio,
>>>> +		enum lru_cache_drained *drained)
>>>
>>> The main thing I wanted in the proposed version
>>> (lru_add_drain_progressive()), was to let the caller determine whether
>>> to try or to continue draining.
>>
>> Why?
>>
>>>
>>> I wanted the caller to have full control over whether to drain or not,
>>> so I didn't want to pass folio into the function. I thought the caller
>>> should first determine whether to drain, then call the function.
>>
>> Why?
>>
>> That's literally what the existing refcount check tries to do: figure out if
>> there are LRU caches.
>>
>>>
>>> This version assumes that the caller wants to continue draining based on
>>> something to do with a folio, and the folio may or may not be on the
>>> lru_add fbatch at all, which is a little strange to me.
>>
>> I really don't understand what you are trying to say.
>>
>> Draining only makes sense if something is on the LRU cache. And there are
>> better ways of checking that than relying only on even less precise refcounts.
>>
>> If someone wants to do an early refcount check to abort the overall
>> operation, that's fine.
>>
>>>
>>> Also, this version enforces a certain definition of "expected" number of
>>> refcounts on the folio. I guess in this case this definition works with
>>> guest_memfd, but guest_memfd doesn't support swap so the swapcache check
>>> in folio_expected_ref_count() isn't necessary.
>>
>> ?!
>>
>> That's why we have the universal definition of expected references and the
>> common helper.
>>
>> Because pagecache pages commonly don't support the swapcache.
>>
>>> Also, if the definition
>>> folio_expected_ref_count() changes, then guest_memfd is implicitly
>>> affected. Not sure if the "expected" definition is the same for all
>>> callers?
>>
>> It must, because that is used all over the place. The only thing it
>> cannot deal with is references held by the caller (which could be supplied
>> through and "additional references" parameter like we do elsewhere).
>>
>>>
>>> I guess if there was a function named
>>> folio_ref_counts_indicate_presence_only_in_the_filemap() instead of
>>> folio_expected_ref_count(), then it'd be the perfect function for
>>
>> You're not seriously proposing such an abomination I hope?
>>
>>> guest_memfd to use. The current definition of folio_expected_ref_count()
>>> also includes page table mappings, but in this check guest_memfd really
>>> wants to make sure that there are no page table mappings.
>>
>> You can just check early for mappings.
>>
>> Remember: this is about LRU draining, *not* about your final
>> "unexpected references" check.
>>
>>>
>>> This version folds folio_likely_lru_cached() into the check, and I
>>> adopted the check for guest_memfd because it'd help with huge pages,
>>> though technically guest_memfd is always 4K now so the check is also
>>> pointless.
>>
>> Who cares if we end up with a common usable helper? We have usless
>> checks *all over the place* in common helpers.
>>
>>>
>>> I tried a macro version of this where the macro caller can pass in a
>>> full condition, which would look like this:
>>>
>>>   lru_add_drain_while(folio_may_be_lru_cached(folio) &&
>>>                       folio_ref_count(folio) != expected_refcount,
>>>                       drain_state);
>>
>> Yuk.
>>
>>>
>>> but I thought that just created something people have to jump to, to
>>> first understand how the macro works, so I left it as an explicit while
>>> loop instead.
>>>
>>>> +{
>>>> +	if (!folio_likely_lru_cached(folio))
>>>> +		return false;
>>>> +
>>>> +	/* Try local draining first, if not already done previously. */
>>>> +	if (*drained == LRU_CACHE_NOT_DRAINED) {
>>>> +		lru_add_drain();
>>>> +		*drained = LRU_CACHE_DRAINED;
>>>> +	}
>>>> +	/* Try draining all CPUs next if still not an LRU folio. */
>>>> +	if (folio_likely_lru_cached(folio) && *drained == LRU_CACHE_DRAINED) {
>>>> +		lru_add_drain_all();
>>>> +		*drained = LRU_CACHE_DRAINED_ALL;
>>>> +	}
>>>> +}
>>>> +
>>>>  /*
>>>>   * Returns the number of collected folios. Return value is always >= 0.
>>>>   */
>>>> @@ -2266,9 +2316,9 @@ static unsigned long collect_longterm_unpinnable_folios(
>>>>  		struct list_head *movable_folio_list,
>>>>  		struct pages_or_folios *pofs)
>>>>  {
>>>> +	enum lru_cache_drained drained = LRU_CACHE_NOT_DRAINED;
>>>
>>> I also considered an enum, but it would be another thing to export. I
>>> was thinking to have drain_state just be opaque to the caller and the
>>> only thing the caller needs to know is to initialize it to 0.
>>>
>>> Perhaps there's a better way to "make it opaque"?
>>
>> Putting an enum into a header is a problem in which universe? :)
>>
>> Ackerley, please stop making up stuff. Having generic helper is not a problem. Doing
>> checks in common helpers is not a problem. Putting enums in headers is not a problem.
>>
>> Your version is just bad.
>>
>> I can later try something that keeps the questionable refcount checks in place,
>> maybe that could do as a temporary solution until Hugh possibly finds a way to
>> remove the need for draining entirely.
>>
>
> And looking at it, the current folio_ref_count() in GUP is entirely wrong
> and always makes us drain local+all.
>
> Let me fix that first, which will also modify this code.
>
> I'd say, to unblock gmem we could have something minimal that I would clean
> up later, but I think the problem is that lru_add_drain() / lru_add_drain_all()
> is not exported, right?
>

My bad, I totally mixed up refcounting to drain with refcounting for the
safe conversion and didn't have a complete understanding of mlock().

The problem for gmem was that if there was an elevated refcount on some
folio in the range, it might be because the folio was in the lru_add
fbatch.

If it were in the lru_add fbatch, it would be fine to just drain the
lru_add fbatch and proceed with the conversion.

lru_add_drain() isn't sufficient since the conversion might be handled
on one CPU when the folio is on another CPU's fbatch, so I had to do
lru_add_drain_all(), but lru_add_drain_all() causes IPIs which are
expensive.

In an earlier revision I exported lru_add_drain_all(). My understanding
of the discussion at guest_memfd biweekly was that Sean didn't want us
to export lru_add_drain_all() now, and then end up exporting some other
function and unexporting lru_add_drain_all(). To avoid exporting and
unexporting, we then said we should refactor now.

Happy to go with your proposal too.

> --
> Cheers,
>
> David
