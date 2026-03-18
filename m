Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0476A3DE43C
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 14:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846002; cv=none; b=bhb+eYFINCW4bX1KDtIjM/LrVzJzicwJyOldaaqyLmokVxFsiyitMp49lsLbSWnEHx9UEdQJ6CyxRjXddR0B5cLz8tNA9Tw69xi6Y9z1Ng1DQaTIRgAOtnY5otcSFg2943KO2K+SNkeMWM/3b5ttaj6sMPUzcAH2G7PS5yqvw0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846002; c=relaxed/simple;
	bh=bEBit3v/3EaAeXPIrEhvLJqSi6H/H8xXCeELyouAkUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFnVfDEeHMZf9yD7+XVPKB536Ef7Qo4QX+/VklozIx7c0+fIOOt8PhCMXyoLTmZmkcIxA6+eYoGed77gmblgOR6QleH5/s/AxSCxOiBOqtedWUIGX4bx0g1dZomR00LebNGapZnU+1wOZNRCMrFHR7PRUbjjt7Rbx86hFCoNRLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3+P9n0z; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3+P9n0z"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b6b0500e06so8339238eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 07:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773845999; x=1774450799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GnznBYtreFWiJHMzmWhLo1aMVcwsFyxP3+fWvwEHCV8=;
        b=L3+P9n0zXI//cQ4O8pD4tXKfXA9JJZViwEaz858VcWyAtkmPOPJ1pqP2YR7Y0oZxJn
         g4869r/W9sg9XydsDfbUKDrlgveO8J+xFVDR/w9vdh0p6Qs9vDV9LQItLKx5yPWKhR1K
         cFcLLath8FwNc4Mlk22IJfXScbvW4ghiVIC8bn2Ii51mF3L1c5E2kUKgNrrCxIXMHRb9
         Am7YnncgNsLNa0etUwOVxZSP4wpG+sDRmGX7p+aYo277p9qvCsa6YgpxoFv2+RQ/YJG6
         UVWLQreP+I5Fv1Ma3x9J0YfV3oTzlI5cczqSZ4/GW9oIb7tYBTQWhtcb5A+C2vA/Wy4f
         /cTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773845999; x=1774450799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GnznBYtreFWiJHMzmWhLo1aMVcwsFyxP3+fWvwEHCV8=;
        b=R2xCyho2QsmTGgt5M+goOhHcg2fMAL/FIHAfetF9uYDrI2atB+4LoPnTuJ88atXiGD
         7DLBwcwVp2JNyerXfPwFsgjSh7yaH+HBuiLXnPBB0jNt1LjjQcL+NYTDogYqMNco1J2m
         yY+mV3S4rwTtB0U0aszJ5maKQvKnYsnde8qTI62oQmtu2MFjRW6npljjg60wOtDEvP9d
         rOfUMYfxkDCNSUsTGoTLYA5xWg2E1pfnoDSjwYYr2z5omoOVGGTf3Lfv9UrvrOcWARYE
         8h10IHFhIj7w+mnG/7kAVVfnSUFyoG+GrBIuJiJ25mp/J+YrXUbCFcGxYNKUIMD7bkVA
         c2kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnSI6YUcWm0kIDy1dS0N3Xbn5EJfTFynDJOHTyQOzy/hFjVtwAspaCcKHTGq0SMTdZ9w0c12NP1wrNYy5yxvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOnLP+ZUgaV3Lkfimvf75DzDFviHqY7cFEsEWeGECDN4XHwOaa
	kP3dfrmkR2MCV7XPr+OejUo/tf7PfxN8hGK/kWOb3s38heIsZVW/8Ws=
X-Gm-Gg: ATEYQzyIESUQaV6mL2RgxNYfyOUmSIKgBAFYao9wReTPPB6eh5YUgxicG4RtHTvuh+A
	n77vC0/k5npNwE6hT3gw80P+FIiAE0AQlj/z2H9NgDNEuiXO5pdkLoxngHu0R7guUqx25Hi/g6/
	4t9sYhkv/QdvigiALVmPjgSh/5PecOYPhL5FuB78Nrx85I+OeFJKDkMi9TJ9zT1RnmLbVKIy9AS
	htUKD0tBQYmmio0bMwBdpMaOLZ1KtuT/WqXwxeLreO0yqw0I4Xzc4DreZMF1ct2aRYh0/5fVFPE
	sJvaDP1U1N4N9FfTE3mndcZKNocwhY0iT63/49TUohaw3FLkIXCDEX9ZPYwtHMfm+C86xqoZfMk
	GxWddnxW1VLxfmELwejtS7OXcVIQG/NFJ3NTCowqKueIDiL2ho/iC7pS74jycXVy1XfIR8w/yHm
	X33FD9zNWKvwVyCQ1sZEYjhEYor3il0RkDmxcX6MFAHKPdmYBd+t2V8gJ2IfMa4PHOpn3r0uPLp
	Ofqq5JaXxwa7ZLC2g==
X-Received: by 2002:a05:7300:ec18:b0:2c0:c415:cfd6 with SMTP id 5a478bee46e88-2c0e50a0a8dmr1648662eec.13.1773845998562;
        Wed, 18 Mar 2026 07:59:58 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55a489bsm4388531eec.23.2026.03.18.07.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:59:58 -0700 (PDT)
Date: Wed, 18 Mar 2026 07:59:57 -0700
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>, Wei Wang <weibunny@fb.com>,
	David Wei <dw@davidwei.uk>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 5/6] selftests: drv-net: add netkit devmem RX
 test
Message-ID: <abq97UD7CHR7bdod@mini-arch>
References: <20260316-scratch-bobbyeshleman-tcp-dm-netkit5-v1-0-b53c8cd72b23@meta.com>
 <20260316-scratch-bobbyeshleman-tcp-dm-netkit5-v1-5-b53c8cd72b23@meta.com>
 <abns9COj7WagFtZ8@mini-arch>
 <abn3rJGXXyDYSNzA@devvm11784.nha0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <abn3rJGXXyDYSNzA@devvm11784.nha0.facebook.com>

On 03/17, Bobby Eshleman wrote:
> On Tue, Mar 17, 2026 at 05:08:20PM -0700, Stanislav Fomichev wrote:
> > On 03/16, Bobby Eshleman wrote:
> > > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > > 
> > > Add tests for devmem RX over a netkit device with a leased queue. This
> > > is the same as the other devmem RX test except for ncdevmem executes in
> > > a namespace, binds to a netkit, and skips the ethtool NIC configuration
> > > steps (relying on the test runner for that setup).
> > > 
> > > The RX path is setup as the following:
> > > 
> > >  RX Path
> > >  -------
> > > 
> > >  Remote            Physical NIC          Netkit Host        Netkit Guest (netns)
> > >    |                    |                     |                    |
> > >    |--- TCP send ------>|                     |                    |
> > >                         |-------------------->|                    |
> > >                       dmabuf                  |--- BPF redirect -->|
> > > 
> > 
> > Is it too messy to parametrize the existing test to run both with and
> > without the namespaces? Feels like should be somewhat doable in python?
> 
> IIUC, we could have main() do something like:
> 
> for env [NetDrvContEnv, NetDrvEpEnv]:
>     with env as cfg:
>         [...]
>         ksft_run(tests, args=(cfg,))
> 
> 
> And then the tests could call helpers that check cfg.netns to use the
> nk_{guest,host}_ip6 addresses when true, otherwise use the regular
> addresses?
> 
> It should be doable if I'm following your drift.

Yeah, yeah, this plus some small changes here and there (to pass your
new -n in the netns mode for example).
