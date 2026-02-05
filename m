Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A1C22339
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Feb 2026 03:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770263287; cv=none; b=eGbQbuJ9cCk7cmm7zNnGomU1pU0zybGhBBvyuUVQqKF2iQFoAcLlOKULZqdIao6PTE7wsMyi/thnOfm2zzA+lTThbcCJCFihNNpAOkFAY2XHPY11nsJmaj1cYTvVbnHw8m9AbgTyUlUfRPtE/9P148X6MtRGe5ly+bQoTbSGpXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770263287; c=relaxed/simple;
	bh=7y9Hk6JlXCrERWliXg/TQZ3X+/C2SnPJyTWz26+wDdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rFyRNFlonyCoKzwRr3YVIPZ18M102e2phEedUFFh/GuXAiAJWQzFdoKyAIeH/jEI2IJQepu8PuOcapcwNyYBkzGvvf3M5jnRTH6ydXtReXc4xxaGprMIKrzCk3jmIdQGsQ8W0q55AHKnxVRjQiWGI+tNlvhMyWuATV+tMCyYA1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=zvUqzBm6; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="zvUqzBm6"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d1890f7ee4so343548a34.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 19:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1770263286; x=1770868086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QofIONG1uzBkxrXk9BfqK0VXCGMliXskB+p+bTvurvE=;
        b=zvUqzBm65B1vzoarWWF4Hxh+tJQomRWyeL860QlOQlGrnN/7L+9aIlgHt4+Sgo9fTx
         UWH+VUahrhmzC9uaMgmDQfwygwkwV4UniCDkBKe1Ygew4kd9vx5olhGa1ZUBLsODQlR2
         hMP1Yxan/By/ZSoDM6zpDN0U1FxG8xC+pYUHjWqWv2b/fnxnAzfFM/dnc1+G9rwwZrTN
         gS7chibU+9uS460RhWb24oo6nueO4nb1QNmjtDVM9u5Jswqf+3edpgqmpu03/QlWk2ky
         j5F/AHTIP1fRAmnqU2C+skRTeH2g8GDRkcjcdY6yfWynkly5XpowYGk3bz10aV6drc9q
         lsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770263286; x=1770868086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QofIONG1uzBkxrXk9BfqK0VXCGMliXskB+p+bTvurvE=;
        b=S881KsdOaVF+twlFfqmIqPKtlN1KuPu3yTYIdJR7ByIrbR9O5+2oewoPVJ6urlTioF
         3qO5PHE26FUb5jPljzLYWluo45hfYslZujznTyGvANSjNAZeOX5IC72JMRjW5zFtyzdU
         vqDgj7O/YAaEaWOLHhDwlclu/55HmLcfC+HNPwD7K0qE/Zp0OuRGNQ5AV+6jlypRvYrw
         Q/tdV/Cx0o5jWTVfLIxxQc7W/jOEjKvIgizcClujPfXxFcI6HZKp+NX60Qga37vJ8pPR
         nIZBnKv2gfE88xWELTGQNKTZvASbCL1RnXyx5NDwqfJrOlpagotSk7sRZHs9HgCVWnW5
         +CyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjy7z4+ukEy0gxzJhkuTkYQWj1muVSfeoBL8l9KnvSu0Mi/B8StUxw0Yv8V7PzSYVsCDkgg58le6xuv8dtnKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNjKfphBN8Mv41crNIeJKh+bFNlY5XaICqDMC/l57BScqusABJ
	zzmITIOqEUqXvIQPwDv5+xN5muuu5DXNqwBqzjaTy1siIZWBFxYGpT0dnu6K51fGDx4=
X-Gm-Gg: AZuq6aJf4f76zbyYiS/8IuVJJECyUE8pL3xtKqNSHah2XutQk0TgTUkCaxFvlGlqRbM
	40rLunmXyCKWId/qIhT9mzygRCDd8sN2zqbNIepiyjWbB+mBiQBrNS31ovsSV5KA6n+LMMTqtIF
	JSQAvuv8zAsDU5HTQOpNRQNgL85DUUqH99t0Rf1Z/Vp3wtKFEk3l0ZpD0o1vTNuesOpwystGaia
	vbGI0ygd57btQq51IMeWZFH0lD28/YduSya1tNEFoUvU7/Tcw3ZjZLbPhS8Z2LadAhteyo9Rbcz
	1TGngjTSnEvkGF4Nge/fcCvTHLzlBNURvxUO5iTIP3O0/+9ortv3cGlXwyHWHNv2PkLQgHx+EQR
	oEWovmrCRWF2aEgwkSHbTg/hWzMA1+M97iiQLNtcl5d8EwiqegFQZXcWIPlUp/1kKe8K0hrE2dV
	Y9aQXsS75eJVUicM2Gn8ULnWjQ8wwpmOTyYPMLZQrJZat8oMFr/I86FjQ8RlmNwjK/R9sMOg==
X-Received: by 2002:a05:6830:6181:b0:7c6:cd24:6392 with SMTP id 46e09a7af769-7d448c1fffemr3274000a34.34.1770263285661;
        Wed, 04 Feb 2026 19:48:05 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d44922a33csm2799317a34.25.2026.02.04.19.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 19:48:05 -0800 (PST)
Message-ID: <55108bac-9edf-439c-ba54-ee25a1901d6c@kernel.dk>
Date: Wed, 4 Feb 2026 20:48:03 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 0/5] net: devmem: improve cpu cost of RX
 token management
To: Pavel Begunkov <asml.silence@gmail.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Stanislav Fomichev <stfomichev@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Mina Almasry <almasrymina@google.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn
 <willemb@google.com>, Neal Cardwell <ncardwell@google.com>,
 David Ahern <dsahern@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Shuah Khan <shuah@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 matttbe@kernel.org, skhawaja@google.com,
 Bobby Eshleman <bobbyeshleman@meta.com>
References: <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-0-686d0af71978@meta.com>
 <20260120170749.101e8bcc@kernel.org>
 <CAHS8izMZxM6rcF+7Lfw=KFv4dmbHGSUrQBPmxO+sYj=V3TRuwQ@mail.gmail.com>
 <aXe2QhzL4DoVbesQ@devvm11784.nha0.facebook.com>
 <20260126173124.1f0bb98e@kernel.org> <aXhUfC7ZyYge1jti@mini-arch>
 <CAKB00G3p9_VUTEW_KQvS1JAd+Ju_pjrU5r-v_p+K8Y=vH__mTQ@mail.gmail.com>
 <c37ae03d-2b0e-4179-ac22-7d0c01ff601d@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <c37ae03d-2b0e-4179-ac22-7d0c01ff601d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/30/26 4:13 AM, Pavel Begunkov wrote:
> On 1/27/26 06:48, Bobby Eshleman wrote:
>> On Mon, Jan 26, 2026 at 10:00?PM Stanislav Fomichev
>> <stfomichev@gmail.com> wrote:
>>>
>>> On 01/26, Jakub Kicinski wrote:
>>>> On Mon, 26 Jan 2026 10:45:22 -0800 Bobby Eshleman wrote:
>>>>> I'm onboard with improving what we have since it helps all of us
>>>>> currently using this API, though I'm not opposed to discussing a
>>>>> redesign in another thread/RFC. I do see the attraction to locating the
>>>>> core logic in one place and possibly reducing some complexity around
>>>>> socket/binding relationships.
>>>>>
>>>>> FWIW regarding nl, I do see it supports rtnl lock-free operations via
>>>>> '62256f98f244 rtnetlink: add RTNL_FLAG_DOIT_UNLOCKED' and routing was
>>>>> recently made lockless with that. I don't see / know of any fast path
>>>>> precedent. I'm aware there are some things I'm not sure about being
>>>>> relevant performance-wise, like hitting skb alloc an additional time
>>>>> every release batch. I'd want to do some minimal latency comparisons
>>>>> between that path and sockopt before diving head-first.
>>>>
>>>> FTR I'm not really pushing Netlink specifically, it may work it
>>>> may not. Perhaps some other ioctl-y thing exists. Just in general
>>>> setsockopt() on a specific socket feels increasingly awkward for
>>>> buffer flow. Maybe y'all disagree.
>>>>
>>>> I thought I'd clarify since I may be seen as "Mr Netlink Everywhere" :)
>>>
>>>  From my side, if we do a completely new uapi, my preference would be on
>>> an af_xdp like mapped rings (presumably on a netlink socket?) to completely
>>> avoid the user-kernel copies.
>>
>> I second liking that approach. No put_cmsg() and or token alloc
>> overhead (both jump up in my profiling).
> 
> Hmm, makes me wonder why not use zcrx instead of reinventing it? It

Was thinking the same throughout most of this later discussion... We
already have an API for this.

-- 
Jens Axboe
