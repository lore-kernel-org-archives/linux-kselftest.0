Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCF5800
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 00:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774310705; cv=none; b=dkrE7cvfhWKCuGzj2r5nkGw5w7wtuA2s3vh1uG8gzlrfRwDI++zSV0Y/FEd4n0q7ztcAmP9J++fr9f+/LCwtxdrCJGNy3kYA1fJs5fYYhDvvjE0TuxE2fhm0hsIJ01cjA4rRlqaATOelReKP5IYoNsMy0jG1F7VazoJKBGKxDAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774310705; c=relaxed/simple;
	bh=lwYxwjXMCv2JdT5L0+I8BknONToxoQ0FK5alebO/g5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j1+AXnQgDOoDXxLmtXzr257rUcamJmm++JJPeknFuwZjXllwS4h0iwZ00wZzOZHnxzpdOqAO6Lpr9g5cXZc94TFDUO5Lz5wHMY5ycbdIqJH01zywj25Rmu9ZZEzjGaMTQ+0vhvyLrOPHRjYAGp5wV5On7wsLpbKsUwlCeFF/V4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTqdUuOl; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTqdUuOl"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-798374d0f44so81228187b3.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 17:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774310703; x=1774915503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5m6eGmfe+BCNtopO5PFck4Wvty2fCogCBN1YRsxKpro=;
        b=HTqdUuOlRF06C2PO1moZbEOB9PgziQX+TQgZC33zTFQDrgW7cBNoNF778HfjyAyT98
         D2mZbkOASV0yHK4oMGgdhMSq0XCg7UvtKipozQnB8bwPXRE5IeH9qNpdpf9aucEUT/4W
         IF6qNudyx5hseo08zryNN/AbEco2qj9X6scQ1qdoZtyhLNMs2YiaO9J5lBa1Ra6fBx6j
         Ezoi2tUSTEqzIH0OxY3pZb8HvJRuxo/Cq9v94uRF6PDMMsBNBN4ZIInZjCdeH7tuj3so
         o5PYDl5M6g3V5+1JsxEZ0h6S0rO6wm3nEr7q3IWV2ZwtRRgkLTuco34KMPk3AmT3AkJd
         V/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774310703; x=1774915503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5m6eGmfe+BCNtopO5PFck4Wvty2fCogCBN1YRsxKpro=;
        b=H0gqsSujDAwVO294AGcjhgMkwDpKQ5kjAL4bhryuDTe2270ezsbTCyJDmuVKqoyx14
         O+EkVMQtxRPhlx2rlYexT/yx6WerPAto5dd5UmDPsclsznBOFpDC/yDAmoBfR2B/Td0P
         ywcYOuEEk8Cj8egCYsBJQMsF3lXcxG9SiBJbAHOOvU+4Tau0lhRj4eL/CTzcymQeufbn
         LEZig3WXxifkl5bTVBp47HmMAbheFuWjSxwRIP7aN4cPG2fD1qsr+LAb5bhyu6D8NHwe
         gsuNzUEECCg/vD3A5CDqxCjiL9RDiTLdVfR7uZscNsWzACKDmy9EfCL48M6xmGrw2Els
         OUKA==
X-Forwarded-Encrypted: i=1; AJvYcCWVmuVK5Rhn2sy23HeUWHCdb189Rvyua0T0xGkKLb/NNPgWwBZqDUUcKoY5h9Vsyw+Ga6OgpuF5kPW4qy9Mpzc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz25WNrOvthhIT1wrq7lmzuJAfgwp8ZW6fnqHUrLh0A/J9rb8JB
	5fVBwIOgKXUbN/pAPEzksfwA1WaZn/FEgbEv/Y2ulBRC3AhxOVbPuntr
X-Gm-Gg: ATEYQzy/dHlCEnf53W/EEbXXxLA5Feswindp8JtpKoYPk0rMYTHvMFpG5vZ7l2ZhPC4
	3SiidRTZpOAc0gymfTXtyWCZ0pa9m4/EZjXKH65/vDvo1D+Kv93pvLKWzGwxRPtANMomm7yvBtm
	WE0lLavZqCK/NI18qjNVVruxeQ8/qCNct1biKLpYIeuep99f2/jvQSNR49Abl0aSZB1n6qg0tR9
	PZ3zIepvhHTXo8j7y7ig9Ml837zW/o+F1ZZl9cbVD8zn8bzFQxwdVfTRugtFwk9TIl9zx8XQSmX
	h49egy+qAkwISiFCYdRYvgCElRBT44wttc21iYdOCnWJAKBhXNMPCGdlqIUH31pqOA8R5urGUop
	tG3Dlz9l5v1PKGgcg6T5oM6+AYKTECW/d8Jgix3/c0qNbVj/ikNkHgq0KWEF7ZmWa6j+Xw6eQ0X
	tpGQXn2R42RfJYdboUslY5
X-Received: by 2002:a05:690c:6607:b0:79a:51df:6a3a with SMTP id 00721157ae682-79ac2ee15aamr16525207b3.17.1774310703401;
        Mon, 23 Mar 2026 17:05:03 -0700 (PDT)
Received: from syzkaller ([2a03:2880:25ff:8::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903a2d78sm65365037b3.4.2026.03.23.17.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:05:03 -0700 (PDT)
Date: Mon, 23 Mar 2026 17:05:01 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, David Wei <dw@davidwei.uk>,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net] selftests: drv-net: add missing tc config options
 for netkit tests
Message-ID: <acHVLQA2eIsLuqEU@syzkaller>
References: <20260320-config-fixes-for-nk-tests-v1-1-1e20ec6ddc7e@meta.com>
 <20260321103607.GA74886@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321103607.GA74886@horms.kernel.org>

On Sat, Mar 21, 2026 at 10:36:07AM +0000, Simon Horman wrote:
> On Fri, Mar 20, 2026 at 11:08:35AM -0700, Bobby Eshleman wrote:
> > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > 
> > The NetDrvContEnv env context uses tc clsact qdiscs and BPF tc filters
> > for traffic redirection, but the kernel config options are missing from
> > the selftests config.
> > 
> > Without them, the tc qdisc installation trips on:
> > 
> >   CMD: tc qdisc add dev enp1s0 clsact
> >     EXIT: 2
> >     STDERR: Error: Specified qdisc kind is unknown.
> > 
> >   net.lib.py.utils.CmdExitFailure: Command failed
> > 
> > Add CONFIG_NET_CLS_ACT and CONFIG_NET_SCH_INGRESS to enable these tc
> > options.
> > 
> > Fixes: 3f74d5bb807e ("selftests/net: Add env for container based tests")
> > Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Hi Bobby,
> 
> Unfortunately this does not apply cleanly to net.
> Which breaks CI.
> 
> Please rebase and repost.
> 
> -- 
> pw-bot: cr

Oh, I see now that 3f74d5bb807e ("selftests/net: Add env for container
based tests") is only in net-next, not net yet.

I'll resend with the proper tag.

Best,
Bobby
