Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7311F5437
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 00:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773795248; cv=none; b=L6R8MhqUdgOyM3/960DJJ6o03oKYpxTv/GDt0ve7Enp/UIfaSQWRMXDHqhKprEvzaUb5mMU4P7Upn7HJ6xDJP+lc5YQJkumopoo+9bPcEv6Jq9gdQm8TYrVOZvU0XrCXU78/RjiB+69oTap6M3jNk0+7Yj/15ax8SntsnHmPuOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773795248; c=relaxed/simple;
	bh=LEYmdWK7Kk552UX5ZZybeDPpxRvo8AVLuiMGGPj5UHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=klTBh81/Jddbk2pnjQe5By7OfOmxFX7R34wRrbVTNmHmJIhIozmR+l5bRqrD8Fu5geWi03s76z6G1obxA2bhqtMmZKGB85EI/vau05n13nPtTWo0Pc1gjnKJ9sFcA5ovfn26+jzXD8c8l/LzpWkvUZow77r41wpIdjfPN4cEadE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTBcZmcy; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTBcZmcy"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ca2b32f46so4985607d50.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 17:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773795246; x=1774400046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UAEC4LpUFt6nufrPf92R86ddLY16BiwOGudignGq+G0=;
        b=BTBcZmcyZtxR4rtVUZQpSET3dHYGss21xAB6JfH2H/zrMsqGYHKcTDAkpnvvE0u+Tp
         GVoy6LHccnwgnd+4wt/1IiZTRh/PhtdhBuszUFlddEvU/t3yDuQ1xL7MLq0BVXRbDVsO
         5vFm/YJBgUdA5WiQrMRjVH18/asRNE01Igj8tzl40J5/sF27vWNIQZvql5DboAzQdAJY
         t8wO0KKUbZ5b0zq3dPF9e3Hj7VEe7RaHOOPF2bdGW0oeMfYmAD4jePrEcswmuJroQxtv
         +zPHY5zP2FELIyNEiUGv18OZaRpJhyIRjL26+1AcOLAiP2BoFsW18hvuYrMkCq2bDpaQ
         kHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773795246; x=1774400046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAEC4LpUFt6nufrPf92R86ddLY16BiwOGudignGq+G0=;
        b=PPI6KAt2TfAzZHwKh6xqbWQq0Dsm7zBFvhITdtYzeh3LDAJM50dF1HXjurzR7809y9
         ZPTXnyOnN8eRAiOaqWMl92UZQJiII8VpxH7Dp80SH3Eds788fig9920u8QkPZvYmUaS+
         KjKWAu4qqs4xb/00RcmdiAdtxZ09BUHE9rhWfYzLgqeJn6tlyRQ8a6Vg/xO4bE+V4hY2
         U7of/KQWwYnXzI+h17Y5ysWElhDIH2EmNXlAdGSSd9q/MdInpeWMh9Cb7i7uMstPs9CO
         u4mrC3oXrDLd1bui5nLpy7hQi/r7owiGmOHghioOMMduu7eyV9cMj/tmwyv0Eyey+sAh
         aW5g==
X-Forwarded-Encrypted: i=1; AJvYcCXHXVt5v4c8aGKIg5GhPftVOwrYaEaNrnIAkb+M9aPWKu3dFEw6O/2onF4y5Oj2eB7AjwRMmXW6fcNwN0/LVBs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmf2e1WawXBLt8CN+UUM78AXDCNra27Ot4aQi5mBfRQztBZB4e
	+yP9oZgtioaViuBVWNCH/rHyBlXOdLr4tOGqwQRSFGWeAWHcr2G3cpT0
X-Gm-Gg: ATEYQzytI4Bokvv+XSneyoMHaxlGtz2Xm70y9rX4jpbpOtm3wKonqcLN524WasQ4YYF
	/V6rTHB2BAjcqfEmX2STQcN5AK5UGxLc24EMb0bwFa4fVYFWqo45NgYLEh8IWn4HQvgCnSuxtcL
	+PzF5uoLL7+IeHqlKXsidOnaYC4zbE374o6a/r8R2y7OUrtO2M83UsRJ6hBSXK4+5v2FaEMuVa4
	NauEn0nKauKP+0nkUeJfVtTecJr/V1e2luozXvsot7nh/t7f3zJf9vehJ+IFry3JyFQZh7mN007
	hea2sQXg8DebAFgblDvzisUCww0YLf4DYhhmPjBxM4jz3Q/ATDq1iLx70nDVtP4Lm6ymCSxPpue
	f328FsHPz74f0m6iZsbCh4Ghw8cJIJRX3I3kvBYtR/m47ht5btvrqrObfiEvJN+dJ8Uerg3HbzY
	eQz8m8FcN0RM625ZJv4xkXSc73iz+i3iTW2i41AzQ9D71OXMk=
X-Received: by 2002:a53:ee53:0:b0:64a:db17:3ce6 with SMTP id 956f58d0204a3-64e912ebf63mr1522789d50.2.1773795245924;
        Tue, 17 Mar 2026 17:54:05 -0700 (PDT)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:73::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e91c29074sm746207d50.20.2026.03.17.17.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 17:54:05 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:54:04 -0700
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
Message-ID: <abn3rJGXXyDYSNzA@devvm11784.nha0.facebook.com>
References: <20260316-scratch-bobbyeshleman-tcp-dm-netkit5-v1-0-b53c8cd72b23@meta.com>
 <20260316-scratch-bobbyeshleman-tcp-dm-netkit5-v1-5-b53c8cd72b23@meta.com>
 <abns9COj7WagFtZ8@mini-arch>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abns9COj7WagFtZ8@mini-arch>

On Tue, Mar 17, 2026 at 05:08:20PM -0700, Stanislav Fomichev wrote:
> On 03/16, Bobby Eshleman wrote:
> > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > 
> > Add tests for devmem RX over a netkit device with a leased queue. This
> > is the same as the other devmem RX test except for ncdevmem executes in
> > a namespace, binds to a netkit, and skips the ethtool NIC configuration
> > steps (relying on the test runner for that setup).
> > 
> > The RX path is setup as the following:
> > 
> >  RX Path
> >  -------
> > 
> >  Remote            Physical NIC          Netkit Host        Netkit Guest (netns)
> >    |                    |                     |                    |
> >    |--- TCP send ------>|                     |                    |
> >                         |-------------------->|                    |
> >                       dmabuf                  |--- BPF redirect -->|
> > 
> 
> Is it too messy to parametrize the existing test to run both with and
> without the namespaces? Feels like should be somewhat doable in python?

IIUC, we could have main() do something like:

for env [NetDrvContEnv, NetDrvEpEnv]:
    with env as cfg:
        [...]
        ksft_run(tests, args=(cfg,))


And then the tests could call helpers that check cfg.netns to use the
nk_{guest,host}_ip6 addresses when true, otherwise use the regular
addresses?

It should be doable if I'm following your drift.

Best,
Bobby
