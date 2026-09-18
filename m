Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C914C226E;
	Fri, 18 Sep 2026 11:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.13.80.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789732290; cv=none; b=K90hBuB8TdyDXBZNdtrxWhi17LdR2UdNqP30eX6AZM8GguQwsFU74lqeTQ0IIMmWgt1AyYWGioGcmCktuDjqD5tKPyPWccl2buq3tqBJ7q1PUAp+1tBhCCUO9+W/+tDVprQ8+bhQs/Vhzp/Nnsb3G+ysBMEJOrbvPdJIwBHDP44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789732290; c=relaxed/simple;
	bh=jQj8j7/MpUHFoOIcbUDA4h6+pn5febKM1rz7kTRuPNI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=RCMG6ON7x0gfinGwmPz3LgeGbZyAxChXx0sxdsSzUk9wXuM4YF3uGaKZl1EyWFGHJO6sk/xt+u812xzdukDGt0JPOuRi3JCCIkDJbjYY5fKtrUnaZmaf9zB/bQJ2euXimGSLspVduin6J9eR8G2LgC4jRkp0aDeE5QqRXsLaXJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de; spf=pass smtp.mailfrom=tipi-net.de; dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b=uDfZOzDV; arc=none smtp.client-ip=194.13.80.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b="uDfZOzDV"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0828EA50C5;
	Fri, 18 Sep 2026 13:51:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1789732284; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bzwUFzxNStbeC5AJy25lOTYmfriyH5qibHDFZbGncIc=;
	b=uDfZOzDVNpZDIVekSq3KLiHLs3l4EQU+uW/bCecH5URqdBuck542vpm8QEfIOFr2OlyM/r
	AN6FKOqrnnCC+C61f1xrVg15dlUP8uNv5eFJSlPOvXnR764wbAmuIpSahsInRWa/DsD9ue
	TlYjO5F3qHzsd0M5D+eFa44SGH8xIBCxIt2/9rpzcLEaJjKZ11DUAGXSWEXNfHOzPltFFj
	3P6+YleNRyl7vR4RtPVtP9YfZYp4UXU/NhG1QE5q/VyNZhOGFPNpoyJ80hoqP9qMipSbIJ
	KH6C1jeEMlFkXBO8P9+N/yEqYfGfZ8MSQXYoJDNLh6BAYqGldUE/i8fUEEDsXA==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 13:51:22 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/3] selftests: drv-net: Check the features
 set by set_ethtool_feat()
In-Reply-To: <20260918112529.96039-3-ovidiu.panait.rb@renesas.com>
References: <20260918112529.96039-1-ovidiu.panait.rb@renesas.com>
 <20260918112529.96039-3-ovidiu.panait.rb@renesas.com>
Message-ID: <fa78063df06ec598208eff3d9708c38d@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Ovidiu

On 18.9.2026 13:25, Ovidiu Panait wrote:
> Read back the features after running ethtool -K to check if they were
> actually applied. The drivers might refuse to set a feature silently 
> and
> the test could run with a different configuration than the requested 
> one.
> 
> Add a 'check' parameter to skip this, as the GRO "hw" mode handles the
> case where HW GRO is cleared by the driver.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> ---

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai
