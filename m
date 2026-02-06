Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA2135EDB6
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Feb 2026 09:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770370622; cv=none; b=RY8aZrAsf7VEheokleHPCJr4l2uKgCCPHvbJ0lhWEqMNwMa6XZHH5ZWk2O5vQgyv0qAPUElAHG/Oa7KNMv5vyGWStnAr9SQDM3XB+8qgzou3hWD7yhIWqbksmFZlcQM94alypwxK8xtE1SG8L4KVhIyNB6+0XDqWjDyW6xgm4D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770370622; c=relaxed/simple;
	bh=PW/cUZwzFiiiVYrbjLi+IZRoi6zXuNxLhvfj3skBHOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLndMjLXlxRkIN3hA7bjR3eBZOUq3ayoDH6i1AEIQquLbaA4w7qsrdcTlu/fG8VsKSSgPErNshhtfgmU/1/pCRQmepEeM5c23wF+7esUsZdZ2v6xYGciJcU+SMZ9qcdNIU9xg2nFAfyrwqdIrwhUkSCRMqjUIAUD1vaew4Dz+bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=O9tVlAas; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="O9tVlAas"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4359a316d89so1544315f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Feb 2026 01:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770370621; x=1770975421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PW/cUZwzFiiiVYrbjLi+IZRoi6zXuNxLhvfj3skBHOk=;
        b=O9tVlAasfC87pV8+srE8Fnp7LzWL9qTDXNIdbHPsDemn04UoLuwt75lx1yjKaejc/D
         3IVAxkmeTjbWhCkwjvVprBNN7oHGz3yGjKohL6nCGX/LRP5XxdF/jsP9b4UIrvQAswEB
         v+r5JULntlZ4PPfiI95wnJXH17mkmS0J6Nm9NkeMeBpyBxiJQsjdQTLhO103M0JcpquT
         YRlMWhJ8yLc9p5DLqqAy6GLkd+4/LisZLRfdkO/GBx9rGZ5OZXIKK2/xejfjFNZix2lC
         xLlCuTEkuN8NX13FdtB7mjhCklPmZoHSgHs98HIQQjN9mE8KDkUDyWdEqex1uQDS+NRa
         mpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770370621; x=1770975421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PW/cUZwzFiiiVYrbjLi+IZRoi6zXuNxLhvfj3skBHOk=;
        b=K40iJQ63F5QdQk4vHK2VVnQhzjnD0Qpp1Bk4CPJmAQvEfSyed1NNUG7Gvo56E5t6r7
         ZBZfJaqw/fAXrBf8ADI2LI3OTR0cZVD7aACmf1qDj7MBmRLsJ0SC2yyeX7oBeC3npeev
         8eo3W5VparBv3XsNzp72Jd7mP4hnVBvVkNQR9j2qpOaPjVogc8QIZwfNjFMnGv+gmBSL
         uSIyQuMZePbCdeKqDbYm0EEqERtXiufqwnmEDEthcBbvuEZQqnCihzzxZDgmxCKzsGhv
         vWWM7eQ1ZX21IZdY6gEe6UgoFZQmD/ObDs4wB9ndH6gz2C2hsVF0NHgh9XAhVjMuM1LI
         KtKA==
X-Forwarded-Encrypted: i=1; AJvYcCWS8cIXlrwef1GkirOwnBygtzoaiUxI1JPUFUFSC2SFZmuV/lHDZwBFKLBDI+y1v/yPPjEbBoqY+8nejfvt9UU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFKH3+pMOVucz0QNgAJYzUwsG2B1WojddLVFu/Jjo9DSiddXxa
	2PEO5h6Jsx/QQPcd+01emVoYfNcMSFGcznfJ6903G+bI9IbVxS/B5WqyrcgMpzDAjDw=
X-Gm-Gg: AZuq6aL3dvvO3UuUXRfuKcf/Vq+2d9EsALfr57/3Hfzurv6P0gtEutTVIFJ38m56pPd
	oi8Caj6EQ1tzGneMTBb1n3Ip7PcBev6x3ndgTJ+AEF6ay36Oz5Y+TWZYBbKfFrmdmCyiZAxG+um
	zgzIxrH3zqa8U8Aa3OHmSfqCKirf/OS+T7BPnOc5FmLQy2QV4Rili3fyKQtLd6cy60fo1tCa1Nl
	Yl/yO5O+NOW6+v3Kl8qjkb7cERpTi8XdImAkZHVk3d2i0h4UJ0bNJLozuNKndVu41k3nEg/43BG
	vtkL82avq1+1+/T1pUJTVdZALRJi9fPozOkkuUdecgj14tPQeRSWnf2YRN9Da4Lz4DlEcFY1CYf
	b0U06VSrg4/pwct3Qjo/Ycxfey16daF1shZtRhFh6o9aaniJvo5Qbf+STR+zbHNVoCaJaZhG7LM
	Q8GV2UbZo0wM0z27xP09odO6Q9X5KgxA==
X-Received: by 2002:a05:6000:2c08:b0:435:a48a:123f with SMTP id ffacd0b85a97d-4362937b167mr3578107f8f.42.1770370620697;
        Fri, 06 Feb 2026 01:37:00 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629756b0dsm4020062f8f.40.2026.02.06.01.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 01:37:00 -0800 (PST)
Date: Fri, 6 Feb 2026 10:36:58 +0100
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
Subject: Re: [PATCH net-next V2 5/7] netdevsim: Add devlink port resource
 registration
Message-ID: <vtlfg47c7tme2stoefit6nws5fhxhcyx6uia7pcbqvi4xenzoj@b44ivjpnwzgx>
References: <20260205142833.1727929-1-tariqt@nvidia.com>
 <20260205142833.1727929-6-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205142833.1727929-6-tariqt@nvidia.com>

Thu, Feb 05, 2026 at 03:28:31PM +0100, tariqt@nvidia.com wrote:
>From: Or Har-Toov <ohartoov@nvidia.com>
>
>Register port-level resources for netdevsim ports to enable testing
>of the port resource infrastructure.
>
>Signed-off-by: Or Har-Toov <ohartoov@nvidia.com>
>Reviewed-by: Shay Drori <shayd@nvidia.com>
>Reviewed-by: Moshe Shemesh <moshe@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
