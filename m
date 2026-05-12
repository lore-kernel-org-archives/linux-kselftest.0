Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB323655E0
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 18:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778609741; cv=none; b=jMcRlMByDm33pXg3Yp+JBHC8cJQyVG0eepMytrMv0rZDxIG+ivXDpqE03rfxKkhEX9A6FhOe1jhOYkVYslWCp5YIWa7fN+KAOzBxsogoGiDRkjEzloYmuwYfUzx0ZqS089UBGIuwW8ecH2s2hVdI9Uge3WFaH0B+0+V9PbY6oq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778609741; c=relaxed/simple;
	bh=w3zeFHabc0RCE8CZoof/qrEwoxqFjHFjwomgxIGxoCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQgFFLKoEqZGk3BkR1ifOA5hPU07IWBRrc1Vvehyg+3M5/Ii/TENn0nq/5nDaeyIatJfzkLKt1Pnw+2xK8Tmg18N40bAfD1qDUTO57EUJzFdg8cfn/tN2PL96+GnHTmN8sxhKS306+lMNn6hsXN0RkCAZxY8RW0zCUW1mBx/TLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oYu0P8vL; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oYu0P8vL"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso10858337eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 11:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778609739; x=1779214539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TqTMATn1TJBwDzhvgfdwIn2iY4blCTuTwL1WgCFtdYE=;
        b=oYu0P8vLCq0swYUfSu1g9uvXRnSlfpDSJzCqyjUEECHw1H1d9zRqb98JlPLD8Tg/40
         8ol/YULTqddu8iiPfkzaAWbKom/8lw1zbDIN8KblESq72USIZoLNNPeDnSnnvGZBtlVd
         3Omm/1QcKAfmmMk/w2NHs6laEQnX13wIaxXSS6iw8mHyk8EL4FMyRqhA54vwlu/MVp/T
         BX+5Jjj4iCl9suYW1qb31B8rIyGZJ2GSUs1SvrWNKh5UF1a4bBuXUf6sB/KKsXWImWdO
         aNNohZJW8VnnfmMh64DnIYGjDYqPr1X1MC11qjhml/ob4Va0H1yrqvmwMbAn6Wk90Chv
         M6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778609739; x=1779214539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqTMATn1TJBwDzhvgfdwIn2iY4blCTuTwL1WgCFtdYE=;
        b=XVLwcvv59ybpE34vigMgoY/LQiq9QlmgbYFpNeEnte3oiU/9dNRgrxMC9pNCkzZwzI
         6ddU59B/APQ+IsKyeuw2/OY9DwYhxkSAaYjiZz7B67zlB2KMkeejXSIhYJQij1OMRHW2
         YLym4wTynGjh3HY8xWRvxkGLE+VNebvweWHfHpSmmoNlULfX5KwYzmGq5O0FCdp7lXrY
         fPosh0idCbvOqQ4/mdGBQu+mjVn04f7Zug3oCjKEyXc9XkpcUZBEVJwVo/xSStmlIaXE
         DarlllUgszOv9iltMPw11RaEXOGmv1zgHOqXgGIvPLN4ZoBXXLI7CtslNr+SWIJqdUXb
         L9BQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YGWIPPqRV6fZz0LIXoEqS5qPCLpjI29vN3GMRugtNBHtAnUgAn2c+hEVLCbwtcBLO3Xgi8ashLCRufdLGXyo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq8n4qHsqOkqFIYRyx0zyBSsKpJIfTPP1Hac4FHerwktKmn77r
	tLRt16CuGQJYyjRQu+v2uQ14x+dmK+uxbYZ4d9KShqEMFQCYitUHNiuW
X-Gm-Gg: Acq92OHu+H0+yA45z1ADfnCRQHWBCbmCkciMZAIkAJfHc83odHYnNrb50iZl7uae+iQ
	uyFRtiThmv7AVaksgGbpAG75/NQTVDA3kX604QsN2h0RjEIfZDRX4+k45D3SkxaqBphRjTlHZgJ
	H7nEeu+v4hBGU9729SL1NgmrmkXJ155AnPZiIBegrKYPof8Iq9nYYwpmJNj/q7RcoNv6a9Azz6d
	Lqp5uk4Q1r4hSc8SwYT71iOQhhRoLzssFcLpuKtn6F5kLXPmMnSAXIhegiVuA02iv48lO+o63Yo
	ZDngET9a0/JC4rewf8Lxytmz6Lg0USRpkQhuDqQU4+ceVqpj/6yTAezTmNtOGW45v0LkYzCEoMU
	FJWvdwG1FOJko4l10l2QC7Mrss6Qy7rj2PhkzoFZ2MWuH/dybDKxUzz784bt9ZEhz7oaYfLEo3G
	TrUMDrZkldEXO8jKBXrMKRZ6ht+MVeeowG4g7MGbI0IsrhkC1Pv7PaLTpNNZ40+WfA
X-Received: by 2002:a05:7301:22a9:b0:2f5:6dfc:cb6d with SMTP id 5a478bee46e88-301187bab75mr130655eec.11.1778609737694;
        Tue, 12 May 2026 11:15:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:84ac:d22c:b037:1a93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847502fsm22940594eec.14.2026.05.12.11.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:15:37 -0700 (PDT)
Date: Tue, 12 May 2026 11:15:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, brgl@kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, platform-driver-x86@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 3/7] driver core: platform: provide
 platform_device_add_software_node()
Message-ID: <agNrB3BeIgFlZimz@google.com>
References: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
 <20260512-swnode-remove-on-dev-unreg-v5-3-0035eff63812@oss.qualcomm.com>
 <DIGUBLZXZXPJ.8CX0K5EL6255@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DIGUBLZXZXPJ.8CX0K5EL6255@kernel.org>

On Tue, May 12, 2026 at 06:31:44PM +0200, Danilo Krummrich wrote:
> On Tue May 12, 2026 at 1:59 PM CEST, Bartosz Golaszewski wrote:
> > +int platform_device_add_software_node(struct platform_device *pdev,
> > +				      const struct software_node *swnode)
> > +{
> > +	return device_add_software_node(&pdev->dev, swnode);
> 
> I think this should be device_create_managed_software_node(), see also [1].

The main issue is that we do not know if the software node is registered
or not when platform device is registered, and are trying to use
heuristic to figure it out and decide if we need to clean it up or not.

You need a new variant of device_add_software_node()
(device_set_software_node ?) that would bump up reference of already
registered software nodes but if node is not registered yet created it
as managed.

Thanks.

-- 
Dmitry
