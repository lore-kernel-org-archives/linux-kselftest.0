Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8BF194AE6;
	Tue, 30 Jun 2026 06:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782800234; cv=none; b=qkpQQAwQYPIFgZL+Ui3j4QP+nC42LvmiCFi25IdkMy/lqJs/K+RKDNvWOBJu5kB8yMNylEAMziWxVVvyN8Cj2yb/aFuyLz1xktW13jDMK/PxBVySoBsoaHwCD//2vRuzcYC+MKQSlaQYiszGMdXEYk/DndrWBEc+dVjDwsljHUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782800234; c=relaxed/simple;
	bh=jz2k2iwFrmYI3ZTUmJ0Z1YTYakjlnqOufzRyadR5KZE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jd0unXas9T5TdWBahokBPZpn4FFSD3grfyFZON/c1V+CffU9dnw+ob2WPlcfA+mwRSIR6Qu+wB9oO4Mtrg97tbigFVA9psaMxkMKXTKNutmqB0iOHvgp7cvxVpvfBiVhKSfEghb7kChs3H3Pr1TjSMSMwemPMjT5uw/qBe8PNzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XwtMK7zr; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XwtMK7zr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8E10CC51472;
	Tue, 30 Jun 2026 06:17:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3163860233;
	Tue, 30 Jun 2026 06:17:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44F7A106F1BFC;
	Tue, 30 Jun 2026 08:16:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782800207; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=x6tJh5JyOoEZq/6xhRs/YNQm1w4SzweRFfhO2imvZJk=;
	b=XwtMK7zrCeSFLHpRcwZy/qjEcOO72V+i5zT3jGUjqrhewBddhMq6SHRPegeA+Hgb8XN7OC
	dMs8NohO/cdJHvRGEblaLU/RC3Md87YXwEKVkTb/V7L1UcxmpsE//KRzc3UWp5DT5DXc70
	3Wwq1iwq0xX8Q6Nxd1XGhNfwApqqOQQEUklmto/Vr9CbphamwBJkz+89Bjrg7P7eBYcnUt
	aTZgphCexSMW3/yocbgpalK1IRVCUWlmC+5Th45fLoVZveAkhHm6J57DeyhyZfxexdyFl8
	F46V9u5ADO2jNaZHywR7gVehz1jE1Ec2bu6wRtM6viRMg6vl4hzMF/I+u7z9cw==
Date: Tue, 30 Jun 2026 08:16:39 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Brendan
 Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, Rae
 Moar <raemoar63@gmail.com>, Daniel Scally <djrscally@gmail.com>, Heikki
 Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
 driver-core@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/5] software node: add fw_devlink support
Message-ID: <20260630081639.04476d4b@bootlin.com>
In-Reply-To: <akKSYKH2vyXMVcox@ashevche-desk.local>
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
	<20260629-swnode-fw-devlink-v1-2-b90058b41839@oss.qualcomm.com>
	<akKSYKH2vyXMVcox@ashevche-desk.local>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi All,

On Mon, 29 Jun 2026 18:42:24 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> +Cc: Herve, to just ask the situation with one series that adds nice helper.
>
...
 
> 
> Doesn't Herve's patch(es) add some helpers for this?
> https://lore.kernel.org/lkml/20260511155930.34604-2-herve.codina@bootlin.com/
> 
> Ah, still not applied :-( Perhaps it can be applied as just part that brings
> fw_devlink_set_device()?

Yes, still not applied.

I plan to send a new iteration of the series rebased on v7.2-rc1 and I Hope
it will be applied in this cycle.

Best regards,
Hervé
