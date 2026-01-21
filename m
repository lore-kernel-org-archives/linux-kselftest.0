Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBF944D6A0
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769013164; cv=none; b=sARJQLDey1YJhShwpBXh7FZBV0J3DbtSTgSkEHPmoeqryUV4dQsHepQZBOw9nyNnIWCu1XLQBKe16aIjGdakL0hbHQIvT6NPoYZK5v5M8xMXJ+AznDKuJJMUXWvYUrdqQv0U5mpl7nbGks60hALHZ6GJXGTGplDoD7vbCQuTiuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769013164; c=relaxed/simple;
	bh=FoyiK1L3Q2N5n/FjMNfanm0zKz84UsrOOXkZRg0Kqz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+cDHrieA/DtS8vbX24o+ZTY0zyK8HkR4MF3xRIiXiJ7qMRHS8jlgkcqoeBKMcNXvmmU9lPyHw2daWX1/o31z0N/CMq287WmahMqCfdaVljxPAL1yxY/Xzq6K+2e8beVdAvmGRlL4v2z69OToBqrUzf2wjpNlwQz8OIf3RWXt3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YfOxEdLr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uHfRFTih; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YfOxEdLr";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uHfRFTih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769013161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nW2BnBCkF2OGoFoub+qogRSB+R7/eG5W/AiAxbiNHik=;
	b=YfOxEdLrzGHpTeog8pXvSFEY2dGp5/5QO+o3lIshkGSWsop7XUoceIq79xPp9WlbiLYm5T
	j+8oKKKVJfDgfXKLB53ompC92xLOgf8c1dXDjbohxSnqzr17Ik273EuHg53wj3KJ0PmNlA
	dLdWZtqRGTPVMExacqO0BTfSvVZA5IM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-mcAf7EMLNyWkDS3yFqAqKw-1; Wed, 21 Jan 2026 11:32:39 -0500
X-MC-Unique: mcAf7EMLNyWkDS3yFqAqKw-1
X-Mimecast-MFC-AGG-ID: mcAf7EMLNyWkDS3yFqAqKw_1769013159
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43284f60a8aso5675317f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 08:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769013158; x=1769617958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nW2BnBCkF2OGoFoub+qogRSB+R7/eG5W/AiAxbiNHik=;
        b=uHfRFTihlUj88DkU8QbU/t8ym6xQefp4tJmsMBv4J2mwvKhiUOosOMowjxEtB64lDb
         dQ10DgBKOZ/8BUYVATZs98y3HsBL9hbuhkqrtB07Wy6w7AK9ANhnPmbw+m3YoKcTEczL
         Zkrn7TR6yJFLEBjqvcQouoggTrm7Dr0886+wW3UfhjW+WWSAFXt7sxU8yXmuKABceJpW
         5i0XHX5Tb80353AgakZuIQETHb2A8mPxUUVjVp5PVnnZLJq2BE4WEUgCCCqxrDZA0Eer
         rRUAFLURHKpW6pSPs8+07mM6SH9EtOZk5WYFUmGjEPw7rK75bXbtihxOQtDdyU5JaRze
         bt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769013158; x=1769617958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nW2BnBCkF2OGoFoub+qogRSB+R7/eG5W/AiAxbiNHik=;
        b=BEf7utCMb5fyPuzLrzDCKTvxBNoX2HooFVtKB1/ZW+7wCjGd+gAWuCRVHfrsHbPZPc
         GPjEhVe2FXQ5ja1Wslb39ZEkcBWzQFhsG5mFlw2HszSQhp/BfsfCQxhYjZItnZbV3l17
         as5vyUPcJk41l3Mbb8dMQI/I5uPhxxsgdKEuz7/eTN4NMxen/qQ/5hGM8YnYTHKNDW1G
         1Gri+EGPLxCaHLHitCZ5RfONBho1eGT9yZ85WnWnQeAbuDZlHW/zBtykrzKSQThEEJp7
         V7tizQCch0QBQB2W0LwsFCRnI07wOoyU8TMDHgM1CuVoyLXQiCtu3ZIn/VxwWpnjOuuc
         5qtg==
X-Forwarded-Encrypted: i=1; AJvYcCXEUP+oh27ZQdHWu307i29GLZDZW6uT+eqJ6kdZlbSTvJa8Xvs4eOszGo7H88wyeh4kUkwkzJsiaSMqdyGlbc8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3NYDnMkR5Dh9KpvVwrjkMnh31fFuvAgj+l1o/wiE2G928I1Ck
	Y/Qa61Up1K3y6Ab5p/Wc1jZM/imt8WwNg+bwby+f18Yf9IWaRGOV47ZwAaraiSjduLLjGboXHCL
	57I/ainpDKmIZo4pk5ofE8QclQasb5uxk8BOAw8lemof+8gAt83MyfSfx2a/wuOJB8MmHGg==
X-Gm-Gg: AZuq6aJlwWh1eUjTmMrl8TUgf66KcaYls+5TVS/R1ihpajXkzk3PFfrXMOduqCQum1X
	hnEkcZZbxXzpq+8jham/GCxNDRmC07cOHKmvNSb2CIxYRFjKeZresYBFaVcK6NLFcoC2pbJxRlE
	U+n4WrIu27O5STA6t3xTBGTeBuHIC00QO8o/W5nSAScAdJLBiHpARQcY0/zPBRc8qiYdUcPk9pO
	BG6V8iU2mYKYzo1TPE01e7GWoQxK6lL/+4Mu3xEseghyfMcanfNvRrWtASwkED1xCaqItzq08tW
	4yDzw+5RiLp4c9adQqM4jZiCO93LT00amC2OO2ACKojg9XQvtBJcWMvvbcYSYpENT6nv6HeiU4N
	ae0wAjWecSQDQ
X-Received: by 2002:a05:6000:2082:b0:435:693e:c03e with SMTP id ffacd0b85a97d-4356998afa2mr25422049f8f.19.1769013158388;
        Wed, 21 Jan 2026 08:32:38 -0800 (PST)
X-Received: by 2002:a05:6000:2082:b0:435:693e:c03e with SMTP id ffacd0b85a97d-4356998afa2mr25421964f8f.19.1769013157874;
        Wed, 21 Jan 2026 08:32:37 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cf58sm38575864f8f.22.2026.01.21.08.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 08:32:36 -0800 (PST)
Message-ID: <4997118e-471c-45fe-bc1f-8f6140199db5@redhat.com>
Date: Wed, 21 Jan 2026 17:32:34 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v15 01/12] vsock: add netns to vsock core
To: Stefano Garzarella <sgarzare@redhat.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Bryan Tan <bryan-bt.tan@broadcom.com>, Vishnu Dasa
 <vishnu.dasa@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shuah Khan <shuah@kernel.org>,
 Long Li <longli@microsoft.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 netdev@vger.kernel.org, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kselftest@vger.kernel.org, berrange@redhat.com,
 Sargun Dhillon <sargun@sargun.me>, linux-doc@vger.kernel.org,
 Bobby Eshleman <bobbyeshleman@meta.com>
References: <20260116-vsock-vmtest-v15-0-bbfd1a668548@meta.com>
 <20260116-vsock-vmtest-v15-1-bbfd1a668548@meta.com>
 <aXDYfYy3f1NQm5A0@sgarzare-redhat>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <aXDYfYy3f1NQm5A0@sgarzare-redhat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/21/26 3:48 PM, Stefano Garzarella wrote:
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index a8d0afde7f85..b6e3bfe365a1 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -8253,6 +8253,20 @@ Kernel parameters
>> 			            them quite hard to use for exploits but
>> 			            might break your system.
>>
>> +	vsock_init_ns_mode=
>> +			[KNL,NET] Set the vsock namespace mode for the init
>> +			(root) network namespace.
>> +
>> +			global      [default] The init namespace operates in
>> +			            global mode where CIDs are system-wide and
>> +			            sockets can communicate across global
>> +			            namespaces.
>> +
>> +			local       The init namespace operates in local mode
>> +			            where CIDs are private to the namespace and
>> +			            sockets can only communicate within the same
>> +			            namespace.
>> +
> 
> My comment on v14 was more to start a discussion :-) sorry to not be 
> clear.
> 
> I briefly discussed it with Paolo in chat to better understand our 
> policy between cmdline parameters and module parameters, and it seems 
> that both are discouraged.

Double checking the git log it looks like __setup() usage is less
constrained/restricted than what I thought.

> So he asked me if we have a use case for this, and thinking about it, I 
> don't have one at the moment. Also, if a user decides to set all netns 
> to local, whether init_net is local or global doesn't really matter, 
> right?
> 
> So perhaps before adding this, we should have a real use case.
> Perhaps more than this feature, I would add a way to change the default 
> of all netns (including init_net) from global to local. But we can do 
> that later, since all netns have a way to understand what mode they are 
> in, so we don't break anything and the user has to explicitly change it, 
> knowing that they are breaking compatibility with pre-netns support.\

Lacking a clear use-case for vsock_init_ns_mode I tend to think it would
be better to postpone its introduction. It should be easier to add it
later than vice-versa.

If there is a clear/well defined/known use-case, I guess the series can
go as-is.

/P

