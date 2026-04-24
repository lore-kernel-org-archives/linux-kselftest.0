Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B013CE48B
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 12:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777034083; cv=none; b=nre1XLTMtYcmNiTyptxrAmXcp56SAWOpjbvXEWH60bMmP773PbgYxrhSpq968JhWeMFuN2yzR8fDNNSTXmvwlz2Zn0fpS241TJ4QaCWYZxw7rbSQop7/wbF0gnTWd5nfju04xN4OFyGZeJqE0LPvtyY89LdSlzJ3lVDXHafT6C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777034083; c=relaxed/simple;
	bh=m+OoYgyiHNEk7yq4Ca/NtHf600W8zJqD9UbhPddCZuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XbKFNLMrb+69AbpPJAcRjanlMR51fJxLvhKgOlsfsBbZlG6Qms4EUme4uBc6jy85VEYZ/lFsEhcI4j6zQGVxM2tY/Y53KoveoWyTf3XHJGofhUgZFfUOFdsmfYKZDJG6CN277AGSPBIk+oAldHuM94AX0hz59Mol1/hUBsFTuAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OPaEHadj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OPaEHadj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0818C4AF0E
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 12:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777034082;
	bh=m+OoYgyiHNEk7yq4Ca/NtHf600W8zJqD9UbhPddCZuQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OPaEHadj67HFlakyJaiXvs/+BrRruyYHULmkrCV29047I/93ZgCyXsmQhQKkIhLwP
	 n+zvvf4/vhOJZ3XeSgPchDc5kbMg7p4mCsaFj1V6SjxeAQ6OaliW1iWnoBXLWh/7g3
	 M2DTOIU2HKc3EeDP0pBSvAvfYUWEUXIDHxxu1FEA3LxOF1qBtRmgy5AYXgUBjKV+Hx
	 v7nWeIcn1MbN7g2HcqjCupADQ5zuUCWxgqV1gTf49iOB6QDICV/J56VogHohVhWDwl
	 Q4GC0xXfYww/jJGejUQMJQxQdLvDs56mJ9rU1uFP227W8NUQl3pVH0vgpQ3N0CnoKj
	 XU6aLhEZ5Uw4Q==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38e7b8e3f38so65484831fa.3
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 05:34:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8bjE+3nYf4xUyeynqM4GVVtHSumPPNdE1JSdu8Bmf3SRN+oV9vsacwTOzWnYgKCjmt5sII2XIl8k4DQuqBiGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YytUqUWDNCW23MuKhAzJwTKyXGWbSrABX79+vB8Jc9bkvtKxyn8
	Y2PXunYDIVA1rwjN+raUsZ6up0zalijEnYxjgZGdu4GJg+fAFjr3ATAxy4uKCuLpqAMzBuke6qd
	+HVFCLOOOjzQrEbDM4E0G2YGFp1lb9Ls4NcZm4fUzpg==
X-Received: by 2002:a05:651c:325b:b0:391:1570:b6c5 with SMTP id
 38308e7fff4ca-3911570b96emr20938741fa.17.1777034081529; Fri, 24 Apr 2026
 05:34:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com>
 <20260423-swnode-remove-on-dev-unreg-v2-1-0e5213cde2ed@oss.qualcomm.com> <aesxXvf4hpL66TLz@ashevche-desk.local>
In-Reply-To: <aesxXvf4hpL66TLz@ashevche-desk.local>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 24 Apr 2026 14:34:29 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mc92zOdjz-8P2A5og=mTKFUKrj3o7Z28NDdkMktDD+tuw@mail.gmail.com>
X-Gm-Features: AQROBzBx2G57GMx7dNlg--UBoIX0krf21Q2tN3Bc5FbxVTIdDuhn_VooMcrRNNw
Message-ID: <CAMRc=Mc92zOdjz-8P2A5og=mTKFUKrj3o7Z28NDdkMktDD+tuw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] driver core: platform: remove software node on release()
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

On Fri, Apr 24, 2026 at 11:01=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Apr 23, 2026 at 02:12:02PM +0200, Bartosz Golaszewski wrote:
> > If we pass a software node to a newly created device using struct
> > platform_device_info, it will not be removed when the device is
> > released. This may happen when a module creating the device is removed
> > or on failure in platform_device_add().
> >
> > When we try to reuse that software node in a subsequent call to
> > platform_device_register_full(), it will fails with -EBUSY. Add the
> > missing call to device_remove_software_node() in release path.
> >
> > Make sure that we still function correctly if a software node is used a=
s
> > the primary firmware node.
>
> ...
>
> > +     device_remove_software_node(dev);
>
> >       of_node_put(pa->pdev.dev.of_node);
>
> Can we rather replace of_* get/put with the fwnode_* get/put and make a
> conditional here?
>

I thought about it but I'm not sure why we bump the refcount of OF
nodes but not of the firmware nodes supplied in struct
platform_device_info. Maybe there was a reason for it. That would
simplify things.

>         if (is_software_node(...))
>                 device_remove...
>         else
>                 fwnode_handle_put().
>
> (or something like this)
>
> And IIRC the above pattern has been already seen somewhere else. But I ca=
n't
> point to it, just some weak memories of seeing that already.
>

That needs to account for two software nodes, I think it's fine to
call the two in sequence unconditionally (like I do this this patch)
and just dump the refcount on registration as necessary.

Bart
