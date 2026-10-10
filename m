Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94FA4A68BC
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 13:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637688; cv=pass; b=sMEk8oqbKokVT9WuXS+nSQM3ChI72BfpHDJm+em//xZ7dnlvMd097tInhhxkFZBz8206kw5uHBoDF4Rvz+4LgHweT3J4XJrqcsTunLyNbqDfatWL3TkNU0maJ3Fjo/L1Bckl7hWJPlDtE/j+JukAoFMIkh/mTYLJYDCJRcwWf5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637688; c=relaxed/simple;
	bh=Peoepvw/CV4v2nNzhaOWVLf6PtcCki7ZSzzGuOeWGYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iFucjT0YC1si/EFZ7bDhjG/Zhz3iti/vNZEBFE2NFkmgKR3sIy7zUqlv75wMPJYCN4qQwdKeoFtmLSdeJ/jNg/JNUitYOaLN6CcWQTko8b2vhAiRZUV8a7pJ7eWuAnYw8oS1/7nAmGgef/Es7EoYTg7fktU/6NQFqbOUOZAVldI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFtnxtnM; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFtnxtnM"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a7754c2471so5522101fa.2
        for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 06:08:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791637685; cv=none;
        d=google.com; s=arc-20260327;
        b=Z9ZicKi2qFNroV6wA4quohFMhlZ0jRrYCODXWPBW5J8dW9sfyh47Vz4rt5YnXdDsRS
         c34nLWtKdC+R8oe/n4Ae9rUdWxd2PUznh98LOTsCJ0U6e5rCZHJ2UPlbxNWkgo5s8CE5
         jhwm2r1N+amv5f/fDn72FGUQSIIp9eiZQ+qp+Q68U/qcUuaS4g1giGT3+8eD/fQUYGmv
         JGnNbnTf8ul6+NA5cST7qNnAsqQcCYWZxNoUYsnXbz0jL6v6/hGAkg5e6aDAD9HjHwV1
         bZZ25QtIFPvNnhdpDwaxw0gkctHFRDqC7WLqCG1jnrhaF0iOmgO0MH0w6xGHDimLpHX5
         zwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Peoepvw/CV4v2nNzhaOWVLf6PtcCki7ZSzzGuOeWGYs=;
        fh=i62gFjzhZvpUhgxnEdGT3hD4U/If0x6RDPikiV9TQiU=;
        b=IpLP/Fp2b0bK/LvtWowvk8zNd4BEw9gvdPBWRLR+V2pPaew+lcpp/Qh1xOgL9ik2Nt
         VU2pwE1eUP7vcSAPZEt2NoJ0o1Oe5rQFXEG1jARRJJ3Tj7DpNNq9f3Io1DRrW6v2eIC3
         d83F/h8NiSHmP2my6HnfKapzwPE1gbOLvbinArzUJdx0lDigAlKAzdmzfskStU/TMFXz
         USqn2nYK7klS1jOEfBYRJHyIKYmeGGBEtY/2Z7LJSNRo+m03K79d1wb15xblSxYlQtGt
         N4JJEtPa4B/Sl04F53Xq7G4sQZdS1UbfZf/XtJvdewXw/BExMRuRFMeztf6DE9Sngb4M
         L+Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637685; x=1792242485; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Peoepvw/CV4v2nNzhaOWVLf6PtcCki7ZSzzGuOeWGYs=;
        b=GFtnxtnMvNaq4SJ1WOB/2/nknKlK/HIOBMPtnwnullEMOFW50Ww9QBWYCmB7X+EGIm
         pSLQif0Qbv3ZdpFrntpTwOaGWMdG2C2o0JkHvV8sXZbSN4R8XnWffx3vOLx9Dwokeqbo
         RDvwQ5hWGi4WdxmfelLKMloPxsce1/vqYNjqYxy507UttrM7ivmtQ86x9kDDa1k/sZoz
         tAZO3IZWS6q7oTC041c3vaFT/UaYF0XMJmFX4Ni9CfgYrAWUdyoE+/YprAdKvfUG9Sy3
         t3Cu2WHAEEx/gI2LXBurteS1cJLERNUo02TzfcKj6ZsXzVAnsbbIT/u8w9dCMfKb64iT
         dd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637685; x=1792242485;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Peoepvw/CV4v2nNzhaOWVLf6PtcCki7ZSzzGuOeWGYs=;
        b=Gwtu7ayHuLKXrZqqIbwxFGMLe3Z0QO8LlMYOwngGN0x+V8nuD7pC/87psv5TybsLAq
         SpJU3VPPi3J62WR6d9sqKGGL/PV5nJL5eD7MyuSXOd0D6qm25xWO0hiL/u+0hZC/pFrA
         GZg0KHmUq9uL7irg5pc90yR4HhlVRmC8jKzOP3AIU7j8dWFJT58LnjL2CUtCXtrxeWSM
         2hRUdIE1lqRCNWjdCIbrW03ORLUqK30Nx+6t0haXuPf/yYjlNvlaLrjjFqnKcXDrNwxP
         dRWHgqz3UCnkvDaq4XQnmXVxrtji/IpUGu9qjE/sHTshMU8utFIIKnv0VyQbqh4pjTOf
         +ktw==
X-Forwarded-Encrypted: i=1; AKwUvBzFEvQxKENgd3DGmzEgcpgoxes5rIliAaCCQ0vlNY66uv9T81uwWhQzYfMmVHp+cRh45HxgOEf4HcMCepaPrBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgvYcPZtDiClOJ/oKtiYWZ9PG6K61dU9RV25NQZFNUXa4PWGtj
	x0+gIq3c/C1oV9PkVNKg/TlIBVopJ/jFaT6zkIxC7EHEhBoGwhJ2bXnYxm29wR3Wl1YR2zfCP/M
	zjnGa5QITvgZOHfGxjJSjBH0kOitRjM0=
X-Gm-Gg: AYBFou0b7vmhXHvDR9RmW/z2YszZacXZdEIvJXpd8dRCZV8ovyLkGh8NXdCONZ6Tzm8
	A1zmOrBPfEDt6reVE3mbFrB7/Vq61ALbIm7eBGIW3Hz8iSql6tD+gcc5ZTasM/ksmjzAgqQBkgn
	x+LduTOvQWJQnIAGXMlRBP48Uiw8KgOLb+te4JLW6bw0ajR82AcYnGIwAJy7cfWsxUG9NbYKMnW
	xltT4Pax4o26YPpACILB7KeGV49JnRkk3S5fu/EWUuqfx/NC1flmqRsYwLHxa9skbMN8x9skvqO
	fxHtxSHHfvHWWyQXHvXlzS+oliMiVHHf1SBjoN7jZJJngst74GS/nVgr8HYWTjsPtYwT9TgcadI
	ngdJMj6GpSXyO9H2OZHsTcBAX9de4tds2sFgDqy2pfeDx
X-Received: by 2002:a05:651c:54d:b0:3a4:8913:a259 with SMTP id
 38308e7fff4ca-3a9c56def06mr10678081fa.29.1791637684541; Sat, 10 Oct 2026
 06:08:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007115821.11332-2-sigefriedhyy@gmail.com> <179154712848.434549.1887332518398499959@kernel.org>
In-Reply-To: <179154712848.434549.1887332518398499959@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sat, 10 Oct 2026 22:07:54 +0900
X-Gm-Features: AclHuK-XNxBmVqaX_AVuTKFXpvUqvVpdQ0iJJw8t3L0zVc4v9El00m3OF_1B3Gs
Message-ID: <CA+7S2v+hTzSacfnSJi4V2A-oj5woKA+0ffOA2cY1-7iC_LDX8w@mail.gmail.com>
Subject: Re: [PATCH net-next v10 1/6] netlink: specs: rt-addr: fix the type of target-netnsid
To: netdev-bot+sashiko@kernel.org
Cc: ajay.kathat@microchip.com, aleksandr.loktionov@intel.com, 
	andrew+netdev@lunn.ch, claudiu.beznea@tuxon.dev, davem@davemloft.net, 
	dsahern@kernel.org, donald.hunter@gmail.com, edumazet@google.com, 
	idosch@nvidia.com, jacob.e.keller@intel.com, kuba@kernel.org, 
	johannes@sipsolutions.net, kees@kernel.org, kory.maincent@bootlin.com, 
	kuniyu@google.com, nicolas.dichtel@6wind.com, nickgarlis@gmail.com, 
	pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, 
	sdf.kernel@gmail.com, vadim.fedorenko@linux.dev, willemb@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Should this have a Fixes: tag?

It is working as intended, already discussed in the previous patch review.
