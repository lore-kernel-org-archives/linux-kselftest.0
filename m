Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E195867F5
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 14:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964353; cv=pass; b=N5udZnuPgkaUcGrXHp6n66jsUUvt51sepTTiN2pIV+241xQeT9Chn+9+F7R6Gl4W3l0+JFzyDlrKUdZhoGqUWtXAB7OLwxK9dNdGOtDNgbJg/pEI/8F11me4q0LCtSNgDJl+j0OvgOTZ9nOPwwGsgUX6BgayMhyVZoxxv2QqbV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964353; c=relaxed/simple;
	bh=pD9TXcj0deCwIDSY/gHovc99tumuugoF4IfHylmVrlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DJlIhQddt5rW3Hg4jqkJ6qDH8GpxClTQ+HZAENeb5iR5i3J10Yud9wAovYm6LMEWsq35XkVrTia+ZEHMw1Q/v4sZhbZHqub8gRiuVamnop/olp/OhEwHsP8k9kMVZKzQrp8GclsFkxRhSzfTxBk5r/pEQrqsyCrURXQOS34a7OE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1R1ZLO9; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1R1ZLO9"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b778bcee05so615630e87.0
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 07:32:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788964350; cv=none;
        d=google.com; s=arc-20260327;
        b=Biw55HUckDI6b9d9wOFK/ToG2JwmGLaVQ5csFPB1hvwbI9KD1ZYLSNcTxmygzhZ/Ko
         uGB/klJauLLu137oeLlpoWL/7D4qMB82enq+QiTddVMP0iZiVwgoQ6jSnkfQnQ3o7rzu
         +HHW4CoYUKp/gGTeE0TN/Ht0rDDwksVeOAtnuVUas5KccYLLU9Ft0RG/mViPkJSOvtml
         tl4apZP/feD3zjMxbiyggY8Rka1GchMAx0LDgMuqSts7zJMcusmQfP2lxCb8CmzFs4wy
         wdlniCYk9g/INVZjLYb4Kovb9V5V8+jvRNBz5fYZwePYWfuyu2MoTbkEpLgxwg40Tw3a
         07hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pD9TXcj0deCwIDSY/gHovc99tumuugoF4IfHylmVrlQ=;
        fh=9cMbset/FRzj7Ylttlg5qBfGSs5x9qb7qYJsieYGDtI=;
        b=AQMw+KqfFceDmsMV1esrG2+UZ/o/Tbk4UiBMq1w/5hQ0/QPBjMY0RPJtMG269GlV25
         hhVK179Wu0EhAQGvXqagP8I0/hWQFOwWQE+8V5goQ9EjEf8oGUSlTxQAUmBsmS4b2Mta
         wBv5c9EJpfpzYUk2kqATA2rYZyo3xhR/hO06+31P/9gUDqSfxUFH9E9uXGs5g8xx6/as
         LG/2rkDz2N0JtjBQn9TH6KlZIE1Z25hMIWAzifkxDNbhEdmq1S1Z4cn/GU/pAt1W31bk
         j1dN/MMk++vq3ipB9I/HRbm5bTHxo0RCACoVxMXifTVieSXWSEvK4yF+6nRYk+mckHrr
         eTOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788964350; x=1789569150; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pD9TXcj0deCwIDSY/gHovc99tumuugoF4IfHylmVrlQ=;
        b=Z1R1ZLO9tIz1bQmwyqzaZ/GAiWR5AnitqV9Nddx0whC5cxMRaIIsDA7EA4xsINKKXP
         MZcCewVY1Ye5iqum1Qz7AYnunCVcnnYpqr3ctUmQ9iwZCrwNxpbMhy0mhhiDnX6JP62f
         /RZnfha0AuX9mSKCzJb47a+mhAsIHU0763L4AF0lqdmZ5gIzQrPfEgQeI59/VRIzW6fY
         09xrBJcsqbtr5Wxdt/jb0MvZFsIfxhjmbildZUi2H7xCbYBlhj5aDld7B+deiluQJJ1j
         p9nGsFmUoYifuG9Bx365VPdnIaWiO6dzwH6S1XxIbcXBOKqN5xDKSpI6e0Jp+913wEvw
         OIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964350; x=1789569150;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pD9TXcj0deCwIDSY/gHovc99tumuugoF4IfHylmVrlQ=;
        b=Y7kH377fK3DmxDho3aa/hfnXbkCrX5u2yDR8w4Zplj4pUccANbUcVAFGWLXpbreuni
         2GajnWx7h1BCKeIqp8D9dQcpMUT6QzUQkDC3/Wn6i3EHncN/g/apuVKpwqwqEgEm2+9T
         eF8mnpxGmXcuHBiIHO23ikmycMRv6I7oNmJkLFvw0CWPwdwPeOw12DprC6ZaTSg3AK50
         KpObuAPJMWVJ9Fj4TTGC1tvoAqZo9B0XzZwGXOXL3k4hbx3n5hfm0yR9CAHC3CUaMhPU
         PLSl7B4Jl1xC7fKwvMlyuRvoaY4kfPuW08o44aKycu/UNx0+k+yMinGG1ppHZcpoIDzK
         6juA==
X-Forwarded-Encrypted: i=1; AKwUvByXTwJA9C4d39Jhd0yni3U/DLohmUcYmUdulWMj7ZtjLw3EVatl2UXlpQbCSNy/WFDg8c1fMlJxr3xGnR65tEg=@vger.kernel.org
X-Gm-Message-State: AFuF++lA0XTZppWPYDFaf7W1peiGGoDHB3Wpx/N5GbkjJBA55xmzvsM1
	WxpRk5gqygJG+DAFSBVLs+g+VpPgmjN9KbrZeMmktpDXUEDuBMCXhNBGz11MDY2yPYG0EWzdr9T
	/0gR1o8Ha4ZzoSVROmj7l7QYBylUA8uQ=
X-Gm-Gg: AYBFou2gF1NSSDttrK16l6pEBdpTcG1ZYk2oX+uBFhkWD0RsJz5FwciUvAf0hxO+3pl
	Sh6kW0sW0lNrRIfFHOoSrrnrBdYveD/MmgVlukrXKGfG/3ammeuVFMKo0z5pxo96QDSo0Dda3NX
	ZqpsFYqWH76I4OwIuO5SUfCmzdMwqQ1ZVLxQJbuEc6P1X9cU9K/SmZEVzJaAeM4hMeXWoCFP7lg
	7fBtDQq/LROYEa/HFNPwlFbSabmaQA1O2p/RXDD2NAaHH0FyBtEMBSaS3uRZROHLdr8iEMQL5Z2
	MIzLkdRJptcsguikwv3LWjw9MGkBoyDgSa/a43kWgu2qyDq2D46GTcK1Swqxx2nHVGzGgibyInU
	NkFtwr2a7qcZlG0Lo9GqwvK8VB8Q73rM/E5+mUtzZsDY=
X-Received: by 2002:a05:6512:2245:b0:5b6:186e:b79a with SMTP id
 2adb3069b0e04-5b6186eb973mr6080393e87.54.1788964349854; Wed, 09 Sep 2026
 07:32:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909133247.113923-1-sigefriedhyy@gmail.com> <ab826712-6255-4e9b-b6fb-f6f8c380e779@6wind.com>
In-Reply-To: <ab826712-6255-4e9b-b6fb-f6f8c380e779@6wind.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 9 Sep 2026 23:32:17 +0900
X-Gm-Features: AcwNN1U-zJe9KiEEMqLOKTFtdT1jP5RPoJOJuwn6aNuKHcG4DvpUskIblRkLEwA
Message-ID: <CA+7S2vLDaZG=VGzCYWbGUybE=fJyzPoBdM-Wz0T0qp4Sa_EvGg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/4] rtnetlink: dump link-layer multicast addresses
To: nicolas.dichtel@6wind.com
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Ido Schimmel <idosch@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Nikolaos Gkarlis <nickgarlis@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Please, wait 24 hours before sending a new version:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/maintainer-netdev.rst#n15

Acked, will be more careful next time.
