Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441650;
	b=SQEnt1p7PjADCDlZyUTZEzw49krt9Eob3pvTAyxe/mMQXz42EHqWHm2zkm/PHFrFMOsW
	 cGmhomlEw6tbFslmNUjsGrcS3pipAiFxXGvPgyRcg0G+ln3mt4HvKNXgBSwR8gnM2E5fx
	 w3qlCFn+KuxQq9NNoMkLRiotiWHRlztzLf7b/dv86FHOmBboIufHKy/SmI9OQkRrmhnVW
	 FsL0tdauWt8qLJMplh8mA14JE5HKupxUvl1ysi6qlGqj4xs09rooqwPf1ZPgI48v3md8E
	 +36VVqqFvt0245pDuBBzmGx/IKw00VOOKxZWQoDmXC8e5qS+9vywp4HQGpwF36iL1SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441650;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YLrN3M1XfLMhZZJEefU5MTc8mdCMhL4DOsawNJPcdvE=;
	b=Cjj8bZl/l6aqmW/z8mL59wh5xi5ZlVmhwY3BT8BIzywy0MPszYrxGcwbFCzYvTJ9EZLf
	 FRvb8QamNxgiMJyqcBiixmnJ8W4ygvFwmqavGQTwcyhCSnP9nbVmT9LwYe0YXOswSZ/Lf
	 yu35NDk/jqbAJVmTzrwijclNHy4UwvBRIVHcdOKqmiTuxmuEOtwNBzRkPGUHX5egDnfcT
	 tGzTuj3pJgkZVRAdSvCZgGJcGCML1VSDTzrDfsdP4iTaMzI7rGKsbpDQXWg+Ky4g+ZWjW
	 mfwTkT93w8cW8mjB2GGeslva7KoDmdKaXHg2suj+02Y4XqZToozqv4vp39pD4d1C7bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U2E3blKh;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=V0xv+J2H;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2358606A31A
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 13:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2358606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U2E3blKh;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=V0xv+J2H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795441648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YLrN3M1XfLMhZZJEefU5MTc8mdCMhL4DOsawNJPcdvE=;
	b=U2E3blKhCpTMG5U55cymefi684vNSW83fU9cAkSNT8B2p3Ec1SX6Kk/gt0yBuT/DeIbLeA
	HmQMow4pcbz8uYLh+3zwAZ+YpHe2VDdZkaQcLSf23a4NuRfq5cBPHnzYguPGai4tXFJWjZ
	nqG/e9S7EjFS7amUQPQxV2GLOHyphE0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-DuZBRYbnOe-pOYU2_Bavtg-1; Mon, 23 Nov 2026 13:47:26 +0000
X-MC-Unique: DuZBRYbnOe-pOYU2_Bavtg-1
X-Mimecast-MFC-AGG-ID: DuZBRYbnOe-pOYU2_Bavtg_1795441646
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b586b0a795so2630825a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 05:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795441645; x=1796046445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YLrN3M1XfLMhZZJEefU5MTc8mdCMhL4DOsawNJPcdvE=;
        b=V0xv+J2HSN1NuVUAQZjFAVgWhJS9eY4gd/lrrpRsjjr8Kr8p0SBzHilovKAKfveNGB
         dR2w8XYjmUFyD34zlzphdz5RYGaOsWch/8N0jyFkACv4GslVhAfjtuOboh12glRPHc4D
         AKgI49408j7ZcqtII19BJJgFuOGXwY6fbO6Epn4P2L/+iCn1ABO4e3Elt5ih2nlZ15Jg
         1zHCmIhVRwaFVXrSSMOUDWCexWxefsJN/xcg4od1O6xGN1c4NuIApQK4/rncVKojJqv9
         iecKQuFR+2hOsVYxHD/3zmM1toqLTbnRy81dr8Ugvn/5RaVdbMdc5gnd/hDCnBthMJLa
         +1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441645; x=1796046445;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YLrN3M1XfLMhZZJEefU5MTc8mdCMhL4DOsawNJPcdvE=;
        b=o497xPot7OHOjgvOpwPgYCq2RxvGvEC3aqaAC2tpW++WwRnMP8KilXllpYXzSVOQ7O
         F07Ey17ccLJ/uKGZNhihr+TAUy1NmO1VU/0vgpC8OI6WZOh4rIMrltHBD97rkG4LB/aJ
         I376LSTGM0hHWKQdsRsqQByVgE4oo1nUUcg7TMCtlk1asVCq70s/oKcW0iGVz6b/4EIh
         AOBv8E98NROVLWZ27zUAK01eW9TFsKECbOPGcnvekH2J4wg2OktSMHg/SvAk0oqH0WBa
         vp6v48k/gzZOZmSTr22vY23umA1bgG9PdJXFc36n+QALlz7dP4UQKGWVw5oisZCDMb+H
         2rmg==
X-Forwarded-Encrypted: i=1; AL+hErFPI+sP4ijMZ5Vl89GN7IBRk4H7KgQOdcyKfnwDu3ZmSJMCBKq5fnG2GxY3k57iWjUQa5b68vIe+5aVe82itmE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PpP4sWxMli8qbLC20yKwJebA/F7cLmVuvYXWgN0jzl/SGa3kN
	sg/Nh/hE0sXrBFGymeLny9tm2+8YMV3E4JKmDHpwQ86p0OskiM/riexqJJwLgRNTc3dD2qo6F5t
	LItYEl1k8J5TMfo3t+UeaafFJMHnI/fmr3IuJGtcWOhx8G52kGxv4vsitViiObxcJYFahPw==
X-Gm-Gg: AZFdTZeUnUKaIsYFJdJixgTSMwPxEnNKXya/KDQMCZMPCb/0LoKhHxTCtr6tKyoHLII
	mG74/R2VauEoV1azD1xK5nPlRZo622r8yn8VRDb58NkO6BMpVL5VCkcWqyIzP3QzYgq0yzRiYyP
	SjlEihCmiSHn1N7CgtVYsJPkXnt1QPawyvRN0eZiaqgFsWm5l3YTRep4YVisX4DP9oZhyTt60oq
	jD7Yjcvrsdk9/fL0KB6vH/AZ9augAhKK0xShN7dhW+hU1Bk2SU/d/usByyZ3/ukLGQ/F0pEg1eo
	gmltLqHuAX7SeI8huPP4rdPk0SNmD2phmp/AUYifApoAv5BSwdnvQEZh5j8nBCGWE54LZb3AjYU
	AyCJdj6exGB3h+4KPN0y1Gfbc1SJchdJLeo2/8piiTGngaZLj2pQc3S++ir0CSqk/fy3L9Fnt65
	1xWvAXLPzFOb5DCKfXYT4OQrjRgjdd5OzyaqHwqaOpKjPV
X-Received: by 2002:a05:6402:400d:b0:6b5:9849:e328 with SMTP id 4fb4d7f45d1cf-6ba37ebdda1mr7965714a12.39.1795441645558;
        Mon, 23 Nov 2026 05:47:25 -0800 (PST)
X-Received: by 2002:a05:6402:400d:b0:6b5:9849:e328 with SMTP id 4fb4d7f45d1cf-6ba37ebdda1mr7965674a12.39.1795441645139;
        Mon, 23 Nov 2026 05:47:25 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109c58sm5253555a12.33.2026.11.23.05.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 05:47:24 -0800 (PST)
Message-ID: <923664db-2b04-4440-8b07-2965c1e97aa0@redhat.com>
Date: Mon, 23 Nov 2026 14:47:22 +0100
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
Subject: Re: [PATCH net v10 2/4] net: hsr: refuse forwarding devices as
 HSR/PRP ports
To: Xin Xie <xiexinet@gmail.com>, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, horms@kernel.org, andrew+netdev@lunn.ch, shuah@kernel.org,
 kees@kernel.org, petr.wozniak@gmail.com, qingfang.deng@linux.dev,
 fmaurer@redhat.com, luka.gejak@linux.dev, bigeasy@linutronix.de,
 xiaoliang.yang_1@nxp.com, skhawaja@google.com, liuhangbin@gmail.com,
 stable@vger.kernel.org, sdf.kernel@gmail.com, lukma@denx.de,
 fmancera@suse.de, danishanwar@ti.com
References: <20261117141922.20-3-xiexinet@gmail.com>
 <179514132185.3136.17085396682149520983@kernel.org>
 <1f2ccb87-9017-4053-b8c8-5b31a211bd21@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <1f2ccb87-9017-4053-b8c8-5b31a211bd21@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 22:30, Xin Xie wrote:
> On 20/11/2026 03:22, netdev-bot+sashiko@kernel.org wrote:
>> Can a plain veth slave still re-enter the xmit path of its own HSR master?
> 
> Yes. The redirect case exists without the patch, and the commit message
> lists it as not covered. seqnr_lock has been held across the port
> transmit since 06afd2c31d33 and 430d67bdcb04. The patch refuses port
> types that make no sense as HSR/PRP ports, which covers the syzbot
> topology, as Sebastian suggested [1].
What about explicitly detecting the AA deadlock maintaining a per cpu
status?

	if (<percpu_hst_xmitting>)
		// warn_on_once && free skb && return

	<set percpu_hst_xmitting>
	spin_lock_bh(&hsr->seqnr_lock);
	hsr_forward_skb(skb, master);
	spin_unlock_bh(&hsr->seqnr_lock);
	<clear percpu_hst_xmitting>

/P

