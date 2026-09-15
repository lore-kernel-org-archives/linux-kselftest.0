Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F3E39EF2E;
	Tue, 15 Sep 2026 07:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.13.80.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459074; cv=none; b=IEOdSZFydWXvQvnvZc76ysDBVGgo39DPznyn6vfuBrepKehocAxWSULdbyZdb5DCt5M3dHCOQPrxn1qcy8jy21Ql+htYsevTSIMoTENjFTjKrUoahDVP/kcJHtz3BHmX8qAHJAF3gpn2/fDqs+TPGmOE+bdBbk1x0JCAocMOimU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459074; c=relaxed/simple;
	bh=0l99T0waALgPrjfW2qsbpsj5p7JbR9M5HcOXGmytLC8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=LAwFFkJPgBY3r/kmEf0xZSOS0WqL2BzB+ckADuzB+FsRrAow6YPbSsObvOBie7ISW7Ebqayr9q0SnXrsAooviune8vMXIEM1c6llC9WPRmFcAkDUjw/DMn26AkQX8fwHadcrSxiX3bbS0crivtsq6OdTRBemtmjSCOBx4lgqtuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de; spf=pass smtp.mailfrom=tipi-net.de; dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b=QWGNtMl0; arc=none smtp.client-ip=194.13.80.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b="QWGNtMl0"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2FF8A47BC;
	Tue, 15 Sep 2026 09:57:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1789459060; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gBfwR0RRDoUZeoZ7n1+Xt6b6cfAwLv4eTWNLHcRoR30=;
	b=QWGNtMl0EZJG8gJGUYE7tlv1s7GdwALf+jdneZ/w57sp6t6mdeh0jM8VFBDT+01XYoNVoA
	2RqEsYnVKxiDmSJG9NXxP7JeL5g6oQ9hG8KWyamXFm1WgTDtNZuiOyoLHByaDYDVblZDFu
	mYGLhJ2GnAgXjYL1ZfAfIHh6aX57w+9KEg43aS68zvPXTJCCfKh5eHQt+YimebSZGtA1FT
	izhiODsM7K2uv+IzX11/wcB1pZ+mFoLo5+fQp/vmcRCdOEPqi8esvDspeRCqH6cEbHiE9U
	Y/qQfU+9MIvRBLTOH96Kk3QDgNIEnLf6ta5UbLWRi6ttu7pKBX6x/fYGDjZ1cQ==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 09:57:37 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] selftests: drv-net: Move _set_ethtool_feat()
 into lib
In-Reply-To: <20260913143926.77366-2-ovidiu.panait.rb@renesas.com>
References: <20260913143926.77366-1-ovidiu.panait.rb@renesas.com>
 <20260913143926.77366-2-ovidiu.panait.rb@renesas.com>
Message-ID: <7c7d299e70b538a9e2f92709161b8a0f@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 13.9.2026 16:39, Ovidiu Panait wrote:
> Move the _set_ethtool_feat() helper from gro_lib.py into lib, so that 
> it
> can be reused by the VLAN test added in the next commit. Drop the 
> leading
> underscore, now that the helper is exported.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai
