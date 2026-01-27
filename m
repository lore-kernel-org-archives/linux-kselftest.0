Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEC04F5E0
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 02:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769481049; cv=none; b=bmdWRxlVkyu5UiT/1N3zJF9dEIOdJ4t5rnzaEG/IylCupRIg5EY8uopHQdxBZne73bW8JPSXd65BbNLtXuuMxlOSP/9e0zmuf6qZ7y8zkl/E4BSxsekxt+6OUmRxMjSpKb9MthW67rFVOl2tLvWMDR3cwFN2s9qf2tJwVUhi6x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769481049; c=relaxed/simple;
	bh=KHQTMcbGWv838jeHXPgV8dxHgD873Pl7gf8BNEh3ljU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIQRaSauelbl5pJxrIIhoxuthGshJvNEkRZQOHj7DvT2iOpIksXBeSDKBcPVh7ygRBKlToS0khRfVoVpTbqcB4uhQoheR2tYmJUtBaYi4CaR//ZOb+g5X0c36F+fpuJ+IPE016svsptX9TZdiVk/NUO7WrPhFwt1KNmS5BTqLGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdhCV6el; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdhCV6el"
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-790992528f6so49841087b3.1
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Jan 2026 18:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769481047; x=1770085847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7D31caj3N1Jxdsl7gn2LUCTtkhdOIGiiafmFtbNg3P8=;
        b=hdhCV6elPH6QMYqIGvqzcjebzTt+heU9y99STI21AaP6zDHSTnVZ+hopEFI+L3g/rc
         djUjeUZxPSf6vKPl+iYSXWARYc/t1yPx5qCQDoNi6ev8L3OyQrBM6IP+Ua//WqWfIv1K
         UXoUidhJHbHm2vY4CMHdgx4HOcCUtdhbGCNN6aXdTm2CaMUzYi132Xodjtyld5HG6+J/
         DA+uLybXVsTqpAMkif9tTVH8yJbkPk0XpaWloHbvmMPohXFpk5gmeRAC8ThWZZXm12kp
         tVUBhBzySxggtJxIjc72tNQjbJUtjtnu1cXmmlQRL8z0ZgjOlxWPTvOanGxpIAqTNPAa
         13mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769481047; x=1770085847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7D31caj3N1Jxdsl7gn2LUCTtkhdOIGiiafmFtbNg3P8=;
        b=BkQo9AzA+weQVz2VFc+uXgrhJMtzriBLjUsK38hSU1YhnDEYkKrNQwidPgmG3wTyy9
         nE/PrUM3pKdtGZnuXMNJJH5/nRgthU0BhEGdgFiCmYvxlz/uu2EQOZ/qcA7mYs3xADYm
         XFitoricYdsErW7agny40FQp3VBybnBUCvMs4KAWmBAf/0ThH/XFgODtKdS9bmTJbUjS
         Rpo+ltRFPxUuOYcASE0IujCYJcwq8HP+mvwgYiWKao+gYO21PZ8mjyv/4hvLl2aicp93
         aegfyqkOGrAbMLWyXpMlMINDQQsYhJJkMR1xKkUs6e23yC93XoKBtP4HTNmX+8esw3HQ
         zfBg==
X-Forwarded-Encrypted: i=1; AJvYcCV02W1jNQSv6sNrAa17JUt6Jhz7ERgs+0/hcU/4S40YhT66m8ShYIKCFtSHi4+25fpe3TSu3h1zUP1BYfRN/E4=@vger.kernel.org
X-Gm-Message-State: AOJu0YweyJxrkVq/gLy98i1CD4/fIDnjzBMZk9lf/GzUd0Z2zSE9ushz
	cbABKBF2NLZWQpCYxALu0XvJzFN0j7clL7LFXy//GJI1azfZyC/Cv87z
X-Gm-Gg: AZuq6aJrLYVwMx1NYmR04Fds96wWusz8dvsib2YIRJCEOT7XsrhCllnhgQM/Cnsp1aD
	KrppKFCCQnlVv1ZjgpWrGwtUgpNYnenC1LB7BLKdMh60oMxwwy7djrIiSWdXMV5948eGGoWD+Rb
	2vDkkS9lA5UMhFye2ASgHmNe2itA1U3JRBT90Hw+XYLZLSWT/g/zlojF4obqce4HWi4dkk6jIiC
	oYxt1O7RhjHhxi62vyb0rI7XPzQjB33nHBR3dic06Pkuek37xKjj469be670s7Lk9ua2QV3g1GE
	8J677UH3ImzqVXm4+mRhIyP0ZBxn4JZvKx209fNipLaX1K94i/yxFA+1l3qeKfK73iocF+s4vvq
	WGVRAxAp/uyzOHyFpkewG4raRuU9ZW3JX93Sh9rvKqOPjP7IXLh7ol6I7JyMBFVJC+6m0FvQYor
	akdugSnGu6JiSzivNUzie6WgnEeXCjzJ19SfE=
X-Received: by 2002:a05:690c:6813:b0:786:a0fb:fa8e with SMTP id 00721157ae682-7947ab157c5mr1045097b3.15.1769481047156;
        Mon, 26 Jan 2026 18:30:47 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:44::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7943b2bb70dsm55711407b3.45.2026.01.26.18.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 18:30:46 -0800 (PST)
Date: Mon, 26 Jan 2026 18:30:45 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanislav Fomichev <stfomichev@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	David Ahern <dsahern@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	asml.silence@gmail.com, matttbe@kernel.org, skhawaja@google.com,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v10 4/5] net: devmem: document
 NETDEV_A_DMABUF_AUTORELEASE netlink attribute
Message-ID: <aXgjVb5PVqdPM10J@devvm11784.nha0.facebook.com>
References: <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-4-686d0af71978@meta.com>
 <20260120163650.5a962648@kernel.org>
 <aXBnqYQdomzH9bT/@devvm11784.nha0.facebook.com>
 <20260121173512.748e2155@kernel.org>
 <aXGNhEKOhkTHbJvw@devvm11784.nha0.facebook.com>
 <20260121185021.446b00e8@kernel.org>
 <CAKB00G2xNvfiV6J3RzKDs=GHMGZ7L16+VKUYLGjpZdOrLnSYKA@mail.gmail.com>
 <20260121194615.33dc0812@kernel.org>
 <aXGib0OcNdHTLyZN@mini-arch>
 <20260126172646.2e5af2d4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126172646.2e5af2d4@kernel.org>

On Mon, Jan 26, 2026 at 05:26:46PM -0800, Jakub Kicinski wrote:
> On Wed, 21 Jan 2026 20:07:11 -0800 Stanislav Fomichev wrote:
> > On 01/21, Jakub Kicinski wrote:
> > > On Wed, 21 Jan 2026 19:25:27 -0800 Bobby Eshleman wrote:  
> > > > Good point. The only real use case for autorelease=on is for backwards
> > > > compatibility... so I thought maybe DEVMEM_A_DMABUF_COMPAT_TOKEN
> > > > or DEVMEM_A_DMABUF_COMPAT_DONTNEED would be clearer?  
> > > 
> > > Hm. Maybe let's return to naming once we have consensus on the uAPI.
> > > 
> > > Does everyone think that pushing this via TCP socket opts still makes
> > > sense, even tho in practice the TCP socket is just how we find the
> > > binding?  
> > 
> > I'm not a fan of the existing cmsg scheme, but we already have userspace
> > using it, so getting more performance out of it seems like an easy win?
> 
> I don't like:
>  - the fact that we have to add the binding to a socket (extra field)
>    - single socket can only serve single binding, there's no technical
>      reason for this really, AFAICT, just the fact that we have a single
>      pointer in the sock struct

The core reason is that sockets lose the ability to map a given token to
a given binding by no longer storing the niov ptr.

One proposal I had was to encode some number of bits in the token that
can be used to lookup the binding in an array, I could reboot that
approach.

With 32 bits, we can represent:

dmabuf max size = 512 GB, max dmabuf count = 8
dmabuf max size = 256 GB, max dmabuf count = 16
dmabuf max size = 128 GB, max dmabuf count = 32

etc...

Then, if the dmabuf count encoding space is exhausted, the socket would
have to wait until the user returns all of the tokens from one of the
dmabufs and frees the ID (or err out is another option).

This wouldn't change adding a field to the socket, we'd have to add one
or two more for allocating the dmabuf ID and fetching the dmabuf with
it. But it does fix the single binding thing.

>  - the 7 levels of indentation in tcp_recvmsg_dmabuf()

For sure, it is getting hairy.

> 
> I understand your argument, but as is this series feels closer to a PoC
> than an easy win (the easy part should imply minor changes and no
> detrimental effect on code quality IMHO).

Sure, let's try to find a way to minimize the changes.

Best,
Bobby
