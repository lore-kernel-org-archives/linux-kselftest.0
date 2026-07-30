Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA07A396D1C;
	Thu, 30 Jul 2026 22:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785449675; cv=none; b=Bk3YB89oU5c/dmjCqTCq9Aa2Y4nEp2kNKoa/4TRopgRL0ioNtJ9RSyApoxzI5tP/5YQ3eFmQySYe6KHEFY4HPbHLwY45iJ9GxpIzipqzw11fQeZGDJNwR4E577OopGBvhxISSsUPrWufyuH/W+o0HyYmgOtMMgCdXqTqwPHGFDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785449675; c=relaxed/simple;
	bh=Ks52QOTiD98HHI6H2NHEKIUiKbmRup8/EAejzNRV994=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j0vev1g63zzZvkxn+1UYOA7yuKr2xCTQKHqJ+O0u0usJ07q3l0njiHvaoVYPF+GJEnJteiiGUKxOtVlpg7Zcid6RvC1WGpWtex20yrHdmDeGEoxaXZ2fdkDZyh5f5TX3HZhanvB1Md1lvqVTtP0+NzRp/bp8OxM4FGvKu+s+3t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VdhvzbIZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VdhvzbIZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1BF21F000E9;
	Thu, 30 Jul 2026 22:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785449674;
	bh=Kl2LXuRXOLf8ez6vuCeLQNRBxMhbN4T2fkvqGYlD1Pg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VdhvzbIZEhTFZpSrmfSEKrYBbBotmePo+jHszCXt7RFIbzxeNrIMnkWKi/v5zE24t
	 HbCvzfF9ZWJk/r7Zs3ySklRNoYhZuD90r3Tq2HZGiOIm+u2Q+4xHq4Gf8II/k+99ps
	 KG9Du3Rumlssz3fog7MwICUQ6Hp7t+6JhGyXVQl9yIg1PxJwciVwzhKsXhjkwuj/In
	 5Ht3vyVDHYpwCyfYx1l+x7wbci1OnivFrf0/86TsDKUADCd3z9EJUT0fd4b3NZm4ry
	 AuyYg2wxX3HTEgSE/8MgJJZBDTk1u3MvQqDM4aPZfyD8pI8tLOrIFUGobHGHzk6mrc
	 O3qlkcU2jjUOw==
Date: Thu, 30 Jul 2026 15:14:33 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net,
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com,
 dw@davidwei.uk, Joe Damato <joe@dama.to>, Bobby Eshleman
 <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v6 3/3] selftests/net: devmem.py: add
 check_rx_large_niov
Message-ID: <20260730151433.6f71258e@kernel.org>
In-Reply-To: <amvEJVio9XtCn+YT@devvm29614.prn0.facebook.com>
References: <20260724-tcpdm-large-niovs-v6-0-7975f62cdfbb@meta.com>
	<20260724-tcpdm-large-niovs-v6-3-7975f62cdfbb@meta.com>
	<20260729191649.55ab7942@kernel.org>
	<amvEJVio9XtCn+YT@devvm29614.prn0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Jul 2026 14:39:37 -0700 Bobby Eshleman wrote:
> Poking around, it looks like 231.1.167.0 and above should support
> everything, so fw should be okay AFAICT.
> 
> Looks like the config is missing CONFIG_NET_DEVMEM and CONFIG_UDMABUF?

Ah, damn, you're right. I grepped for DEVMEM and didn't look closely on
a hit. Turns out there's a non-NET DEVMEM, too.

Could you send a patch to add the missing config options to 
tools/testing/selftests/drivers/net/hw/config ?

Can be separate or part of this series, doesn't matter.

> Sorry, took me a while... was certain it was a bug in my code.
> 
> Not the failure here, but wondering if this was on ARM led to seeing
> that 16K hardcoded rx_page_size in run_rx_large_niov() may fail on ARM
> with 64K pages because it will fail the IS_ALIGN(16K, 64K) check...

Ah, good thought. We've been meaning to get an ARM64 server for NIPA
(our current server supplier is out). If it's not too hard could be nice
to guard against that. But also not a huge deal for HW tests if they
fail instead of skipping.
