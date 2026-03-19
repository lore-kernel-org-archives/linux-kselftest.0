Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4604940DFDF
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 00:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878468; cv=none; b=XWZ54ybiJzir3xzYov2/eaQ6TxKq4LqiZAhePzmSSazj1TxzuK+er18P6vCcwz0HquN+w9j4JTfShfOrBUOBzAzEzOx2mSSR4cABkn8mbhzYGdy8bOZ6mCxrCZvWpcWsIRizwgONj++ImLvrGemVrajmhuvyBKzKixbvrMiUgn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878468; c=relaxed/simple;
	bh=I+jFUSuAOEMjj3fbB1HA6PoT09aFr0BDiTdeapWAWjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntrHxUwb1+1zPC09wHctJy0DWSB4sOS6zb/1NBicFZlPBri81hPFnTOC/ifUPhRYMK4uDvDJND78nakfugWfSMVdikTHfdVhzfRhzxwfKwcKt6fPMBNOxFaP3bUnZ83ueGnEcSTJtfUHdlxZPigUlffvRqn9w7i99CmbAdv14fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHg2bRed; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHg2bRed"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64c9ebd1369so537006d50.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 17:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773878466; x=1774483266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ILbygoPcRuCSs+r8YFh5aPC+4K7iokiRrlp8YwLSZI=;
        b=iHg2bRed8IOLUzRSEfxP8wWEwl5EK012794uh2tD7rXbk+nFRdNpdoTkyZNeOd/y0v
         ppjF4p9DauAEMn0ap4K+X3hHcHK0IHZGXI3Qz24aleAWSzjroqyJHOOFryZIv6v1McVT
         BNbdSmwX0DKZISvDKXiYyaPdFVcajgVxRdLQ/v3Bg3c0n/pRp9C2v++WmTURksSj/81H
         Ns8NtMB/4OEktleS8I5mBeWOYMgLFGpIigbUM7MfNGGKKfheOl9tN02/hJpwINhTaVaG
         0LOhEZGx0hropxZ4hzFZw0HWF4D7mmM4kX0KcaTJt2lxEkAD1VDwmaL1nVUHWSRi3vbP
         TLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773878466; x=1774483266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ILbygoPcRuCSs+r8YFh5aPC+4K7iokiRrlp8YwLSZI=;
        b=qNiUEvqMPNkxT2mEViRZAk6wyOE7ZGnaMyInO03nJNapZ8CBSEW3wT943gXAozKYsZ
         orKFSxXfwz6V6+zkmWZW3+6mqP4r+RjntzAkW60yVCZImNrgMTTaT0MWIhaqTTcmPU45
         lUDsr7B9suxRi6Fy4Wq02uNWVpSeIvMpj+F30LMhxLhmVjzrIYeN/o9pNYybVSZZOaX3
         PtjHYLNo8437IGZ2ExWGk7Z3tQRVHLzhQviQyHQCxbwg0uQGc7TxWVb/s6Ajb3Rz9TEr
         LmwHbX4dzHi31pWRw7+UdA7/+VLeO9LwAW9fVA/OpIx4ajGsX6lOZd1M4U/48nCkVSI5
         brOw==
X-Forwarded-Encrypted: i=1; AJvYcCWLa0tKsMx04oHZ3ss9+Pz9gVvvxRR/r5iYOV9fQpZPhvIPlv0JWeW3Nxna1MjNmSVEyY7EcKubU8fTONvFOg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMZGgEAeXDMiaazbYOaW78hW58sy3tQOQ7XKAubC0BWjJ0qAjA
	zaly5I1LWAn9satw6HIVRS2ZQaYF15mY+kXtTNGe5bgJy5ATxZyUZIFn
X-Gm-Gg: ATEYQzy+mQlpvKpAV8HdlSU0AVDYSB4peXfBmLWfAOghx7Azatznyrxr/vgbtieNhoh
	rLG3LbPoJN5sQO4y17+UqGXH1okBW5Z8qniabLJ37bPLk9voDlugnZFk+pJrbRxHLciyGTtwBtQ
	zyeei4HBPcZFnYjqfIWiH0dYdTL/8b9B0Mi2tYIJwLWrWgE5NuFPCm8vCJ0/GrBF42+/eciB+c3
	XNX22FA6/9Xuvf422Ign1V9f0aKs/YXgPRI3vH4LAmfRw3C23CHqcWB0giefpBypkNNFS+x7AK2
	szyN5NR/j9ocoF+mk9hWEKl2DfIMENCpCsHEZ5nmOv3MkEdXEu/kpEgbIiDPXQWr0UI1Qq+tuo4
	hbaLIVBj4+GlY+J+jE2hDF66wBy+vEhF5bb5KVIUT+B7MsNCjAyBcWaVcCSvDxsgxZkTsC+770f
	huurLIl2z28c7/Anr9p08pmN3xljrTrZrHBb7vWaXDvgyj7g==
X-Received: by 2002:a05:690e:1b66:b0:64a:ec39:dd64 with SMTP id 956f58d0204a3-64e915cbab7mr4173241d50.43.1773878466260;
        Wed, 18 Mar 2026 17:01:06 -0700 (PDT)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:e::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e91bbecf8sm2512651d50.11.2026.03.18.17.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 17:01:05 -0700 (PDT)
Date: Wed, 18 Mar 2026 17:01:04 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanislav Fomichev <stfomichev@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>, Wei Wang <weibunny@fb.com>,
	David Wei <dw@davidwei.uk>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 5/6] selftests: drv-net: add netkit devmem RX
 test
Message-ID: <abs8wCq9PBpuDc5w@devvm11784.nha0.facebook.com>
References: <20260316-scratch-bobbyeshleman-tcp-dm-netkit5-v1-0-b53c8cd72b23@meta.com>
 <20260316-scratch-bobbyeshleman-tcp-dm-netkit5-v1-5-b53c8cd72b23@meta.com>
 <abns9COj7WagFtZ8@mini-arch>
 <abn3rJGXXyDYSNzA@devvm11784.nha0.facebook.com>
 <abq97UD7CHR7bdod@mini-arch>
 <abrRDNi79H9ircl1@devvm11784.nha0.facebook.com>
 <20260318161010.2d7338b5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318161010.2d7338b5@kernel.org>

On Wed, Mar 18, 2026 at 04:10:10PM -0700, Jakub Kicinski wrote:
> On Wed, 18 Mar 2026 09:21:32 -0700 Bobby Eshleman wrote:
> > > > IIUC, we could have main() do something like:
> > > > 
> > > > for env [NetDrvContEnv, NetDrvEpEnv]:
> > > >     with env as cfg:
> > > >         [...]
> > > >         ksft_run(tests, args=(cfg,))
> > > > 
> > > > 
> > > > And then the tests could call helpers that check cfg.netns to use the
> > > > nk_{guest,host}_ip6 addresses when true, otherwise use the regular
> > > > addresses?
> > > > 
> > > > It should be doable if I'm following your drift.  
> > > 
> > > Yeah, yeah, this plus some small changes here and there (to pass your
> > > new -n in the netns mode for example).  
> > 
> > Sounds good, I'll give it a look.
> 
> I haven't actually looked but double check ksft_run can actually 
> be called multiple times. We may have some global state :S

The result is global, but accumulates correctly.

But the tap output doubles:

TAP version 13
1..2
ok 1 devmem.check_nk_rx
ok 2 devmem.check_nk_tx
# Totals: pass:2 ...
TAP version 13
1..4
ok 1 devmem.check_rx
ok 2 devmem.check_tx
ok 3 devmem.check_tx_chunks
ok 4 devmem.check_rx_hds
# Totals: pass:4 ...

Not sure what outside parsing expects yet...
