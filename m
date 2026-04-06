Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5805F21B192
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 20:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775509020; cv=none; b=CBwhpL5u+MgzNGv0UGWus9Fm9TK8SeCm7yltKatQbcR/3g6nyTe/QllD1zP2KM7l90+tcnf0S4CyNngSSnzbIBf5poBZWGi6lXCJOal33rFMSpzKRtaqmQ1DUVFwI6eAvp7z00PazQxrI+Je8EDbRd1E09YgwNOPUaAdA3gqUbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775509020; c=relaxed/simple;
	bh=z9ymFt/yV556ogk1/KubQwbpDGG7ebWj5Z0TkeYOemM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=uT5WOe3RKflFMW0vgSfzKP/FmtC/6Zw5/6moP610G+IcY5p1bJKNlAegHddLTGY8nw81xBjIqHQdiRx8kPiJBkFbLRvB6WgyeycLMNMBVAaErdZfSmvyJByYoPAsjP9EyH5QOWlJZWo47Dy9I+roO6MGqvSTR7XyGSNfyVQZQTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o6jHBOC0; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o6jHBOC0"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79a46ebe2beso41133867b3.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 13:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775509018; x=1776113818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbeQ7RU4fPJs1XWunFP2puvppP11EJLLY6x9wM0vzAs=;
        b=o6jHBOC0fjoX+xJ71qHYrnNLP60bB/b2cAuzOK0LiwgDY7zJtA91Ei8uJrwjIIwDy0
         Pn9epCKoLMraOtBvX2nqUnJb1uEfpQd9j6Ny4IKQLvpPYuHGjRfjOMUL6k65cB8rQLb8
         rLuvRtqHm306aLDziIPaMf/jrwnwLkR1UrRcTBGNq+rj1Zg/rVsNKj5m5oCMguRiZK/N
         WpeCD9ScMX7qoRYhPmEDtQIW23iETpKSoR9IudnkSUeo0a8ySafMigAryVRG4H/SWM0d
         mtJAJXR4REjaPuU+NtvHjfpKEwDYGSPD+Gd/fFq6tHRIL+bQPe8xyJ2nKFYZNC7Y7CiF
         Iy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775509018; x=1776113818;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IbeQ7RU4fPJs1XWunFP2puvppP11EJLLY6x9wM0vzAs=;
        b=lNqMjnz6QLTFKvgqXDJWmjeTBUc2J4B8UwF8S5kiK5YeKdiSCv8w6oQRpp+Dr0/Poy
         LwnIXP3ds0RWxvgrPLrzD6+jUizeV7IjjjOmmwAeYe2RxqpcbSnCHKOZsEEGGk2FvSwI
         LtJRhN2e3ogT39/M75fo5aS5fJ3IJf42ZctyIUzyhOjiyURDo1hBzAIGE3CPIcPcrsTU
         hAqmPcTXnSef3BWjUiEprAp5dSLZ8+R/OVtLBSTtkuHL0OQF7wSwId9rsAbIymqSjlID
         H1nUmPlNoJ3AwKVu+OHUhwL2z3iBaIP0fTIaXeTlmhaDpFfeBWw0kAxxkbN9+UjXXKGG
         7MGQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+ofPu5o+s/4rIZv9SyUQgRT2IrfXOqzGFbHy9LfW2fK5lbJ0oeqyIaAsLTpqAOpMQojziIl85ao2R8Ls+oeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoHt3DQZ1/9UzdOBRiF5C0L646JNO+JnUM0V9+op6tfZUDZWSU
	USOcFADPAuXtx+V2giXtKCNTAmjwL736IsV34uVeX4zj777N6vcHu7Au
X-Gm-Gg: AeBDiesOgAgkB5W+F+3IxrXV9OcVIbClAGEwsSP/H7Ifg3Ex4VYYSBmsgTV6J9E2iA4
	nqdkX6LAsYb+zsq3+iHzke/DiuxyiKUCm+X9gB/WhFx/oB4pRoT+K4EOquFBOetEe+Yr2EzLN5+
	mZmiyo7Yco4nC/yBmp1sFUbuEZ5yzD2yst/l6AN9aQCmnHbqE5CJX/Nkbt5IAcLVP1YOqzbErxk
	LIJiCeVLEvDznfQMpU6r0jUQTemQXsI+/c2zlHJpJNxxRgEQtxGtgmeFWcJ79ttR9mQC3+FZL9G
	AK6fFnj3/Aik/PdLAazeg2+QVyr6z7nGLflMg3BzvFuR33AKhkAkicSxi7/hNJZVE0AZG2kYGQt
	KmjXNSAhWxJ2FOwzwbjOO9LMWkyXy8DDS6Nfj22mJGlVxSeMyJXZnC6hlLHgG/e45cyzjYL+rec
	RDMujyFocPg6JgNlxQe4ls05BfUXiafd3DJV9/dDsXopJbYS0mm8LhrFFR4U2pShLehjXekCCFb
	eiiKiPxT/GewHs=
X-Received: by 2002:a05:690c:38a:b0:79a:7cff:7b81 with SMTP id 00721157ae682-7a4d556cdf1mr149463227b3.27.1775509018352;
        Mon, 06 Apr 2026 13:56:58 -0700 (PDT)
Received: from gmail.com (172.165.85.34.bc.googleusercontent.com. [34.85.165.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36e42fec3sm58182407b3.4.2026.04.06.13.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:56:57 -0700 (PDT)
Date: Mon, 06 Apr 2026 16:56:56 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Joe Damato <joe@dama.to>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 dalias@libc.org, 
 andrew+netdev@lunn.ch, 
 linux-kernel@vger.kernel.org, 
 willemb@google.com, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.33be72b96419e@gmail.com>
In-Reply-To: <adPm+n8Uw3O2S5bY@devvm20253.cco0.facebook.com>
References: <20260403233240.178948-1-joe@dama.to>
 <20260403233240.178948-4-joe@dama.to>
 <willemdebruijn.kernel.400d24decd7d@gmail.com>
 <willemdebruijn.kernel.14a8e29bbdc9a@gmail.com>
 <adPm+n8Uw3O2S5bY@devvm20253.cco0.facebook.com>
Subject: Re: [net-next v2 3/3] selftests/net: Test PACKET_AUXDATA
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Joe Damato wrote:
> On Sat, Apr 04, 2026 at 11:30:09PM -0400, Willem de Bruijn wrote:
> > Willem de Bruijn wrote:
> > > Joe Damato wrote:
> 
> [...]
> 
> > > > -static void do_rx(int fd, int expected_len, char *expected)
> > > > +static void check_aux_data(struct cmsghdr *cmsg, int expected_len)
> > > >  {
> > > > +	struct tpacket_auxdata *adata;
> > > > +
> > > > +	if (!cmsg)
> > > > +		error(1, 0, "auxdata null");
> > > > +
> > > > +	if (cmsg->cmsg_level != SOL_PACKET)
> > > > +		error(1, 0, "cmsg_level != SOL_PACKET");
> > > > +
> > > > +	if (cmsg->cmsg_type != PACKET_AUXDATA)
> > > > +		error(1, 0, "cmsg_type != PACKET_AUXDATA");
> > > > +
> > > > +	adata = (struct tpacket_auxdata *)CMSG_DATA(cmsg);
> > > 
> > > Sashiko had another interesting observation that this access may be
> > > unaligned, as cmsg_buf[1024] has 1-byte alignment.
> > > 
> > > That is not new in this patch. Indeed most tests in this dir just
> > > deference msg_control as struct cmsghdr * and CMSG_DATA as whatever
> > > domain specific type.
> > > 
> > > The man page also warns about this and suggests using memcpy to
> > > access CMSG_DATA. Not sure why it does not warn about the other
> > > cmsg_.. fields.
> > 
> > The commit that introduced that has more context
> > 
> > https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/man/man3/cmsg.3?id=36d25246b4333513fefdbec7f78f29d193cf5d9a
> > 
> > It points out 32-bit platforms where cmsghdr is 12 bytes.
> > 
> > At least one example given, ptpd, uses a union to ensure alignment
> > 
> > 	union {
> > 		struct cmsghdr cm;
> > 		char	control[256];
> > 	}     cmsg_un;
> > 
> > But at least one other example, ssmping, does not. So I think not even
> > the 4B (on 32-bit archs) of cmsghdr fields can be depended on.
> 
> I'm fine with adding an "__attribute__((aligned(8)))" to be safe, but FWIW, I
> think the key point from the commit message linked above is:
>  
>   shows access to int payload via *(int *)CMSG_DATA(cmsg) (of course
>   int is safe because its alignment is <= header alignment, but this
>   is not mentioned).

But that conditional on having a union as showed to make sure that
the structure has the struct cmsghdr alignment.

A bare char[] won't have that.

Anyway, in practice on the platforms we test this hasn't been an issue.
Fine to copy the example from other tests, leaving out the alignment.

I will follow-up with one patch to update all of them at once, once
I'm certain that I did not overlook some other mechanism that
implicitly does guarantee this alignment on all platforms.
 
> struct tpacket_auxdata only has u32 and u16, so 4 byte alignment seems fine
> and I don't think the issue applies in this particular case. But, as I said
> above, I am fine with adding the attribute to be defensive.


