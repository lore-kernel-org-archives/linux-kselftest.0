Received: from mail-yw1-f194.google.com (mail-yw1-f194.google.com [209.85.128.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39925314A7F
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 03:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769485829; cv=none; b=BdlNLMjEUr6kKI+wOIo4dYgqyzZTNI0Pvwn7sq++oFMSnWlbwZM1+makFj8LVcDCp+JPZtZgFsggsZQBf40/c+rKe9wkiqCXVtpS6FzVcq9G3yk87J89lcW/dNScQOxEIPN+J6Lfv+yxFchTH5A2jQGdLcLPa4hD7eqmwJDpakc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769485829; c=relaxed/simple;
	bh=XFau8Jrxlk4LXIMH1Jv2O6G95Tj0q5XrMIWKxPxgJns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mmXeR9EH4wpNPn4jSrlTQtKfW6B8VD21TXNu48jt9Xk7fAmBSf4dQVl2bqEzyRppZQygQ3DquFyPnD/t25BBZWUFgsI6ywZQQQeoBki9LtOnpwUUY47ce1B2Rj8Vf2lg/KU5Tb4++4YdgxClJCHdK/UCBBxQOBguF4450Jpk+Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OlHmRwF5; arc=none smtp.client-ip=209.85.128.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlHmRwF5"
Received: by mail-yw1-f194.google.com with SMTP id 00721157ae682-793fdbb8d3aso46136957b3.3
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Jan 2026 19:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769485827; x=1770090627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+wIYgb+a7uSPkKcjbr0/XF3iL0gwOJMcDzBmEVqlYIw=;
        b=OlHmRwF5N2BKtQa6utkLg9IHGGN7ZPMa2V/Pc+0f8qpSSBM9BGLykGo6u/U6L4Y7vH
         GomVPA76dxPIlicZsiR7ReiF4N6UtZmem+77uxvrvM6MtI/p3ck1TH504E2+mL4qiLP2
         XlJEqFvtAktkva4UZZ8lyJHf60oC2+aTDUXR1/PmtvqxW0wchMpspvqVRXDUy40V94cb
         r3O7TfAq0pab4BTENotmBSBVo5jP6KHv4n15utCs8HFRL3XkUPU3Ga6rDRlEW7iS4i6W
         +KSDsgMkBCzWNHJxlcoUk+IXsB/GL3sBjMy6+PwODHHaOWzag0tz7zpGn+xU0l9pMsyn
         PxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769485827; x=1770090627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wIYgb+a7uSPkKcjbr0/XF3iL0gwOJMcDzBmEVqlYIw=;
        b=iVghOIiVjEzP6HGVOjNWF18vrsOcsYyGu4NJeCTQjc8B4u7gOz8EUpf06YE7x6IsY9
         +k0NhDVrDoeyCWOQSh9SDsDw8vTPo2KHIGz895xpfA7Aypz+56AGGFaEQKkhdPUoOYP8
         Lmmat1jRiHrfHkyBEwimKVDbdqT5kkkGFAsRWE1cVH3rYxzmbZZmEU9V0C+lmgtn0frP
         vfLWuTu+OcgQ17LMInAGPQf4//KOs+J0sbm7Ym47VBsROebUsqI5hO+EjOGOVZMTUc3z
         CYVBvOs2npSvOi7/x+OqPljrnKIqZHfhRYOyyd2FZ32hPFhg7s9fNz3adkgE0WkltCi9
         9ung==
X-Forwarded-Encrypted: i=1; AJvYcCWChMAqC1GHxKypXPEOmbdT3511bo09ZVdBKKoGAnrtjwu04fnIxiGKpB6M+1EHfsJihF+L1qAOruGdkP+Ufpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvzCOQtRLgUWs/GQiYfIQcwcUmy3KRZTZQAjSeDukGrDfbDoQC
	NtxlLsFJuQSyHs05y+fBhHNYm1LMH2csYvlSHNhKnKxS6D281m5KXBQT
X-Gm-Gg: AZuq6aIlO6jQk1jc4OFK3OZcjX9vb5BLBNlbEuPrbPz/CF6mmxH6t5p3xfy8cpE0/ih
	w31r/SBrWtG/FXX3Vi9mQpSerFYmPqGqGAAjP84EGhJhwLVFp31GADP0F8wHe1c0bl3e4aFIGda
	NJVyITMdWSRZQK/IWyayCR5VGsN27NckJ0nq5tEIdL2j/141EXQWUJC70ufz3SXq2yXobu3LxC1
	p/PQXl/t+lpl08Q2oTQ7C9KgAG/MH2+SKNOOIo40q/A5baxTZEzavBGrVcTVzGsFV4bWTA1oSUx
	22y4reeftxsNR25lGvtw7r7O4fYspTupkYaW2AeW9zW7WIHha0C+3JPjrxkUE43LqlZMXZI4cNh
	Zwbz5vTliOa75a9sTOq/taXNoN5UfvUQ6MAHsG/t99YvKDcj4mgVPBaHILyLlOy+5DDHM2TKyAZ
	5vgxG70ksWFqMTW323c5fU5fBal8r1yuhYNDZ3omETZqNqTQ==
X-Received: by 2002:a05:690c:88b:b0:78f:b0d0:bd71 with SMTP id 00721157ae682-7947aca9140mr2169367b3.62.1769485827182;
        Mon, 26 Jan 2026 19:50:27 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:72::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7943b2a2cf6sm56637077b3.33.2026.01.26.19.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 19:50:26 -0800 (PST)
Date: Mon, 26 Jan 2026 19:50:25 -0800
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
Message-ID: <aXg2AQMMk3obScYD@devvm11784.nha0.facebook.com>
References: <aXGNhEKOhkTHbJvw@devvm11784.nha0.facebook.com>
 <20260121185021.446b00e8@kernel.org>
 <CAKB00G2xNvfiV6J3RzKDs=GHMGZ7L16+VKUYLGjpZdOrLnSYKA@mail.gmail.com>
 <20260121194615.33dc0812@kernel.org>
 <aXGib0OcNdHTLyZN@mini-arch>
 <20260126172646.2e5af2d4@kernel.org>
 <aXgjVb5PVqdPM10J@devvm11784.nha0.facebook.com>
 <20260126184440.755a55b2@kernel.org>
 <aXgryaSx9CzFR7kv@devvm11784.nha0.facebook.com>
 <20260126194359.461f908b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126194359.461f908b@kernel.org>

On Mon, Jan 26, 2026 at 07:43:59PM -0800, Jakub Kicinski wrote:
> On Mon, 26 Jan 2026 19:06:49 -0800 Bobby Eshleman wrote:
> > > > Then, if the dmabuf count encoding space is exhausted, the socket would
> > > > have to wait until the user returns all of the tokens from one of the
> > > > dmabufs and frees the ID (or err out is another option).
> > > > 
> > > > This wouldn't change adding a field to the socket, we'd have to add one
> > > > or two more for allocating the dmabuf ID and fetching the dmabuf with
> > > > it. But it does fix the single binding thing.  
> > > 
> > > I think the bigger problem (than space exhaustion) is that we'd also
> > > have some understanding of permissions. If an application guesses 
> > > the binding ID of another app it can mess up its buffers. ENOBUENO..  
> > 
> > I was thinking it would be per-socket, effectively:
> > 
> > sk->sk_devmem_info.bindings[binding_id_from_token(token)]
> > 
> > So sockets could only access those that they have already recv'd on.
> 
> Ah, missed that the array would be per socket. I guess it'd have to be
> reusing the token xarray otherwise we're taking up even more space in
> the socket struct? Dunno.

Yeah, unless we just want to break this all off into a malloc'd struct
we point to... or put into tcp_sock (not sure if either addresses the
unappealing bit of adding to struct sock)?
