Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F4844BCAC
	for <linux-kselftest@vger.kernel.org>; Tue,  5 May 2026 16:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997031; cv=pass; b=S2WN/4y4aEq5x4ly1WDJ3ogn9KKtr25Z/ka131CO20tUV36i55AIQCLZH6gt7y4cr7QNznELyG5SGwG1xPTktmJFmDhf8lQW3YimWhPwNFy2MHylV9ZfleuJRY5IsGjKRjDcZ4qQ+lA7TLU89+C418cx6CMmNYxNSITWqJ2ZG0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997031; c=relaxed/simple;
	bh=DOxw+2aGh05xah5kcfBJMyzXIPlOW0sfsA2Z1OFqjOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Crw5vUQOT2iU+T6GAOLryWZS5XUtrdq4MU0Z33qBjvLLDRnlU5+oiWxsX9XXt2YZ4Uj2yl0LX5hynDJc8cElIRilr+9v0OpG9Qm7Hdwoz2BY6jVPve9q39VY7+Lk/bmkDJBVblPcK0Id+7IaalKT9R5T7ps/PFoOoshLtXrm+Os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tdamdiJZ; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tdamdiJZ"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12c1a170a50so7115354c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 05 May 2026 09:03:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777997028; cv=none;
        d=google.com; s=arc-20240605;
        b=DQLnOV1XZW8RaOBvvsrPsm6TLTBXmQeRy5w9Niscx/iUVCHJz8ZuGGgXzOF4NIE9E+
         tl6KbAggR3fv/4KKBKkmkcr3q3BeKYXE3/9+yUbtJibSRnVO5ZdXxG7ajVIGPeNICADr
         789drZEqYwCSQoqAeuujK4xUwv7cEMle51FpXZOcCv5K1lfTYbdHFJ6+xd51LI9FGUIt
         u37phpDqk0Zf/ybtY966CQOJutUpv2bhHUl9ppzVHHHKosLutmkvN4EOUfx3dA+4tra/
         Y1GhLxzxvzBPzZGZ0/112O1H9YQBnDApLDdE0gV6TgKFOQkh1HAttRbrX+INF9CtAayr
         NXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DOxw+2aGh05xah5kcfBJMyzXIPlOW0sfsA2Z1OFqjOk=;
        fh=Loec4x1TsA8W6T+OhwRH4tEUSj1MF03LZ6aq0pgFMXw=;
        b=dIf5JFx4VinKHqPMwtzsLmhPeuTuZu8QZBF81pbsQJOCcuKsPV+ru/TGXGHBQfmglH
         N5fgyz1pL1hyWJsQ3rMDl38vpaMeHmdQkD1hFrjAUiSYb27d5G+oxpztJVB00nymnlj1
         HIWZITFEpMeJyhTe7W+o/JvxRZkYwPHoOcEUZXpmNluO6zP0mFmEf8CwA/i0fXlQol9K
         Jk17JPZQw53EqQZr/bfr1xVoSmpy2CIl8k5rCsXWNBjHCwTQbSnoGSiqwkQMKN8h3iEP
         h69t+ZZ2p3UUVfatmPAGhD5kJ27UDjCYX84SwSe95mQKntYkvPRRw1TUsvsZ4D+fii4n
         M0Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777997028; x=1778601828; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOxw+2aGh05xah5kcfBJMyzXIPlOW0sfsA2Z1OFqjOk=;
        b=tdamdiJZ8AIZ26E9sOTTyk5jU1BM7rY1atHf7juQtp4GtWQo2X7xFMAFFaXqis+usC
         3rOop43vEFOgGCM2lvtCWwGpCZd6r8vAhaPGXwFp3uQUG6mMe/g9x6YqrMXZg5OlxsHA
         tDFr5xlKD89TC/QqpPzhkoloRoC5il7rqtZqjrl2y1cI77mU2u/DViFwzy7cuCXvJHoM
         xeHOlDIGsgSvEdI7UJiVxJvEYA2LvyWAhv9xoRmwBi7Kqq2Jl5FVOzD/TDXFPOsAHrTU
         ZIz2AMStuM2F+GMwYJdzBqwmibTYK1T5ShB1lfsvPz8HFg4B9nOYk3PB+gvyJZED4p/U
         AsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997028; x=1778601828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DOxw+2aGh05xah5kcfBJMyzXIPlOW0sfsA2Z1OFqjOk=;
        b=ViA0Y+XSIvoFBpyD1L851M+S0ZlS/11bqODlXo7+o5nrdTD2qO9KyGIGw2AW9FGkM6
         UvStgKbd1jJ4HjyNDcNIS8RNV5A9wwWWwe3N0yFRfq9ayDqS8WLBfUgOeGmdRg+GSZ7a
         mn7DgWpule71xKnHCMpSVJfjNzqxxRLxq26cCdI2li2zWkYG6UGObYCVTuBYuwyBPkjc
         URfxPgVZNCSn75lhtPk4TMxjNi1cuK1n7PviojfOURM8RkBEdZepTnvnsgKWDGhJuVnB
         EYHp5H2+RyfeDVibNtWwI4bh6v9hdZE0DSiG6kjSPxSsLvUsKja7fLaywAjllVAHfeIf
         vgUw==
X-Forwarded-Encrypted: i=1; AFNElJ+yooCvfAGagfS1J94aYfICkge0OV+IDmlG5MCSZZ7DHJImmZUxFAOE3aM+NOYjEaTngL0VtLSqWLWsQCBy0q8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTzjOBJyVna5lRMc2H2PQSYAZ6OU/hOKuVP8zWTPuFk0CdpXy6
	uGbHNWT7yR9g0ec6ILYnC7LYj+BFT+icyxDY+MRxMgSB+nAOG1c8wasjFqPekLuqeAPNszjw5ee
	keszOT5rFF2gL7yTW3WRtdEzYOOoMFkXihLzgl01j
X-Gm-Gg: AeBDietzP6I71E2QKCcGKmJtJpmjhmqzQZm+HOD5Y/T54t6no07THzz6O+R7g1UbitU
	eCrCTCrYgFmNuRy8PxGv4cssTt3wAOfwZkI9P8fWqgGwiC4Tg2u6Sp70Hf0UdObU5GWSMkz0yLk
	SceDjeWSBpxEFRlKHWTR7ZioMAsjVltZWu9mjYRR2Sv1PZj0JP6qBHMU9iRox+2UiiT+ZSx6sSS
	uaPdeqG3OdsuL3qzTo1x8sykc6Zi0o34AQktmL7hgpnJ5IAdGnSC/YvlX0lIG8=
X-Received: by 2002:a05:7022:78f:b0:12d:ca32:59f with SMTP id
 a92af1059eb24-12dfd7e5bdbmr7028039c88.11.1777997026608; Tue, 05 May 2026
 09:03:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0-v1-dc5fa250ca1d+3213-mlx5st_jgg@nvidia.com> <9-v1-dc5fa250ca1d+3213-mlx5st_jgg@nvidia.com>
 <afkfP-8UHaoyLd5Y@google.com> <afoQtL6gEN2wUba7@nvidia.com>
In-Reply-To: <afoQtL6gEN2wUba7@nvidia.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 5 May 2026 09:03:19 -0700
X-Gm-Features: AVHnY4LsNmTptv6RYHm1ivIrJui-vL8wanpj85inMj7g24wxtEjU8rbJcAF7qfg
Message-ID: <CALzav=eQcRUNR8FtqDwXsjm+MbMSN-u7GyCj96-NmbDhB17GRQ@mail.gmail.com>
Subject: Re: [PATCH 09/11] vfio: selftests: Add mlx5 driver - HW init and
 command interface
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>, netdev@vger.kernel.org, 
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 8:46=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wro=
te:
>
> On Mon, May 04, 2026 at 10:35:43PM +0000, David Matlack wrote:
> > On 2026-04-30 09:08 PM, Jason Gunthorpe wrote:
> >
> > > +/*
> > > + * Driver state =E2=80=94 overlaid on device->driver.region.vaddr.
> > > + *
> > > + * Contains both software-only state and HW-visible DMA buffers. HW =
buffers need
> > > + * strict IOVA alignment.
> > > + */
> > > +struct mlx5st_device {
> >
> > Can we do s/mlx5st/mlx5/ on the series?
>
> No, I don't want to do this. Since it is in tree I want to reserve the
> mlx5_ prefix only for the main driver. The driver is huge, I do not
> want to harm or confuse grep - that team will get mad.

git-grep can be scoped to directories, but ok let's keep mlx5st to
avoid disrupting anyone's workflow.
