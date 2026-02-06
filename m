Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6F435EDA7
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Feb 2026 09:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770370595; cv=none; b=E48jDziK8sqXV173+YeVgkxJqXZkgrhrWiibEg7tE9pR6HBJ7HdL9OnQA2C1NPGx9rdtVQof0FxfH4zARyibrEeDDQ/v0/UGpBxzyyG1bmTuHjbjY21Tze7rjB/s7EoIWefPjUhdN8QvhD/VjgBkrzS1HmLZTtLDgo35b8pzo34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770370595; c=relaxed/simple;
	bh=Lv8uI95dliFeoBdCejcOMOusz6kZTyerXTknQcwPhW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8PmBdlncMPGvx8dtG9x/ICWgGRPCIA99VkyeI7N+2ptajDeu/K2VXjxOjXbDohErm7BvzoewoxgZ5hSoBilgus2J+x4jdfywLL/31ScTpjhHS4s1Pvld7oUrpAh6Z5tRUAxHnp+uGFJssHAQmqUX682muPttvkZyIbHhEngLUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=zVTY/2R5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="zVTY/2R5"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806f9e61f9so11587825e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Feb 2026 01:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770370594; x=1770975394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pF603AUQdiALGLuf8FGVmdwSpRghR2h7LwnvgLtFhUE=;
        b=zVTY/2R5AWD/9OiCCPIkxL/zp7SyokQsb3PgBTPTL2nJLbxeNJTyAYtMaAKiMr9XHl
         1MsawKAON4NOvrcAAKX27jySAT3eYHoXj1rh8Z+naXele+Ukxa3e48gqt+VFJDdbV2gl
         D+MEEPw6yDZ82N7IOvbnlhsHUram6127pRDfoY/cWN6OP+LfW4XBKJvCgXptTNRsD7F1
         p5KxChnzmVuHAtzHXtUq/+oSlE4mdhwj+mZobui2lJ59AggOXLIL5eiZtU1ruGxYZdOA
         +DnxcbrRkwSIQNlf6sxJzv6TXC13VLUfg0gygzAxBbippCOinkjb3hbAU1giZVR4VPEO
         JVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770370594; x=1770975394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pF603AUQdiALGLuf8FGVmdwSpRghR2h7LwnvgLtFhUE=;
        b=QqhIJHqF2Zhw0hqeH7Ijibuiouj7jWsbVmPo3lmMZlQFrCdszKEMHN3t6tkEAdresI
         eg7FI5LDUT0vpdkJCDo+ZyxR2qIbJJu4NWDTsrITuR7jy5Dx+H+1HZGn5XIJBDixufrA
         njQtZGgOBY8Bw9dt9X4WIAPQp6OLHF4KUPYD/m/d1VU+EXgtThCtkbDhE9W6knip+QMF
         ncX6byyN5FaRAULYR84P5HgInBnzEVopIvFo/0OhtyAtrRm3f1W9ed12x1+JEubBq11+
         Axt53kDQt/rK8Gp9JkSuNfKRBdjvhPG95DGLNCtOBTyKE7S3ySYl2/UisZ8uoPFLpQvg
         //Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUJGtlSRmqbsc5Spc1VGmwVb4vjycMsaMLTW/CJJETH3XjugnxBOcSRMLQYjGP4dv6KXsgHLySQBLRXl0ceo28=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSYqL8opzANLxKfDkMUMyx0l1qytNrap/cckNGQKLWgJgDoNRn
	9L9J+wXXEikpmiHck83S4WX9Rj4pg6ORy8fNdiRMjPVo/kTAxa2t5k2Z1E90K8qu0zQ=
X-Gm-Gg: AZuq6aJiwyvY+cNcld36ucHPl8BOKyNasqFZXuY8/qKiwoyQO7D58XmFeTAlUCbCwQE
	w0J5nRq0SDlbXWVa76paRMAmOhBrD7NB2XHBx+qalKPim90RuuCea5QW0FZOzrFNbQXkREh++W5
	avUQ2LRJslR7N2fKudxGbZM+0x+xjtavCaw8DqFnpoLlBKvM1rD0t6IShX86RITWuX/c2OGI7ti
	aYBzVwoB3r4nDVsjx3qvqi4gKvX70oSoxhGCe4ahncOZku6N7wWvrr34p7pXyIv6IkCADA/aAQ8
	oT389x8iNCpBKKHjBzqHtEql3+5wlJRq989iSQUIx64eaCAUhzwJEXMNH4EUjGVQkSy8Sx5gI2P
	rkFtN8bQkw0mK3sO28n+kZNK6SaCy4HZ/JQhhZm25TovPyeGqqhSWgs/G6uUcSfUq4rat5sDiNH
	jChurXkonOwhvjUHG0I+wm87TBaiuFEA==
X-Received: by 2002:a05:600c:4449:b0:480:32da:f33e with SMTP id 5b1f17b1804b1-48320216075mr34903245e9.17.1770370593702;
        Fri, 06 Feb 2026 01:36:33 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483179dbdcfsm147111195e9.0.2026.02.06.01.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 01:36:33 -0800 (PST)
Date: Fri, 6 Feb 2026 10:36:31 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>, Shay Drori <shayd@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, 
	Or Har-Toov <ohartoov@nvidia.com>
Subject: Re: [PATCH net-next V2 4/7] net/mlx5: Register SF resource on PF
 port representor
Message-ID: <kmoeavzguajvf67sjwxkh4x5ogbus3cigeatrstagbfcyqyka6@w5ufzb5brkst>
References: <20260205142833.1727929-1-tariqt@nvidia.com>
 <20260205142833.1727929-5-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205142833.1727929-5-tariqt@nvidia.com>

Thu, Feb 05, 2026 at 03:28:30PM +0100, tariqt@nvidia.com wrote:
>From: Or Har-Toov <ohartoov@nvidia.com>
>
>The device-level "resource show" displays max_local_SFs and
>max_external_SFs without indicating which port each resource belongs
>to. Users cannot determine the controller number and pfnum associated
>with each SF pool.
>
>Register max_SFs resource on the Host PF representor port to expose
>per-port SF limits. Users can correlate the port resource with the
>controller number and pfnum shown in 'devlink port show'.
>
>Future patches will introduce an ECPF that manages multiple PFs,
>where each PF has its own SF pool.
>
>Example usage:
>
>  $ devlink port resource show
>  pci/0000:03:00.0/196608:
>    name max_SFs size 20 unit entry
>  pci/0000:03:00.1/262144:
>    name max_SFs size 20 unit entry
>
>  $ devlink port resource show pci/0000:03:00.0/196608
>  pci/0000:03:00.0/196608:
>    name max_SFs size 20 unit entry
>
>  $ devlink port show pci/0000:03:00.0/196608
>  pci/0000:03:00.0/196608: type eth netdev pf0hpf flavour pcipf
>    controller 1 pfnum 0 external true splittable false
>    function:
>      hw_addr b8:3f:d2:e1:8f:dc roce enable max_io_eqs 120
>
>We can create up to 20 SFs over devlink port pci/0000:03:00.0/196608,
>with pfnum 0 and controller 1.
>
>Signed-off-by: Or Har-Toov <ohartoov@nvidia.com>
>Reviewed-by: Shay Drori <shayd@nvidia.com>
>Reviewed-by: Moshe Shemesh <moshe@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
