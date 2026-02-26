Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C942BE056
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 01:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772068230; cv=none; b=rhNXbu3ZuEq6youIXfgH3tKxEjOWB9AcbGMLy2GxKWyd9mkdXlbjVJSP02mRc6iDspeMTvyifOnIvEhmkdA1qeBpfUB+4gKiGT/peWl0l1QWoasy7xIsp4xTa7DEX57I/r9UzFjqDW2M1aJx9ROvu9xCJLkKeDLjsAyg7IPWv3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772068230; c=relaxed/simple;
	bh=bVKeetAWpDWtNFOjR1cupYE2E+MK02JGDxKWHamheRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBbxwk69SK5KwT9Il5KIvIGSRmVYqb6E+c6eS7Lu3R9jVi6JOsz2PZRuQtSPaqeXUSIV332pi57WUZA48ztH+NivJuOwjmD7BTcU0LDJ4aW126MAJVcjgS7wDlNso4dKbwgqHj4CbLs143wrOHOb0eQ9z8Oj81sVkZHr+vyV5fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OoRU3j2j; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OoRU3j2j"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48378136adcso1859435e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 17:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772068227; x=1772673027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0mydpigOQEThp2HKi5IwwcPNGNIjpCFrRJAibYsBFDc=;
        b=OoRU3j2joHuRNxjXiBw9TlLN6FNUwyb4IsMIEixDj8kIjimU3r3Feisx3Kv2RTRK6q
         oxIy4H6cX6ke4fgxcTtUnhu52aDniXmMGPFobYfhoIhE55b1tSsCue/yNThCX7QP4lAH
         TI9ya+iSVvJydbYSFS+IDr3/wl7oHestaCKu9lfHQDyuHo9aAIzuLkf1G2DH7PwumvNm
         SvlFSCWQChDF3obDYf+DBbqyN/gkbCbrHsh1bZi4AJb9elMhnduqqs6h8aOzF9+QyB8K
         u2eJ+9igjwCSEFLQvyKCbbR1mojxJNUCMtpBGdzuK378TtxpLR7RyKBBFa2n+xqmQKFv
         7DpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772068227; x=1772673027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mydpigOQEThp2HKi5IwwcPNGNIjpCFrRJAibYsBFDc=;
        b=uoW5dzWTe9geUOe9pRK5iCkaWDkptMwhsh/rxi+4fSe89cOut79l/LWFJmDFjdpPDn
         9oTaDzX40thouL0s4c/LG6pyNbPzi9pts7PkypYua/IxMsb87BkugCFtPJhrBEwNRrgz
         r0W4v0UQQDuyaaelKXnIANlb9G8XT09L7qefIb+b8pCEyRRxx/kU6KmvbbTAuEma7cPg
         i8wdFiFltzwsVYEhIoqyELZhbNhbV768NFo68YnYxsIlRzRpJPVRKewzrp0dE9Qr9NT+
         urgHxAvm7YCa/WSo6JUscWa4x1ujIcDF/Ckj9PbsOO9xom3hdlixRFILncvP/IoDt+Qc
         cARQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyfQ0vACgy350o4Jx/2ru3TuaGAeoeVyifXGV8w+rZeKUjBGZYoHqMuJiK06dKFXpdb0eW4JEUtCsytF2eiqM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0v3dQkhRUROxmyuQEOYvf+PxCsJ8udouMWlDJS5hvUYfngkvc
	s9UBZY3Gs/cgYx7jSK8wQVfu4QDBCXtqytZMdX0/s17PPnN0BzeePerZ
X-Gm-Gg: ATEYQzyVPX2+BqDuXg25QPw/ht73nqweDwZLSTFx00BoH34yB4IVnhmYqcyRwI01r6N
	Xi4jl25YshjQktuYTzSAvRZ3dCvwvg/eJMuVdsf7mDI0ndBIScGYk6Quh5La3K6FhSjj4ndfhoH
	QkgtKgqT+izsbgklXWM3THEx6zVeMBJX7JFec461ZYIQCSh7H6+G+rHuD1KERiAz1oEMMjOsb8D
	JMHad94vN1+gmDmcvZlvFyBCuBcSJJ8Nt4JaVnU3w2VNaw3sn1ii9TC9QwnGD1QO4rFFUjchaOO
	7Qlodm+xn25I10O0xWu+7nAqmlONcw+DkdpnTiLkrMUC/2EdybMaxwcAHlEcm1yrQHJRT8IqBru
	PQC6lWbf9oUfh7LkQlDOik+plM23/Gcv3il70X3BIdfXP1lDmG2Pxudwl9VRKD2lsbIFk8nvPyt
	YXTbceOKCAPpWtr1D6VfDS6bVFnWgEt2ul4spYYM0oH4SL3J0/ESs6aXYy3BWeHw==
X-Received: by 2002:a05:600c:621b:b0:477:63a4:88fe with SMTP id 5b1f17b1804b1-483c216bdbfmr40257915e9.2.1772068227170;
        Wed, 25 Feb 2026 17:10:27 -0800 (PST)
Received: from gandalf.schnuecks.de (p5b2e2ef5.dip0.t-ipconnect.de. [91.46.46.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfbb465bsm57533635e9.3.2026.02.25.17.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 17:10:26 -0800 (PST)
Received: by gandalf.schnuecks.de (Postfix, from userid 500)
	id E52372FE1F55; Thu, 26 Feb 2026 02:10:25 +0100 (CET)
Date: Thu, 26 Feb 2026 02:10:25 +0100
From: Simon Baatz <gmbnomis@gmail.com>
To: Stefano Brivio <sbrivio@redhat.com>
Cc: Simon Baatz via B4 Relay <devnull+gmbnomis.gmail.com@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Ahern <dsahern@kernel.org>, Jon Maloy <jmaloy@redhat.com>,
	Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com,
	Shuah Khan <shuah@kernel.org>,
	Christian Ebner <c.ebner@proxmox.com>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC net-next 1/4] tcp: implement RFC 7323 window
 retraction receiver requirements
Message-ID: <aZ-dgdUFe0a7F6YE@gandalf.schnuecks.de>
References: <20260220-tcp_rfc7323_retract_wnd_rfc-v1-0-904942561479@gmail.com>
 <20260220-tcp_rfc7323_retract_wnd_rfc-v1-1-904942561479@gmail.com>
 <20260223232636.1ead2b3e@elisabeth>
 <aZ3o8RQehJDK_rcl@gandalf.schnuecks.de>
 <20260225223325.34468327@elisabeth>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225223325.34468327@elisabeth>

On Wed, Feb 25, 2026 at 10:33:34PM +0100, Stefano Brivio wrote:
> On Tue, 24 Feb 2026 19:07:45 +0100
> Simon Baatz <gmbnomis@gmail.com> wrote:
> 
> > Hi Stefano,
> > 
> > On Mon, Feb 23, 2026 at 11:26:40PM +0100, Stefano Brivio wrote:
> > > Hi Simon,
> > > 
> > > It all makes sense to me at a quick look, I have just some nits and one
> > > more substantial worry, below:
> > > 
> > > On Fri, 20 Feb 2026 00:55:14 +0100
> > > Simon Baatz via B4 Relay <devnull+gmbnomis.gmail.com@kernel.org> wrote:
> > >   
> > > > From: Simon Baatz <gmbnomis@gmail.com>
> > > > 
> > > > By default, the Linux TCP implementation does not shrink the
> > > > advertised window (RFC 7323 calls this "window retraction") with the
> > > > following exceptions:
> > > > 
> > > > - When an incoming segment cannot be added due to the receive buffer
> > > >   running out of memory. Since commit 8c670bdfa58e ("tcp: correct
> > > >   handling of extreme memory squeeze") a zero window will be
> > > >   advertised in this case. It turns out that reaching the required
> > > >   "memory pressure" is very easy when window scaling is in use. In the
> > > >   simplest case, sending a sufficient number of segments smaller than
> > > >   the scale factor to a receiver that does not read data is enough.
> > > > 
> > > >   Since commit 1d2fbaad7cd8 ("tcp: stronger sk_rcvbuf checks") this
> > > >   happens much earlier than before, leading to regressions (the test
> > > >   suite of the Valkey project does not pass because of a TCP
> > > >   connection that is no longer bi-directional).  
> > > 
> > > Ouch. By the way, that same commit helped us unveil an issue (at least
> > > in the sense of RFC 9293, 3.8.6) we fixed in passt:
> > > 
> > >   https://passt.top/passt/commit/?id=8d2f8c4d0fb58d6b2011e614bc7d7ff9dab406b3  
> > 
> > This looks concerning: It seems as if just filling the advertised
> > window triggered the out of memory condition(?).
> 
> Right, even if it's not so much a general "out of memory" condition:
> it's just that the socket might simply refuse to queue more data at
> that point (we run out of window space, rather than memory).
> 
> Together with commit e2142825c120 ("net: tcp: send zero-window ACK when
> no memory"), we will even get zero-window updates in that case. Jon
> raised the issue here:
> 
>   https://lore.kernel.org/r/20240406182107.261472-3-jmaloy@redhat.com/
> 
> but it was not really fixed. Anyway:

Didn't that result in 8c670bdfa58e ("tcp: correct handling of extreme
memory squeeze")?

> [...] 

-- 
Simon Baatz <gmbnomis@gmail.com>
