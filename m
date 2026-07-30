Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153953B47F7
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 19:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785439703; cv=pass; b=Yo6CdnrNkSDE1/Onijt4G5aSax9h2B0+0Zbb9dy5juCcwIRwTluEqV4hiRFI25rXs7+3h9OyXycyhUI+KxGPdpZnx0mx30TbHGXciwrqZ5OMb6EGY1zze11Tku9hmxUCRQpYsliDXRXT2HK/4ftew4F4v2wcffm1MdHnRp3ww24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785439703; c=relaxed/simple;
	bh=3ZBD1SHqtJlcKiLC2CSiGiZMmgrFZSIydhySgUYciZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MjNxj2X3rroKHkfe0N4XV4V1WrqBLUbhlwsQLPSfXLG5/HODep7T1+d+8WYyQ+OvAhaLjyXNdF6mXtWni5XS+2CV0nRqy/FGGYldPapeSMSPp8PfJfoP17UtkBWutdzeszpoCiI8xW4ygNgNtv5/nVbrAj6cZXJtR7iqNLy6ZGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V3IJiCUG; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V3IJiCUG"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso48659a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 12:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785439692; cv=none;
        d=google.com; s=arc-20260327;
        b=JoIMpkQLNj16EN2ZPTViBKPHCe8HdXSsw8n6CFkUAvQZ1rV/s+yNxf+R0vlFe1Wmre
         GspEBG42mlCAbKixPyR6ubdq5r+KMRQsPaqLTF+UiFsOV857b16GG/ui5+qX266u5DIf
         Xey3Q35hDdu17ZBoG77XOoHd6fUwqJbrgsy6uC+eJ1YU7HjWBVaemjGf+iMs1Gs28kXl
         6TBo0hjGXAcVr8ebjG+lsRVYKvXZFGVNhILhUnehez6D4Vd4cN5dqlEBeNgFSIrLyIA+
         TF4DzzOhLhR3OxO9RSV0coTpJQ+WkIlPcRILJbQhJM4v0lycKfmyIFwVik/VkxkNLz71
         coGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3ZBD1SHqtJlcKiLC2CSiGiZMmgrFZSIydhySgUYciZs=;
        fh=OAlcluE8mpcJYrpH6jQDGwiKf2OTSU09O+SBQ0Eqmg4=;
        b=MKxpS4tpYW+9r/8fgL/PzxZ1pUyv9qe50tkr9kuDx8W2bny/Ow+M/EF7AV+v009Izm
         YIzc/YkU1U3rqafxUqq98ethatEzii3RcdxrgNWbyCyD5P+mTfl+VkrjPgMLQR/KTR8m
         0Sw5gUa95AQDwGx0gV996rEvPZjc0S1cbu9/FaMpx3t+bAg8cIbJqiYTJnTnpxT5wfAs
         W7lK1DoDQ2OG/A+3GzkUh5vecq+7VcVReV2jDysGRNKUJXrlI+jL94Aqq/v7KDR+kJao
         EYbV8IqvtimppgdtmOL483aRPWoZOAN/nYiilFj5g9xlnKZwyPiN2XBAsHZVcH1tiGfC
         eq/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785439692; x=1786044492; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3ZBD1SHqtJlcKiLC2CSiGiZMmgrFZSIydhySgUYciZs=;
        b=V3IJiCUGImugf5FGgIM5/UKgupy2E5/hEgIyLtjrKwgCiG0qsTvRWY6XasquI/SvXu
         SfhZ6HwnwcTIYMQzXB0q19dYnBhvHi8ZeLz6b/76Bvwidl9UUU1smYr/2v+My7g9tEOd
         76FiH809xmjKB8xqjOCZiJzetbqKpvIBFmqAl2UMOHvPcYGJsvTPUdrYf7Gf/8HEAzJ8
         HRdiL3G4+OASuAImasdVjm92LCGwxnr851k1Kq/DVGeDtOYuEQuZAUJFSygV/P2lgfUo
         GE7Nt8fZfJLYh50Lx2DzxljgsS2ecnKpAx1srKWWXIE9NaSrF89k/A+vOStU8zmCqpXR
         lc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439692; x=1786044492;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ZBD1SHqtJlcKiLC2CSiGiZMmgrFZSIydhySgUYciZs=;
        b=tWF4CRubKP4DFxhbnZj/VyTlzrskYe1R1Vk7dKk2JmGwLcqNjixf/nuCH3d87oQ56U
         Hp7QDMCDoz6gbYCtsGhZcM92h+a1ZZkI1G/RQTwv/V5tOQl4HrLfR/HPczwGioBIX+47
         1ElM2ZGjWdbv0z1BLksMA0Z57FSLOf24xoJqIaqZpWO4EX/HcwuDc003rHrC+rjg+ChM
         nIbGm3wMWHUY/zVqY1gv3k40JvbVHvdeL5/sxqpHn2SyLfqImYGCl1YroI5PKRzAssMj
         UArOkYmqbDY9kLzRps75gmOXKfVcCZgxiEB1lCn0frQb6ISUKvP2BbM1ZGj668XzZe43
         1dZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7LYgDZDgQ1bPjSMLA/oPZi1jYmZ3eSHU7c29OsiWRllXeZ5IPu40AoQ3mjjmxM/PqM4UUOFt4m3dkVAmYJmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdVs/bDhUqq9kKfJ/ZWVoAsoC0R7DENCEEvX2J4ABaihhH8p8v
	4sRlT6pFBuAxTTZgnsIOaewvfKovbLjzwbN9CVMtss0mdrRILdHVQf+m4eA87fhRy1TpR4YcKF6
	0lMppfBVY1iV2uyDvEQ7CE8kgIUs9STOHdUENlX8KRq5WybupmRrVC/o=
X-Gm-Gg: AR+sD11/y8Uvor1GH7Dyw2MuORQDF5KujUBP5iedCpCFc1xK7Yyel/8FHYk3JmD7sGR
	La/0yUzJegA+sWNybisKbyN6mX6i3y3Mmnej34096X8ra54TsMpI/TZoiwHHQXvrU4t8NHtTobT
	9Lary7BVcLW0qJrFOVQEGxtLEYE/2sxVw9rOGlXWQZvO9BbcPJkOy9ijiEBbt3Ec3XQERndSRN1
	pyD3l9pmy0hfN9gT0UV45WxPy8tUavFPOywhiF64W7uLT8T5KjYgVlC6XK9Pbb39rqn0npnjMHh
	NXFS3WQVWE2cDJb2Ce0UQc/pr6yGsTO+lAr7Y+c1umueEKJeNW/++Fw4U+wghN+uZcob2i247Ye
	Rs/cGY9WYcOR8cS8NsmOMJHpuLkDdxBTOxlc/hsAa6/RfrA/YGYyO/RgVqT1ZOAmT1T78CbFZ
X-Received: by 2002:a17:90b:4e84:b0:380:8bb9:aba9 with SMTP id
 98e67ed59e1d1-38fa684ffd0mr1508855a91.3.1785439691603; Thu, 30 Jul 2026
 12:28:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de> <20260730-auxclock-nanosleep-prep-v1-15-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-15-cd8b61229a7c@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 30 Jul 2026 12:27:59 -0700
X-Gm-Features: AUfX_mwH0Ev7BTUO0-qPS1Q3-jbJorIt4fGJHhdKNnH3xDtKWLa2oH_Kc-fzAyU
Message-ID: <CANDhNCr5NfotB6NLLWHrK2Baixw5wd1=g1Kv6JLKi8FsC0wFkg@mail.gmail.com>
Subject: Re: [PATCH 15/16] selftests: timers: nsleep-lat: Reuse kselftest
 error numbers
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
> The test currently defines its own custom error numbers.
> These mirror the semantics from the standard KFST_* constants.
>
> To make the code easier to read, use the standard result constants.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh (Schneider Electric) <thomas.weisssc=
huh@linutronix.de>

Acked-by: John Stultz <jstultz@google.com>
