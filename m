Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AD53A9D8C
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 17:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771954649; cv=pass; b=lCd5OeUJ2zXdwnqAXeXe4p3TRj17a3D6JduaFdTN9BnKOALhTy9zik3fX52UUL8YyOgo0FKdInnXFqH4LMZ6KqBTeTtmObnTnVIomeAwInG45U0iafRbB5py2tktvT0GnrK6LCGGweK31sK402ZmEmzRy1GZq0MoTG9h+Mxl/co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771954649; c=relaxed/simple;
	bh=NzE6Dg5T/WZzjhrxSxryu35IDaiffOedvMQkCnbUBbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ll6AuRxAOyFH4tZEj4LDltYyARGbUYNMweHVeV060pyjknHdHaMCZrXu4HSXErPTgBxPZU/LtQawnwA4P30aBoOqR0c/ppoIV1vi4TFnqBCjPc6aqsmo3G+RNaRs/9yAz50BTNBD/gy+G0CjpMzeHD7SdCnh/YYRxcz0m9B7avw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O+yyE1qx; arc=pass smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O+yyE1qx"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56711650601so4897232e0c.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 09:37:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771954647; cv=none;
        d=google.com; s=arc-20240605;
        b=V6locpF8tyzj93oi7bL8sr3LbukKN/2fbSS9vrSU/h7lgv1KrZ1DiiJmFjxonMs8YW
         tn6P/Tyurfu0bCOHea/6s6AYZhnU7zVZejVRjEbaEM+cvSK3McMNmpTNijeBLj4iBcGN
         Y4DJu7kYCyYspeqPFdG7DauxBqkRFQylANCwdqzPu7fYpl6f4hI37CCYLv81SfBgjQQF
         5cyIEvkf6/orLRUTY0M1YyNCyQ2dt2Hvyzlouxtff4I+bEWKILMS/kyEdBtnxf3nPnmM
         eeERfeN13+2w9LdakPZuyByQzt4H9SiDIpd6PioUoz67OecIAnDkXq5wHvf9eLaGM8FI
         4LUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WVyG+GjslObEPoiorlcEtEb0lbImQuwl2+xBSlYjPvU=;
        fh=Wbn4gylhI83dr6nwg8lWpg3BB1NlvT0cY3KtIkuikvU=;
        b=ezZEnqaPTP2hHsV8Jy2RTdPJeOQ1jwrCwIS37hkikxxstwp0i0ZVsGEOEwsOTALbLu
         I+/WD+/xCMqckEzO68FzLfjtaoSwW2GKsP3LBQKwlYBGohsV37YEy00ERcyY1fHifp8w
         fbS621dL0cutr8MuYqSiiq8CKCrXw9G3cEl/FEFFJQQd03ijJ5CnZ7o+g/VeE/pqL8pC
         17FNG5WibrOw5EhFjEgtIApvvmxOYtOYaUnmhYqOCRGjbmuLQoxKpihkzEeAOP5XfBx1
         5ILM0cOfj0lF/TyV9vSCvWo7GhXv5nZEBaE1ssuB7JXvM7/eMEoBfuslEaFY7tTfiWvd
         UjDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771954647; x=1772559447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVyG+GjslObEPoiorlcEtEb0lbImQuwl2+xBSlYjPvU=;
        b=O+yyE1qxUOAg6dKVlAaP7DqeAKGiTg2vj+80mJTczPFmVifUrvXeiRAUTHwcY494hs
         nYb1zcEenz5Pr9R+S5wX2fzs6WzUVhJq3NHDLMU1dUIaQLuUMHJZppn+L6jA2ywQRraX
         e0mJSaajncxDDeSLw5ZGMRSxhBxvuucjh4gIMTqlxMEn9XOaUjH+JZpANuq66YMr/C77
         cVNZr4KOfDMzrm6CHNWYiua1MCYdmhCYINFR4ZAoUJe0W+1ywY/RGZKP0jA5xVOuFSPN
         CedJgKBY/KmNHzfLvo3a+Lt7jvxYnRPAZFJmKLozY4jiCcQo3hZpYtW8JIF7cczZ3JQp
         WWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771954647; x=1772559447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WVyG+GjslObEPoiorlcEtEb0lbImQuwl2+xBSlYjPvU=;
        b=d7bSOXZSJMfFt4ieEb/GhlXBIO095Dcd4F/6Y7FYWPLyxyG+mQ5IN65qbI42AQXN3h
         /ZJ3Vonaa9+6kgzowuga/nUfeO0+cr3vIIbrOYRER4hlISkeKeTaBXCxfti48hTzgVC/
         5SJtIJJ0qqaISEW8KAWVQEKeDauS6k2lnhzgrJjW4ItlJWzUe6wVIdnRGzgx7kUy7nxU
         Gm86hfa/njqElKgMeEre2X3nzo5dqyhaGUR/dLalZVRom4aLv3AcXSbtYMHJpKm/TLv4
         hD3XSq4KRbNwgOSyij9H4Ga0p1SkhtsYzxdPJIdddliVNAtm54PPtII2yLUi6s+eSzxm
         sQdg==
X-Forwarded-Encrypted: i=1; AJvYcCU2p3LR5fmfV7zh+eQRjyZcLIy2SUOFwksBxl555SSf0+1YYhXHUH9sje10Fc0UmG0HneJB7b3GiYBhaHyy6f0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMLcPRa1YXiG5BkO4YaYV8Un28jH85E4OPK6r95q/+1Xa/Ase7
	qo12HIWAkBbF2m9ey0W4xKxrLWN7cvvA/ch3NvdknPmtvdSe3cfRhdKEQOkOS+z0UKuHulnSgjk
	id6TBjlFIwjkkGnk3PeYVK6VYNalu9OkbI8AWEExc
X-Gm-Gg: ATEYQzwqK6H3WCpMsMsBWGEMqBPUVsWkiaGVBFellmgWpXy+yZcdp7StggaWZSfFE8a
	SIRIhSWTpVBD0ibrc8Ff6D12cV/88Pdb/525PdlH6sar8heMKb9JFypatVvVwPMcZygCjdgxJyh
	8M2kLLAYhFbGOIcl9nVqYIJzTOzV5LPcXH/6yItJWU3LAy3uB9rw4rlPwuW7/b/Vmboh4sxh6Lo
	azmdC5HjVEHpSAqEDgaYjZPCfLJQojZYMOTF+hqhUQN8Dwl8mQhqjLQvMa4wa2FiE8PUY+IBIiL
	Y3jpYvI=
X-Received: by 2002:a05:6102:e11:b0:5f5:3835:4796 with SMTP id
 ada2fe7eead31-5feb2eebe4fmr7234443137.15.1771954646379; Tue, 24 Feb 2026
 09:37:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-4-dmatlack@google.com>
 <aZ1xAyN0vgLWIi5y@google.com>
In-Reply-To: <aZ1xAyN0vgLWIi5y@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 24 Feb 2026 09:36:50 -0800
X-Gm-Features: AaiRm51zYRUGqNlquBQBjZ_Ao68Y3fgUdHKViouV8m9qg-AcIptaKIFOE6taQzc
Message-ID: <CALzav=cMsDyUrOPgkr5ouROPmsEAN2icsL266M4FxY3P6BNd1w@mail.gmail.com>
Subject: Re: [PATCH v2 03/22] PCI: Inherit bus numbers from previous kernel
 during Live Update
To: Pranjal Shrivastava <praan@google.com>
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
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 1:36=E2=80=AFAM Pranjal Shrivastava <praan@google.c=
om> wrote:
> On Thu, Jan 29, 2026 at 09:24:50PM +0000, David Matlack wrote:

> > +     if (pci_liveupdate_incoming_nr_devices())
> > +             return false;
>
> Following the comment on Patch 2 regarding propagating errors, the check
> if (pci_liveupdate_incoming_nr_devices()) should be made explicit to
> distinguish between "Preservation Active" and "Retrieval Failed".

As mentioned in the previous patch, the errors mean "no incoming
devices" rather than "retrieval failed".

> >                               while (parent->parent) {
> > -                                     if ((!pcibios_assign_all_busses()=
) &&
> > +                                     if (!assign_all_busses &&
> >                                           (parent->busn_res.end > max) =
&&
> >                                           (parent->busn_res.end <=3D ma=
x+i)) {
> >                                               j =3D 1;
>
> Looks like we over-ride the pci=3Dassign-busses boot param here.
> We should document how this change affects the pci=3Dassign-busses kernel
> command line. If both are present, the inheritance required by LUO would
> likely take precedence to prevent DMA corruption, but a doc update & a
> warning to the user would be nice.

Good call, I'll add a log message and update kernel-parameters.txt in v3.
