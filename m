Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E7040626A
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 11:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777375004; cv=none; b=LUEerWHsoeh2UN9vK29yjo5GP2VTO/Ou+TDe+uDdykUAH+Z1YquF4uFijOmLP1ulxJSAQ1mAMiIz+4xgd9w8n+fmH7LW1UXnAJaoqP8I5+gHPQ7CgnNFIrD4LR9JBfFD+vIkEgxqsuOR6aNOhNFPEIcq8hSP6k9xYgA296Z2H24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777375004; c=relaxed/simple;
	bh=Wq9eQ0U3oFgBMtuskrf75Eeq1ZUexeO3SV4ewSVxpt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ePrZN6ZF7XTXUSnDec+QZaSJSkdQmxv65tzHUFjzgEzaQD4uX5ta96PoIgPpBuiOL00K7tQrrbg5jlfygDBYIognGAlkSebhie7s3CiQ9CbMjSwjcKzyLDmXyHCbqU5gcoqB1G5POm1Z5Fa71x/GutHSHSBUym1aM6t9h1NRV+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOOlyJSU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOOlyJSU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F83DC2BCB8
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 11:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777375004;
	bh=Wq9eQ0U3oFgBMtuskrf75Eeq1ZUexeO3SV4ewSVxpt4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UOOlyJSUBnY8VI3iqNvKH5yWDNcZCe5hEbE+oCTd084860Z+MhUGa7ag/HmiQVdYp
	 RbJCHgVUGTf0eWIL7eaOtZIP2b+2ZVKVikcJvbcJACYk8tSSlNamkMhg1UVx9b1TVa
	 O5JTEbDjxfdUULJqEnrsPXAmtdWToujXF1L29WCWwV545mK0X0lnnik/H2DXlAh4W7
	 VF0rov+gcYIAEvsYT4bIcU9lZOVmOx7XXMtB6WRD0L+ln+ZNa42e6qcSIfmd5Y+DOX
	 EDNC7F9iq9yG4w0QO2LeBYI150yf+qE2iYCO1wG2O5nnxpZOevWDOGPDWuD9NaMA9/
	 GUB1uic/o+slA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a62f43b76aso5689170e87.3
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 04:16:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ptJTBf9rN+doGmOdLcalZIux7vVF7hGHxhQiHu4WdsfY24JdIpTXGwbznHJ6pHyXj+hhKHtZSuK6WWJnl2Qg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7GqhQqLVwplVf9tZWkc01GjcfN5hO1NNhTluN6AeMcXqAQhhi
	IR0Hta7TAnBVuXjZFItidb8BJ7GgMuq5xh5+DCSxhd2nbcgYgta/bFs82Hk1E6fGo3jPPaKRPQX
	W9/5ZpZD7wTGYDzLCvMAEfXPzp5UnccJcaslElqgkag==
X-Received: by 2002:a05:6512:3e07:b0:5a3:d1d0:543e with SMTP id
 2adb3069b0e04-5a7466114a7mr1282915e87.36.1777375002682; Tue, 28 Apr 2026
 04:16:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-swnode-remove-on-dev-unreg-v3-0-533bdc71b22e@oss.qualcomm.com>
 <20260428-swnode-remove-on-dev-unreg-v3-1-533bdc71b22e@oss.qualcomm.com> <afCVn36EO4w0H0vS@ashevche-desk.local>
In-Reply-To: <afCVn36EO4w0H0vS@ashevche-desk.local>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 28 Apr 2026 13:16:30 +0200
X-Gmail-Original-Message-ID: <CAMRc=Me4iPj84BdaqYRX5W-4XA1rCws8h4fe2jb=N+P9t7UMPg@mail.gmail.com>
X-Gm-Features: AVHnY4JgItnqkmPf7BwOOJGVMSpnY3cEMfAgOjZqqJT4I80cGTpvt1s3o5jMJw8
Message-ID: <CAMRc=Me4iPj84BdaqYRX5W-4XA1rCws8h4fe2jb=N+P9t7UMPg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] driver core: platform: remove software node on release()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Andy Shevchenko <andy@kernel.org>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 1:10=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Apr 28, 2026 at 11:20:26AM +0200, Bartosz Golaszewski wrote:
> > If we pass a software node to a newly created device using struct
> > platform_device_info, it will not be removed when the device is
> > released. This may happen when a module creating the device is removed
> > or on failure in platform_device_add().
> >
> > When we try to reuse that software node in a subsequent call to
> > platform_device_register_full(), it will fails with -EBUSY. Add the
> > missing call to device_remove_software_node() in release path.
> >
> > In addition to the above change, make sure that we still function
> > correctly if a software node is used as the primary firmware node as
> > well as disallow using two software nodes for platform devices as
> > device_add_software_node() does not handle this case correctly (in fact
> > a comment inside it states that only one software node per device is
> > allowed but it will not bail out if two are used so we need to handle i=
t
> > here).
>
> ...
>
> > +     device_remove_software_node(dev);
> >       of_node_put(pa->pdev.dev.of_node);
>
> So, why do we decide not to convert this to fwnode_handle_put() (and resp=
ective
> _get() elsewhere)?
>

Yes, I'll do it separately, I don't want to shove too much stuff into
this bugfix.

> ...
>
> > +     /*
> > +      * Only one software node per device is allowed. Make sure we don=
't
> > +      * accept or create two.
> > +      */
> > +     if (pdevinfo->swnode && (pdevinfo->properties || is_software_node=
(pdevinfo->fwnode)))
> >               return ERR_PTR(-EINVAL);
>
> ^^^ left for the context.
>
> ...
>
> > +     /*
> > +      * If the primary firmware node is a software node and there's no
> > +      * secondary firmware node, the primary will be affected by the c=
all
> > +      * to device_remove_software_node() in platform_device_release() =
and
> > +      * its reference count will be dropped by one. Take another refer=
ence
> > +      * here to make it have no effect.
> > +      */
> > +     if (is_software_node(pdevinfo->fwnode) && !pdevinfo->swnode)
> > +             fwnode_handle_get(pdevinfo->fwnode);
>
> IIUC the `is_software_node(pdevinfo->fwnode) && pdevinfo->swnode` may not
> happen here due to the above check. If I haven't missed anything, this ch=
eck
> is simply
>

Right, it can be a simple is_software_node(pdevinfo->fwnode).

Bart
