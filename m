Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ECA481FD4
	for <linux-kselftest@vger.kernel.org>; Tue,  5 May 2026 16:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997149; cv=pass; b=UNq751KqXNdu9u3gX1ytAc1wDD2g5Yb3tKPgOdpTAJJgbuvVVjVHYiF5pKe5p45gKCf7WO3hlHUdSEoMWwyQlCYQZ1fw5caQoJdAWsFiMHC+rZlIlt/Z/UxhMLapkn4L3AhQQpJttauzSPGzx2dpZG2O3gzUUOFkBBkOagFIdEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997149; c=relaxed/simple;
	bh=J6ANT64o73Oy/MqjWeiTVaKBLJandxdhBxQ3kDb+K3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EI6Z5ntDCQOThUI9fRMfxPRTCGgsMCojJsBrAtHI0ZOQnwl7MV10bDYoqhTxyrL/ykyETzmO1WXxhuHSlniiBtnOFGCHdzqDUY+2BbxE362bKxD9cHvh+mYL+bSl+H1M3Fu8ZMm5iqibau9MZWlWrIul3FuEUFSGJM16JREh0GI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TXITp4kL; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TXITp4kL"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-130c653cce4so1537432c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 05 May 2026 09:05:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777997147; cv=none;
        d=google.com; s=arc-20240605;
        b=TZ7xQiW6lDN6ipm4iggO+01S8PDwU1TBwqVR5m9PHDFXqlS2FI8MRolzWDnQNKNXVk
         ugcdPwcy+SBVaoDR86fFcQZrHKzbz51LDBidSR2QvOPSzs4GlUVu7Lgadi4h0qS3wSpb
         8CClpocchYaBf3F/DKpKKJ0iWiXIIDKt8KDgGrMKLzTfobHT4WSlvZjgIxRvUlNNL73k
         p9UnnylewDl4cNAWNyyHeFCk/koD8ZP03gdaX0srBUU2ZJyfBmy2KH/tmC8gh9/s7XA7
         tzYzElvSHBUH18bLZZkg2dcooEufwzkxyml+A3Pf0Qfb/0QZEK8xVdb8uwvHTsKxgCou
         DK9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jr+WQFKJTcHJZ0sRMLiTHOm1qsMvrLUcWME2L+LwpFY=;
        fh=gPDazbV6POLTtNM8H3Tg3aoMbwp3xz+mc+4JcVTdSV8=;
        b=MaQrRQV6nVwW2P6twFhNksWXX/9FtGRkYaOtfQtARYmrgCHt/H8Czv7yCQfv1dpj0k
         MCZTHv2B4DqQPiZJbeWUzQKDp42FmsAq0JWxaEZmmgsxCC6tbCzpWIMxqMR1VV+/L/Gu
         vGO9msHXZGH6q5ruqtcMeIXyxx44J2qzIDEwN3YEvz1hH698Fl1WZwRG8P46vO9DFcCc
         DvtfJtEVPdCiIgnN1IH0nuAamkp2xu5C2L/jUvvOoZZDZehCDnZIhAMYZkgu7ZgYvIPl
         hHQIcUzikGh+8k7DzmjkasOmkE+ZjZXcAjLmcN12JFDP3u7ITxEInBfMpLhOCCkD4KDZ
         0hAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777997147; x=1778601947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jr+WQFKJTcHJZ0sRMLiTHOm1qsMvrLUcWME2L+LwpFY=;
        b=TXITp4kLzGaLEQ2tD87iXCniwLYk0Hoh67wTjG6eywIBT8W8M9bYjQuTxUtBqXjcnz
         Z2A0YG2LTUTtYeaxAqFcvAPxJN18EGASAFFdhU+HBfELiWbMX1c5fXYpKnv8xPnHDDqU
         0a1zZoY8i4YZu58ZThlZJuMMvfXkFC5jFwPBRaNr0E3VFzQ0y8nuZum+qTbtSVodOz7s
         EUWJQGc2aZttD9MmCEKR5WUmXgNW88yJdHSQHO2Q0kd1jZKzfvrL4LHqBhEEgRkG75zC
         bZ4edVIte6ee4zBIDibknoORQmZ2R2BIy2irgABosj6PQEOXV3cxTH9mAqFLzuxmET+i
         8TMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997147; x=1778601947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jr+WQFKJTcHJZ0sRMLiTHOm1qsMvrLUcWME2L+LwpFY=;
        b=fqZXk6MFpbnPTYN0lbb6GU672xlYSRNVPvfs4CvZuINL58VKz/Z9jVAz5/I8ZmRhnx
         PkrzeBjCEdDHZNhZMNQJUe8TvqF2GiUfTV0To3p8WAQ4GEtwGL/8azPPwuUhWt3JNLHc
         kKDW0Q1Le2RdFFY5UZsZ26punxgcYrU6hJRcLoH91SkzqMNes4FYUVZBXZyNn2Eb0Yj8
         2afs80Gj+Fy2YQcDWca6E/zg2jU5B/PmEcLjCdlfQIpnoMji3gaZIGPnEl8cquS50kZk
         S84xp+b82tmMQfXdYbCjohXxL1z3r9VbqY0ci155d90q+O6ZQ6yEPTdDHHEI1zIZMp1T
         Ujhg==
X-Forwarded-Encrypted: i=1; AFNElJ8zS4sHx49RqC9mCY7bzfqqrHFMAooZL8tB8SMQdGooSfCIMCY0ECykE3iO6LMAyTyghVdjtOe9Tj3/wFzncWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK6Xsp97si8YliKIlUwjD5UpIF8wokWc2HNtNnAD/uOtQVuwFt
	+wMEUuVir9BEF8Wb6UcAVUzO0GafYrW9P9MmH9EagPV4YC+M6AIg2pYo0H98+LNpglqOxdO0fHJ
	ev2WWVMUVz+kN9gE5NXCFe1kTq9VDe5PRNiLXe6Ca
X-Gm-Gg: AeBDieu7l9FRQN19b6MRfTkMKuTQqEGzlJD4YZcv62QqhLZkYdLgMVQZOiaEU2n/iDO
	5m5VvdPDi6hnTcIyrmO3kJrMo9WNVnO6gS0Yb7UQpWEAXD1Ps+NwRKyYL2v2QymqUWZukfsHFrC
	qOZFCW8kYbXTS6+lBjjgOWs7TbhX4MlcNqjSjTiJYBtcOKHBdFbZ2YwfH5frHnSNkwY+ZkRqT9M
	38M8mUxNhma85IDTS3BcS1vcKoQmLbhuRr5bWmI6CE5khhLH9qu/izrQUtlXeTGeuvSMDikvA2j
	Qv+jhfScubNOUsRgcgP0W63wmbcOczc8tUjkLygz
X-Received: by 2002:a05:7022:6628:b0:12d:b214:7dbc with SMTP id
 a92af1059eb24-12dfd7da15bmr7713863c88.7.1777997146733; Tue, 05 May 2026
 09:05:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0-v1-dc5fa250ca1d+3213-mlx5st_jgg@nvidia.com> <7-v1-dc5fa250ca1d+3213-mlx5st_jgg@nvidia.com>
 <afkH3pMJKkIbElhI@google.com> <afoSQWreOWDIfVxZ@nvidia.com>
In-Reply-To: <afoSQWreOWDIfVxZ@nvidia.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 5 May 2026 09:05:19 -0700
X-Gm-Features: AVHnY4I9kiI4Q1jkqtdnHvyGsFiT-Xosh4J8OR2OjxYfYINDrozPSiggYWTK0ps
Message-ID: <CALzav=c2r5cBSpgnG6-Njc3sGrrtt-weFXo1pRUL862SdK7w=A@mail.gmail.com>
Subject: Re: [PATCH 07/11] vfio: selftests: Allow drivers to specify required
 region size
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>, netdev@vger.kernel.org, 
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 8:52=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wro=
te:
>
> On Mon, May 04, 2026 at 08:55:58PM +0000, David Matlack wrote:
> > On 2026-04-30 09:08 PM, Jason Gunthorpe wrote:
> > > Add a region_size field to struct vfio_pci_driver_ops so drivers can
> > > declare how much DMA-mapped region they need. The mlx5 driver will
> > > need ~18MB for firmware pages. Existing drivers leave region_size as
> > > 0 and get the current default of SZ_2M.
> >
> > I would like to get rid of the magic SZ_2M to make it easier for other
> > tests to use the driver framework. Can you make this commit update all
> > the drivers to set region_size? They can all use the same approach:
> >
> >   struct vfio_pci_driver_ops foo_driver =3D {
> >           ...
> >           .region_size =3D roundup_pow_of_two(sizeof(struct foo)),
> >           ...
> >   };
>
> Sure, lets put the roundup in the core code?

Sounds good.
