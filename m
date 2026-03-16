Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE463CF683
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 17:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681005; cv=pass; b=MbFduRnnH90PMaVzGXXQuuC4Bh2zJ7rxL4FhU/1ZLw+aRov50yK+q9EO7/ER0YQ79T7vRLNrtMS9/NslcF8eDbsV5GbNA7NREzWJsYMXMvMtDh+V0LvU4xjhlhU4Q3REX3gbBC6pcpI+CSmg+c1QxE+xAx4LdjXVA1soyiHnD2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681005; c=relaxed/simple;
	bh=dkI9QqpDtG36LgG+kw8ZEzl8s+Rk40Z2naIpV+PYS9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ANuw72mxAw4vJAyb7s5Z/6BcneasgdusT9Ru+RsWDEBTlHLMKNBGr1u0Kk0D4YJqUbGicHAXj5lNDAPWnDZoyUX0qYSNCm8AOT+tYCo9KdCFPoFDm+nzpUjUl2hO5LG3qmPwbQ+UavwxGYx8lYhNniAU9GYM38/f4UnAiVn9I9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vA8sNSIY; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vA8sNSIY"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59dcdf60427so4175331e87.3
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 10:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773681002; cv=none;
        d=google.com; s=arc-20240605;
        b=XafV/o2jxXK4oGpksdbJucSkz2YwIHv6T5Fb4kiG5+2K2rvY0EZpnUep2olAP15Fwn
         EAQ0n5hEMzgImyH1+gA4GjgcAz/wVLfi41efwcqmeh+qnYzL2kP/GKACWSgQrjel5r0X
         3U5Uhu8Dp2hc3GXMWcl564A8AWRXMUM4MKEj/M5mY2sdLYvtzHEEf9a5R/PRPqbIkYfy
         cHo90/cnuayqH/k3RDfb0cXVWEBAAt21WC7S5n7cY+8izYOP92e7O/Jzxrz4eA/Cp7Gq
         IHMlYRSQaIXnYUeRB3imA3Z94hSKoGB+wmgCdgSZLuMsf47D6WAVm/9Q/EXZ1TwcsU4K
         ZqnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VjajILnhW/iAqqxkTb08T/Hii8IQWi4dcNUVIU2+S2M=;
        fh=qGXx9GvLuLkoqbtHMGBFrvCU/ZkniS3JEn3vQgm3wnA=;
        b=cUHOQhzw32V0/yzwvpqvq3MepufFZOk0uGAroLKsrZyJ8sffsW8TqQrOiVCF6ESaen
         3Q84uydpTPiGZrwPR2TV+0qQHtyjdr4NgEJSHnC6aJ5AVTuXZm2Up1Kp166JoO40JJwi
         p49r1eOJdLSSdCwMdRShS2iAMQJXfaG7HZYukIwqAj/JXfgI/nKHrF9rymEThFxayIiN
         GZN6uUpao+1MwcTsBlPr6QWhM7F+yOKsfmGmoRVFAlY7B+WTEmwthFkAlCaRoirbKy6B
         6OpKVYt0KRdrK4EJ965wHy2eSK8+T24tKUafF4jnjGMEsMsRJFx3sYv4IpcVRlrHk0Rs
         BMbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773681002; x=1774285802; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjajILnhW/iAqqxkTb08T/Hii8IQWi4dcNUVIU2+S2M=;
        b=vA8sNSIYf/v4LksXXda0XuPKnMxUj1Ibw/V/HMiYc0uWmvIPLbjMjZutFH3c/xTpU1
         RAACgDVXP6gVNYR/uFS9P972GPZRJDMuLumL9oCN8g6TCQ5IqQKJmvZeOtsCc7GMlM2S
         Aa/WFaphNihK40YrMJShq2dVVayP7l5bbY8YUPt0AF6KmANG+U8Csv3zxhf2DSR7QsHq
         jHtRDTb4g0voHjGWEzKpDs9CSbsAig34r9K4wIz0rzOcvVmAPXinmzrWqi9oZxytnRsY
         dPAMooGHWuj0Ty2OwKmypVsAHPji3dnmov2T0RsZkDz/9yTkcc/BUuauM0YpgKZMaP+u
         sGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681002; x=1774285802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VjajILnhW/iAqqxkTb08T/Hii8IQWi4dcNUVIU2+S2M=;
        b=tUvKXR2APgqHY9jyD3uzUKeT2f6RvoNXAel/5Gm2coqzQgh+P90IzNnxP/PbEV7Wd9
         dR4JRTmLIoMynlmooqHR3MWvAIVYqbwGESNUGlZya3sCBsihU6SD0NHZr538V4JrloCx
         KTKgG+KtLHtb9mTf3/EYbl7aoAxrjrdW9ZTW95eEYbMPKJGYx3sdpftVHu1wHxIIxTVS
         cNlpdvSYa3ARy2bXcxFB2VqOhDZM3kYT3hjfR+AahdBOuZD26Mnf0jPdQJQu6zA6MYFP
         0zFqy9sFaueqT3AXLIOzkTtIgYMgjWuw2S/kMWuJDLlimSbPpsi4gprjtCcJKpsv59sH
         6jFg==
X-Forwarded-Encrypted: i=1; AJvYcCUlLuhYM6Va7RAKiTPVJJH3tQAfquZfkqK94BURrjiKfPt5bE68ky57ggmJi3sZdGRDK8xgCg19R38f52dGFj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvDI3KXXhAc7StVYRiIzQ5jg8uoAIWyOyWBiY5NAbqJWwh7Ar+
	ub/9AhrrfBMuFOg/AwnJIlShBpAtbJD2FKsHkG3/I/bKyHYfmnh4KdCJWVg5cF4fHquOqNpzK9F
	XAKV6nXI0RKB6NAlQ9jxa+mTnK31dp6USDxztuwV2
X-Gm-Gg: ATEYQzww5PudZ/FEKmqJk3vrrzs+MAzWlSRSosshdR/3I85YQFn5RGnzepPwtsdzRli
	M2je0v1PuBYmu1dqc2lzLR3M0kndz933olpLmhjGtZmF8Jnf28ygKsmP62hBkR5l/ESUdMTCOdQ
	dZ7HW7pkm+LhiJTdXZG4etkPq5AdyKE4PV/UA3YS8X2IJbJVlDLibQfOqEsThwmXzlPjFMBJgjI
	kfrhL8COjlsnDRgtJ4c+Jzzn6MK/lI0xhO014dTLNRZBGBZIKUWo2wqVqFfCzhZjvKFqKoot4wo
	++xiVB14P0jdPNa26Is=
X-Received: by 2002:a05:6512:145c:20b0:5a1:3207:694c with SMTP id
 2adb3069b0e04-5a162b0c23emr3396226e87.29.1773681001667; Mon, 16 Mar 2026
 10:10:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-17-dmatlack@google.com>
 <20260314073250.GE4177610.vipinsh@google.com>
In-Reply-To: <20260314073250.GE4177610.vipinsh@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 16 Mar 2026 10:09:31 -0700
X-Gm-Features: AaiRm539MAtTSlMtJ9cZiQMw7S77YkLj3Qx3YTaEKJUIvtilcVTIw0VDB1yQ5S8
Message-ID: <CALzav=fWmv_+BACzTLq2Nj2aUux575EnbLRwJTevH4aYZTXycw@mail.gmail.com>
Subject: Re: [PATCH v2 16/22] vfio: selftests: Add vfio_pci_liveupdate_uapi_test
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

On Mon, Mar 16, 2026 at 9:05=E2=80=AFAM Vipin Sharma <vipinsh@google.com> w=
rote:
>
> On Thu, Jan 29, 2026 at 09:25:03PM +0000, David Matlack wrote:
> > +
> > +TEST_F(vfio_pci_liveupdate_uapi_test, preserve_device)
> > +{
> > +     int ret;
> > +
> > +     ret =3D luo_session_preserve_fd(self->session_fd, self->device->f=
d, 0);
> > +
> > +     /* Preservation should only be supported for VFIO cdev files. */
> > +     ASSERT_EQ(ret, self->iommu->iommufd ? 0 : -ENOENT);
> > +}
> > +
> > +TEST_F(vfio_pci_liveupdate_uapi_test, preserve_group_fails)
> > +{
> > +     int ret;
> > +
> > +     if (self->iommu->iommufd)
> > +             return;
>
> for iommufd variant, should we mark test as skipped instead of showing
> it as passed?

Will do.

> > +int main(int argc, char *argv[])
> > +{
> > +     int fd;
> > +
> > +     fd =3D luo_open_device();
> > +     if (fd < 0) {
> > +             printf("open(%s) failed: %s, skipping\n", LUO_DEVICE, str=
error(errno));
> > +             return KSFT_SKIP;
>
> Both can be combined using ksft_exit_skip()

Will do.

Thanks!
