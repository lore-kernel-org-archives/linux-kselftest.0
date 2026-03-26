Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14025330D50;
	Thu, 26 Mar 2026 08:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774512788; cv=none; b=e/J5kw3UlavVa2lIim36gWmEHp4c83seh3N1N0+wFs8qluSLDMYgydeNyJTPCBONOZcv0B7RLg/jIeeehKFdprIhmshF6oqMBDE0BubqHk1C+P+Db0jEnH0BEZXOk7WpT/5pYUx2RuiVpoNZuzsH0DQeneTPJfuX99p0FSu8nlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774512788; c=relaxed/simple;
	bh=6GExDGQI/3QGFivYHUgOFHEPsIfdkUYYZTuBLYSd7cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zygur9PYkh2f6Q8ZPQ/2RyJLsXZA+FFpbhtZ0zuOtlo9tVONdYK3ie3TWNp9liHd8ZUIvOqykU/S2QAwYZpslVHuts4JRv+gzvF2mEZe7JpD4FxGbE59eQ4DsKPyLfK/8jMXsN4Ha+l19qwVZ+GD0M3q/o7/+do6NRqZH7XUv7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MXmHJzC6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xlxfbGVw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MXmHJzC6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xlxfbGVw"
Date: Thu, 26 Mar 2026 09:13:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774512785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6GExDGQI/3QGFivYHUgOFHEPsIfdkUYYZTuBLYSd7cA=;
	b=MXmHJzC65cd4fafY/pRYnbIrD0ch7BtN+aNnVLF0duKLMLvbRZbnONCpI9P39fBSkAQwz1
	YDNqyrnDcL2/fbrtBqWiu6NlOW7NaG4VXLXAcjEXOdU5xxnGnCC+EXc61F2Ybgks+71X6h
	bvJ6LJ4iOE3C77WdkrHRomrZaNwQPnUEY1+25xnChyQ++j0+zWhW5o059zxbcTh6ESe2L/
	hSgA+Ii0Mxt8fRvBrGM/clr5RmmAbw2GNsBpdz6r9orhEL1FU4d+Iuzcazy0URpufQiM3k
	Z76boD0SPOQa6o0Zv5fbIyWdLoHjFqkijmWBtZGUUGCBcTL67pirJHkmThGi5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774512785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6GExDGQI/3QGFivYHUgOFHEPsIfdkUYYZTuBLYSd7cA=;
	b=xlxfbGVwkBC/VLUUzwV2QVlQiWfrpUs+j10r+TGgn2Uq+LhQ7vhsXMUV2QKjp8a/sEjISD
	jJ++wJeWbUioHqAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Felix Maurer <fmaurer@redhat.com>,
	Antonio Quartulli <antonio@openvpn.net>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
	Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH net-next v4] selftests: net: add tests for PPP
Message-ID: <20260326081304.xKa7-s_1@linutronix.de>
References: <20260326021642.29170-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326021642.29170-1-dqfext@gmail.com>

On 2026-03-26 10:16:24 [+0800], Qingfang Deng wrote:
> Add ping and iperf3 tests for ppp_async.c and pppoe.c.

Oh thank you for doing this.
I haven't look in detail but this cover the "invalid loop" cases that
ppp tries to catch?

> Signed-off-by: Qingfang Deng <dqfext@gmail.com>

Sebastian
