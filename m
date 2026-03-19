Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6583B52EF
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 22:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773958190; cv=pass; b=IfDLUh3n328dHDrksM5nGG6ksul/Dz815CRZIHEc5vidtU0eu44JenkCktiXAeTddsrNJYK80pl0XLIldkTYckS+drdIQAeg3hdacWIrGrQfyXKLO9jbusGV6Q+wvq9DddOKAlnfoS+PnYE2agr7csCWxibUvZUzc4a7ZSvtdyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773958190; c=relaxed/simple;
	bh=7oOcuw602t0Hs62ASwAporxmUlW6f0Mxodgh2CLwYtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o2SPAqbmWvcPYzvc1t+1aconxlST8ELCI6cdv/Xa8EBV9F3K21IORQzlotRjocj6crcgFvn9IF/VxdY7bGDfO5Ub4BZh/6VjVRD5/lCXS58nerK5O3pujvwLVbddZKF+rIc5hKV0QA6Y4cRkZtuP+0yUbj7rfKL/pJ3J79gTanY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F64ZwUsg; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F64ZwUsg"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a12c19affeso847113e87.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 15:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773958187; cv=none;
        d=google.com; s=arc-20240605;
        b=A1pzk4oiSiBYfZ9dRxpSLvYHzaYb9QEWFLN00mzSvhG8rvOaQ1Md+bK7ejKsrIDJ1N
         VKuTYGFLF/2Xcj/9nt6D8pCEs3DXnzZUPJ4yvnBFsrSE5v1dmVB+OOpAaqVZ9l/+bo3C
         UCdCISZ3yvhe+Z4QkiEsOay3GEhr6bOB3Cax+fDj2Npq7ePbJ/p3ty9CBUWjM/2Y31V/
         Mcn6+10P3gcbVhbtf19UrG7+w5FmnKcCGBaU2igE9N5yULTtCrb3c7gCXf6N4URBkJgb
         jimDs1a2UXWQjHIAsPNeP25+3uniKd/1YDjmQx6oByG0ez8WOPL/QxWIEtS6vrz3CmIZ
         mTsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=svD4wMks8gwyXRL5XOV+qF8B6FaNKoBJNHk7PXgg3Q0=;
        fh=oBLwvr15u4F1rqJo88CWH0rwMg4EXrcQckGCA4Y1DpE=;
        b=eGOUw0WR4dTgBwjs3cWiZXEnJZAal2WVBJXGNhgQyEAD8hylWRuOSHlKD82MJLBGgu
         ABI+0DSeTEhCBw5qcuUgN3LvmLeERc35MzfbxGxIfwnU9uc6zp4UZCeF17i6IR5X4pW8
         3kmTuaNXDZZM53fySqBO73tJxSqk6dwlnEt2DvgJ/lCvNrGd7xI5atx3rT9MeqFp7LYt
         n3ClPX7s7ip3BBHnYzRQtZ/nFNnowUm+GqJd726tCqN98oY5pFp0z5xQy6Q18EqO2FCA
         QP7ozVoStfGxftgBa6hgYJ7yYRBXvh+ISN5bguiU+aTiuaW1Jy4FsA7svvnfE/AkJLK8
         692Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773958187; x=1774562987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svD4wMks8gwyXRL5XOV+qF8B6FaNKoBJNHk7PXgg3Q0=;
        b=F64ZwUsggRvGf4oIJg5Pnpz/U5EPeC1NcxDs7F+x5V2FIoW4NMVVGcs/24x7SP8/1k
         v7dCerCmDCdDZcyzC6wkbd5LkmSGdwGtqCA35r25QrgjSIv2kivWsxb0wg+cwYffsvWF
         Pw50IEZPO7PQqP3m4bpQ17TvTqH3YlZgrD1z8pbMiPziV+6tP2lswRGU1QyXLt3U3Jpm
         fE5XjdNMNEpFPGnrMzsvzqLTNT+IqAF5j5wVBPPkH4EbTVqzigsAZMh1h/++MBvDYY5F
         01C5u3beOCIA5iMplFYqw495/j09gBcboHxHJNC1TSklD+udxxTBnWchD2geS7e2JAM8
         GRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773958187; x=1774562987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=svD4wMks8gwyXRL5XOV+qF8B6FaNKoBJNHk7PXgg3Q0=;
        b=qWiafKky9lXP0RSS75qQ9idkGA6c4aq4efeI0FPXDlxZKp9jb67Pm355UxbUEswA6H
         XFvYclbIDigHI3YgqVm6SpRDLnE6OLPPhIxAA081f8bbhr7Sva711YvgSUFzgSRKNe29
         hsTnZjYl3smSVzrGkiY7Bujt1lX01UNOaX9kGiU/H6KcJPH7TnS1IV/UjJ5Ia6RRZRZ3
         TkOPxlIHPPZl+GttPrZWjjf4uJ0R/1NzPQUEZBgxj2t86pXUxudNRf8JlqBPzNTIydB0
         QnH47SfmtxH8w30Q3UE9/YueZmrhOvAZW0clQaVYYSz17hyk0sftwbAwShyYhCeOwWDG
         oWag==
X-Forwarded-Encrypted: i=1; AJvYcCWuFh/zDXR7NwPG3WCN8aoS9nk2WVIcliJNaPdd3UE0PdZnCsHIQ809uzAtJjTunKeE0CW/UJKEE3qEVoCK2Gw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXE26evaOZW0JzmjxhsmXLpO1MhpsfRroADz0aAvqmwOq/6a5x
	09p/faTrqBtbZEhvRNfLbBWBF51/Gj0rII21Z/Fz4YCcRfmvbZldT8r9O4PgLA1eczKnEaddnUf
	5JSC+PgWOnNpl/RdZfi49dTuFCn3dh5wrczY+11I0
X-Gm-Gg: ATEYQzzQ8nz3FOX9SKV93rBMH6IRh84gY7grARjTO897Ohuei884CdeGV8AIV4W0pbi
	rZIkbzw30T6Xn0yUEe87x/tNsoc+40KCnzxE7HGtb3zay23eenI2GDSiTqoOB9amdI9QJJcs1BL
	1CZQTtYKbUdXaJh3sRBtOUWsAnvme/nm7Qu2NyAOGlcEX/nrV/mCnS4ONhvLjC7I3QgxzDiB+yt
	JktB+S5c8483ksAZZ9rPv56vDFTtFlM4JrRNwtAHqgf/oJfnxxqYP0Roy42l0VHXSUjiMhg3vrN
	jhFBffLp
X-Received: by 2002:a05:6512:3b22:b0:5a1:742d:277f with SMTP id
 2adb3069b0e04-5a27de01545mr1986403e87.11.1773958186394; Thu, 19 Mar 2026
 15:09:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-5-dmatlack@google.com>
 <20260225143328.35be89f6@shazbot.org> <aZ-CnywNgMnr6f1k@google.com> <CAAywjhR4Azqx8hXRap0eLUrwetYRiX8TALEM=b+1BorPc3eJdQ@mail.gmail.com>
In-Reply-To: <CAAywjhR4Azqx8hXRap0eLUrwetYRiX8TALEM=b+1BorPc3eJdQ@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 19 Mar 2026 15:09:18 -0700
X-Gm-Features: AaiRm51momKlFVcCV9Yk7taG4PZCOSiNfgaYNzeVE1MwV2qirg6S-TkURRRSfl8
Message-ID: <CALzav=cMEkenGKYvA=rNmTmVjpf_DW_92MCFx-2gxqKbrdG0Kg@mail.gmail.com>
Subject: Re: [PATCH v2 04/22] vfio/pci: Register a file handler with Live
 Update Orchestrator
To: Samiullah Khawaja <skhawaja@google.com>
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
	Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 3:55=E2=80=AFPM Samiullah Khawaja <skhawaja@google.=
com> wrote:
>
> On Wed, Feb 25, 2026 at 3:15=E2=80=AFPM David Matlack <dmatlack@google.co=
m> wrote:
> >
> > On 2026-02-25 02:33 PM, Alex Williamson wrote:
> > > On Thu, 29 Jan 2026 21:24:51 +0000
> > > David Matlack <dmatlack@google.com> wrote:
> >
> > > > +int __init vfio_pci_liveupdate_init(void)
> > > > +{
> > > > +   if (!liveupdate_enabled())
> > > > +           return 0;
> > > > +
> > > > +   return liveupdate_register_file_handler(&vfio_pci_liveupdate_fh=
);
> > > > +}
> > >
> > > liveupdate_register_file_handler() "pins" vfio-pci with a
> > > try_module_get().  Since this is done in our module_init function and
> > > unregister occurs in our module_exit function, rather than relative
> > > to any actual device binding or usage, this means vfio-pci CANNOT be
> > > unloaded.  That seems bad.  Thanks,
> >
> > Good point. So a better approach that would allow vfio-pci to be
> > unloaded would be to register the file handler when the number of
> > devices bound to vfio-pci goes from 0->1 and then unregister on 1->0.
>
> Yeah maybe a kref that gets inc/dec in probe/remove. I have a similar
> problem with iommufd preservation, but I think I can handle it based
> on the number of iommufd open.
>
> I am wondering whether this file handler registration kref stuff can
> be moved into LUO by adding it to LUO file_handler and the modules
> only call get/put?

Circling back here, the new plan is for LUO to not take a module
reference in liveupdate_register_file_handler():

  https://lore.kernel.org/lkml/20260318141637.1870220-13-pasha.tatashin@sol=
een.com/

In the next version of this series I am going to rebase on top of
Pasha's changes and keep the call to
liveupdate_register_file_handler() where it is.
