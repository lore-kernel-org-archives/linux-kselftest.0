Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F126531F999
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Mar 2026 19:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772739768; cv=pass; b=hhXFpU5cJZOqu40J+i1GsXFl4R9kRc1m07YPb6w539WKMBpFfoLiaf7CifJT8m3Pos2Ul8n9UOxF/w2vnBtmp+/QSwqmJ9GpBVQi0sQ8FQ9o52trpuocbgjzmnhTePFFDM4t01zBmnnTnlq6J/GW5A7JfdtAxG/1C1NHlKWElyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772739768; c=relaxed/simple;
	bh=BFL2J/Icfk5z6sblaLG86L1o2xcdsDyOfso7V9JzEr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UKx82dffhCFZ4Ja06fNkdvP8souYa7VG9RTvKfFJovKWYVNLU7F3sMLObTC5xOMh5ZqBRGMVLMfRZFG4dRwASaest//tQrA4p51Nxayy3CMx035EhbCw7P8f29dBOqFlOa+P5O85s+8b/2SsTXNriggA4t/5ioyC168Gek5EOlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J7y/Lq1I; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J7y/Lq1I"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59b672f8ec4so2673257e87.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 11:42:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772739765; cv=none;
        d=google.com; s=arc-20240605;
        b=TpCNZz7Vr2vbbvgqbiCA0GtEN1nNdovDIohRXlwgRWSt7w4TrbEHzdk3NEYvHjNwDn
         dYkgfQPVpyA0P4CwnA7XEZtS0+1rlPAZno8c4DqoUVUDE/USSbXU77D6dtoKGDJQFU+R
         Byw8FFeq9X+5s2L4UeWra1vN9fqPa1eWGywXq9KayItSaSA/EE3VFeocZ8Eq/ppLpmbb
         3wkIe0l1f4vs2J0UeeWEoG5J4Sbw7fetX5pYOjVQk4VgDsmv3vTnYvIv6VpHPQyeybKl
         49zzYhBntwRNsIsyk3O9QYKbQlHTY3Nse1fpnT0MzwAsPr5z2mK7zJgMqrALYG37Tt/h
         u3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BFL2J/Icfk5z6sblaLG86L1o2xcdsDyOfso7V9JzEr4=;
        fh=PvGV52Szj2pYvTkjGWbn1D+sRWZYtSyhY8Uj6CjugnU=;
        b=GW9n2L9UDO2fpFbV4AvDtV4F7YJPMJ2A00hTmvwOR4f4gUTAV5TAOcFzagKhKg83Ca
         3VZvRowMNq8li7T5qUW5NrW3KtoMyQvMBYKcPoltgnsqqueRZCRUTNVWg/FBN/oX/9YT
         ecZrlzg44aXmHOJehDPRce9LGpozdwVFPbRo5aP6arqsXBvmvodnWLDc+yFu/+Mnvp8e
         dhitDgrRPXv/XKPQOCKS9FmRcTs7e2eoebUEU/WuY1BjP97PFoxSAeTVzXZAl9A8XEw0
         FgNDWQN3Hpg/OEA9UM0TsMVopNLPHYfCVEFEP4PEfS8nRsiUu11vxvrMspCvvPV+tWSq
         ZsRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772739765; x=1773344565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFL2J/Icfk5z6sblaLG86L1o2xcdsDyOfso7V9JzEr4=;
        b=J7y/Lq1IxLU+Dz/yjyvb/dPGPWnJbQob8Q2QuxVwDq6DrAe8KOLBbCw/RJH28ZsIVm
         eLzXtNQcCvkAEH7bpRZF/pHYbvI0NuBd2MgR2c/Tmts2IWoPoUSUjur+tO8lJhe/JPu+
         wNIM01PysIEn8QP4iLyrMtWwOGswInpVK2slbAeLvCixJcS5Jcfm/YXy9W33WHWUlNiP
         +p8C9bhO6HnUerwsZkWaI2Fa4KQlt131xsUL2xLViCepC/XpkT2ZzP5F5tcH1trI7ll+
         91MgpSRqDkP3dwwPHNc+cwgxgozBIsjP9eh+BAsVQOwjVYYakt93rQClSztQIsXMrt+/
         C4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772739765; x=1773344565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BFL2J/Icfk5z6sblaLG86L1o2xcdsDyOfso7V9JzEr4=;
        b=guMSBmHVF/NgHHsWvbTo3FyVS4R4nlPLmKz3bxeyH7atWzRmgNvDMmwQaivK3O+C/O
         EyLx3rDEnfNhK3p1D9529ndSD9dMjzWvTVhhj6c2xAMiz+5yowDjf72Nvy1LC1YZrG1t
         QJEinxRNvH6SYTZZ6gZ7qCG9dhPP+fH2VKoLjrhE5Nkz4KMJXJ3mUNLIoa+jGSi2z992
         gmJyRdURfHLnJ7V6hf0dePkB6PuJaaypCU2X+BsWKs/E2djw6XTMR9kqno6fuo/9DXdx
         G9qWfqUh/oGGIJoZboWjQNTDsuX2EN9rgPoqlPcfNblj44UCtbwgUBQXUI0rSLvBsOwr
         yQGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwGGyBYfAOG0j0JM1erbXiR/GUhV3Jzd0AhJ9/LRDDPshxaq0BoKYUZhHrum943UHDWU0FiwEP+MZDYBwSZ8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRqwqY4WUIEhYzcztI9hw2J3PlXug3LD/3cQ7NnHtJ14J/lFxs
	CiXilHRYQWWXKOU2iHhJBwMkO+gUCvSK8D4d736zHxumFeIM1ypup9LHOjWS8gYZ46n/QwNxTgT
	o8K8XLLmD5pFUWT1I0TBpWVWS4RiPzyPeKJWaBEEZ
X-Gm-Gg: ATEYQzzRfwZQhd7UhsrVI2p8VAbYYGwg6U50XICZXmZgJ4J/lpdlQ7vUIomvmzZz0m4
	b/6A2a+NVgeDiI0cUbSpxQCZP0zFNrIJIcShFLIQcM1rFEAubpYenV4kJv6bU8GYfw921yRnZer
	/WxuM93bv5BxBWyXu0mv0Jg6QDjQTMEbIywLuqnuLqG6NE0OwT8YVxzsliS7Q4IVcRTzUKYw7Hj
	cETj/W0Qtu7WQqUlYWusUnvcry+8xAvwuR0hL//6ROmLPGgol+iw3okNzUugo/fvO7d9G8Li8aQ
	ItJYridJ
X-Received: by 2002:a05:651c:1587:b0:38a:6f5:4b54 with SMTP id
 38308e7fff4ca-38a3c815300mr2046311fa.4.1772739764639; Thu, 05 Mar 2026
 11:42:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-3-dmatlack@google.com> <20260225224651.GA3711085@bhelgaas>
 <aZ-TrC8P0tLYhxXO@google.com> <20260227093233.45891424@shazbot.org>
 <CALzav=dxthSXYo13rOjY710uNbu=6UjzD-OJKm-Xt=wR7oc0mg@mail.gmail.com>
 <20260227112501.465e2a86@shazbot.org> <20260301192924.GR5933@nvidia.com>
In-Reply-To: <20260301192924.GR5933@nvidia.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 5 Mar 2026 11:42:16 -0800
X-Gm-Features: AaiRm52QizUmbxb_ZZJRNIFYAvXcIrsVMR2oGVyxQJsUboHWoi4G3a03BNBWEM8
Message-ID: <CALzav=deyfyzGXzSGmEbjvLr8Nn9Rpeh9w9JVk0vmb9FcURYPw@mail.gmail.com>
Subject: Re: [PATCH v2 02/22] PCI: Add API to track PCI devices preserved
 across Live Update
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <helgaas@kernel.org>, 
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

On Sun, Mar 1, 2026 at 11:29=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Fri, Feb 27, 2026 at 11:25:01AM -0700, Alex Williamson wrote:
>
> > There's obviously a knee jerk reaction that moving PF drivers into
> > userspace is a means to circumvent the GPL that was evident at LPC,
> > even if the real reason is "in-kernel is hard".
>
> Given we already have GPL licensed kernel drivers for the PFs it
> doesn't seem like a reasonable worry to me to fret about some cut down
> version of a kernel driver running in userspace.
>
> Further, let's be honest here, the people most interested in all of
> this are doing it to support their proprietary VMMs. I'm pushing that
> we must have at least a reference implementation in qemu before the
> kernel parts should be merged..

Yes, this is why we built VFIO selftests with the driver framework
[1]. We wanted to ensure Live Update support could be well tested
upstream independent of VMM adoption and without requiring complex
orchestration.

Google is also working on upstreaming Live Update support into Cloud
Hypervisor and the kernel pieces land.

[1] https://lore.kernel.org/kvm/20250523233018.1702151-1-dmatlack@google.co=
m/
