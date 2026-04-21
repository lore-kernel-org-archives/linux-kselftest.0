Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75C731578E
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 19:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776798203; cv=pass; b=c/SlnX/T07h6qLrPE6HWkpYS0iyYAEr3fJeurH5sEUdlln7FQGVA8EED/xKh+8OHA+Si7ciSpGe/9/NXuTq0p7Z/keFZAcUpTQaMLwonu7thK9cpdtM5lHHixQj4T8E2lz5mu1YQ5ZNMD4ZuuaIrdVMv3Vy8bpIKykp4m24dzZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776798203; c=relaxed/simple;
	bh=QgyTwREA1708WZZfzzYg7xC0sHLOEAknYGjPxGZLswo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W9F59QbtTckmZcDbLxmX3YV93/wQBTh+Sod7MjPwU4pcQoOD6QrOkpD4X5WK6Wgckuvwp4rHX0074A/MnhrKV5HimWwHvcqfq+1nxVNAC/PZWWyjmxpN7DSiW2uBSJx3iSS4MISy8Oz3Gbi2Sb0qPNefHXp3Wev4GLySDgfg/dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g/ijTF4T; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g/ijTF4T"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e800deae4so38153321fa.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 12:03:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776798200; cv=none;
        d=google.com; s=arc-20240605;
        b=PshFrYXBEujTz3NrUfhbHebcO9swux5NK2wbyjvvSIE+gge/sEs+ocOK3ecybqgA78
         Re3WkgGwGNFQKrKOG6yBAYDIUyItbTdXx5BSSHl1e/wHFevqHZsUcBZozZDUnBNNJudY
         fu9yo2Nzn0hjILUz1emeJsrGn4QI8rRV1Wic+DY+A9Ut2iAN5H1hsLA1bRe0tNmDBSS7
         BbXu44v0EbCL4JD3iL/Xh74WgEgenI0nrqZL3EzThYyBeetZfSZoA/JudaUCfRoulWp5
         2LXIxuildtvOWPzQDdncWzTSuSOHJcjiPPz0CQvz8zt4QmjtRyYGf0bzgYIzcLMoyJkp
         kBTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j/JJh9D4iHfbIL7VgfpIvEFwBxZt49NSTXxWwWS0h9Q=;
        fh=IMpaNek5t2bhrJFiZSY8+3+t+8nU8iTZvZzBcbBF+Yw=;
        b=Me2t+7fRl1mNH/9Z6/nsKXAy7QKaIVfLiYMRF6VXVBS217EcTxyeFRw3ZyojkRgibh
         Re4NPMxWyH3xcdiH/1bUAIVJaUwYrvZEicFiyNf0Jlp1dt8cNnYMXZiRI/3Dr9eaF9Ki
         hLe3aPxrEmIjcuRP66GTxXDiRpZF9RkfD+5Gn0a8XubC2wGxXtzPyI+Zv4i++zh4EgzH
         RTQOiFz4/7q2myv6f5HmwvsJcWbqRrReUJoqUzaDhA8CRPwAEIWmpnyQnY35LQvD1CB0
         RfBGXrhfTD7wTnLvOcdoAIoWSukAOsIki5CEm1rl8QEhknGkoKcPTPvMpddE8wEiagkO
         4i1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776798200; x=1777403000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/JJh9D4iHfbIL7VgfpIvEFwBxZt49NSTXxWwWS0h9Q=;
        b=g/ijTF4T2Jr2Uuz7dUjpmwfdp6JIf+K8bvLyvsLKTjOvHgt+o9odOqgY2DLdK5cgbX
         SJlwOwu+LQDoh4BthiNcJodH+APKEeTBDZRAmqpkTVcPg2UfrPqF2aB9WsIX6V3ZUShB
         d9ZFheLnL8j9Dz743XVWq9gqOBAazzs3YcQLhzkeY50mAZrjbV4qTS/AuOU2zjyBlnQW
         IVP6aqfBcmh5a8Zs8/MwY2gPZqoEle5rJQZf43dHIE3PRr6OJXuCinG+x7zsWynYbl9p
         GV3NRz9iiKgss9LTEThLCAU6iPBkdkZT9dmBqBvdaGcGBAf6riu3tagGMT8k9MeJ/9Yq
         XiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776798200; x=1777403000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j/JJh9D4iHfbIL7VgfpIvEFwBxZt49NSTXxWwWS0h9Q=;
        b=I7VTs1CcxcpQ1PYP34+Aj6oOE6AsjYYujoL2WpjY26vAGqcf4Ej9JSuWGaCnRXblJx
         rsh9xbWv7+MArcHwYJ9O9jomARKLEQSAOG59bYyDkAauvSiNIQ7lIOwZT9sbWgzlu/Mp
         85wqrw7hHEDBNSVnbOMFT2TjAqEPFyGSHvo1MPlJ1oh30sQSV3O0nfiSf+K7Sa7RmxwE
         2RU8xPG0yPczfZIF/wVGRUYFSQ2Ftdru6r7VKtklOaOY26Epe5PGFdw29ysv5uC9oiW5
         Zmllzbxi7onoVyZfH/TJ4cQrUCAubglE0RD8/icdG/uJnmyFBRcxXFwbj3ZOh6oaoaHD
         VETg==
X-Forwarded-Encrypted: i=1; AFNElJ/loty+0YuDHLxJ5+UX5sZEgsFY4Ut1kAUuL7bq4h2ft0O80uG+2svt/VkuSzDmIXTPnqC1sbUwZ73zIZ2deWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRNn1woh4oR5BTvcylKyDl7z8KKgAebvU3TMf5aK7jHE9t3YMH
	zKmJv0+kuOhC15YVIIEGzNzUTKC4vvTzUwTWEJdKBkoutUM4qC5spE1oSfUUUNH8saKko1R8Ga4
	5OjL2pBXrLadGJaIRZdD5i0d4b8bTsEb/HvpfHKkJ
X-Gm-Gg: AeBDiesLUjQSC1lFuSB+ovIPaDFgtDtkCGu3iMgC4F08Z3fwz9hJpIIAcmIinSt8xeS
	oUXamUIUAwDvaqMCKzJtP9Xg0UucBxvljV0d5hB68PfedmKOcR9QVMPau2clWntkVTdKqtLe5Wl
	g4K6ovQax1WxX8YoFzzTuRC6C3MaF21en1EmBN8f4yFlh1mg/HATh9pRxvyxjVZObxmd43mAnhB
	s9wZbsFAEXkrd/3x1l5CxCZmif82iDPzA2NIdi2SjHPG7gHbpLXK1XjKu/QA8gbYrYtAtdlPZgD
	YyX47E+WFfGCk4gOZtmje3L3LqOowg==
X-Received: by 2002:a2e:a913:0:b0:38e:21bb:b2ad with SMTP id
 38308e7fff4ca-38ec77fb34amr60020221fa.2.1776798199609; Tue, 21 Apr 2026
 12:03:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323235817.1960573-1-dmatlack@google.com> <20260323235817.1960573-8-dmatlack@google.com>
 <CALzav=ehpWA=XchL+XLZuaYfYmBTPNWDYt1W3LFY5-6+US4E7w@mail.gmail.com> <20260421184433.GG3199414@nvidia.com>
In-Reply-To: <20260421184433.GG3199414@nvidia.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 21 Apr 2026 12:02:51 -0700
X-Gm-Features: AQROBzApHbC_QwlDNMpyz8z8DrBINgdkBviaRKsddB8iPIY8E4-Zx9sb-aAKTZM
Message-ID: <CALzav=cFarR4q7NugCxXwCW6wnyU9dJRaaTnxs7MY5ia5SDJWQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/24] vfio/pci: Preserve vfio-pci device files across
 Live Update
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Arnd Bergmann <arnd@arndb.de>, Askar Safin <safinaskar@gmail.com>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Chris Li <chrisl@kernel.org>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Kees Cook <kees@kernel.org>, Kevin Tian <kevin.tian@intel.com>, 
	kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Li RongQing <lirongqing@baidu.com>, Lukas Wunner <lukas@wunner.de>, Marco Elver <elver@google.com>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 11:44=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> w=
rote:
>
> On Tue, Apr 21, 2026 at 10:40:29AM -0700, David Matlack wrote:
> > On Mon, Mar 23, 2026 at 4:58=E2=80=AFPM David Matlack <dmatlack@google.=
com> wrote:
> >
> > > +static int vfio_pci_liveupdate_freeze(struct liveupdate_file_op_args=
 *args)
> > > +{
> > > +       struct vfio_device *device =3D vfio_device_from_file(args->fi=
le);
> > > +       struct vfio_pci_core_device *vdev;
> > > +       struct pci_dev *pdev;
> > > +       int ret;
> > > +
> > > +       vdev =3D container_of(device, struct vfio_pci_core_device, vd=
ev);
> > > +       pdev =3D vdev->pdev;
> > > +
> > > +       guard(mutex)(&device->dev_set->lock);
> > > +
> > > +       /*
> > > +        * Userspace must disable interrupts on the device prior to f=
reeze so
> > > +        * that the device does not send any interrupts until new int=
errupt
> > > +        * handlers have been established by the next kernel.
> > > +        */
> > > +       if (vdev->irq_type !=3D VFIO_PCI_NUM_IRQS) {
> > > +               pci_err(pdev, "Freeze failed! Interrupts are still en=
abled.\n");
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +       ret =3D pci_load_saved_state(pdev, vdev->pci_saved_state);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       vfio_pci_core_try_reset(vdev);
> >
> > I think a call to pci_clear_master() is needed here to so the device
> > stops issuing memory transactions while VFIO is trying to resetting
> > it.
>
> That doesn't sound right, reset should always work..

pcie_flr() calls pci_wait_for_pending_transaction() which times out
and prints an error message. The reset seems to be working fine though
after that.

>
> Didn't look beyond this hunk but why is a function called 'freeze'
> donig a reset anyhow?

Disabling bus mastering, resetting the device, and restoring
vdev->pci_saved_state in freeze() is temporary. This allows us to pass
the preserved device to the next kernel in a safe idle state. The plan
is to remove them once enough Live Update functionality in VFIO, the
PCI core, and iommufd are working.

> > Sashiko also wondered if pci_clear_master() is needed to ensure that
> > the device has bus mastering disabled during the kexec
>
> Only devices that are not being preserved..
>
> > think that is actually an issue. vfio_pci_core_enable() makes sure
> > that vdev->pci_saved_state has bus mastering disabled, so
> > pci_restore_state() below here should guaranteed it is clear during
> > kexec.
>
> .. and bus mastering should not be disabled on any device expecting to
> be preserved ..
