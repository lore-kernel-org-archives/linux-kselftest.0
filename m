Received: from mail-yw1-f193.google.com (mail-yw1-f193.google.com [209.85.128.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC74376BFA
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 02:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769049485; cv=none; b=DdRh45H0eQi3N+Xz6W30f40m3dRVcvueafoKtSu+zfU7IKT/eewgBPt+cl5xram0MuZ4hCXwx7PkQ9KHnjOtc0Ty7LjFG9N55r5sZdVE4NI5ii9vdXiiJLWqnj+wJUTa/Er9XeERNJilqS2y4msGpGAsRlb8rrb/HNpO1c2Yj74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769049485; c=relaxed/simple;
	bh=xOcQ9yPADCbR7UJ1g9E1fC0dWQ0e9bXQE17TrQyLXSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iz8MIg+omZ+DQfPhkeDWf2vAXCXGVHyEPy53JMmW9RJRfAN0sv96T0OxezvyEbK5mP6IMet/kuaT8qHsYZYO8N8hB616k0RnqaHhQI4CvO2EKxjG6m7x1YsKK02JElkkPbuMs63qvCRts9dchI0aXM71OSMpiwBzPCr+QEfxlIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhMSVqhT; arc=none smtp.client-ip=209.85.128.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhMSVqhT"
Received: by mail-yw1-f193.google.com with SMTP id 00721157ae682-790b7b3e594so5250667b3.3
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 18:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769049482; x=1769654282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=easMu0gMme66zzGb0htyoe1e3dWIakHvb8ICaoPX2OE=;
        b=nhMSVqhT8cDD5V79j5llAu8Dpk7kaoNjxpg8wQ8t2nnjIFEvXbSAckbH/3wPWX2A01
         DKy1aAUAwuGO+yY119Qoj03a3+XkJlq89Y9htnOClD6ggWVXz8P+gE48HONb/L2sKA+4
         IyqTxVmrmKLLLmFDwgWk7eotBVZI3Ke5ZLCYIyBiGgStAGNIQweW6KkeN3l2yErzHDS1
         afBsrnT727tUEeedrWpDYgvPOPLTuFA7F8nA4lIeAM9q9/Ha1IrWo4Dkzm4whG3Xpbyt
         NwpUPJeqPhjnsyTzGqWBtjysWiOn8Dagp8B802EQoN/CoCyaGhUVAFRER//v6uAHCPu8
         hZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769049482; x=1769654282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=easMu0gMme66zzGb0htyoe1e3dWIakHvb8ICaoPX2OE=;
        b=PYjuLDkBYnjR3cvTObNxcSVHxd2nj6De3pl4GiRjoaULq0zDWpEwsp8/yM9qT40rna
         xx3lFXavV6hc7hjHNrglT8D1H3cYvcFaaYoeWKfbptSRHSrZh3zCMJ6RT+yztAqpiTiS
         UbRH6qwb6MSGj0qa3M7A7aLugUUQjcbz4rsu5kqAgkufeyNssOKQX9xiyCog+SLtH/Sz
         9RnD81GYl/wnIrzp7ihiLZ9eikKnRJ/GO1TUfVVjd6yawNFoV3p2rmVGdXcSPXblLVb6
         l0Z6OiYEl+dym+HzB410LGcptBAorPIOApW3PJ95bPMa7AcLe3he4gsAFdIG6AuKAfdN
         1Z7w==
X-Forwarded-Encrypted: i=1; AJvYcCX22fis2Kus6udZPGsey98PBG2OiMXzMr13+JK6bhSSpewdcIpKkpa1CNjeGQybhWPJ+TuJDi4iRvy8Nv+NwUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUosAHtZ+7Yp/xMpE4pyAI0I7G8CaOGZMdz5F+JFsqTP2fu1kn
	JExq9iLHCxCQzZpDMZiAdAiqrCAcRC5QSeTBjcNRUUA6ywb/2nGgHx2g
X-Gm-Gg: AZuq6aLacqTz/vOPNUesLDTqEqz6+3nr52NTOGB1/qfVRn+Cj6YdxbKTU/5cYAM/y8E
	Td4zrS4TGoDxM1KVFmKqGqzdowJIu67tFUOgorRI5o7KqlTLriHgKacI0M/5o36MtGWpAcu8YTP
	p9AC2nEI5sRX2JtAiPawCOiewj7HatrOUs40kESRsHE86coFyYkhysy6V6SPA68G5JiV+4pTSbC
	qUJj4MS1z5aUzrC5mtRxtNduqRDiww11YtO9fTCRDJB21F+XXURFPQnpMQaBknFs28LNomZkoNB
	q+KkKBwkD7bj4K3K6yEPkT5cenb8csonSPuzuJEKbDwBIQFP65/wvbgHoT3H2+Nv4BmjSCFobKm
	wy7T33XjO3of1kW3FbgJLapAo9gOaXUlbjP+FnZSWpIkoVwriXIzSxTbC+g02FVY6f0pLoJpcQc
	9Ly8LlyeBv9tFEGnzkjR/+6pAV9bhAdnwhmsA=
X-Received: by 2002:a05:690c:dc2:b0:786:4860:21fd with SMTP id 00721157ae682-793c536b2c4mr146755317b3.39.1769049482395;
        Wed, 21 Jan 2026 18:38:02 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:57::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79429985287sm7862007b3.11.2026.01.21.18.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 18:38:02 -0800 (PST)
Date: Wed, 21 Jan 2026 18:37:56 -0800
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
Message-ID: <aXGNhEKOhkTHbJvw@devvm11784.nha0.facebook.com>
References: <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-0-686d0af71978@meta.com>
 <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-4-686d0af71978@meta.com>
 <20260120163650.5a962648@kernel.org>
 <aXBnqYQdomzH9bT/@devvm11784.nha0.facebook.com>
 <20260121173512.748e2155@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121173512.748e2155@kernel.org>

On Wed, Jan 21, 2026 at 05:35:12PM -0800, Jakub Kicinski wrote:
> On Tue, 20 Jan 2026 21:44:09 -0800 Bobby Eshleman wrote:
> > On Tue, Jan 20, 2026 at 04:36:50PM -0800, Jakub Kicinski wrote:
> > > On Thu, 15 Jan 2026 21:02:15 -0800 Bobby Eshleman wrote:  
> > > > +- Once a system-wide autorelease mode is selected (via the first binding),
> > > > +  all subsequent bindings must use the same mode. Attempts to create bindings
> > > > +  with a different mode will be rejected with -EBUSY.  
> > > 
> > > Why?
> > 
> > Originally I was using EINVAL, but when writing the tests I noticed this
> > might be a confusing case for users to interpret EINVAL (i.e., some
> > binding possibly made by someone else is in a different mode). I thought
> > EBUSY could capture the semantic "the system is locked up in a different
> > mode, try again when it isn't".
> > 
> > I'm not married to it though. Happy to go back to EINVAL or another
> > errno.
> 
> My question was more why the system-wide policy exists, rather than
> binding-by-binding. Naively I'd think that a single socket must pick
> but system wide there could easily be multiple bindings not bothering
> each other, doing different things?

Originally we allowed per-binding policy, but it seemed one-per-system
may 1) simplify reasoning through the code by only allowing one policy
per system, and 2) allow simpler deprecation of autorelease=on if its
found to be obsolete over time (just hack off that particular path of
the static branch set). It doesn't prevent any races/bugs or anything.

> 
> > > > +- Applications using manual release mode (autorelease=0) must ensure all tokens
> > > > +  are returned via SO_DEVMEM_DONTNEED before socket close to avoid resource
> > > > +  leaks during the lifetime of the dmabuf binding. Tokens not released before
> > > > +  close() will only be freed when all RX queues are unbound AND all sockets
> > > > +  that called recvmsg() are closed.  
> > > 
> > > Could you add a short example on how? by calling shutdown()?  
> > 
> > Show an example of the three steps: returning the tokens, unbinding, and closing the
> > sockets (TCP/NL)?
> 
> TBH I read the doc before reading the code, which I guess may actually
> be better since we don't expect users to read the code first either..
> 
> Now after reading the code I'm not sure the doc explains things
> properly. AFAIU there's no association of token <> socket within the
> same binding. User can close socket A and return the tokens via socket
> B. As written the doc made me think that there will be a leak if socket
> is closed without releasing tokens, or that there may be a race with
> data queued but not read. Neither is true, really?

That is correct, neither is true. If the two sockets share a binding the
kernel doesn't care which socket received the token or which one
returned it. No token <> socket association. There is no
queued-but-not-read race either. If any tokens are not returned, as long
as all of the binding references are eventually released and all sockets
that used the binding are closed, then all references will be accounted
for and everything cleaned up.

Best,
Bobby
