Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6774B33FE33
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 18:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788373470; cv=none; b=pG9Wtk8mRqeMJuuj0fUgxoiMfkC4l7LOxl6rwR8r/l7ikrRW1LXZU264XWrvQuX5oJzL8RkT5MWLG+m8Y7h4su6iDQMGUIstqrsbIWRj0MYeNpSCoPuInRWQVtnUnEOcsmvwm1Ui6mC06FbSXfQevkNdorVU7x7ojMPQ4wH+0zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788373470; c=relaxed/simple;
	bh=Xxq4o3qMxPVY2RpEIPpLOr1K2BMPwKY7wG5A7DWgTkE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=cj8fKY5s/gpHHeG4wQkPgqIL9fxjAEaGmzwa3C/eQcn4UU+xG7v3bAaK9LXtxVsn0Pa/snF2e5tdWvJMV1ichl4aOMi95t1QyTscBS8NHok6Gjq8AWR4JRsdyE3T1MGz3rfXIDPXGGoMVTYEvOCuHdIm/8qkMHtFF/uGDOsIRao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oazeUFEz; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oazeUFEz"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-86a29a48ed9so17671357b3.2
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 11:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788373468; x=1788978268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o4tO+LhSSXLcFLBaIQklF7txjQB+TEfFtyQ8FGsV04g=;
        b=oazeUFEzubs25KE40AVuu4FJAp2YhEcrARLHM3cjLCWeoNMkAe3MOQIkf+bvfeXPNw
         3CBn2Uk6SvWFfADQYpORXh0nnwhYIn43Pp/SbsL0Tukt/A4EuBWM7XDe1FPdijzldiRZ
         En4g/H/nwPSoBBdK0O5aehbYv3jb7POVUxaKC/S1mUI/vK+wHU7ACMjbFErO8eBTBPyY
         ZfA/HvQM6oP9mEKdSNeUURxrsuV3NbNxplQjGOjNHMF3jICVY7M5EeWI7l0S9SPy7lcn
         TO8/OR7W4jSNKvkY3QcayWH0SrgzhWqz5vpaZuRds1rnFTt0xcl5mND+2CuIJPjPjllx
         D8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788373468; x=1788978268;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4tO+LhSSXLcFLBaIQklF7txjQB+TEfFtyQ8FGsV04g=;
        b=VO3mLsTJ7QsqIsV46v9rz7mybwzVKVDUYgyzWw0obncKbCNj6Hy1afBN5wIMeHWUaB
         IPCTk0CU0EJ4CaksrV2+P8+/6juJLfB6WTk7VQEPmgYvT2YmM22VP/FD/5X60pYsBmbr
         mvstRMlvDjUoFYarG+mUoztg4YFaO3jaejDaa6RZo6TFzpiQVHIyTyy7M8ZS8iGPSgkt
         vCVJHL893xTBo0uDAE8F+oGwk2c26I7XPGgtTEAeKkHYtYQdLpa6NGhERGXuZALT6AFK
         JZAYYAjfCBUMqtFcM+BvL06vMZSGeAmRKow9F5hC+IWbaWJ+jQbAHzOT4t0GgvSu/KtG
         BpWA==
X-Forwarded-Encrypted: i=1; AKwUvBxjqHkH812Em58z8upgmDFE9qexGjG1nHbpXFTEDGNOTHLB+wNq5HSKKB9RO6sdkZnvhr1NR5RZD0y0UbPL1Xw=@vger.kernel.org
X-Gm-Message-State: AFuF++lM4cME6BSfyvn6a6dH4YLKoRs2TfTaT88xniOpsnkMiWc7iE6H
	YAgmEmi3X7wi0Z0eLj9howtfDo5iipxbQ7fWyUc6/evj0Xe9I6eJFSce
X-Gm-Gg: AYBFou2NCKCAv1GYx5ahtMFXqWEvS/YiTYbrbcm1iDVAyyQ6sbJXKGxcIL1CZ9G36/G
	thziSBucSFqBVSJjv458K+m/JXfoA+DO4cLTgnf8/mFuMsQkJ0zFF4lqrnqHDvVbCBakb1AnJ62
	MC1dkCEuw5aMr1zCxA8w4XdyzPtiIsa86zMoOE46OrFrs1y2yvOzkocUuZtuL3vqo2WmQcRvrxv
	C2LXolP9CydkNgzmPPSA2deCIvlJe8Fk0tJUZPejZKg8zI/R3yrU682tpXQrSEG3XK2DeBIkPSa
	WQ2E/NkW4feZINtVJWK3/dS0ei3YEL4Yghwze1JV5PwZ45G52lne+lUyVc2AVboHnyd6o9QLvcA
	AvCTEN50hLXySmNmR4yeDbJUONv23q4p1F94Rg4EfD318QxfygFMk5BYNTtOxPDFOJjJ1Z77viW
	/0L7ns3duFZlM0gcJAem5dbu61OuOfEvIPud8aR07Z0lL1c6/rd4266xsR/xJRCsrOVJOcj5Vw0
	545Hfrzq+9SvorJBQWrMAVAFy7jt60XOSkFUcv+wA==
X-Received: by 2002:a05:690c:6d84:b0:81f:4247:de16 with SMTP id 00721157ae682-86c531a09b7mr24943487b3.24.1788373468198;
        Wed, 02 Sep 2026 11:24:28 -0700 (PDT)
Received: from gmail.com (234.207.85.34.bc.googleusercontent.com. [34.85.207.234])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-86c17841618sm23311307b3.24.2026.09.02.11.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:24:27 -0700 (PDT)
Date: Wed, 02 Sep 2026 14:24:27 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org, 
 willemdebruijn.kernel@gmail.com
Cc: netdev@vger.kernel.org, 
 davem@davemloft.net, 
 kuba@kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 shuah@kernel.org, 
 linux-kselftest@vger.kernel.org, 
 willemb@google.com
Message-ID: <willemdebruijn.kernel.6d16fb1b028@gmail.com>
In-Reply-To: <178833338726.3394541.13779692240559712632@kernel.org>
References: <20260831210128.1359978-1-willemdebruijn.kernel@gmail.com>
 <178833338726.3394541.13779692240559712632@kernel.org>
Subject: Re: [net-next] selftests: net: csum: filter packets by source address
 and port
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

netdev-bot+sashiko@ wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> =

> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 0
> =

> - [High] Incomplete fix: the patch adds source-address/source-port
>   filtering only to the PF_PACKET verification path=E2=80=A6
> =

> =

> Would it make sense to also connect() the receive UDP socket to
> cfg_saddr:cfg_port_src, or use recvfrom() and drop datagrams whose peer=
 does
> not match, with the same cfg_zero_sum exception used above since the so=
urce
> port is computed at send time in that mode?

That's a great suggestion. I'll add recvfrom() src verification in v2.=
