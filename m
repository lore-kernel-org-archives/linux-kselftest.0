Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0BD2DC321
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 18:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770056128; cv=pass; b=bGC/kdtsXNetWHslXMqPno9eFAv+f4oyLhdrauC/hAFs0hYmVYV7tMvo6dzk/5AMr/GY6/dHZ3P3Q/qwkDaM4IFn4OMgFVECXU08TkRBqokz9MxHjB819rW3t2SAPk/rTEFyd8NKW8+EX3g9p/LSkUygiNYS31Zg22eQjf/YocM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770056128; c=relaxed/simple;
	bh=hfLkISPUv1gvXr1CboqWBn1bs3Sd5IoZNOLzZg55skM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iF3+Vcj9hY3LFdVkbqT7NpezdvuXAj73tke4Ebb5qL/3YekiQctX4+cJoZ5yWpqzrbFupi+5+yM6Y0cB4Qa1MnYffbUi487OBQ5S2WCMOpDgRZUO8+Ne/irZGx2WCaWqo38gfpfQqPkpphWIM+XEm+iZ8HvOyYRXz8EcJ7UhPVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PSJ2pVDb; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PSJ2pVDb"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-385d9fb297dso48070871fa.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 10:15:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770056125; cv=none;
        d=google.com; s=arc-20240605;
        b=ZkpBSy+KhdTuc/GePOmkeUbw2D4ljuk3X64nXBMu/gNPNu9G9hWz+2PRYgZVr/bkga
         8Jy88haO+2i4U4uw1SDEfGoVtg3XrYQDmWlvKhD3/Ufynwv9Nx0IRgEBzcqUZd6V6oNG
         G78llwVBkkWHjpZcYgtXxZvxvVx8fHgdVGQSg6XGO5E4gK3+Ugr5ZPi+7zeb9zskG9MN
         MbP7OcmRADdiqE+54dEXFyJ8Eui8voExDDJcEnKUG7wFth3x/Ci74PuD9oumJo48Vz2U
         /8Bn+AOwUFRrAZEKLLWIMP5X+1xCm6dnahIf6Qn273dqBi1+Wqf1YQ21uq8aDlfF0yow
         dVHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LIHmbN0vtM4SeA7+jGmffdOqzfQaVyhc47MhdLc1+1s=;
        fh=v94QryWm4C79nXdLp85Ec9qgEKQDuzULRivX0NjtHxU=;
        b=L7fdmYK/N4zv6ZIU9DkBfyPZRGObajwm/aHodJJ8XGDfTGf4Fel4oO7okbuBTTOpbN
         tfbGMm6yYnuvZLyYwczwru106b4RiUZu2fAqTilYqd4tblU+Y1ioN/rbUVpnOwXg9O8O
         bcBHG7YihqX37pTd00vK8LhnISyGWRJZlOqzIbKAYMkOHFehfuH3JJIT2NKAMhI5IY43
         MF+nHr9hV/DtOxH7LFW5ozAA3wqSOsfrIiprez+qQxyRoqiSdphUENZF4aj7PCVxvTOm
         1ZWy5nq2mhufS+PrUreSBqRjA8D3Kp2fulY6kSeQV6ZqlqSRwwF29VSneA7l7UxOY4hV
         6iZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770056125; x=1770660925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIHmbN0vtM4SeA7+jGmffdOqzfQaVyhc47MhdLc1+1s=;
        b=PSJ2pVDbNQVnPXrXNjymko4FOE40C743kvBmJ86NLSh4GircZENoqWveK5OWNMFOO9
         GpNsC5mwmhTxifUlf/daWGwYTrtNmBzSI9eXvPrODcez7DbDVIYiqvcyBy8amLYrrxVp
         DLhTd6QbiVH1AZJlMuR6iTv3Niiaa2lm5P9p2E6o7tcArvBjQTQzHxA7WxzzMWq7visY
         Ddj+8fe+ab5vxCLuvIu9gW3nb9y1abZAGX4BKFdWVZfyFeTp3yFB593U7yT/3WYrmVXT
         hClbGiN6g1pDtf0H+z9QDhit5pfuUP7PHyl+0qS9jvPbM1Ti2diqJ0edF/uO0rC2wXpJ
         ZfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770056125; x=1770660925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LIHmbN0vtM4SeA7+jGmffdOqzfQaVyhc47MhdLc1+1s=;
        b=NHnX3efOxIxqo5JIEnS3b4aXoLdxl8mU03mcLA67qatxDqEAONY6fzvqEtKltadL12
         da0i0kK1c6Dk8Fk3QcZRzFI2zKC5L8abL8fczhrSXVPVN1Y+oecV4waOPDrvnXHsrqps
         cHPpsUJB1LXWILj1Q2EWPJD2hG5NmSW/Ke1mK9D/9QqA6VdEIh0V2xyL7AEIg7ueTWnG
         VW9wfP0GpzuwRKyfjox2cJXaJ2mgqiMe8EuIxNs+CyyH2GMmpCRbNLxymAnTR4ewBPt3
         bJC0thRWJziIBgITKprIKJ6OsdQoyaqIt8/6wJdcxxaVrN8itpXhSNDvgOKeKxAM5upe
         gKqw==
X-Forwarded-Encrypted: i=1; AJvYcCXo803uFBMVRQBq7T+H3TCBKO7P2PFiUOdK1Og9Yru4goDpgzl5mGdKFL56bTTwHG7PJ2Zalw4/jar1ACwmbNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBgnotRcnYfkbwMKNwENNwb2CpR+D1aTr0/RVnpOsvNkPo78LO
	cZLtVMQY9i+oQyOtug9hPIfSbgee+vDkkwIATMXMbwr4QvNoW0tR26esvEwoW4CxsagtrriNj0W
	ZsBU9PKZp5UyX1WlAjvO0dfxJrhE/PnLKjhxJOGf9
X-Gm-Gg: AZuq6aIYTpCvA6XWgAB8tN84eYfhAji6t6DRdfzEfe4N6mz+aTtO3DM4dbpwhX4uoPx
	vu5fOykuESMoON3vLOvRO4I0Ys8+UPRTnOcfNEeBO8GWnAyehbXNpPITTvHe4O3uZujyWtsxJSi
	/WbYTnvXvISlAVnAtWbLtKM51orsJ1yN8R+CKALEWQLoIP6sfP2XSR6yVRtJ1Wq/OWmXuqjsWuN
	t4SmhjNf/Gs5pu0Trll/KU/9IAtLRP6hwExo4DjyDUVitfR4bvIcUGZtkhW6sOsKeU9nA==
X-Received: by 2002:a2e:a54b:0:b0:383:1c18:ade6 with SMTP id
 38308e7fff4ca-3864662d728mr40696471fa.20.1770056124374; Mon, 02 Feb 2026
 10:15:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-3-dmatlack@google.com>
 <44484594-5b5d-4237-993c-ac1e173ad62e@linux.dev>
In-Reply-To: <44484594-5b5d-4237-993c-ac1e173ad62e@linux.dev>
From: David Matlack <dmatlack@google.com>
Date: Mon, 2 Feb 2026 10:14:56 -0800
X-Gm-Features: AZwV_QhgTJZ7rnxODmCU1qhjsI1pWSHh1k-rPTozueyr5OUveeJ2FC59ISanCNo
Message-ID: <CALzav=d1ZrHrWd-HhZJ8aY6aqxkBcLoet_5+-LL1mOakVTj6Ww@mail.gmail.com>
Subject: Re: [PATCH v2 02/22] PCI: Add API to track PCI devices preserved
 across Live Update
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: Alex Williamson <alex@shazbot.org>, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, Alistair Popple <apopple@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, 
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 31, 2026 at 10:38=E2=80=AFPM Zhu Yanjun <yanjun.zhu@linux.dev> =
wrote:
>
> =E5=9C=A8 2026/1/29 13:24, David Matlack =E5=86=99=E9=81=93:
> > Add an API to enable the PCI subsystem to track all devices that are
> > preserved across a Live Update, including both incoming devices (passed
> > from the previous kernel) and outgoing devices (passed to the next
> > kernel).
> >
> > Use PCI segment number and BDF to keep track of devices across Live
> > Update. This means the kernel must keep both identifiers constant acros=
s
> > a Live Update for any preserved device. VFs are not supported for now,
> > since that requires preserving SR-IOV state on the device to ensure the
> > same number of VFs appear after kexec and with the same BDFs.
> >
> > Drivers that preserve devices across Live Update can now register their
> > struct liveupdate_file_handler with the PCI subsystem so that the PCI
> > subsystem can allocate and manage File-Lifecycle-Bound (FLB) global dat=
a
> > to track the list of incoming and outgoing preserved devices.
> >
> >    pci_liveupdate_register_fh(driver_fh)
> >    pci_liveupdate_unregister_fh(driver_fh)
>
> Can the above 2 functions support the virtual devices? For example,
> bonding, veth, iSWAP and RXE.
>
> These virtual devices do not have BDF. As such, I am not sure if your
> patches take these virtual devices in to account.

No this patch series only supports PCI devices, since those are the
only devices so far we've needed to support.

I am not familiar with any of the devices that you mentioned. If they
are virtual then does that mean it's all just software? In that case I
would be curious to know what problem is solved by preserving them in
the kernel, vs. tearing them down and rebuilding them across a Live
Udpate.
