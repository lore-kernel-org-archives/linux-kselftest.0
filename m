Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5173E00BD
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 20:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783542954; cv=none; b=phFNNfAK2suhBtQMEnl+YDEZFqUgfLcmhvnXEUUqlrAwTk8oB3UiIxFVIFMaFyGVza+FfmCO5MHhCw108xALS2fGBYcSkE4w0/iZpMnFHJEwKbQwFUC2a0sAlKMGLu5rN5Y+lhwyFaJX0KVIJOe4r7BtXWeDG+LR7S19vK2zJWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783542954; c=relaxed/simple;
	bh=3I3mp7KJKi0CVH2nIGOLczzk5TWZIUatXfsGuzb8OvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnsS7BZ1AMxp7V2wTGPs4Qa8abHsqd6ThnJ+TboRfxIIBvjU5Yv1GYr7H+y9hG9Ga3o8hFPsdBVBaRmEr+/BbZgAT0EjfW9TQik2GXS9Veh+KLbXm2NNIY+UQOPoRuLPpTBXX3ENSLaubkAyQ07TxyBB2vKvD+AA1o40a3MoW0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ip9XoIOX; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ip9XoIOX"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-48d6c621a67so82795b6e.3
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 13:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783542952; x=1784147752; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=24xTmwwfHf8GGJ8ej4fMcb3MXrY9M9ELYMVJ6Iyw0KE=;
        b=ip9XoIOXuDEuy1U/8yUG9fQeLr/aaQuWlysRfx7lToefvfkhYNJivSwd1xNSjjl7hL
         clKp27SMWNTJuJijxX3seC5f5CETXySWxhrbnU7I+B08k5y2pJFSb9O2t4JpDHi2FXys
         M73WP5sC1BZigPbqC+7n+l++QsA54baGpliS1fJCymlKxIbsABlzNB/upmQKSMVbOQ7Z
         d0xdq247GSoaPXl3IRFZAsPej6qXUU4XMA7KWlE7LHlMT/PO2pLUtvv+daJOAns6HKZM
         852GFl9wavYTn/WJKiiIiBveGigDrHXL1Gn/S5Nv5K31K7O7cgVkcg50PH4LPLVzk0d+
         108g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783542952; x=1784147752;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=24xTmwwfHf8GGJ8ej4fMcb3MXrY9M9ELYMVJ6Iyw0KE=;
        b=F42Xwqh+IerEZDHO3E0H5KDA0KqszKVvaOeezmZnKlhQCjKU8uzEB8qYXsPvWmIPQy
         jPmzl49HNtS2SnkjyQefe3dyTjMjGUcTmceIGQ9JYys7T4Zoe6zt15GPIvGfEBBToutM
         bTFvYlWOXoCueuPnHHoXH1JN5n6H/VzCpGiIWBC9B0ZVHR5qwEZcLrRysclapWa8gO6U
         pSweU47A4ffEk7KYTBT6Jc7rWAxZvbIAWRuWC1EKpItbP/v7uOnGPbW9idgHWW1NNWMl
         7sFlulXwumB1SrabxQOMo7PEHMEJyaYjSbzgBaT6wETjiGowWXr6orhJ44J5JAAFym31
         gH0g==
X-Forwarded-Encrypted: i=1; AFNElJ81OE1UWFDnYWFR2DU5ovnfJgBAG9ALq8EK1SYh+0PQgjR+YO/dZuVdlyJAX42vX9lX46Ptbpj8gnBQ81HJiw4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw34dCNQVaUlV6z9HPrOAaibLypXHVTJxj3nO/iLGeccZi74G1i
	i3sRrZCpMSEvLMlZ76kjmR6ggZxvgz7iKfHQ2A2pTwi/BZg9BTqjNES8
X-Gm-Gg: AfdE7cmnh3AYcmlhPMPEw3guC6do5nXrUOUEEAzmU9ZQu/t/4eSdRnajqFSfg8vYcJf
	FNjheiNAvKQLvt5l6YkjDfu8fU3PdpYlq7uCHC9U0KckJQT5oOS/QoJ1CNDWPNEiQ8COg6pcU4V
	9JAd5tYD67+h61IrReaTRXppws2AhuO33FtNBhXVM3WRAQA9doKpaq9yy4wbEzItkFhDMHU0YVO
	lTiSAixKAtWbM21HsKWoqf7pA3XWG1ED6yyOGpO1D9rtmDe124KJmjH4NUDBvLUSxTa/TfK4Y/k
	0nW7LH73Yr0AKwlI7hBdMwjjE0y61RrG6s7kU7QW3rjIIGap0nwLQV42OIIci9kGgzQAbN6uip5
	CK+hmIhpddbhpKp7WSg22+/X5Ni79c2XpV4E5oTcrignxjrx5W953DM06hKSdsL0nisc8OxcexI
	D1HdAynW2SKKqdvucAN4IY1fnaAfoKVX8H
X-Received: by 2002:a05:6808:6d8a:b0:486:4212:d728 with SMTP id 5614622812f47-4a206116affmr3560063b6e.43.1783542951653;
        Wed, 08 Jul 2026 13:35:51 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:a::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1afde6cffsm2535573b6e.11.2026.07.08.13.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 13:35:49 -0700 (PDT)
Date: Wed, 8 Jul 2026 13:35:44 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Mina Almasry <almasrymina@google.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, sdf@fomichev.me,
	razor@blackwall.org, daniel@iogearbox.net, matttbe@kernel.org,
	skhawaja@google.com, dw@davidwei.uk, Joe Damato <joe@dama.to>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v4 1/3] net: devmem: allow rx-buf-size >
 PAGE_SIZE per dmabuf binding
Message-ID: <ak60menMXAbi/SCw@devvm29614.prn0.facebook.com>
References: <20260701-tcpdm-large-niovs-v4-0-ca4654f37570@meta.com>
 <20260701-tcpdm-large-niovs-v4-1-ca4654f37570@meta.com>
 <CAHS8izNdJ1LTOr_pLjXef6Yv-=JOFPe1GcZtcbStD93Tkpy1XQ@mail.gmail.com>
 <15e72c82-ca99-481b-bd53-744fabd503b0@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15e72c82-ca99-481b-bd53-744fabd503b0@redhat.com>

On Wed, Jul 08, 2026 at 12:50:07PM +0200, Paolo Abeni wrote:
> On 7/7/26 10:36 PM, Mina Almasry wrote:
> > On Wed, Jul 1, 2026 at 12:22 PM Bobby Eshleman <bobbyeshleman@gmail.com> wrote:
> >>
> >> From: Bobby Eshleman <bobbyeshleman@meta.com>
> >>
> >> Every devmem dmabuf binding today hands the page_pool PAGE_SIZE niovs.
> >> This caps a single RX descriptor at PAGE_SIZE, burning CPU on buffer
> >> churn for large flows.
> >>
> >> Add a bind-time netlink attribute, NETDEV_A_DMABUF_RX_BUF_SIZE, that
> >> lets userspace request a larger niov size. The value must be a power of
> >> two >= PAGE_SIZE.
> >>
> >> Measurements
> >> ------------
> 
> Checkpatch complains about this separator usage:
> 
> ERROR: Invalid commit separator - some tools may have problems applying this
> #15:
> ------------
> 
> Please replace or remove it in the next revision
> 
> >> @@ -90,16 +90,17 @@ net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
> >>         struct dmabuf_genpool_chunk_owner *owner;
> >>         unsigned long dma_addr;
> >>         struct net_iov *niov;
> >> -       ssize_t offset;
> >> -       ssize_t index;
> >> +       size_t offset;
> >> +       size_t index;
> >>
> > 
> > nit: I would keep this signed. Some of the most frustrating issues I
> > ran into is some of the underflowing and then passing a > check or
> > something. Although if the LLM is not complaining about this
> > particular case, there is probably no issue with it. I also notice a
> > lot of existing code that deals with indexes and offsets goes for
> > signed.
> 
> At very least the above change should go in a separate patch, as is
> quite unrelated from the rest.
> 
> /P
> 

Sounds good, I'll drop the type change.

Thanks,
Bobby
