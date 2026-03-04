Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23BE39479F
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772618788; cv=none; b=DB704vlz/hxUk1A3VhZq/vkatnZ+wJuBcY0/n0yL89NwwjNcC61Rx5tsQkatokzDKO/0ZhhSJHJbyM61EU1EGTMCw0liZukJzDLIWsAyKYmAZDNGG+0ztbXGULfr+0vtmGEv8kL01OH5XiqfGQ+RnjwV5a3HSPhs5nxPycwQwPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772618788; c=relaxed/simple;
	bh=ZeXpubh4PPtG9yGE/1RyC93eJnLALxoHAHjlztipjqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCS3jo2VZFqEvzCKQ1fI8Tp1AVnNdiHreus5SKOC6PyM8SEGf2reg2ZURsowaK6koCR7jwy7mvssHTJB99EuLWUQuGYt4dAHK3qy75YJinSZnQIncaRzeTHsVmvgbv3YA5H7sxhZ9EDLoOjrT7LCw91m12bFZQzE9U7WtPHVMI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=IT101ZPF; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="IT101ZPF"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso56968335e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 02:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772618785; x=1773223585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LiDOsrcJRzDUkNqA1ZB1g1zdvhAz8jBlAAYxUsfbSFo=;
        b=IT101ZPFtmi70Ck1RuultjOCCFI05sbCTRV7QaGg6R7kNVxv8XA70142qqkcunQAiM
         w3asd//qp41sPpLBEb27bsMpd49HcZShAlJPAD8m5WF8K81289/4nijyBzyLpyzU9qrw
         Oz0h4EwIIYcp+F42vhKHthsMKAKKrcQz/6gY/xPgNbe3lvP6f1r4rqJDG0iK79fgIgSx
         SDFVK9UZ+V3rIBSrtuHNZsbVTW4v75e2pLDOgO4GfOKZAaaCX9OlUjYwZ2+aWzBd7tn+
         1dWtZKy4Fq79vs51pHY3JxJk3tOJsO/zKPQ0j4nrviIEpSF9n6FAPGcV3LLBNDoRvxF1
         Xh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772618785; x=1773223585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LiDOsrcJRzDUkNqA1ZB1g1zdvhAz8jBlAAYxUsfbSFo=;
        b=PUeNCsIujwUetYc/1Fip23FPzYFu89taI4go3mfHsqw5loR3CR3Qj61wkwWb75p+cs
         +Jhugmtl4H5onT0QbyBRKrrcMTNVaI4nk00xbhEFthWnpo/hcSDpNv6Sgzlt2trbwCPl
         1J0wvNxHZzqQdotggjyfZwHJ28QBMHXFZ2a0L5XAAFZrU2OYmIFcPySp5NMOURGkt3AD
         jAhpr6Lp2AcNIz+Mb2UrAgZ0Fs147+x3R2daZxzl0Ok9WhWHfA22pjnEbuqDDpT+jW4i
         jFni8YIkmGraq44YWJGNjOAj7+kiCj3CNKZ7mLiO2QC3ndJAPD9AryZsqH1LbiPAarQc
         SlMw==
X-Forwarded-Encrypted: i=1; AJvYcCWq4/tvQySXQNu8a7C90ZlKaNvPN7bzTstmij4NA0wnj3bOplR4zH+m/C/Zq1+vzBoFN96ealXEZbGfuD/2WRc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9TWqUQg8vSOSlb1cgNr78tCad7rLBq8MUhG/5K/j3DkoOTj1j
	vCKD0qEQ7Ei+1eBcCgy7ciN3/yggXC5DQk3X4BGGvhztOkcSubW+2ThpYEpCcscT2Dc=
X-Gm-Gg: ATEYQzybxP23dzVZoU03VXWjoubN0LH4P/+I/2OYi660Wl7p+maX9qNour8gqwOhtDz
	aZnu+ze7MPs3msF5QuPEMAocWPQLkOHjyOklD9h12/tgSTt0BIr1k14pYRmOPlbYZE8H+oCCCCe
	hO1ayv1liVWccRrxj8TfbDLb9lBrM078qMwcBJMY9pL8Sem3OmfiOeTQp8Zkd26m0yn7cnHiJEX
	qljg1/l+ddKcm6IG1KiCrBXSemc4B0HYnX9ltMr+XFsaEtEWfODGkMg8peRGvN676cIiME6JTC6
	bbnOBY5M3cWE/KHpHfoG8QK8FhCABtcQ6DW5GEli2g4zHNxBSFlNY2HPvPJbcsR+xPT+PS55zPA
	06W9RK3FIi9kupj7v5vWmRo40vylVUu0eVsaVSngN/L2B51YcQZyrhPvSlAUcRBDx2zRKDVjr4J
	NeDR36I7WgXZZoJdT3r9t2re+xmZL0IOUBi5Y=
X-Received: by 2002:a05:600c:3e18:b0:47e:e076:c7a5 with SMTP id 5b1f17b1804b1-48519862e45mr23898775e9.11.1772618785276;
        Wed, 04 Mar 2026 02:06:25 -0800 (PST)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188914ddsm50708685e9.12.2026.03.04.02.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 02:06:24 -0800 (PST)
Date: Wed, 4 Mar 2026 11:06:22 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Tariq Toukan <tariqt@nvidia.com>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Shay Drory <shayd@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>, Or Har-Toov <ohartoov@nvidia.com>
Subject: Re: [PATCH net-next V3 10/10] devlink: Document port-level resources
Message-ID: <ypgqsnml2lbtx7jnzpy6rqs2cxij4rmw6elcdvcqnmzgqaqxk6@e2d67qjopryt>
References: <20260226221916.1800227-1-tariqt@nvidia.com>
 <20260226221916.1800227-11-tariqt@nvidia.com>
 <20260302191448.4750a2b8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302191448.4750a2b8@kernel.org>

Tue, Mar 03, 2026 at 04:14:48AM +0100, kuba@kernel.org wrote:
>On Fri, 27 Feb 2026 00:19:16 +0200 Tariq Toukan wrote:
>> +Currently, port-level resources only support the ``GET`` command for viewing
>> +resource information.
>
>In case there is v4, AI says:
>
>> +Currently, port-level resources only support the ``GET`` command for viewing
>                                                         ^^^^^
>
>This isn't a bug, but the terminology here appears inconsistent with the
>rest of the documentation. The document uses user-facing command names
>elsewhere (like "devlink port resource show"), but this line uses "GET
>command" which seems to reference the internal DEVLINK_CMD_PORT_RESOURCE_GET
>netlink command.
>
>Should this be reworded to match the user-facing terminology used throughout
>the rest of the document, perhaps "only support the show command" or
>"only support viewing"?

AI does not see the context here. This is in-line with the rest of the
get commands.
