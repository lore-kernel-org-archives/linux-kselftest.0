Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53CA318BB8
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 23:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779148672; cv=pass; b=mV/yeFmuEGzq8NteH3j+lzd2a0yeWxGrci6N5IAQ11azlCdnfr9dpXpLuTKaAESA3xy1y2gCv5ZJnzM7rpEc9qZE/3+cBTBDKrefpKQJ5DgHCGoS4hLalUBUiQvnPojqS9wBszL2ROIriH26HlmXeXOWHGDy9uc9RfbndpMSbYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779148672; c=relaxed/simple;
	bh=unqEGZFYSyCBmS401bO5UPSCWFKfUOAKb+T3Y4jxQe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYjowG9lh5YVDLUyzjmkgf3Up6jpSSJmu782cv1N0MjzyPc7wVGPxWztphvAnkfLMNOSRffGCCO39cSfpUFIHlfA29KXCDkCH7pGlkWMeyark6lK2U9LB77ZXyei/HoButRgtbNKafWRmN+HqIuU1W0+UC6yr76q8joYmq73NxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=YW1xiazA; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="YW1xiazA"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36643b96b99so2720408a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 16:57:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779148670; cv=none;
        d=google.com; s=arc-20240605;
        b=GCX8cml0v+SrbYrzz2VmBhT3hwVj0PPisiFd59QfnPH/C2AR8wiKQxhHJ2HEL+qRu+
         TtsQIKUeoqFHoBodi27f3wpWJsCbHJhtXBUpFfuVyxYO5QWPt6715k3pe9Mmhg7fiBGQ
         zcJP3oeJa/99lyNUh7enzFh6KnnMkD3HQxshFIKRu8fpf6q+JyeeExtKgJAXh9P+rdoR
         p8HN9al7WvwEeKBgzyibgfBMjDwF70ak90bIgs0hjTOS2HmX9V20gDh618+kDWvik1rb
         So+L84CJg7ClbEXZeyoDSzAEVgU/m55bpdde3/MMTCSEkZRioL2fB46CkbQ9j4jLV45p
         sYeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yQIzRVdOE5dF5raU9qEOWy4pjYF2amwoUhs+1RS7QM4=;
        fh=3rQdpQcsiGlJ1LsxvzGprerysRS4Ru5XUIItARxqG6I=;
        b=hYiHVAdD+FcMcqOt+BuJ0GXVG8QBibSVgK8e36FhoVg9TT8x1D2imNoxi6FcJXjve6
         gZXN51lB0tDEgKCBH2lOD+SZnLYJY4gV3Mf/D9olCBrHWDYIiqs6bX/JMVgfgOWfp/ID
         +XvWOAufl0pZuvCn+x9hWoFdB+oog2S/l/0X4sDslZciZeBd3wxaQiDVaaawglcBN/vF
         H2WGo53pPOutMukgOt3QoJnXeKRx2AN7j7jRSxa0HQWTUAYpKF+++WSP32FmUf+qhipo
         wI+deK0r3rGx3M8xj38kv72MAiBYUIoU02lN2oLVd3VHEYBxuZqCnxKDLwg2bf2d0zVC
         BQ+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1779148670; x=1779753470; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQIzRVdOE5dF5raU9qEOWy4pjYF2amwoUhs+1RS7QM4=;
        b=YW1xiazAIuoO9uzWuY8PqoK6SOdp7+AQBjShSj8YTFGoQR3wR6bW5nFHEGj7Lav0df
         371Iaezpn7zqcLSmiRbT/LfnDxDSWJIP1r9ISLxB/GdZAN8zjmyHF1MYQKW6A/gBrv9I
         4L8gjS8H+H40H8waQIhbxIsIllLqY/uEqsrvQGIsAD3FV3EbMMkON2FFZr+X1MIAuope
         +XppFw06GE7AMWQJaiF/SC66WOVHKImIN0C37Bk+9rjk70Wb1VjogJNnTSVIS2TCJA86
         HdqITE68CdCVz2ZfHjuYhUvr8NTvbUxNtJgRhUacgXWXp/QAkMNxVBuxXNvmZPP0B5v6
         lNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779148670; x=1779753470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yQIzRVdOE5dF5raU9qEOWy4pjYF2amwoUhs+1RS7QM4=;
        b=WdFrAN2Vs2u6mhJdKLLlaXi4W/0stypjzOUmRxSHB08zWaPpIRhneu6l6bNr8jaBzz
         LtdLYuHMvtk2yEHeSxbiunhfy2B0e/OIW4azL9piNuTltL0VtfAeBWs/GBb3+hdJIrt9
         J61UcwZ7xkxWWYAMSTG2LT66KCfAw619VGW9gN/p4fAbF8D3JxBnfULZJHi50VJZC87Y
         dEDiHUhN9wq0W3hW+uPRhT2nw8IYRoZ4Gu4NRF4If1VEVartYNZtFCFEhywJ1p6gWlMQ
         ifQAovRVUgJOpRoQs4qee86T96vsGXD2dEC5wEeFdIw2cdmkH41OpEUmxhG7uI/pEFe7
         kuWA==
X-Forwarded-Encrypted: i=1; AFNElJ9+HHu+i1/Tt79t5R8zwKiYmyel3oIVvTp9p1Bvcoqw6a7wKLYmoLTSV9YSw3dP2blzLxyY0QZloRuvF0MHu1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGMJOYSTqI0TlbZZc1Q9S7Q8agzbD8LGYTHbm+Cs97Kenpbawj
	CjEZggBoC2Sgp28S4sPogOKLGtRgQtwASWJtE7iztHPr7elv6ABtVILadfmrr7P/nbcggJT6y94
	VcXCeohoij5+lfYaqCSaQKzvq/SyOm6WlmiDxxCo/Bj5zER/Za83CvQ==
X-Gm-Gg: Acq92OE0VhfIm0UrG4QZoQsQtyQVOiaUxgyRJgNOS9yBMvUROJskewakezO82OyNRIL
	Lwh51oI5HoKni9YpUf4NDV7wlz6DmH/Bu5moVZ/p+yRNvFTHtpk7rVE3U0uMWi0+b8tf7EQk11+
	19HFJ9cMGQopXbk83RoIkAIJFmrqhy1o0kom74Jx5aonw8Nu7DBHvAbLg+vY43iZdQKKoYtf8bQ
	dAbtoXClh890mjDy7SQo7+4OV86KkcXV9WdPyHu83S01fhaGqwzba5gEUZWSKuH8zbYmSEGYvBe
	Seznq6k=
X-Received: by 2002:a17:90b:5486:b0:35f:c729:de9b with SMTP id
 98e67ed59e1d1-36951cabdd1mr17237144a91.20.1779148670183; Mon, 18 May 2026
 16:57:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507070547.2268452-1-sashal@kernel.org> <CAHC9VhTwDt2Bx8n0io9Qge_fUEnrHsxrFAQY+KaemKWqJqBQxw@mail.gmail.com>
 <CAPhsuW4TJRqQKXgcBYog8YgFLU2h2Zq9ReahxTYp_zpDyvO8AA@mail.gmail.com>
 <CAHC9VhS1DJNs9gDB6gD9WKhL08giSVajBskZ+=mY0AWRCAsw7Q@mail.gmail.com> <CAPhsuW5jQOzRTi1ea+=UPhx5W9bkBdivPagRE=O=nx0zf_vb8w@mail.gmail.com>
In-Reply-To: <CAPhsuW5jQOzRTi1ea+=UPhx5W9bkBdivPagRE=O=nx0zf_vb8w@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 18 May 2026 19:57:37 -0400
X-Gm-Features: AVHnY4Ju9QhtCnU9X4q0Y1FoqKmXLcQYabAg7vghJP1SBxCLhKOLIiAM2oGfePM
Message-ID: <CAHC9VhTGDOJZDzEA31qc0S6FJpYNC4oD__HQ-65wqqwhng=V9Q@mail.gmail.com>
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation primitive
To: Song Liu <song@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, corbet@lwn.net, akpm@linux-foundation.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 7:23=E2=80=AFPM Song Liu <song@kernel.org> wrote:
> On Mon, May 18, 2026 at 2:29=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> [...]
> > In my opinion, making killswitch an LSM is more of a procedural item
> > that deals with how we view a capability like killswitch.  I
> > personally view killswitch as somewhat similar to Lockdown, which is
> > why I made the suggestion.
> >
> > The use of kprobes, while an interesting idea, presents problems as
> > allowing any kernel symbol to be killed introduces the potential for
> > security regressions.  As a reminder, some LSMs, as well as other
> > kernel subsystems, have mechanisms in place to restrict root and/or
> > enforce one-way configuration locks; while many people equate "root"
> > with full control, in many cases today that is not strictly correct.
> >
> > Yes, kprobes have been around for some time, this is not a new
> > problem, but killswitch makes it far more convenient and accessible to
> > do dangerous things with kprobes.  If killswitch makes it past the RFC
> > stage without any significant changes to its kill mechanism, we may
> > need to start considering more liberal usage of NOKPROBE_SYMBOL()
> > which I think would be an unfortunate casualty.
>
> I don't think we can use NOKPROBE_SYMBOL(). There are functions
> that we don't want to killswitch, but still want to trace.

That was exactly my point, but we need to figure something out so
killswitch doesn't make it easier to cause a regression.

--=20
paul-moore.com
