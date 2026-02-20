Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549893161BE
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 19:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771614230; cv=pass; b=J0qZIHuOqu9/PT5uzpWko10bC3CvV41tNbBp+3g/lBBjtGMeG1iKRj4XxUEDGywz4cwNfsVofaTGhetNugi3NhPJOAqskhtDP9zDRedhNT29BT0OBd+hBgSlRNmrbsCgJxn5iVkOKEzFG86pPaHuuffHtqmqmUTe3s2esT9ooBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771614230; c=relaxed/simple;
	bh=XUamG8pxMZfQQBQ8tt/1daaovPkkzl+bwqT9M55iAqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bH95hRXsBAEu2i/4HePP1l6XqZmnPvZfRPD0V3c2hJgLDrmNGyv1ZLuFleLJT2Ha2eXStfPaWBvEYKLLwMj/OTzDp376rygWycMBn7QQRyYaAdZo+T2UJYHrFWfmRFv+l1MGI4w+8fmSfaeEoybHxglKsXyXoqMVmWDLeYSTPp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FMxVguAz; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FMxVguAz"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59b672f8ec4so2386948e87.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 11:03:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771614227; cv=none;
        d=google.com; s=arc-20240605;
        b=GyZwzBuWU3wzPTUUvezNPgf/KlQDz2nBrodyeV/wQo55Qe40Y84uQWTXo5041oIIgf
         S1FOsj8l7uJC8dBg6OPt95COwWvC3ticITlZVOqWl4W8979+pJOph0bmn9Mvkt2P2uKD
         JlMsrSWUGC5RpRWKHdDtw6YGOMniXXM5kDwy7KeNl/maXpOWjSjpSMffwP74WeIE8C3R
         XwdWa9++vMuvJYZzX81SVl1iFaO8kepayu9WiYMWyuTpMI+lqg+Qm8HMRqnMBKcHPUCa
         5hDjswdXdKpwcOU7r8PK8kkzdIibbDk/3uGwPjmR4nbEN7v1CCI5jagio96NDJe9rbWd
         XzpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nos4S2W/MH7DucXly1ylwYhWrSc0JMSiOmM7eQ5L0v0=;
        fh=xuut+g9xNw5VAfYMoUj6rEWkmP1NBZ9mUDckB/sYI9M=;
        b=bnMLFAB5f5DexXerKlm73r9q7jS4+widM8XTfGbkW6rmo0pNobVCOs4tRDCtSSBFwv
         e8/c+PE0LWOFaWfn4ZPpYlL7xeBQb4WsH7oEylJaGl5f0v5ClE3YGq49dlaBcXaJHuKg
         ooI/sTpzIsHvOXWfykUyn03JfMpzAwaKF/qcG5Vmz4ZKtG2BctlwosOBOZdr919If17O
         NLa5le7wFCP3Nt7y8y+nEoEp+xhuX1AgyhSnjxhgbY91bGSDwWCq1EhAU0FbsuQsEu37
         WX/tU9UC0xoGasGjrEGYz1Vy6yNbFu0uMAFIoTJr0KRj0ukn1bd98Z0wqbnhnY+bjFWG
         yfBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771614227; x=1772219027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nos4S2W/MH7DucXly1ylwYhWrSc0JMSiOmM7eQ5L0v0=;
        b=FMxVguAz6Q/R1hmgXeSH9QRwrNKbVLRvC+fTcHleXKS+z00fYt4eSpsR5eSdZebl2Q
         stNtMUUklDPm7LXfZBYfvmbfMH4XSTcw2FaMbs7/rLtm1DVQzKoHoZWDqMIsTB5YoS5L
         29rvQpnIGVX/9OZjqH27AR+uDyuBE14IFCdBcO9OfwvurN7HwTN4P06RxzAcFSNAOuuZ
         qWtARLGRmW4OS9MzRAGi7qbYS0uSz1q/JXfGfFaZFFaSyxfK4f6zmDMvnXsmHrwBRa6X
         k+8p4GbXaEtr68I3ZjPAsHRbpcsb5tVBURaWON2qi1dPvIfLgZxFs1qy1WDCZUSI/1nX
         h6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771614227; x=1772219027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nos4S2W/MH7DucXly1ylwYhWrSc0JMSiOmM7eQ5L0v0=;
        b=ETxXC9BYme9SLmL3icBDfur2C5O3kpGPH/pNcci64gF2AubGVDWC/ZA5u2TMBV6ZfL
         xjSWeXMDa7swEqsGAXkhmS42ummA47HRjNvZdVQb29UN6izCJrLEz4KbqXF1fpwKNd3a
         Alirqm23jx6HwTJJrYwZekCRQVB8FUd4REM90kOdGTRQrdzDf01GDQPwj/4P9PpTJCsF
         HbgWvmiNb1aiW86H/myFvf40vRgwlZMcsmB6tSPwGCUlObC8YPJkmBKAJNGrxIgpMNoZ
         vt7bxxMsyitcQrpv7JBjf/KQwP06xJAETQwxKY/FGgV9MfWrBVgx+bgUnnxMXDVZCo7F
         LT9A==
X-Forwarded-Encrypted: i=1; AJvYcCViyo8PxG6pDYFKQYtZw9n00EWrLCLbo8Ahuo1EDye20vAMp0ws+WM4OK9iODfgrvUMpbv5pazTFJ1gjKDZ24o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNZn8M5o3eRbGKf1FkPd6zXzCoWydY/ze5Tzx61pftoyYVjF9Y
	PQkR/BuTf34aVWHPVnGP+LvVbk7lp54f4pbv2CvdZeG5ZOPVn4y/YdVdXwemzfnSlGLMh6lRjQ3
	sCk4QrCJ1c2sSjpGVUzAvZ+XW6WVkXS0pHIgMiP8V
X-Gm-Gg: AZuq6aIHi9UifF50U+yHPP1McQyQqDwoxYiw0d3l6K2SOkBPP2Mt3V1Bu5M9mBylyrH
	7EHJivY4l7ZtWLdLUzcYd1WupcZ5IGUjQr8mIU6StNfYGTCaMTenitVR1kclNqee1zozf6L+rfM
	Y7f8KdpXsFi9JqxAIIu05ZdT9bG/RXitP7wKTf7vxikir/3rR73wGKlgyNY85C+rEC8pzY7JJUl
	yDbJUuKlY46qiSo9JdBxD+EnOmLW4HbnoP3eH9mRbdw77/gUxb3QNJWGk3J1s1PA8+s7QwihFO1
	eZf5OIuRWvimoy1LRg==
X-Received: by 2002:ac2:4c56:0:b0:59f:8546:203c with SMTP id
 2adb3069b0e04-5a0ed894dd1mr165159e87.12.1771614226924; Fri, 20 Feb 2026
 11:03:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-3-dmatlack@google.com>
 <44484594-5b5d-4237-993c-ac1e173ad62e@linux.dev> <CALzav=d1ZrHrWd-HhZJ8aY6aqxkBcLoet_5+-LL1mOakVTj6Ww@mail.gmail.com>
 <7e49472c-4bbc-49fe-92c6-621e4675d882@linux.dev>
In-Reply-To: <7e49472c-4bbc-49fe-92c6-621e4675d882@linux.dev>
From: David Matlack <dmatlack@google.com>
Date: Fri, 20 Feb 2026 11:03:18 -0800
X-Gm-Features: AaiRm528gVDC51Vc6VmuyDJufgtIlxh6fV-eX6614wdRe-TzmLDadtAg2AEPmi8
Message-ID: <CALzav=dEykMZGsqz35TgvPqqZZFzG0kqojmry1Ya+Xf+zEgyAg@mail.gmail.com>
Subject: Re: [PATCH v2 02/22] PCI: Add API to track PCI devices preserved
 across Live Update
To: "Yanjun.Zhu" <yanjun.zhu@linux.dev>
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

On Tue, Feb 3, 2026 at 4:10=E2=80=AFPM Yanjun.Zhu <yanjun.zhu@linux.dev> wr=
ote:
>
> On 2/2/26 10:14 AM, David Matlack wrote:
> > On Sat, Jan 31, 2026 at 10:38=E2=80=AFPM Zhu Yanjun <yanjun.zhu@linux.d=
ev> wrote:
> >> =E5=9C=A8 2026/1/29 13:24, David Matlack =E5=86=99=E9=81=93:
> >>> Add an API to enable the PCI subsystem to track all devices that are
> >>> preserved across a Live Update, including both incoming devices (pass=
ed
> >>> from the previous kernel) and outgoing devices (passed to the next
> >>> kernel).
> >>>
> >>> Use PCI segment number and BDF to keep track of devices across Live
> >>> Update. This means the kernel must keep both identifiers constant acr=
oss
> >>> a Live Update for any preserved device. VFs are not supported for now=
,
> >>> since that requires preserving SR-IOV state on the device to ensure t=
he
> >>> same number of VFs appear after kexec and with the same BDFs.
> >>>
> >>> Drivers that preserve devices across Live Update can now register the=
ir
> >>> struct liveupdate_file_handler with the PCI subsystem so that the PCI
> >>> subsystem can allocate and manage File-Lifecycle-Bound (FLB) global d=
ata
> >>> to track the list of incoming and outgoing preserved devices.
> >>>
> >>>     pci_liveupdate_register_fh(driver_fh)
> >>>     pci_liveupdate_unregister_fh(driver_fh)
> >> Can the above 2 functions support the virtual devices? For example,
> >> bonding, veth, iSWAP and RXE.
> >>
> >> These virtual devices do not have BDF. As such, I am not sure if your
> >> patches take these virtual devices in to account.
> > No this patch series only supports PCI devices, since those are the
> > only devices so far we've needed to support.
> >
> > I am not familiar with any of the devices that you mentioned. If they
> > are virtual then does that mean it's all just software? In that case I
> > would be curious to know what problem is solved by preserving them in
> > the kernel, vs. tearing them down and rebuilding them across a Live
> > Udpate.
>
> Bonding, veth, rxe, and siw can be used in KVM environments.
>
> Although these are software-only virtual devices with no associated
> hardware,
>
> they may maintain state that is observable by userspace.
>
> As a result, Live Update should preserve their state across the update.

Sorry for taking so long to get back to you.

Userspace should serialize the state of those devices out of the
kernel, persist it in memory or on disk across Live Update, and then
recreate it after Live Update.

This is why, for example, KVM does not need to direclty participate in
Live Update. The VMM serializes all KVM state from the kernel, saves
it, and then constructs a completely new KVM VM after the Live Update
using that state. KVM will only need to participate in Live Update
once there is hardware requirement. For example, I believe some of the
Confidential Computing hardware virtualization extensions require
certain memory structures used by hardware remain in place and cannot
be reallocated after Live Update. KVM would have to participate to
preserve those and reassociate them with the right VM after Live
Update.
