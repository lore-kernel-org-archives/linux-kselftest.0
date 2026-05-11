Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414FD3BD63D
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 09:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778493050; cv=pass; b=Jmn039kPbf2QTWmaB1WmWPDrSlI12mxv7YmCn7/NMOI+okKZCFSzBmm8WY+NxnPgwOZOj8cr1Ps9BdDWREuOq/yMJ+CQt5m8NVdDlKpVmiz5Gi55jjomrBEUYsr7MBY3zkqaW3Ndcr7kXSaudPEHeXH/QdmQ4D0rxe5HvluX810=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778493050; c=relaxed/simple;
	bh=TyZ0hxf2iniFxRampZvCNdzcdN7Urpbpg3cYJjymmNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPM6n9RWoRjGr2s7s5grSDiV+Zh+WXP3C84cp1xyv3TpYhAuQ9A2NTu0KHNMXsyb0ahEqwoSz/gArb50+8/LcHKQbUXXDjW19gWawcbZQQ7f28IFWVJWNggPUf2EDEAfG1ycUUZZvMciWrHR3lrUGgaVc42aJeqZk18acRUSj9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ez4G0l1U; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iGYIg1UJ; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ez4G0l1U";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iGYIg1UJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778493048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TyZ0hxf2iniFxRampZvCNdzcdN7Urpbpg3cYJjymmNs=;
	b=ez4G0l1U6aEyGlJ+he356XorfAo8lsc9M0mRhoE9ceWRxSJvUt4eC19v9WQc+pckPzJi0h
	+D1D2Uw+Q70vtJahsp31s8MooBznIcxQBV/rF8pogMrjWk8igdaiz4KT4eCNNZM9QXLoXy
	JJIwP2ASyQC4fRbU1eiWSpmkQkTtMlw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-2ZtunOrWPBObQw9TZxOApw-1; Mon, 11 May 2026 05:50:46 -0400
X-MC-Unique: 2ZtunOrWPBObQw9TZxOApw-1
X-Mimecast-MFC-AGG-ID: 2ZtunOrWPBObQw9TZxOApw_1778493045
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-393c9ff86c8so15668701fa.2
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 02:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778493045; cv=none;
        d=google.com; s=arc-20240605;
        b=g1xSAOvFAMBPx0BfT9Erta31c7Sww5MDP5yGiXwI87BluGZOFexFrzQGbLb+3CUMFt
         uFEubCMQcmTGmyqhMnP7HzXYj3FvgJfBaNx5VM90U1+xCwDb7XnUiM/5uq6c3PEy1bhl
         IolGCeqtnuJJs5wdH7Au/w7EpHR+gUIFVaZcO+vmPkaks75QR/nAdk5fDykkQNWpoVJB
         QS6ViKgG+QDg7zk/uVcnbW5byL7uCcfVlFFmXqFfc4u+IpKVRbrcDr5k6bRSVrpHc6cF
         +7ZO2ZKSn3VNAJGXxn3uHZTOB55KyuLXDl2HJOnynnGM92szml1s+J1x/huiXv5CNY8W
         v3og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TyZ0hxf2iniFxRampZvCNdzcdN7Urpbpg3cYJjymmNs=;
        fh=jwsfxdsFrvUFZhMkTAyWQrbMKwdyizCpYh3YoINUuMo=;
        b=WYrnGMOxdmSZ9n27GjO9QgZM3UkrgilDD/VNfSbvthRQ9A9FiqWpg8N2mqJzSJZt5u
         R6fsI/f3x0dFdS/PxJiQ0nyYLViLzQG7O+DF0+JcTJYcqt+14Ev49NhFv2XA0gme4Osk
         9MXb+QzVrm77E0mb3vwm+Js2cCDhOMl9C2Fxh50ovUFILBaL4StJacy3QKswTnxpaa7K
         7ejzQGihUJi5PCCR95YtFbQ+/DV19G9DXUeo/xpOYmnzF9s/yxoX/dcT4SNN7LjZzFQO
         EK1Jqdu+cIbrYKk/jAUjslZYhwgSxQyJ/KxuASlcvosuhEuhzJP4a7VLMGvbWxCgrEBk
         tW/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778493045; x=1779097845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyZ0hxf2iniFxRampZvCNdzcdN7Urpbpg3cYJjymmNs=;
        b=iGYIg1UJFu7vIx9Pk44jKpM/yR8klyjVVkMJiPqq09Ma5jaq3n6UdrO5EigGilQnVE
         7LnJAsWKbeMlhNBlKt8ssr+dfLBwl+vB4lF7e/gTMgJoVaLtws4gupjy7CIwVAuvZaID
         gJbkucpNTq8MiVVvdBiIj4UtfiE1Lpq9cNLl5CkleUCh9LnT38g1d2nWdprk5+joSUoc
         f6kycTGlXhY2YTNSZF+/MqXq8KYXeNLdH9hJtmrYWT7d4KOcWw69uX7KXoJl0L9faDXl
         O05OoZwFUg/ddTJ+GFyHaJD28zNrQMgiOeCS4cagA6zFFmC2zELd/BLspNme4wkG8Jxw
         n/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778493045; x=1779097845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TyZ0hxf2iniFxRampZvCNdzcdN7Urpbpg3cYJjymmNs=;
        b=Y6vg8s/yKpJAufjfEpDVjQlOmCoXaCAEVF2Jw7HMWYVRemsgaRU8nlWSjnb1AmXLvB
         SJYRDbIOJUHfvpBRK+v8DRlka5taeXNqtZHsja1RVSPL7hKBK+1U3uBBXojrCrkgZU6w
         sMnJQrM3mitl0aH4aZANFGj5DKXzj8uZBI/CMKTLgWHLLpteC/YKmJ18jHW7TVKwPjGg
         7A9apPBxcYrgTSAaNMVxq8Auv3yMKqEpzIvlorp8so14UyIie60CqtW6Xhv+2u5nk3wp
         rXnAAprdmdgdvkU32U+UXPoRIAxszrOHn5LAuArY+FPjvr2eGmMKEyRHPxaNCSNbPXCz
         Kg4w==
X-Forwarded-Encrypted: i=1; AFNElJ8OgPmLwTBTUJ84crKonShDw/db8lROCevJyYwvecIc8btd9SfqfytjCQK9bwDJLB1PNTGci5Wg3nogeYFq8vE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+IZ8+LuKUpjgnx568dUvrehrxIC26p7j/Wv6uF9QS81nHHg9k
	jfrxWkw8GvV/8BYatNc/UZuv4Vo/JWY8Inow0/Jrez74B46mOY+mauyl01l2eoutzv3p4IQBR50
	Rkd4S7eOT8zuvo5HD9/yNEDwLYM0WFbQtb4Q5p0OrP+n0LKH112zhoB/1w18HcedxSU0U3QuYh0
	r90NRGjqDFkngS+e2pLtZHtbbWdU3i+AEiwPgdsa3pv7Bf
X-Gm-Gg: Acq92OGiJrBcQtqd91dHD2KLWGqtOTZzBjfxkvTSxWwLn4e6w+9VG6H+grvlm7k2m51
	27bXHqiQ8x0qVd7jPC8YG+kc2CruELCz+joX7m3zaGH9g2ABNo1Z4jFOiuRYlngNRCpzpxdl7hi
	Fdv2TIcNJhhEUW2VtaqnpNpA8DSKsYBTYz1t/bEvDAv4uC7aaqKnlAWu8hVxTXD3femYWO3nBcQ
	hAQng==
X-Received: by 2002:a05:6512:3046:b0:5a4:56:aa88 with SMTP id 2adb3069b0e04-5a887ce5cb9mr8074549e87.27.1778493044704;
        Mon, 11 May 2026 02:50:44 -0700 (PDT)
X-Received: by 2002:a05:6512:3046:b0:5a4:56:aa88 with SMTP id
 2adb3069b0e04-5a887ce5cb9mr8074540e87.27.1778493044330; Mon, 11 May 2026
 02:50:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510164337.7611-1-ihuguet@riseup.net> <20260510095246.5c8f6d0b@kernel.org>
In-Reply-To: <20260510095246.5c8f6d0b@kernel.org>
From: =?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>
Date: Mon, 11 May 2026 11:50:32 +0200
X-Gm-Features: AVHnY4KpEIM0JZ6n7jbTbprKPPeQ-2CVzz4QuyQAwivI33Sd8j48Nhm6mgqEVfo
Message-ID: <CACT4oucitAa05V11KD0d2mQYc7h1L36zDGumnRYXn6+6XUa=QA@mail.gmail.com>
Subject: Re: [PATCH net-next 0/5] netdevsim: get link via ethtool, set via sysfs
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@riseup.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Sabrina Dubroca <sd@queasysnail.net>, Filip Pokryvka <fpokryvk@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

On Sun, May 10, 2026 at 6:52=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
> Could you please explain your motivation? Feels quite trivial,
> so it's not immediately obvious why we need tests.
>

We use netdevsim for some userspace CI testing here at Red Hat. Specificall=
y,
There are some tests that require reacting to carrier changes on a device
matched by permanent MAC address from userspace. As veths don't have a
permanent MAC address, we need netdevsim for this test case.

As you say, it's pretty trivial, but IMHO there's nothing against it, as it
will help to resemble better a typical Ethernet device.

Note: we know that there's no guarantee regarding netdevsim's uAPI and we'r=
e
ready to adapt for any change, but the truth is that there's no reasonable
replacement of netdevsim for these kinds of cases where veth is not enough.



--=20
=C3=8D=C3=B1igo Huguet

