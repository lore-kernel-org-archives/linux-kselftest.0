Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15BB184540
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 00:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773362047; cv=pass; b=UgU+kDwNB3u4R9csrY8j9rARMbFlYm9uOV6+HCD0LDh2nCebwEYhX8uJvHMH6mbad6SC62RF/K4Mo1s+JGrMrIV2xAJofEhnxZS7w+WXKvtyQ14wwUEnnEgUgOVYXDgST0IJyMGqR4tK46YPucMDREvB9RCzhX0B5cOI5xD5Uuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773362047; c=relaxed/simple;
	bh=P9DYNvw0pXgKNQlqCuTgX5BsLWxpM/GHGwCmn4gqBFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KTjqacm/ymuBgAO+BWQuszGLxjvTpW0IrzU2hpYLvzkFe0+oJfNdM48shnW64K4nhXWoEZDfRyLAxIm9SxE3xamfxwaMnx094c5WkoSps/hGtaQBNGsSLWw+RHkzU1sKXvo00SIs8L3UilKVRlF4uFGijWTP55ypxFzOrE6e/eY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Vo4xbcbG; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Vo4xbcbG"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-661d929219bso1884185a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 17:34:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773362044; cv=none;
        d=google.com; s=arc-20240605;
        b=KDcKrweT1wsR+4gcXypUMTWZxhUviGL8XafkNP9SD7DLAUcpJ56E2ydwfdwozbIwjH
         FgKGDTalhdwMCs5scENWngqJqVs99o1q4xsocwOqKj7lSxnM0OutuPC5itX4hzgYbZZa
         OACNj+Se1c1yvlzT68b9gMWaq8q5vkDo/boy2XFW2X0KfTpYXZMZF/CP9xB6hJpVA/zi
         GtmFaVtdhywJePMnJBn5DqiGggZnQxL331mZOPzcXzM41CHYu71xypDQ/KPe4NfXloh/
         f0NnX7Bf+l/5yaSP+z4ls55aJnkk3/K/nIi8fpj5tUgCSb4aR5tx8+hScvndIZHWQXsD
         WsbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pnJL3Iw0wwI9nfGsL4UNGadpWjx4M7Li4XWaHu9e8Ms=;
        fh=TGKx5TtN0hW3xwPTYaa+AmKzOXNPk9ObgEoKqQ2k4/0=;
        b=LMgWkuNDPuc6sxmQJZ6hqeRk9DhK/tS3kcqcf8zOfLGN8jNI4Mqpjk/IrNV2IP5vHf
         ZEAnKNMvhMkyV/AvafGoTRwbAIsgfWp7LFcbSJoMkjsodGeDLgAsVvAYPG3XCFYgzwAG
         FY/aZToKyvJEB19xFJo2pCr+otTdqV6Cu9H8pQYU4Jh8fhk+lHo6e4nZn4DoKVx3mHRr
         ALnsveBuiN/uOW4TL5XFwOuVuHkRJrQv7bq6Z5sueKz35bIWfjEyPXSGSln3BxmAcUVp
         VN4EHQcRtwtUY7au8PTRjn0SMts9S3KU11YPQws9idGXh4NkSVjOFbDGoEx0eoGPN4n9
         eMig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1773362044; x=1773966844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnJL3Iw0wwI9nfGsL4UNGadpWjx4M7Li4XWaHu9e8Ms=;
        b=Vo4xbcbGVbDxB47s28JvwRyPuGtfhUdWydhmCZfZFIXwIoa4Nolcq1178Ix2aIR7FB
         r8v2I8q08uXsv6RRbkQyx/J8IkETMYbND4jJfuRMx+DOsB9K/PAnXSOpk/xGe4+FFVnY
         NPlR4d3w/YeSU9Y8BQRRUEGhqf6rDJX+b/7EAqF0bpeIputpz3HhnhP9env9yyvlcV8M
         6CF60BZb/c/ASGteI40pQ2Z/NPISEnB+B2jy+zyZAowFpJq3PvcpHATD/DnA6DihYKpc
         S1c3ryc+sbCygNaePFMbd3OB4TYVGxuhDi4cyqcpW1WLnQsu9ucW9sm5xTK7TLg7cS3e
         p8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773362044; x=1773966844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pnJL3Iw0wwI9nfGsL4UNGadpWjx4M7Li4XWaHu9e8Ms=;
        b=MVJxtgRcP1lC5SI6gUcBIsXeV/PiT4G7wnBJ84nfsoR3PwfmLZROdTsnaTAFjq9DLS
         QRBP8b0f8X1iOdIpwLR7rR8DKh3ouzf0JWbO3pqIFRv9W8cCmqJud5QAG5Ri0CyqgT3J
         lzg+unium9/iRux84m45egAQHaQZFEBv4HjVdvNqkwBaDX9JCNzqtoS+U5cTUSDSfLjS
         bD7rl7iFSWaGfnTumJBrDxTkMDz+wS849uyWGm9WIR7c20XqFcVdwbyEsmewUDtetasB
         krET0v30V0uie9FP4na4o53QZQE6+PY0Ue9oCSyG7k2tTRlx9wp4lY650RRbOan96TuN
         u26g==
X-Forwarded-Encrypted: i=1; AJvYcCWjuDqkmkNFMKw0CGvk7wuFo0DGsrbEqxgfSbWrHOYWSMyM3QbJrlqrjigZkj2OaAbizzst9agLBlOdB7Joxyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZwaMOfjcaTED2DflaURdrA6crzdtfEtvnAfZ1gvOeqDovUW4w
	0PacZXZ3H0xknDND/DILB6UCDhvzxPUdqG4EhYld/q8xf6aXA1Yq4qRonPE1pF/tBk0BYtL13OK
	ahO74jjJYqVz/Dnq9ywUbHeSpMnw4iBBotE6XqC1+aQ==
X-Gm-Gg: ATEYQzx4Fbzu9SnDJQ+XrItjqLYKBDJpyKTyYsEE3m8rAqreWGK6GXJln5HUxczrnS4
	gfsltPqnN9TUQ+6zpQR3iEfvswo+/lrkFn21m4ZMsTzeSy2UDPRg4b+uVATDzmZsfcezm4M0n0X
	l4ENnyzquduxXk/JcQGPxpC3EeWKVr2hYpbB2e7SOj7QSr7O/mAOq3Vhay/tHKkNCBW5UZZ0Wuc
	tYW6LAtwH6Vuww2thKuUDFkMPVSvoIONVsghU3j8nysAwsm+CoC7Yfxsi70hKa2ahZw4BhY24J/
	EEeAy5HOF6mpbpcVq3gVxsTp54a+46QWbpQfGQ==
X-Received: by 2002:a05:6402:3486:b0:662:e094:8dcd with SMTP id
 4fb4d7f45d1cf-663bb3d3be3mr643429a12.27.1773362043907; Thu, 12 Mar 2026
 17:34:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-8-dmatlack@google.com>
 <20260226160353.6f3371bc@shazbot.org> <20260303210733.GG972761@nvidia.com>
In-Reply-To: <20260303210733.GG972761@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 12 Mar 2026 20:33:27 -0400
X-Gm-Features: AaiRm50W9P4A7h3ayFJS5r_ZVIe8OM2EYEDEiGqBav5AUONhmByKJOVge3skGH0
Message-ID: <CA+CK2bDADhFcMVGoJew9RoJ-DsVhYhiZJGJVwfzTBZdGX++8Ng@mail.gmail.com>
Subject: Re: [PATCH v2 07/22] vfio/pci: Notify PCI subsystem about devices
 preserved across Live Update
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, 
	Alistair Popple <apopple@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankit Agrawal <ankita@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 4:07=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wro=
te:
>
> On Thu, Feb 26, 2026 at 04:03:53PM -0700, Alex Williamson wrote:
> > > @@ -203,5 +225,6 @@ void vfio_pci_liveupdate_cleanup(void)
> > >     if (!liveupdate_enabled())
> > >             return;
> > >
> > > +   WARN_ON_ONCE(pci_liveupdate_unregister_fh(&vfio_pci_liveupdate_fh=
));
> >
> > This is propagation of a poor API choice in liveupdate, the unregister
> > should return void, it shouldn't be allowed to fail, IMO.  Thanks,
>
> +1
>
> "destroy" functions that fail are evil. :)

Generally, I agree that unregister, free, or destroy functions
shouldn't return errors. However, this situation is tricky because the
state is controlled by user space. The only relavent scenario where
this function fails is:

"-EBUSY if the live update session is active and cannot be quiesced."

If there are active sessions (incoming or outgoing) with preserved
data, how can we safely unregister while they are in-flight? It is a
rare condition, but since the user can cause it, they need to be
notified that unloading the module right now is not a good idea.

Pasha

>
> Jason
