Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9263D3290BB
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 17:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681536; cv=pass; b=SQnRCrpawyGeAJH9+Ant2iDunDqzD2k7sJW6TXrrE5VepxIt2acP4lwKMpC7UuGt7g8I7uCtqiX3x/WTxEhDX+AeEz73msVBR9NJKpVBGtkWwUG2Z2zvkiwSJMAb9GoMCDVrNUnQz4CiZrWrW+VcDBV5EQ/DVx3c1j+i5GW0BO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681536; c=relaxed/simple;
	bh=0Jl1H4VRajEElLJx6lQQ4elVW/zvvj1c6yvcKK9sD7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVxOmh6SB3Y25haQ+dzKf4jcPIhDvNzl1/isQwgWL7SXLiTNC1jU+7Z/DS6kbPawu2DMmaUepSDPCVE0yC5TG+c6EpesiYctTarTYmR+6/gVs/SqN/juETlbmxkZ34TmDdkViERugdR1ryV3ac+TQ8QiNvOsvxuY9usiMzJ1mt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lWnRpn8s; arc=pass smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lWnRpn8s"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ffe6887e21so1100313137.2
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 10:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773681533; cv=none;
        d=google.com; s=arc-20240605;
        b=lMy0f2A/X/nVBMNvLlnw/hgfvXYYIwDc3W/+zmYnmeHJOts5rXAI/R3D+mdqvJIks3
         CyBjpWN+G/yeH2s+fYrrXZlvsMsqqA9Y7V1Fb/x+nlbCNj0rbnK7vx0TdKoBX98KetLn
         As7TTfv9Bf0eu8rfzid9zz81bCttMzJkDU+YjN7PGXiI25XzvMH3ZlLlYZ2y9oEtlK8o
         1M0C02C5Jhvg9GibhF3mZVS98UidOFmrRk/hUuvf1r0CHa3VAMvGlShJv2o8OfiGFmUP
         8phmthkMpE2bUM7IPU14V3iDV9VokAy4+jQNFnt4dudgFUSn2yfKAB6zEbC6fTBnILc8
         2b+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jK2scyfYwBMU55V+xfenTzy10C1cc5BhbFAgTj9RHSs=;
        fh=bdCY2ngDXHlP+V83BKJ6k9eT0Icy0WByCefmfGfLaS8=;
        b=jzF0HXoYFW7GBlknLYL18E60RiA1+RtLbujnuXnuS8uqJEe+i3wpByMdS7KpHKHn3b
         Dc7Nqjku8QVy8GHSZhpiZkJNO+BcyYeTf61oM63mYwBz0OBnnbtk2urhjjfA6daNWaKp
         KP96YY8bUAamMyMnhiWj7LRDWh4e/1dKPw0TjyexhgLFgrtxW7bil2eiJsNEhh9s70b+
         ONE0m9Pvm64JpXZX6Ndv5gzLhS9elfe7GvTT7Dv9cjUCiFNiAsV5j+FP67uwwLr4WR8A
         +sYfa3W1METnA8CDFrsNNEIY0eFdBMYIPJng1flIdpcG0AVCI62C9z+uu5xQi71W7SYg
         Pf0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773681533; x=1774286333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jK2scyfYwBMU55V+xfenTzy10C1cc5BhbFAgTj9RHSs=;
        b=lWnRpn8sPsmYuL/qKxXUBQyFgK8y9+MKBBOs/ieA6uJUiCJHbftHMniA44yNHqt4pd
         hIjDcYAZ6kTMtfBp+Bd+rLOr7/8mW+bO8+G0HfwVAUusjRj9oxbmK6YtujguOdRNklE7
         KElyDzQSSjdnBsXp9s3dBen7lTDU2GXDcJMKxYsR/6seO4ffAKk+bzqJRpOEEA6YhQ8z
         N2C9XeRgAhv5VSxR9/D9ms4RTk5uFeWSG3JPDUyxo8VvOBVoE12B+z8flL3zSJQg6ULk
         qUBFoWeUZuP2S/WGzR+nDdoNvx7frMPW+s11dsletmXmfxVeVZEVcLJUXmkyUJJWdjGe
         01rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681533; x=1774286333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jK2scyfYwBMU55V+xfenTzy10C1cc5BhbFAgTj9RHSs=;
        b=nPEgCT2IoXCRt1MkwfcksVPErQ2z4bNsVyHuYPk4qL2BpJ7FAnCc3TOq1HzyZirgk2
         JCdyl9ZOhnrMS0tCjcsPtoryPYnw8lOsIOegtQaTkEx8YKN/hGy03VP8OLhWLVXjwo7L
         mEtmR/l2MSlXXky4+c0zYDtVgoXKgC2byGm6tQgGtaUQJu/4a9iJEkW5Yt9jTUeWIqPI
         jt7WLRYox1WlBoh/MYDrYN6gVeP8O8DHCsXu29KKP/ge28koSh9T3ZQRC9DkOXVzJ8j9
         h8rPoaF5kIvb2KL5nw8nzPzIB6uYGOp8Klv52eGxzffJWfNWKP5lJokYA15RGE2tAUdA
         twyg==
X-Forwarded-Encrypted: i=1; AJvYcCWdL9QOn2jLT55+PEWuRMOLHRxKAAamy7wF+LL2GSrhkVmgWInhPRBC2S5r7trKRhpyDlU36VNRjaKbnd7DDa0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF7PYibzcW5wrRqtJNz5j+zww+pNaRc/RFQUD4AgKHoHWINaxM
	+iXqqoCSVqzDlAntnx+5iHNehQaHj/FnBLvThOJ1WyQm7Bhqwc94YXGXxVXUdz/jieE34q9v0Ms
	kw2w3gR0tSrJQYgXhQoYg4clVz2fzSEOwWOuXM7aP
X-Gm-Gg: ATEYQzyXaj61pmNOV1OESrWqmwKJYYbBOqJlLjZPLeci5Izr0WavmhUuvoTQK0kNA0m
	b0u8Kk9i3MkKLHr7f7x3n7DIZPJi0NX29KO3g5aeJy2CxNfx1Ovhd2ATqPyG5Y2+Ao2LAtzIqBY
	j3tsj++JBftSwkCHKDH9oordmT+q6JyADJZ5TY0eJ3zreCjER5s64e1qk4pOjfnhcHGM1f4SnK2
	O5jsN1LjsCsgLnQ0ZuYfI8m+1DfPbucAn7MXm1lpXc6WlytrjMfjISvCYG8CfNLi0qHqcqDbAwh
	8RcCQj0f
X-Received: by 2002:a05:6102:d87:b0:601:f3b6:f2ce with SMTP id
 ada2fe7eead31-6020e27c32bmr5393489137.12.1773681532920; Mon, 16 Mar 2026
 10:18:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-11-dmatlack@google.com>
 <20260226170030.5a938c74@shazbot.org> <aaDqhjdLyf1qSTSh@google.com>
 <20260227084658.3767d801@shazbot.org> <CALzav=fHy23RAzhgkdaL+JA5T2tL9FT6aPgRfXUh7i9zvYCGPA@mail.gmail.com>
 <20260227105720.522ca97f@shazbot.org> <CALzav=fjRPa_ZbXu7iFXyemcf_8Kq_dZTWT6c-A0bc6czF_Rdw@mail.gmail.com>
 <abNOwcOTXqxCxNzt@google.com> <20260316160759.GA1767448.vipinsh@google.com>
In-Reply-To: <20260316160759.GA1767448.vipinsh@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 16 Mar 2026 10:18:22 -0700
X-Gm-Features: AaiRm50L1lnLwO1eCIJNJtk4Bw53fGwzF8hjQ-eN_1dFmVAntzs-kWI2tT0ZbZU
Message-ID: <CALzav=cskxLZtZ5-uRa0+aV+1Kb3fwQQJ5dS=Yes4GAHrS6GpQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/22] vfio/pci: Skip reset of preserved device after
 Live Update
To: Vipin Sharma <vipinsh@google.com>
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
	Tomita Moeko <tomitamoeko@gmail.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 9:22=E2=80=AFAM Vipin Sharma <vipinsh@google.com> w=
rote:
>
> On Thu, Mar 12, 2026 at 11:39:45PM +0000, David Matlack wrote:
> > On 2026-03-09 10:32 AM, David Matlack wrote:
> > > On Fri, Feb 27, 2026 at 9:57=E2=80=AFAM Alex Williamson <alex@shazbot=
.org> wrote:
> >
> > > > Sorry if I don't have the whole model in my head yet, but is exposi=
ng
> > > > the restriction to the vfio user of the device sufficient to manage=
 the
> > > > liveupdate orchestration?  For example, a VFIO_DEVICE_INFO_CAP push=
es
> > > > the knowledge to QEMU... what does QEMU do with that knowledge?  Wh=
o
> > > > imposes the policy decision to decide what support is sufficient?
> > >
> > > Hm.. good questions. I don't think we want userspace inspecting bits
> > > exposed by the kernel and trying to infer exactly what's being
> > > preserved and whether it's "good enough" to use. And such a UAPI woul=
d
> > > become tech debt once we finish development, I suspect.
> > >
> > > A better approach would be to hide this support from userspace until
> > > we decide it is ready for production use-cases.
> > >
> > > To enable development and testing, we can add an opt-in mechanism
> >
> > Here is what I am trending towards sending in v3 as the opt-in mechanis=
m:
> >
> > diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> > index 1e82b44bda1a..770231554221 100644
> > --- a/drivers/vfio/pci/Kconfig
> > +++ b/drivers/vfio/pci/Kconfig
> > @@ -58,6 +58,27 @@ config VFIO_PCI_ZDEV_KVM
> >  config VFIO_PCI_DMABUF
> >         def_bool y if VFIO_PCI_CORE && PCI_P2PDMA && DMA_SHARED_BUFFER
> >
> > +config VFIO_PCI_LIVEUPDATE
> > +       bool "VFIO PCI support for Live Update (EXPERIMENTAL)"
> > +       depends on LIVEUPDATE && VFIO_PCI
> > +       help
> > +         Support for preserving devices bound to vfio-pci across a Liv=
e
> > +         Update. The eventual goal is that preserved devices can run
> > +         uninterrupted during a Live Update, including DMA to preserve=
d
> > +         memory buffers and P2P. However there are many steps still ne=
eded to
> > +         achieve this, including:
> > +
> > +          - Preservation of iommufd files
> > +          - Preservation of IOMMU driver state
> > +          - Preservation of PCI state (BAR resources, device state, ..=
.)
> > +          - Preservation of vfio-pci driver state
> > +
> > +         This option should only be enabled by developers working on
> > +         implementing this support. Once enough support has landed in =
the
> > +         kernel, this option will no longer be marked EXPERIMENTAL.
> > +
> > +         If you don't know what to do here, say N.
> > +
>
> To use VFIO liveupdate, user has to do at least two things:
> 1. Enable CONFIG_LIVEUPDATE
> 2. Pass VFIO FD to a live update session.
>
> This means someone using it has to know what live update is and
> intentionally pass the VFIO FDs. Isn't act of doing this itself an
> opt-in mechanism?

If it is, then I can leave this out. Alex?

My thinking was: Distros are free to enable LIVEUPDATE and use it. The
support it enables today is all fully functional (albeit new).
vfio-cdev, OTOH, is not. A separate Kconfig can help express that
difference.

Consider that LIVEUPDATE could be enabled by default in a future
release, but vfio-cdev support might not be ready yet at that point.

> I am not sure providing VFIO_PCI_LIVEUPDATE alleviate Alex's concern
> about how userspace will know that sufficient VFIO support exists.

I was thinking we can flip VFIO_PCI_LIVEUPDATE to be enabled by
default (if LIVEUPDATE and VFIO_PCI are enabled), and drop
"(EXPERIMENTAL)" from the option title. That would be how distros and
downstream users of the kernel know that sufficient support exists to
enable VFIO_PCI_LIVEUPDATE.

> May be write in liveupdate documentation (PATCH 11 of this series) that
> support is experimental?

The documentation in patch 11 includes largely the same text that I
put under VFIO_PCI_LIVEU"PDATE. But I can explicitly mention
"experimental" as well if that's what you're asking.
