Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6193B38A3
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 11:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775563036; cv=none; b=FV7jZkZwyrHrxubP0mClFIYLZHy/NW1qeXjQGjzPg/ZDl6tPNF6RhjxTzUkQ4FzwZ3iz+i1ePIwvueULuniqoztxv+5sb8yjJkkszjBTmE4ac3aDBjtFQyVR5vLf57xwcpBDOjW8DnZVbAeMv6FXNR4Q67uD7B4ck5YVavEji2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775563036; c=relaxed/simple;
	bh=SnRtdL0bk2VK3XpUacl4D5FW36L1OwnmQJR8u6w9IFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3yn6HLoF9Tw/JmF/BfhyK30M2F4AK6uSZ2rh2aBF+jvKG4uXFX6pHjBHumKhxpItsKLxOtpijks+4O2qpt51QLwQZ63fTAAxvL35Qr6sw+pUX0MtGknWTp8y3Yizzy1GoWH2GLE75VDCPp6e8enPGPMr2/bRrhpT152fEmzXi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=veIelTHb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="veIelTHb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso30457795e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 04:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1775563033; x=1776167833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SnRtdL0bk2VK3XpUacl4D5FW36L1OwnmQJR8u6w9IFk=;
        b=veIelTHbcO/xBWfRvnhydPtHgMj3M61foGP7nfwWVWxzVYqFQbHt1vpFohBTeQ30Ks
         Yqqo9n+YKtL308JVXMmGsEAfiIMpB/geiqbLypTenHnUUjRPBfkwp2zNZSWW+kJKRxMt
         G0kVvA71sY8NyODTBCdbz6Qwquq9itczMUCHSS2cYBYTt8QnumW3vgIpQrtP8V855T4o
         tg9oQHFXlOkzH6hHKcEtqz236d82Oqbhv1P7EMQGESvp7zRZCXUZIQCP+D9yJO0VgsAZ
         dNwyb3K4YQDeMrVNt4BoConR6OhjyFDwgq9tybzFwGzg4dl+dblMupP3wTjN4DB2gm4G
         ntPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775563033; x=1776167833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnRtdL0bk2VK3XpUacl4D5FW36L1OwnmQJR8u6w9IFk=;
        b=MiTOQao30VnBiE2KmejzM9AMvaMUf22TrmPAtOc+golUI10E0ILpvHqkgB5HJmRm7D
         qjt2f/cH23Ki2JKisPh1jjq6fz/ZpGGuVj8ytkTLBhzj8c4r4qPMTffKCjpa21OpBYWp
         z3HCxfA+orJ62NAzjWzEnvhUPUXnbJpbx/2ZFiwNHnk2bQPdZZ/T4GAMn1q1UqCLIqvG
         l1965u7TvqzjSZh4HHb7/4U2bDhL8vdb5wjNZKsY02zhA8aNjMGJ1rk4Z7KVXv4oQAcs
         7uOp0g5AiYr9VyOuaAhIjboPpbnKCnH1AQakeg+jf4jWOQDeLOp9ik/03KDvdPwWQMso
         nhoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqDyrs7WQZANLIKVR6b5PclM6j63vICkoWzPRKJirxSujkEskpETRndLLaBeLtl7HMW92YHU2GUbq2Y1CYmJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK+ZgeQIlomBW9blQq3CGQq++JuKLb0TMWNVxHLmqrJsab3M7c
	13NnfpDdnwc4AfLbod44KJXzdsfOKSPOCs0L+cIMNpGxRYxK5KXd1GoIP1jFJUiTLhs=
X-Gm-Gg: AeBDietMMde3ggemmZsdc+Hq4yRt9ah8gp5+vdJYbhygx969hlkRvPORLO1d1Kw0/Yq
	uH1kcbq19kGL+nYPRqcUTqVzDv3V5oUW/SlkHKtgGlGtYxOCOXc4QqPv7LuRuE51FkCQh16xSDW
	FckGSeq0fMhQKtyZd218mvqnGajsQHwiO315g73ABqabSMLcQOARfunX12AvJSlu4w7v5jFgSjf
	roR5kklBPHblUR6Fgbpic2CL+R0mSMFPDhVeKdXzHq8DjI95hyuGYROf6wmluLsGBgg4UZtSJWB
	aYtKDXapoRu33crLuuND/EDUWgZ6wQGbecFhZEe+WlvefJX0+8F+eovnPW3LkaQaxyl3cuY/P8W
	E5e+jeBvDMg+2G/gs9//2ZpV3Suz7+q1xj1iLT76Ynx4QZZRIrbiEG6LLleGmip5fBD8cjDGGG6
	VtczN6RuJDUXjoohZqcpNbvT56q9mUDx8=
X-Received: by 2002:a05:600c:699b:b0:485:3ee1:eba5 with SMTP id 5b1f17b1804b1-488998f09dbmr274522055e9.27.1775563033390;
        Tue, 07 Apr 2026 04:57:13 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488be75215dsm49549305e9.6.2026.04.07.04.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 04:57:12 -0700 (PDT)
Date: Tue, 7 Apr 2026 13:57:10 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Marc Harvey <marcharvey@google.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v5 09/10] net: team: Add new tx_enabled team
 port option
Message-ID: <5pbks7curcynt3iewjlgjlae6m2ydpm4ztooyqka5vxlnwpemo@pbqd2mysixem>
References: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
 <20260406-teaming-driver-internal-v5-9-e8a3f348a1c5@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406-teaming-driver-internal-v5-9-e8a3f348a1c5@google.com>

Mon, Apr 06, 2026 at 05:03:45AM +0200, marcharvey@google.com wrote:
>This option allows independent control over tx enablement without
>affecting rx enablement. Like the rx_enabled option, this also
>implicitly affects the enabled option.
>
>If this option is not used, then the enabled option will continue to
>behave as it did before.
>
>Tested in a follow-up patch with a new selftest.
>
>Signed-off-by: Marc Harvey <marcharvey@google.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
