Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0E119992C
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 20:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774990182; cv=none; b=J2gQSagfrnHNknltdgqYL3zsvcbLEUUGGrSLn0P7uK66hHUoW7bPXrHEvxNqvLox5O5/2+srxJ0gCpy9S0jT9Ar22G8WWwS/GrwgBSxj0QTiIoLVE1U1BpTa7oyylaCFu+Fc85V5ALt2oSfDDnVNXJCqjP5xffvVfVTn9bDoJbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774990182; c=relaxed/simple;
	bh=q05KO6AWrjG/PgJFYBIJXv518zshm1joyl8stcuBMMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+k1bf/raIAYcDyaG6EJrkCwC6llYJ5MKbityO1UxmdlQi+Wrw1IHzWjFvqh8V9WA1R0wTv1OY2QZi+metk5sZblqZigG3/EspqjIaguxIyIdRXAoPVbJJyBKQFH1O+hixej9Iso++nhSUEHuzv+wLpwGJ3OHTeXkqGmNbRn0EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=B398pkOb; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="B398pkOb"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82a07738118so3478564b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 13:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1774990180; x=1775594980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5A5EjfwtiNR9PDlV9xKftKv8ZO5lHwwX8xQnpG4je7U=;
        b=B398pkObkhSZdWcSJjhwg5Nto9BUX/LWI/4vtIGb2G/mX+6g7sVdHR1DV0NDPmhsGJ
         pUOxjMaqMzcb/YIdXHd259GhM3FCX5SeFZ+yWbNIQ+pLuUsUrfHQ5uDsyBApnrPJ3+YV
         FC+kcEYlkzxyz6dZhlnFrjQL9JSjRtZPPhCWMSPOxISJk42Hc0GrXmrYiIvy32us0s8o
         7wE44ePYFPfaAxpD+qmt6Y/JH10V0y1W2rARlOYx1HHypZQ75gxDOLtx0ybvUUIFpO3A
         IQ6iRmo9z3xhiN/O+jzrtOgbclSaiBj0uDEMulZKxSk5oh020jysXML3NC2CnECe/NQv
         W99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774990180; x=1775594980;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5A5EjfwtiNR9PDlV9xKftKv8ZO5lHwwX8xQnpG4je7U=;
        b=Bzysmt1zIEfVym8n+WkCeiC92KahTJNfm2KRQCqTkcvWRio48T65w0fpA8RwV6YjHz
         daBgqKpya34I+6Rna8fsTvyEYfJJmxlUKaAO/j+8371bBxXdW7QOChxCGKXF/BEc2SFg
         1Xkg+GEuAdUF1BRpXDWY6s1q1fOdQWMIwjtuMI7O9sIQd7gj6LM49KqL+bUDT5XFYO7R
         dMi9SO7Ip9xYLIXwfjXkltfMWGrQjibrasegpgTzdOW/ME55LMV4zQnM2Y13qcI/cWHI
         aM/OOpT9GhcZEjIUPagfpUf8ZhQKHQAf4M2YsKQAI1/tqQh1Og9vVYoMnGp3NlvEF8ki
         8Upg==
X-Forwarded-Encrypted: i=1; AJvYcCV0DQ6gcC+iTN80mw+RyZqT/MNSHFag+QRNhEHhujXQ4d/4LyKyLIox771jVmHqUyske6uKDFDhvlXuBSPGwH4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0hYBiH8pSlkUlrbXP4Xwnx2u5oMyVrJQjUkwssO8M0z8vJsLt
	/UvlRrnrTcutv3NsCeECIgzS7Ta9P2GEaTSBwqcr04RfYS5JRyeWSETbUTyWEk6go1g=
X-Gm-Gg: ATEYQzxIvPmu0IdPzBrn41PHRzF6n8AnKJ4/NWt7tOu+UaXb9XSyLco+TVDnmd+wssc
	xpIeksVQkk0d59jEMhixXbAQI1uhwzgabyK/E2k5jHDuYvvJepQWge7dCtaK/+bA5UcgR0udJiX
	wqA+P5jhNVQDbw8aS4hMUhpX/atwPtFfOkhWYVyZ/nEhGeEMEIEd5SQN6PsrvO0upPzY49RMo2m
	g87JnfyM1R0Hn1Y7x1k7MTDSqbmb3hNwDZ84uQTxtp8lX8JiHZG3NFmzn+fqhRzVNSY/wVio7iK
	gjGUBNCZ8BWEEcMNujiufPDiNT6Po0ZWisc90cHavPsF5oNLVN5nqKhdKWMZs8jgjxPk8V+RLEW
	+cQjpCQDgVSD27B71+zeqWZnJwEr6dFbsua54EBIE27frMGt2htSz2qt1coCE5rndOTmZJHL+y4
	YYQKI=
X-Received: by 2002:a05:6a00:600e:b0:829:7d31:dd99 with SMTP id d2e1a72fcca58-82ce8ad166cmr912616b3a.38.1774990180603;
        Tue, 31 Mar 2026 13:49:40 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:1::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cdaa4c3basm3171819b3a.37.2026.03.31.13.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 13:49:40 -0700 (PDT)
Date: Tue, 31 Mar 2026 13:49:39 -0700
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: drv-net: update the README with
 variants
Message-ID: <acwzYzMoKSoDqnaf@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
	linux-kselftest@vger.kernel.org
References: <20260331001930.3411279-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331001930.3411279-1-kuba@kernel.org>

On Mon, Mar 30, 2026 at 05:19:30PM -0700, Jakub Kicinski wrote:
> Test authors need to know about variants, existing tests don't use
> them because variants are relatively recent.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: joe@dama.to
> CC: shuah@kernel.org
> CC: linux-kselftest@vger.kernel.org
> ---
>  .../testing/selftests/drivers/net/README.rst  | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)

Reviewed-by: Joe Damato <joe@dama.to>
