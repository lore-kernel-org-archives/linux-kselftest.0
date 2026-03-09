Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05652C11E6
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 17:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773077577; cv=pass; b=qdhVvbKNt57ZyIMoIev9wRMeSZAebdpsz8RlS+upTYZyMTc6cFVLcQtBSh6gItfSarHhtyJd+jE5RiwmqEm2keeLbbvOshgDBxUX9uM1YQlguSboh9bz18rjqhQ0MP+mtU/GJjvbOfnlwv4itfmT8WDg4TJZBjxJqDLc4nw8ihw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773077577; c=relaxed/simple;
	bh=UzbVfxnpIrUZlx5xzEFDYneUs+jd4yOAM+H/ydSkGnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWkV0m9kUdwQB45yrcesu9mBrkzsIC7tOnRtl0Y0BQP5gZtvdZT8aWEstWDR4zdy7KWOJl19+j9pOfORJdiNNX0gjZgcsc6Wh5Eh++bBZVnJGjGkS2ZhBxMAgqPo/DhqGDBaWP8KJ54OJ8keQzdc05ueGDAbohFt93KV/7pv1iM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BOqnSEKX; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BOqnSEKX"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a13d1c6f25so3052284e87.3
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 10:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773077574; cv=none;
        d=google.com; s=arc-20240605;
        b=J1qxDBq0AdVMV8bLiF+kQ8WzPEOUM5L3SiU9fz3Nkqj4p4yy9y9aGumEXkHWAt00x+
         yyVhC0G3PzQ3niiehFMmpa03zef1WCu8Qbj3hv3Mjo861xLEfzTVJyoBZvqg1utOV5wH
         CmslXnuXXI6tMMOl4K1yI6BfM4QY3tayFnnjNBwiPegSGpkXnUMarwQpI9NYtR1sUqkc
         RYbGNqkEANRaFt9AmXZXE7/krauG/tZeXIvAexngdFh8KrYyMfXAblK/EsMRG4dRYjFl
         7N+SseLkvJDKz6aTG5ChsvPCT6QP9z5GBpcxWg8iBO6hHQKv23RvZQ+wbzqi6xSlaBIn
         6KNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mL+d40KjyhuL+4bMpXUsYaQzeUUDZaEOQ6AdzLVzNPg=;
        fh=lWBAEEqRai9rYi1X2JOfNjuuuLrAG7wNK5GVdum6zI8=;
        b=XxgkAxXFUMWTBK72VUivzWPl0O3YBk8RkoGoIWN/NMhsDmUPkH3CSoIwfANaOoTpVX
         s9UqEB44OpA7ToaEuKxIVU1nLCJESMvmtOaxBhqS7MbJq4F+3drDmlcvmTSRLZ59dKSW
         1IAC3KvE4ASuj4cXEoYEf3Vw+R0dwBNAR/9Pp7D762eJq83/jh/xgBHljbvYXKLvEm+q
         /PlOsbF7sUc211QCqJPrTh6e8NKyfSeIb9Z0o0GvtY4ywqS5TCe6gXtqxKTZ+F9SRWPs
         vaJEuoR/MCyom+i+/ZV7xhs3pjcJlA41HzteZmtmeSgNnMtVGW2k3WaC0ttrysHYdThV
         IxTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773077574; x=1773682374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mL+d40KjyhuL+4bMpXUsYaQzeUUDZaEOQ6AdzLVzNPg=;
        b=BOqnSEKXUTbxSDH9TGikZ9vPUeq1YbVH2M4vnF6ofADIMO3AXxAhideB7H2xb8DqCd
         nW/+X93/6a4U2mz8iJEiRMNYSfA1UtCJCn5e5M7hm+yRTZHkT7HgVL5W98GrqnT4URxi
         kWpClKHjsRtCTfXVRdKyIsn3LMAC/6oNbcCMmt6NZd6q8/aF8OBKgaLSGGfZHI2Falg8
         SwbNG7WNM0Unw4TFKK3ZaRZgklVCY9rMocJJ17TrGshvEC2WJk9ZsUStHJH6hOEQieaQ
         CRXOGIvCsGgXQ4PRx4gvuJbqcAF6ruDgGXBMVYgRrofZqpMrF/VMbezUX+TvRBLpjWNq
         Q5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773077574; x=1773682374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mL+d40KjyhuL+4bMpXUsYaQzeUUDZaEOQ6AdzLVzNPg=;
        b=gJWDYJd1/Pgo8NqNAaWAyVLF9AL0ATzTdE8PvHM0DuyfOpmtrL3NSOVUW25cuR8uq4
         a14AKQLGJR1ljpQ/5DDHXI4kIJhkfCbPfMute3CJjNy8q8fp3wTa0OYgzJQ4tZ/EDh+u
         EumeLyGinE9ieDDwocsEKt0vaagFgg5cSKJkiTiMMfvRDxXxRF0v2265uIw2CEjK8iuh
         14ozXc9Z216nzbvtlB89mo9hEhc+616qevnfldOhdZUYDvGdoWDmAuH+IWycfryHUYUA
         o93C10CEmw1Iz1wHEk+3TpvtHAQhNTY6qgM4UkfqsUSUHE2gc/gZYLVOYVIgmgCgWlMu
         jdSg==
X-Forwarded-Encrypted: i=1; AJvYcCXeWojrutROerSTwj2PD39oO1fyfnzm6iFkIiE6/ig0jhdRKFQuFxjb+kQrhq+uxmw4zLGfd2KBxtMLo6tl4C0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtSXgbdXvzFjCzNscn24np2063P/WiKvPvnKJoNHb+eQx7e9w0
	76PjrSZph+7wT57ud7HEY6VDPyeW250o/1EJxZJ4YWxjkjtfpx9ucSkrny7Fddp1L0fDVuPvY2y
	ibJtMLI6DhPpKZcob8HWtUcWBvvr+GA42hIuaLgcy
X-Gm-Gg: ATEYQzzp9hAy5Qe9LlTUVCMp/o3e2v4Ji734kn0eW4p5shCWIX7BtlWYv3FQdL5Wkjy
	E9lXlE5z8iJqaiiuA8Nw0gokx36NnZF6W9Uz3o7/+/ImkgCm9myTL/IcE6V93zx0xATqeikTYrl
	0B2dHJxFFcndG1l9wmcKMOqKrgfFi26pcqWFzi/Yi+fL5Ytj+zcOnDW60d718yNfIVJO+QMKFZD
	QdAdelL4mdcZyWf0aQRV9DS/jvOzaBvh8MxBs9oT4bLVN0wLzLH7Lox5GwFYJetbEx45KEVdh7R
	DI+xoEFb
X-Received: by 2002:a2e:9e89:0:b0:389:fc6b:943f with SMTP id
 38308e7fff4ca-38a40b72dbbmr31791631fa.11.1773077573745; Mon, 09 Mar 2026
 10:32:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-11-dmatlack@google.com>
 <20260226170030.5a938c74@shazbot.org> <aaDqhjdLyf1qSTSh@google.com>
 <20260227084658.3767d801@shazbot.org> <CALzav=fHy23RAzhgkdaL+JA5T2tL9FT6aPgRfXUh7i9zvYCGPA@mail.gmail.com>
 <20260227105720.522ca97f@shazbot.org>
In-Reply-To: <20260227105720.522ca97f@shazbot.org>
From: David Matlack <dmatlack@google.com>
Date: Mon, 9 Mar 2026 10:32:25 -0700
X-Gm-Features: AaiRm51UQkPGi_THgF8Q61sl9tHSSk61beTImuWL9a-lckj5dJAcnYvj7LG9bmc
Message-ID: <CALzav=fjRPa_ZbXu7iFXyemcf_8Kq_dZTWT6c-A0bc6czF_Rdw@mail.gmail.com>
Subject: Re: [PATCH v2 10/22] vfio/pci: Skip reset of preserved device after
 Live Update
To: Alex Williamson <alex@shazbot.org>
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Mastro <amastro@fb.com>, Alistair Popple <apopple@nvidia.com>, 
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
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 9:57=E2=80=AFAM Alex Williamson <alex@shazbot.org> =
wrote:
>
> On Fri, 27 Feb 2026 09:07:48 -0800
> David Matlack <dmatlack@google.com> wrote:
>
> > On Fri, Feb 27, 2026 at 7:47=E2=80=AFAM Alex Williamson <alex@shazbot.o=
rg> wrote:
> > >
> > > On Fri, 27 Feb 2026 00:51:18 +0000
> > > David Matlack <dmatlack@google.com> wrote:
> > >
> > > > On 2026-02-26 05:00 PM, Alex Williamson wrote:
> > > > > On Thu, 29 Jan 2026 21:24:57 +0000
> > > > > David Matlack <dmatlack@google.com> wrote:
> > > > > >
> > > > > > - vdev->reset_works =3D !ret;
> > > > > >   pci_save_state(pdev);
> > > > > >   vdev->pci_saved_state =3D pci_store_saved_state(pdev);
> > > > >
> > > > > Isn't this a problem too?  In the first kernel we store the initi=
al,
> > > > > post reset state of the device, now we're storing some arbitrary =
state.
> > > > > This is the state we're restore when the device is closed.
> > > >
> > > > The previous kernel resets the device and restores it back to its
> > > > post reset state in vfio_pci_liveupdate_freeze() before handing off
> > > > control to the next kernel. So my intention here is that VFIO will
> > > > receive the device in that state, allowing it to call
> > > > pci_store_saved_state() here to capture the post reset state of the
> > > > device again.
> > > >
> > > > Eventually we want to drop the reset in vfio_pci_liveupdate_freeze(=
) and
> > > > preserve vdev->pci_saved_state across the Live Update. But I was ho=
ping
> > > > to add that in a follow up series to avoid this one getting too lon=
g.
> > >
> > > I appreciate reviewing this in smaller chunks, but how does userspace
> > > know whether the kernel contains a stub implementation of liveupdate =
or
> > > behaves according to the end goal?
> >
> > Would a new VFIO_DEVICE_INFO_CAP be a good way to communicate this
> > information to userspace?
>
> Sorry if I don't have the whole model in my head yet, but is exposing
> the restriction to the vfio user of the device sufficient to manage the
> liveupdate orchestration?  For example, a VFIO_DEVICE_INFO_CAP pushes
> the knowledge to QEMU... what does QEMU do with that knowledge?  Who
> imposes the policy decision to decide what support is sufficient?

Hm.. good questions. I don't think we want userspace inspecting bits
exposed by the kernel and trying to infer exactly what's being
preserved and whether it's "good enough" to use. And such a UAPI would
become tech debt once we finish development, I suspect.

A better approach would be to hide this support from userspace until
we decide it is ready for production use-cases.

To enable development and testing, we can add an opt-in mechanism,
such as CONFIG_EXPERIMENTAL or a kernel parameter. For example, adding
something like this to vfio_pci_liveupdate_preserve():

if (!IS_ENABLED(CONFIG_EXPERIMENTAL)) {
        pr_warn("vfio-pci file preservation requires
CONFIG_EXPERIMENTAL to enable!\n");
        return -EOPNOTSUPP;
}

Once we feel the support is ready, we can just submit a patch to
delete those lines, and there will be no left-over UAPI.
