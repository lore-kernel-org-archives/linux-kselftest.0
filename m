Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB7A8634C
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 01:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773796573; cv=pass; b=TDrm59YOrDqm+KL/7nwm2Ia2cyeSdpATT21mZDCGMC556DNp9h284j8Jk3pP4Qi1xNX0ju0Vx6h9MuKUSf9iHTObc6eWxmKtAICPX8NxJd1nZrOieMbZqRvzpXpBKXpGEYZH7LDZvuFoEsjWAwEqwTPAFsPl1cm494G1F2/66Oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773796573; c=relaxed/simple;
	bh=3w2OBXZSRP6xgeoDfIzydCPozvN6W2306MSC+T9kb58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tE+58aaWGIlP2b6BURleueyqv+Yz6PHo1noE9JSbxa3SPf2V0pBd/x/KEJxXp1rKUy6GAsSY97ki0kuR2RKIAk/A7GhhW8XafPOBr6uv1U6xNFSRmBus5s7p3OAUe647E3BoGu4gfraV8yTFaFm7oT79KUF/fddYEKNGIweL6Ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gwNbXNsF; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gwNbXNsF"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48628ce9ab5so18232315e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 18:16:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773796570; cv=none;
        d=google.com; s=arc-20240605;
        b=XnhxKiXLtEyhRIvqQNU52jr8i3nwDGDnW8372NxiOwsy6PVfXwcOzCUtcPzTK0P2xP
         +6837QexcObegny8h9d6ayJcH0tdOLBs+IQckhFecNphC246PZUj+8DeiWyGeJXBcrrb
         sbZsANSzAo59DH4VEES18uYrqf0l92H3PbYTu2q2UKWO75at6/LIairZFdU9mllyQwaO
         SlkjFVlN/mlLnKk68yHOGx2iNPMj+26KQ5EiPTRsl8Cx2Sfdp+xQY3T0kNwBXaKXz6iG
         ekAsV/W3R0xFmiH5ARiiG8bPdjb8USPf/CvXFCjtQL1GZxkrkDU1C64h40/JgaIV6X/y
         SN0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3w2OBXZSRP6xgeoDfIzydCPozvN6W2306MSC+T9kb58=;
        fh=Pb+CkWe9+sim+Cvsb0gov6lF9HzNt+CvKrdS8BHOkEo=;
        b=OC8lpx5OzBtRJBtAsN4xsYR9ZEaiIQOJh+nW1gmodT2Prs1tgMFdU9PX48I6jwZ4Zt
         M/uO/2Ffey/18F+gw2RVLRMeJFfO4MHcDof2Sx/BoP4yCvpjwjgHmcL5nOKVvuZchcB7
         lC++LOyd9jqbnbavn4FUCSJeT5wFE/tP2QTdm39goyPy6VvU/VNS7T+I5nYenkFN94TP
         bDNZ14h9v+MTOH0/w6whnBTPypJKtysGA5fTq5+IqaXm6IrpHKBRAMvtkHpXWPlZ5rPg
         MmRc5+97+fJdbPM/2P/kYE5MPeZ0cVpLBS09Jt1h6wrkKEiGFhGIBdM7iLVYYDdDBD/C
         ZjvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773796570; x=1774401370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3w2OBXZSRP6xgeoDfIzydCPozvN6W2306MSC+T9kb58=;
        b=gwNbXNsFjJ5I/rKMUtQV0RcE8uzPvaeiGNXV9yRrfF3jsU2WqReVgITC+rdJf4VWId
         2Q3Wqy/4mb4oFtqwNXgTNf7ZTX0ty08lzY2QTNj9GK/iIt66kbgevofTQrx5LqnOnkUF
         xtfRftDGYI3Gg1HBpFa7CDJNx61668vS20asflQgQydFp8SGyRylv6mASjCoxy8RqG4T
         cFRESowjz2A+czTkSOlFp/Z2hFQ5LEQoRrBwq6oP7W8iHZY6AnCybUmUCY4uS3N3mUzQ
         rg7nSjsC+DpBj5jWYS+4EENc7UWuqQPT+Xqxn0jJF8r6mqjyRoLCS1SaWpIAEc49hKCA
         AQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773796570; x=1774401370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3w2OBXZSRP6xgeoDfIzydCPozvN6W2306MSC+T9kb58=;
        b=Z4zbMo+a/4tJGaYpHAWcOKHsMG9mwO+uPcoM3CP5o/cBQNrlvhjHevOmluVNTn0qQp
         b3leW+hCpdYPgkwgsrMpnipEDCT+MaG4a1iUrDj+Cg2RRgnESjPzGhHzWe6qMSpA0vu5
         fk/uQF9iyaLDluKJphKV9K42aGt+5Cx2866EifsnUZ20jQRzjQAkQHtgUVr4xvgntl50
         L8QE/WEgckiSCbqKWum7fJKvqFDdPiPzODWoMlB9m/OU77itLUm06bKvxQumjr5JK+xz
         vSAJ2M7tfuFVq5lqmlzxZGcXLETxxsCrmRHOtW6q3ozal9Rqi+MYDabeUCsNbdr8Ubqa
         xRAw==
X-Forwarded-Encrypted: i=1; AJvYcCUB/WlhurFgnPCY/pSgWwIutA6LfEuG4qSjPVYsNnAvY307WMqgf82ZJzzbISS6TrJZE3IrcgNpmDa5Gu54Yd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhL9jwhi8QBBR2iVVU8bYo9XhUghgrp3gokW/r8mtiDWlx2JPB
	aoTGv7waDgM2wwIEL2ugg4i4rUc8HzarPRpjAsq7es6Jaf/ialPBUxoONkPHBmx+2UMK5/4rzHB
	4AwWPfOdB/ahQDEhI3mCCPi3u9vrUpDs=
X-Gm-Gg: ATEYQzzuN/YclS7239pbA0G1+d4cO4ECd57PAduQLC8tQibs3fRZ5FGg9TBly22IKtP
	q8teEcr1CTT76zJwhJZ/Cm1LQCyQEBO/sbunSqeenBRay82Rd8Pu3vloqxfC+HI43CjqL/cG0EN
	lmy3BQd7RAvAHa84tLqU/MvNfYWsFn9jRewbLcuDGgJHub4ocl7N/iSEhhz860ZjSAew9UdNwwi
	mrYnybH6nfs4C9S9hpHrEkaRRhMiWERtj0qXXOhnKVm/EJNpZpuJx++5IIpTVcjHcnSYV21PYG7
	Q9g8/QJdZFBHOSoxsIj6YyYUrPcJ4eBCjzSJ4b20xuntBFFmibvqwvsGSkmwp0BMtOOFtYmGXNh
	lvbahbeo86wBPQ8H3EAN227469w==
X-Received: by 2002:a05:600c:8683:b0:485:f1d1:8f3d with SMTP id
 5b1f17b1804b1-486f442e6e5mr18435595e9.6.1773796570321; Tue, 17 Mar 2026
 18:16:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-bpf-auditd-send-message-v1-0-10a62db5c92f@cloudflare.com>
 <CAP01T77VyW=5SHDvM3HXPNHaxRdzs8H__MOh2zx1dQ6STeAUtg@mail.gmail.com>
In-Reply-To: <CAP01T77VyW=5SHDvM3HXPNHaxRdzs8H__MOh2zx1dQ6STeAUtg@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 17 Mar 2026 18:15:59 -0700
X-Gm-Features: AaiRm52ZhrulSIFyNHNiIzRvMopWhhEYRIriCdPJwA716TKmoKnUrKQyqpBcyns
Message-ID: <CAADnVQJCJaLjGCwjCX9VtT615c4kn7v5bxviUmGFVj=uTtUHMg@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 0/4] audit: Expose audit subsystem to BPF LSM
 programs via BPF kfuncs
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Frederick Lawler <fred@cloudflare.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Eric Paris <eparis@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	LKML <linux-kernel@vger.kernel.org>, 
	LSM List <linux-security-module@vger.kernel.org>, audit@vger.kernel.org, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 7:44=E2=80=AFPM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
>
> On Wed, 11 Mar 2026 at 22:31, Frederick Lawler <fred@cloudflare.com> wrot=
e:
> >
> > The motivation behind the change is to give BPF LSM developers the
> > ability to report accesses via the audit subsystem much like how LSMs
> > operate today.

Sure, but bpf lsm-s don't need to follow such conventions.
audit is nothing but a message passing from kernel to user space
and done in a very inefficient way by wrapping strings into skb/netlink.
bpf progs can do this message passing already via various ways:
perfbuf, ringbuf, streams.
Teach your user space to consume one of them.
