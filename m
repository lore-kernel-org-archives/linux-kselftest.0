Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1B038E5E1
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 10:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772102611; cv=none; b=Psn3+lIMZMJaZ5my5JAF6s6XVJIsZIA+ujr/qFhMjf/zxXP0ABl0vwIWdAiH1dAST/JuF1jildCEI1plsHnRp8DHrYSRTrmpx4BbkQFK1nor/6NOjDwCDviMcNGqmOcIixom04J+eRVX1fWfgiSwbLtzKHQGOaU1Rzlh1KY5Sow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772102611; c=relaxed/simple;
	bh=RujNMISISbGmip+gsV3i8B5HSZDusgL8kyOq5K5N+GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAdxvC6SzW8rYfP+H8WuaqWbJweWt7gxqpZdU9Sp9p/C8Ipr4+BFFVvF4FNzl7wfK6CKy7xhjvsHd2qozjyiaMLDuDkQ9+z63bFj5FK3R9xavdcUsHeXBe6T4ykoxPDmBsov9NVhYPqa+LUM4CMbo5ZM6Vhe6iCWFyHCUv8NM78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBoQo9jy; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBoQo9jy"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-436356740e6so722832f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 02:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772102609; x=1772707409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vYnij3WUKIrhr1paKuZQio94gFo5v03yqnu75blnTg4=;
        b=CBoQo9jyM2yTd9XTP3GjFZB0m9pMVVnC2KlMwc2WiZ7WiOUQpGdw7D+lYXneZRk5f0
         wxkMaw4uvOPqZqMYYYOCI1O6ho0Lzzki+UltNWUG86IdXkudyPunvO3pqAQloLHfaovc
         q5HpYO2LLE5fFSqLQqZZNlHAyFhzpF+JaDP87ntt/cmGLiYoPFhzYAPlE3ppb8T2qt9o
         DTDNBtRRk0cRb/d5DGG5ySIr+L5vYHVdZsGJvtlZepby9vw7hPrIi4u/nYQi6o9EvG+F
         4NA36HIucCRbzCPXhgOfULLFLOd/UykxGn9CkyF6MGX64m/7jU/S2vV2d9e4M7JZYMwZ
         UMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772102609; x=1772707409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYnij3WUKIrhr1paKuZQio94gFo5v03yqnu75blnTg4=;
        b=PprCZSDSLJji76RLDxj8AVF4GUdYs7wiH6smKevckvsYpl+YvRVw8JfkGWI8BILbxh
         tMA+wwtbbnM1r12Y36+fQCYDVDVtMmwFXDE69Wgb5IcmCczmnNn5gRrQ0+PyGDeaavhL
         y/f/06C7pDsmsekVO62OpvFaikhW+1eHUoVZLdUhSI1UMWm4or2TvI5qynblStk2M1Z1
         bbWZ32O1N8Z4CaAcgs85T0BTGpTfkYpvJQ+hORWiicI0dLPZqJ2UM5jUQ+81HbJmcSes
         ALbWuW3xBGS/I/USVAOXq54PMfKghboxYdmqfBmWrO5l7URwuAdgy9EXub4Jw3Wesr+1
         ZD+w==
X-Forwarded-Encrypted: i=1; AJvYcCVSFj+8ofo+AEXhAVuUV8OqGU+mBERUa1Eoe308XflHnU7j+X9ZRLrNv+mZZeMilz3XzmcSLMxTh3vxos3QPyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHoPjv8UA9ncm0Bf7Vqov24w/0AsPW3wM6DE9EpyYTlLVDXQBm
	yo9FmSXsSoj8N2izyL6Php1+UYmXZVALnucQlqSwcQTWJpUFBX/gb+B1
X-Gm-Gg: ATEYQzyb/JoXjGUWdWJNm/avoLbDfkz+jJ+IZC9SMLtQWA1dM1lkj/sNMItkKTuae/J
	xBUmxNaF7/PJ4OnC0L7OTywzXnmUzCkaNdAd86DY9rQyet5A3DZXDCIClyIM9tipmQYqFa159pS
	Qz4/05nxrLt3ChpINK1diDR6VBcKgTVamkmJlkifMHuqODHq02lZOr16RYUp1kBcmms8pQTZqio
	VuTLbWpcDfi3WVu3eRhons7e2RhYHupzL1VyC9aVMOrka0GDQBYXX2tTnNZQFqP3S41u0i23IUj
	UJynBtcHel5zzfMV4rc47cI2tUMLHym/RSBUVJ6iG2YkXERoEbhQkkHwf4S6gLhukuEN3lmD1I+
	swAIIGJTkGZZFjmb1Xz2GX8FZThBqToUBV2a0fshWPAalEbdPZvMGFfD8YyxcitZD9ccwRJqUXt
	ys76sMZi2/2YxjL3rm2uJZgui2hE2FjQG4C3ZwuCCBk7xHWyCEa43qfNtYcBfkGYuXrZUr7w1fR
	BT9gkGNqs9i2UEucybM4qs=
X-Received: by 2002:a05:6000:25c3:b0:439:704a:9838 with SMTP id ffacd0b85a97d-439942a422fmr6869715f8f.19.1772102608659;
        Thu, 26 Feb 2026 02:43:28 -0800 (PST)
Received: from gandalf.schnuecks.de (p200300c14f1996009e6b00fffe39b8a7.dip0.t-ipconnect.de. [2003:c1:4f19:9600:9e6b:ff:fe39:b8a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm42355609f8f.4.2026.02.26.02.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:43:27 -0800 (PST)
Received: by gandalf.schnuecks.de (Postfix, from userid 500)
	id 840D52FE34AD; Thu, 26 Feb 2026 11:43:27 +0100 (CET)
Date: Thu, 26 Feb 2026 11:43:27 +0100
From: Simon Baatz <gmbnomis@gmail.com>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Ahern <dsahern@kernel.org>,
	Stefano Brivio <sbrivio@redhat.com>, Jon Maloy <jmaloy@redhat.com>,
	Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com,
	Shuah Khan <shuah@kernel.org>,
	Christian Ebner <c.ebner@proxmox.com>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC net-next v2 0/5] tcp: RFC 7323-compliant window
 retraction handling
Message-ID: <aaAjz647AueLYvjl@gandalf.schnuecks.de>
References: <20260226-tcp_rfc7323_retract_wnd_rfc-v2-0-aa3f8f9cc639@gmail.com>
 <dffe019f-93be-4fa8-aa29-743450f6c05f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dffe019f-93be-4fa8-aa29-743450f6c05f@kernel.org>

Hi Matt,

On Thu, Feb 26, 2026 at 09:12:07AM +0100, Matthieu Baerts wrote:
> Hi Simon,
> 
> On 26/02/2026 01:49, Simon Baatz via B4 Relay wrote:
> > this series implements the receiver-side requirements for TCP window
> > retraction as specified in RFC 7323 and adds packetdrill tests to
> > cover the new behavior.
> 
> Thank you for looking at that.

Thank you for chiming in; I know that my comments are somewhat
provocative. :)

> > It addresses a regression with somewhat complex causes; see my message
> > "Re: [regression] [PATCH net-next 7/8] tcp: stronger sk_rcvbuf checks"
> > (https://lkml.kernel.org/netdev/aXaHEk_eRJyhYfyM@gandalf.schnuecks.de/).
> > 
> > Please see the first patch for background and implementation details.
> > 
> > This is an RFC because a few open questions remain:
> 
> (...)
> 
> > - MPTCP seems to modify tp->rcv_wnd of subflows. And the modifications
> >   look odd:
> > 
> >   1. It is updated in the RX path. Since we never advertised that
> >      value, we shouldn't need to update rcv_mwnd_seq.
> 
> FYI, with MPTCP the received windows are shared between subflows. This
> might be surprising, but maintaining per-subflow receive windows could
> end up stalling some subflows while others would not use up their
> window. For more details, please check this section of the RFC:
> 
>   https://datatracker.ietf.org/doc/html/rfc8684#sec_rwin

RFC 8646 has several pointers to RFC 5961 and in section 3.3.5 it
says:

                                                 ... Each of these
   segments will be mapped onto subflows, as long as subflow sequence
   numbers are in the allowed windows for those subflows.  Note that

So, I assume that on sub-flow level we are still supposed to do
the standard TCP sequence acceptability checks with respect to
the advertised window for the subflow.

If so, my concern is that raising rcv_wnd in the RX path means that
we may accept sequence numbers that we never advertised in that
particular subflow.

> 
> >   2. In the TX path, there is:
> >   
> >      tp->rcv_wnd = min_t(u64, win, U32_MAX);
> > 
> >      To me, that looks very wrong and that code might need to be fixed
> >      first.
> The capping is explained because the MPTCP-level ack seq is on 64-bit,
> while the TCP level receive window is on 32-bit.

The issues I see here are:

1. When calculating the usable receive window in TCP, we use 32-bit
   signed arithmetic.
2. The max. window size with window scaling is around 1GB
3. As said, rcv_wnd is used for acceptability checks.  In standard
   TCP we ensure that rcv_wnd is aligned to the window scaling
   factor.

So, I had assumed to see the "reverse" of the current TX raise window
logic in MPTCP: First, calculate the advertised window to put into
the outgoing packet and then update rcv_wnd accordingly.
 
> I hope this helps better understanding these modifications, and
> hopefully not introducing regressions on the MPTCP side :)

Yes, thank you. Regarding regressions, I couldn't agree more.


- Simon
 
-- 
Simon Baatz <gmbnomis@gmail.com>
