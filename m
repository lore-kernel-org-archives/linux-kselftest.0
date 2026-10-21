Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572606;
	b=TT+eJtAUHv4vyheZs4gb6uHR8YUtpUSxneagLpnaJdO2HDYSaPXuN55ctqhqWI2WSAVz
	 LFgwYxV3O6QWhcHjzjoG87PDgVHOCtQ0A4la6/yEVIcPqvsJcElB07oU48vysFeAypXDC
	 Ovqkfw2CNuwuoHqIvmRD1iAy5hXyQGycRRPdxx9yu4LW8Mc5TMzOzzNQkwuU9t6tlKpN8
	 qPOi+ekq6/LDoRUExSOE9MYlZ6x4dVjtcaOvPB7Vl9B4Wec0Ga+NFCTOTFa+tTn5tmxFG
	 p03nAcnxsxxjI3q1dklJt3EagLlXryCxAYeDmTf/1BNdYdZ20NWlD1x/VrJtgvwNHfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572606;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ay7su0BaQgQc7vNg3pUCZ5W4k0M/lSxdL0nMfamxf2c=;
	b=02DGb94oa32w6QYCdIpYXUwOTUdAr3PR2TWWS9Nkh6auokMHPDX31EPEZwrS75oH8KGd
	 u+pNMRT0fFw1TFJILWeYyivQDkCFPUaSJEvZhbciu51/WoWk3+cEbOBbmmkx613q77OtQ
	 6t9xNWPum71ZYgECVbeMmpwEEUfPn2hYv8hB3+sGtu490UJqLNA/+tpdS92OwxaPpdFBi
	 vC0hRBKtymmv4nhXabcIj+lVSGd51CFgF/VySbWqIh/+l94MQwwlC4iNcWkUo7Udg4cyj
	 fEjKSymgqcwTaQxzm6ANaqxhZ9grDMW4d8iFwgG5cUoO8GKk46+sler2SXbyaXiZOxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WJoraK3R;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZkrCa2SN;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F23B606A31A
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 08:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F23B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WJoraK3R;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZkrCa2SN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792572605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ay7su0BaQgQc7vNg3pUCZ5W4k0M/lSxdL0nMfamxf2c=;
	b=WJoraK3RU08MAKjRf18x20IBDpQAB1LhvQRxOV+SGRm9FmRETy7tDnSWMn17ai1yJpLW+d
	QJkcibKXD5NEwJIJXbLqKZCuI0UTNzgEu38l+Mtw43OheY1By60xg5P2zNBpr8sQ5nzLPP
	jRvAe5+HYVLFZ2LFkY5tZ4qKRTHktpg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-ji_rf8SWNm2zRGXYsriKFw-1; Wed, 21 Oct 2026 08:50:03 +0000
X-MC-Unique: ji_rf8SWNm2zRGXYsriKFw-1
X-Mimecast-MFC-AGG-ID: ji_rf8SWNm2zRGXYsriKFw_1792572603
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso3269035e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 01:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792572602; x=1793177402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ay7su0BaQgQc7vNg3pUCZ5W4k0M/lSxdL0nMfamxf2c=;
        b=ZkrCa2SNkZnjpp29ifQyXZAuWi2ak14FACLmnRnjqhUMMlNmkf8V+eltF4T4HEDBlh
         DOnrdJ9w2qa2h3213Qw5p8jViETw4bz3y1VrW+X4Dxgwev+QtKZxr6T1qamSmblia0QT
         qVWg3G/J1X/EOCi2umsNc1iI6GaBxL+7qWB566mfoMqmrjg9VH6yh4GyjOQJPisJXtwh
         dIRAlEiHnXFQnfsXRBwx+lxa9kQ/dAkIuKGLSQCwYmnozoHxNoziIF4LoNx8Rz91p/qi
         OFqSXE30mE2qMO36IBtWsuWN07O7SkIW9lnh6ydHmzFON7+et0McF6JF06o9rX6i5Hu4
         bP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572602; x=1793177402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ay7su0BaQgQc7vNg3pUCZ5W4k0M/lSxdL0nMfamxf2c=;
        b=jL8s9ALSV9xKuxZHyvpRWggCMPndiBNx29ZXLhAUBrPGayjHO35ks8EYgmjYOzagJB
         UBP2o8VC9VVItBpU2zeVwiznObVpQX8TQsFVu5wgKzOF3ApHcZVj21m0/6wRa6PPjTQM
         mtIALWrWINGlzTAtJ//Vvba/0BnT8//SkQeHaF1PTBSmPQ+t455rp77MhGs6eJyjztV3
         1krwsmjzjUhNhjfdcWJ9hRikaoAcUNb1qfRL05SYh6ZtL66z9iOqrZuzdvLR8xOPz5jz
         vlTOBIWXG05OdZapD/Tbu03LU0OOVK1Z+M4e8Id09GPNVZGMtltn2hfDV37M+jSfUUxm
         nzww==
X-Forwarded-Encrypted: i=1; AKwUvBwEJgMqFc+YoGO8vmI7+sxn3CRgottc7SP8goSyFYocdeDLA2H8DGWdCcF1ksZrs3j9eVe3IF01hdUBW/xG/8E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ0yQjYI8Qkcx5yLre6B3T52ulAMFceWSeqkLCc03sPIFqJU20
	VYJBIQsi5tKQn+LQ8BINXvxAaDG7DDEWXyKjefc+/AuQny/lCXJKyTWDJLwYCXw9VVb0dP97CAn
	q0Dg7E3MSh6yKr0NIgDSGAL4x/f97CMHTXjnrh6zdN7XKhqnir4+EWql/Qwc5MVIbrZLPZQ==
X-Gm-Gg: AYBFou1T0L1iLr2C5rDEBvFo22oOV6exi+K3ukpWcmNLYNqG1ag+jVy5qJRc8zMXGct
	6pnJyxzChDQ09B8PKPB5IiCTatm6HZA8EH+SLPwHUhpMGmKZQIRIUmeWbTGue9JzmKwNkgVjIAB
	/VbuKNDvXntQayciRxwBBWzPqP3qrxh7xCI2tmvfHRhf7HPi5G35UxPnEvlXrRZNeHLIHtePi3M
	3BaqUFmjWL2IA/N74RdwrNDSTiIGMRNzN9Cy5xzbDFxqRt5lwZJjbBt3yMrRyaL084Ly8gyQbrT
	fdcjgQGFd0uX/7TntGZT58FbRG/2NgDDzBECkawksgf6lDo583oK1FkKehusA1OeLZqxGo5vlRk
	Di6Aqwq8EhbZigbmC1fAs6flORvNo96TryENbbqsqatUCzEo7vToDWyZxK4oFRE5j94/ou6OUWg
	==
X-Received: by 2002:a05:600c:c16e:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a1fdd2aa12mr26143995e9.12.1792572602639;
        Wed, 21 Oct 2026 01:50:02 -0700 (PDT)
X-Received: by 2002:a05:600c:c16e:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a1fdd2aa12mr26143565e9.12.1792572602177;
        Wed, 21 Oct 2026 01:50:02 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0ad18esm30903515e9.0.2026.10.21.01.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:50:01 -0700 (PDT)
Message-ID: <d3a1b219-84da-4ed8-9d87-5619e74bd1f5@redhat.com>
Date: Wed, 21 Oct 2026 10:49:59 +0200
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
 <976d815d-a9ec-4fa0-9b16-8e55695706c2@redhat.com>
 <CA+7S2vLWvQd7GrnwB+B+DiqAgST8EjfWwBKzJXtjGRBPVgmOBg@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CA+7S2vLWvQd7GrnwB+B+DiqAgST8EjfWwBKzJXtjGRBPVgmOBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 12:22, Yuyang Huang wrote:
>> To clarify: every I mentioned in my previous email was about possible
>> follow-ups - not to be included here.
> 
> Understood, I will send them as separate patches.
> 
>> My understanding is that there is sort of a pending/implicit question
>> from Jakub on v9: why are you doing this? is does it solve some
>> specific scaling problem or is 'nl is nicer" thing?
> 
> I think the motivation question was on the v5 thread, and I replied
> there as well.

FTR (and just in case it's not obvious enough :-P) the ML traffic is
quite overwhelming. I unable to read some of the email/patches I
don't end-up processing, and even when I actually processed the
relevant email, I could end-up forgetting a specific contents of one
given email, some 10-100K emails later...

TL;DR: please include the relevant information in later revisions, at
least as a reference link.

> My original motivation is to simplify some userspace hardware offload
> code I am working on, and to finish moving "ip maddr" to netlink.
> 
> RTM_GETMULTICAST already reports IPv4 and IPv6 group memberships with
> IFA_MC_USERS. dev->mc is the only part of the multicast state still
> available only from /proc/net/dev_mcast, so every consumer that needs
> the full picture keeps two paths: netlink for L3 and procfs text
> parsing for L2. The offload code above is one such consumer. iproute2
> is another: "ip maddr show" already gets IPv4/IPv6 over netlink but
> still parses procfs for its link-layer entries. The iproute2 change to
> drop that is ready to follow this series.

I agree that the unified interface makes sense.

/P

