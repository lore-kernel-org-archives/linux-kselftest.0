Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480317;
	b=N8s2JRj52W94+ycNRFKmHBUCnQ6++GRDdZCygza99AJBB7k/Im8l3wp/cRLs2YdJgYbH
	 h6s7B2cT9GMmoIH2W3ojhRqC+4ZnOP8n4/RBGRUBoY7qwHMO8FSujG0Wf3S7rqm9rnZuj
	 7fPE5tQL6xR5UAHqK8voAteyclOlIM0Q1kqPuSDY094W9i65n6JlNHUS0SAhfD+F5MQ3L
	 lUrwYeiIgzKq7abSk121xx6BP7e5QVWTWJ4VQxcX0bQTUENIQBUq10T4cDigTjSbg2stz
	 Z4ZNedzBG8I3HEzqbbbjE3ZC9pnEpRNUVYF1bvXgAoE0IrzxLFg043A6+3q+4KbfiOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480317;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=M2ZWtK3jwBgT6W5EC/9V6YJ1MiOaCmKaMmxzxQcJy6w=;
	b=hQdwe8FGwOd5kbq1NHLRFaCDgxu2p8G6ReyIvsolehXJy296zGICzE/QNeULuQ+FMXYm
	 kIzz8WTgJci39pk8slJZk0XfkcOt0chvF90ztPf2qc7U3t7nK2o9oN13Eo+nIXvgTpsXS
	 8bhJIVplWbaUskIkBIOB/QH7XlSTuz38Vs16pIZBcTVNG+nBUPRu8Gsv6il03m/A66TzC
	 JZAkOlssNEhl/KcckM3Q40EpktsxKJA2c6uQLCdwImOQCVpyHaux2r0NVQoOXV5k5j6H7
	 hLqo2rhcSJBvwZAMqgNoBgSadQ1ksNE8+sqhV4fif+NmbA2Q89+qJetX0xvjKTOAoVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KgBXG6iw;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rVBKfbQY;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCF3606A321
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 07:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FCF3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KgBXG6iw;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rVBKfbQY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792480316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2ZWtK3jwBgT6W5EC/9V6YJ1MiOaCmKaMmxzxQcJy6w=;
	b=KgBXG6iw6YMaV6P+oSBrgP5JUW/vKzUjBrEgLS9knnuegNnO3yp0k+y7/wTtPPm5kixrf9
	kTaOOLv0xCxY+WujwIAvGPHeixwmtoS1ixv8gbZuuGvWPCu40unnqNK/qRDL/9zVfPFCOh
	7WSfHi5p0e62bizRwYkYELRSrwB98Rw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-cc7ccJH_MzCf8xa53Cd7-w-1; Tue, 20 Oct 2026 03:11:49 -0400
X-MC-Unique: cc7ccJH_MzCf8xa53Cd7-w-1
X-Mimecast-MFC-AGG-ID: cc7ccJH_MzCf8xa53Cd7-w_1792480308
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1721559b4so29728785e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 00:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792480308; x=1793085108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2ZWtK3jwBgT6W5EC/9V6YJ1MiOaCmKaMmxzxQcJy6w=;
        b=rVBKfbQYqDfcxMDVajSJ0//djDSLUEq072XS+G5TL1DWTT0+GB4v8hqSlkBH/fHiYT
         Me4ww78z3ubKuKElpTYoIogjUXyPMkuqowXO93J3x+nDZkR21E0A0kO8qfzpKIoC8OpR
         vePp6xjRYxl9Zt+ym9JLChvG0fbMHq0XOMTJcaDLcsSm04nGo7scVy9fydRuuzA7r+Lg
         LrI06nWVKT0x2/xYp35Wkl/uSpPwo6pgwDxc3yI6/QNkjKT1YLn3TQmtRTa6G4FNio3K
         KmNM5uYcp/W9UmNDDK5w7mep/tycZo+DZ9cSAFgyeCdZBuqYgJO1oBCKqmC5UvvjEKWX
         EDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480308; x=1793085108;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M2ZWtK3jwBgT6W5EC/9V6YJ1MiOaCmKaMmxzxQcJy6w=;
        b=IUL7E+LCWdQIhCukTTxesXw3gBS8sBsNI9f6kzxEC76I4o0CJLHnRF4NUdZowp8vVq
         6zqlwVT8WCGN6tVWe6ySEAMKr/XZIH2E3Ff4M/vaqK/9GeBoCM7/5J9x/bSxYBCAX19n
         /9EntR3OmP/0ClQ1V6D5/hVTGb2VL2sqgKCbnVgV15/xbuuK/Mw3+ihZHli2tXraMWB4
         SyrsDspZ1u0pG9IvqrRyq/mTcs7UxR2saiYsss/xztKSV1di+A1XBjhcjbWH/VNInDKt
         PwhWJvVM7vFccTg9dUlHAvly9d+5sJjidQxrn5x7m3t5I4GUMNaObxNwB5jt3FQoP5lC
         zHQQ==
X-Forwarded-Encrypted: i=1; AKwUvByEE92mGUzDpZIIK/qddbEimstmNFGp2Rw703x6OlUKJHtw0QJsHL2XD5FGRRlzpB2PesT26R7+9oeQEG5WTDI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtfOnXR8pjOw07g3zVbJUHHBchNjTRqxKJA2fe06AoMko+YrVQ
	ryD+8u0FCKGrKrnRdIyAmB+DUtlULineTzW7753oyF0Jk6bPEAN967mtstg6u/rlL8sPlDygbR9
	LwF4H7PK7RGHkAz3xt9u6oBEbQCC1FNF7vflrRc1UdC08seLZyN9N8rqva0GYdDwGTI566g==
X-Gm-Gg: AYBFou1X0vESAcT8eBLh/MvZFsw3pMV1xTtwhWTk6OJ88olcirrIhz6ciw17qhnRVa9
	IBysg/njE0E7uzfraDIlgvNX/sP4vIWyhrxTlvR8+klRQ7VIXbvGyrgzRNcdVg/fLD7fsYGgdcd
	++ncq+KWqnJbyt1UnqRkuPO93a/fCMrby4gThDqiAO98mXRmGgeiJ78+UQG5XQPhGpJlqdxcNP/
	rihGLaUpSgnzzu6OIf2PvF2ftkK5jfi130JWPkY7Dyiw73Gkbdm8L28S+9TKcyZiT0hb5lBrhmF
	EilsOInbmG0/WLCRs6dC2B/SdkFH3sEtLP8yxlat3QAzJXIks4zQNom6XEJesSAKbzRx/p0fpMF
	UMj3/IyClniDCvMMAatRQB3BkgP9kp1dghPGwYRAwHh7a1+GVoAGhc+LRAprieE+g2vUZwTvKSw
	==
X-Received: by 2002:a05:600c:3e05:b0:4a1:71ab:63ba with SMTP id 5b1f17b1804b1-4a1d763625emr205330605e9.29.1792480307727;
        Tue, 20 Oct 2026 00:11:47 -0700 (PDT)
X-Received: by 2002:a05:600c:3e05:b0:4a1:71ab:63ba with SMTP id 5b1f17b1804b1-4a1d763625emr205329845e9.29.1792480307327;
        Tue, 20 Oct 2026 00:11:47 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dc952d63sm331515125e9.2.2026.10.20.00.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:11:46 -0700 (PDT)
Message-ID: <976d815d-a9ec-4fa0-9b16-8e55695706c2@redhat.com>
Date: Tue, 20 Oct 2026 09:11:45 +0200
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
Subject: Re: [PATCH net-next v11 3/6] net: add a generation counter for
 dev->mc changes
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, ajay.kathat@microchip.com,
 aleksandr.loktionov@intel.com, andrew+netdev@lunn.ch,
 claudiu.beznea@tuxon.dev, davem@davemloft.net, dsahern@kernel.org,
 donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com,
 jacob.e.keller@intel.com, kuba@kernel.org, johannes@sipsolutions.net,
 kees@kernel.org, kory.maincent@bootlin.com, kuniyu@google.com,
 nicolas.dichtel@6wind.com, nickgarlis@gmail.com, sd@queasysnail.net,
 shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com,
 vadim.fedorenko@linux.dev, willemb@google.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
References: <20261012011707.3378-4-sigefriedhyy@gmail.com>
 <179185709988.434549.15422498299449004512@kernel.org>
 <CA+7S2v+LHUWXQMD-cYPEzT5-f3Qhw_vz+LEssQH_A_oqDKtnnA@mail.gmail.com>
 <8dcd9564-e9a3-4b00-93b8-3cb023d68047@redhat.com>
 <CA+7S2v+rWYvz9xKPEeM6=3HPz3o7TbX2uRfRKk95f9Y60HnEiA@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CA+7S2v+rWYvz9xKPEeM6=3HPz3o7TbX2uRfRKk95f9Y60HnEiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/19/26 13:35, Yuyang Huang wrote:
> On Mon, Oct 19, 2026 at 8:19 PM Paolo Abeni <pabeni@redhat.com> wrote:
>>
>> I agree this is not a blocker, but I think it would be nice if you could
>> follow-up on this one.
>>
>> The solution proposed by the LLM LGTM.
>>
>> Same here.
>>
>> Also, still speaking of possible follow-up,  I think it would be nice if
>> you could change the addr list lifecycle to RCU (no idea of how much
>> complex would be that).
>>
> 
> Thanks for the review. Since we're already at v12 I'd rather not respin
> just for these, but I agree both are worth fixing, so I'll handle them as
> follow ups.
> 
> The first one is a simple fix, so if v13 ends up being needed
> for other reasons I'll fold it in there, otherwise I'll send it as a
> separate patch.
> 
> The RCU conversion needs more thought and will probably
> cause quite a bit of churn, so I'll try it if there's a v13, and if it
> gets too messy. I'll post it separately later.
To clarify: every I mentioned in my previous email was about possible
follow-ups - not to be included here.

My understanding is that there is sort of a pending/implicit question
from Jakub on v9: why are you doing this? is does it solve some
specific scaling problem or is 'nl is nicer" thing?

/P

