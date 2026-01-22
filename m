Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914493AE715
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 04:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769055714; cv=pass; b=gQ0Yf5RqVf8nfL2P+9feJyoJFbLz8Pmga+q0yea4RF0l2WOefUCO3TwqySZAzMvHmil5IF7Lh03WsZep5Avln3n2a1kOXjFnVc3zx6FjBaVKB/pKkvlLK9xCyA+AhujUU+es5ZLPjnTwN7sRxyQRDoeFaG8DElFQCROBE//ZueQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769055714; c=relaxed/simple;
	bh=mH5awB6ralgR77aSnZe5QraaBsnwcsK7oANg9mkpPlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=koGMFLLsi2VgYQXI9asiZcd5re/MZdnSyGTF9AAHmI1+rgccV9PoihAki7NVvkS8gAn+Rs2M8WzJiM5412aAxGSW/F+mUFTHei9Ng0jDUw5tuPpXY7uVgNtdc7BIETMndDOXrje9GAild4evsT9AqmLvGmkq/QI5HaIEPjspR78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0zQy/Dm8; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0zQy/Dm8"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59b78649941so1976e87.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 20:21:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769055709; cv=none;
        d=google.com; s=arc-20240605;
        b=G8Vqm7QqfLt4DAulncV+UXOdLyCnT+dWQv6ObU8CJFwgtj5Jgg65UTmhIxrHqRujjc
         4YtrclG4OxNiiIDts69Qm50m+L2UzoRbrEPEAzsm8964O4bx7T0Gu0WK1yIpNa87ar6t
         anvsGZPLqK7OfJ9I5jWkdjc5pS6XyFsk3bzQ+PgMD9F7nARf13xhByJa03nFgigV2ti2
         tSKCF+uiZPyiiqyuw2UT6sLFsW03XCPc+Y2wHphk+JqW4VFYV0pxFz8V/zVZc4m8N5Ov
         9qcQo3oIeER0P4pSniQnNjwR1LrpLjIl+wxJ0/PogDLPIn+yjRoGHCjh1LLxGS0kTU72
         1Vlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qGE6hsUQ8af9Nnk2uwraZMl2mJJDDg6fHFgsmYD1lkk=;
        fh=BgP/75zSUOGcayTEMLAVXlrDXVFNk8TzeE8l2zd3EB0=;
        b=K91SO6HhU3oBjZMIIGfM1m1hUU0ZDFqtgqSanqfF20wCmikCc8Rdug9UhmoEGIdjvE
         XsgvIh6BsmelwOkkP3w8MhS8TVvi0aKHgyZHropOmER8nkZgGF4+hEXMPB0tU6tiYpRO
         l1waL5dH8VZfvHuNIN3Ez2l+v+Xnf8MlJ8/pIC/8fNmIUIJ4eN/VwXVbxRqq8wPoxzTx
         tWiKaf0hHU0IDRs3QR3ZPA7cnO0esZ/E9s8d7U3SysLJv8ivMEKWII5O0AJQQvxiKp3o
         +tEwaylNuqI1rmEdaNX9wzihLnvciOO1MeakwqE1GfHJ4ycGgW1hQRWieYO78tb12NLH
         q3sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769055709; x=1769660509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGE6hsUQ8af9Nnk2uwraZMl2mJJDDg6fHFgsmYD1lkk=;
        b=0zQy/Dm8TcfK/iDLejdkGKUQOOP3jWZ7ooOgqQrJPCLTZPZAkZopKiYUKC/C7+yYyy
         ClAhXuIspjsgDJdrLUXWIvf5fU7cM8RNVLOHF4xa7pcqUFVXjYw5SU5+puHobJPif2aO
         PZ1Q3cGElKY0o9+bhHRNBXB+DMSyGFS3NrchUlN5JJnv8ETEb2TMUSzEhZQKvq3ctDeu
         fRPG6U+awhPadcCc2e79h1fOQ5Thak56rWPGd+9eDu55QW/EV7hYDrPWCEr77D3zPnkl
         xZ40KACcgE0khhhG8tdoQsHlmlcUL0VhwcpZHXQz0PMbivuHp5E0UL1P1LoIVBW9MZuS
         sfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769055709; x=1769660509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qGE6hsUQ8af9Nnk2uwraZMl2mJJDDg6fHFgsmYD1lkk=;
        b=jnmD/Y5LmNT6lQZpsUyrKSC93utKmhrgtGJaV3AZEK0Jwlziv60QmDEmG58J4CjgHZ
         Y5EqdVantNklxRVzxpXl341HOrCdT5xfE7+3iZkjipkwEGFxV0GE7SikUUKswLpdjcZu
         cfczgVqh5k0tWlfBebO4HknFGkyMlj//mo514iQpM7bwbGQNjLBDXbEoZIAYDTW7MuWg
         nssNTjgfNCinAggY2ws1K8etuGK7oBsu41H6vbTBRgK+I7frRMFzxn9/WzwDggsb591Z
         xH/hrp5zSRyikitxDusQBCTJbZiFtGufxLL9zLMX4mq3j84IzlxDjs47gsYnS+AepsiG
         zO/w==
X-Forwarded-Encrypted: i=1; AJvYcCXXmOL8qGN4AIcPW5gn6Ef0MdDKg5MU1czY7Xj+3J4oisnQ3tJ4RQ+P6xHJnovwA3PRuikb2mhQiVAlfa6cVI0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3aCeLx+SHxPg8DBTnnhkhHoeAe7vjCfQp3lmOvkxxNmCqNIxb
	Vp0Xo/vWvseIlzyEPfznW7ySdxpUQ9ErmMfHGDvHN2a/FZSG0FWUJ4RC5gToIN60C7jL9fuVb35
	ibl7Gn01AMuoTZSXFw1NNS7nxqKrd4LXZ9zbOde1K
X-Gm-Gg: AZuq6aKBV71ILz/L24sfsGWHNZ29xTBqJ+mYfYF2rHw0geDOzkPQNliThZTsVthqBBL
	LW/8mXKUJ/2SHEklCtQrqEdTKlcme3lrN7riMhUkCJQ+3UovYZBnlMJUc7dSPj8GD/aHN/+eh6G
	UJJkiC5STMcixbuwGZclu7bz5Zizve0Io0tIM71XtRi/y98MuZntsR8WUnK1Fp+7MMdmylG9hbs
	Ao+fk/CP1dGgYGqhMPzasne3gOrtSDbIQsJJjPHSYRHJNu/yNsS69RIAziINr+hQVhDjX8=
X-Received: by 2002:a19:f009:0:b0:595:8927:8a32 with SMTP id
 2adb3069b0e04-59dd9e0ac3dmr85586e87.16.1769055708809; Wed, 21 Jan 2026
 20:21:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-0-686d0af71978@meta.com>
 <20260120170749.101e8bcc@kernel.org>
In-Reply-To: <20260120170749.101e8bcc@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 21 Jan 2026 20:21:36 -0800
X-Gm-Features: AZwV_QgK7aDkPrzxUeGdcAMqS5gjfqbpQkTe0opAcE2mJCNB7DPzAw0bMRr6cbI
Message-ID: <CAHS8izMZxM6rcF+7Lfw=KFv4dmbHGSUrQBPmxO+sYj=V3TRuwQ@mail.gmail.com>
Subject: Re: [PATCH net-next v10 0/5] net: devmem: improve cpu cost of RX
 token management
To: Jakub Kicinski <kuba@kernel.org>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, 
	Neal Cardwell <ncardwell@google.com>, David Ahern <dsahern@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	asml.silence@gmail.com, matttbe@kernel.org, skhawaja@google.com, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 5:07=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 15 Jan 2026 21:02:11 -0800 Bobby Eshleman wrote:
> > This series improves the CPU cost of RX token management by adding an
> > attribute to NETDEV_CMD_BIND_RX that configures sockets using the
> > binding to avoid the xarray allocator and instead use a per-binding nio=
v
> > array and a uref field in niov.
> >
> > Improvement is ~13% cpu util per RX user thread.
> >
> > Using kperf, the following results were observed:
> >
> > Before:
> >       Average RX worker idle %: 13.13, flows 4, test runs 11
> > After:
> >       Average RX worker idle %: 26.32, flows 4, test runs 11
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

Doesn't 'doing this via netlink' imply it's a control path operation
that acquires rtnl_lock or netdev_lock or some heavy lock expecting
you to do some config change? Returning tokens is a data-path
operation, IIRC we don't even lock the socket to do it in the
setsockopt.

Is there precedent/path to doing fast data-path operations via netlink?

There may be value in not biting more than we can chew in one series.
Maybe an alternative non-setsockopt dontneeding scheme should be its
own patch series.

--=20
Thanks,
Mina
