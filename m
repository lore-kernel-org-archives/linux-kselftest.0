Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55112388E72
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 16:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775492946; cv=none; b=RTGrOw9WSsBpbIFE3MeveLM68wgUSsfZTPfuYs3bZd4jK9O8Hix5CmBq4MoIctqSaJbv+1AYloHAaT4ZETJjnYpK7aX9tcyPonglxy50Dt6N7qsYy6Pmj5a/MYarsX3mo1LXAINv5NbYOihAKC3Pid+Oe54FpYLnqqdtp2dhQ9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775492946; c=relaxed/simple;
	bh=iCvep39//9NLefQPV20ZhHbFZSdUVLuDQcuwC4G0bBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtzHH6VBaf3SAZQoWUfCRHcLEDdJSGxw5ZOjWmhDML8BhEdIvEqu0iYAGJaS1xH20Zd8GQpi1DbgkwKSKBSdLGo5Lmh/ot6quB4ewHultYpPnp+dkJTg4VXaarYxZcxpD4ISwjlg0vrvrO8ePqRHo2IwKQbPqBBQiXHW/sC0b3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=t8q1C19V; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="t8q1C19V"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82ce0a9b3f7so1722679b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 09:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1775492945; x=1776097745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/wAT1jsHY9cPPblI6OsQOt14GLFZSNrLQJUq5KK/xg=;
        b=t8q1C19VqcPPn/WsCfArLYucAhGB+YreQwvmcIc9QE5z4K6V9WvaPRPjBmlee5X5ED
         qPc0Bw0UoGdFSIlsASmAQ77GxffkSyfZzYnnu3/VP/W9qI7OegKaKr2NegTVNquEy/5R
         zFgq8Hy8OFWGeIHm0SnVemKa7gB9ZPeP6rxzlgRKYHp8c65bppOD5uuBrRpSi945Vp2C
         tMfzVwKdcpPUSVhwtu40j9+jX1FW/Kok9+VIKu+qU7TMqt6/U4c4vMuwPL5i2QW1Hqtm
         1Fo1aOJKPNfhf6M/tp+pdgCrLT8lOl8a3I0mW9fM8WuJswAe8Aj/bkB3PE5rB/RuaFeu
         6Xcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775492945; x=1776097745;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v/wAT1jsHY9cPPblI6OsQOt14GLFZSNrLQJUq5KK/xg=;
        b=guoZyYJc2cTBlInSV/kHPjl81r1CzQgJs4QeyuYi20rMferwr2YoLCRC0SruReaBkM
         3JL7AwuL3eh5aCVd7tcnOa9UQWuRbPvsmsPu83pTl0l5AinQBMOifpyQAJ4r27IH4nhS
         YdeQ1FbDLX9IAdL7Q+iQOJowPz/j3IOIzlDWTZvyOyzJdCWoezYfucC/2Y5e1ReLTb8V
         kZxyR75+XPtSw6Lzqsy+OSRCnfIjOXLQBf8lMyyXbEpggJzhZN4H4cCWxK+m8SILMsTN
         pHCBRa64r3nCdxD52qXMOPuAG9tD6THX39g37rJMaj3Ghz8r0hbBskx/C0XxHwhu2CNp
         enmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrZ7cjtsvrrcBTPS4dfyW/qxoFxvOR0cbWI+O3pQOPUNyg/UexHqB3NfD6Fe5UwXBisim+BgMcp+9Eg8Z/fXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YweXDSxw3/2ydZaVrp0nOmHBWyPy4RWSelifK21QUn9/3Sp0fIy
	wLM072f8uL9X58xN+a9ZsEcwbKWkmw44eeuNw7VZlWC98R7Z2+weUcS5Jam3Q1dejUE=
X-Gm-Gg: AeBDievb0fpH7DzNny7PprG7Gu6b/f8t6kCypW1hfl92VAwdmS1Z0rODdnpUhwPblRV
	L0d8nmlMQ6+qAQxtg7TFw0V5T9n9XSPjjJLGoVjYPtJZ47Lm2pbg0ZbTN7iTSABE+v+VII5bjSk
	emvGlBzkobhzogwgapegeLoYZefJQhBtS2heA4gUzakdpyMqL0ME7txE58hVsz25AiTcgFa9rj8
	pJaQlckr7w93yieqCgxEoJ88mfEKpbCQ7UAQdUmOHTAFOsExH0DPG47i27xnbMK59J3sWsYXFPm
	dwwvrH1G8jZ1Kklc/+woP0BcKQkSEoISIqpVZZU2YzzcnjXuYeozjnUqmyXkYXmCJaKgIAQRMKk
	OQCG/BSagxrbFHHAm0B/oNQTONUD/J+AV3M4qrVKI9I1uXMbe4IG1KAN7cSQ2r0a2mCgjcdGvDJ
	6FfQZM
X-Received: by 2002:a05:6a00:3e12:b0:82c:7876:a03e with SMTP id d2e1a72fcca58-82d0da8f384mr12417654b3a.17.1775492944661;
        Mon, 06 Apr 2026 09:29:04 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:42::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82d1d6b221csm8590318b3a.56.2026.04.06.09.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:29:04 -0700 (PDT)
Date: Mon, 6 Apr 2026 09:29:03 -0700
From: Joe Damato <joe@dama.to>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org,
	willemb@google.com, linux-kselftest@vger.kernel.org
Subject: Re: [net-next v2 2/3] selftests/net: Test PACKET_STATISTICS drops
Message-ID: <adPfTwbARPVFLys8@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org,
	willemb@google.com, linux-kselftest@vger.kernel.org
References: <20260403233240.178948-1-joe@dama.to>
 <20260403233240.178948-3-joe@dama.to>
 <willemdebruijn.kernel.aa6e2a3e845d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <willemdebruijn.kernel.aa6e2a3e845d@gmail.com>

On Sat, Apr 04, 2026 at 11:08:15AM -0400, Willem de Bruijn wrote:
> Joe Damato wrote:

[...]

> > @@ -396,6 +424,11 @@ static void run_test(void)
> >  
> >  	total_len = do_tx();
> >  
> > +	if (cfg_drop) {
> > +		check_packet_stats(fds);
> > +		goto out;
> > +	}
> 
> Sashiko pointed out

In the future, please link to the AI report.

> that there may be a race here between rx
> processing in the softirq and check_packet_stats. Seems plausible.

Can you elaborate why this is true?

I could be wrong, but I scanned the code and __local_bh_enable_ip seems to run
softirq synchronously in this case, so I think the code is correct.
