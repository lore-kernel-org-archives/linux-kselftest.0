Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A4737D134
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 11:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707357; cv=none; b=jmnN84/mcd2QdufJ5Y6knm+HElBEAfjAwvVjQB/8FXXpbK+kBqyAtpUu2OY5xlHFbbwz5ufDcn8/yIciC4jgH3jXWE//Zra6nYlS/qFIj1xQ26FP0qBiCfok2JGd5DVJ3enD+JWdjK7+PQneC5R5cDIFKYacaKsf45xjEUwiLLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707357; c=relaxed/simple;
	bh=g4o1dpIg6Wql0HWF21Ncd1Zu05FLlgYRwwP4h4IKfdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZd87z1i8E40RnyDGmKZ5jHsIZV0ZCKijqkKFmx/mpLGpcqHxAMtul3hjG2Kw4/G2jBEozgsZGh/uq4fbL/sbe7apAyubuQnnj77MbatLDNL2DirTk2+fVJUb7LAvcJnRfInRIT0C2qkxHSRxzFvfiCUvf3oK01a1O/+kx3mTss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PAj5P0AN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PAj5P0AN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390A31F00A3F
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 11:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779707351;
	bh=Ti8F6+ipYsvuGrD4TuxYp5AKRgNH5B7oF+X/muBpZZ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PAj5P0ANFYqOyNCn/pCy94Jz70WdiPUDbOsUbaW4Tu3qfJRwT+v/ui0DsQaeU5/nZ
	 nVVVXLEh/b/nttcnz6IsPeR7PdLXP4pkbWEV5EKykUxlZFQAYUipgr0FzbAq9IYKs0
	 19rLyQZ+OJrzwH9bICfx0PM5hD1PvxI6j20+WPwEwy7+ZeG4PFR2u8ovmyWTOIIeVj
	 CXeTKcG8etsXXWeNA+YdZiYjHwMcOWzl0Cnw3QrevxLDmLAeGRmKepqkboJvoMz5em
	 K2Mg2/Qmk+LSC4qIlwLokdcJbIrGN3/VFo2XI+Cvjj/ldZNHfr/jir55z7xVRnWldJ
	 5aYdqrVfl3jig==
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-961780b0ba1so1038539241.1
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 04:09:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/UzG6V/2a8x8zVdlAbUhy+G8RMZRuVzbeHV14bOosZBFzvKnazwLY63LyaKJOM5Xf2u+HzgE7rYgHcpURdOhY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf5ICvtD3DO35Nutot975gL+JCRu+NeWYSS1PG3TbK0xL5J1It
	vRKQ6qoF9T2OS79Ln67idBWXlk0anh5Gn1lYPYCCx7S7fxFJ4R0pApOgwq8h2s81CuFUujraEcS
	DTDLcdEEJtewfUgfLPn/4JPkESmN6hpg=
X-Received: by 2002:a05:6102:5ccb:b0:634:5339:33bf with SMTP id
 ada2fe7eead31-67c7d977844mr6305680137.18.1779707350376; Mon, 25 May 2026
 04:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522113225.241337-1-bjorn@kernel.org> <20260522070515.044d7d97@kernel.org>
In-Reply-To: <20260522070515.044d7d97@kernel.org>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Mon, 25 May 2026 13:08:59 +0200
X-Gmail-Original-Message-ID: <CAJ+HfNjE8e1Lj1yDEPYXk_KPspjN166rDbHon+zwiJb1rPqSrA@mail.gmail.com>
X-Gm-Features: AVHnY4JLYHa3GAzQN4bj9M_WDpfipku0Hpu51IZUTpE6XJB_0rmfNrcwqqfjO5Q
Message-ID: <CAJ+HfNjE8e1Lj1yDEPYXk_KPspjN166rDbHon+zwiJb1rPqSrA@mail.gmail.com>
Subject: Re: [PATCH net-next 0/3] fbnic: Support larger io_uring zcrx buffers
To: Jakub Kicinski <kuba@kernel.org>
Cc: Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, Jacob Keller <jacob.e.keller@intel.com>, 
	Mohsin Bashir <mohsin.bashr@gmail.com>, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey!

On Fri, 22 May 2026 at 16:05, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Fri, 22 May 2026 13:32:19 +0200 Bj=C3=B6rn T=C3=B6pel wrote:
> >  drivers/net/ethernet/meta/fbnic/fbnic_csr.h   |  29 +--
> >  .../net/ethernet/meta/fbnic/fbnic_debugfs.c   |   5 +-
> >  drivers/net/ethernet/meta/fbnic/fbnic_txrx.c  | 168 ++++++++++++++----
> >  drivers/net/ethernet/meta/fbnic/fbnic_txrx.h  |   6 +
> >  .../selftests/drivers/net/hw/iou-zcrx.c       |  28 ++-
> >  5 files changed, 176 insertions(+), 60 deletions(-)
>
> Hm. What's merging the frags? the hw will serve them back to us in 4kB
> chunks. Frankly the iou zc hurts me less that the fact that we run
> out of nr_frags in GRO :(

Thanks for taking a look, Jakub!

The driver relies on the generic XDP frag coalescing
(xdp_buff_add_frag()). So, adjacent 4K completions are extended into
the same frag. IOW, GRO should see coalesced skb frab, rather than one
graf per HW BDQ frag

I'll address all the other comments in the next rev!


Bj=C3=B6rn
