Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAD43CDBC8;
	Tue, 12 May 2026 16:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778603088; cv=none; b=lLH9Eda0XlY831lRFjcF4hV+BoSNDSR6O97q7f0kvXUtSLeXd72Gnk4ZO2DrjY/KuV3RPDNmWyfaDxu7dw3QGKeGLUmIjDEZ4G8p/OItke6Eb2NgfvPw07r70NUZKKd48bpPMhn83xvQ6y5TWME0gWg4q/i+yLWpTrbz7Khg+zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778603088; c=relaxed/simple;
	bh=drXqzUbTMfvLxVbW2I3oGWtQ5GIygsnUEErL0+BM/n0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=NORWJutMW8l7XqfQaHno2cwRmckFGvAaUjc5dvtFRB+Alepcm9/nNO3PxKXYBbg1WkZqTq1s51yJmWmk22ZTVuZkUOuF3Dj0e79/tTqLZk0DfBQC/yHnjFU1ugCVhl4hGUHCkkSA8XyJqE/MvDsuD6YhA5gr9Gr8xx66CGvmRVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rs1idOAU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rs1idOAU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579D6C2BCF6;
	Tue, 12 May 2026 16:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778603087;
	bh=drXqzUbTMfvLxVbW2I3oGWtQ5GIygsnUEErL0+BM/n0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=rs1idOAUO5kWw4l1/ogPCcdfZkIzQY4a2hftTsjHA3s9KpYQ/aPElP+Xgdq0nmb/B
	 JShuHC/4PU41siWXNy321Wgp7KouKn3Npn2or0DK8ty6ogJYjBPSWFL62vPChuj0wA
	 bGBnLltR3wCbHs2mwbDp8HS/oXpShR4jL22XSWkH08XqrTFPQJkpzUJN6jN7tHQqRr
	 yc/QOhlMEJkkObTI1nvVNUuwE3/imXdwUzgbLCmBliPxicARhvjk3jKMgJvnLAcCl2
	 HiyKmOfuqhs25Q361Yf0ZQrYvdDITU/Z2fciMO4jjqMSEiD3GfX2HjgwoWXIdjYGSv
	 nkVB7QBtHzEyA==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 18:24:41 +0200
Message-Id: <DIGU67TAWF7W.1DWZMO4XAVK7G@kernel.org>
Subject: Re: [PATCH v5 4/7] drm/xe/i2c: use
 platform_device_add_software_node()
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <david@davidgow.net>, "Rae Moar" <raemoar63@gmail.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Maximilian Luz" <luzmaximilian@gmail.com>, "Hans de
 Goede" <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Matthew Brost" <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, <brgl@kernel.org>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>,
 <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com> <20260512-swnode-remove-on-dev-unreg-v5-4-0035eff63812@oss.qualcomm.com>
In-Reply-To: <20260512-swnode-remove-on-dev-unreg-v5-4-0035eff63812@oss.qualcomm.com>

On Tue May 12, 2026 at 1:59 PM CEST, Bartosz Golaszewski wrote:
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index 706783863d07d66b4685005d6649b3cd143ecc3b..7f4295e7dc74f112abff84274=
85b5c8a5ad71383 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -53,6 +53,10 @@ static const struct property_entry xe_i2c_adapter_prop=
erties[] =3D {
>  	{ }
>  };
> =20
> +static const struct software_node xe_i2c_adapter_swnode =3D {
> +	.properties =3D xe_i2c_adapter_properties,
> +};
> +
>  static inline void xe_i2c_read_endpoint(struct xe_mmio *mmio, void *ep)
>  {
>  	u32 *val =3D ep;
> @@ -96,10 +100,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c=
)
>  	struct fwnode_handle *fwnode;
>  	int ret;
> =20
> -	fwnode =3D fwnode_create_software_node(xe_i2c_adapter_properties, NULL)=
;
> -	if (IS_ERR(fwnode))
> -		return PTR_ERR(fwnode);
> -
>  	/*
>  	 * Not using platform_device_register_full() here because we don't have
>  	 * a handle to the platform_device before it returns. xe_i2c_notifier()
> @@ -107,10 +107,12 @@ static int xe_i2c_register_adapter(struct xe_i2c *i=
2c)
>  	 * platform_device_register_full() is done.
>  	 */
>  	pdev =3D platform_device_alloc(adapter_name, pci_dev_id(pci));
> -	if (!pdev) {
> -		ret =3D -ENOMEM;
> -		goto err_fwnode_remove;
> -	}
> +	if (!pdev)
> +		return -ENOMEM;
> +
> +	ret =3D platform_device_add_software_node(pdev, &xe_i2c_adapter_swnode)=
;

By calling platform_device_add_software_node() the platform device technica=
lly
takes ownership of the struct software_node managing its lifetime, by remov=
ing
it in release().

However, this is not properly reflected by the
platform_device_add_software_node() API, as it just stores the pointer give=
n by
the driver, which in this case is a pointer to module memory.

The platform device is reference counted and can outlive the module.

So, I think analogous to platform_device_add_data() we need to make a copy =
of
the struct software_node in platform_device_add_software_node().

> +	if (ret)
> +		goto err_pdev_put;
> =20
>  	if (i2c->adapter_irq) {
>  		struct resource res;
> @@ -123,7 +125,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c=
)
>  	}
> =20
>  	pdev->dev.parent =3D i2c->drm_dev;
> -	pdev->dev.fwnode =3D fwnode;
>  	i2c->adapter_node =3D fwnode;
>  	i2c->pdev =3D pdev;
> =20
> @@ -135,8 +136,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c=
)
> =20
>  err_pdev_put:
>  	platform_device_put(pdev);
> -err_fwnode_remove:
> -	fwnode_remove_software_node(fwnode);

There is another call to this in  xe_i2c_unregister_adapter(), which I thin=
k was
missed.
