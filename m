Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E303BBFD1
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 07:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783409233; cv=none; b=tEYskEicZ2dFXnx/Cpt84018MMfYsyCwwTv8iIZ+bYtVT5DBmddl7kT5sOax3VLkgaVEbwXY3QJ9LK8KTAxJkf/A6Fj4k7SWQnqqjFCVXVomlOFdp6Rp7C2NaunKI7dMqMTwPDabWX9+OweCR/OtVCi7NJZG+ixOpSGgHCrDK4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783409233; c=relaxed/simple;
	bh=bW4Lcl+ROSBNPUrB8CNA2HrOrOhdvNO7Bz253DXWnn4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWdKEFwa1mSeP0r6xgt0Ngqkq9NcKr02fc8Wlx19xazootjLLwDB1anudPD5RVqrru3bVimbnnzq9bU3ylPNaqhGylX21yiI30KXQl6L4JJs+oDmyk6iaDabKpxFYKszd4NKthP4H2/ZiJPMsAlD3alWdvXd6ZG2js+P+nuxLZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cETGzNHt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cETGzNHt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211E71F0155A
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 07:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783409224;
	bh=ZrZGOwP5B01XzisV/2lSakcRQu+bfQOZKRCHG+hKN8M=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=cETGzNHthxtLXPaqaAF548RD9GSQTCvlXyuY+TRanmCcB/GUqkZqjv0e4gGXJetsM
	 u0RnwRIICdUz+KWrglcwQrOA8vMeBP2zA4X+4B5u5ykXhPzgusn6FXBWYlFjqakHSh
	 ce0XKPZdHnXvpBYj6dJI0z8LaAy+5Gs5KyRSkmeP2sNNeu1qpa9BWjgZZB88kj4caK
	 qLhODutEBjPR51JpQkX1Mj4bb3t4wLUphv/UjUZZnueBLSawz6BodI7LBbKvIf3koW
	 Wj/fE3dAFrL5JKaT7keQcLEwB28GqVidWmFMm21hQoJjpH3uOERqjKqxXxL3oZs/3e
	 iGOiCRT5z04QQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3995e22ef81so3156741fa.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 00:27:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqumBSpFn6kdTiq01Cl4jfoMPR7xKVK4UHvmuv/uanowiHLwQj3HPGZ0hVEQ1s1yjCnaHT1EIAkvufy0rvZkzs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd6qKEYQlClBG050W3dO70ScfHl5wXweWC4nFHTsmVpy9L1k7B
	PMLIijunOy1i0zZW06euqKoxZBGrRYNUauaFSozx8JUqRSwTF0+H6ZgMej+r/ROaxg0dZbKJkht
	IUhdHaZGBHnD7apaORapk+7KPRUAsWNGL3o8J0FgDfA==
X-Received: by 2002:a05:651c:1a0a:b0:396:ade7:4153 with SMTP id
 38308e7fff4ca-39c697222ebmr4269631fa.0.1783409222850; Tue, 07 Jul 2026
 00:27:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 00:27:01 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 00:27:00 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <akwKlx2uTtHXI7zT@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
 <20260629-swnode-fw-devlink-v1-3-b90058b41839@oss.qualcomm.com>
 <akKT8q5TjkMkZkmB@ashevche-desk.local> <CAMRc=Me4oJG47C2LOzRvagbEtAWKqbzmQ_R2VG4rt6zd1-QE5Q@mail.gmail.com>
 <akwKlx2uTtHXI7zT@ashevche-desk.local>
Date: Tue, 7 Jul 2026 00:27:00 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdNfnaz0e2P32d_jWdsvtW1-zNF9ddUx092K3TUgzB7Jw@mail.gmail.com>
X-Gm-Features: AVVi8Cem5ut2dgsOwY3Bh_PHkM564EYcgUEVcmUCNMvQrUrYuAW0mstnDj5h-8k
Message-ID: <CAMRc=MdNfnaz0e2P32d_jWdsvtW1-zNF9ddUx092K3TUgzB7Jw@mail.gmail.com>
Subject: Re: [PATCH 3/5] software node: add kunit tests for fw_devlink support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Jul 2026 22:05:43 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Mon, Jul 06, 2026 at 07:42:36AM -0400, Bartosz Golaszewski wrote:
>> On Mon, 29 Jun 2026 17:49:06 +0200, Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> said:
>> > On Mon, Jun 29, 2026 at 12:52:08PM +0200, Bartosz Golaszewski wrote:
>
> ...
>
>> >> +	static const struct software_node supp_swnode = {
>> >> +		.name = "swnode-devlink-test-supplier"
>> >
>> > Keep trailing comma.
>> >
>> >> +	};
>> >
>> >> +
>> >
>> > Redundant blank line.
>> >
>>
>> I actually leave a blank line between static, const and regular local variable
>> blocks for readability.
>
> As far as I know this is against the style.
>

I don't think the docs mention this particular situation - correct me if I'm
wrong. Since I wrote it, I'll likely maintain this file and my personal
preference is to keep the newlines. I hope it's fine.

Bart
