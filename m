Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F58E3148A6
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 13:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769694634; cv=none; b=ESBdwTUGVAE+vOARlrM6Y9UZMj6uaPPQIQdfQ1ZvOlu09srLbfvIzdTgo57Ib2PQtVI5Oo38M1atiP9wAfjgG47j7Yfp/lZ0Qk15u9+KAkMSp1KxhAYdIkGOb6kfd9Jhn8O5oKttHWmy/T4Qi6BuL8+f9CWohFf4ktGxbvIhrO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769694634; c=relaxed/simple;
	bh=GyDLU+pxiVbfK3HmawBgeoXh/3J+Q1LigJrF0nwWp+U=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQK2698OVLLqi/CYbub03lj+WKMBsXrML+HS6c2oIMVns5smSI+HkwJVCR7Vi9w+Lq6mF3YY+gvGCeWAt9hHQaWhM0Vld6yZ5iyFHlHmdh7hNXEknSmvRrQmzEfU1MClI4LUkCknQgA5/tEU0a1jRhOobyPxxo/clQohblRqicA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EohpBTpV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EohpBTpV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D399FC4CEF7
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769694633;
	bh=GyDLU+pxiVbfK3HmawBgeoXh/3J+Q1LigJrF0nwWp+U=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=EohpBTpVjehn/IpbjgeLGwgHgo0zyjO1vPAlttzyG5ODhFlBomvMWyF/TU2LvcVFS
	 9kZX+KDgSn4/fnmXIPIKPAt42u2aibIc6aGh5sB2diJaurIvYx0ReElgKV25PKHcm9
	 QOy7NWY01cZPqTse9qKmgXEQfpk3WztfEHUD6glE/tJ3/yU9j8RVHra5CG5fAzXjhk
	 plZVGf9DZqxvPhc9US+0+N1y9Ebrmur59pxrREUNoLI8WYlalNOyTzNcVUjJXyHA5n
	 5nGY129TG5hplVdzNjtGDkSa3Quz+FtuUqND86lbeNTwodYybTMMnsaV3pcAHVmqCK
	 6sXo6N0ws+NdA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59dd263bf42so1175452e87.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 05:50:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQM0iiM2qnOf2ZZHO01zwOpz9j/JG0McjbPedsz98145+8SScQ7hJwN6lZzC6N6HpMZdKelUIXR3/oIPHnw9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKEZhkGAAtU5n5U3RAfgmLkpGOQBW0yBWpGbcxA4r0Tda7IUyf
	hCyF4Oy8JfJicah6zqXXULnqJC7yvzbyafdd9A2iu07v7dUdL+uu0QgkE2M4lueJ6ooijw71nQ6
	6w2RnRa2svNwO3HBy6IDMo1dedDzn1b1WfzzW/q1N8Q==
X-Received: by 2002:a05:6512:3b91:b0:59d:fd1e:50da with SMTP id
 2adb3069b0e04-59e040308e5mr3356331e87.36.1769694632521; Thu, 29 Jan 2026
 05:50:32 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Jan 2026 08:50:30 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Jan 2026 08:50:30 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260129105634.GC3317328@killaraus>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124170535.11756-1-johan@kernel.org> <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh> <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <aXovtrAM1r1UyWxA@hovoldconsulting.com> <CAMRc=MeMW4g5em_b9qGBR9OmQZNzyQp-S=zKDCPFu506ixy-cQ@mail.gmail.com>
 <20260129105634.GC3317328@killaraus>
Date: Thu, 29 Jan 2026 08:50:30 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfzByLPJ0FKySmG7b79Ah63Mtk1hs1N=6kv8pTDydrcGg@mail.gmail.com>
X-Gm-Features: AZwV_QjpXdX3Ru-gJaLnf59FQ94or1nANjD-GNCf2j-Nn3Da57dWcF9kfnGd2g0
Message-ID: <CAMRc=MfzByLPJ0FKySmG7b79Ah63Mtk1hs1N=6kv8pTDydrcGg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Johan Hovold <johan@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Dan Williams <dan.j.williams@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Jan 2026 11:56:34 +0100, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> said:
> On Thu, Jan 29, 2026 at 10:11:46AM +0100, Bartosz Golaszewski wrote:
>>
>> For I2C both the problem is different (subsystem waiting forever for
>> consumers to release all references) and the culprit: memory used to
>> hold the reference-counted struct device is released the supplier
>> unbind unconditionally. Unfortunately there's no way around it other
>> than to first move it into a separate chunk managed by i2c core.
>
> Isn't there ? Can't the driver-specific data structure be
> reference-counted instead of unconditionally freed at unbind time ?
>

Oh, for sure, if we did from the start. But we did not and there are now
hundreds of i2c drivers that do:

struct my_i2c_drv_data {
	struct i2c_adapter adap;
	int my_other_drv_data;
};

and in probe:

struct my_i2c_drv_data *data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);

(or just kzalloc() with kfree() in remove, it doesn't matter)

and the ownership of that data belongs to the driver. There's no way we could
address it now so the next best thing is to work towards moving the ownership
of struct i2c_adapter to the i2c core and make it reference counted using the
internal kobject of the associated struct device.

Bartosz
