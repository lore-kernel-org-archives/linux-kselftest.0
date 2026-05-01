Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B1936C5A1
	for <linux-kselftest@vger.kernel.org>; Fri,  1 May 2026 21:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777670470; cv=none; b=gpvXQpnd7v8c7g8+O2HpRq9w9gzURKPRW8VU8K0r9Bb2tG5Tx1Oi984qH3v0/wF4z7ghOC5aFKXosG0s/7rI1N0v7+/mx2Ov+OVLfetCg2CECQsAuu5nIOaklnyNll3Er9WX+sEbdP1Y+VFQR2Dz6SR/Y7LPDwAG+oqv/eVF230=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777670470; c=relaxed/simple;
	bh=gbYFLTANvKgL0YLaobKU6Pf+SimnzpTiv2B12KmDMck=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P0tBfyUwVyhZyKeeu3OfS1ueQXN2Nhddh1uH0OZylJ6qmv+Q+evuZF3tsORo0uOdYead0VwRZ2ob14rPKTnFXJEhR1GHc4fZwarMjoFr4Il70ZALypIwY3XsrmDcOSxtUPRHdFr+tgUezEWXMCv86OFTAcKwgzFTSA1PGXYwvwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfdHCQeN; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfdHCQeN"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-448528f4e69so1320663f8f.3
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 14:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777670467; x=1778275267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3Cu+Df2v8gmiZwpX0nD5Z+6tJtgNGySMwqyhPLW2dM=;
        b=hfdHCQeNUln6gHwi1iBuwm14cFds+HdQDBOtrNoYNcD+kxhnUbEzJBWjnEvmGjHR0Y
         yAlRWd8V0TM/DY5MU7upUq9oS68W1u8MztcoIk5yTXM2qpBdOLihOyfwUUXMorC8Isqf
         YavOHcuYz22bGxMj6jStImcOjvmr4GDbJeHd6DlPPNMehYZBklbgKS+AZ8oy9c/qg5N2
         sAgczoppa60yf5RPsdKadsakqR6DXtYzzwd9B5nOSo637ZhdRgtKEVkesBRt6mMaTqmM
         jVAxizVSm1YjmLNIkk4y8Z3I3hv/YWtKTGIsaleDK7vVFoNND8vh3a/I7y6UPFkj/72t
         A9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777670467; x=1778275267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E3Cu+Df2v8gmiZwpX0nD5Z+6tJtgNGySMwqyhPLW2dM=;
        b=fwwKikg31r1dwr0jL1SpmqQQAPiBhA/ie1HW2gVbFAdVbnscQ8VDC+smbAzw/VGMjQ
         EBBiFF7HVitFjposyNs0HJel/CUbQCO+jDWmAMIl77j20/ZC17+ItN9vENUlbdEmXtcW
         3djWN53ape62NSmcbF4SVpaO9noRA64TX/J5yKfrikiwo+AtgaZuO845PDDOQWUW0kSl
         +S1pWZDOW/C/Xd1Qj8nbR4bgEfChXUNsGAjxrXEF00ZFGIrYTyhKKBWNwHRoTgydA+jp
         MPcgNhg5857HwMQWYICblFe7ztrx82YUkMmLo2fn4AQe+V23M51UUooIO0lpnCUjOoWH
         tWzA==
X-Forwarded-Encrypted: i=1; AFNElJ8ez4rf1WbFpacHMLhJuRJ9fjGLudJflgpz6DbgM3vxla+AmiDQgcDMAMmYBRdi1HHVUVnyw4N8zdXWs07OCmc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7APn8TGLlYTGlqYtD48bABpQ/FVhl1+JWh8h6XJAC09HJF8FT
	lHHq5JmWTUaFv2v2yrLP5D+N8H5H5wGKffsV4m4bi+erbF4Dz1M8I8X9
X-Gm-Gg: AeBDiesCNlqsE3vsyPHEA/LkiUgTTlhXpRP7eyl6WIFh9e15gXTprXHh4hTm1XsR7VL
	RZYiaFN2r8cTkqJsFrJSKoVYiTFMmZNpSY9WWFPcY+cFJY7Gz50jmbEAYberPkyThptL5z1Nl0I
	0u3OCGA6yTZvKLnk+Iqv0P7kwdu3WMKLWow062bZnIEosVP4zxtV2cNgimZHughwZeFBS/fYU2o
	pVE2Zuyd4yr7HKPhBO3LBJTlF72QPJTA940cpbCE4OpKtICvRinYYqRXCg5/oWSM6SmJNonvZaU
	Vfhgjmrb8ay80pma2oDMhtmDrbbuiLuCJsoG/ztWwG5thltHeKPNpG0LLPCxid4ErZYLETjAJdk
	xtF7773wV1A9W+NK5vT+aeZv7DAz5hFohoTSnbwk7lIxYcdUjKxzpe9JldBWkvhADhYgQYQjxAj
	xCeSDtW3G8eJ3wzop5ClJcpFYpomsZbI/yiEvI+SsvQx1a4CPiTYpKJoJD/tFNvsrVJmZIccXS8
	8I=
X-Received: by 2002:a05:6000:288b:b0:43d:7a97:78b5 with SMTP id ffacd0b85a97d-44bb5e2deb9mr1495268f8f.33.1777670466885;
        Fri, 01 May 2026 14:21:06 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8f51bac8sm7514313f8f.16.2026.05.01.14.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 14:21:06 -0700 (PDT)
Date: Fri, 1 May 2026 22:21:05 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Breno Leitao <leitao@debian.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan
 <shuah@kernel.org>, sdf.kernel@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH net-next 2/3] vsock: convert to getsockopt_iter
Message-ID: <20260501222105.747dea59@pumpkin>
In-Reply-To: <afTjvM1P4gjPSvW8@devvm29614.prn0.facebook.com>
References: <20260501-getsock_one-v1-0-810ce23ea70e@debian.org>
	<20260501-getsock_one-v1-2-810ce23ea70e@debian.org>
	<afTjvM1P4gjPSvW8@devvm29614.prn0.facebook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 1 May 2026 10:32:44 -0700
Bobby Eshleman <bobbyeshleman@gmail.com> wrote:

> On Fri, May 01, 2026 at 08:52:52AM -0700, Breno Leitao wrote:
> > Convert AF_VSOCK's getsockopt implementation to use the new
> > getsockopt_iter callback with sockopt_t. The single
> > vsock_connectible_getsockopt() callback is shared by both
> > vsock_stream_ops and vsock_seqpacket_ops, so both proto_ops are
> > updated to use .getsockopt_iter.
> > 
> > Key changes:
> > - Replace (char __user *optval, int __user *optlen) with sockopt_t *opt
> > - Use opt->optlen for buffer length (input) and returned size (output)
> > - Use copy_to_iter() instead of put_user()/copy_to_user()
> > 
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> > ---
> >  net/vmw_vsock/af_vsock.c | 16 +++++++---------
> >  1 file changed, 7 insertions(+), 9 deletions(-)
> > 
> > diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> > index 44037b066a5ff..d4a97eeb596e6 100644
> > --- a/net/vmw_vsock/af_vsock.c
> > +++ b/net/vmw_vsock/af_vsock.c
> > @@ -155,6 +155,7 @@
> >  #include <linux/random.h>
> >  #include <linux/skbuff.h>
> >  #include <linux/smp.h>
> > +#include <linux/uio.h>
> >  #include <linux/socket.h>
> >  #include <linux/stddef.h>
> >  #include <linux/sysctl.h>
> > @@ -2091,8 +2092,7 @@ static int vsock_connectible_setsockopt(struct socket *sock,
> >  
> >  static int vsock_connectible_getsockopt(struct socket *sock,
> >  					int level, int optname,
> > -					char __user *optval,
> > -					int __user *optlen)
> > +					sockopt_t *opt)
> >  {
> >  	struct sock *sk = sock->sk;
> >  	struct vsock_sock *vsk = vsock_sk(sk);
> > @@ -2110,8 +2110,7 @@ static int vsock_connectible_getsockopt(struct socket *sock,
> >  	if (level != AF_VSOCK)
> >  		return -ENOPROTOOPT;
> >  
> > -	if (get_user(len, optlen))
> > -		return -EFAULT;
> > +	len = opt->optlen;
> >  
> >  	memset(&v, 0, sizeof(v));
> >  
> > @@ -2142,11 +2141,10 @@ static int vsock_connectible_getsockopt(struct socket *sock,
> >  		return -EINVAL;
> >  	if (len > lv)
> >  		len = lv;
> > -	if (copy_to_user(optval, &v, len))
> > +	if (copy_to_iter(&v, len, &opt->iter_out) != len)

I'd wrap that as copy_to_sockopt(&v, len, opt).
or to make the edits easier: copy_to_sockopt(opt, &v, len).
Then if someone decides to change the implementation none of the call
sites need changing.

-- David

> >  		return -EFAULT;
> >  
> > -	if (put_user(len, optlen))
> > -		return -EFAULT;
> > +	opt->optlen = len;
> >  
> >  	return 0;
> >  }
> > @@ -2631,7 +2629,7 @@ static const struct proto_ops vsock_stream_ops = {
> >  	.listen = vsock_listen,
> >  	.shutdown = vsock_shutdown,
> >  	.setsockopt = vsock_connectible_setsockopt,
> > -	.getsockopt = vsock_connectible_getsockopt,
> > +	.getsockopt_iter = vsock_connectible_getsockopt,
> >  	.sendmsg = vsock_connectible_sendmsg,
> >  	.recvmsg = vsock_connectible_recvmsg,
> >  	.mmap = sock_no_mmap,
> > @@ -2653,7 +2651,7 @@ static const struct proto_ops vsock_seqpacket_ops = {
> >  	.listen = vsock_listen,
> >  	.shutdown = vsock_shutdown,
> >  	.setsockopt = vsock_connectible_setsockopt,
> > -	.getsockopt = vsock_connectible_getsockopt,
> > +	.getsockopt_iter = vsock_connectible_getsockopt,
> >  	.sendmsg = vsock_connectible_sendmsg,
> >  	.recvmsg = vsock_connectible_recvmsg,
> >  	.mmap = sock_no_mmap,
> > 
> > -- 
> > 2.52.0
> >   
> 
> Reviewed-by: Bobby Eshleman <bobbyeshleman@meta.com>
> 

