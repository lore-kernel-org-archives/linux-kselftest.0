Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB872D29C7
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 10:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507825; cv=none; b=K0/3OPNrylzsGPDqohJo9STb5uK0uGWNMK6ispVyOA/fQ26JD1VoTlPgSffz30TlwIV5EQQXqyBSuwJs6ejpVQK6C+25q6sLAq6J3qf52MMSjs5QXLbX4SSV8htgM7P/6y6aQguH5vz7dKxrrdIR07nMGKyOhk32WViF7vrc1zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507825; c=relaxed/simple;
	bh=XbtrJUUeM3xNHOoBDhocSvoqSRxhQJf5NIcQJ2vvppI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T3la7rqt5fArNgw9DZWfCnsliywrS1ChVrSmtLYPENmwxG0DFTOue8y1KPs93ioY7ZjOpkYBQwYwYpKvikxx6ob/lb56rkCLz+XvNeQhJ0Mry7W+0m2YoL4HiCh38Q3YGuRWdV8B8PqBnECtcPhGoYdlmdr2UCT4jCDCNA8O3yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QqthG9ND; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QyXGLIXe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QqthG9ND";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QyXGLIXe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783507813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7RthwfiaiuQwFULsU9rLR+4p2hP6BkmVyKgFOz4tjmA=;
	b=QqthG9ND+/rwaf1cjppmLex2EYwg0ZZka8lr1sZ9MZqqF25l9xr+4Ryglr4dBUU2r57hr0
	CmKgfd2dnH0y2ssVGOdJWjxHtQg/CeMw6aQ6G/huf2dadQRsxGmXsSfytd+a3pcSs/h3Z2
	F0o6MxX0ZGQEF1vNxbXDCka4d9a2uMM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-BX5qj45cNr6nEv4u_YjmZg-1; Wed, 08 Jul 2026 06:50:12 -0400
X-MC-Unique: BX5qj45cNr6nEv4u_YjmZg-1
X-Mimecast-MFC-AGG-ID: BX5qj45cNr6nEv4u_YjmZg_1783507811
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-493b21b1fe8so4448915e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 03:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783507811; x=1784112611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7RthwfiaiuQwFULsU9rLR+4p2hP6BkmVyKgFOz4tjmA=;
        b=QyXGLIXegC9GU8f+7pf9mscNhjhpghkLNmZwWQ8FttE9MXp9UZfvHghK3670O3CIEu
         KzUnbutFlOEcFKIGWpz+apyBYVZhDx8/SF5LqhmyOomOTjIkerJQmlBdJ6DNh5hvjWfg
         F9mK9gOYZwv5xqLSo1hIb7UG4W+j2Y9QfKpvglZdzziSjPVy1hLsZkivX5o0/ZZ0TLmd
         bD9HGpBnubzcwDZ54p/kMfzXV9VU1EaX9lDX3IlrkF1fiE7PMfR9lQbEhzZ905iIB5U8
         7H3U2u4Gw74t1vyCgFWa9PEGnvLiV2mkCvSKK/gH+dvF3mJNM0J03Ojp9BEkVaBGRmVJ
         Qb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783507811; x=1784112611;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RthwfiaiuQwFULsU9rLR+4p2hP6BkmVyKgFOz4tjmA=;
        b=ACaOcxQqCR2j5Zi6cNaLHcjmlTmNxGuApuYYiG28bwoLYGselKjPhjoC0r9MWTYKTk
         InHHS/Vw73IoNOmxSm36JbtUHapmcTZeNhCfVEGDgFdDV0gKX87UTxvjrCQEdp8bH2cj
         4DnghbXwLdzq48wbiXOh+p+3iQ2kIwMbH/tPP9KK2W77tcf6xW+m9pjn7D+KuSHukKZ8
         ThYYbPtHvNBFNqjIio4d8LupjOIuWsa918QHPy3cw0SBfVo6/D5Jbx5j1b8Rge/bQppA
         e/3fB7t3Wj/qwVU2Md6Dy/5OtGQQH58ycKNotUYafR53deNSubHcMHJBM8jVfa8OgD94
         6v7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpyz+KW+dKHZFNboGHMkNOKtjUwiYCPAps3rJa+OsB1XZ2OHcPEEOc1WhyTE4dKw1d4r1Hf78//AQp8zroZ1XA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzThgkSeWZS8EjMHKo0GY445/yR82f9VGrNrekIr2koQ2VMbPsY
	loIQZxDNFOJS84OUr5gTBWxqXcJZc0/31MelVdqq2NEHlHJax8PL7wi38Kh9nXgBnCjP3roWJ8r
	ykUbr7Syr27OqjvKdMRCL2/z5ujeKPtrTJBJPQuIkb6f/Bo+SL6eOJh3Wan7SciSgnfUizA==
X-Gm-Gg: AfdE7cm1xhMv9eZYphjkBv8eioucPYn9HlrU7SBOlo08udr+XHOEywhD2qB6x8YP7Kc
	PfnKC5iZkr0WrLydwiOvOEZwdVGOMaRTOVYb7KEpspnG/bFetz3GrQJFw6TQbIX3DlYKczCWnMe
	9xkd7KBjp5bODLXZ3TKPEDvvAnxnLqlyNwjXL79YE1RylW7Au8qVdeuu948bJUAkzA9y1YK9Jkq
	iJOwQNCSp5YjilS3LoSqpGqi+Rge4mjhrAvxGgXCDypnmalDz/RO27cdtdkc15KVd6EYU05u5Ii
	l+96bEgMDbAgoFGLfwmWuzEH74YrvfAAYkbXDJfcxKjAD8mpyUgvx7dVAK6haeJmkXtNc8UerW8
	yS1H65Khdv8qP+vRN75U2YPiEaC9e14kvvdROHg1bEQGcEG11XiGJ2kYzVdv9jUP9IIu3F0x6Xr
	7Zz9+Uq9vl4jbA
X-Received: by 2002:a05:600c:3b92:b0:493:e892:f03c with SMTP id 5b1f17b1804b1-493e892f05amr3891615e9.10.1783507811110;
        Wed, 08 Jul 2026 03:50:11 -0700 (PDT)
X-Received: by 2002:a05:600c:3b92:b0:493:e892:f03c with SMTP id 5b1f17b1804b1-493e892f05amr3891245e9.10.1783507810639;
        Wed, 08 Jul 2026 03:50:10 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f40912sm123922735e9.4.2026.07.08.03.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 03:50:10 -0700 (PDT)
Message-ID: <15e72c82-ca99-481b-bd53-744fabd503b0@redhat.com>
Date: Wed, 8 Jul 2026 12:50:07 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 1/3] net: devmem: allow rx-buf-size >
 PAGE_SIZE per dmabuf binding
To: Mina Almasry <almasrymina@google.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kselftest@vger.kernel.org, sdf@fomichev.me, razor@blackwall.org,
 daniel@iogearbox.net, matttbe@kernel.org, skhawaja@google.com,
 dw@davidwei.uk, Joe Damato <joe@dama.to>,
 Bobby Eshleman <bobbyeshleman@meta.com>
References: <20260701-tcpdm-large-niovs-v4-0-ca4654f37570@meta.com>
 <20260701-tcpdm-large-niovs-v4-1-ca4654f37570@meta.com>
 <CAHS8izNdJ1LTOr_pLjXef6Yv-=JOFPe1GcZtcbStD93Tkpy1XQ@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <CAHS8izNdJ1LTOr_pLjXef6Yv-=JOFPe1GcZtcbStD93Tkpy1XQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/7/26 10:36 PM, Mina Almasry wrote:
> On Wed, Jul 1, 2026 at 12:22 PM Bobby Eshleman <bobbyeshleman@gmail.com> wrote:
>>
>> From: Bobby Eshleman <bobbyeshleman@meta.com>
>>
>> Every devmem dmabuf binding today hands the page_pool PAGE_SIZE niovs.
>> This caps a single RX descriptor at PAGE_SIZE, burning CPU on buffer
>> churn for large flows.
>>
>> Add a bind-time netlink attribute, NETDEV_A_DMABUF_RX_BUF_SIZE, that
>> lets userspace request a larger niov size. The value must be a power of
>> two >= PAGE_SIZE.
>>
>> Measurements
>> ------------

Checkpatch complains about this separator usage:

ERROR: Invalid commit separator - some tools may have problems applying this
#15:
------------

Please replace or remove it in the next revision

>> @@ -90,16 +90,17 @@ net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
>>         struct dmabuf_genpool_chunk_owner *owner;
>>         unsigned long dma_addr;
>>         struct net_iov *niov;
>> -       ssize_t offset;
>> -       ssize_t index;
>> +       size_t offset;
>> +       size_t index;
>>
> 
> nit: I would keep this signed. Some of the most frustrating issues I
> ran into is some of the underflowing and then passing a > check or
> something. Although if the LLM is not complaining about this
> particular case, there is probably no issue with it. I also notice a
> lot of existing code that deals with indexes and offsets goes for
> signed.

At very least the above change should go in a separate patch, as is
quite unrelated from the rest.

/P

