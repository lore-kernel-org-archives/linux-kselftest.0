Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896073A4F3D
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 11:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775562970; cv=none; b=LsEiGydLfHbpTNS575H+xChB/nsxORgONFKY+TCMPmHGhHBVn5MmZ+QDYiJ7QQPZeHj6DgDO/pqqF6VbRx6CFOsSzFRjpOqPBzqA3euQntBKw4hXZWCqwXoTCiuLn1eY7tnWEsE9UR4BVCslAcoAAc8JA8/6LMdVHx+Xc5vZIPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775562970; c=relaxed/simple;
	bh=N8PlXAHLvJX6pJA75yhg5YbpIL02FJksrtVF9Cvs1uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KXvD1aJPmLGUOhzjDf7YKn7rkkaj7t4pvGEBaFyz1pT1fj8g89MuaEk7dOheIf4bHg6nOeyrDiI+dn5Gb7BPQzn+P1L3gz/dMlbGelKO1vbXEHxPAq8mK/mb5s0FNLoFUvmhY+9NQeNHmjEb0RKksG3CQQ+eSIlK8VBgn0+mwg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=sBOtbuUj; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="sBOtbuUj"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b9d3ebed5so4147181f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 04:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1775562968; x=1776167768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N8PlXAHLvJX6pJA75yhg5YbpIL02FJksrtVF9Cvs1uQ=;
        b=sBOtbuUjCRaeKtoTv2pevN+EHifKRaDzgdV9wCkcOvlQ6mameFS1KSLve2PA9JokNr
         BX2EZYoqWrNDbmResLiYBGpoOyEpEIM+ti3ujEGlJGPF90C4QhrhghOZHGrowG5kneEw
         lpMchClpyrFeB7xCSnl04qGkV9UTnUDB7t/IHcVJqov/9uiG1XozbQ72toDTV8SA13Ob
         skKFA4N8TTGgVf/bgAS8Ud0yGoRnE5R50KRgmnDRCDw3i9RRlv1nA8w//wLWTh7QZqDP
         GkUqWDrNKA+OMFmtt8f+g7wOuaxTrDHuOzmL/Uyh9/hh6ioHT73+LDoRnLkOTHQ/fHjI
         bYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775562968; x=1776167768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8PlXAHLvJX6pJA75yhg5YbpIL02FJksrtVF9Cvs1uQ=;
        b=nQdzjgHMCVEHHSsNULtWTvH2tqLeW9r49QHcaWT9GNxafCUbQoQqQJ06vRzgnlKibC
         fxHdsoqp6ehkWk6nQ3qWu04Zrw4pulEevxf2er6eO15bo++tta9HgkWzB5OPb5FSvJtT
         n+cASXpzwjcXE+fffpISSy2pbB32zjHysT72Nc3E8GrA4kfGbdhsYHPNi90toUAddMfD
         RzEO/Y38Y957MIAqyRNAkQnGeJHH3/Gd/cRm2m1CE5uVvVDY+nqSy4v6rjdsPCKiwoFu
         TiOIT7/4DMyuEJxaht8NNFeqGI/JaMs7zSEBOQFUJYS5cPNfgwvuny2dVx+V4wMNyppu
         6saQ==
X-Forwarded-Encrypted: i=1; AJvYcCXawbBQxCrfc0/C71Fak5FedmQ9sktXhGPBCxgZhlhw7RHWnKmhkDJXK+Q00/ZibE3u1RPJkXkKSQE9GQ7XWY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW2daJ+UN/+GU1qv52WDEidJT3CuPOXCge7wlkfR4+HrYuA0ke
	L4MoT+eikL4z7PFv75bU5Vf/6jzsCzA9Z+x3c58GmcPqmwu5N1hu7F7vZVU9nxJgvrk=
X-Gm-Gg: AeBDiesIu26s2NW5ZdmvsE5FYJYwa08tVupoYxRMR5n08mwHKiqG5sBV1tBjPzy0P9+
	eg8+H+WaGP8VzOnJ6GsB9WAId4Kbb3uKmv441aCEor5AJFImyzFi42c80isvGJgVhXzXxNoSKE7
	alyryQrfTeoct8xgK/rwnuY2rBnfwdC3bJ7k2QxEZvojwcQX58ammA5TDRK90IoSZShzM43QvQD
	tvN9yno5EQla8kFJJ3ZyKdZc7cP8H4RvUksFIcepx8C0efDaP/rrGXbfG9OypsQcs8TZLwC/sBo
	HZjBRx6QuJqYdLA9nELW54xODoSCqdZ6Yhz5z4C8UWKZIFmvqxOy65/+Ii50z9rp1XYxOQdQo2a
	Vk1Zn1kqDMX0YhflvsQdT0nBAkT89Ru/E5O7BIw5ifqiE9uC3fXDiEp8rCPQhSpSjNUtD+CUS36
	cATeoc3JWEP7xEpBbO0WvZw8RO+IOhoi7Sp873rib7tg==
X-Received: by 2002:a05:6000:114e:b0:43d:30b4:1859 with SMTP id ffacd0b85a97d-43d30b418f8mr13397000f8f.7.1775562967514;
        Tue, 07 Apr 2026 04:56:07 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d214f2b63sm44498145f8f.28.2026.04.07.04.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 04:56:07 -0700 (PDT)
Date: Tue, 7 Apr 2026 13:56:05 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Marc Harvey <marcharvey@google.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v5 01/10] net: team: Annotate reads and writes
 for mixed lock accessed values
Message-ID: <sytzifkabn4o5jhpmamswj5ujpusatp2kc6xnrwdu2uqpsx2ti@fq52ndia6eby>
References: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
 <20260406-teaming-driver-internal-v5-1-e8a3f348a1c5@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406-teaming-driver-internal-v5-1-e8a3f348a1c5@google.com>

Mon, Apr 06, 2026 at 05:03:37AM +0200, marcharvey@google.com wrote:
>The team_port's "index" and the team's "en_port_count" are read in
>the hot transmit path, but are only written to when holding the rtnl
>lock.
>
>Use READ_ONCE() for all lockless reads of these values, and use
>WRITE_ONCE() for all writes.
>
>Signed-off-by: Marc Harvey <marcharvey@google.com>
>---
>Changes in v5:
>- None
>
>Changes in v4:
>- None
>
>Changes in v3:
>- None
>
>Changes in v2:
>- None

Nit: I don't think you need to add such record when there is no change.


Reviewed-by: Jiri Pirko <jiri@nvidia.com>
