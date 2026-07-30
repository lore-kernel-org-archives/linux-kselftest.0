Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7CC374A1D
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 19:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785439248; cv=pass; b=qMH/xoh7jwQbABzqJypBYpJ4e69Ux610dfYKMzD6ed/wUFfCh9RsdgZq6Am7bTtvqzSVLOnDBzbqwRjBa16Bhw3h4OKsqROMfbVMc8Mb5otYU4v978yG9dlAC/qc3M2A+K5AMXgzyyXZjsBaJWdi5wkgG2mRZ1Yy74UC1Nr7ogA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785439248; c=relaxed/simple;
	bh=58eYfMbzu92A8gHSvIqn8/if0VUB60afiVKmAys8ODY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XYfCmqak8gbHQFNoYy+gUh6Fq4WOOqPBav3kLTwNRcBWCiEZ0FlRg+X9gBBuMbdTBoQrXPig/5ZnHGrSFrNFcdv3JryYtjRxAtq67XfneJF3bbumUTXweE369w63uNY1P+JVhVqGERu63L6JTymBrgO7qgVHbZ9fcrbQ/ybonXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PBQAcD5R; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PBQAcD5R"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so159573a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 12:20:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785439243; cv=none;
        d=google.com; s=arc-20260327;
        b=EUBwzT6W33oAYEEGVOaxZ88GaF8Gh1Teb3ZKFmPs1Hby5t4dm36wdMjHTilpkR8vkR
         fkckDmtwq4Xt41SyHiGMDtnybtfbkcMmANw5w6m90F/ctTjUUwe7VbdkL04tj44UcJwL
         loaSnGovtdzE8nfYuzGnckFldk8GlitRpKnC1M6RTYENAkzvzkbDVmM90eaz7JbOFzbm
         VcqYQpJgxbe7UhZi/ezhK1VKxkeEVIC9jnVaVIuJc0VUgImiGsghYWsjzIF+3Ye0Oyyv
         cNR322iNnJVp/37XnR/4bxWg3jeALUh9neqNSGqNmLl7QU1tAgUvv3OKJ2Mh+8L3h/qn
         /f0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=58eYfMbzu92A8gHSvIqn8/if0VUB60afiVKmAys8ODY=;
        fh=SHge4xC+ftGs6Balnbiul1LMvG4X/O8yTBuvJHEL3PY=;
        b=eMUHNB41u6aOBEKbiq3/NpeVQQBdxuQ3IU4TN6kEA821s65oNeRQ1H1Q2ywF1Qw27S
         e6F5tnV9QqK3jfE5ZfvZkAwwkQ+uc2OEru/rIuIOUzLgtehmnT0WfxN+72AUsZ6zOQ8h
         bLVWBsj4gghlmeS8DGkwNCzWGVydSQ0G3yqiGj3jVQdFyDmgO4duF5nrUy92UV9+fQ0G
         RIn7e4w1eICmkIaMw/80hZONIoUVMyvq5/HYNXUShg7WFA13Jkz4HiA9m5Zl7E9XlYhc
         5vynlnQx/MsBui3AcmvodqidDgnNDPD78D6ig78tDMf02cDGX5OD2k/HJULeXExqnmxN
         4qjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785439243; x=1786044043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=58eYfMbzu92A8gHSvIqn8/if0VUB60afiVKmAys8ODY=;
        b=PBQAcD5R0P9yjeC1TTiOvhfrQWGJjHYd5wA91xi86m9whld6lMmiBH7rMzjlVLtli5
         PIkOmZtREAuK+Ad691Ycew9oqe49I1pUVfFuTzqWvxUIylKxIJdVeTIpXd1KT1HGC1oc
         DGVk5CnW2wFe7e+g62nabQheX0zL3677XaqA6AU736BhMrtxTRB7MkP74rlFIMu7wu/l
         kxLVK8stO1e6mOcmlFEXtN5QBCQ1ra7922uZtKiRBL+0Tvt0CzwBeR/pa8pHQd1UaCJq
         EaUih+byxSgRjuq9Qi/JEdCMHdTo/beNtAijxczFIdUU/598al45g2xtxEvB5BAEfWqE
         vkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439243; x=1786044043;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58eYfMbzu92A8gHSvIqn8/if0VUB60afiVKmAys8ODY=;
        b=fnxjthdZriSxZ9GydTJdyl2icahwl/cxMIA3IQltOWCQHS3EcUJXyoi87hf75N+h0B
         Csbi2pB7la78odDfu0xsDd8/9n7sUiHhBTiAMkyweoXjYvFCdMuBxWDeH7xFMgaF2gve
         ZZGqPjix2BGL2fZmZt4AZlGVUnHWX4KyacpCf/VlyYbkPBfyPrg2g+TnYiERXT+Tgxfi
         CQRQzjC7dYKD9if5PFnz/bqBoSYWObJOc+IiIxUNFN/h18x5MWADmOodzHMp8p4X2LBs
         e19HvZud5JKbfg5yGEb2+5PB43eQAPzMXVln/JARyqKtrJ5iAsJpGS0HChnT+NE7D5yu
         L4oA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5C+LELyNuhVk8PmWBg4lfzqywNOCfuOEDCIVZNHKYOKBkNZwhccVSVQCgn7/9ZymYKND38RD4xUN1A3gVc/U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ALek2Ul387NQqrzdpxKcKskFgOtw4PzTlahd9R/ZRLr9PPp2
	kW9JtWpznAU3gDvSsdEgz10hSOWx4RQ9gQR+o5K0uDED7duGVcAtgxvNTWQtb2YX/3wv/VsU4JC
	ekoIJLkZozp3dc4XrmypsCcfsM/n3li4SXYvCwMM=
X-Gm-Gg: AR+sD11paxWa4pafUE152gfXff7z7RZxpfI77SnnY5F8hEkZEoAe2iXUX99sj84Ee9/
	bZ0Jt/BgfN9v/DGukgsrjfdZfRiPr57iohpG31MnxIJl8chyz9O9iwJ/eQLFsaw2O7E4K+kRRLC
	gHklU//pllV6UWxzuevKxnGnuqou4k5UBs7GlVBCRCdDvr2OINEOUBBOna4riZVeKPuHFx6tFEB
	/yj5SBxoNS3W8ACEkHo9M14NC3/RAH43M/tfZ+znAK3KjFNFcbt9vwu0EsqHMgtO/yzBMlJ9TyN
	dAIf6SBXjZ56x3Rkv4N9L3dk/tnglVcGTOL8tgEBBwVqup1nbpln/sHBD6pQWStsw5j9HHuGEt9
	byi2QSeFCkdoyq6zZkiI2CKccvSJjPzqEIc1i7aLtjvrcafO+ePuHbypGuS/JvpqXO5aqcMyD
X-Received: by 2002:a05:6a21:7703:b0:3c3:a3fd:db0a with SMTP id
 adf61e73a8af0-3c90d421e37mr1474237637.16.1785439242767; Thu, 30 Jul 2026
 12:20:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de> <20260730-auxclock-nanosleep-prep-v1-9-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-9-cd8b61229a7c@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 30 Jul 2026 12:20:31 -0700
X-Gm-Features: AUfX_mylAH6zzVZ_Vt8lEHR8AVO-ro7aAc6pkl4dBiSufdIDkmIT0zaRV7TTzBA
Message-ID: <CANDhNCp=aOtw2e3i-XeMbHy8oGfnZ9Waw_n=0Q1Kc_9CbQAF0Q@mail.gmail.com>
Subject: Re: [PATCH 09/16] selftests: timers: nanosleep: Explicitly list the
 tested clocks
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
> The test relies on the numeric values of the clockids.
> As not all clocks are meant to be tested, this requires skipping some
> clocks unconditionally, cluttering the result.

My only nit here is that there are some clocks the previous code
explicitly skips (_CPUTIME_IDs), and others that are skipped as they
just don't support nanosleep (the _RAW and _COARSE ids) and return the
proper error.

It might be helpful to clarify in the commit message this distinction
so its clear this commit isn't just forgetting the _RAW and _COARSE
ids.


> Use an equivalent, explicit list instead.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh (Schneider Electric) <thomas.weisssc=
huh@linutronix.de>

Otherwise,
Acked-by: John Stultz <jstultz@google.com>

thanks
-john
