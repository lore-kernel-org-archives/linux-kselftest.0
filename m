Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E6A3BCD2A
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 19:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785439495; cv=pass; b=XONezBDRSh0lkM8pmOpGpN25fr6x1h662fsnTMeGfba850gYfnhubqvRZsmzvl+JRKOYY0HSbHuRlmzJJSudWOzrnZAEWVil37ia2bp6bjurBZQzTFyx/GqO2LaCUps1hwvjXD5LEz2uHxmjkEbiuux2k4oqksj/96VqwctCdPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785439495; c=relaxed/simple;
	bh=qGCwWekkbKVRAE16HHBDDGNLZ3QC59KlU6bNJrMwTbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1loqPbYEB31tmX4fqKBPWA2NlUbUG7QfolqQRjCQud+aXVGY7vNvZ+MYqpFrfA0Etvexk4jRMZD64HeaAoE4wLrkKDXNBj8dRHG+E80djmq21LOenYymASrsNJDToIdOgZZdvNXcBczCwZVxQOO+9ZLuGiAr2KWe748SOiCRvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i2Vt7r7N; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i2Vt7r7N"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38759bcd877so247093a91.2
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 12:24:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785439493; cv=none;
        d=google.com; s=arc-20260327;
        b=dRMF4BTujmZZroreZgHsSnSkAlzg2J4soy0hVIDalAhSmfv1Btr3D1N4e2hTUp9A2Z
         KqTQJfoQd8MfCy4ex/O4JBnNJrY/zrT9ntzS55qKYZkdIQb3dsQY470aOx8Di6rfdLYZ
         M0vCOziuvHH52RV7lldtGCiVYS+rgJIo5fdhj3dOra1VkfsxTQA3wzQmWWf0PJ6Ll5uk
         MDFnaJZTR5BDZmGPBrtDevxiDpEI95zp4tgNh3q76WGqd1f7Ip+9fyfGvPHt2CKrWrs3
         zSG8kfd0heU5W2qEG6NSpxgVEQwFiNrBQpnGvrIRiLLlN/V+9Hg8OV1AO96B6XrzJ8T3
         HZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qGCwWekkbKVRAE16HHBDDGNLZ3QC59KlU6bNJrMwTbY=;
        fh=cLsEen/NQp3zV6GOq/vFMSdimmVDrY/z1ndtKNHsOHU=;
        b=G3YZtgEdyIEJpZAipmvPeNpOumM1CxZU86TkHdadTSzgGac9yEjTWBP4WOtCynCLA0
         93vdDwTVILQ39eH4umDTMRkTAFi4pmkboXr4xWriGy7/bVew6paerRG8dBAfY07c//IH
         hkoYYLKHEkbwsL/9HkYN5MtODHh2gTCWG+t/cggBMbt27hnoo9La++7F6Gpuc+yQVR+3
         ei2fFBqZSXtovgye8QoOk4l1NtSVxEMUgAbBRyqoKVYnwkiQiXifnwbX4j+Psnia/GxK
         hA0xCgzT7OWJW8XpAAK0/fNQj9ovUaSA5HEgRWdCX6gDxsLAXYx2E+0QTLydTCn+6k75
         sLIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785439493; x=1786044293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qGCwWekkbKVRAE16HHBDDGNLZ3QC59KlU6bNJrMwTbY=;
        b=i2Vt7r7NFyqUfFeQmtNGdveBTP9e/9XpRF8DsrfjIWKwQE8k+kiG6maqA61l9crfK/
         wuk5PcIwg9LBfchAbarU2kXuPAZ5H87KJ8zzxojs6kN+wn9IOrOaZuB2bM0VjXT4FX0m
         8Gk/E/2TdND5lUfQeEAJg/HybOqgXDoFKVcgpV447hPzIzpuOpqqXJvh3IDruSsRxgAc
         goBvDsRPotmbFWs5AeMNJi2UxDITWdNP1hEfMyOI0dKJn9m4ZMp4hCAHVvQEvhLseqsk
         o6KFt7wn4MF5w2N4CzXvDkGNZRDst4Zud5lkXfRiPGFf8jKKSObG5ROINUWZZjkrjW3Y
         vmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439493; x=1786044293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGCwWekkbKVRAE16HHBDDGNLZ3QC59KlU6bNJrMwTbY=;
        b=niTn0KGMR3MpiANwYRHY8szbFglCSQzJesrZao+7s98Q51T8APJ0TRCYihtywEC/WC
         xkV+25ZfBHnphLBoqMfj9mG5q5XaUhj8/oqBsKSrZWniPyyszU6BQ6HB22zTtJxZJUHy
         WhNQS7b5+SSfPI1ERfHASsTcChhaNltmrz3BjFK6Uv1I4TA3xzKRL5cjGUM+PyMp04Sg
         HlsXdyjHesju0FWgUwU4F6fWBFzjJaQIqXw5Z3b4vLCnamFrKUgmKCJhW8330YNxba+u
         EciPpBBxpQlyrMvFPbSFo89ljLcro7xdz6+I7fQEQu+4hWtygJjOEI8Wx6zcYTa9gAkA
         aSTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3QXjEveN6XS0vIrbkuHJYBRYIrlXq41YBope7oJs8/WqFqLrtcnuy0u4i4AM8109+Uq0p9ACRBQryUCkoj10=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhBHe0KouLKZ0Z2bi5iU1SvnxrzAVEkMGSVtx3LunXqXmoMbw4
	u4vN8rZExs0dF/PnEUjE7cEG+5++rIADHef/KFahOFS/VNDnk+EbdrD9iByn5XHCQ2ZrUdQwSNV
	qm2HsIWCoZQcQIwTgkvBF6SV29K46y9j/6IVEp8U=
X-Gm-Gg: AR+sD12veqkS0YC60LcbbMeJE92IP+ueRWLMGcSgVPxNyy5VHezryBYPxn/SlqAuQPv
	0n4I0eSvPdHDZkmqySk+3nb7QEG7KR76+oFUZ0WfoJ7g29y0GF3QzsYiwUzQo3brnfgaRhm5Mdq
	WHsuzLiJscOYinOTDbeS5ZjcExtcihZUX1JkrBBI3G2wy5dZbJvVp7s/4n3EzZTqF0ojfTnaPa7
	JVeeaj3goJ6WoEesoy62/2eSHbE6xDYRSxifNEpTlAuM8l9kZVJI9nB8zuiRtOB6NyK80WaTj5H
	J5L1+UyWNS1ODEDS6XHbzIobipJDc+Ir10p4IVoEpviVzBgtk2tDAZs13HYvlL/iPINvqgPgjNv
	SZRQXJzvQeZKV3GZcIgQnINI0MZrs8+AinDoFYcSN6lfjvWXPwrIymBeRNQxbgQufihnEVoTV
X-Received: by 2002:a17:90b:1b45:b0:37f:be6c:f3f2 with SMTP id
 98e67ed59e1d1-38f9be2b44dmr3162247a91.2.1785439492812; Thu, 30 Jul 2026
 12:24:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de> <20260730-auxclock-nanosleep-prep-v1-11-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-11-cd8b61229a7c@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 30 Jul 2026 12:24:40 -0700
X-Gm-Features: AUfX_mxVlosGecKuHtjsDqQBYVphwYSYcbuRp_ZGCYJJ3EyLOia6bU_MUWIAJUc
Message-ID: <CANDhNCrdXvgGhta47mkXPsXdRh_yQ9BdLrDpD7+Q8Dq=R4Ljdg@mail.gmail.com>
Subject: Re: [PATCH 11/16] selftests: timers: nanosleep: Move all single clock
 tests out of the loop in main()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 11:47=E2=80=AFPM Thomas Wei=C3=9Fschuh (Schneider E=
lectric)
<thomas.weissschuh@linutronix.de> wrote:
>
> Make the code easier to read by avoiding a goto.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh (Schneider Electric) <thomas.weisssc=
huh@linutronix.de>

Acked-by: John Stultz <jstultz@google.com>
