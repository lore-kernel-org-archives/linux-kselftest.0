Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686702;
	b=CIKem8EF1qQFIniXJyd82GPxRvutnCKmC20NnnnsldIjWU8eYWzHGp3Vnem5/hP/+taQ
	 l1lIIE96wgVlUhIHQFYNG2VR8VJ/0KSvLuoR6pP+lJ1FA9D98FHV2/8cxNHA98A4HqldV
	 yku/rRZ/S0jwwHa7t2Fv8vQY/BDkhb3PnWiezyMhlOpk2t26mPxiOmYZiNw+uKs8wSlJl
	 8iy+wGkbk6U6cWOD02ek3+C3XKeo+bVzsTHG1MoQKXXKYowo7oi8sctvitqPdAuMqHVj1
	 rqCVJnaXvG5nlIuFJdimlIxQdcKlD9bUk7tO+I6/LtKg23xFcc87u9fkihGS0NotvKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686702;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=b2b0R37N0cNDG6LwdnW9AOEOCqhnsuMIntkJk3OiCVk=;
	b=VLl3IciWz5a6x9p5uGk2XVDKuljW9FGun2sSobQiUJxrROSGGeXScj6jj3rC+c8EKq29
	 ZhoFF+PfM2mksrJHAOiCUxWH0q8XdykjHfimS7pQMEUKq4xf+LPjxQWnyiCpOFbZyPcIN
	 JeLhbeZFLBTN47+R2zd6AF240Iv5V6MHbVzDiFycdQiqVdDd17WfhGXqnnETPaGJF+k+P
	 eDFA/G56TyVlEBBjr3HAZmsrOO/GZF5aFlegcPd20zGeXkQ6SGYQ3mw5GE3EDJyUnAKDJ
	 9ZV9ioc5lZOZSmOaDzzwncJJNUk1JChrljE1R6ITJEOj77yXoqwoY/0bfJ+ShZrkhCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NglhJyuj;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eSf5YhDs;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92370606A321
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 09:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92370606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NglhJyuj;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eSf5YhDs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795686700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b2b0R37N0cNDG6LwdnW9AOEOCqhnsuMIntkJk3OiCVk=;
	b=NglhJyujZidG1wh9KnE18o4xefEtv14FMcA8ak08V8XoQBmG1b/fEVGJVd93CrD2oKQcEL
	BfK9jY60wQ/5xihueEr7sr0WBEX6qLW+zwl6kFe7MB78aGE4j3q+XqVaOHzFE/VuEvQPPk
	1W1N1J9zC+JGOaMEj4ahFxjpNHuJLP4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-iVGhGZe8OB-m5b5RAN4S0Q-1; Thu, 26 Nov 2026 09:51:38 +0000
X-MC-Unique: iVGhGZe8OB-m5b5RAN4S0Q-1
X-Mimecast-MFC-AGG-ID: iVGhGZe8OB-m5b5RAN4S0Q_1795686697
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4bbc86e1eb0so709095f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 01:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795686697; x=1796291497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b2b0R37N0cNDG6LwdnW9AOEOCqhnsuMIntkJk3OiCVk=;
        b=eSf5YhDs7s4d/I+PuOqPG7GnNpSXVv5YHZf2MTaDiGSvROudWXnjtlOkgjVsqw+WpP
         lTDSssv14eAoLBy0bl1Ci2jfbWBegKn7XEOaliLTA5vt1Z6j1pZiFCA0AAj3hDDltBos
         6C3+AdPdLxVsXx8Xv/cyIHWJ4ltIx7vVQKZE/K8Nue9lFYlJMLTfgqalzC2E/rzpZQPA
         O1mCoK87jRv6TIUQaOmHgKqRFIOu4HKDLbFnkUfgPdOLYDcP41qbWWBllhlVS+lVs3lb
         QH0d9NXFvc+ZBTENAKxP/WwA5UuA0jDFKl8yuoT0dYbrNJ8LouJ070V2AyeDNGcZVAq1
         XW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686697; x=1796291497;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2b0R37N0cNDG6LwdnW9AOEOCqhnsuMIntkJk3OiCVk=;
        b=FFuZE715yLQX4w74GjMztRiA574qnwk0gNnAPd2esy+h8STldo9XsC8suovvTQmqaQ
         QGNdTKvQ8YfD4loKYhAkvLJJ4zcqNrAaJqOmJs6uQToW+Pw/eXWHEM0PZwW/Aob6gEMS
         j/nK74faAT6NpbZnls8+JB+3Iy9uwPUViz9qSgk3QB/Y7d8yyX8G54qGkpVbLiEOpz4/
         4KkmGI0Dv11QgYTscFeIJtuMlfLd2wmAQVwtgAUlxC2KXCBSxV6OuIbWAl9EvDRngaeh
         OE5rbbmYmeTRoR5Sj7ERBpYJRqAKDYRHYrS0dMDmMPWknSqywQq8lrFgl8Bp4sYV1rS9
         yt1w==
X-Forwarded-Encrypted: i=1; AL+hErE2oMqvWbtRNF7dpvpM5po25/7vHTzq+h1gNY96UahW7CiUUAQXfYtqTJdKT0VVJ1UUfFy1O/urr2uJAUL42A8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eNaq5y2lijfDW2FTp+uYIqbx8Rywtni2Th86vDqw/5g9UnNcJ
	kVqGnLL7n/+xKRZ8qslKfYxYUjlyc/UieVcF7XjGVzA2KTa0papM2v9n16Xb55SuYpWFvOzVU34
	74MjFtH/NOQLEXV33Gqw2tLG9nDSia99oHcZQJG+qH1awu+CT3vRQ1ciDuWMiMiq+Pk1ijw==
X-Gm-Gg: AZFdTZd+HcGI2tdBd7t3lQ4pLvIvbVBboY2XXFF1IOllnTM4Fu8UoSvSZ6mTGJGfk0U
	FO9Sa8zAqcjAc80OTmTTc7zeCjNjICEDdANWCVVN1AQlCAw2tQBMXOnBicC/QS4UTw6xcGOgstT
	cV95DjJKbqFB2mGTRudBolvIpAJaXntGCT0ac3IIkTB3MxFolktaBGkLdroxXQMf1bsrrf9SP+s
	rR95b1FRxAXo+w4qG94vMlSGMAtL3uAdRKMaHKBB3WpYjxsAf9XKvqUdS0utdi0E12xpSX3Op0F
	g1Ui37C2N5kPrpr6eywFP28LX182U4KNA3uWKpj+/54nWqd/9/M6PXY/2pG47YdNpFN4cd99Zld
	5pkwAUdTPuKsb1nCaVRh25NIpNnBKn54WqI5azJVhZZzyXMxrU/1QT0fFdBYkMT1OVsAmLKTpim
	n7aiPlX42Evq3YFkaM1fmBW9ST1T8PXgnShzgfghZzeZXL
X-Received: by 2002:a05:6000:2c13:b0:4a6:9f2f:4153 with SMTP id ffacd0b85a97d-4abaac57ba9mr38614708f8f.1.1795686697234;
        Thu, 26 Nov 2026 01:51:37 -0800 (PST)
X-Received: by 2002:a05:6000:2c13:b0:4a6:9f2f:4153 with SMTP id ffacd0b85a97d-4abaac57ba9mr38614627f8f.1.1795686696684;
        Thu, 26 Nov 2026 01:51:36 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm39627871f8f.52.2026.11.26.01.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:51:36 -0800 (PST)
Message-ID: <e07adc3e-838a-4c46-a56c-eb47bb9e77f4@redhat.com>
Date: Thu, 26 Nov 2026 10:51:34 +0100
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
Subject: Re: [PATCH net v3 2/2] selftests: net: check TCP IP IDs across
 tunnels after GRO and GSO
To: Julius Bairaktaris <julius@bairaktaris.de>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 willemb@google.com, horms@kernel.org, andrew+netdev@lunn.ch,
 dsahern@kernel.org, idosch@nvidia.com, ncardwell@google.com,
 kuniyu@google.com, steffen.klassert@secunet.com,
 herbert@gondor.apana.org.au, richardbgobert@gmail.com,
 ecree.xilinx@gmail.com, andy.moreton@amd.com, alex.austin@amd.com,
 linux-net-drivers@amd.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, leon@kernel.org, linux-rdma@vger.kernel.org,
 alexei.starovoitov@gmail.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 john.fastabend@gmail.com, sdf@fomichev.me, izaiahsun@gmail.com,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 shuah@kernel.org, bpf@vger.kernel.org, ipsec@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1795284858.git.julius@bairaktaris.de>
 <2f75527eb49d7d4ffec32a61fd7dd080673dc57f.1795284858.git.julius@bairaktaris.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <2f75527eb49d7d4ffec32a61fd7dd080673dc57f.1795284858.git.julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/26 19:27, Julius Bairaktaris wrote:
> Send TCP segments with fixed or incrementing IPv4 IDs from a packet
> socket, let GRO on a veth merge them, forward the merged packets into
> IPIP, GRE and VXLAN tunnels over IPv4 and IPv6 and into ESP tunnel and
> transport mode SAs offloaded to netdevsim, with segmentation done in
> software, and check that the IDs of the IPv4 header in front of TCP come
> out as they went in and the IDs of a new outer IPv4 header are unique,
> or for ESP tunnel mode increment within each packet. Also forward a
> VXLAN stream with one header's IDs fixed after decapsulation into IPIP,
> and send the merged packets through a tunnel that the far end
> decapsulates without segmenting them before it forwards them.
> 
> A test where GRO merged nothing is skipped.
> 
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
This test is very unstable:

https://netdev.bots.linux.dev/flakes.html?tn-needle=tcp-fixed

/P

