Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7019C3CA489
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 17:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775235743; cv=none; b=tdBLlQO1Q0tnx5ZHDEhUs7xyArYPGxQEpErGO1dual2VgLIJUJM26B7gpvnQMg4GdnFuy7IxrJ0hT9a1Kw7uaPFiDcE1yy9m6+tIgb0Zn2chJoZ5HTN5Rx+2ibk5QiQ7UoXIBlCX3q/PFg/jRauG4eP+VkMD+Hd1xG9bIxQiIjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775235743; c=relaxed/simple;
	bh=fjWWSKtr1jihoXzExgBgCJYTURbpDQDzI0eptamNsyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndzdZmWHveC8s/kxOyuXUchm9+VwcbAXwoVY1a7DTNOJvSXmbJ7O8WqP7H8m9izbs40ORE1AXiRFfNUh1H8LS5envjc+KpPQ109D5RuHMaujs8xZLwVJ7/xY74TFpxKNbVQgNJosOh6l9SAdN9i6C6mzIimbav44+bPzzSKsFMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=Ca+0lN8a; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="Ca+0lN8a"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82c70e4654eso972763b3a.2
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 10:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1775235742; x=1775840542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9eHpYvA3tq0xgSZlAcNsaH335YcgPNXfqBqXXJlhfs=;
        b=Ca+0lN8aIKSPFBZ8zqARj058oGp7WNHqe1oP/UOPX5w/cP7Cr0p3Tt9s6a4UrMIemA
         HtlO/ctdmAXlvsR6G0Epgep0Dzjz46c2O9xiDfmBOeKtEmHBzPR5vTuigy0S+a1WepPd
         Wvr0QKILm4R8DC3N07wWkLJslQoN7Q5BTtIGUMlBGMwg+mSN+3RnvFhK72ilYMkjFXTu
         zaVOg0j654INcISzE3RnjcYfqNreARGlCDALKDnE+rOGMsdtozT4aEHcEkXPed5TyPnM
         JTZtfXilJM+g9Acyjh6m/83D8pAXOj1aW0i9Dj4wtdCtafDRwb78M00fn+cYKExooC88
         7kWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775235742; x=1775840542;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J9eHpYvA3tq0xgSZlAcNsaH335YcgPNXfqBqXXJlhfs=;
        b=LYZPfjHkdUQKOAVErjCvJwUqd54UhnaI0mAjXkltk3wcL1Q+fDkEmniKnfINCuj1Ck
         /ISv5+HX9df6ZBOBCeU1Zpx4/bYb2WPCjqSYJW55CEi0AhsMrQOC+AinkvVRx0uOuaqJ
         iRY58WYdQsKFSJ1gYzSHSbslNF8x/V+azGPKw38fpzmpKwFejZ17cA95WEK2FlXAUZie
         Wzq1QQLfQ7F/3G+uyxzT2WtPPPWERijSIX3FCSCcmAP/ZcMIlNfnNU8hyl9h8/NDvDbT
         x7xHfws7UQUWy1dRLQly8KIUIt/pOcRI4TnOYglqmg3JaqPhfQiuXOH5KcarvV9ODH1g
         mN1g==
X-Forwarded-Encrypted: i=1; AJvYcCU2btLOdC0c5kAXUhdf3sSduRUoJWx+F/MrNeYyoYNWWs6k0ntuqwK71yHmegxIelQ5C2PSx1d+nGg4by+twKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8LF/eviH3IesgMRhtURt1XFaPVW3Q2tSgaXC6droelzzBgZOc
	oIwX8VE+nJT6J3HDkAzwSujut7ntARhQpqGjqwW1zPG/nQI31WjmmCXHg02S0vOwPdc=
X-Gm-Gg: AeBDietF82jtIxapsOC7Fv0aFvcMhgBDq1IVd0uEGAr+ojhYb79HR9Ea93xQh9JnuP7
	NOWUZHebQK85PsIlyBRJeNawWj6lIAzID3EBWOn1Xkp+sRFwEbY7UeD/8MleDBCgMHjObVbt327
	dCeY+NTdMF7wD0SJ2AYisoxJeXjdNlBVNCNj+J9MOksCGFzk0658vh2daerP0snZBth1gOvek79
	HxyxaNF+W1fXrqu2PYBGtahB8ggqHrCng+pNnY6gZaD8h44D5P8UYo25s/OjhEAHNnYwJewM+tL
	jMC/dh99cCJKhaKJL1Vi+ZGmpVrQ/YvtCSZwk+kT4N9/jtVE5HvVNfFA7r3Ay2KOO1j7V0/cn2L
	Ciz2lWSOtb0Ys2RUUhlBnrw8gM5PlmEgHATVlHw4RIvS3e5E6LY7wF373o78iVibvS6CGROguya
	0vf3rhmhOQ1Boil5k=
X-Received: by 2002:a05:6a00:2d15:b0:82a:780f:a187 with SMTP id d2e1a72fcca58-82d0db6c414mr3532103b3a.36.1775235741468;
        Fri, 03 Apr 2026 10:02:21 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5b::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b76c0fsm5956785b3a.15.2026.04.03.10.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 10:02:21 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:02:20 -0700
From: Joe Damato <joe@dama.to>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org,
	willemb@google.com, linux-kselftest@vger.kernel.org
Subject: Re: [net-next 2/3] selftests/net: Test PACKET_STATISTICS drops
Message-ID: <ac/ynCrKQj6SjsXP@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org,
	willemb@google.com, linux-kselftest@vger.kernel.org
References: <20260402232203.2004496-1-joe@dama.to>
 <20260402232203.2004496-3-joe@dama.to>
 <willemdebruijn.kernel.886450145305@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <willemdebruijn.kernel.886450145305@gmail.com>

On Fri, Apr 03, 2026 at 11:26:01AM -0400, Willem de Bruijn wrote:

[...]

> > +
> > +	if (cfg_drop) {
> > +		check_packet_stats(fds);
> > +		goto out;
> > +	}
> 
> can this not use the check_packet_stats added in the previous patch
> right below?

IIRC: no it can't because when I tested this the do_rx hits the error path in
the drop case which makes sense because of the tiny receive buffer.
