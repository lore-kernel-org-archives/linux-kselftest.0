Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868163FF8A6
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 16:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773850901; cv=none; b=ZEqnpuOa3U23P0D37roZDC12BNBSOFsufu/jenG8CPZFAOtz/SdPVF/yq2trkQRYNvq/3zf09iGzjsXw/uaUhnwuJ9/iEwf2jLgpCil5rWqps76B9xjjymhVlfA2hpwSzFVRm8T57GNAt6M99qDIp9GBi+8zt4ugw9ww8St1BAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773850901; c=relaxed/simple;
	bh=Xais5AlC7gPN/jeDsX8Mvz9zOloreO5rETe4qgoEMv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4v0NfLwlX08+NNT/T35c6QTb8yGsa0qBbAqwxCG3Um+MxePab5rceSiAYJTxN8hg0u7JdzDM2PP9IJMz9kbdgRRj6asAXeys7RSITpQbhqF9Pp+yJ62dIfE8C6MRUI4gNjTY4uzHhw11hVfsXROF+Z+obt4qw9sFcJ00zxzOHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghQjv1fp; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghQjv1fp"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ca1ba0089so132210d50.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 09:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773850897; x=1774455697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aU3ZUegYeNO/2K6RsfKemLkoDaSg+c0LeYfQDENeDh8=;
        b=ghQjv1fpKGyjAGY79ZcebNubMwKey2UMAJ+vXMYM6mENNEt2d1R6+094CRB6n9HS9S
         TtXiUaRH9zeze9hhcBD4cIARmC6nni/zibKmo2VAKQCv/0oZCbspsWvBaf3HIf17uCSa
         w1kyqUmlxwH0XvJ2hYOIZE9JpbJwY/CNUc37YJ5C+A21Zz+JyDLX17kpcpXi0kpCosF7
         jQ8S/5SU9DYPRClxCFgCgujLt7Q6yEw44BqQDJN/zKVml+y709iUUhRrHHpok4Tnit2o
         nTtXZKN73Rf1eGqei2dkTBNBcB6U1Fmt7S1bbBdkTYQTKKBdIE8gxr5w+LJXISzdCVne
         ox1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773850897; x=1774455697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aU3ZUegYeNO/2K6RsfKemLkoDaSg+c0LeYfQDENeDh8=;
        b=RN5e6tR2ckp27chCmrdDvg9msrQoeh7UbPAe5LUdWG4ikYpKho0JM0qYMJS0o3rs+S
         azhah18zuHQkGBOqmwPL4lrv095JUW8shr+5aY5LapQus5e5wt5S93X8VwZRezHtzgi+
         J1ePYZptcDELoixoqtP5FIWu6XTQcZGL6CadJyIQ6V6YQeE8wrC8wp2/QXXwiKTc5pe9
         CS5dsbryOuW7vvaUTI1+Qe0kCRs7Vi70xHUIvXXtVeMFDSJkknoLwJPtBvaLwtS8VxWz
         DkVeVzdIM1CcxxUqgnoCNRi34ZNYsVnxw36QdNQhA2kr4O0dZoZONqIvH9bEP5eBEqOF
         zCnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwYtwutI96eakCCHSuf4DQW5AeHfa8K5mqMWLeSLt/usLMvPpiSfU8305XEecQeiCBkSVfJz511g2tGV7KuS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyGQ6TiAuZf0YGpj5alBl1EydkuOEacrgjImTnj7WNca3GOSZ9
	tKPdNUu30g+YiwQXVviYJPh5l8mJnQKlrnFT+5Ns0KB6IemS88qIwgJx
X-Gm-Gg: ATEYQzzGHW7aKm3XpbonATcYMV3jQP6CpKRcL1kBVkhmwErrQ4U0a0b4YQ7l9J/Vxjj
	3R/rIVMN0l7RPJT/wGx6WE6MLS7BU8pCxg1FTeh5MbGVrDDY7gwvupcF5tMbpJhuTOOcnIVb/qz
	Oszw701UYsW7A0MMGep6t6gaNu305fGmPnhepx2FEzsSlY2O64ffaclfvXGgvqM40SkFhMk5GED
	WL9H5xah684mI1KP3Dy3FekQQMe/ljo/yud+46WJsJafO0mNxOftJz40xYz9u9VpVGiE41vQ2d4
	W1IEWd/JHpPfuU42izVciqWGxToXVxxjwK9KpkO3YY+ORL7XaqWvKZnWc+NxWhdl7kudy1/zOXK
	C7XRPw9QZNF943EQW6EV0tYAobp0l43eMLKb5js+hFyfdFsxmjuoQ3x4sIu17Hz5uOI5Z/irR0w
	roirlHkw7LqkAzVkFXBrHiMBJa7cchwVjxgJINBRUR5ASXeXo=
X-Received: by 2002:a53:b20d:0:b0:64a:df24:813a with SMTP id 956f58d0204a3-64e91351a08mr3367724d50.29.1773850897139;
        Wed, 18 Mar 2026 09:21:37 -0700 (PDT)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:59::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e91c06df7sm1882816d50.17.2026.03.18.09.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:21:36 -0700 (PDT)
Date: Wed, 18 Mar 2026 09:21:32 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Stanislav Fomichev <stfomichev@gmail.com>
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
Message-ID: <abrRDNi79H9ircl1@devvm11784.nha0.facebook.com>
References: <20260316-scratch-bobbyeshleman-tcp-dm-netkit5-v1-0-b53c8cd72b23@meta.com>
 <20260316-scratch-bobbyeshleman-tcp-dm-netkit5-v1-5-b53c8cd72b23@meta.com>
 <abns9COj7WagFtZ8@mini-arch>
 <abn3rJGXXyDYSNzA@devvm11784.nha0.facebook.com>
 <abq97UD7CHR7bdod@mini-arch>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abq97UD7CHR7bdod@mini-arch>

On Wed, Mar 18, 2026 at 07:59:57AM -0700, Stanislav Fomichev wrote:
> On 03/17, Bobby Eshleman wrote:
> > On Tue, Mar 17, 2026 at 05:08:20PM -0700, Stanislav Fomichev wrote:
> > > On 03/16, Bobby Eshleman wrote:
> > > > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > > > 
> > > > Add tests for devmem RX over a netkit device with a leased queue. This
> > > > is the same as the other devmem RX test except for ncdevmem executes in
> > > > a namespace, binds to a netkit, and skips the ethtool NIC configuration
> > > > steps (relying on the test runner for that setup).
> > > > 
> > > > The RX path is setup as the following:
> > > > 
> > > >  RX Path
> > > >  -------
> > > > 
> > > >  Remote            Physical NIC          Netkit Host        Netkit Guest (netns)
> > > >    |                    |                     |                    |
> > > >    |--- TCP send ------>|                     |                    |
> > > >                         |-------------------->|                    |
> > > >                       dmabuf                  |--- BPF redirect -->|
> > > > 
> > > 
> > > Is it too messy to parametrize the existing test to run both with and
> > > without the namespaces? Feels like should be somewhat doable in python?
> > 
> > IIUC, we could have main() do something like:
> > 
> > for env [NetDrvContEnv, NetDrvEpEnv]:
> >     with env as cfg:
> >         [...]
> >         ksft_run(tests, args=(cfg,))
> > 
> > 
> > And then the tests could call helpers that check cfg.netns to use the
> > nk_{guest,host}_ip6 addresses when true, otherwise use the regular
> > addresses?
> > 
> > It should be doable if I'm following your drift.
> 
> Yeah, yeah, this plus some small changes here and there (to pass your
> new -n in the netns mode for example).

Sounds good, I'll give it a look.
