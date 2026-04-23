Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7003B42AA6
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 17:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776965548; cv=none; b=F7rQEnPFuyoNCtyTIbImNMXsday/B22N+L6EffLASP/4VwDkq7oLhM2tYLR7hAbWBsTySHuHj9kSc2GkKsn9ANmkCUYnK5vtVm++rB5R3wtDqajwdKOjFjYYkx6GjcTVTQWBWtUIBYwQSB2YgxlO9b+bwRMM6E9PxvLVasxrEhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776965548; c=relaxed/simple;
	bh=+Wh9eb+A8Yt7HINMKgqBsRte1iTr1zfqo7kXXSP+mWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PD/a2/gaLficKaycROIl5JxjKKyqHlyMhxWbUTo+foyw4oSmCgbeNV945E0PeLlawiQHiFrloIxwsVnDqkNX0el6ALdQ7ZvIZOWdfBmnqcIyjiHLfCa17T9dDjTSrycpEUyhdK3+MLxnOKHCTq195gkyaeDzu8aAppx43X5KbFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/nVZC7I; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/nVZC7I"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ba895adfeaso7690229eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 10:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776965546; x=1777570346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=roTEmQN+Ir7L0cfKfGP/6yejCPhHvoS90pxDwlZRW90=;
        b=m/nVZC7IShZpa5uODo5abqAwO7vJiNoBYq7i3bqPlGdF/RWewqfPlwMF4FeckOYisP
         qbYXlncUov01FbXzwC3i86CwQrVKLGi2K2tdw90Jz3O25uHYvlErUwBbyMLNsyHtrMz2
         RHoyteJff6aTpaNMpAHL8EG0qwqqLcTe7nK5gi7AX9gdBeh5rY0h3ekWM0YB+S/fwWfo
         buB3NXxhGpAByv8GkEX6f9d4EES67V/S9WrwhTXXLT7xIAeRWoIxQYnWbPWSH3rSSxmu
         JqGZBeIEG2ubM2yBFzRTfyXf+WQgD5d0KN9adh7ce8W2HyvRYvmXexNSRG54fcjFo5XL
         KmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776965546; x=1777570346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roTEmQN+Ir7L0cfKfGP/6yejCPhHvoS90pxDwlZRW90=;
        b=Cu3L3v9llcQlC7r63+2izpMpgG+vY7zHTqB0ofoH2FN/tBXGPJtzjFWzs4MCSXjkAk
         NIY3m173SIRcoFNAhcER4zA/hOauZNquubdpnp0rCMlxUyFNmG8AKQOETZiBMH2riX3e
         tGE2mJ2M+aw2kRJQpXlRusQGDvO6jOUblegxfpTS+ugeCfql2CYjqlWXZI8p2gQnlPJz
         Ea8cFr00J0EcrXPpqIr2LYvAmG5hr9xu1PetxoES/+s1WQVqhh3tpmx/OdgQrR+/szhl
         8rO3K9zltAy7mrU76bXviRVKeU0KnXj90rdVZv9pMjjCys3bfDWcPbSlHVgw1hv56IZe
         DDlA==
X-Forwarded-Encrypted: i=1; AFNElJ+Xi/TQ0Lh2OvlysPMrOoQk47mazC9Jwwdf/iw5wFfHrfRejTaVqaDi7Hgc88RnkdQgQ10moWpApAJKsmRBBDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeW9O7iu0OmyDfICtD3VP+eAnuJPYDxRTYuGlbSS8RTKk81Tmz
	vE2lzRzTwqEohnoW7EUunCLMnEYuARAjeTZiM7ZwneRUHPzBTEmwBxFt
X-Gm-Gg: AeBDiesaaXeeRRBm8aewo+sQ9YdYPWzAcyePX5M4ZXkWDICOeA6ZSTqHNnwE24D6P58
	FEXwdEpfd92P8KWO/DUXsbljdO5Vgh6xbuDQwfC0YEdpLWLsY00cDnvvhJAS/Vr+h7nd5vbdPf8
	bhEGQKseb5FzEOwXexUQdSz2RqChl6IXQgXHWh2znzYg2MYqZeOohH8HhO9gnbqjN7MilkGeIkK
	Vr/K5TXHxNpBrAS8WrsIvL992HmE9Uov9qE5ZovbYMFair7CeM72v/Wc7JzYL7dF52L4CuYDit1
	K7ygdx9g4EzuVcSCVlef4ADAQ0ETpQ46/rkY14vnLI2A+lzmOZNtruUU8rJvgItISZg8V4QqrOz
	k47HJI+evQD3w29ZacYR626Kig1Y04QlsAHw4hrs5+1wiF0UIqNHPtIR60Y3CXSNTRPQ36S3V9g
	VhLQk3W7UmstWmWXSvl3mnh5gpX3quy7UUKpoAIIRR2AUoOvXKK1/2/0BTOHXS3bdlnckldP8JJ
	p0=
X-Received: by 2002:a05:693c:2c0f:b0:2d3:4252:b127 with SMTP id 5a478bee46e88-2e479017537mr14873358eec.26.1776965545353;
        Thu, 23 Apr 2026 10:32:25 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2359:5fa4:9c29:41b1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d9b056fsm37264351eec.29.2026.04.23.10.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 10:32:24 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:32:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, brgl@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: Re: [PATCH v2 1/3] driver core: platform: remove software node on
 release()
Message-ID: <aepWdKzd8GPeayNJ@google.com>
References: <20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com>
 <20260423-swnode-remove-on-dev-unreg-v2-1-0e5213cde2ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-swnode-remove-on-dev-unreg-v2-1-0e5213cde2ed@oss.qualcomm.com>

On Thu, Apr 23, 2026 at 02:12:02PM +0200, Bartosz Golaszewski wrote:
> If we pass a software node to a newly created device using struct
> platform_device_info, it will not be removed when the device is
> released. This may happen when a module creating the device is removed
> or on failure in platform_device_add().
> 
> When we try to reuse that software node in a subsequent call to
> platform_device_register_full(), it will fails with -EBUSY. Add the
> missing call to device_remove_software_node() in release path.
> 
> Make sure that we still function correctly if a software node is used as
> the primary firmware node.
> 
> Fixes: 0fc434bc2c45 ("driver core: platform: allow attaching software nodes when creating devices")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/base/platform.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 75b4698d0e582e67adafa78c312d75c72fd654cf..43ea7dcd338dd3ddae57e6d0677e5cb2673f6ed5 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -599,6 +599,7 @@ static void platform_device_release(struct device *dev)
>  	struct platform_object *pa = container_of(dev, struct platform_object,
>  						  pdev.dev);
>  
> +	device_remove_software_node(dev);
>  	of_node_put(pa->pdev.dev.of_node);
>  	kfree(pa->pdev.dev.platform_data);
>  	kfree(pa->pdev.mfd_cell);
> @@ -885,6 +886,16 @@ struct platform_device *platform_device_register_full(const struct platform_devi
>  			goto err;
>  	}
>  
> +	/*
> +	 * If the primary firmware node is a software node and there's no
> +	 * secondary firmware node, the primary will be affected by the call
> +	 * to device_remove_software_node() in platform_device_release() and
> +	 * its reference count will be dropped by one. Take another reference
> +	 * here to make it have no effect.
> +	 */
> +	if (is_software_node(pdevinfo->fwnode) && !pdevinfo->swnode)
> +		fwnode_handle_get(pdevinfo->fwnode);

It is possible to pass already registered node in pdevinfo->swnode
(because device_add_software_node() can handle this just fine). In this
case we also need to take an extra reference (or figure out whether we
need to drop the reference when removing the device).

Thanks.

-- 
Dmitry
