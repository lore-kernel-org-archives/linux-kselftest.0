Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1093C65E8
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 13:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357536; cv=none; b=VxaO/X6tsY+ZJVqwMYYU9NKOaSXvil+Sel/inoO+7hOXr8nRdTq63trZBycAmZhTGhXEo6k+BVcIxSKdavIemixyQIAX6BXs/n5dI85e6QA4HC+l6t8vMT8k+KJ9Me6IK3oOmELWI4NQxdnBnckoGmGReZrlrdFF4uhcNqJvHuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357536; c=relaxed/simple;
	bh=c5ob8x+63Jafk7vg3P7eaQn2ve59Nggw5TcAv/2m3zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQdokeMRKq5zxfLVKF7VtI13EKGCWO6mUPGZewW7wSMDEwr4eu18sk5We9JpR2khUXtIbmcnCpQa5zNCx9nLlNnWjE5EyugcMNOlanNKU50BxXoa9KEZoa8X+i953bqwpnKphcVaerR1eTAcDUVG62Zq0HmAzpv3Dzq4Yb7pW/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=EFzEjqL1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="EFzEjqL1"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso33760975e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 06:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1774357534; x=1774962334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c5ob8x+63Jafk7vg3P7eaQn2ve59Nggw5TcAv/2m3zw=;
        b=EFzEjqL1CrH9+xTEQCCpzA5wU2vTa0ZY3RcosBio97hIDcHZBskxxAceCFYxV67SFM
         PsTcBXmJJvz4+0zHWTzSrknsIRvi1p7y9gYNNDPeAy6cBzEUo4GHYGzSilSFRbUdOhBY
         shUTABQWxsLpoSzpCZFYP6G9GqGEMj90LW9rmoQwemQ6I9/otaeFCWu9SP/rKdtOcV2N
         RvyJsoJ+5I/0lFD5fi+ZjIej+CX+layGDTrr9dJUmgQdQVZwYcZafg8XEa/nZSkm45a2
         MXtwhLewzXFRS37telw/QsZrlr9R1w/prdiV7ebHrNdCbRvSWCdfyMihQCLi4MxiZtni
         bT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357534; x=1774962334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5ob8x+63Jafk7vg3P7eaQn2ve59Nggw5TcAv/2m3zw=;
        b=FzF/Idb1vjJ5vqPV6pgOGDgFRyKLWTAYiuIU0/WLJAeuGql99K+VV33sNCDV8joR73
         3GFMoYd0hRY1HAltEJzEgV+baN/PM0wjg8yt3lFxMmCHI9t/LviOpKuA4naz44h7iM1O
         K+mhm4oMC2WTEEpCnoCqvYg34V2BcpVNu7+mzIqXQ4OytbXVGm423lRpjooouL5G+6xS
         DHSBFWm2Zto5ReiL9abYmXeGlEljJf14V3Ccv7db6bPuwrAteTmNmWoHMrahAq64KIuH
         +LZEycCSKL2+lPwGo+CUS2kGjAzhrbsqisnucfnAgo+D6ini0gBcZSRBp7tAGa20XMzJ
         nNkA==
X-Forwarded-Encrypted: i=1; AJvYcCVAfGfz1iZVyfJFkLPqk6fg4Cb7gkOfJEApwxaDtw+rSPcu/0hWIR7+vqlkVDKGTpsOXp/owKghW0eBWu7zZvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGbyUCI1ToJXeOxN+i1Jrj/cUI8dpwV/NFWex6VJIo9TNvrdJo
	/cUlB+sxrecTgbhlnlrYLkTtbH0t2nsE4m7ZUdsYfv0ol3z9U+/CzBq0EmPeQvpLh3U=
X-Gm-Gg: ATEYQzzgOzt5a4xSHhefQjT80Z1dUcTjwVdWOhrjCV7NUy+z++DCeG4NVcPk9yRLkps
	M7EHMfRHy0p5ZQ7Yed0tK8PS722hCHlWfsW5K8U1c7dc7WMOTadkDfTiPGM2/bYPWbJTdeY+mpR
	xlSCveihijEiPcV7FrUS97Hl0HOgAHUwce2t2s+608MTulNFJILP6Tnrwg45+L1zSmLRH4f2eVq
	PdYmTk0gT31Ju0HnzH8yhDPA0X8kQfKckIOTlXgibbEM4iuWyJpgFR2yS2JSDbcV5rGbd4dlCqA
	m+giLQqGy3O7uNdozaOFAO7bvkW+YJzII2qD6SzQnIDl8+enzZ0PMMERAMZIaXGv9TzxGb1Yg88
	ytSj0ViIx3XTCD7UZ6t4egiuwATtYCJvXSDwKGRY8YB4cAIVsQbU3+5nABu9iUYB0ealkp51LG/
	SHAhk+hTtIqqvKIO10RdPI55Ufgg+JhNtWsdc=
X-Received: by 2002:a05:600c:4f10:b0:487:2e8:69c5 with SMTP id 5b1f17b1804b1-48702e86a88mr205126035e9.15.1774357533835;
        Tue, 24 Mar 2026 06:05:33 -0700 (PDT)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48710fa0e35sm46182275e9.3.2026.03.24.06.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:05:33 -0700 (PDT)
Date: Tue, 24 Mar 2026 14:05:30 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, 
	Chuck Lever <chuck.lever@oracle.com>, "Matthieu Baerts (NGI0)" <matttbe@kernel.org>, 
	Cosmin Ratiu <cratiu@nvidia.com>, Carolina Jubran <cjubran@nvidia.com>, 
	Daniel Zahka <daniel.zahka@gmail.com>, Shay Drory <shayd@nvidia.com>, Kees Cook <kees@kernel.org>, 
	Daniel Jurgens <danielj@nvidia.com>, Moshe Shemesh <moshe@nvidia.com>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Willem de Bruijn <willemb@google.com>, 
	David Wei <dw@davidwei.uk>, Petr Machata <petrm@nvidia.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next V8 03/14] devlink: Migrate from info->user_ptr
 to info->ctx
Message-ID: <yfpepx63i2om7y62kspzizq7a3xxknfnzrg7j27ppt2oxpeou2@kfbomamxpdo4>
References: <20260324122848.36731-1-tariqt@nvidia.com>
 <20260324122848.36731-4-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324122848.36731-4-tariqt@nvidia.com>

Tue, Mar 24, 2026 at 01:28:37PM +0100, tariqt@nvidia.com wrote:
>From: Cosmin Ratiu <cratiu@nvidia.com>
>
>Replace deprecated info->user_ptr[0]/[1] with a typed
>devlink_nl_ctx struct stored in info->ctx. The struct aliases
>the same union memory, so the migration is safe.
>
>There are no functionality changes here.
>
>Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
