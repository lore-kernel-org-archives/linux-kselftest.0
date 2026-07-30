Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692B630F95C
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 19:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785438664; cv=pass; b=qzCQdE4au3FVwQGSG3hnkRJVlX+yxpepQkWeaH+GVn86k3VYBpHK5EvVrTIULZnSsTopAHnRSjV30ENN20PJEYoP/BjSaaFm9DFzhJAnsKGkIZNzp2K3SY5gQd1D+j05UC82dLxSYumBygd3WMWf336JjaSyAkgr+B7UDk0SFOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785438664; c=relaxed/simple;
	bh=thPqRt8Tz6ILcI3STsIEtGpeauozn0dVazkd26mM3CA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uj6QwCSOY7qUG3K6RetFnDM+zMkcgCLTrHKtGjfG4WiPg6CSl9NVCE+i8d6Wcg6TJMHjMCRenEwnbbM3DCJtccba65eN5pAEsEMkUpPHZmfq5lLqDZmBvf0sFZjc8VcTnWJ4jBlBFsVajBYzywjKpO+B2Lgjzf6iUAJy1dpzDOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rrA3gBmF; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rrA3gBmF"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso83670a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 12:11:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785438663; cv=none;
        d=google.com; s=arc-20260327;
        b=e7rDV93VPlgNFwo70yZkbBGDPtMZTi6SYejSDIKSUHxXV7iB3x9dnrVLAgpbGBywhr
         rj9uSKWKZTGLZGFf4yFr8Moi6PNIvkv5wJ7zCOhTWtHUosogGnl5BIUlzCoy0REqRtOe
         yoq0JZ2nhf59XvPOsLEn3jqi1gfcCWTrqopHaC7QnFtbOttPt4PDypL2m48mgCHqfLZB
         FnGpB03FCvUI9AT5xFajErtHke1jdgFki/gZvTGbdwUK67cqcCdKu2w7KG24VwnrReyH
         Epiu50IPVRRB092CnSKI5oO4iU+ys58eZP2PqgXvsmOP3t7K/GSSc8ynjjWpo8nSQdmn
         QXYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=thPqRt8Tz6ILcI3STsIEtGpeauozn0dVazkd26mM3CA=;
        fh=II6ctn/duDMOavQ7UFPpnsBFfwZX2yv9n1ET4PEokv8=;
        b=XO0Cd19v+2zkJM95SfvVLYRwY2PTomVUkCxqmmfgkLO//2YCVQYKK/0jf+UkOxLFgp
         QLQunqrtjwLZgASG/w0u3baERtb7VHQ1XtCpmHqYeybkBPW4eqSemewBLZtfwOUDQIi1
         P8cqES5XXM5+rRaCi8ukQoOwgbfFFd6t1kS+pFRQ7553IBp/EQVmootzwTDhzpxeoATE
         SSveBMRihLaNuNQVkAXCIrovq9BhlItfL0tIztWBCHcpt1IqIpOoU1s/bXfHC62gz6lz
         roYAhvK8LGVesYBZFHraI6H3PzZtLoNokS1xRtdNB++FSNBDT1RWqBKPygYYKJrWSHnY
         PXOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785438663; x=1786043463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=thPqRt8Tz6ILcI3STsIEtGpeauozn0dVazkd26mM3CA=;
        b=rrA3gBmFB+SSJ304e6m7dA9scw6N78mwoOqD+MTvLAoQSzd5Ci7D09tMLhKhZ33AZH
         MW47OJ5ew1EXiQA/2bCHgJa0xPtHgRZXhm4bhU9WPKbvvr2xvSW3YwL28mKb25gipHdJ
         yHkHFQVtdA70xUFUUtuJIxwKwxPnKzw51ag1Kg1LmAc2VqcQVa+lWffgJ7unKsvwu0RI
         TwtNZaaN8u/kiW+C4hrQCxCbDHsRk+OpCWi2TBBPkcAPAewUgaHmbLs2Z4y3z911oMPO
         gWePHmDFW3TwE0qpnyKb6tX31Lbl5csFpGAcRNDApnXz1g9tpY+ZLnt0Xt4CkUrTXzN0
         2RMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785438663; x=1786043463;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thPqRt8Tz6ILcI3STsIEtGpeauozn0dVazkd26mM3CA=;
        b=c7Jx+swPM0QvgRM/Js08kT0taCCQ/A26k8wL7o+x6anMOZ4acXkdP/M+i4/GL9/e2X
         9r6UzyGf/cYAmAaJQP8YolUvZEextMq9n2uAD6bQ88/0yDB90Jqh7lthPhaq6js3HWZj
         9vaiuOFG4v+50VDBXvDd39Swk+AENd+aW5jb+DZdftI0LRzdvQcmvPL+cKwoNhHHqwBp
         eNYYVUKiUB6G03DisD6yKT70l1HdT8E24GI/V0lVJjWCPnY0j1gzyd5+k+ufNY/3TrNp
         TU1ov1DbJOEkQdZ5nH+8paQ55pPiiKMH0UeIcXansHDlJzBzxYYe6f24iiJuU1L1jShD
         Bbug==
X-Forwarded-Encrypted: i=1; AHgh+Rom1mrvSpXrYKc+ktdmNg1Qz6A7Gzy35P0sffZsw8e+bhaggPzzzYb0q64kC8KvRE8RbDR/6thM2Iev5d9fLik=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1DTSYlwQEWRY+2qfMXBgmH1+yK9Lt/k+fVcfQopopOC92/ZEi
	d74Ve3HpWIV9i2LcWPGBbDaVDxqmgq+9GUCQF4esCchiZYlAJlQb37RwxcuKvx6oJsj+NtGjyJh
	1aQ8NoEWwndRn9M5pcGe0enxb1WaVjdXAFAs+pg8=
X-Gm-Gg: AR+sD11DscMfDQMc0ZGP7cmNvuRSCNsCDdFn7bsuSIfdP3lw16OAiYEpP4VazuWLrQC
	KhIwKT/G2SGPNZ+dYZmGBnSXZPwivWuCopDC4Q0iaZgPuR3lsIat8pEXfvfZNAVZtuDUyv7c1g/
	9Om512oIFCFygz849iJdp6MHmtv1cgI8DkEoI9PTTr96dokMMvVTm8YdFZ/llu21REVddsCwljl
	5v1o/KFP7Hf713Q0oOho3xgDkizuPNkM+RpDJqC6L+8wWpebWip03/0SFdpNx6yOK96jEmWJiEb
	CxY/Dt4gEQ+RVLj61PHN3PhsoFTVYulasqKbWyM1Q3r4fQQTdvOyuJ1gjrEfVOeJaamctObarRS
	hY3sNoY25duvRIyqoHxFai8GXqWDqvPp3Z1iP/faxKO8geIEyBfG4EKK1aoqzpLL7fHMGA4DC
X-Received: by 2002:a05:6a21:7113:b0:3c0:9c19:65a0 with SMTP id
 adf61e73a8af0-3c900a15de0mr3282153637.72.1785438662029; Thu, 30 Jul 2026
 12:11:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de> <20260730-auxclock-nanosleep-prep-v1-7-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-7-cd8b61229a7c@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 30 Jul 2026 12:10:50 -0700
X-Gm-Features: AUfX_my2sXuXO-Vy40d9vvXLNyloxamvIy6W3wA62QMXxFP8B3tNYzgTClRPBmE
Message-ID: <CANDhNCrhhsAo0V7k1fS0P2Cx_5xyCOciSjj=ctvY7O+2RMpkfA@mail.gmail.com>
Subject: Re: [PATCH 07/16] selftests: timers: Use clock_name() and constants
 from clock-helpers.h
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
> Replace the many repetitions of custom clockid_t to string translation
> with the clock_name() helper from clock-helpers.h.
> Also drop the custom ?SEC_PER_?SEC definitions.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh (Schneider Electric) <thomas.weisssc=
huh@linutronix.de>

Acked-by: John Stultz <jstultz@google.com>
