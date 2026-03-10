Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3875F74C14
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 00:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773104082; cv=none; b=SQwt6+F24xQd5URtluf9sO22AMexXb2yqny4k6L/Yg6djFJRy5HiBYgCDMjaF8+/ZTJlGGHUc6ZeH5zwZ9s/n4AYMpBUGKL/Lq+ZJaaY3ZreRd00WYM31Jk0avV10rayh+TV8pMjq5EWAGvAmGPh0+xCugTk149oYWYyblVs/Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773104082; c=relaxed/simple;
	bh=q/3n1xERGFt9pBxbxus768OlQpVMYV691SqiPTwnCNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=auBtzmJSoR1XdyS6Lpn0A4cTxlDMUjVZgsAjwF7YtbZnXl7L+UsJ6B1HmURBxkArHjuCI4jdlzarAfWl9uKn6Mx1iuEG8deQo2CSury09PBHvA1LYJDqzaNZe9zHfF/Es8z/mL0AIrHCII/qS4Kd9uwX4J64CgFXTRLn0FkUQ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=CBZ2lG81; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="CBZ2lG81"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c73bb6662d8so329659a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 17:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1773104080; x=1773708880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgT23yH044LlGG/ozIQ2ZblhH3i8dVPmq39iaq5VJ3s=;
        b=CBZ2lG81bVnNT7LA/ta8D0fvNT2TDXGpNjSvtvazaOwRtHN5nWBk8Oo+JbJ9zhIeaA
         aCz4q9UQz28WV/E9zJXXXcr3xK6wMEfoZ9DFDNIW/QDsDXgTNwVRUPIzK4elvUT3LydJ
         HIaqTRoIYfnj/xPYUtvkgwTHci7hu08LYUHZiyDl+gXz8lSEDzyldtJKM3mkwgoFygv4
         xy3/8I9+0+njhiqGv4btzbTbKWxSk3bhsGCy7VnoODoUDbKhiLhl2qJuMgXglE1QgoiA
         MjADmZrbYXFp/g4KkT1Rf9Ero1slR2P00AcuixHPNEfVXIKq5nve+rGR1Cfqvf4+R66A
         NSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773104080; x=1773708880;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RgT23yH044LlGG/ozIQ2ZblhH3i8dVPmq39iaq5VJ3s=;
        b=Hn6Vj1aNkfZWo75kdu3xWekwRSuUCyAPAXNH9Xk+n7HrXIAEVW+gCsIQeaf4sfiFlM
         8jmZ3xPwcWa5kKJ+GQ2364VqvX2YT9S4Ihz/qmlIzKYZG6cZcoco+fgN1N5qwGZDcOUa
         Mcbo/2flTMmQZTUndJROFFxb32TnasEooaLbsGVDihbkZ8mbW4Yk/OINvba/E/kiZKaP
         KFH8Sq7vcZnekyZbEXXbkMaPBKQq7riHv+dkuQJJgxLKA8f3r4WBuO+/UekZoWBC/+o2
         n1eqcHDiPFALXOnu69yPCHMS8lB6IzaYa/Bw4/VVA36xELXIQmdJPT0EjdybiE+wpySP
         Zh8g==
X-Forwarded-Encrypted: i=1; AJvYcCWuCBm00D3zy8SvcKiOlndIxtJftKSvHqRp4WEGutlzWEHWa9WPiIrzIVKqdQN9Fk9mMQamUrLeiYRLoq55uac=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZwbXnIH3k4jogKPhyTT0FUEWChNuS4c+FBJoXYinF4wYVpUQ/
	wrCmZITyumdkS5c3QVYpblAzC32XkEXk1RRHgDKHwX+RCxKle2Q+6s1k8AtdA91oeQs=
X-Gm-Gg: ATEYQzwvxMLGdaSLzZ7HTx64TPT5yEkfQr3HE4kLhwSHG/8M22eHtWoIgwDYcNU1uZQ
	ZwZMihRbjmni9eZOS3zVeknsPPa9ruZM0F1vdCZVsVMsUevOsA0HzoH8jiAmtogX50p7YCEc/m9
	DYdvAT9rpZX3oeJ0vpGzUGoFfHsjF8pn3KNbc4fE7/DRwKeKfeA+pKtK5z7xQFyo+htaYbzYdsg
	mmqDImhzZgF0voXEHfCJu0/b7Ml8ftXi/GRji1vDpGW+zrEYG3KunAlFgCFJ25sAKJu7jFH9W30
	wGUY+5BEoLLNAuDVCeUNm3u0A9aVLIk6F4qCLUw7txd1seoxccrNW58ygufdJccsLNPzD3Bf6ou
	bZtZ0D1nHle3mYnicAXIHJIWLfYgH5O3CdqO89J5PjyZ9WbYDGc/wTcZOUnKKm/tGnf51f1mia8
	79KJI=
X-Received: by 2002:a17:903:2c0d:b0:2ae:5bee:f0fd with SMTP id d9443c01a7336-2ae82530643mr146551245ad.51.1773104080629;
        Mon, 09 Mar 2026 17:54:40 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:7::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840c9967sm167614145ad.90.2026.03.09.17.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:54:40 -0700 (PDT)
Date: Mon, 9 Mar 2026 17:54:39 -0700
From: Joe Damato <joe@dama.to>
To: Chris J Arges <carges@cloudflare.com>
Cc: michael.chan@broadcom.com, pavan.chebbi@broadcom.com, kuba@kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next v3 4/5] selftests: net: move common xdp.py
 functions into lib
Message-ID: <aa9rz54M/NXPvDbw@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Chris J Arges <carges@cloudflare.com>, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, kuba@kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org
References: <20260306230600.1628196-1-carges@cloudflare.com>
 <20260306230600.1628196-5-carges@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306230600.1628196-5-carges@cloudflare.com>

On Fri, Mar 06, 2026 at 05:00:19PM -0600, Chris J Arges wrote:
> This moves a few functions which can be useful to other python programs
> that manipulate XDP programs. This also refactors xdp.py to use the
> refactored functions.
> 
> Signed-off-by: Chris J Arges <carges@cloudflare.com>
> ---
>  .../selftests/drivers/net/lib/py/__init__.py  |  2 +
>  tools/testing/selftests/drivers/net/xdp.py    | 95 +++++--------------
>  .../testing/selftests/net/lib/py/__init__.py  |  2 +
>  tools/testing/selftests/net/lib/py/bpf.py     | 68 +++++++++++++
>  4 files changed, 95 insertions(+), 72 deletions(-)
>  create mode 100644 tools/testing/selftests/net/lib/py/bpf.py

Looks unchanged from the v2?

Reviewed-by: Joe Damato <joe@dama.to>
