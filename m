Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D003E9F9E
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 05:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768973381; cv=none; b=Q3R9wrvTS4rEk37dYpYwgkClNDbXeZzo1mxNDWAFUwX05tPQff2cVRwEf2tM4WRYvAa0afb74tA0wk9M/A8KfCaedCFpKRN71wgdt3itFyR1JJ5IJq++posMLonVUCenu43nW8J9+EhirDDK1HOUwe5qCSzZhyqFgeietahgvH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768973381; c=relaxed/simple;
	bh=uQc7kvpnr3eWQJ+H7RqNdRd5OZKaD9lrnlN+V2TeZpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUD0KcjebuHt+ICo7EUdSdHe+ejANV5RsLFSVVLLuLrVcxZV4ZrzsOPLHTbnQ8g8dvyaFUL2GqpPbKV3MYqdnIr6IyWCBYc3cL0p6Hw6Ws1ub38QdvKEJYNdYM6ONxGoXYKSbKRoHYN7NlC90ek/TdjaHtbQNIQHL+2jup33/6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5Mlk7u9; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5Mlk7u9"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6420c08f886so8190777d50.3
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 21:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768973379; x=1769578179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xj8z6sgYRSc2zcxSy7UyhR6bNJrDd7gH3jcOHm2KVdE=;
        b=N5Mlk7u9FDtv8iuzab4wtE//XR4wWyXKvWvfNWKiMhMYaY2hk90IsgZpkX9QxE5r5W
         E+qUf/NIq8OaJIc13eE5mtj6u9w7AAHIIoWzH5gg9L15O6Gpkq0vl64BijAuY+dpdn1l
         Cd3MmbfbEGxleWpjm6Qz/UbSFqFOZ9oFZnKUfmoKwvefd+DUMatAKmC7j6CtXDqMy3wb
         oKDTDIyRwiIuvQvjbjA3GujyM2WPByE0MUuc7FrndL7Og6k87i8CnbJAosSKeGKiJjob
         4tZXjTKNqik++zdsjhNAQVzTeWVwaTbOEpfXcEJp4VjS9nLKnffIbWsvhZN+tSimS6Rr
         upOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768973379; x=1769578179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xj8z6sgYRSc2zcxSy7UyhR6bNJrDd7gH3jcOHm2KVdE=;
        b=KOqnqBPlQ5TSO5/5IG9c5+EWy96Oj+cRe4YIDgcc1EcKyGqkVwQNuv3GZib6mW5KSZ
         mXb/05M7EFVZhippaRpBv7DdV9qsbul72EFyGV/iOHP11NDTiTGC3TJvzWwOPvwmxEqe
         igGtMhf5GbP+A1aCrF3ga6VCAsjS0jzkueJ29dfHyVqmPBn0p+8i3cWFOpD7MZYzrChZ
         oslR0im4UalQrIZuxU0SxAmPGy876ZBD4XUaQ3P2vVZ01QPCFjHy5EUGShy7EAf3+yoF
         2ah4+4Lq/oJ+CHzrK/yvhqzwUb7M2RMULwd688xvggMP2WE3WaKXaqUGk/r1keCj8DSF
         WAxA==
X-Forwarded-Encrypted: i=1; AJvYcCVdRlPBGYvyza/w1iih7JDWbAB6FUHEq64AS2zbLS7RL9ydBHonYFZxywwWpzeyhhpK13kR4Pu6zCkASKl9J+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdiZHzLTLpBxPbqCBFZ5xLX5091C5bF4ygaaiCEiCqbfACKCwT
	+UkDl1dcgoY7yGbGkgaxK49mJK3Budb7BarlcNwp5/ygef1Cvja6aEyN
X-Gm-Gg: AZuq6aJlEEGz2Yslam3JO+8cPhGFmgfMc8ukG8CHvUShsxY7mjEDzH2xTztZ+yyQqkX
	1e3gScyW1Lwb4CHsZu8+CDYZwlZQYPhIUxTqj6EjNIIUm1L+cA3cgbT8Qg2vnaP5HfD8gA6EByq
	VzigKS9p1TDlVQAd2pGKJMqWWKBeP2MHWKuplXIwzbLy/oPcG7rVtDuyg7sHZx2DvcfHHAULR/6
	PpRRCcNpQLdxcvvlG8QFlzijrxTK5tgY4hMR6FDgIekRWOddOLBZn5Xxsb6UoCP7bNJiu6xfXT0
	tQIf4KC3yN880iGH9G9RWRfnHs6zLGdlb3JRYjg0AZgBS7s8PPS5EVPT6XuFUK64rK7yFwE9uBA
	f9BK/EKX+FUS+jVzDY6C7csfBFuGCmyga+HZM3MjsM2nprELX6ep30GYHN1XilfStY6JUULqucv
	XfhONDOc+dGmHqhDDWraa7s05ATZy+iciKiw==
X-Received: by 2002:a05:690c:f09:b0:78d:b1e9:85f0 with SMTP id 00721157ae682-793c6831d0dmr118307367b3.47.1768973378948;
        Tue, 20 Jan 2026 21:29:38 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:9::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c6888b83sm61022937b3.48.2026.01.20.21.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 21:29:38 -0800 (PST)
Date: Tue, 20 Jan 2026 21:29:36 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
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
Subject: Re: [PATCH net-next v10 0/5] net: devmem: improve cpu cost of RX
 token management
Message-ID: <aXBkQErscGzJwh2i@devvm11784.nha0.facebook.com>
References: <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-0-686d0af71978@meta.com>
 <20260120170749.101e8bcc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120170749.101e8bcc@kernel.org>

On Tue, Jan 20, 2026 at 05:07:49PM -0800, Jakub Kicinski wrote:
> On Thu, 15 Jan 2026 21:02:11 -0800 Bobby Eshleman wrote:
> > This series improves the CPU cost of RX token management by adding an
> > attribute to NETDEV_CMD_BIND_RX that configures sockets using the
> > binding to avoid the xarray allocator and instead use a per-binding niov
> > array and a uref field in niov.
> > 
> > Improvement is ~13% cpu util per RX user thread.
> > 
> > Using kperf, the following results were observed:
> > 
> > Before:
> > 	Average RX worker idle %: 13.13, flows 4, test runs 11
> > After:
> > 	Average RX worker idle %: 26.32, flows 4, test runs 11
> > 
> > Two other approaches were tested, but with no improvement. Namely, 1)
> > using a hashmap for tokens and 2) keeping an xarray of atomic counters
> > but using RCU so that the hotpath could be mostly lockless. Neither of
> > these approaches proved better than the simple array in terms of CPU.
> > 
> > The attribute NETDEV_A_DMABUF_AUTORELEASE is added to toggle the
> > optimization. It is an optional attribute and defaults to 0 (i.e.,
> > optimization on).
> 
> IDK if the cmsg approach is still right for this flow TBH.
> IIRC when Stan talked about this a while back we were considering doing
> this via Netlink. Anything that proves that the user owns the binding
> would work. IIUC the TCP socket in this design just proves that socket
> has received a token from a given binding right?

In both designs the owner of the binding starts of as the netlink opener,
and then ownership spreads out to TCP sockets as packets are steered to
them. Tokens are received by the user which gives them a share in the
form of references on the pp and binding. This design follows the same
approach... but I may be misinterpreting what you mean by ownership?

Best,
Bobby
