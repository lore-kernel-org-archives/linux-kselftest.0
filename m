Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D28630AAA9
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 17:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775494909; cv=none; b=uN0orNB7HQ9xBsKm1wC4KWBxlNoDSEk3yccRo9bptuO4RCZmjLELPuUYxnUlwV+CwaX9SMNW6SuW/2+Ghegfx1DygMtpnh7Ujd5P5YnSfU8LK1D5OZs8VzQUnKGRZkZ3bvSJwfQUpztnUEiOyNKshIN5Y+tJmVhNhPpZ++Qki/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775494909; c=relaxed/simple;
	bh=G31jsNCNAeiJPwQvK1HAqH3ppSH0aGE0KdNESKrHoMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NeHms9lW0HpWTk2sD3VybdI1Dfq9OUs949gRnM5N9u27B3V6RRP9cB3KJ/PJsGQuklyelJzklB8oZkgi7VB9wP36zClQG/VNAllc5dBpqPXEU6yjjEE1b/p6zHX2khupfjTi1XEZeUurVunU8EHhki1bO24zGRGCMI4AHJnERrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=rqCEWiOo; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="rqCEWiOo"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso1991427a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 10:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1775494907; x=1776099707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUhQeD6+NwePYBxef6iQ7aiY8XQBRuy8ozLTXfPxIB4=;
        b=rqCEWiOovz4C+DiGzHf4cc3fxgEvTS/5DMoUbFCSautu+9jcBXJHJnz49bVS6uXywB
         7RFDt3n6uVHbTKODkof6Wv9MRwD7/lWzbZ8GY1FhJESsYMojwZMhLde4gCWYByKbim42
         B7sGWSSnarc8fKUiaMMdUqX2vNL7OjW62tasZDGeBsXaVWiqssLKGZ/Xyct+fGjohRu4
         beonmL3T3eHY6mVcW24PcfulFRzJ57vW/Tm6f0LNEporeu7rd4TqH1q8EFqczvFKRXPB
         85XTUunYF48zM6gdcSFApZCydIk58JINbA+Yogc4vAY3CjMnObqBcpBMvSPGZnV+Ic8o
         s8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775494907; x=1776099707;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kUhQeD6+NwePYBxef6iQ7aiY8XQBRuy8ozLTXfPxIB4=;
        b=ow1/sHgapQAoTD/tEv3ukNeUC99c15/t2F6sP8rGVXw6lhP3aiir6CRU6wO+s9YgK4
         QxMGs8zoE41X2rQ5+m0VHr6qHfl9ROFh/zuPRWaiKL1jrzHysj5Y1nNHUHddQB9Zfz0a
         ZNMLITLu73SzbumKGWAmY420znEzrpPcfYVHDE95ZtG8aDdL5/b9tREjV8Q8RLwb70AD
         AWHiSw+ISynspuPhy6iXKcqrRP9S/VIqXMSLsD2HD0wTJlquqNtOW/ibU67+mTlMgG6O
         fo3SN8Y2r1lsWKeM0sJioC26h6IgcSs3d8ho2ehlyR0mha+BkNf2psGQZDHE7J4HSRcE
         el8A==
X-Forwarded-Encrypted: i=1; AJvYcCWBkRoz44Om2LAp/7L6QaTHa61OddeG+UDctNGfj+Sb+/Psb9a+2lU1FwJWPIW54coz6pFf+nTTddjIe5jB3wI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxENKiaHa5DcuOMty5CmYnh9GA0tmI2d9DbhoToqFCdor9rXEY5
	mUyRiygu5llk2t3CeqhfkSjUjWCE72QDkfdlCsG9Amrt40GfGC9mBPfjyU51IQgEfYs=
X-Gm-Gg: AeBDietCP8IkcsLwwxPGHxBMJMqzplI8C7pWiA9NdICzqa76eBsoAFb89Mi1Bw9pf0F
	q2m+BhZY3tpwy6wrGRPiVZ3FF9abJV0vk6Rt6o/SGdbkUhQt7oSyvESyxgevkUcCXmgxaXk0/Td
	vWHd3R1gAVba69rCtLh1aIGfqF7wG+wy3b+u4CZDQTy0m/O9iysNdq2wxgXJPG2hWha1tM+lE83
	wPe9Yc1JeCkaattNgtid5l2571y1Ckt5YSg3r3KyXc+WBI4ZHsd71y/Z1Y/ruYd6nRjAJ4Bz+wj
	EtktlCFZ0rzBmU32C5qhGqC9wzcp1zV8vbLp0MhKfKfqSzI56nYXwxfRjznfzp/7AU1qXc5hlF7
	mucfzJdvgYL3MDugFDBcvjFP6tvjh0DQjESxZC0A6KuNmLUShbFDFivtPjD3rhN0IME+uaOD1Qd
	SLywQK
X-Received: by 2002:a17:90a:d2c7:b0:35b:e4d8:bb10 with SMTP id 98e67ed59e1d1-35de6941267mr12737851a91.14.1775494907434;
        Mon, 06 Apr 2026 10:01:47 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4f::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe62f5dbsm19677009a91.8.2026.04.06.10.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 10:01:46 -0700 (PDT)
Date: Mon, 6 Apr 2026 10:01:46 -0700
From: Joe Damato <joe@dama.to>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	dalias@libc.org, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, willemb@google.com,
	linux-kselftest@vger.kernel.org
Subject: Re: [net-next v2 3/3] selftests/net: Test PACKET_AUXDATA
Message-ID: <adPm+n8Uw3O2S5bY@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	dalias@libc.org, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, willemb@google.com,
	linux-kselftest@vger.kernel.org
References: <20260403233240.178948-1-joe@dama.to>
 <20260403233240.178948-4-joe@dama.to>
 <willemdebruijn.kernel.400d24decd7d@gmail.com>
 <willemdebruijn.kernel.14a8e29bbdc9a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <willemdebruijn.kernel.14a8e29bbdc9a@gmail.com>

On Sat, Apr 04, 2026 at 11:30:09PM -0400, Willem de Bruijn wrote:
> Willem de Bruijn wrote:
> > Joe Damato wrote:

[...]

> > > -static void do_rx(int fd, int expected_len, char *expected)
> > > +static void check_aux_data(struct cmsghdr *cmsg, int expected_len)
> > >  {
> > > +	struct tpacket_auxdata *adata;
> > > +
> > > +	if (!cmsg)
> > > +		error(1, 0, "auxdata null");
> > > +
> > > +	if (cmsg->cmsg_level != SOL_PACKET)
> > > +		error(1, 0, "cmsg_level != SOL_PACKET");
> > > +
> > > +	if (cmsg->cmsg_type != PACKET_AUXDATA)
> > > +		error(1, 0, "cmsg_type != PACKET_AUXDATA");
> > > +
> > > +	adata = (struct tpacket_auxdata *)CMSG_DATA(cmsg);
> > 
> > Sashiko had another interesting observation that this access may be
> > unaligned, as cmsg_buf[1024] has 1-byte alignment.
> > 
> > That is not new in this patch. Indeed most tests in this dir just
> > deference msg_control as struct cmsghdr * and CMSG_DATA as whatever
> > domain specific type.
> > 
> > The man page also warns about this and suggests using memcpy to
> > access CMSG_DATA. Not sure why it does not warn about the other
> > cmsg_.. fields.
> 
> The commit that introduced that has more context
> 
> https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/man/man3/cmsg.3?id=36d25246b4333513fefdbec7f78f29d193cf5d9a
> 
> It points out 32-bit platforms where cmsghdr is 12 bytes.
> 
> At least one example given, ptpd, uses a union to ensure alignment
> 
> 	union {
> 		struct cmsghdr cm;
> 		char	control[256];
> 	}     cmsg_un;
> 
> But at least one other example, ssmping, does not. So I think not even
> the 4B (on 32-bit archs) of cmsghdr fields can be depended on.

I'm fine with adding an "__attribute__((aligned(8)))" to be safe, but FWIW, I
think the key point from the commit message linked above is:
 
  shows access to int payload via *(int *)CMSG_DATA(cmsg) (of course
  int is safe because its alignment is <= header alignment, but this
  is not mentioned).

struct tpacket_auxdata only has u32 and u16, so 4 byte alignment seems fine
and I don't think the issue applies in this particular case. But, as I said
above, I am fine with adding the attribute to be defensive.
