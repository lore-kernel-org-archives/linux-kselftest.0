Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6BE3126C2
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 04:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772081365; cv=none; b=UqBRROX+epHcz2Gd0UqeQqlcIRyHN0QGXw9sxN3Uc2DjcgdL3TpsgSJgDIjpZ4vKwl7RlYDZl9x+yt4WgkVf9qmrgiw5yk56KcuQJ3wxFLiN0mvLKr8YE3r913Ni0WRnG/GPrq2iUtQ+z21jSKcdCRYZptB+FQz32pmt+ruzV6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772081365; c=relaxed/simple;
	bh=H5qxSCBG01Q7pikuwlbHhR0uTwKCvOEAkKOc6vfLdTk=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Date; b=s9LpNsS4AJiijNbRgrhvxozMODBndtiYqO+ZZbz9Pw7OMDDjzwCl/pgJplma8d/Gj3Cgwo5wHSAM+Fiz6WY3kMo7kbURh+QdhtG3j3cASCU7eLduVq5owNGlPgrBMk1dCN98q4glK6vbxoY7yvrtY2JIm5jDdJRzSRwogOB9IvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F+wLyg4a; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=THc/X7P7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F+wLyg4a";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="THc/X7P7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772081363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i/Q9Fe1CwGeENSBEoJzHP9jotxWoK79l4lySB/6YOl8=;
	b=F+wLyg4aHVdY15CBc99FWwAJgsYohJsT+r/OkrR0hbHl1yWtwgLQdQHgrPY1M/Vi97gQxV
	N9KX1DycDqJmAKkwP8hRxFQUJG55sOrm9PhUBbsnbnuhmL4BEFRyJfOi6BWqhqrsChXbfg
	tE7i+9p7h1JcxRr43BUUm4GugREfu/E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-0YNEEbEfMmGZhB2Ivxa-hg-1; Wed, 25 Feb 2026 23:49:21 -0500
X-MC-Unique: 0YNEEbEfMmGZhB2Ivxa-hg-1
X-Mimecast-MFC-AGG-ID: 0YNEEbEfMmGZhB2Ivxa-hg_1772081360
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4836ff58111so5354065e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 20:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772081360; x=1772686160; darn=vger.kernel.org;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/Q9Fe1CwGeENSBEoJzHP9jotxWoK79l4lySB/6YOl8=;
        b=THc/X7P7QzfV/SdTgWJpVL87e9SptrME01bweuF9Gn1pEWLUcoGI9XURlHfKBrykHk
         xvJhWDI2SfqnbHbKXOUmp83DS/dXwXf2bzlA5j0H/Yy1DG/A2IsWz2/V6g9dJQ3eXSDP
         zLQmFoefMwKTQZ1V54FSloXvmCEX/wsBPkF9EmHpzmfpKlyFqMFj4tOd1S77c6TsFt4f
         kt16gTInFR78z5m+zm2TSlExuAAecgyEu9hpg0vyt0pdftm+hyVnMbHO1y3kN9nfmrn+
         6dX8P2K67ClfORZPYV7Kb8Y5hLxsEc9RvfqR83wrtmBzu4zzgAJ4g/XsjFomM13VRubv
         LXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772081360; x=1772686160;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i/Q9Fe1CwGeENSBEoJzHP9jotxWoK79l4lySB/6YOl8=;
        b=q9Uw0B5JBKvfqcioY6ZXKwPRYf3dMvEDta0PxVXBZqFtNs1KcHHhbqyvXjZvgo8FB6
         SU4sTSjVyO+Ny94ZsN1YPfuiT7sqJQ5XVuNWJ/+N93wUEXS56MpCnwp4upMquYoesPgt
         iDDcn50V1NdW1DipcR9gHGL8kAAiZeN8AZu2k2ubzmqrbL+OENCGpMh9acRAkYa5MWY+
         zr7NTcUrm7/kcOJUWmsLspmrwDo1GmnwcHn5wmJBJPjqwQ8JHoptcFJHGV/LD7HwrLCu
         Q9hRmDpFyBdti6Wzyo6TN93csisBhslyIXGMyB6s0jx5XkPtqxBvnEXMt9aTvjjzG+rt
         mxbA==
X-Forwarded-Encrypted: i=1; AJvYcCWa5jupR3mHsz8/OYV0rT8KN1xa66OTuaCItuC8byY9in+k9YlO8IcibfLWJ4duIxkBXDiWUR4D4KFkQHYu20w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwivJHl4phWIDSf2OooqPKsn939Dal58oeo1/uq8usS8AazZIba
	tHB9YpSWXqD+x64cKb+o4NNle0Ygq2lscmzpRy/OLV1bm1jd7qaS0ylfeT6zSMWfDBXw3anAO6p
	TsBmv5s1VjBSuPmGVksMm1lak/cFdZW6BT2vuYZZ/e42uQMBX1QWfAGBPaNOQ/YG+FxS3Ow==
X-Gm-Gg: ATEYQzz/RXAupEmol+ov2ntFnr00+FU1EuGU6dFGKoJGqZlBil5uS1369e5hoxpgjdn
	MDmWUf2Y5PWOKy4GJ1LwGb+6OVqeji06pK0Gsu2iHpjjP81ad6N2tg5INfwhxQFmQTFpdrUFzuU
	y1GuYS9G8TOvDnvPTKDxE4ACPkESrFpPNoGaWmXIMQpMp6mGsy7mqY3gXAbZLnokSpnHtfloSmT
	TKP1wBSWHerhQ8iQ56bCt27FiBAJf+yn5Dl3qpTArTS6IrdA2RuOI5XkyDiVj3gelffUvXkJ8l7
	gPB73m4iKtPwVivFsyqlgVVfVnj1koqXRLRn4RV8Jmef6a15r7vm6X2YC7EtZJJCaW7/oGfhx1X
	Am/1/v3VlL3e2mh2HOoog1q32OVbCADj3
X-Received: by 2002:a05:600c:4e93:b0:480:4a90:1b06 with SMTP id 5b1f17b1804b1-483c3df874emr9572315e9.34.1772081359714;
        Wed, 25 Feb 2026 20:49:19 -0800 (PST)
X-Received: by 2002:a05:600c:4e93:b0:480:4a90:1b06 with SMTP id 5b1f17b1804b1-483c3df874emr9572045e9.34.1772081359245;
        Wed, 25 Feb 2026 20:49:19 -0800 (PST)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [2a10:fc81:a806:d6a9::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b7713csm15418055e9.11.2026.02.25.20.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 20:49:18 -0800 (PST)
From: Stefano Brivio <sbrivio@redhat.com>
To: Simon Baatz <gmbnomis@gmail.com>
Cc: Simon Baatz via B4 Relay <devnull+gmbnomis.gmail.com@kernel.org>, Eric
 Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, David Ahern
 <dsahern@kernel.org>, Jon Maloy <jmaloy@redhat.com>, Jason Xing
 <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com, Shuah Khan
 <shuah@kernel.org>, Christian Ebner <c.ebner@proxmox.com>,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC net-next 1/4] tcp: implement RFC 7323 window
 retraction receiver requirements
Message-ID: <20260226054915.55f95c7e@elisabeth>
In-Reply-To: <aZ-dgdUFe0a7F6YE@gandalf.schnuecks.de>
References: <20260220-tcp_rfc7323_retract_wnd_rfc-v1-0-904942561479@gmail.com>
	<20260220-tcp_rfc7323_retract_wnd_rfc-v1-1-904942561479@gmail.com>
	<20260223232636.1ead2b3e@elisabeth>
	<aZ3o8RQehJDK_rcl@gandalf.schnuecks.de>
	<20260225223325.34468327@elisabeth>
	<aZ-dgdUFe0a7F6YE@gandalf.schnuecks.de>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Thu, 26 Feb 2026 05:49:17 +0100 (CET)

On Thu, 26 Feb 2026 02:10:25 +0100
Simon Baatz <gmbnomis@gmail.com> wrote:

> On Wed, Feb 25, 2026 at 10:33:34PM +0100, Stefano Brivio wrote:
> > On Tue, 24 Feb 2026 19:07:45 +0100
> > Simon Baatz <gmbnomis@gmail.com> wrote:
> >   
> > > Hi Stefano,
> > > 
> > > On Mon, Feb 23, 2026 at 11:26:40PM +0100, Stefano Brivio wrote:  
> > > > Hi Simon,
> > > > 
> > > > It all makes sense to me at a quick look, I have just some nits and one
> > > > more substantial worry, below:
> > > > 
> > > > On Fri, 20 Feb 2026 00:55:14 +0100
> > > > Simon Baatz via B4 Relay <devnull+gmbnomis.gmail.com@kernel.org> wrote:
> > > >     
> > > > > From: Simon Baatz <gmbnomis@gmail.com>
> > > > > 
> > > > > By default, the Linux TCP implementation does not shrink the
> > > > > advertised window (RFC 7323 calls this "window retraction") with the
> > > > > following exceptions:
> > > > > 
> > > > > - When an incoming segment cannot be added due to the receive buffer
> > > > >   running out of memory. Since commit 8c670bdfa58e ("tcp: correct
> > > > >   handling of extreme memory squeeze") a zero window will be
> > > > >   advertised in this case. It turns out that reaching the required
> > > > >   "memory pressure" is very easy when window scaling is in use. In the
> > > > >   simplest case, sending a sufficient number of segments smaller than
> > > > >   the scale factor to a receiver that does not read data is enough.
> > > > > 
> > > > >   Since commit 1d2fbaad7cd8 ("tcp: stronger sk_rcvbuf checks") this
> > > > >   happens much earlier than before, leading to regressions (the test
> > > > >   suite of the Valkey project does not pass because of a TCP
> > > > >   connection that is no longer bi-directional).    
> > > > 
> > > > Ouch. By the way, that same commit helped us unveil an issue (at least
> > > > in the sense of RFC 9293, 3.8.6) we fixed in passt:
> > > > 
> > > >   https://passt.top/passt/commit/?id=8d2f8c4d0fb58d6b2011e614bc7d7ff9dab406b3    
> > > 
> > > This looks concerning: It seems as if just filling the advertised
> > > window triggered the out of memory condition(?).  
> > 
> > Right, even if it's not so much a general "out of memory" condition:
> > it's just that the socket might simply refuse to queue more data at
> > that point (we run out of window space, rather than memory).
> > 
> > Together with commit e2142825c120 ("net: tcp: send zero-window ACK when
> > no memory"), we will even get zero-window updates in that case. Jon
> > raised the issue here:
> > 
> >   https://lore.kernel.org/r/20240406182107.261472-3-jmaloy@redhat.com/
> > 
> > but it was not really fixed. Anyway:  
> 
> Didn't that result in 8c670bdfa58e ("tcp: correct handling of extreme
> memory squeeze")?

Yes, but with that (the v3 of it) we still send zero-window updates
more frequently (because of the 'return 0' instead of 'goto out') and
together with e2142825c120 I was seeing in the captures one zero-window
update almost every time the sender filled up the window completely.

Perhaps it was even desired, I'm not sure, I can't say it's entirely
wrong (that's why I didn't propose a further patch), and strictly
speaking the issue was on passt side (we didn't send window probes in
that case, and we didn't retransmit FINs).

I guess with f017c1f768b things should be sane again. I didn't check.

-- 
Stefano

