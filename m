Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE35D36DA04
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 21:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775253525; cv=pass; b=TSL1aTmi4UNf855iG08EmQWu1cQSkVpp6N324TJORLWpONTb7ARFzJos2xbpC2N2gBhtjn3ERRGbm8RGfhrxNawKIgeLiQM7cEwfXMYLkjhXZE5djrH7whZvwIw/UzDFAGeFngR4VyytmKUeDGBmoUYXZwNuCIvxtAjHcl76G3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775253525; c=relaxed/simple;
	bh=oCK+sZb08S6huM/V/s1J1l900Tg/cNM1yA6PbfEXFH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KQJkWylGnh+XO61yxkGIqcOSHbqS95qerAx2foHdJgoQL+xlPp01Cw9fEgtVubqI3esCjjJ0qy6+HeZx0yFuZKbXtjZhUdwi2q94fk6eNWZO/BL8sFISSxNa5rtpHv9Zs1CJFIa/BCVJ+FczJYcfXbABBCV+vdDjlkCelANliPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sfVInFU0; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sfVInFU0"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a2967e5de4so2928247e87.3
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 14:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775253522; cv=none;
        d=google.com; s=arc-20240605;
        b=PmBTa6jyDaTLrcG8Ie8jD8WeVKnRU1+PADb0X4fvIrKPKZYoL2o5aUih+fW5259Ltc
         j6COyoBkiKKxAt6X/MdlGsvn9raZ67KUeBuYv6NvjNnqivvmNCd6l/zrxHFw07CHhutc
         DFKoq8WVzWIBGde7Kxlypy/809I0YXweWX4MA5Rx1bJv1uYZtRs4aLHSY8eqEJ0mDefX
         QiZ9Ra5GeI9tqqu2YQwRy1UvcXYOU3M/QaaVY2TeYuefnnSSKfsbHPq6eS1WN73rOHec
         esIZi3l3AoevcGAG59bPSxOX4DoPGS73oa4jT9RIBltjU6xcrnAEQ0XQWSEZJgDTHoZd
         J7oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n1x++2kh/JMrnSacQAY2WWd8oQD4emJiO8jgrYOFWkM=;
        fh=A3hu71Rh1QRFhUP0pcmNiFK1AnJ55pehziHSN8QMG7w=;
        b=J5IX/wWH71psEJDla3+/jMq91LZhurGxFPHoPsshf275jwutUrMNo0LNpgX8hIdYbf
         WCCmR6kY/hYKcRpH5kb2tVwFp0qUL3KcP5JKWh/gVYBiiuT6Y9bIELK7CXvaA9HtqIJ+
         K8xJpYIxTuhYGCYZVZrcUS5BilBve9ml1nIUDHOKK3X6vkVqKmwOcR9maJzRMubT/Rq5
         068Y+QmM5ACwX6uvKQXmdmecU/NG5JYtpcS4ATN//JnzoMnhrhV9nZuDfXaAwmZa2Wst
         q+2kh4TDOKb+PJMpJItkqtyKQpF/2ncmPXxbOUItC+FcQBdLwHj8eL5QvrvlRtIwaTo5
         foHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775253522; x=1775858322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1x++2kh/JMrnSacQAY2WWd8oQD4emJiO8jgrYOFWkM=;
        b=sfVInFU01E+LC/YL08p0ZrKy5EpCdGKddjzFyepyUv4or1nGuchn8jkj/IwiXItUrW
         nFN6Eqf/js+yJG1Nuou/6OciQugdHpyDNCfbBaFQNxFv2mul2ZMJg3kGYxTEsEuiBjnZ
         0SAwrWBs8MdwUdwpZOmdRLodQPwWfwrBrfXsRmNbctLQj/AXgQ38BzeZx2GBZR2SNT4f
         RVq3gSCdWgwT73tc6U18cP9lvNsuFCc0H4Y5jo5lATYkVEybeYCOJueCv7GxvQJg39zi
         vouHBiahkBZQ1l3DMVQsRBTbyEwZeOLhEH73PMkQmpcboD2alHYcF0E0Rml6mGYxEvWO
         qoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775253522; x=1775858322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n1x++2kh/JMrnSacQAY2WWd8oQD4emJiO8jgrYOFWkM=;
        b=MeqYYgv2dDtsXlSjqm4YXUKwORM83Xx9oS9JJu67sYKr/joJMNnpFMHo2FcZG0sME7
         E7YR6eeZdLyB6sJDUwgUncaDfirIzefbSGCVBJIYXbCnz5yJJSYOlwKx7JXpH2Ug4vNi
         3RUdG+WThY4FKm3+3Wq4QBiPYOOZlldIi+K0vSz0TBKF5GvTqcuzd9j1ZFzkmAa0d8o1
         tZxYnhDbBPMDjZlgQJ+8qGDdd6sLhulJXtvoh3TN0OH6+TdowbIaIbNvVYf+YpvRsJ6O
         /OF/jCR28E+0ENPWXYEtNiL6K2bZrACxWR4IHktEGyQ/HRuu9YcmJapf7WaqI4dxsmz9
         Z/dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW6GKxCLyTPkiGAUgMZAaeadjy3PhwpMvy2aE9fHgSnU1m3Bk5fp0NF/jONo/R9Pd+5njpFDgd99611g2puO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YytOkX/G++MBL0uOzqpl4ehassgRzaYjFz6QqSZrnCdjj/PYJSU
	hpfRySBTC55cC72H21Cd2txDb1FMWDtwG0Scm0flo+WAFQEsXTos/VstwV/YJYpu3/+YV95YXx3
	xXENwJtvZqRTZNfumcz4db+roI/jYZeicNf+12cSZ
X-Gm-Gg: AeBDietfxshbg7cHnBfcD/KOfjo19dIywLGfgc05ue7vANUlmgI6UIrAyHB88IP9Ppp
	BdkPxehad0x2aM96e9q1gmegR8s1m5PAqWEz4ahXWrCLjVgiX8x7zl5eMEY9jGkBrTiBODGIqBk
	MqVFDvjEV37N0F7+UFOhN9f/LgKd3Aw/a46lWN2jhDMlDYTo7T6cdQ5uhfS9XPw1s/n2JVz2ILP
	zUzZzIGcOx3xe9C/dLstCdUF4r6KkuO7z460F+kd4MTVe+9lSOq1+53X7Jar2FQHnpmh7bxoryB
	Zpzo306J
X-Received: by 2002:a05:6512:1310:b0:5a2:a5dc:6111 with SMTP id
 2adb3069b0e04-5a337563322mr1534908e87.18.1775253521414; Fri, 03 Apr 2026
 14:58:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323235817.1960573-1-dmatlack@google.com> <20260323235817.1960573-3-dmatlack@google.com>
 <e3fe7085-1297-47b8-bb17-a48196e8f37f@linux.dev>
In-Reply-To: <e3fe7085-1297-47b8-bb17-a48196e8f37f@linux.dev>
From: David Matlack <dmatlack@google.com>
Date: Fri, 3 Apr 2026 14:58:11 -0700
X-Gm-Features: AQROBzCufsJjSomX3fu7F7ptwK4HJAYNpi3kPBVsC_mFldZEseUJNvIFRhG6pcY
Message-ID: <CALzav=eyf4XRTi8MfE_GBNSm+tjmfX7=d0M8Aj5Hh0vJn7huew@mail.gmail.com>
Subject: Re: [PATCH v3 02/24] PCI: Add API to track PCI devices preserved
 across Live Update
To: "Yanjun.Zhu" <yanjun.zhu@linux.dev>
Cc: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Arnd Bergmann <arnd@arndb.de>, Askar Safin <safinaskar@gmail.com>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Chris Li <chrisl@kernel.org>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Kees Cook <kees@kernel.org>, Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, 
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Li RongQing <lirongqing@baidu.com>, 
	Lukas Wunner <lukas@wunner.de>, Marco Elver <elver@google.com>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 2:29=E2=80=AFPM Yanjun.Zhu <yanjun.zhu@linux.dev> wr=
ote:
> On 3/23/26 4:57 PM, David Matlack wrote:

> > +config PCI_LIVEUPDATE
> > +     bool "PCI Live Update Support (EXPERIMENTAL)"
> > +     depends on PCI && LIVEUPDATE
> > +     help
> > +       Support for preserving PCI devices across a Live Update. This o=
ption
> > +       should only be enabled by developers working on implementing th=
is
> > +       support. Once enough support as landed in the kernel, this opti=
on
> > +       will no longer be marked EXPERIMENTAL.
> > +
> > +       If unsure, say N.
>
> Currently, it only supports 'n' or 'y'. Is it possible to add 'm'
> (modular support)?
>
> This would allow the feature to be built as a kernel module. For
> development
>
> purposes, modularization means we only need to recompile a single module
>
> for testing, rather than rebuilding the entire kernel. Compiling a
> module should
>
> be significantly faster than a full kernel build.

I don't think it is possible for CONFIG_PCI_LIVEUPDATE to support 'm'.
pci_setup_device() (which is under CONFIG_PCI) needs to call
pci_liveupdate_setup_device(), and CONFIG_PCI cannot be built as a
module. This call is necessary so the PCI core knows whether a device
being enumerated was preserved across a previous Live Update.
