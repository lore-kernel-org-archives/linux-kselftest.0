Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2007F3B960C
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 09:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770198863; cv=none; b=qgSdqHAwBqmhbobds1GyiBXRRPNsOfRBfHnIgksh21SG3p7pRUOIIRtUIH2+qnTcJ7885sEgfKRwS608clC/Bdh7M4UkCyGQsjwaatAc35oykGKEbztaAruEeJNN/Iz3EOT8Vc93FW9kbxmh/Rv96nTaeF+1zZRuDmfEGucyG/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770198863; c=relaxed/simple;
	bh=MtgvvUHudAHUoDthEeowTLlr8O4jZULD3ouQz+tl1Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKP+WFTr/VzhX5AdxZoFZerhS0vS0QuRqc17LSWGaFj3a+B7ow5c9QyMyIuWXbQLCCLx3ia6le1f676QN30Iz6FSqbaN+AKhBOTY/WQnTWAdCscZAdFzfpnFCFGTtBuAZHzMbd76VHk0694i38vLgS0Idqx5A0eYCN9/NWwv4ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=ADSZ13Tu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="ADSZ13Tu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4801ea9bafdso3340855e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 01:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770198861; x=1770803661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NoPrl11NJOoOl9fCyTn7J0ZLB+yKB8/qzDtRhM6Zldk=;
        b=ADSZ13TuFigg6DdgnYxCUxAK9vC2m8Z7etMJZXpOJ8NOTwWa91n8ek7uc843pOMgzT
         4yeptXjwjwyorqcOlk6igbGm3yzx/NCICCM4/0QG+KNZyPHlictJG2h39pl4Ie4YqGDP
         Ef4wacnvyUMz0/5Dzw2al8JSUnAvcIRqJfpldIeWDueKeI004rca5ikzrQTNEOXH52Ya
         MChY14y5QhL+B1dtjWaR4c44fNHPz48DjsmBEm9gPPaMtuh525fwQlxUNdWka03e8DAu
         IhYX1AaseAiYdlU/65u7/nSHBQKEsN1Vl8kL9eA32nmPSD/EKNENm+528mAGkoeGgMna
         TFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770198861; x=1770803661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NoPrl11NJOoOl9fCyTn7J0ZLB+yKB8/qzDtRhM6Zldk=;
        b=eJemCgjKVRO0VP5FdNjeJOnyaanDML5YAKXhvjk5+kArdmYEk8IUkJmNQQAtcVqgpP
         8+MQZblkfujcbK9KA8xM491Rmcxjt12pkBNzyVqvk/bYyvYJ+0DVa3HoOMU6LAb78MYy
         1HZk0eneqF0JniCI4WJsLjumrqEnftIUZWgFlj64SHPv2X+JwnnUeZDINJK4ADnVXElF
         oiPANE4HEPuZLGLbRjKomC9BB9c+R3MZOqc0HJEZwgeKFGedLqEP5gM+hxTTT8ye2yhx
         Pw+CNAaRK2E9u5BpPuKOkiPnEgMi2goTnLHifaIa6YTvJknwkTo3mX29afNuzW7yHHnR
         O3Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVN+K69oxbE55GD1pna8TSHSlfQO6tDET2IZOKWMbkmuPZFyZo9Tc3srXdtRbZ8XI2E/2gu9BLPzyjhBzGNdHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP//PRtvr4aTWBPgFtn3cVnbyZ5+0Mn5t5VP1qD7zO6q0NyHsX
	Ljw8GLEkpHlwIJzpr4jauWNi2rmT/ZliTjjHsMVIDAXu7ikQQcNV021lr4FdUdPFCHM=
X-Gm-Gg: AZuq6aISnhMHK4gHERexfowyYNTdxyI+HFMGf/B/h9PDC3YJVCW+DeDLLR04Cg8rLVf
	7LoMJCzWjcOEj3tmaQE0nvUzSZzJqKGF6BhYIWINYGf17v8tppt37aQ7PuLnk1jop6yyT3UfC0A
	NFErPLCeut8i7Req1E731mhwDOfnQnx5rKcv9Vi1tbWXQA77f0yTjsbO9EIJFggp+2JsvgSI03C
	dbFeKtNCeK8WuXobyhn9kcjDUJdAinV8OYrVPNod79PnwX4hqCjYaxP9MhbjYiajhYhgaNNDxud
	kfUSNf+MwUBIsOD/j5xFPuwTjFzYTXbLuLUnnz4myuirmM+b2bjohBe03g8rF3HgRMQs9pkZ/x7
	dSn4KXNTwKZMLerb4cVBEY+hXZEqL/4Y1D1CFGBSKgWfiHU9K2qCGL13qBKVCicBlPgvQrkDZoE
	s0EgP9dc0nphNion+V4O0=
X-Received: by 2002:a05:600c:5250:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-4830e925fdemr32086895e9.7.1770198861330;
        Wed, 04 Feb 2026 01:54:21 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48310919211sm47113715e9.11.2026.02.04.01.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 01:54:20 -0800 (PST)
Date: Wed, 4 Feb 2026 10:54:19 +0100
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
Subject: Re: [PATCH net-next 3/5] netdevsim: Add devlink port resource
 registration
Message-ID: <fpvwwvsregusmmqqejkvr6tluurlkr3cj42dbwzkhqpb3ezps5@x3jmpkhmd2i5>
References: <20260203071033.1709445-1-tariqt@nvidia.com>
 <20260203071033.1709445-4-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203071033.1709445-4-tariqt@nvidia.com>

Tue, Feb 03, 2026 at 08:10:31AM +0100, tariqt@nvidia.com wrote:
>From: Or Har-Toov <ohartoov@nvidia.com>
>
>Register port-level resources for netdevsim ports to enable testing
>of the port resource infrastructure.
>
>Signed-off-by: Or Har-Toov <ohartoov@nvidia.com>
>Reviewed-by: Shay Drori <shayd@nvidia.com>
>Reviewed-by: Moshe Shemesh <moshe@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
>---
> drivers/net/netdevsim/dev.c       | 22 +++++++++++++++++++++-
> drivers/net/netdevsim/netdevsim.h |  4 ++++
> 2 files changed, 25 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/net/netdevsim/dev.c b/drivers/net/netdevsim/dev.c
>index dfd571b22107..ebda1b961664 100644
>--- a/drivers/net/netdevsim/dev.c
>+++ b/drivers/net/netdevsim/dev.c
>@@ -1486,9 +1486,24 @@ static int __nsim_dev_port_add(struct nsim_dev *nsim_dev, enum nsim_dev_port_typ
> 	if (err)
> 		goto err_port_free;
> 
>+	if (nsim_dev_port_is_pf(nsim_dev_port)) {
>+		u64 parent_id = DEVLINK_RESOURCE_ID_PARENT_TOP;
>+		struct devlink_resource_size_params params = {
>+			.size_max = 100,
>+			.size_granularity = 1,
>+			.unit = DEVLINK_RESOURCE_UNIT_ENTRY
>+		};
>+
>+		err = devl_port_resource_register(devlink_port, "max_sfs", 20,

Two questions:
1) Why you have "max_sfs" here and "max_SFs" in mlx5? Just curious
2) Why you don't have the name made up completely instead, like "test1"
   or something? It does not really affect anything in netdevsim.



>+						  NSIM_PORT_RESOURCE_MAX_SFS,
>+						  parent_id, &params);
>+		if (err)
>+			goto err_dl_port_unregister;
>+	}
>+
> 	err = nsim_dev_port_debugfs_init(nsim_dev, nsim_dev_port);
> 	if (err)
>-		goto err_dl_port_unregister;
>+		goto err_port_resource_unregister;
> 
> 	nsim_dev_port->ns = nsim_create(nsim_dev, nsim_dev_port, perm_addr);
> 	if (IS_ERR(nsim_dev_port->ns)) {
>@@ -1511,6 +1526,9 @@ static int __nsim_dev_port_add(struct nsim_dev *nsim_dev, enum nsim_dev_port_typ
> 	nsim_destroy(nsim_dev_port->ns);
> err_port_debugfs_exit:
> 	nsim_dev_port_debugfs_exit(nsim_dev_port);
>+err_port_resource_unregister:
>+	if (nsim_dev_port_is_pf(nsim_dev_port))
>+		devl_port_resources_unregister(devlink_port);
> err_dl_port_unregister:
> 	devl_port_unregister(devlink_port);
> err_port_free:
>@@ -1527,6 +1545,8 @@ static void __nsim_dev_port_del(struct nsim_dev_port *nsim_dev_port)
> 		devl_rate_leaf_destroy(&nsim_dev_port->devlink_port);
> 	nsim_destroy(nsim_dev_port->ns);
> 	nsim_dev_port_debugfs_exit(nsim_dev_port);
>+	if (nsim_dev_port_is_pf(nsim_dev_port))
>+		devl_port_resources_unregister(devlink_port);
> 	devl_port_unregister(devlink_port);
> 	kfree(nsim_dev_port);
> }
>diff --git a/drivers/net/netdevsim/netdevsim.h b/drivers/net/netdevsim/netdevsim.h
>index f767fc8a7505..11ea1a52924a 100644
>--- a/drivers/net/netdevsim/netdevsim.h
>+++ b/drivers/net/netdevsim/netdevsim.h
>@@ -224,6 +224,10 @@ enum nsim_resource_id {
> 	NSIM_RESOURCE_NEXTHOPS,
> };
> 
>+enum nsim_port_resource_id {
>+	NSIM_PORT_RESOURCE_MAX_SFS = 1,
>+};
>+
> struct nsim_dev_health {
> 	struct devlink_health_reporter *empty_reporter;
> 	struct devlink_health_reporter *dummy_reporter;
>-- 
>2.40.1
>
