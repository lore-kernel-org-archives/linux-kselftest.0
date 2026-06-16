Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129BC38911B
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 20:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781641017; cv=none; b=Cfpr718NlzmNwokTwzkGkhZjOeculTz4OdTgURvP1A87vaoW5MBUrXJGV/I4q4pXlX1KWot3jfuXXwsjxpoq6Eu/2mi7jITraPBG53Qd2pC19Fe7zEUixRLyRvU0NMIwdMzsYf6wlHaOV8KchyjD0nHSxBpunFUadI3XCswd8iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781641017; c=relaxed/simple;
	bh=NDPe7BjRqQO81lM7S/gk96lWQXHDy2NfdCGZ9cKvSfg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M9K+nK8TdMh5Jxjmxw7kc3ZH6xw60caPBE877o8T1JgbOVBvSz+bojw5od/p1IdcsgEkXVNbEe6TditbthWRAfJJgcROiGtSczhDsG51pX8WnLr6uk1Ma/Ar//fuXNHp8NG1avhWkmN7JiKACOTDftGE0aTMEMG8FYOeOI9z9fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kq38Z4FV; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kq38Z4FV"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4600ddc4017so3784356f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 13:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641014; x=1782245814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZHhd9DZXAW4wgKJX/mXTrxz0x9KgaM+DPaZGQCTuSg=;
        b=kq38Z4FVvBxl8kKxz6uizR6o7FvFkKKgk6E+SpK5yIJGXpEhyhMgA5/L622GJAtdRl
         S25Newj6Z4vcGrtkW2GV1ynCyLuRLlBbAvjmmcHc4NgONuwhf6PVlccDDFhKnAmWaf6Y
         K8HpQq1sLAfLLKzILxEhOc4gzlN8aFDNO3iWnaT/abjZfE6HcuDpz2Ji3i/rRalZ/gei
         79c5+69HeaLgxVxgZbMTW1qIyFUKGqZwd97Hbo8pLzFPrSDwAreBX87C0IuyzN87CjGy
         b2skhi6zApUyQroxJVuPGHXhQZLw+A2pkYD6djGjdDVxEErDVVm898wSpwsiJIp8bw7h
         x0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641014; x=1782245814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ZHhd9DZXAW4wgKJX/mXTrxz0x9KgaM+DPaZGQCTuSg=;
        b=HA9as0wNdmt1aHsMsE2gUHOkOCcb77ygYr4GhenSnATuL/5mrXfa6skhP1wfhBJ5OU
         T8RLE2sfjSY6O8LG3SkEqET6boT0gQY0PjKIZSgNaB1UIggDItfsgmDbr4zWrY81uA8+
         RxOdb5iloPO0PVxg/ZGEup0j6b4kD3QCBVoqbCk3VrAZlrhFQZVp/LxoanA4uvLcCdyZ
         +sp4q+a3HcimdK2NGe1whCd6uYO83sV9zEzUxJknQYoVv65JNQl41roLXGVqNzKPDey4
         ehxBBF6r21dxREpNIbTwORuq1sW91rgNe14T0DiC38mynDLMwxFnerXG11iZFLDFnYQ+
         iD0g==
X-Forwarded-Encrypted: i=1; AFNElJ9rYxulX04MstUkH3k6gG2pxYPlqhZ8rhdFL+Fja4qZaKwYMI2XXequ8AyX8JGM/FdX2RjNJS281Nbsb6yo/Js=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqhE9vAKP6Gntl1mpwSkMf//a4eP4xKG5L2YRSBvvF23qdXTf8
	WgYiTFKm3mYOBwZdspkbEkqUpjvS+US3BI12dmWossqxaczMS/4p7wkM
X-Gm-Gg: Acq92OHGz+sJm1KtDgygvJ8vepVHkK7LK5vP71cnzbzg8nbY9z7Cx9+ueCyd1ubfj4s
	g0MFZ/6289RbEeAytLlnyibAtAmrWVdcsFnSBNIXRQ3dSfXGoUtANpiXXOTFgoLFNECl1gF/T5Z
	uw0Pe9QBXvxkWvD8ryLpb10Y6WC3z0p7slhCLVOcF9KGhNvgjaExkFj+nGWphESXcQFdaVQmicO
	8UykpgICqplzcnsKEzMJrdaD0I6+xkpQUXnLVGWyd/FI6GoC544R8f9uA82U2VUYAfqwXG/fHe5
	xdq+FBYMvWsUKZ+iI1vBC4kc/xdAdswPUxscDqFNsNyj1q5HEsxP6jVhNdftAuCDE63L3kCCzqA
	9QekII9W7HQAf2AEFb/ACOvW9cvNLpasb/5WZ9qZ0+n3Mp7ouCB3q/JvlWAAUCqUlyxhEk6YKt9
	DohTmxdoIxBxiJJ+Y6IQ8BP+uwAx3awXwt+8ehQuD/TywKpUyQLDoVrbTK6seiUsv8o2KX8PI=
X-Received: by 2002:a5d:4650:0:b0:461:a16c:a5f4 with SMTP id ffacd0b85a97d-462391826aemr1168139f8f.33.1781641014427;
        Tue, 16 Jun 2026 13:16:54 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619fb12edbsm10160310f8f.17.2026.06.16.13.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:16:53 -0700 (PDT)
Date: Tue, 16 Jun 2026 21:16:52 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: Stanislav Fomichev <sdf.kernel@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-team@meta.com
Subject: Re: [PATCH net-next 2/2] udp: convert udp_lib_getsockopt to
 sockopt_t
Message-ID: <20260616211652.448d6b0e@pumpkin>
In-Reply-To: <ajF4Odi_L28LdIXC@gmail.com>
References: <20260612-getsockopt_phase2-v1-0-7b01f1f5d106@debian.org>
	<20260612-getsockopt_phase2-v1-2-7b01f1f5d106@debian.org>
	<aiy7ZR7Yz2Z4Ioyd@devvm7509.cco0.facebook.com>
	<ajF4Odi_L28LdIXC@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 16 Jun 2026 09:22:52 -0700
Breno Leitao <leitao@debian.org> wrote:

> On Fri, Jun 12, 2026 at 07:10:15PM -0700, Stanislav Fomichev wrote:
> > On 06/12, Breno Leitao wrote:  
> 
> > >  int udp_lib_getsockopt(struct sock *sk, int level, int optname,
> > > -		       char __user *optval, int __user *optlen)
> > > +		       sockopt_t *opt)
> > >  {
> > >  	struct udp_sock *up = udp_sk(sk);
> > >  	int val, len;
> > >  
> > > -	if (get_user(len, optlen))
> > > -		return -EFAULT;  
> > 
> > [..]
> >   
> > > -	if (len < 0)
> > > -		return -EINVAL;  
> > 
> > I see this part now in sockopt_init_user, but you mention that it's a
> > transitional helper. When we drop it, will we loose this <0 check?
> > Maybe keep `if ((int)opt->optlen < 0))` here for backwards
> > compatibility?  
> 
> Good idea. I will do it and respin (once net-next reopens).

The best place for the negative length check is in the syscall wrapper code.
Pass an unsigned length through to all the protocol code.
No need to require every function to do the test.

Note that the length check was actually broken in many protocols
going way back well before git.
There has pretty much always been an unsigned min() check that converted
negative values to small(ish) positive ones before the check for it being
negative.
(That predates min() being a #define.)

The recent change to actually error optlen < 0 might actually have broken
some applications that passed uninitialised stack that was always negative!

-- David

> 
> Thanks for the review,
> --breno
> 

