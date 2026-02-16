Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0DC3321C1
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Feb 2026 16:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771259874; cv=none; b=MybZ4HcGB2+tSdOeidrk4ZZhHifD0lef1STGPur80nhozUAOrZkMtY1mVmcFDuW4Aqrr1x34DlAn4diZgqhg93FH8AF4xlDH08S2JLuAejRpFqO8PjRhSh7eT2FQtFa4TS9TTOcQR5r+kXDNZQE/XH1lSuhZplVoomWVNin/E50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771259874; c=relaxed/simple;
	bh=0YFt5L3EQYeiE8fs3QZfHq0TJ01fe9XjKhIj4SeKC94=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rys64wmWEdgGHHM6uCZL8bti+FkKn3peCiDC9EeQoV+7bPcmUaQf6nWd7Rsgje1AdECJLUvoHzCqw2EF6sMgdwTPbSMvJ7jYTXS/6+AEL2Hp5hXE5fdgEGTfdu/cWVFClLp4eN9Q2otfIisuY4S1RfmCz6kAlXrAZqskNTm5osQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdcGK77Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdcGK77Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A1CC19424
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Feb 2026 16:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771259874;
	bh=0YFt5L3EQYeiE8fs3QZfHq0TJ01fe9XjKhIj4SeKC94=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=gdcGK77YiW3/cwAq/GELu8xWueAVzfj6uWQ4d+Rzl5pK6CBJ5wxN/Xz2wt80cxbjx
	 w4cElP2BknCOUNR5EIecfCWccqfNwk3h6enubeN3wx+2SM9jrnOP7ROnmN88OSywKD
	 cjvKFS5vZq/OXt+9mgMrU4uuVMRXYR1geVpEoSFgUfVCRTWGKrP0P/oJcUkRNo1o+4
	 zJFv7yVGfDUO4IilhnL+8KDRtDJYdLvoInvyNc8zvBkJ0hf90iSE3nHm/1VrkkYDXY
	 eVkzoJVtVHSGauFLNawCryfF2leka3umGYJAvA3N16KNp88qSrHv1w8d2ZtO9Ues5t
	 xn+ZNsIYxqRHw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59e607a3824so3417885e87.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Feb 2026 08:37:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWLiiW+fnx0NNE/Ltj5/13IeXjlglBqCsPFGZ28M6GWnRZXub07eAA6s3cKNiweGc0tHw7DYkYYaEUdbrC0FlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHyuFRi8tr9vxeLA1VPlq+JTvn4j1eUYbB6ST9wbSB71M8I+oP
	BtB2emNUzcxipnJytz+OkKU6V2TWHqjalyCss+3suc39kq9JvqRHTxE4My0Tepd8VpKA/8sBVTk
	WtDeEGu50f8ty/90CLicDg70HdrK+T3O44Efk/NJrnw==
X-Received: by 2002:a05:6512:b02:b0:59e:4ce1:fe10 with SMTP id
 2adb3069b0e04-59f69c4e93dmr3612497e87.14.1771259871880; Mon, 16 Feb 2026
 08:37:51 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Feb 2026 08:37:50 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Feb 2026 08:37:50 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260213092307.858908-2-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213092307.858908-1-tzungbi@kernel.org> <20260213092307.858908-2-tzungbi@kernel.org>
Date: Mon, 16 Feb 2026 08:37:50 -0800
X-Gmail-Original-Message-ID: <CAMRc=MehkJc-js=Wk9vBAcXOpazqjtYDLPUEhmbN8U7Wu2YpgA@mail.gmail.com>
X-Gm-Features: AaiRm50BJf12deibLZSaH_InveKQYoLD86Ydy4bIVqFsywRt6lKDcedjAv_Vvxc
Message-ID: <CAMRc=MehkJc-js=Wk9vBAcXOpazqjtYDLPUEhmbN8U7Wu2YpgA@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] revocable: Revocable resource management
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Linus Walleij <linusw@kernel.org>, 
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Feb 2026 10:23:05 +0100, Tzung-Bi Shih <tzungbi@kernel.org> said:
> The "revocable" mechanism is a synchronization primitive designed to
> manage safe access to resources that can be asynchronously removed or
> invalidated.  Its primary purpose is to prevent Use-After-Free (UAF)
> errors when interacting with resources whose lifetimes are not
> guaranteed to outlast their consumers.
>

[snip]

> diff --git a/include/linux/revocable.h b/include/linux/revocable.h
> +

[snip]

> +/**
> + * struct revocable_consumer - A handle for resource consumer.
> + * @rp: The pointer of resource provider.
> + * @idx: The index for the SRCU critical section.
> + */
> +struct revocable_consumer {
> +	struct revocable *rp;
> +	int idx;
> +};
> +
> +void revocable_get(struct revocable *rp);
> +void revocable_put(struct revocable *rp);
> +struct revocable *revocable_alloc(void *res);

Is there any reason why we couldn't do:

int revocable_init(struct revocable *rp, void *res);

and then:

struct gpio_device {
	struct revocable rp;
	...
};

revocable_init(&gdev->rp, gc);

? It would be functionally equivalent to what we're doing now in GPIO.

Bartosz
