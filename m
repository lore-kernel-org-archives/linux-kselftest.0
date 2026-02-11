Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D592BAF8
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 17:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770830552; cv=none; b=iSC27T4h6DvP4EHyTE8NzvVic74ztDjCuhlwyrOLMxCChEtvh4kSdaCnu5f2zNCFG15hRaT817jALYRndiPSQ0wLuM2EDZvjbYrtPCzpOyJL0rmP/1duC9LPU6x6ra/0lNlMmPVXIMak/ABULEAMFqaEq0pJLx/5fNAWDRJnWPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770830552; c=relaxed/simple;
	bh=7JJEbaI8gADvksOgSC/RqZsRMhXUw/AVhllJQLiiqS0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=MKp4K/8gYIf0wJYy00Sti9tMSWWvDBH4K3C82eGjfFF8cZCFBVVzUCrJDlt3m5sE4eZ260cWH4ok7epN4SN5gPUY74cpwHuLkRWjDCRjZTuf1/o8qoyTCaWAN08kcLrA1xFZEG1ljwgwnoHmVdnD5MzDNSHyMQbuBa0a42Km5xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSTaXBzL; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSTaXBzL"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64ada2c30a1so3930192d50.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 09:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770830549; x=1771435349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOPQYb8U+ctug5FsMgUJIr/auxzVIvYKdx/PJfk6yUs=;
        b=BSTaXBzLrVSI8po5vn/kystCdl7+M+5unWrIMI0ukIpP4/YQtGBGKk9rj/ZQlhOrS8
         cIGbQhRheZnfl/6bHI+csINg8+uKoRDt/hynlEhoi1uWx6YA99hqZVfOXnrfl4w1tMNy
         54m5L790dNRnteodDLPXMXlvAYc9Kvhy0QBiFk+mqKTM333SXDBf1RiS151Ie1iNx1vO
         2p1JcSmsz2x4mAfNAhosoZUH6veqdRy9oUrQtLc8wgkvepf+JkX1LEaBOOH2k4llZg3i
         Qw1nNUM2aQdhRy28HyiEBU6cERF6a3cQO2rlXcwRmuugZRR1c5Ufd34M9xDaNOyG3aUH
         a4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770830549; x=1771435349;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wOPQYb8U+ctug5FsMgUJIr/auxzVIvYKdx/PJfk6yUs=;
        b=OAxN1u+FwCOvXZdInl8JT2skkyl3ImBrbLVJkEzvsTe4ZJObZE0zZ82GQt+G34lct7
         itKJ3VoERGNKBZ5kilURmGq0ipx9FRS0xTh8px/E5Oip7zXMVzmj5ZrlibOt5fYNfbuj
         4d5C0s8utp5ennvqX/JwCVhDAh+FWA0I1EVcCqFI8lNh1YovKYDlkvJ6IbcROL/vryXJ
         SeaUXWW5yoDu+DBSJXACqP2lRq5vTxy3IkL5LNqjmr++7Ds8VVxz4Dt8jVpDhCQiqMwB
         cRNXD23RW3wZdZAoHz7NbDOrJ+rBz/bxl2Qso3PQUeaDZ/ySybagouIBmsMece2GgeSR
         KJlg==
X-Forwarded-Encrypted: i=1; AJvYcCVhJe8IgOiJ8yQ4Rtm+pIOpCVXEWDEC4yxAEQmiUR0jvWazZqbr71dOziNVXHQsJ6etGu7w72j3hggIVunNncA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMs7iowU0BSrGZ4hNJToEQITw5iFa6Nu0j0NiXMuAHotvmLuYY
	7Cop2CAR4kSjsgwXJO8HkkSPXTRFd1YKvSd2d1RcGoWVOe7fUQl+ssjU
X-Gm-Gg: AZuq6aKKDBS0ra4W5ePcjxlsmHy4A5ahsPVVifCUZZ7EVr/1GOaWR4L2IIwNPd+cFck
	HowD4bFaHOf69L0wxM57SydwckADQ0PryIxGKz9Ufn3Wtf2HCCqhkpmFY0MaFW09yM6D2sYRKu4
	74M1RwJij1RVMex6FBFjJWfRfm0h21Wivft3TwjdjKvs5hsFo7SQHwKHMSVcg7Mb/wqVT62ZLup
	oIpSRtUWsfjyDexZ5efURQuq5Xihui2zUiZR6zk3uvAnPCtOhMQRwFbh+dGPUDUR6Hn48mXfkbF
	u4xTAQBJah134ahULIcuRfBXvnOM8YKJ5BjTX1ZK7Gqb0cb+etmoZnDo2l4k9HSXl8cnO+KSoVd
	Ellm0u2fjujSOAdI5ZHqTWXCTHh+sU4BNQVEjNwoSZlvzv1JWKj8rsZwL2jwVJgQfwyMQ4NGdUS
	hMZTbBYFAe6aXW7gbB4wdmZatxGwWpK/DTMqTY/9hV52BIsY4saQ0XpTu4+gS2LyssaCmJFQk=
X-Received: by 2002:a05:690e:1513:b0:649:bb4b:f822 with SMTP id 956f58d0204a3-64bbaafb604mr17332d50.48.1770830549204;
        Wed, 11 Feb 2026 09:22:29 -0800 (PST)
Received: from gmail.com (21.33.48.34.bc.googleusercontent.com. [34.48.33.21])
        by smtp.gmail.com with UTF8SMTPSA id 956f58d0204a3-64afc73fe6asm2480743d50.0.2026.02.11.09.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 09:22:28 -0800 (PST)
Date: Wed, 11 Feb 2026 12:22:28 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: davem@davemloft.net, 
 netdev@vger.kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 shuah@kernel.org, 
 willemb@google.com, 
 petrm@nvidia.com, 
 donald.hunter@gmail.com, 
 michael.chan@broadcom.com, 
 pavan.chebbi@broadcom.com, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.b86b179834ad@gmail.com>
In-Reply-To: <20260211090013.12991cd0@kernel.org>
References: <20260207003509.3927744-1-kuba@kernel.org>
 <20260207003509.3927744-7-kuba@kernel.org>
 <willemdebruijn.kernel.743811e01cc@gmail.com>
 <20260210175638.123782b2@kernel.org>
 <willemdebruijn.kernel.503ed4ace7bf@gmail.com>
 <20260210194814.21a0c403@kernel.org>
 <willemdebruijn.kernel.172899765680b@gmail.com>
 <20260211090013.12991cd0@kernel.org>
Subject: Re: [PATCH net-next v2 6/9] selftests: drv-net: gro: use SO_TXTIME to
 schedule packets together
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Kicinski wrote:
> On Tue, 10 Feb 2026 23:21:07 -0500 Willem de Bruijn wrote:
> > > > I wonder what's going wrong here.
> > > > 
> > > > fq_classify should pick the queue based on skb->sk also for packet
> > > > sockets.
> > > > 
> > > > And flow_queue_add should add the packets to the tail of the linear
> > > > list if the delivery time is identical to that of the tail.  
> > > 
> > > It works but requires that we either modify the qdisc config to set
> > > a orphan_mask of 1, or somehow set the skb->hash on the AF_PACKET skbs.  
> > 
> > Oh right, fq_classify does not use skb->sk for packet sockets because
> > they are in default sk_state TCP_CLOSE.
> > 
> > And this is by design, as clearly documented, as packet sockets should
> > not be assumed to be a single flow:
> > 
> >         } else if (sk->sk_state == TCP_CLOSE) {
> >                 unsigned long hash = skb_get_hash(skb) & q->orphan_mask;
> >                 /*
> >                  * Sockets in TCP_CLOSE are non connected.
> >                  * Typical use case is UDP sockets, they can send packets
> >                  * with sendto() to many different destinations.
> >                  * We probably could use a generic bit advertising
> >                  * non connected sockets, instead of sk_state == TCP_CLOSE,
> >                  * if we care enough.
> >                  */
> >                 sk = (struct sock *)((hash << 1) | 1UL);
> >         }
> > 
> > An orphan_mask of 1 sounds like an effective workaround.
> > 
> > I don't see a way to force a specific skb_get_hash result across
> > flows, given hashrnd.
> 
> So WDYT about the patch? I don't wanna tweak qdiscs on real interfaces.
> It's way to hard to undo. IMHO either we keep the patch as is with its
> limited effect or just drop it.

Reviewed-by: Willem de Bruijn <willemb@google.com>

I would say keep it. When respinning, maybe add an explicit note that
for this to be effective FQ needs to be installed.

Aside: there currently is no API for the kernel to communicate whether
a cmsg SO_TXTIME request was honored or ignored. But if a caller cares
it can either request a Tx timestamp.
