Received: from mail-yw1-f193.google.com (mail-yw1-f193.google.com [209.85.128.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B13F2F3C19
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 03:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769483213; cv=none; b=bX+4KFH2fW382yZtvG5WplOYhMaLLPui27Dmp/aocpW7+Piyk10WHwHVfjS7JcyNAE/mhvTH14O2AADHEnE5XFbYZhH+vxLfPSBDTywNue00RizpJ4HeDqCpV/RdfF9GfGNatanYE8yyR4rK6wG/29J7IKnHJvPPakDVaJbJJyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769483213; c=relaxed/simple;
	bh=wYEcUgNuD+lPf2tV7/btjfFjqrI60S+N7nj/8yNW7Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cb8PfMvaAQnfOXbBjFq2kNNpnekv1JuNs3Svg7op0cMZATEn1kqGPM42YGT/DMrsSA+UeDHLPuutXreEz/195bPBGbtdWpqmwYQydim8pw51TjXiupNixhZZhtoGEdLTEVlOuoc4aMgo/zLq3y+tdzx/7eyaqArLKETQ5LR0F8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IU47TRk1; arc=none smtp.client-ip=209.85.128.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IU47TRk1"
Received: by mail-yw1-f193.google.com with SMTP id 00721157ae682-79478ec4cf1so2125657b3.3
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Jan 2026 19:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769483211; x=1770088011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XtcTamun/anyrF+4xJBkkNRqAbEPEhjvU9VCmmVXBeM=;
        b=IU47TRk1K97pPGLqScYNmy4ieeG4lxxAnlN6s9T5ZO8WFpCbaJanHJru4scZJ/CbVl
         SmKDr9/06OWQzItbsOcZI+uuqTGVB015Uq996Jb2kNYlwbiOMYACKf7wpL7on99kakp8
         H415wOaurydKRZ4sP9l2enHfr+aDhBIQLMuW4lazcPnGyJSzVcerSo7WtZbSYgxzA2Oa
         QO4OHhOH+mGDtYKpF+GBlnJl7CLwjkiQn5iSJ+HXjjPExlu8ajNLuurTzkaoirbPsbtK
         DlHwskRWVw1SXw5/65rCtlEOiLMAt1gKOqNEs+NzjdM4s9c5TnNXAnoeWZKbrmDCYpXH
         NxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769483211; x=1770088011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XtcTamun/anyrF+4xJBkkNRqAbEPEhjvU9VCmmVXBeM=;
        b=aRNzFJ8I5VTFcO/ab3r64ooZswv3d/VtkI7+cq4WZLy9JmGGJgO4cebsws7J+17+pc
         KBencEsiBQnAnZKlNT/vGBV+xQ+VCuqFgMiG1embYly/K95wjPQnrpy9BfBJmNqmp2bx
         aqI/XCLBDfUjO+bg2iQeCkUffQ3c0u4nO7Zzhv4pAb/018IwFw49PN5JQ5bsFsut8f/8
         je0d+OyYgjldBCTeRFjI/Dq16apocG3SsSaL8zF5Wi2lKVQmHc9Wt/sfmpDH7PhcJnak
         FODiTi7agQmI5rncViUehvI92Nt2y3LTnYvbb5VEw1L4DPPTKddfpLiHyvBeD8DAgfpM
         wuJA==
X-Forwarded-Encrypted: i=1; AJvYcCXd8SIZl9UaBzRG1pj8Trwz/sYXvjjDdH8lLuWiDyD5Je8seWwAsFFKJEKL06Zu0xFxYN3Pbta/2V6y2quzwIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUFwQB+8F/q0w7BaVskoUnEEpNr/T46d3IAYhk7I5k/kUYSh9E
	cD5nVnFjFiVOYlPLvWyi90ymWQVOrnmw3xfWeGseC3w0rQ1AnpZKMwXQ
X-Gm-Gg: AZuq6aJMivCmZRQ0Ng+jelKcx/2+8y2+LIooFzGQT7ke/Ov3u979g/Lc+PKMT4RAjMn
	QVjWIv5N5z8BdCpXlnQYrizAC4QywxZzbSBFKDbV16BYgI0GHkks0RCGFBXOTwb1DyGDFBe/BCY
	J1XeNy0KVyWDpqvfRMAXQ6avCgwjFSllOh0J364/zJqREo7SJFsyhy93G/5RxuI/thrN9pYrpXH
	t4ytlrXGEadupRXp6634S5jQ/o+lTS1q/TLdoQtURFMCAr+8EyX+Mk04DP2hx1vPGGfUvp9nftv
	zIo5aFIkSPlGeFOx5zNF6HaVWd020LYgB4z5PbyrAL0xwcjeLgahJzCZbWe/XZ0YbommjrFLz4b
	O7X6EZSwDkfUAmsPqFeiBNyc9gC8kEzc3oiR39krWZnjgBj7K4jVu5IBjIT94+lHGFlC4Yon6bo
	fmz1MuQkIONY49jyPBgccIJ/2kFG9rKVyGhA==
X-Received: by 2002:a05:690c:f02:b0:786:7a54:4635 with SMTP id 00721157ae682-7947ab3c172mr1656687b3.21.1769483211400;
        Mon, 26 Jan 2026 19:06:51 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:5::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79475c0212asm5994517b3.2.2026.01.26.19.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 19:06:51 -0800 (PST)
Date: Mon, 26 Jan 2026 19:06:49 -0800
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
Message-ID: <aXgryaSx9CzFR7kv@devvm11784.nha0.facebook.com>
References: <aXBnqYQdomzH9bT/@devvm11784.nha0.facebook.com>
 <20260121173512.748e2155@kernel.org>
 <aXGNhEKOhkTHbJvw@devvm11784.nha0.facebook.com>
 <20260121185021.446b00e8@kernel.org>
 <CAKB00G2xNvfiV6J3RzKDs=GHMGZ7L16+VKUYLGjpZdOrLnSYKA@mail.gmail.com>
 <20260121194615.33dc0812@kernel.org>
 <aXGib0OcNdHTLyZN@mini-arch>
 <20260126172646.2e5af2d4@kernel.org>
 <aXgjVb5PVqdPM10J@devvm11784.nha0.facebook.com>
 <20260126184440.755a55b2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126184440.755a55b2@kernel.org>

On Mon, Jan 26, 2026 at 06:44:40PM -0800, Jakub Kicinski wrote:
> On Mon, 26 Jan 2026 18:30:45 -0800 Bobby Eshleman wrote:
> > > > I'm not a fan of the existing cmsg scheme, but we already have userspace
> > > > using it, so getting more performance out of it seems like an easy win?  
> > > 
> > > I don't like:
> > >  - the fact that we have to add the binding to a socket (extra field)
> > >    - single socket can only serve single binding, there's no technical
> > >      reason for this really, AFAICT, just the fact that we have a single
> > >      pointer in the sock struct  
> > 
> > The core reason is that sockets lose the ability to map a given token to
> > a given binding by no longer storing the niov ptr.
> > 
> > One proposal I had was to encode some number of bits in the token that
> > can be used to lookup the binding in an array, I could reboot that
> > approach.
> > 
> > With 32 bits, we can represent:
> > 
> > dmabuf max size = 512 GB, max dmabuf count = 8
> > dmabuf max size = 256 GB, max dmabuf count = 16
> > dmabuf max size = 128 GB, max dmabuf count = 32
> > 
> > etc...
> > 
> > Then, if the dmabuf count encoding space is exhausted, the socket would
> > have to wait until the user returns all of the tokens from one of the
> > dmabufs and frees the ID (or err out is another option).
> > 
> > This wouldn't change adding a field to the socket, we'd have to add one
> > or two more for allocating the dmabuf ID and fetching the dmabuf with
> > it. But it does fix the single binding thing.
> 
> I think the bigger problem (than space exhaustion) is that we'd also
> have some understanding of permissions. If an application guesses 
> the binding ID of another app it can mess up its buffers. ENOBUENO..

I was thinking it would be per-socket, effectively:

sk->sk_devmem_info.bindings[binding_id_from_token(token)]

So sockets could only access those that they have already recv'd on.
