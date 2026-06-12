Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66902389100
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 22:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781303846; cv=pass; b=pJoKIzE3+SHwu4efeAfCahg9/Hri24oo/GLITo8fHo5P9KCU4adWyqUBrpV+V981HHYjWZBGin1WzzHz+4Moo4vdWY9MBIqyMmI7T8B0JN09nbQ3dWx9Ih5C73mgiC/JSO3p/2cDbWHxfgvQKyYxWRRixcglHG1co2HDeuXusu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781303846; c=relaxed/simple;
	bh=shUFY6eR6Kw5Jk/HnGXs1qKYsFlLO2yzvOdsRkuoJPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DCbVM3dLO2bWFzAzL94vz06+iTS/yfajor1UDJV5+x7AcHTXzdZ0n42fmg3Bt7H2zdbR3Cb8FymouJX8K9e31piMiYDVDTM9Cn0UDJBwguSktW7xIloM6jc8zyVoxT+U6vAkQN0OAKx/nWKkyqqD1u0pZY1OaspjY6izq5EJAhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b=TaShrjAj; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b="TaShrjAj"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa68cf03bfso1644050e87.0
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 15:37:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781303844; cv=none;
        d=google.com; s=arc-20240605;
        b=jX9Vdzs52xCl5cAkgmTJoEsEb1HJWaCsdXDAP3iN2sGP8WFQ3S9LpjvZtdHKcPAW+d
         kGPYat5Jvt63wTrqCPTZFACix/Mf+RBC4XjUyCHgL5FsqG3R1OkEWWZWdsVEHxYO75tS
         IwxLc/ceunbj3rZzOzGVZXQ9qqKVklvc0oH8IvMsVfdXFC65U/3P7MTJXqPo5jK4tvwh
         3ZFK0NUVDxfh1eQYWqUyk+sW6AKiGZvKTJR3a8Gn8mSa4x6OFX5p1a96lVRpCQwIvb64
         qPUr0q8v+g9tps7czpJ8j1E4fWLruT46axuevBfZOi2A9/RigpO9ef7Ac5XLiZG070iN
         NlZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qRDSVPYX4+J1umfJso5OGIHxT/OMTh7WFNoojXu+zAc=;
        fh=FiMPVKZDiAP52voPbMo5LTOgE30XJiIfGeQEdC3FMNo=;
        b=abWGc+VgpoanYDo4/MUc2Qgpola7SluNg6Omlriicp9ASqCQwAsF7XOeEqnt80k/iW
         MYsSYDbUCa2m7aPQk3t7R1HfLP9O0kYQGXHzwaDrEb6I0F5UJStZb/3/0lpaUlPgETAd
         1iiXgapYYp128Cb1uwb3TkbOSCIPkY+hFlREOoZCGYKGsyANV93Na9ShYFN+DVJKG7dx
         767miqLbgTjzYlHs8FyO8qipDNCwa6eINArVPygZNKtAchriKMjO9dvbBzaJMvPWeg+s
         +3F48RZy+ZCs06OgCrHyxa3TAPcVQT97j44vPEvgVKCUvaZSusCM4o6cTKKOMKLxi4zk
         3Wgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20251104.gappssmtp.com; s=20251104; t=1781303844; x=1781908644; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRDSVPYX4+J1umfJso5OGIHxT/OMTh7WFNoojXu+zAc=;
        b=TaShrjAjgi5eEEKjZwZIK9g8dYI3HAYovmptN2gJS7+AFEB2LY9o+uYTZij3Lu8iwk
         61FPviWA9esTk0MX67f7B1HcwKuc8Kj3gX8DXPLTDVP1BmT9QwBE3Mumw/Dv43vYUTfb
         lJzyHkLOjyWc0pEYGrk9aVQBFfa1kTNv3pKwQF3pFIwbLYWf2FA2npmu26a/FOMuxds0
         M9ORl4ESEikx53mGD9PSJy3JEm+TGPQ9+hPbhbnRNKzPJjv85RGiVhu/pPJ5r6mYwQ+y
         D4STn9oyv+CDFtVWVHN5JsQyBAa7sCAkoXV/ru+5EOeAVPa5pWf8dFaf3mCGqTyCamDB
         A19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781303844; x=1781908644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qRDSVPYX4+J1umfJso5OGIHxT/OMTh7WFNoojXu+zAc=;
        b=YxC5Tdv8Y9nUpggBiBXGKHoKgZNGMnZyHYqGXaADGG8qvUC1Kn/dUG74G0aYgUrK1p
         QZ3gVbl346+Uv5o+5CPGG6rVxHCYIAGa5HUbK+KyjzTocJ/TwnkcOgsLAskXJ8tc7hpK
         jEyip6nPOLHrOOYpgy07W6C12Woi0P8RN5mL60UpvsSVdXaulM2Fr1CNXvg5JbnsKv8h
         XYpDqkRBrFv4ODhEwbtYCFXDI8ySPqO5XI2LL/ifEPd27FQHXkTvDf5qkirHEQBnIuwn
         RCvJh0Is9qnIJED3lEeKus3B2WeJHJnVHDvNS1OqkhFDRN2pEwNfT+CjbBLvNoOxQNbT
         sD3Q==
X-Forwarded-Encrypted: i=1; AFNElJ97vChxFnZaNvnENflJPF0nAmRUjZoFWdtWX9JY4R19oDGJgjTWS6GpxycTdM1kB5BpmXi1B7cPbPrGVNiqVv0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6LafpBTgLUBR9kcEjwL8ET0/zxkyr5FYSjy0uX2bGHoOdB75S
	feZ7l10JgGp2ISH17om8VUlw9r1m9E/VotosBFqZKlB48HxULLax3N323Wu1UJRLErn/ar+i8vB
	pUMAoO7T+flc0ERLHf6JFqp9KhYzkHtx/Yzd3QS/D
X-Gm-Gg: Acq92OHJLK9Ksw+lvA8Qh794tKABgjESX1hJrj21WBkRS3mXRkHsXxXrkLWTep4qcZV
	HlCYM5eVs4iOpg8hTxFSYBXVEfQQRSYTsSDqeHCJ5m0fil41vDD+oyg5m+oEjBJGKgKUbB3HYwu
	yqbInGWbx3SFT4ruUb8s3G7BAVkQ1GavGPqvESKk5blyYo3d/Ick+W26x7Mzm29lQq0u1SOzNL/
	G/w4cwSy+isoTGVFJNA49cmf1ZhPDXxWkq3JQgQu/d02LKb+TSf9ZxnKiWsRkUZ4nz8kBoSeuot
	ASOV
X-Received: by 2002:ac2:596c:0:b0:5aa:6e3e:6772 with SMTP id
 2adb3069b0e04-5ad2db5c247mr1075245e87.29.1781303843459; Fri, 12 Jun 2026
 15:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-seccomp-combined-v1-0-304b1cc3ad24@hill-daniel.co.uk>
 <20260526-seccomp-combined-v1-1-304b1cc3ad24@hill-daniel.co.uk>
 <CAAFS_9HpxOgHn+qfzSpLjV4Mj_CURiwxFOaK9GO0DdBg8xgNYw@mail.gmail.com>
 <CALCETrUArQBzUS2mAhYxDS-unze_gnQ7efv1qeBke-ux=2KdkQ@mail.gmail.com> <CAO1UbGcJEhwtHcxy5zcc8cH=YjfSDiDa2o-o8o+LMbkmL7WFcQ@mail.gmail.com>
In-Reply-To: <CAO1UbGcJEhwtHcxy5zcc8cH=YjfSDiDa2o-o8o+LMbkmL7WFcQ@mail.gmail.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 12 Jun 2026 15:37:11 -0700
X-Gm-Features: AVVi8Ceyq6egGC6bWwlZ6FOzqJh71mRJI4TuVDzpkA7OZy5VNWaUOs1BEOkAoEI
Message-ID: <CALCETrXrAs5R_u-Y=1qCg2PvW=xx=hMZovBBv9UmKPkVCedv9Q@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] seccomp: Allow using `SECCOMP_MODE_STRICT`
 with `SECCOMP_MODE_FILTER`
To: clubby789 <clubby789@gmail.com>
Cc: Will Drewry <wad@chromium.org>, Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, Jamie Hill-Daniel <jamie@hill-daniel.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 3:02=E2=80=AFPM clubby789 <clubby789@gmail.com> wro=
te:
>
> On Fri, Jun 12, 2026 at 10:24=E2=80=AFPM Andy Lutomirski <luto@amacapital=
.net> wrote:
> >
> > I wonder if It would be reasonable to have the kernel do this on
> > behalf of the user program that's asking for STRICT.  The
> > implementation would probably be trivial.
>
> I experimented with this approach after the initial AI review, but it
> turned out surprisingly complex,
> requiring a decent amount of refactoring to allow installing
> kernel-resident programs.

Maybe so.  But there is a function bpf_prog_create (as opposed to
bpf_prog_create_from_user).

> The filter
> itself is also rather complex (mostly due to needing to account for
> BPF jump sizes, which differ
> as different configs (uprobe, uretprobe, SECCOMP_ARCH_COMPAT) have
> different logic., and I'd worry about
> keeping logic synced.

Perhaps you and your AI could elaborate?  What are these jump sizes?

In any case, I think the actual issue is that the STRICT filter's
failure case doesn't quite correspond to any of the FILTER actions.
So maybe it's too complex to be worthwhile.

--Andy
