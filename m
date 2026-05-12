Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E853C5552
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 21:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778619623; cv=pass; b=bERIxKIZZZpNZe/garIUlDZhxzQsO3aPMYDsQBiRfWqnql8JzGS6mH+cR8Y8U38vd4sg5Qt7ddUG5BalTjNRmV5frV9SyaoEFAKs3qYkO1WyEMufVkRAKXyKCovi5ApnFJfNNL+ZPRqsnByOFNPAh/LBnCA74lddikSeVBZ5CxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778619623; c=relaxed/simple;
	bh=yjcYpwM0bNWA8F+oMBSlbnJX7nZ+1khq657ozFenk1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lMlQy0KvvbWnVDDoccJgN1EzFQ+dBsO1F8WA0TbSNLQAD8PN7bJZAMd0+qV9RlIi9ccQ5kf91zRQNM+Ob0FQLn6b+gCgnU3fcj4Xv+kb91OHV5psxSbgjS2w+MeYjF6wb9+eEaOm3aLL1Xymp1hTdSJXY5WC5OLTySleiCz/5Ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KYU5vNgn; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KYU5vNgn"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-130c9dcbd25so5675095c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 14:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778619619; cv=none;
        d=google.com; s=arc-20240605;
        b=aSFWGV/+HPFp3q6RmXh1Fga9+THMOiLNOXkEvA+tn06mw2rtrcM2wsOnXErTHAx20I
         FBTjhLhm1x/g/1v2vVxlIU66l9fg8tNzRJFodvh12yB92FrD6aT/QI7wNHlPTnZsyTJh
         YuQQz63NEWPpMPiBXAXgj2iLpg7ws7V7ZJMz7tqKxU+sk/zRfTw9YobRaNC59/7CcUKP
         Pn/p/bB9T3A1ckX02fFFatH8FbsSXjNL0vwtYvP5UvTHcmg/VDLDZmOjM39oXalZnDTp
         uTLZza7IvF7lxlHwJ6hMs9jdJjTpaC5JWhwDoQuK5a0Qvy8TcNePo4WB+CcpVrd6xy7L
         OUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9t69VAH4Nc1O0MVDyKt+JQMOR1DA7dJ94HBiu06W+HM=;
        fh=j+Y0xEogloijQBp/N4rSgy5lb4L/i5VcS9hdAn3vqgE=;
        b=dLSzqGW4r+Sjxi+ZlAQlrMPBVvxgKcReunydYQc3HjWVspSYZJKtTDWofvv4sm+9Ai
         mZiioMNPilOCbRdxgG24XoOk8srfyfxvmfWERbAos5WrkokZZOAOnUBI5RXwlBQqrvmM
         cD9TwDmMbz8r9s1qnyT4riHtPMtmaVCSqIsM8cAyg2eNtI3x9VoffXjIcwai+XMedCOu
         wjHPYY9aiKaPH1GGk3AGpvKnLvPr9E6w9vOyE6vKf/424WwoWxghzr4QjlGyoROaQFg5
         9aBwlqsmVooUFfRvpTpQ/HhnXO52JIrggRqeanDlm+BTy4EsgRSYE5wFQRe62DqyzqZA
         MsTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778619619; x=1779224419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9t69VAH4Nc1O0MVDyKt+JQMOR1DA7dJ94HBiu06W+HM=;
        b=KYU5vNgnDBBJPuWlxf7lFR91IHbrV8OkzR3trOdGVz4KIMAWskUuH1oyFcJQNd0DRu
         w9wrP8xMj0EL1TuFo8QxPIdL2PJ17f1TJ6tlpbG9ibsue1EWsKm6FER6163MD3rEZQ6S
         iJAACQAzV1vdNBgf3Jy/7BRVoaRtfrELpuEeQpbRdfEAi6Bf8w0RhPg4jSA+Nna7c7Ap
         ighJ8xRz8+xXr1/s0ERILzp1adkUgDz/0kgugFZc1kLMlPBW9FYVRTeGm3CoBPJDynEV
         3orwTuARevjTMKC6XyOm4eEemo8WIm4W6GukN+crwCdqN3ZWdkD9/9216JtUvUvbSv2f
         oZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778619619; x=1779224419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9t69VAH4Nc1O0MVDyKt+JQMOR1DA7dJ94HBiu06W+HM=;
        b=hd539vM02QqP65dK/raJE4zqZzqX4AhCRFncXJ3DSa45CLM9O2NNm1uNzjSw8UDYRo
         7BTOmloC3vmTYtTzRJjkb7ChyYVFwbv6o3SZ3nkH1AuvHyutdvcG6YZ+uPMfKK6A5oMY
         95mPaXXy5lEQ/MsQFnob1gP8HRCMDYiVyO9nJo8h/Iy3/kiIZpA5hi1s8DDHuRSyYQK1
         blgssKEz75WTFE0S+cmN+ryyOc6nigkW6kzsnfaFL702wYloohP3KHSYgeComY/fdrAs
         G+pIW3nJ80rbhDCaFas9z0qB5/vNZ7UTGcbkOQu5damH1W+Oa7bQoUasiOTzI7vrMbZn
         QD2g==
X-Forwarded-Encrypted: i=1; AFNElJ/BN1GF38nA5roJ1sJTnXWQIZ6nuAx4Pb0gBuxOHPyGNY3QTWo4P+9cYs7Ey5UnpDodohmfMb5Obtz9rate6ik=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq8zfjCmcGzEq4HNtizccK4lZXfljKyZPrIHS+WN8HoD9x8l/D
	l02bKclbnqz5GRk0k9cz+fcYPI6rDWMaIHPK8Akr0MPpJeXYHuxz7PD+Ojlxy2Xnvat4oqnxgP1
	GyIuLYoCWzf5cw6hhO7sr2uaiTK4PHmIZ6xESR5jr
X-Gm-Gg: Acq92OEA89zZynWe7a4JzdvjwIl1lHtKSfaIdBN9Z4CvdAiR7cOogOfF3EpqCOyhQGv
	7pk9oZfJZngzbEIfc5lfbR7t1DlgMniaDwQxeMnq6NvuoM2CpAVTffZWmQ2ygJQwIgJL/1mj7B4
	rZfTxKEwye6bk3mGwGPzeVAcOcN0ljrcbXU5ah/4AWrpkkkOqJyYudcq6+LfPxCj5bSEV2Lz27k
	KgyGtpJWmVTksLFkaFHTBPg5/K+hB7ZCvbx5ejKUpU9Mxyrqh6bW3TmztCtu2OAXklD7kXbSVdq
	IV2oMANhvGVV1k6uUmk=
X-Received: by 2002:a05:7022:2394:b0:11a:fb0a:ceca with SMTP id
 a92af1059eb24-1333b2d9c6bmr3134966c88.16.1778619618598; Tue, 12 May 2026
 14:00:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511234802.2280368-1-vipinsh@google.com> <20260511234802.2280368-3-vipinsh@google.com>
In-Reply-To: <20260511234802.2280368-3-vipinsh@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 12 May 2026 13:59:51 -0700
X-Gm-Features: AVHnY4KwNtssIpJT8BgW9ND1vjmOC-DKwSQu-Dn5zwJb7fp396v17OflLbojuVc
Message-ID: <CALzav=fR8c2tYj9jeOc_K=xoupxAfWMHmk0ipDniSXg6uGiFYA@mail.gmail.com>
Subject: Re: [PATCH v4 02/16] vfio/pci: Preserve vfio-pci device files across
 Live Update
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-pci@vger.kernel.org, ajayachandra@nvidia.com, alex@shazbot.org, 
	amastro@fb.com, ankita@nvidia.com, apopple@nvidia.com, chrisl@kernel.org, 
	corbet@lwn.net, graf@amazon.com, jacob.pan@linux.microsoft.com, 
	jgg@nvidia.com, jgg@ziepe.ca, jrhilke@google.com, julianr@linux.ibm.com, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	michal.winiarski@intel.com, parav@nvidia.com, pasha.tatashin@soleen.com, 
	praan@google.com, pratyush@kernel.org, rananta@google.com, 
	rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, 
	saeedm@nvidia.com, skhan@linuxfoundation.org, skhawaja@google.com, 
	vivek.kasireddy@intel.com, witu@nvidia.com, yanjun.zhu@linux.dev, 
	yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 4:48=E2=80=AFPM Vipin Sharma <vipinsh@google.com> w=
rote:

> diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> index c12d614fc6c4..019de053f116 100644
> --- a/drivers/vfio/pci/Kconfig
> +++ b/drivers/vfio/pci/Kconfig
> @@ -45,13 +45,15 @@ config VFIO_PCI_IGD
>
>  config VFIO_PCI_LIVEUPDATE
>         bool "VFIO PCI support for Live Update (EXPERIMENTAL)"
> -       depends on PCI_LIVEUPDATE
> +       depends on PCI_LIVEUPDATE && VFIO_DEVICE_CDEV
>         help
>           Support for preserving devices bound to vfio-pci across a Live
>           Update. This option should only be enabled by developers workin=
g on
>           implementing this support. Once enough support has landed in th=
e
>           kernel, this option will no longer be marked EXPERIMENTAL.
>
> +         Enabling this will disable support for VFIO PCI DMA buffer.
> +
>           If you don't know what to do here, say N.
>
>  endif
> @@ -68,7 +70,7 @@ config VFIO_PCI_ZDEV_KVM
>           To enable s390x KVM vfio-pci extensions, say Y.
>
>  config VFIO_PCI_DMABUF
> -       def_bool y if VFIO_PCI_CORE && PCI_P2PDMA && DMA_SHARED_BUFFER
> +       def_bool y if VFIO_PCI_CORE && PCI_P2PDMA && DMA_SHARED_BUFFER &&=
 !VFIO_PCI_LIVEUPDATE

Why does enabling VFIO_PCI_LIVEUPDATE require disabling
VFIO_PCI_DMABUF? I saw the cover letter says "to keep things simple",
but what specific problem does this solve or simplify?
