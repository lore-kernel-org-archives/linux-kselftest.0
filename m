Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC9723BF91
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Feb 2026 02:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770604589; cv=none; b=eY2BKpxdIniRORhOF9xFdpafBQT7E2cnKogeEGCDuCDguy1V/kTmgJcTuOxB1AR83PMbYSIveZCZmgYbQAUEvRyl7nOtYs9B5F9gu4YC0pfwrrIsfs2Dr8pAbfQgMFPZBb++wT5CC7P4SRxAGiwIntG1JcQWZNMTF6odoUdsg0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770604589; c=relaxed/simple;
	bh=kGH6l0rNT5LVm8Xr4TLlUWZvLKhE7Jw26DtjfMd1vVM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=QxJKYrdUYICmoqtuYNLe9rOm11MHZqRZErBuTbP/LV43PmvZ1SBfszhYHYFULd3zcXNcTvHgn9fblGqDJDspbevElUrOV1VX5VtxZmSRvcbPCLBuju8+bFAEQN1LH6vBxoPlPDlQvLNKwLTTt2L718h/fHFrYffvefrvwW+EioY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbXKQFTL; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbXKQFTL"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-649db2b6cdcso2169436d50.0
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Feb 2026 18:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770604588; x=1771209388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9stMa7KwLvBDX2P3Y2Txs0J3hJrlNNbY1m8SALZZMjs=;
        b=DbXKQFTLFJr4PWf28aKl7h+h5fwchvdweLw4KwWrshBTjeRxPo/lC6uuSsCsUQnQ73
         9BfAmALhKz1xCRrMbFNoQi0goUxxBpil9CIKCaCABY8lPnxSPlmLJNOTUJgsJ7hdIM17
         x93EWf2wNPvyHo0rG3cPVJ21UlZQnhMQFuxgTR/H2PtFotpuIBPBp8VITxhS3q+xyO4B
         C4YLAoZAckWDzjsX7qDVQZK6xqtupprIFP/1miGgWpRLu7fmFORta0KCxoGKEvxs/SUZ
         aPOe7KbXEsq9qLby5a+J2UHWG7zqBh0uzaQZdyttqFA6ezYIMUdOOqJdWPvSig/qG45L
         pRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770604588; x=1771209388;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9stMa7KwLvBDX2P3Y2Txs0J3hJrlNNbY1m8SALZZMjs=;
        b=ou34ZsRTaXVRSYDKN8PgJEr4iYQ9LYTizVqGReiHYeuxewte5Q7v5UmNNhM3BBoNU+
         YI2JAyTRuW5X7Iy7dE+zT2nuMx+ArOPngLKT8pcvVS8b+EO6jcwu724FHUu/P5I8WRw1
         S31/BuetC7ifrXdXndSR+Tn3VB6MfNcs2AJyAFTgxRsBn3FHAXiGt/Id4aWY2vjIhA+w
         u1og58/Ukvr7ewLGfOtblQ/oTH6lrUpXuoLWEUNZIwOuh5HwlaBj7B9jl115WARt9dH7
         PtD9tDElgmnOrm7RUW/ofb3X5DEJ6RmgqnGjBh3K496RtztoQfKHimIE8FFBOv2LLJdu
         +AFA==
X-Forwarded-Encrypted: i=1; AJvYcCWq9tb7T1nqPX/S9rrlBw2eJ1MTp9bOkUnu6ERS7oXp2DFLItwheVY3rqE4OZ8GxLn6sahq7Cv15Ln1SXu5gT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPIcnWvHiS0TD4Afcxgjr/lhR4Ckg1xyf+vWVc1jyXQDaIVMiY
	2Is9RAQKz/0JZirr/WPK2Np2oDVOacmFISn4+TgJnf4z3csefIDIXRY6
X-Gm-Gg: AZuq6aIj/66jw+orLVbQhHxwd52qVNaA5m9lDeTLA0mPbxLnUcuEUom+nYt7c9aws8G
	UIrQzjJs1qRpUd1+QbgjzMsIobBjzJtai7kIejyTECLL/RYHk6MCjYrtvyrn15M9V3VY69sde01
	HmrdwpboTErDtBhTyTpXnkRuM4l6c+imjsgaNao1j4yptRYFUBFfyzb+nP8n2lI1mOZVJytrvv5
	9ENZnyVoHeReSv5v1yVJCSrNC7whA4nEcw42iwl/LbYxxHjZ+1X7POpJvPLUNa9XU+HKkaHBGDt
	4yNjdWck1wlw38vEO5ok4py94w7rMeJvCN3HxNWZgFF4SMHbvcA5Rl+oXAJ6LOrrpGiqXN8ssYN
	fD2i6VYckWbWbEghEHArJxNboYvshcIjFWms7RULlznKlIysePn/oLONdO+UuOO1Kosf3c6ze8j
	Nwyy3Cqhr09I0B4WWTnefNtMJ5zg7Y1iV/D6AWrMo0bhVQG05rrJ8+gh9/k2Y=
X-Received: by 2002:a05:690e:2450:b0:63f:add1:e6da with SMTP id 956f58d0204a3-649f1f594b3mr6505572d50.57.1770604587805;
        Sun, 08 Feb 2026 18:36:27 -0800 (PST)
Received: from gmail.com (21.33.48.34.bc.googleusercontent.com. [34.48.33.21])
        by smtp.gmail.com with UTF8SMTPSA id 956f58d0204a3-64ad8a12432sm5352745d50.21.2026.02.08.18.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 18:36:27 -0800 (PST)
Date: Sun, 08 Feb 2026 21:36:26 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 davem@davemloft.net
Cc: netdev@vger.kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 shuah@kernel.org, 
 willemb@google.com, 
 petrm@nvidia.com, 
 donald.hunter@gmail.com, 
 michael.chan@broadcom.com, 
 pavan.chebbi@broadcom.com, 
 linux-kselftest@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>
Message-ID: <willemdebruijn.kernel.2cac56bd3c52f@gmail.com>
In-Reply-To: <20260207003509.3927744-5-kuba@kernel.org>
References: <20260207003509.3927744-1-kuba@kernel.org>
 <20260207003509.3927744-5-kuba@kernel.org>
Subject: Re: [PATCH net-next v2 4/9] selftests: net: move gro to lib for HW vs
 SW reuse
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Kicinski wrote:
> The gro.c packet sender is used for SW testing but bulk of incoming
> new tests will be HW-specific. So it's better to put them under
> drivers/net/hw/, to avoid tip-toeing around netdevsim. Move gro.c
> to lib so we can reuse it.
> 
> Reviewed-by: Petr Machata <petrm@nvidia.com>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Willem de Bruijn <willemb@google.com>
