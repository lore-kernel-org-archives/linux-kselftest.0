Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A483EDE54
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 11:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787744986; cv=none; b=uARdQpJvPcwoWFf3EQzm2MDSIdRcqRyfsqYLM3Kh77VWokWKyY+ZE39mKFOJYmgUZjPehK+FmR8e9K0WMVZKbc0S+MhkrJn861Zp0Xb+8h7u+//NklF3HG+Uk9TbrPpf3+CqY/aTxnLOtjMidb8bvXq64GqSHTN9DmU1BIYYFt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787744986; c=relaxed/simple;
	bh=8gJvi1AY0EFIV+KHyvnHbnOhp3L3wnKl2p4qeaAFDNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiFmMuztHfVrii2e+dbjdXPzr5XYG1G9yfh9zr6Sk3FRDabMG1xIbyGHViBNzjrPsNuTtjw26XcqnXmnBUN4JY1xSTd9RftLmwf59lgrsXRbHdZ43O2ptBdVfHhZ+Xe2HxVMz/NuWlER+02m0FI8PC2ZcsKrtrT+md21bB47K0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=ZmgKuFkz; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="ZmgKuFkz"
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F27B540287
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 11:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1787744982;
	bh=siYAsVZaz9ivF+usBNLFZ9S0R6ASYmhsoOaIHFs/ZnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=ZmgKuFkzXthhOWTuMfOnO/XFQL+2hUSETVlnPdC8lYSMd8yoNmGyOP9g9SsR/ne7B
	 P1DGncqWX3kOj0lmCA0h5wQf0BuwV0TdmefjjuLCGsc3I+CxGX921PiWareCBlJA2F
	 UZKbiQZ9PcQB5G5eCHN16e3tOyXzbKwROZtXToF+7uVOl1NM1kGXwuJGk6OdYoJnqx
	 SdAw4KrG7ancJ1h50RPk4laMZdXPmglXmCBVAvAMyy1J4pwkGKlrN6BllP+2mEzxL4
	 x2i7NgGN7RJ2gjnKPa/zmDCwbYBmTFITJkvY8jXvmDdS+UeJpxXzf5fPLtWjqSH2Uq
	 /Lv2aJ2RNPRFM8YIe/bMZ9nwNn80mau2PzQbKj8FCPgtxp29fVW7ydbYczlT5Ianoe
	 voWGqg9tcu6S8zvGRkzk7F0IGNdfOgF1ppwLTFrnESUH6DrL5exaCPs3A7YPTZ0QSo
	 UuzFk3WriBZ9L+b+NBeGHtxRTby8FQeEthsX/ScUl0/+HZRMKwQaazVrv1+Mpv+bei
	 X13Fj77fphxyk+eAfHRfvdjCl6J4Pu/nxXT35WlgjE63XJXD8H+1T6QraJ3sC00Euw
	 4SXr6JF9VefXT4RHkIm7U360WWxjrCAfnpzzyv7MbFmrpHO0f3YvvlPMp9g9eq5HJU
	 nG0bcDT/pHO3VU/G1LMeO8so=
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c24ae1a510cso82100366b.3
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 04:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787744981; x=1788349781;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=siYAsVZaz9ivF+usBNLFZ9S0R6ASYmhsoOaIHFs/ZnU=;
        b=bUYJOJYLMYkJdDyRubTFPEBg/H0kq2HsKXFgo5HiMZHDv7DuIjl4gIJWphvTqr14kw
         SEdYcqNh7qcxSRqPGoX1uoXWNirpg1nrU4kKFvTk63j+jWJbHDiqTVhuVtRQWKaAi2p+
         zjMqdnPlluwFNgetSmMrQaCwG8SRie5zVROYoXwgb9+qXKseBWhpRYDHcXXx5B1+XEsi
         StdWaLn11MMXXSl1I6pZOJM2wL58rF5d2EtOYDOpSSH67fhrDACj6gHeBwuRc1Nz/Els
         9XMZuANvjegCCmPVIezUnRYsZola9+kEiWEhomGzXNzXT+5TPbgvDL3aJV8HBPKZIjLx
         vymQ==
X-Forwarded-Encrypted: i=1; AHgh+RqlD7Yyk59wUTCv1Rr0YjxorvQeavrQM4aizFDcw48P4qwy8mGgpuddVyqO+aL/0fdeDkUPCX6/JPPWCtMdPbE=@vger.kernel.org
X-Gm-Message-State: AFuF++lEDnnHlqwOmk8fzZ4nWCF46d+SKYpWSL3P1v91eP09WJi5xZPq
	8Vx0CtGhvey0UPx1xg5EPiyHaM6FnutyydxkLsEiewQAlbTIeIhBaP73EjYXj49XuI6y3lFJ6x/
	VD5DxcUT363Q2KWctifovAmg/kZu3PehHNehmO5sIrwDAJHr/5qdJz4M/lNxyzEH4gLJ/d3jHkV
	kMks52FGEzcw==
X-Gm-Gg: AR+sD13KT0lmzqpUrUTaRnRznxDdXxVniFdkTIyOUOc4XQnelVZALxJNAFgSQ6sad+K
	s7RoRic6S/ubaI7dAeLrqU7fZnJNnkcFfh1nwmgSXVl/03PENA0u7lN/B9lWimKXxKgcAo4ty6O
	QYpIk03jFXVyHyX7wr7dPpgNAX7duS6b+WtaoMsw4aHr0uz0ExuYTs8uHgMNgMknZ/qI0Ap5Jwd
	uGpx5b1iED4DK3D7xGh86MrUbXbohSRB5/k9AtfDOg0jS4763HVEdWVLl0UiEL+iI2joQkdV6lY
	onhipCxoodsP2xDoqM509bRSOf3oKxEDrr/omA2AZ/oe0o2RWdj8XQd0LtIdDju7/lEZ/3ZXMRC
	R37coRWvpwBZxKQRtvhaRFfTVH5Wk8uCGv5ELwJvMY5Vda+vVtEMwiFBQf+EhoXcZGQ/nuw==
X-Received: by 2002:a17:907:ea8b:b0:c20:3402:bd35 with SMTP id a640c23a62f3a-c250c330f70mr731885466b.12.1787744981538;
        Wed, 26 Aug 2026 04:49:41 -0700 (PDT)
X-Received: by 2002:a17:907:ea8b:b0:c20:3402:bd35 with SMTP id a640c23a62f3a-c250c330f70mr731879866b.12.1787744981167;
        Wed, 26 Aug 2026 04:49:41 -0700 (PDT)
Received: from localhost (93-40-43-207.ip37.fastwebnet.it. [93.40.43.207])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d62easm466521666b.6.2026.08.26.04.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:49:40 -0700 (PDT)
Date: Wed, 26 Aug 2026 13:49:39 +0200
From: Alessio Faina <alessio.faina@canonical.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, hangbin.liu@linux.dev,
	stefano.salsano@uniroma2.it
Subject: Re: [PATCH net] selftest/net: skip srv6_end_d[t/x][4/6]_*_test.sh if
 iproute2 too old
Message-ID: <ao7S04LkWVXAQpgq@cicciput>
References: <20260824091537.2305107-1-alessio.faina@canonical.com>
 <20260826000156.bdaa71db68dbdc9c13907205@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826000156.bdaa71db68dbdc9c13907205@uniroma2.it>

On Wed, Aug 26, 2026 at 12:01:56AM +0200, Andrea Mayer wrote:
> On Mon, 24 Aug 2026 11:15:37 +0200
> Alessio Faina <alessio.faina@canonical.com> wrote:
> 
> Hi Alessio,
> 
> Thanks for the patch.
> 
> > In case iproute2 is older than version 5.14.0, released ~Sept 1, 2021,
> > the End.DT4/DT6/DX4/DX6 support are not available and the tests
> > contained in the following 4 test files
> >  - srv6_end_dt4_l3vpn_test.sh
> >  - srv6_end_dt6_l3vpn_test.sh
> >  - srv6_end_dx4_netfilter_test.sh
> >  - srv6_end_dx6_netfilter_test.sh
> > are failing in some kernel backports.
> > This is the result of one those tests in an unsupported environment:
> > 
> > \################################################################################
> > \TEST SECTION: SRv6 VPN connectivity test among hosts in the same tenant
> > \################################################################################
> > \
> > \    TEST: Hosts connectivity: hs-t100-1 -> hs-t100-2 (tenant 100)       [FAIL]
> > \
> > \    TEST: Hosts connectivity: hs-t100-2 -> hs-t100-1 (tenant 100)       [FAIL]
> > \
> > \    TEST: Hosts connectivity: hs-t200-3 -> hs-t200-4 (tenant 200)       [FAIL]
> > \
> > \    TEST: Hosts connectivity: hs-t200-4 -> hs-t200-3 (tenant 200)       [FAIL]
> > \
> > 
> > To amend this, check the current running iproute2 supports the required
> > feature and, if not, just skip the entire test to avoid a failure.
> > 
> 
> Which kernel were you running when you saw these failures?
> 
> Did the ip route add commands that install the seg6local routes fail
> there, and if so, with which error?
> 
> Ciao
> Andrea

Hi Andrea,

I was running kernel 5.15 (5.15.0-139-generic).

Removing the sink to /dev/null in check_hs_connectivity
I can see the following error:

------------
PING 10.0.0.2 (10.0.0.2) 56(84) bytes of data.

--- 10.0.0.2 ping statistics ---
1 packets transmitted, 0 received, 100% packet loss, time 0ms

    TEST: Hosts connectivity: hs-t100-1 -> hs-t100-2 (tenant 100)       [FAIL]

.....
------------

The error I can see upon installing the route in the setup is the
following:

------------
Error: either "to" is duplicate, or "vrftable" is a garbage.
------------

I can see that iproute2 doesn't support any End routes

------------
~$ ip route help 2>&1 | grep -qo "End"
~$ echo $?
1
------------

It's similar to the case we added last month(-ish) for
srv6_end_dt46_l3vpn_test.sh.
I just didn't realise at the time that there were standalone 4 and 6
test cases as well, or I would have added those checks at the same time.

Kind regards,
    -Alessio
```
