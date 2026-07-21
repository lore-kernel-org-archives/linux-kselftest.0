Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFF346D0A3
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 16:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651052; cv=pass; b=fOUt/pzLH5xhhnqdx/LVCndG4/BxsXnSVQbMjBUfh+XNuXdMHmRyFrsZgDQZ8latDInenuLFcwkOTY9jw6a5OVAPrWFlu0zF9+U+lC7SHwRtPFcVu0180zPTei/VDbMvuKlYUkllg91EyOwuVFwL/8A9razlLNPe6LkjOumvaos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651052; c=relaxed/simple;
	bh=w7TqouPLSZWjqpS6SB6Qduh6O2/m5T9gRHXf3A1juLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SeKHe3N1lQ69JTSy3QGfQ6EU6cyd31MLISibp/7jXP8hoqhNKmR56x0YvEIfKk+TeVlO5KNXDFU6qJH1HUEnIZO9yCwrjxTZ3MYLbs0bJGXjYKuuEwhXuhfsUTAy8NFQM0mYR6Bj3Xg6wNa5bG9b2S4+Vn/5L2IPYiTWQU6LtfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b1SXohPs; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b1SXohPs"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b2a73da7e1so5610e87.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 09:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784651049; cv=none;
        d=google.com; s=arc-20260327;
        b=X52qhdPmcryQ2b+hSlYrcz4iimMkd+q3BB1a39Z39h7aCfB6dlacnbd4YBvz9MEe0/
         qHBNr7YrXNr/yM2llS6/8h6UUX+aGl40cg2XoU5OTZJAT/RdGiEr8F52PrmCLUeqX7LF
         zhGcHhIxmJEzaQQBp9IuY6AOjIFYFz3k4wBWzdanSZZVzxdgT6+LLPQ4RucM2uMG6YDr
         d2Cvo/imebESWXGig6FrKu96rmbkOXp1Sn+CuY5YYoreTgPIMDgYjKJGwpVXPoUiAGjg
         fOQoi8PWz3NwhTY2PCCjxc/WITPOHEnnyoygwyA1uJuZ6AWRfYQWMy+y57O2mNzzzaOk
         s4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6IIRL+XPWpelEfDBhGxVOXyFyatQ6xSvU7ZF4RnBpbA=;
        fh=/4671N+qQe56FatT9WhOePUaHOD3B0P05QPATXF+zUY=;
        b=HVvJpZoqaW3RXyGDK5oI9+it5l+2LC35gKUkILjr/JN86SQcUQroLeIxaXlzPid0Js
         W0Z9bI0OedsKgpXcMxKE5YACBagCE0M9T8vIgYEQW4a2LGQTuRhXKyWa/bzl5MdrnGW0
         /mp7yPtzV/xxDy/zOWsQp793pclmrfQsmWTRiyX5hmO6Rz7NS0MmNVXLQQiOtsHiz1uY
         oXXv4QI8W0siOo73uqq3w2YzVHB3MT/EdD2DuHL8ZFEdIknY1O1CFRnuF7kr9WY/iV7w
         IwtdmSYfDh7f+qH2nxXhPKAZmL81fTDkysllYgv/f7WZihW9smAzCMMuPhiWkFbWAoEX
         2MkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784651049; x=1785255849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6IIRL+XPWpelEfDBhGxVOXyFyatQ6xSvU7ZF4RnBpbA=;
        b=b1SXohPsmBhAjNS7tX+7wCgZ4XVGVYt0n+ahCjH1IBuK0f6JnYp+h8QLJBwO6cYclx
         eWd+Ym4NbONLzFtQX5WleFaDHg2jh8hyrei3JJVBGkUvPV/qGNW2+1HRcazQvnRpgZUj
         ZBZMckX+v0xZKf6z60vUBYxYaYJhXW1e0IJXGnvcObLnhtloIYt70Z5hi6yzdQ+5UHO/
         ylpHPCYl1UQUp7lhcnmN8FXKOy7m3RNH18cBvhonDwa+42Q6OLz3jEHZP3GlMLwWpVt3
         awURqbHbZoYrrkSRcxlq3wAwYb5NDD8L5aeUFq8Aw8vssjqpuj60QQMCvUdWUr3oDndm
         JEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651049; x=1785255849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6IIRL+XPWpelEfDBhGxVOXyFyatQ6xSvU7ZF4RnBpbA=;
        b=OdG6wt82zLyWLsfRSa0i92xcIbG9eJ15h2vR7ZPBNcEt9wFIi90TKEJFm1FE+FciWo
         k5M8fIA3QvvGZ9jRnLvG4P+wFmOWB54TFajWTSZzPWIeLNLdz0diX38CHycwcfEPguh9
         Y0UPrtMl8PT8vNmBeeOXuPsqINzlh99V/YFEFmcBr8xK4amGFg+kaDlsbcotRGcEbpgb
         OGR46z9RFzRQkjCC4jjFbvXqm6liWNumX1Tp79iVCvhVCl2ISmsn4uUUX5LhCZINb1YE
         /15LqutHEL4AeI7rM+mvO/Fwf1CxyGI/tKeVdZSPTL7Cpb6CMUBlICoQz4gr3x7ZrMyP
         YzUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrbo+RRPNmNXYnoWAUIskJx6v7vfYs7z19ohbxoEi0+5OosQxISRvjJp+cS8ePS+XXdtVMq2lnBaepJQkGomIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxphNqYg4N42uwlVeCkRIbO69Wt/0v0aiyITZ7lVVKwAVAMfENC
	d09MD0za270KRD7AvbAP2X+dDaaxlkbQfwK+LAk3S+Wkasr6Y46O9KZCsawQ39yVT0c5Ww9QDM2
	/iMcRnmsPO6y6sUcgKDHRR8vY2yiXApEqgr3k3fk=
X-Gm-Gg: AR+sD10gqv2vNddMWgMaBrFRE/GHiPQ4f5AqOlxUDIe7QTsP74dYKX99drnypYNiF/E
	EvdOUbXkiWDq7DcMNr3EPeZFgX2LvIuSiaRLDE3yiFFIVarUXxt4H2AO+U/5UVxQo5pNoK5pjTz
	EucCNqt/PgymwyWRPZQmserzeksbOV8qaJOV3rWG1whn+8TnLeENE35hmXVArdQyaAktE1dMHac
	59+3QDOg0vu/xBA/bSBR2ocLyQHlWqMZkyMZfrPHp3COz8NsSu+gh90HQ==
X-Received: by 2002:a05:6512:ba1:b0:5b1:5141:9156 with SMTP id
 2adb3069b0e04-5b2a31c4862mr327591e87.9.1784651048492; Tue, 21 Jul 2026
 09:24:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714151505.3466855-1-vipinsh@google.com> <20260714151505.3466855-11-vipinsh@google.com>
In-Reply-To: <20260714151505.3466855-11-vipinsh@google.com>
From: Josh Hilke <jrhilke@google.com>
Date: Tue, 21 Jul 2026 09:23:57 -0700
X-Gm-Features: AUfX_my4kAQgnpjbhryasf2kLrfrl2S4l9xVYW8Rn_Ur_MRpX7wHXzL-Nzt7PMM
Message-ID: <CAAdrzjsEG2DQoQbNe4aeq8gNF4Td+N6_gTifU6=EzAEuySu7PQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/20] vfio/pci: Retrieve preserved device files after
 Live Update
To: Vipin Sharma <vipinsh@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, ajayachandra@nvidia.com, alex@shazbot.org, 
	amastro@fb.com, ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com, 
	chrisl@kernel.org, christian.koenig@amd.com, corbet@lwn.net, 
	dmatlack@google.com, graf@amazon.com, jacob.pan@linux.microsoft.com, 
	jgg@nvidia.com, jgg@ziepe.ca, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, 
	rananta@google.com, rientjes@google.com, rodrigo.vivi@intel.com, 
	rppt@kernel.org, saeedm@nvidia.com, schnelle@linux.ibm.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vivek.kasireddy@intel.com, 
	witu@nvidia.com, yanjun.zhu@linux.dev, yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 8:15=E2=80=AFAM Vipin Sharma <vipinsh@google.com> w=
rote:
>  static int vfio_pci_liveupdate_retrieve(struct liveupdate_file_op_args *=
args)
>  {
> -       return -EOPNOTSUPP;
> +       struct vfio_pci_core_device_ser *ser;
> +       struct vfio_device *device;
> +       struct file *file;
> +       int ret =3D 0;
> +
> +       ser =3D phys_to_virt(args->serialized_data);
> +
> +       device =3D vfio_find_device(ser, match_device);
> +       if (!device)
> +               return -ENODEV;
> +
> +       file =3D vfio_device_liveupdate_cdev_open(device);
> +       if (IS_ERR(file)) {
> +               ret =3D PTR_ERR(file);
> +               goto out;
> +       }
> +
> +       args->file =3D file;
> +out:
> +       /* Drop the reference from vfio_find_device() */
> +       vfio_device_put_registration(device);
> +       return ret;
> +

Remove extra newline after "return ret"
