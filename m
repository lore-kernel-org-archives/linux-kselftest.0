Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F92284690
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 09:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355185; cv=none; b=JljtlBX4WhOp+s2tGjsOc6jtKyvrOYrD05FcUiDvPh50uxwQKLbfhtAcYcdMHFUMSBrFXJ5tQinLK3p3vfRb6UalZjic3FIicD90g+UrEMo+QmNE8NDbCV5xmXSdw0MkTmeRKUz01YQuzBliSTREjLXZzyccIdnfq11zstQ9Omc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355185; c=relaxed/simple;
	bh=TTky72bnFCHaUeW5+GhYHQPHj9fDXx4V3L1F7gvWw1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B5/TWh+VPhd9xy+ZArVRonIIqEToAH2f0lHgcngO3G8dVxgh5qTu3Y5yObgQ+cBiuMMTDhVj9JK78DNN+MupYbK+2mzOIFaMSzwglk4NRsV4vbwWTC/TUqNWsijkqcTRBlfmgUsPaBjABksxOUC3TQQbFQoxqIwvG9/MUGCNVMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aq85GF9T; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uAlE0iq3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aq85GF9T";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uAlE0iq3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779355183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=80AWROfwgrfMw4Jeo4fXlxu1uCZz/hRH8+EJw2PCQJ0=;
	b=aq85GF9TbY6JK20133LkCTm7nBXl4MpRlZDV+FGKgj7edEml85nLnNH4tSek+CT8WQ/u7q
	X9nog1wp1DlHJFM425qDXGloSsdUM2Oy6ToDh6C9x3aZy5JIzT3K5iO8Zc0Pr2sqUpaFFk
	O4VFwDsdNgBkmHlCtjpydKDqjTMafMU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-4P3TeePNMnOxDW4FKt6hVw-1; Thu, 21 May 2026 05:19:41 -0400
X-MC-Unique: 4P3TeePNMnOxDW4FKt6hVw-1
X-Mimecast-MFC-AGG-ID: 4P3TeePNMnOxDW4FKt6hVw_1779355180
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48feb0298d7so45684005e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 02:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779355180; x=1779959980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=80AWROfwgrfMw4Jeo4fXlxu1uCZz/hRH8+EJw2PCQJ0=;
        b=uAlE0iq3mWrgI8GmYRE8Bt4j/bZZLkjiX7Ge1bnNz/+bvBiFs5+ctpx9mLxKcrCKrL
         yelfqBf+SonITmlrmeykzNb4sYLCUlNCfxn2090g2FfYpWoXRROR+IQq5potMZ6My5Au
         mKKO4F2g8Uoih8vRgHMnM+jGpfEgqaoDJacQalwaKLMSkNbUsStt/AWqDgjqeIYigYK1
         0ZOFG+wevFGPjSsSBM+2cm70rd6fNtKYS+tj+P4HoJX2V5ig2sXKro8G+xqmBucnFWF0
         74xi25hutGJ1unX0mXaZxANqzGY1RoN9HWpo++V0PkCRSYthBqP77Z8LDi5yYleeExHR
         Ncyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779355180; x=1779959980;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80AWROfwgrfMw4Jeo4fXlxu1uCZz/hRH8+EJw2PCQJ0=;
        b=WaTninTMB09s6OJpYtHpfR0GRsE5X0wZWdOcARVfNB7cGdTIy0X0GMprEXPkUwtmTv
         6QYOGCAatbkxr98k59k62QkXYAbmP+RFW/bL9S77S+drBjy3NGy+x4kBtCaYGDjVAmBE
         fuM9197Za8rDXNAK1mJJcYEzoP2rEGBEjh6scaNQVOKf4zKsD0cZkUkYVYPj2FLNvV9s
         B9Q9LzkRp/0Mhi1FJQFeOd9ZBsXriAS8CK/YdrHUyRXtHXBJYT/VT2jER6uINisNeoW3
         Dakc5NldUIzHW+Tq4l5r0oYEwRMlI/CmhAqzSxHIHqGi6KsJ27b2OX3f/gt/xIR+BVtJ
         K4gg==
X-Forwarded-Encrypted: i=1; AFNElJ8kw/3fLyYjYRpCn/aQL28JAEA4dJcKYAhuWWVubb8d+eonNwJeQRkxkWtALCxU52gA4P0CLuKDnkus+QIvVCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoJ2rWRI2T7ZZTsOOsHpyXh3/lqk9+yKT71N130F9syk8Ng4/G
	OsLjiS1Lcwz+GWBl9QI/M2troU418cTQ2s23NkOJl3SSvSnipZhi7VzpPPIZ0mjw4mqYhzpA6Gw
	2nC5/fGn9XuxjNQ7WRpUPhxLGGULZWCH/13lcNkbgpnQHJwetR94CqSRSNCkz/+W5x7a5IQ==
X-Gm-Gg: Acq92OGCWUbGsXQVCJpFAH9EN0Zk+36WDSHTFHtwg6czc0mPLe5rbAjYVYYeBiC/Md7
	0l3VMXbA9ASx0UeeZiPnFYLl+V0ldpoCHQ0lem4UctYJJFWkmXn0s/kDL0KUx/2Db0bp4jTSBy5
	G5pQ7zZZeVlvUjN6WNCZLvUQ4Qz79YSCtYgzOJqlizQSoiHeMwnS6G0FSKxydOQ0IcHVm9O/9DM
	HO1V3l1+/FVgNpsjYN9/Jm9CmtSh4GVZ+YHcLqPXVmlQHh1/Trm9HAxT/8ZzMy7GMPOE/a84g3p
	UeERSZ4aYb/BLmsqE7NAQ1cRFe8ggp1eIH68sDcq+ivmp5RLaA9zf5ZfOK/FZy96Blw9e5z/V1P
	a0CAJrJ0eFzrU632NMwzYs2tD5tlxW/C6m7EKjqKwAmO57x2/vxkB7xFkgaawbty4yL30
X-Received: by 2002:a05:600c:34c3:b0:48f:d0f7:78f1 with SMTP id 5b1f17b1804b1-4903604d089mr31722695e9.4.1779355180231;
        Thu, 21 May 2026 02:19:40 -0700 (PDT)
X-Received: by 2002:a05:600c:34c3:b0:48f:d0f7:78f1 with SMTP id 5b1f17b1804b1-4903604d089mr31721925e9.4.1779355179765;
        Thu, 21 May 2026 02:19:39 -0700 (PDT)
Received: from [192.168.88.32] ([169.155.232.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7dab28sm1515576f8f.12.2026.05.21.02.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:19:39 -0700 (PDT)
Message-ID: <b1c605ae-32ae-42ce-8890-2b32c9945c2e@redhat.com>
Date: Thu, 21 May 2026 11:19:36 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 net-next 0/7] ptp: Add PHC timestamp quality attributes
To: David Woodhouse <dwmw2@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 Arthur Kiyanovski <akiyano@amazon.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>
Cc: David Miller <davem@davemloft.net>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Miroslav Lichvar <mlichvar@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Wen Gu <guwen@linux.alibaba.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 David Woodhouse <dwmw@amazon.com>, Yonatan Sarna <ysarna@amazon.com>,
 Zorik Machulsky <zorik@amazon.com>, Alexander Matushevsky
 <matua@amazon.com>, Saeed Bshara <saeedb@amazon.com>,
 Matt Wilson <msw@amazon.com>, Anthony Liguori <aliguori@amazon.com>,
 Nafea Bshara <nafea@amazon.com>, Evgeny Schmeilin <evgenys@amazon.com>,
 Netanel Belgazal <netanel@amazon.com>, Ali Saidi <alisaidi@amazon.com>,
 Benjamin Herrenschmidt <benh@amazon.com>, Noam Dagan <ndagan@amazon.com>,
 David Arinzon <darinzon@amazon.com>, Evgeny Ostrovsky <evostrov@amazon.com>,
 Ofir Tabachnik <ofirt@amazon.com>, Amit Bernstein <amitbern@amazon.com>,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, vadim.fedorenko@linux.dev
References: <20260515164033.6403-1-akiyano@amazon.com>
 <20260518182646.2d1337d4@kernel.org>
 <177921463623.22936.15326822041328476600.b4-reply@b4>
 <20260519163351.61b746d0@kernel.org>
 <3685358a639c27a0f0b0ccfe2969c0cfa34cc392.camel@infradead.org>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <3685358a639c27a0f0b0ccfe2969c0cfa34cc392.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/20/26 1:45 AM, David Woodhouse wrote:
> On Tue, 2026-05-19 at 16:33 -0700, Jakub Kicinski wrote:
>> On Tue, 19 May 2026 18:17:16 +0000 Arthur Kiyanovski wrote:
>>> On 2026-05-18 18:26:46-07:00, Jakub Kicinski wrote:
>>>> On Fri, 15 May 2026 16:40:20 +0000 Arthur Kiyanovski wrote:
>>>>   
>>>>> This series adds quality attributes to PTP Hardware Clock (PHC)
>>>>> timestamps, allowing userspace to obtain error bound, clock status,
>>>>> timescale, and raw counter values alongside timestamps in a single
>>>>> call.  
>>>>
>>>> How does this proposal relate to:
>>>>
>>>> https://lore.kernel.org/all/20260517220326.4625-9-dwmw2@infradead.org/
>>>>
>>>> ?  
>>> The two series are independent and complementary. This patchset adds a
>>> generic PTP subsystem interface for reporting quality attributes (error
>>> bounds, clock status) alongside PHC timestamps — it's a userspace-facing
>>> API extension. The RFC is about kernel-internal feed-forward clock
>>> discipline, letting the timekeeping subsystem lock directly to a vmclock
>>> reference.
>>>
>>> Both touch ptp_vmclock.c but in different code paths: this series adds a
>>> gettimexattrs64 callback for PTP chardev ioctls, the RFC adds
>>> timekeeping_set_reference() for kernel-internal clock steering. No
>>> functional dependency or overlap.
>>
>> I suspect David will agree, but it'd nonetheless be good to see his
>> review tag on these patches.
> 
> Yeah, I'm generally happy (I'd done a round of review internally, but
> it's considered bad form to include my Reviewed-by: unless I give it
> publicly on the list).

Noted that a formal tag on the ML will be appreciated:)

Also I think we need explicit endorsement from Richard for patch 1/7 as
he raised concern on the new ioctl.

Finally, please have a look at the feedback from sashiko.

Thanks,

Paolo

