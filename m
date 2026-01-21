Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61ED41C2E0
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 05:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768974258; cv=none; b=a1IdGLY2My2p0sUG1guv4kT97EjBE765oA5jZCtWnK0lruERAaabKN4wVs9WqavsjL/DN+JhvIlo46Zx8hJUYW+ZWGC7oS8OJL5nGHmxh4MRNcThNkch3/FzU1Hj9ObG3s23H9IM5fuXw9l7J8gj/EBJm9pyQcAJO3o9PEDkR+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768974258; c=relaxed/simple;
	bh=cCuhNoXS4wqZqsj/4ZE7U7PQyth2hfbCAfjifFmdGbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8GsHNSYA2WaPtKXVzKo2fljfRV2CiWTw9jfeeDBug9ANcXMs5kcUh3tA8AeK8hX9vyj0uZotjJJjuo3RJBgEVO+XNDs9AepIJy3hGgRcT08tUtXt40PRKLMd3BdEnALOFsg0ogEZ02CymANMTbPfm9ZtRJobt5Bi1HXRKAoCV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYKYkTXV; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYKYkTXV"
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-78fba1a1b1eso10488977b3.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 21:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768974251; x=1769579051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MoupjKqNDGOAMGhI8qwEY3FdnLYKFkn3HlTzVq0GQs4=;
        b=PYKYkTXVVq1VPftFvETtr5mYeEShg+MMb1rf49mjquldDupu+J0rYNp5AG4YUt/wnC
         iWTvlbLzNVvicwf/bUvzkFOEpdz8CCymPflmTgxZ6kgQfwNfgIPe9X/hPGzHc3CvPaw4
         cAe2yJ2QKNSuWpyXAs+4SjHIZHpDtDzenYvCoNIODYtw+vS1vYOdqIGfwBhYL3VOT2vq
         qUTVyUL1jzEtC0SGwAXu0tMOV9z1h2q/rVHDBYO4YHeJWrEmVUsMoE/C4BHTmWndQTDz
         pwCtBEsAUmG6rORLtaG+tYFuhJ2GsjUOC81nt7n3NWXP12zx63Pw3pGLF8Ccsf3VW/fV
         YWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768974251; x=1769579051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MoupjKqNDGOAMGhI8qwEY3FdnLYKFkn3HlTzVq0GQs4=;
        b=YzgpO14JEiOpINSroYq9zut/E20BbA0lcmx1rlZoZmZVIsIKdVeYCFg3S3KnpFfJw9
         6/Hx4rHI4aUQ//gipJUIADz+wDO6qgDsBerd4ftmtQnXOPvr9GNk2NRH/lDpXPENSzqT
         uBa1oeZsRyy4sRvjmif6BC4v4HipGkO8/95sbpbUQkzoxaOfoo2F4eI4bF0Z9LAYeOsT
         4SSyiY47eU6aBxlCteGpBIWmAhW2OJ/BqsQq+e9uY1HKZhfzpuJFRGN4cbcaA/hyrmm4
         49sKoVP1V2z7USV5cCK2YIrBjJ05qdLemq02XkzvSfZnTVtPWT9UeH1D5J0EB3/TPHB6
         9fqg==
X-Forwarded-Encrypted: i=1; AJvYcCW6XgGF3IPETD8CCCtzZ4/0jUQlkHkaAMK2ysHMmiE3aYBwylliIzjNSDW9foLel2kmBZUyLuQtDy2rVyb9CAw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3voDSoaDswVnjJCPLVUzX/rqfr8OkmbOtzW0yy9LqgiemjvSC
	TIhqG3Hk6azXSz7ghBQIf985yYA1Ob6WKfNJyqN+ic1qVy43B3WY/xFA
X-Gm-Gg: AZuq6aJyx1zYomNNgEfaFTbvQSxXyYoQEUfSz/uK18GLMrEZfbX1ZUxWc8JhjnFy943
	m8e613kSEOBpPZ5BDhRvBV/bMvEBagsB1o1tNQgYZwYNmfYmiehvVMYE7qGzTX978Rtth8gbjEz
	pYiS3mOQWV9hCMJpTiOF6eoBynVfmOPsAJp3WsgIKMZT2YvyBIo/5GlS0lTK4kzME7I5n7MZhly
	SYB1rFDXNtrRJD97lAE7GOywCgbmEM7iK9ggAtX3Uu6iXgwvZyD2le4g/8d7IgazkHGn+kcua8d
	CnPvehXOHNljc9nJQ4jEG1XioqSO1FVu3wrzne13skXsvbIryTAkB92/R9lq1xM+JC8xQyHx6wk
	J/ufTqpGcKpUcQOfRiFe3YVgjoxYvQRvLElf1guW32qhA6f+dw6Msfhk4XWhyc5LDZeW+PSeRyr
	7WB7jlDI3m/AaXqtaJlM3JNdUXny3kbIp12u4=
X-Received: by 2002:a05:690e:1907:b0:645:5297:3e5d with SMTP id 956f58d0204a3-6490a6a0761mr15697554d50.46.1768974251183;
        Tue, 20 Jan 2026 21:44:11 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:5d::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6493dcbcce6sm1687077d50.24.2026.01.20.21.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 21:44:10 -0800 (PST)
Date: Tue, 20 Jan 2026 21:44:09 -0800
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
Subject: Re: [PATCH net-next v10 4/5] net: devmem: document
 NETDEV_A_DMABUF_AUTORELEASE netlink attribute
Message-ID: <aXBnqYQdomzH9bT/@devvm11784.nha0.facebook.com>
References: <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-0-686d0af71978@meta.com>
 <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-4-686d0af71978@meta.com>
 <20260120163650.5a962648@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120163650.5a962648@kernel.org>

On Tue, Jan 20, 2026 at 04:36:50PM -0800, Jakub Kicinski wrote:
> On Thu, 15 Jan 2026 21:02:15 -0800 Bobby Eshleman wrote:
> > +- Once a system-wide autorelease mode is selected (via the first binding),
> > +  all subsequent bindings must use the same mode. Attempts to create bindings
> > +  with a different mode will be rejected with -EBUSY.
> 
> Why?
> 

Originally I was using EINVAL, but when writing the tests I noticed this
might be a confusing case for users to interpret EINVAL (i.e., some
binding possibly made by someone else is in a different mode). I thought
EBUSY could capture the semantic "the system is locked up in a different
mode, try again when it isn't".

I'm not married to it though. Happy to go back to EINVAL or another
errno.

> > +- Applications using manual release mode (autorelease=0) must ensure all tokens
> > +  are returned via SO_DEVMEM_DONTNEED before socket close to avoid resource
> > +  leaks during the lifetime of the dmabuf binding. Tokens not released before
> > +  close() will only be freed when all RX queues are unbound AND all sockets
> > +  that called recvmsg() are closed.
> 
> Could you add a short example on how? by calling shutdown()?

Show an example of the three steps: returning the tokens, unbinding, and closing the
sockets (TCP/NL)?

Best,
Bobby
