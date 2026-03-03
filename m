Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA17B373C09
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Mar 2026 01:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772501987; cv=none; b=Wdj/TPOsd6dSDZ9byZKAREWiIKdK9eJ2Wbep/6VXaZS9C40+nKOf+FKTgnGF6o47oYT0TQWOb+ElnGtQSFkuBl4g3nrixDO1+iJ6WQ6QNKkL6/kSh1y2At4CQ7qhuy42mV1xXHIvbCcjIOUXqiYMTFd9/Jbwaw57WM29TOGhjDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772501987; c=relaxed/simple;
	bh=07/B/y6z/C1XZtHDENUbpuRm2gMOyQUCSFWgbN3Qaeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k7zhnXRlogDZvCufLadTW1y+NFrx7H5vWOlGqqI46SJAqk5JfumaTHotQVa9FSyr795ouNvFTrHtt02DKmmtG7o4I4YNNWrc/t+vYYR9vox59psFDloJzmYP8aWLZaDwDqmIiwi6rO1DZRJAir1oaCS8bGkHIK3dwRWoC7J6qR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=LAsn0EeH; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="LAsn0EeH"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-89a0b376fedso719486d6.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 17:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1772501985; x=1773106785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZPbZzuRu+dosfK2R7jpOlV1O8wbpx/a0Ic255VXuhAw=;
        b=LAsn0EeHSlqVmURyxWAjTLITLYmvdOhgO3Lrw3netcUSV2yvq2UbL5wzxzV7CSlYjX
         YoyLu9ZR5htKTCZztPuRdgqNrOFMVy3IoQZ1kRDvGr7x2DO+IczAXOgqdkdfWbMcBXuS
         LaONTfB9+tgD28gFI6IaTvgpwHMDFSbcvIBE/wpaS+vlr+PhDUoevWCd/VY1RRogEMKx
         klugydNlQczpWuZJGVkibtN1BOXSVD0FAv5x3HAMVyjZPo2JiMBHd689xsu0o+WZFukZ
         OgOg3x6kVUXrTt63UgRj4w2WBoHApHf24oPwn5cEgtJpoEMH5DR0xwlVNuRHCuAsVN9b
         gxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772501985; x=1773106785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPbZzuRu+dosfK2R7jpOlV1O8wbpx/a0Ic255VXuhAw=;
        b=b8/AXO6TZJs8SrDXKpthWNCvwJiBvN6bpmMlKVVSs7ZZLIhBL6IRRHG3jIhBuP3hzu
         dryd8UnWX5Dv6Ki49znl3gmhLCS17zW1HwoAjt1ZUQ7NViCGZ9Ct84VUhcc4l56A8ySN
         dOV/NJBdYdSWD6QumyMks9gkhMWwveGSheyXCNASebAYGGAfn/y7kH3mws6uUd/g6SqB
         ERg+R7gsb/Iy5oC6PEI9IUSzB5SyljQpDiyypyTsInYIZwjOwjOdvOqUq3KzhMv5pzAQ
         1R0i7yhW4CFYctDFueAzzMNn/HnJ3GENS3tFWseZnS5dArthkucU0ij2iUtBTbA0aRjn
         6HkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN92Tp8/iYS5Y0m/LQypydPvBDpS8SIZR02JOh70yECaDdpFv3I/77yJ8UXezK2jNK/oqgaMrphlYn3brUPlU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzphSBXivw6IPOra65VjVAfjSqObxrQxYs5jdsSmnG+HThmctVU
	GAK4oZjDe+df+BBAYvyuc24SAb72985ibm90hN9NiNlUoo346L9IzK015nnlqUyfM0M=
X-Gm-Gg: ATEYQzx3ld8ttvUezN9c+8123S4oGOjdu0pPTz4iACHP1FrcE8mhW9rKPLzXWWtL/ql
	4hwvvdiwa5kCQP65yKW6t3cktx8IEwz3mMiPmpesepHGCN0VfLURJmvuWDBJweiPIAYQCbWUZdY
	288a5lEVcgyeu8jvKqGZRFS9yj138ZRMtGsMKn6Y6iEuUqVxjTO1wDDtR/cGaH9XzAsLeAYR44W
	EaDSpirPcB4ni+2KPJH2DcakNroyDVfUMqWEMUpT19qttZhiTPgSQqB6Ip9Pf59TEP4VWmraxNR
	RRECnz1623ViQnxKLGPAclr8wmc3zX2XSzsnk8gUmT/5ehXafcv5WkmIoCizrbSR46CgBVl9SDb
	e5MHx308iddHiCqWNs72pAjoBfHLBfFiRyvvM03IEDFIIa2sLUjgRJ5WOf6G3HSdSr0tDE2TZ0A
	75Tuw4H1pSOzzl1sjZqZlLNo+66hNf0wf/Fg7Lp8V7T/bD9aIOa1ZHQ+fZ4Hu3OnAgLyfHUzvJG
	ulL
X-Received: by 2002:a05:6214:2121:b0:89a:df:164 with SMTP id 6a1803df08f44-89a00df0411mr54969726d6.39.1772501984767;
        Mon, 02 Mar 2026 17:39:44 -0800 (PST)
Received: from [192.168.86.87] ([136.27.45.11])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c7374dd7sm121117826d6.32.2026.03.02.17.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 17:39:44 -0800 (PST)
Message-ID: <e5c356f5-2be7-4d24-aa2f-f9d312b7a2c6@davidwei.uk>
Date: Mon, 2 Mar 2026 17:39:39 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] selftests: drv-net: iou-zcrx: wait for
 memory provider cleanup
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 jdamato@fastly.com, asml.silence@gmail.com, io-uring@vger.kernel.org,
 shuah@kernel.org, linux-kselftest@vger.kernel.org
References: <20260227171305.2848240-1-kuba@kernel.org>
 <20260227171305.2848240-2-kuba@kernel.org>
 <8489fcbf-ab76-48a9-a21f-d7f6873b9a2f@davidwei.uk>
 <20260302164642.43375391@kernel.org>
Content-Language: en-US
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20260302164642.43375391@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-03-02 16:46, Jakub Kicinski wrote:
> On Mon, 2 Mar 2026 07:49:01 -0800 David Wei wrote:
>>> +def mp_clear_wait(cfg):
>>> +    """Wait for io_uring memory providers to clear from all device queues."""
>>> +    deadline = time.time() + 5
>>
>> This is potentially a very long time to wait if code is buggy, as I
>> found out when debugging netkit queue lease. How about reducing this to
>> say 1 second?
> 
> Just to be clear -- you're saying that 5 seconds is a long time to wait?
> Please note that if this wait times out we're going to fail the test,
> the timeout does not impact the length of a successful run.
> 
> I picked 5 sec because with all the debugs enabled and under QEMU
> scheduling latency spikes can be pretty brutal. I guess I could make it
> 3 seconds if it matters a lot?

Hmm, yeah let's leave it at 5 then. Should not be optimising for my
buggy code.
