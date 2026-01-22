Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A163638F940
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 03:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769052340; cv=pass; b=o/ebyKGWGc3FnE5Zu2IkQRaUlebhcIw1Rjg0uFz+wpNMXSq1sIuIK1arA58GZVr/vGa8shfv/LIPtvhPScFfYSasbYr61TbXKU+wqCtskFGLU9gnOyvJIcLRGybhhoJhjJaGAybCjzDc1iOjg9AEDe5VKj4UzRMdYlkJZwF7m4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769052340; c=relaxed/simple;
	bh=RxcFmI2IAGkmYdnYkNa89B1ljCXr8uo8gHzSY3WvK9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kK9655BHLXZzx9fbTKAzqNPmdmyTDsnTG3F5zyjbozuHUIcMQKn1QdoOtJzeOjyKEA7a5CdEEnhfB4BSMD3TXPLlvwa1EnFtOP6e6L23o2LtqHUTU9YE+BLcsksb0FHgFnEQeI8Qietq+zhHpdlOInIhFWpIGRPevnhv78/TuDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kB0wlMIw; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kB0wlMIw"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d148ddb583so328127a34.0
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 19:25:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769052337; cv=none;
        d=google.com; s=arc-20240605;
        b=T/mzVo1+TmKRWQvRddy1+QN7hdWV5YmpLcfmThB7xSFC19LlWb572gTmQOszN5EN+h
         nNiUTyfAoryYFHVWMpWoe8EnHC3jAHc8E1kKhSE0ZB86fnM+K4cHCIaFgl1Bgf+8Tn4a
         Rrwr2jlyWd3DOsQlut5buBko1mbHnmbHiFFZNuzooFheH2sI/jynzBqjV+8i0cjdYQKY
         nVGzt/7wcd5KDDn71nUUFfajeaAiwotyXEmS4saXZFI1vMyz6j4a0UqUvE/opqIKWL2h
         phxda/pBzviQyt8KWcQ8rp5ERQI8hE19ogI52iRiNUIxj2QqrzUidUVAUe937t46L4nQ
         D37g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RxcFmI2IAGkmYdnYkNa89B1ljCXr8uo8gHzSY3WvK9U=;
        fh=pZpB8AwetBa//3wfeUetHVRsGAblTJbVMMT20r4uwv0=;
        b=J4/0BgXOXvFmynWZb2fNoGeIrfIYOyJ/CTVMsJtBMcYCUd26JXV8SDi4k5d0LIAEg+
         LsQkUcUqOhuH4oE7Undm5TxDQ624Q4TbvB9hpvkyNX5z23ZxTYSFIlmrP1n23+WIDKxl
         Vv4jIDSKk6lcHZ/xkClvMsUXwukwkjy5ciAgpaM+0jN2dmJiWCYp8uPS9Lo1p/rWxN//
         yPXDiCeeXge6WGKPCJZg2rolp43OlQY0B8lYCuUYs64ybi1I3N93yaRxKcLG3F7G7dgr
         6OChEFkOd58yJSl2HWkx65Car9Isf8INMj3gluJ6zReLbWnLg8oztzBalupQLbJxy5oF
         xKqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769052337; x=1769657137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxcFmI2IAGkmYdnYkNa89B1ljCXr8uo8gHzSY3WvK9U=;
        b=kB0wlMIwZft5yoNg9jtjL1qV9T3g5+odcXh8BHV6L57EOunzWzT0R7s6jr6GTMJali
         0JTXluj+Iae80GCFb+QThteShLYywGJpUOH2zlOLMhZtEWD3cP2KjKzU6Jl4+C87aMFK
         C+Ce3Nlua1Xpi83kjLQUwa32pwDB61/RdyKAswceMlhLqf6j9t2exJiHZITLUApzcgmM
         nLW6Li6KFEnONjAIMNF4MGGiwOyuiJpZFj8hrhfOfmz4iPtWmjzMDrmSeU3neiUIFi5V
         mlW220zxyihQifueyN8p752m/egF3QLsDG58+PuAIbvNBjAKZAqK0CQSI5OMNJjH4yt9
         Fcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769052337; x=1769657137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RxcFmI2IAGkmYdnYkNa89B1ljCXr8uo8gHzSY3WvK9U=;
        b=h9IGDliKmQgK8Q7PYnB3efIb/Vu8z3YUJDzeP5PD3EVZ2rM80kEGMPZX+nOwDetn3b
         AEMGGFYRA28a4SswNLRecK2kpja9Qq4tVxcG+hqtScYZCyWoZ2izhE6nFiKBNG/o5A2/
         FGiRVjFaFDW72TilyFpm8I7ERF7mvPQnyk2okyhnkRZPNQ2Vjum00xtoOMGhwyGVygWa
         f8XwJA4IF8mzB/z2v50RUMNyy6lg1Ia+DXGoBH6LI9dTSEV1tNJY1QPI9+13T1SU4LGM
         S9neclqoGOsDyLYsYneHEjZx4YckCV1lwTJSF5tiPvYtSxyLSHlLuVDcTrp072gRF2nS
         ZIEA==
X-Forwarded-Encrypted: i=1; AJvYcCUnsUtde5lZid9qQ68NMHTgser0wVvH3H29+Jt4xnx+4vaT9JWMDszqC84nL7WNv4BFQacUpjEZ2MFVWrrKYY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdJZJhLbpIPusNSGQ4HLh76IzseH3mnvOf6Tein7Aca8aBql0n
	s7np6hUf1ul2eZwATev1hkaeH67gsB6IKoIZC6+3ZU1SxlKIrPBcnn2FZhw12C09/DgjfDdMFB8
	qVdAToDwJc+MGx0z/ciqMJ0kMK4juDXY=
X-Gm-Gg: AZuq6aISWv8awsCWTq3O2vJGRIsP0Ev8TFovvqBdhnQpcHHjeNV5eZHDHZGtkla9M+S
	I4KljRInZ0bghtalnN7w2QWBHyrJ1KpbVmn9pL3Ce1a4/3Jp8dU2z5dF1jXWOSB8MlxO7Y8E4Ms
	AN0zaMd5U5BM91wq2wSDNz9RjTzcSi7zicvJIjCRd9xkL+mXOkX3o69AYi9dWgFS3DKRhGAoSSL
	kIrtAN/1wDeozC1w/OxaVU9u8Zixwhl13HI6Y45CfzTkhbWxUkBpbQhpXAIxuqdfHAo/byOWL6l
	rgnvdw==
X-Received: by 2002:a05:6830:3982:b0:7cf:db69:5475 with SMTP id
 46e09a7af769-7d140ab6895mr4490648a34.24.1769052337402; Wed, 21 Jan 2026
 19:25:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-0-686d0af71978@meta.com>
 <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-4-686d0af71978@meta.com>
 <20260120163650.5a962648@kernel.org> <aXBnqYQdomzH9bT/@devvm11784.nha0.facebook.com>
 <20260121173512.748e2155@kernel.org> <aXGNhEKOhkTHbJvw@devvm11784.nha0.facebook.com>
 <20260121185021.446b00e8@kernel.org>
In-Reply-To: <20260121185021.446b00e8@kernel.org>
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 21 Jan 2026 19:25:27 -0800
X-Gm-Features: AZwV_QjAIr5HWq1OvyaswWVCAIdwEzJFXqJ7idBVevJ43OdVoqWduskcsKDBYHI
Message-ID: <CAKB00G2xNvfiV6J3RzKDs=GHMGZ7L16+VKUYLGjpZdOrLnSYKA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 4/5] net: devmem: document
 NETDEV_A_DMABUF_AUTORELEASE netlink attribute
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, 
	Neal Cardwell <ncardwell@google.com>, David Ahern <dsahern@kernel.org>, 
	Mina Almasry <almasrymina@google.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	asml.silence@gmail.com, matttbe@kernel.org, skhawaja@google.com, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 6:50=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 21 Jan 2026 18:37:56 -0800 Bobby Eshleman wrote:
> > > > Show an example of the three steps: returning the tokens, unbinding=
, and closing the
> > > > sockets (TCP/NL)?
> > >
> > > TBH I read the doc before reading the code, which I guess may actuall=
y
> > > be better since we don't expect users to read the code first either..
> > >
> > > Now after reading the code I'm not sure the doc explains things
> > > properly. AFAIU there's no association of token <> socket within the
> > > same binding. User can close socket A and return the tokens via socke=
t
> > > B. As written the doc made me think that there will be a leak if sock=
et
> > > is closed without releasing tokens, or that there may be a race with
> > > data queued but not read. Neither is true, really?
> >
> > That is correct, neither is true. If the two sockets share a binding th=
e
> > kernel doesn't care which socket received the token or which one
> > returned it. No token <> socket association. There is no
> > queued-but-not-read race either. If any tokens are not returned, as lon=
g
> > as all of the binding references are eventually released and all socket=
s
> > that used the binding are closed, then all references will be accounted
> > for and everything cleaned up.
>
> Naming is hard, but I wonder whether the whole feature wouldn't be
> better referred to as something to do with global token accounting
> / management? AUTORELEASE makes sense but seems like focusing on one
> particular side effect.

Good point. The only real use case for autorelease=3Don is for backwards
compatibility... so I thought maybe DEVMEM_A_DMABUF_COMPAT_TOKEN
or DEVMEM_A_DMABUF_COMPAT_DONTNEED would be clearer?
