Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154C92222AC
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 12:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615165; cv=pass; b=QDE+gFjO994Lcx1G9P8nTnQ1CfBRBqTVCyC0hdIBOGSNP5wm2F2yrBwi+nJ/R49WqHE+tRjLrOmJ2KAfdF6a/qogXfR83zFQSQzTZbRGYbO4U51zL5Lj0WFkUEnJ1uIDR03uF1CvfiuDHO+UY/0+2lUU7XWwdD0jfUAHx8fU3Ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615165; c=relaxed/simple;
	bh=9yUDwreZVAO3aCgvkkcmjPsNpZ0NGYYbXQDmMvro/NE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cjl8L4YgrOKwmv0o1AU5c1cuHgBPu9QmQ+MAla62cm00SutJX63mtCohLnOKro+wWH0jaWN/KQylrFf+9e1WFNITqc0YCJfjCAq6Cptzj4YvF1qyz72gI6ZepYNFzb2N1DOcnnbflkfel3MA2z1VYrYFx7DEKkVCqwP8LG+M2D8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZfPPg9c; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZfPPg9c"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64ae2ce2fe1so2068801d50.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 05:39:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774615163; cv=none;
        d=google.com; s=arc-20240605;
        b=a3wsLAuNzFQlM/ZrGxZsV/Hy2O/txAQyRzN1q93X1TQF7EIx8cVQNXFOB68V9Rus+0
         EMppTTqnLOAVKUHOLNeaXkiKVBufKp/xUiU//KGLfFuV/ovAKGbmAM7/qW2e2x6Xyymp
         wc71Hv8dztbcd1SU3pFkFsYi3vaN/kCe+U9T2jcBRp8xGWLTftVii5qyQHiD6LsexHk7
         k52TnHqwGzEPD8QCfiNxKxWHfZi8EYrn9xp9YSw9CmQQhRPEsOBpbKODpuiK1lq6HFus
         lirEF/36oCWSruzS/TOdZq2ijs6TG1ASPIp+2kgV/EC1FrC6xsfjth/lqtsqk5hZBEJR
         Ydmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9yUDwreZVAO3aCgvkkcmjPsNpZ0NGYYbXQDmMvro/NE=;
        fh=xAuC3Ho8nq+SFaXC/3rmUATQ/19o+mZSfPi2s+C+1FA=;
        b=OXZenbT788KLCCzBSxlcfn4wZ98v4n/x2nacLzrlW3vcK0lTCRShUcfQna+x2VcZBg
         xbSC/xTbiWPkA1Dg048yfEDU5qU3F29ksUdbXi4SlguGvkfQDZxAbSC0ZxupYuUDYkkx
         rVVi47S3WOKEGjHoaQhPYW4KtU0qra8Q8SDwhtihLYIrd8w9N3HYdUFT1Ojz9Di8UbQy
         HNZLG4TzQvPTwOf4I/ZKuoripCENVm7r0fStu3nKcKXGtGe3Ggq8XAw9hLrZvBHWOozZ
         2gXposhvOkKxnKQYtNsqtDga1yCUUhdpx2UMGUwdboSB7nKuEP5OFYkxmWxRG21hrw7r
         PnXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774615163; x=1775219963; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yUDwreZVAO3aCgvkkcmjPsNpZ0NGYYbXQDmMvro/NE=;
        b=nZfPPg9cyym33ia3X5tDthwBqAVI1CRF+E/nPYenZQABTctGnlIDiSg7i1bzKgTOBF
         axmJNU3QlhD7/IfQ7beAiGjRCIv4p0KLt6Y6egYVRBZvTCN59pLxsUckc/5iavN7WXnO
         +1l+DoESaOYXaVtSQnF37S2iTFnnVbet23NW1EG282H5sVakuxtQ89aIL4O+96qZNyEz
         0IBYSbaXUR4IfkCaUu2D/845hwXrDaeRuaXHsnfrk86TSL65hNQEeZF/TAGm0xgUjhGX
         g6Lc4Tpnfl65om1rQIQlTqaUizpEQl3JsIp3n5kqKguSn35BSmP9H7vxPxM7ZHdNI0Zi
         Ke8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774615163; x=1775219963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9yUDwreZVAO3aCgvkkcmjPsNpZ0NGYYbXQDmMvro/NE=;
        b=fbp1b1GreDBEToMPmB2ICA/OEL6cKLs5vZUUIcOmCFLfUjftVoTcuAiFwD/1q9XI9a
         Nf2p+4+Pw5LbWYSXvKVUrwXDeio+9z5R8EACCLuyXcqnq+Ry6rQyI+TzmbCq+AjLjuXf
         G7TiIRgiYp5e6puK4kyKEkEvPX1Ed0A9c6Y63UHNBREtWKMdCpfdZduhYi/ZO6C0RDV9
         KvvydP92Kh4YALhNrwfV6XT8/fxUIha2disaslr+p07RI0ichrMCzq71N9J3pfoqbceD
         RuHaRN++yFomsBY2bqvHaIRCkd21TKP+HKHOiQ/FwXGwiHG764B9NyYWaBlbnKlsvoIV
         b3Uw==
X-Forwarded-Encrypted: i=1; AJvYcCX1xqeqg1BHy9BwrOhivrM8ZDQDP4HTvt+Iv077CEmmU+tC/jq+kc094wv64zfNqUdaOYqml22Vdv5xs3rrVrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPqFISU9QA4pTQ+iyYVjDTmcGcy85XxplZYOjgWi2BwCTfj5Mc
	Ald8CallaX3cGiPsNrG5JzY6okJJyCs8nQNYXj5WSGAJjlFnIVz+SoK3xu2D3ixSNLkKS/6r2XA
	SXifPYjyy2+XfpnfmQDwz8X7EFCwfdrc=
X-Gm-Gg: ATEYQzyyY4k3aRZVzfe/kNo4dFu/IcMcv5tHvP5nRKAYqEwXGyBvlPOqHOGZAfguKh+
	TmzxaXYvkU8k7ndh7ubXNNaa6IGQiHoMu+j1Q3JT1wZ/or9xCQ8BkjWBjb3XipJ/vLyEUScl6XY
	e1OEjGhuPdqN2S+a2AinonVejivUO5eaS3AC4QGd6nFOrxxoh+G4Wa89smLNmxDxjbzgLi1gZ5m
	GalwierQHD7LiIWQzpdQBjfk4tg/7K7Q2XVVpZBpzh8attF/GQbZr+VyWKz3S3OpBO1XC5y9rty
	Ct559vhEfyFhybt/OnsBAScL6hxyW7vV9SRP
X-Received: by 2002:a05:690c:89:b0:79a:62a2:b3a6 with SMTP id
 00721157ae682-79bde0b0487mr20276607b3.29.1774615163125; Fri, 27 Mar 2026
 05:39:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326021642.29170-1-dqfext@gmail.com> <20260326081304.xKa7-s_1@linutronix.de>
 <CALW65jYdzn_rZWa2zwYd5J+Gd=kyaGMsVFyX0fMJfKfgULMO6w@mail.gmail.com> <acZp3gRUqVIbw9yb@debian>
In-Reply-To: <acZp3gRUqVIbw9yb@debian>
From: Qingfang Deng <dqfext@gmail.com>
Date: Fri, 27 Mar 2026 20:39:11 +0800
X-Gm-Features: AQROBzDc-YGc2NLhX5E2vD7ZT3JvJ1z5OznSsvZlnQxdHln3jtYE9PJclSiuybM
Message-ID: <CALW65jZNi3oA7V7at_Jr5Vr4AdL03JYdA9WeK5G7cNr-XS2Bvg@mail.gmail.com>
Subject: Re: [PATCH net-next v4] selftests: net: add tests for PPP
To: Guillaume Nault <gnault@redhat.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Shuah Khan <shuah@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Felix Maurer <fmaurer@redhat.com>, Antonio Quartulli <antonio@openvpn.net>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 7:28=E2=80=AFPM Guillaume Nault <gnault@redhat.com>=
 wrote:
>
> On Thu, Mar 26, 2026 at 04:26:23PM +0800, Qingfang Deng wrote:
> > Hi Sebastian,
> >
> > On Thu, Mar 26, 2026 at 4:13=E2=80=AFPM Sebastian Andrzej Siewior
> > <bigeasy@linutronix.de> wrote:
> > >
> > > On 2026-03-26 10:16:24 [+0800], Qingfang Deng wrote:
> > > > Add ping and iperf3 tests for ppp_async.c and pppoe.c.
> > >
> > > Oh thank you for doing this.
> > > I haven't look in detail but this cover the "invalid loop" cases that
> > > ppp tries to catch?
> >
> > By "invalid loop", do you mean transmit recursion?
> > https://lore.kernel.org/all/20250715150806.700536-2-bigeasy@linutronix.=
de/
> >
> > AFAIK, this can only happen with PPTP or L2TP, which were not included
> > in this patch.
>
> The problem was originally reproduced using L2TP, indeed. But I guess
> that it could also be reproduced with PPPoE by using a UDP tunnel
> device like VXLAN (like sending a packet through a PPP interface,
> handled by PPPoE, running on top of a VXLAN device, that routes the UDP
> encapsulated packet back to the original PPP interface).

Yeah I've thought of that also. It can technically happen, though
there's no practical use. For self tests purpose, I may just add the
recursion test into PPTP or L2TP tests.

Regards,
Qingfang
