Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254812C21C3
	for <linux-kselftest@vger.kernel.org>; Thu, 18 Sep 2025 12:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758197238; cv=none; b=ZfuhqyAroTfw32AhYkAoAJd0bO/ZPq5LRHHD2pEFxQTaAeqjOImeak7B/svisHUwYvveBYoR74wavgMLZkKbIRJPI/OhbR+Uy5DgmeKSIRpylYrvMldwWhLS2XJ6XNvcLewHiElyAt4lF++wzjTl42/0hx0ifZOjZsC+fwbplqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758197238; c=relaxed/simple;
	bh=jR2z4/Ns/toqEftPGwsWqkvDKxdd+Tns4ocJdbX6gEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l/ui+7YdCj1Yvp6JCZGqt3m3gqNepb3K0vFw7hHS8aT78CWpq7YU4b6OXKuUN/hWytfoGUQ54dtHKG+WJIaxTBnH0GlCtZJV3ghBaEw3fONNkT1tAynk2tB4lZnEUAwDAdaA/yXH6/5DSlc92zd2XOoUdNUQerSGn0J66l1tqPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FBHcFR0s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FBHcFR0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758197236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2DOPYjdyI/uAYvwMzh9uSYuRR4ZAJRzMcD+yFLiyXXI=;
	b=FBHcFR0sHYPDRTLkK29Xp55L4rA28SIS2Z0cR+ew6bY78KrGK8AjSU2RKG0rxo7Kwlnfyi
	zap5wMxdJUxLdcgPTidddDVo/k8vYvazZgX7w2SA4cO4bRxKAw47EaLDSVsnqq7o95s0WV
	oIeNfhfN7FXkOa03ABJSw/gjtnDXrJk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-DZhVdmynMbWY2tPo4gw9cA-1; Thu, 18 Sep 2025 08:07:14 -0400
X-MC-Unique: DZhVdmynMbWY2tPo4gw9cA-1
X-Mimecast-MFC-AGG-ID: DZhVdmynMbWY2tPo4gw9cA_1758197233
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3ea1550f175so405365f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 18 Sep 2025 05:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758197233; x=1758802033;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2DOPYjdyI/uAYvwMzh9uSYuRR4ZAJRzMcD+yFLiyXXI=;
        b=B20NWvsYolJgwXVzi1aoTpkfInmzXMKvK61Kk69dQuYs+KWRc9P6jNJ2AwrjyOwKdI
         wW3ohmjjVLRduGofJnYzdmAXpnIOBHfIn3ot/RrZANFoLcDrN9sJezdaYfbtzwdHVmwy
         lxTKG4Y4IUZ0cFdqp0C59VK3UWENr37F7U+GmBHdjyg1k88kGEH0wf8Nyqk5VYq2Dt3B
         JJEt1MzacHTik8+gUgloWVicEeRY0i+FYedQ6r9Om3JUF+AlxZbq3krlwe43aQEv0q6M
         OQARhZw1u2vssmWbv8ixHnhWI3yzIrNM116ivi3cCb1AVfobvIkheS9onRziIqgBfmLz
         QiOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfQKWBq5tTKpQKXAxpMAswcyN2rf+VFeCrVNncDG8YEDMLcvYZ/2ML6G6UWJXmL6vqGkn6KMQw2tEYu2IiZDY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg0ZY/nGt0Z1DDeiboLWXfbRy1+700FEz+EvL4v4zjfT/Ssnuy
	b6xzmivGe8s+GK9ET6pI1nZHMdx4zY1njj+2gfxlv9x6vmYl3o8TvnVEQ7GpLBQVnDZWAvxAZeF
	9v0xM8T47SxFiSO+KtyxlhDE4nngxAtv2MECkiGQEdk2z0avPF/5FXn/ylUBe/C62yK+prQ==
X-Gm-Gg: ASbGncvgWgkMyxfkfLCq1lJpIwLhmKdHumLZfCu/Pb0nku+rIoFfjOfjmFpv1sOA1JF
	qiKmmZruSNbp0VOu9zBrqt+HAPsnZYRd8gQLfzWf9Kc4yhX9nrPIdwIbjCrKpd6Kf2QePKaF+p7
	lIcmwvHRKxEheny+gFkK3skCOE+h35aNI7gT0krq+sAOijJpedjNEGgDq/8OhKmniQgqsv+JPa/
	bOXQlfktPw3F1mA5OrKMoEbuuohI9yH+z4GBOqdGk1m3IazpoYm0X0JCHezRumLrxwr2R1sUUp1
	4U81O6REbZzAdWA8rVgCjWfmTy+cbl7vyQMyg449gTYQ/aZDUOtLNjva4UhVsoEYByM85jX1Dlp
	22bjB1a33ReSxvvJsT6hLc1JsjDyO37QbimKaCnGw31fO25DazGUdWVXnaLXsKh6NTD+D
X-Received: by 2002:a5d:5d10:0:b0:3da:e7d7:f1e0 with SMTP id ffacd0b85a97d-3ecdf9e6289mr5690007f8f.27.1758197232587;
        Thu, 18 Sep 2025 05:07:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIyAUyV0RX8DkIW+uDkvTX0Rh9rKHG8DzLg3Q/ZTX8yNIVuNU0lPJSNOJoMqZHCKyGphxyiQ==
X-Received: by 2002:a5d:5d10:0:b0:3da:e7d7:f1e0 with SMTP id ffacd0b85a97d-3ecdf9e6289mr5689931f8f.27.1758197231973;
        Thu, 18 Sep 2025 05:07:11 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f07:dd00:ca9c:199e:d2b6:9099? (p200300d82f07dd00ca9c199ed2b69099.dip0.t-ipconnect.de. [2003:d8:2f07:dd00:ca9c:199e:d2b6:9099])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f64ad359sm45788935e9.22.2025.09.18.05.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 05:07:11 -0700 (PDT)
Message-ID: <0c068e35-0954-43fd-b3b3-20786a6a12fe@redhat.com>
Date: Thu, 18 Sep 2025 14:07:09 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] vma count: fixes, test and improvements
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Kalesh Singh <kaleshsingh@google.com>, minchan@kernel.org,
 Liam.Howlett@oracle.com, rppt@kernel.org, pfalcato@suse.de,
 kernel-team@android.com, android-mm@google.com,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <kees@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Valentin Schneider <vschneid@redhat.com>, Jann Horn <jannh@google.com>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20250915163838.631445-1-kaleshsingh@google.com>
 <20250915153401.61cbd5120871ee7a4e5b9cae@linux-foundation.org>
 <aa95777a-8012-4d08-abcf-7175f9e2691c@lucifer.local>
 <20250916191645.15aae276992acafe7f7e723e@linux-foundation.org>
 <e85d0b14-28dd-418f-872e-57c0127ad572@lucifer.local>
 <20250917163231.b5f7b8012367f033a91e6f9b@linux-foundation.org>
 <cfabded7-442e-40d9-963a-597a42da581e@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <cfabded7-442e-40d9-963a-597a42da581e@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.09.25 12:29, Lorenzo Stoakes wrote:
> On Wed, Sep 17, 2025 at 04:32:31PM -0700, Andrew Morton wrote:
>> On Wed, 17 Sep 2025 06:36:34 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>>
>>>>
>>>>> Perhaps being less accepting of patches during merge window is one aspect,
>>>>> as the merge window leading up to this cycle was almost the same review
>>>>> load as when the cycle started.
>>>>
>>>> I'm having trouble understanding what you said here?
>>>
>>> Sorry, what I mean to say is that in mm we're pretty open to taking stuff in the
>>> merge window, esp. now we have mm-new.
>>>
>>> And last merge window my review load felt similar to during a cycle, which
>>> was kind of crazy.
>>>
>>> So I wonder if we should be less accommodating and simply say 'sorry it's
>>> the merge window, no submissions accepted'?
>>
>> hm, I always have a lot of emails piled up by the time mm-stable gets
>> merged upstream.  That ~1 week between "we merged" and "-rc1" is a nice
>> time to go through that material and add it to mm-new.  I think it
>> smooths things out.  I mean, this is peak time for people to be
>> considering the new material?
> 
> I'm confused, why is the merge window a good time to consider new material?
> 
> People have the entirety of the cycle to submit new material, and they do
> so.

My view is that if you are sending a cleanup/feature during the merge 
window you cannot expect a fast reply, and you should not keep sending 
new versions in that timeframe expecting that all people you CCed that 
should have a look actually did have a look.

-- 
Cheers

David / dhildenb

