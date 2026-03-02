Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC30B30F7EF
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 18:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772475300; cv=pass; b=hmjMfau2OQ6wd09iCSPv1a0IrL9uWNWbhhzCWnpyTLpsisaDLw4eqB3IjrhU0jeyf4mQ39J3dwfet+dBgYgZ78dYDJHIRc8ulhyATMO8tbeN9NNr1K1Dx4QC8zmCAy4+EB15KBkOzX9tQZUoahA3e1klRR7LShsRnHWEQ5RUsWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772475300; c=relaxed/simple;
	bh=BTi+4ARakd9uxctTdqjtJnxTFNq/yPeOIt/d2iLvfuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XvP/apoN1a++RF2d5/lsKEnsek05CkvtkGjKDwkoqlvD3+6S1cpa24q35u6awVOscCg/JgovrVN65yF+ggfaP1w6F8JNBZDl1UUX3bQYzOxj480FQ8cr3TgnHi+d5v2xJvv7TCO0TTA0MVp5RygRa8diTBRR1i26+3pLyKc5h5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bTMZwI8Z; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bTMZwI8Z"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-389ff6e5885so14600161fa.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 10:14:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772475297; cv=none;
        d=google.com; s=arc-20240605;
        b=I5a2hQc6LFo1Vcnd3Frk8+H6vT4QQlsaq76Wmi0NLN4S3d86gIWd9zHYV77wC5UppJ
         i35NELlZWhzDA39WpsFx0oH1gTZIGvZ5+Bdb6mP6o8nJ2PhcQ8Lbtuj7EDtDH3T+P2/C
         5alRLuo6NjAqTs0dEbq3Kpebztjy1IIkcC+h71tmZ7ft5pj0FuKuBa+2p/JdUS7SQhil
         2228tK35dgKe+A4A55jUyCemvS7V/N0rkHhO4WZawL7LT2RAkai2Dw0O9BJU4pItZ6Md
         fYeRHIId/8HYQ4gNFkJQu6j0Ly9bRXKvP9D26gnhqWQp+2gJj4B7JsyxX73UV/K8JryQ
         MCZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rZw46QiejIxPJc1G5DNZGnj4KsLWM6jIVrYLGkqOkHQ=;
        fh=tbmFa16pXAcVLMCDdmhhoY2nn5mFkC+YwbzFqL9z9b8=;
        b=kkbTbbHikwOLrO/3Rul0/Hj83mCfG7TdyZbDN1IiwKadEQnL3kTAqNy4J0U/wL6nO1
         LtUVh0P9hwE3fUUBq5pNEwc1xsUlNEFe1keAPeLHRcKdr2oH1Y/kBHlqWauvwvrfnhTb
         vozkYBq7+nrpHYutA5LuaV9sgoMogYDsZnBUUeCsjBtDgMmE6oaHh1tD+/1epzwhagPU
         0ZunIL7ETJ/UwzQRiV45GiIXRCAk5Ppy0S0HBK/Lz5uGU7GGRT+/mwCKCR61aC0Mf/6s
         t47I/zIRRvTY2x0LJRFNLJpu9nC6b08PC3OCItVniE10LqHmoePtbsN6gF1n+7xOMC4q
         4k4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772475297; x=1773080097; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZw46QiejIxPJc1G5DNZGnj4KsLWM6jIVrYLGkqOkHQ=;
        b=bTMZwI8ZdQqnj4AgTxkJe6IjG1pfNONBuMwDLAvSla2GHqfEkX0h99WhB2RdJaxT+T
         ujJn1WMtH6ol/zVwaursQALwAzikhqQRDXCXEVQw3oUlr3T6wYY/W1MLeTLqR1U0ivhK
         o6px54O0EN+5JWoPVTj/QKoXmNd1VRfu++gSIhoN5AiBjhlmwEUJsUfn/rAaKxPB66UU
         TgVupI8uG5Ma/tMs0zMwft7t0/FZmOkm4e6VdgXJ5uE9PhQ3K1eQqmyVK7Xy56dQ0n+C
         EdIjgD9nrHWAmhLtECRerfHkXFdZoUUZGd/7Y3fpDuU4gxAd0M745lS0yWkTmNo9M+Rj
         J7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772475297; x=1773080097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rZw46QiejIxPJc1G5DNZGnj4KsLWM6jIVrYLGkqOkHQ=;
        b=NTOQu1kXs8wIbHYJvs9hB5bKltWxeLf7mCzghzaOACzBsXqLD1unUa5qwvEPjmT7Qi
         c6fjZ+/GCzSAP2kWva+IQchD+I38aVxG2UUWpUqBG7ziEDNDwuyhwGFwjoC+Oy2E/1M6
         wO+vgUb3ff1u8UZqXGxenrsukfHYxo15vIIhwSOfKstJvywL1G8HZfA8yyJsCZvI89g6
         aFI/svKDhae+oAxF8aYdG84P9c/giT76GShB6ck9pUR3tZCt7h9Gw4mGUwrT54jqlf2T
         GDsoUvR3VUmu6BWlen3jXsOM85GgG22oy8OHBnbWcInJRxKrKiY2ptjFs25kgUxQX3LS
         y4RA==
X-Forwarded-Encrypted: i=1; AJvYcCW/0pLM2+zI+ZTzQbxSui7ourIz48LbTjZhQRUvASzzEzsztJfr7I67B76pQCUBwEs3wNDuCaLuBQ27dMMmjfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjpmRIHrj25PjIB1L6gz+J/XWWfseYcBBd2Nv/GTQmjQRpKxln
	HJibzzkZtL9gY8UAPoMozABTLSSXOsHJrd8XJfOBGNkJLk0OtjJJYFhKBNnUNJvwe/+ZYpqK8U1
	3iFrdrX0eB7QxZ+R9JEVaWRBBJjO0c+WUGtwmhnHB
X-Gm-Gg: ATEYQzx046+CyH7DADn2AQwTbiEt1Mk5m4ttaYmY3z97bLP+ZJ/5WKgnGxU70CI2HgQ
	iz2BDh4DzVr1Uj2unui08Wx8DxAM+xolOxM7veeuw2xZ8JgpgHKvIl/V5Bkt/hFTIcqQeDqMSPs
	I5YjT/KfLI9m7BimxvgVD50+nl+Up6fwE/YhOi63CQMD299N54XwqlEfy/Ei26Iq9qzY2l52YYN
	q3JvA+37wCqsElW2bN/vwMgCtwPRHS7/Q/Mphmp2N4lXJSRBu5ri1+AOatn+9fqaeYBVjF3RCmI
	CQlFv8o=
X-Received: by 2002:a2e:8094:0:b0:389:ed12:9731 with SMTP id
 38308e7fff4ca-389f1e29849mr81213251fa.16.1772475296490; Mon, 02 Mar 2026
 10:14:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-4-dmatlack@google.com> <20260225224746.GA3714478@bhelgaas>
 <aZ-Dqi782aafiE_-@google.com> <20260226144057.GA5933@nvidia.com>
 <20260227090449.2a23d06d@shazbot.org> <20260301192236.GQ5933@nvidia.com>
In-Reply-To: <20260301192236.GQ5933@nvidia.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 2 Mar 2026 10:14:29 -0800
X-Gm-Features: AaiRm53G4DyTBgh8HthgkNXd7A4lLjemXkfCrH3k_RfrPJCtk91UZa8WxDGHRMs
Message-ID: <CALzav=eJ63gitLatAerrjEc+o3VXcRor3XwA7_o2PmKYnMwCuA@mail.gmail.com>
Subject: Re: [PATCH v2 03/22] PCI: Inherit bus numbers from previous kernel
 during Live Update
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

On Sun, Mar 1, 2026 at 11:22=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Fri, Feb 27, 2026 at 09:04:49AM -0700, Alex Williamson wrote:
>
> > Not only fabric topology, but also routing.
>
> Yes
>
> > ACS overrides on the
> > command line would need to be enforced between the original and kexec
> > kernel such that IOMMU groups are deterministic.  Thanks,
>
> That's a good point, I think as a reasonable starting point we should
> require live update preserved devices to have singleton iommu_groups
> on both sides. That is easy to check and enforce, and it doesn't
> matter how the administrator makes that happen.

I can add that in the next version.

> You also can't change the ACS flags while traffic is flowing because
> that changes the fabric routing too. This should take care to enforce
> that restriction as well.

I'll look into this but will probably defer it to a future series. We
need several more pieces in place until we are ready to support
traffic to/from preserved devices during the Live Update.
