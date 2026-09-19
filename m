Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C24325495;
	Sat, 19 Sep 2026 21:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.13.80.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789854211; cv=none; b=LkxtW3g2dMJidJUX+Kiwwa5CENm1YyEmjW8Msp1e2VVzszsZfw9UmxKN18iEpMnu9J72ljP1G/5MIYm27tCYMvUL2Z5QgN+nRTLFcsjGA/vL9WRcBZyZoTxZm80RvtcRFSGzDFLBMEQmm83Ko8ONdUn9VHtSv4rkJyaYv+yh4SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789854211; c=relaxed/simple;
	bh=y8T7uKwp88RKw458oX43TjgLBPGw7XCPF08vtPwEaM0=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=hP9hc5yLKSbPB6mWUgG0H6IXD7Nxf6usvVlsG4kaup2rs5h4i83GgOsni2Sx1rvErsu0ZxsETyXdp217xDW32IjXDOuqOq9SzfMVgQ4dfEw3vm+2CdKEqPzX5vPcmQt8j59M7qwlRU4lNL3JPYVsj5daNTknWncl32ENiKBxmnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de; spf=pass smtp.mailfrom=tipi-net.de; dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b=dacEkFVf; arc=none smtp.client-ip=194.13.80.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b="dacEkFVf"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81E88A02B3;
	Sat, 19 Sep 2026 23:43:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1789854197; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Dsyp/2bxguVs04v4lLYBK6hkBkZbr47ghJs3bwtV7oA=;
	b=dacEkFVf7LzHPxs1J8hrFjwsDbzrHN6G+DPQrY+l1vQofUVaK8RmkUigp+a/oK0eRBiQ6A
	G3fnLvkQ3U7KBYl4yYgZc6ljEqcq4fitMNwExP4Q5HLPCnhOTnlijiAhVbyvQMlyNH6a0p
	f9EFW/y+rnr1XrlLSMRo/u+ckMQdv9/x8u0z1+t4zeSLUmq7Dr/sOIN3+XDN1yv5h+up1x
	zrcWXE0kk//gZ3sNOcToHqKt+WMv68VMnknICJkX/do9Mtxys0na5lSVr9Orw3HkuvtAzj
	/QGUuGJlKW4k190eFJXgZEBEH/QA1HtGy2PXvJyqkszH70GpWflYXjcjqoa2+g==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 19 Sep 2026 23:43:15 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 shuah@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 3/3] selftests: drv-net: Add VLAN test
In-Reply-To: <20260918151225.304410cf@kernel.org>
References: <20260918112529.96039-1-ovidiu.panait.rb@renesas.com>
 <20260918112529.96039-4-ovidiu.panait.rb@renesas.com>
 <5be2136e4142427285566f01d95c1b7b@tipi-net.de>
 <20260918151225.304410cf@kernel.org>
Message-ID: <ff8435132a6b0fbc0f92187e1d9b0f18@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 19.9.2026 00:12, Jakub Kicinski wrote:
> On Fri, 18 Sep 2026 14:04:13 +0200 Nicolai Buchwitz wrote:
>> > +LOCAL_IP = os.environ.get("VLAN_LOCAL_V4", "198.51.100.1")
>> > +REMOTE_IP = os.environ.get("VLAN_REMOTE_V4", "198.51.100.2")
>> 
>>    LOCAL_IP = "198.51.100.1"
>>    REMOTE_IP = "198.51.100.2"
> 
> LOCAL_IP / REMOTE_IP are in the default network segment (vlan 0)
> Here we need some "unused" IP subnet that we can assign without
> conflicts. Getting it from the config would indeed be good, but
> since this is the first use perhaps we should defer until it actually
> bothers someone?

Fine with me. Having the the selftest in place is probably more useful
than re-spinning for sole config issues. Let's fix this once someone 
needs it.

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai
