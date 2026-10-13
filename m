Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7C22D8376
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 01:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791855913; cv=pass; b=osEDym9s9TRJ7kK3QjLFqwzHaL4tPaJPlumd/6lQ2PM3RrvkJKUlL3bE88CVCNSzE92RMveJRlHUs6BS3yNdOah/ZTGkblwZ3o35cW/EK+icC/lGmUTB++dw1wYrq9GPo7NMeZTryF9qLjSy7K5qFZxkw7Kj2gnPKUNpF2Aznco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791855913; c=relaxed/simple;
	bh=cz+gED3n3VMR1ENKlJ+1/sgawu/JrM1+H8MqpXBZQP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FKruhmTADVBiBUPFj6Hy3ERlSaZ+QlppJg+reD6F1rwMvRI0P5IXu3pbWBFOQdQEwOKIDcvPzZ+8hHwEQWwvC/aJ1Vw5a5OBFR0FnFB6gpleHNUT+ueUc6MYVxMFHvNZ6QAi+wGXbXgQbQxZ8Chhqhba2mmbk36vEDFy816fq/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXsEqth1; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXsEqth1"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53512cd2f85so32545261cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 18:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791855911; cv=none;
        d=google.com; s=arc-20260327;
        b=emAbvuqty4IXiWa2+j8oTDnjdaLF/DsBk2rmqJGjYgj2CLvox+1nt9x/Tnc/c/vZzz
         RGIqlgs1EXFF5SEWQdJG1P+1F0pkjuHjSvxPA++z4MLyyO2kFo6q41czGGu+F4T0SJzG
         nfuO087lu37dnnsNFctLkTDUnGsIqd4W4IN/XClVh7CAove//aiOZa+aOIywsIELAmp6
         plT1e35xAQ0hKqS5b0SywLoda+A9654u+npkH+JrB8h+u8qGSLKdEUZ0CUABmssPxv47
         0WamMs9iLAQZ4y6JgFOC1FCsf9Bnyt5V62dsSXbzE427Rbfetsfr6hjAPNyuk5MOhEIZ
         psVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cz+gED3n3VMR1ENKlJ+1/sgawu/JrM1+H8MqpXBZQP4=;
        fh=fhDcifAbr6hiBC41bhK3neHp0KvQfAyyvaIMIX4ma3g=;
        b=rjLiEorlFxkI8IHPGwYYe7/vvQlfxymKZ91llD4AzsyglxjI03X+cGrzMTqszAkjtD
         ixTq4cF4w3NFm65gkoIofJRY9TyceFoyrdnh7IU/rUk6PIM8SxcUBSxuJJhjfs5Ow04G
         iOlAz/tySr61JCjykq3uH0kvkvFtLTFI52TJkRz9avQA8GoQIHGcHq42xy6os0D2KdDT
         xSSdpRzHtGAODHhkgDjY7X4wG2eY6lNp5yECdojxJsfe+PJgc2VOWVqUgoN6rTzEWmoM
         jJ9JSTpxNx1bjJV42Na6TPzUpn6YzdG4cLAIhjKp4TOjDUWrzngc1oBs48iBYX99Karq
         lk0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791855911; x=1792460711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cz+gED3n3VMR1ENKlJ+1/sgawu/JrM1+H8MqpXBZQP4=;
        b=dXsEqth1P9jLVPPBygKZYVsdWxVsgJ001QvH6xJILCjdlHJNtXXFmUrPWXnAoaYPKf
         2YaADamCfb47RAK/+GZ5046cFz9FJJpDnLJkI9it/4Hq3rdXleE7Hxrl/O75O0aL68CY
         CcrmyphYhMN1nt6zk/rGRSdSOYgqW5fJK+YH8pY6JLdO/XMUNf06xVM9b1dvExYXqQ/2
         3bqQxG5m06URnmTFSCqEPcyziNcgwqLJfg6ayLpJ/z2JHxdF9KE7gcNPeWzmfheCD1Gp
         5mFlgszfUEdoVWbKZhQsP7WZsBQjnDTSjdR4BpWsN/47562yAJyrA1dDNr0BETOLfzg7
         CVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791855911; x=1792460711;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cz+gED3n3VMR1ENKlJ+1/sgawu/JrM1+H8MqpXBZQP4=;
        b=WnoRSUykKQ07VzXUOLE4QHzL31sWU1etPEct9G+6wNdJhUISkaETl2tLUBgnzUMf6T
         Hnvs3fBBlS1ESnx5R7OI1DheNTq32K7tc4ZMIqMRhsmvE0U485lbbZI2Q05uD01unTFt
         7G16Tyfgw3pxNjDLSLNMbL67sBFmYeo1SlvSQQudIjdB3iIuV8KUjRXSDuFXVALY4vtD
         VNbsLjBaUH6OiaOJWwRB1gDYLCLbGXzblsFg1fhZV0CuXpgkO0nUEil5aejSubphmv4H
         iIci+mDeJidw9Juzfn93flWiSRMSZ7k8VSf6z/PmnODAf7uW5ICqUd6rrtTT0HJ7iUTr
         y0Lg==
X-Forwarded-Encrypted: i=1; AKwUvBwLBEe+8smthEFi1BjFEXSV5IQgc4GWu0E5yUeH0FaptI1MhnesBOlucgTVf0HqmmUn7/y4LuuX1Fs1ZPG7Yyc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrnbUgr/oIO3R93tx06VZGHo+YRKHgFJG5ZcPMQaXkreOk9iWT
	lglTz6evUoCz/46TTNqWVpJC0KvPQ7CCaYt3xZD7d7WPNAeuFSdTzHbQwuVVMNoUCFJAxQxE1LY
	S0xDI+E299uG9Lzc+LvAc24QhC2DM1BU=
X-Gm-Gg: AYBFou22qUpQm7/AwS2chjj0UvfE4S0+qW6W2NUWQPOL1lwgKyJBvHwwCBMaSjdtfFj
	4fC5trBH+onBhfqU9K0VsAfeM6bCUdOI9s6i3KdXSi5qIy8wgUt+k7Ab2cYLO369ByIkdjYncbo
	BnF195P4jLKtr4K4JlHbIWFlCyvnmPtMSwIsifbzfB7ETPh6kmzrYkdfB1WlVtTtcZ9iERKHZvc
	KIsIQQpprLkn/Prz2O4Nxk5PDkhlPw6dhH7vbGOX5+dVixCaInn9laMZnL2pl77DDKBoUzsxOXL
	iZOO6j0qfWq4R9ncq2TAZ4HyDyB0SAbmvdmQGwFgX+QkiMoJUeH6Qv9CbGIci1+iq6gIabcpF+S
	ssT7hqLMdwYSfKh+WVj9foA7o/Vo5HrF6BGFZr6/QFWLDMNlHjJ9ASe9AZjPRtDggAQ2KTQ==
X-Received: by 2002:a05:622a:342:b0:530:430d:87f7 with SMTP id
 d75a77b69052e-5359fba77f7mr196535301cf.47.1791855910479; Mon, 12 Oct 2026
 18:45:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-vsock-guest-ns-v3-0-b32447c66b23@meta.com> <20261012-vsock-guest-ns-v3-4-b32447c66b23@meta.com>
In-Reply-To: <20261012-vsock-guest-ns-v3-4-b32447c66b23@meta.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 12 Oct 2026 22:44:55 -0300
X-Gm-Features: AclHuK-kA8q05fe6Esk_oixM2BCHb47BieLQLjZDYfiDhY6CS2aMRdOMVHtXa5s
Message-ID: <CAMAsx6fKVQaYLzkK34v5DRkmQS5Ym-XqwNh-+Jj_Uue8NJCNUg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 4/7] vsock: add a netlink command to assign
 the g2h device to a netns
To: bobbyeshleman@meta.com
Cc: sgarzare@redhat.com, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, stefanha@redhat.com, mst@redhat.com, 
	jasowangio@gmail.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	shuah@kernel.org, rdunlap@infradead.org, donald.hunter@gmail.com, 
	edumazet@kernel.org, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sargun@sargun.me, jlinbox@meta.com, 
	bobbyeshleman@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 12 de out. de 2026 =C3=A0s 19:51, Bobby Eshleman
<bobbyeshleman@meta.com> escreveu:
>
[...]
> + Movement to an unreachable local namespace results in sockets being
> + closed with ECONNRESET. Peers are not guaranteed to be notified via
> + an RST.

This reads a bit differently from the sysctl documentation in the same
patch, which says:

Connections established before the move, from a namespace that can no
longer reach the device, are closed with ``ECONNRESET``.

The net.rst wording also covers moving the device back to init_net from
a local namespace, which this sentence does not. Maybe use the same
wording here:

Connections established before the move, from a namespace that can
no longer reach the device, are closed with ECONNRESET. Peers are not
guaranteed to be notified via an RST.

Daniel
