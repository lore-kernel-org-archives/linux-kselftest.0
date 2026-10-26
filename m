Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013942;
	b=IrcAclOhDTPkwBSekJhZLfwSv9yi9xv9IMCRuLFQHjY/ypoCji7hH7W1fCH63MDmovSY
	 XfS4dD5iImCc6FdvTUQQNfC5bSKakAoCt5NdNdXtTb+0Y8q5H2UwR7uHxPwUxotDfD4qn
	 XMZm/qUz9LFE7SVYlUDIiRdLok8/xgSxDNNFwUohdFQVHEQXK3ds0242EOZjcpQ2+db3v
	 6ow1N8HPZTHbgXqDUW0OZgDoNTgPgtlO310Ax2EojzHSRITsDUrU4QnDw2CoUSus1JDeh
	 wRnNe3w7dS005+Oi3I/sTC1NunAw4MW412W0ID1mA9l2o3tP5aFMA3hrk2aXx0cVMAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6eCgEceiFsvuqOLL4DtIMBpdvoUh9ThW46mPVQRJDrA=;
	b=S1lHhZEjz7YcFEo0lNoCa76jKK9kRzPLkb0rJgC40O+NeckRm5ql2hG54BQg5a6sDr5R
	 y0GmL8HPfAjT2S7YMV99B9PA9urkEcgm2wgqyaEniwycAGKavDt+R8qsDdH3pOunAJZGr
	 p+dWbT4xkW5C+HjprkTilTpQQRbBgCa+f3P57z1jbsXX8jMI37zWDnlhIKNVKRz5GvDlE
	 ykyzznnmpUja7012+SBy2g3zUewYZ7TbEyu/xv56gCrER/sUR0LFj/kuVvov6Ysirfht9
	 Jprh21aBmdjoTGCySpd/mOY8gX2ECH5e81lB0tHOtW4EbgB8gxveAWwDlqtgFel9g0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eV5jybMS;
	arc=none smtp.remote-ip=74.125.224.131
Received: from mail-yx2-f3.google.com (mail-yx2-f3.google.com [74.125.224.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8735C606A31B
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 11:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8735C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eV5jybMS
Received: by mail-yx2-f3.google.com with SMTP id 00721157ae682-8a72cead747so6821487b3.0
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 04:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013941; x=1793618741; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6eCgEceiFsvuqOLL4DtIMBpdvoUh9ThW46mPVQRJDrA=;
        b=eV5jybMSqOG9bpl2tJh0auk9VkaeAh9svu9HUTruj0TE6ut2p9ieQtaT4334wJijWQ
         j2OijJAAmWx+5EvpkGrgmmAdJy2eLkbVeOKuy9UDdGgvmdXb0o6hx2+gd2yCR1JVI7qg
         a/Ldlbva9AtFcMz/L3AtCnjN8Mtg9VBqhTq2HtkaFyxVFeLvTFMtOWXX1XIw4GfZK27e
         GdNhyZAMdopArMDhbBb5l3qliu+MA3NyZIAUJjn9S+5JpXKaAuWtmEjEEnaNLCiqi908
         xcW7Gq1PEIPwQTsWgFsWh2UKoIszphwpxcgTVAnJxXwhKbyINS9e6yxF1kQOZ2DgMrHo
         CJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013941; x=1793618741;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eCgEceiFsvuqOLL4DtIMBpdvoUh9ThW46mPVQRJDrA=;
        b=UbhTnWHLLmRmvTyVDSgPEn/FbSaSceuKnOS7hTBhnO0mpMY7zQ8mReqiqRRaRh6omA
         SMbUbVn1MV3khu3GRyJXCoWB18XIULtdkqwp9cwoq3+LnhieIgIuCvPfdeOYcmjbkaut
         WWxSCqr5I0iVZQ8hpTPMWMcKfD+zPj97KP3ZWV4W7vxlvC1l5Q2w8RcR2JgOderHSllR
         SHShM/0QYmk4GaKPQkezHNnckCxvW98uCEolQkTEJFSZsFE2yBAFYg/qYunhNqbEYLaK
         GfWHAqje1MF4rrKoAvOyImn3RbfLZzDMiHFOfmW2f+Gj7hTkRl02V9Rsp7cZ1XMNme6h
         IzxA==
X-Forwarded-Encrypted: i=1; AKwUvByEz4f67Q4fxXR941S3BuPf1eBITjUT5uwZPIjAlvpOOcQXU0ktKWi8YiDNnUvqw5PSnXWeTLIfZ8t8w7gyVCk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpDa32c8BYRZeBuU/TQTWKxLDWJB1MJ4XdYqHj3I8V9Q/mYGEI
	9a94dXDb3F2VjFfy5/p5/rApjOijOcP7q8LvYD8OwowVDv2tYInG8z4S
X-Gm-Gg: AYBFou3hktosSIi+OEHHx2+mcTjG7voRAMwJrhm8jGaGDbKL9bZRlvajKx3O6BRsDwv
	T7724MA61leUN2Fi45gu+0j64hGOLg++xKByKEQP7VRJdX1Cra5WqU6gboY43E86lrS0Z16MsS1
	tmgUkIJ9mYaqkZlAKt5GshKSUe/XSU+PwMhlviN5W2tYBpXkryXfUrHNe+dhvs3EEWFHldGBwwS
	4REpNR6gVuncazS0TjY5jq7Nh8QXYkO17bkJ3jWviguZEDrbx+Ly79YmRbzkBgt2MOIIacFbPmU
	B4C1aX+XquYSiFVKuu8nNF3mFG3io0xTofOVhLrKzERCDIqV3dEOLieA4k9KA2ukTO+9d7KUE/T
	i9kXYUY5mAu2qgCookuL9CO1v0+7YgcS5hhALBHRj7WOnZ5BU0wuPKQzOzCPY/+tBgKDV5XJxE2
	220zRrAZk2V71UCnli/cXv2gHun7hugFEpgll2yOr7L/bqSOC8DLE1LOcyVRc/g7pRQb/Bb6NKq
	qMTXpidqy12UNo3g39inUq26bOe4+o6vnRGDHSUQjbXf+i4EY26tKbG+aKdjVUE
X-Received: by 2002:a05:690c:2788:b0:8b0:eab2:f502 with SMTP id 00721157ae682-8b166c93421mr38305577b3.61.1793013941439;
        Mon, 26 Oct 2026 04:25:41 -0700 (PDT)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166c5d605sm29719597b3.5.2026.10.26.04.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 04:25:41 -0700 (PDT)
Message-ID: <c0c4dc10-8999-4c4b-977c-69beaae7bdcf@gmail.com>
Date: Mon, 26 Oct 2026 07:25:39 -0400
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next 1/5] tls: add HKDF-Expand-Label for the TLS
 1.3 key schedule
To: Hannes Reinecke <hare@suse.de>, John Fastabend
 <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Sabrina Dubroca <sd@queasysnail.net>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, Chuck Lever <cel@kernel.org>,
 kernel-tls-handshake@lists.linux.dev, linux-nvme@lists.infradead.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Martin Belanger <martin.belanger@dell.com>
References: <20261025-keyupdate-rfc-v1-0-60b7756eccbd@gmail.com>
 <20261025-keyupdate-rfc-v1-1-60b7756eccbd@gmail.com>
 <c75aa5d6-5037-4489-99e0-3e38528e10d0@suse.de>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <c75aa5d6-5037-4489-99e0-3e38528e10d0@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/26/26 03:27, Hannes Reinecke wrote:
> On 10/26/26 1:36 AM, Martin Belanger via B4 Relay wrote:
>> From: Martin Belanger <martin.belanger@dell.com>
>>
>> A TLS 1.3 KeyUpdate derives the next traffic secret, key and IV with
>> HKDF-Expand-Label (RFC 9846, section 7.2). Add the helper for the
>> kernel to do this itself.
>>
>> Only the part of the key schedule after the handshake is needed. The
>> input is a traffic secret, which is already a pseudorandom key, so
>> HKDF-Extract is not needed. Each output is at most Hash.length bytes,
>> so each derivation is a single HMAC with the library SHA-256 or SHA-384
>> functions.
>>
>> Assisted-by: LLM
>> Signed-off-by: Martin Belanger <martin.belanger@dell.com>
>> ---
>>   net/tls/Kconfig    |  2 ++
>>   net/tls/Makefile   |  2 +-
>>   net/tls/tls.h      |  2 ++
>>   net/tls/tls_hkdf.c | 82 
>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 87 insertions(+), 1 deletion(-)
>>
> And another HKDF implementation. Maybe it's time to split if off (again).
> But anyway.
>
Yes. crypto/hkdf.c went away again in 6d888db2cfd9 ("crypto: remove
HKDF library"), when fscrypt and nvme-auth moved to the HMAC library.
tls_hkdf.c follows that pattern. It needs only HKDF-Expand-Label, which
is one HMAC here. If a shared helper is wanted again, I would do it in
a separate series.

Thanks for the review.

Martin

> Reviewed-by: Hannes Reinecke <hare@kernel.org>
>
> Cheers,
>
> Hannes
