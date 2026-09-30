Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159554DE707
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777648; cv=pass; b=rl5pLtbcF5l8w9E15VHl3r/v42UAybMq1p9UxRvtD41emdSR+mhr3bPTjb+qhw5oG3pjnmSsY+7y03lJHr8aKRbvTjSohM4WTr1k22p2IZIdrE5FwbtmSuYDR5Y/O8FWASWlaxVUZf54wUXGQItPudUxicvOrUAui7f/0OHJ6VM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777648; c=relaxed/simple;
	bh=ouiP/s84DTBB3CgCBBKgMRlCvmNQLtc3ruMbeozhkFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iVs31YParJcWvDoqxy0Bbel59A8ExU5srpk+xmBoyKoGuZ9ycGaNDMUbJAw8OTnzIKqz5QIqqYYNBJ+IWLIrIMimlwvfNTd78+lsVXBFxrRKv8kFtNTyseS1fCCR0IJ+dT93cwHSG+2ua3ldVQMJdw4mrgk6lah5xmJlqKVo67s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HU3JuVoh; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HU3JuVoh"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba390408cdso1496482e87.0
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 07:13:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790777623; cv=none;
        d=google.com; s=arc-20260327;
        b=B7Pska5enFcoytFo8Z6UwiW/KGm6qbSkPHLzBwno/z0q1H2ywHxNqUHI3J3lI4oZtu
         cVaPB3/2Vw8MGsp2eqjnRLM/3MvOnsmxdULFi6gRtMQiaccfDNLr4Yg2FybMSsksjkyG
         3mDXF3uGGzj72cEeEaa+TGvY7uvq2kiNLxwaX9FQgay2ZTGGOrOveO1yZT2OAvXkH5Fn
         +BCh4mPKXFsdu6bYrfrwFR2EnHCIXsJfetr/6yZOXfWfTA8hlMY//KrZSho64sHUaHtl
         x/yVgP/mMMSN59Hr2DCz5EeD3+FfwEm4vkQK/ATKbQHKQUT+KfQuyqBHpgY7wfbB3p1S
         8bpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ouiP/s84DTBB3CgCBBKgMRlCvmNQLtc3ruMbeozhkFE=;
        fh=orPeM/i+YZ1DG0dGZ3vjZX8NX2h6HJiHOJCoVL3jf8A=;
        b=A5CPL7LTPMnP+Ng59trrAsutLY3AS7msyo20feBcb3kXqxbwILUyDkLaYBADwyoiId
         zDlKneTZHPbcYh4mW6aMlCbhW4zkoCuf7t3v5Zn0Ra8GqrL4t9+TbcpvXAqN2s1JjBLz
         R/22lkGGzo10AxTMxm+aT+gju9eEZCxxo09fGpvih3tU56ah/8/lBaBf54VQKEphN79n
         pHJR0Z0aROLFxHIPxhRuHK9EFImO2zNXB6Fl+iVoFEwr57NV/RL6Lmk6Bv+k2Q/JQxw6
         xJBiGluDscqoYvwgomw2ODZIxbP/0QZapoVtBw3k/E+qqQnzXjWiuAdVdrT1JnrDbful
         8x9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790777623; x=1791382423; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouiP/s84DTBB3CgCBBKgMRlCvmNQLtc3ruMbeozhkFE=;
        b=HU3JuVohcapnkuT8TmF6+QOx52bOpVZAIps9S3IPbbRkpGnKxCBUKjQ5SbyfqArTOW
         C3tBoIfVqFT/Zgk16U6c8b5ZL0PdV+DKRu03OKT53E4v3wwsuH+s99FpvD05bMUSMQWK
         r1HS4HOk5yHhzYyqNRbXvHUzAKpAr76Jd+aOjvdcjzfvK+GogJC9lRbg5lmmEU5tWvcC
         4g5bKAZP/3taB8vETUKvANeLgTnSf7S3LuSfWVqbTR/3OlYDZ0+UGhkOoK5S1JGyXaVb
         gr4DU4amAbBsMRTFQcDr6truIB2LF7VRMohFAcHkSR8Cgbrdma5dDhj+HmILILEUiNCF
         FVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777623; x=1791382423;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ouiP/s84DTBB3CgCBBKgMRlCvmNQLtc3ruMbeozhkFE=;
        b=Zny3qftkKgiQY/+bXAnuhhH972tna+lj3ZqegcMut1pF0yhJVofPbq1EjYF+4nMX8i
         VZ1RVyn0IHOhsfwNpm+6jZwZgDc84dnbIGeVBYUV4rgWnawsNY2Ax9aUv/GY01SIfYWW
         +KVPT4Fm8XiS65WGUzjkaw9j+MmLvc2iaGqRt03MwPUPHobHcurRz4PsLGj7canMFMDL
         mwDBZBbJv44y4tFjgJfhIjd0ImYQaNix+8VhQ7FMwYU6b/LUvTe6uux3lqXGGNNR1INV
         TxIJh+X+UxEQjHqUiBSBmFiXK0cHgU0Qf74i/dePkzTk8c0M5cAWmdIZxQl0a4zAtp/j
         sBwg==
X-Forwarded-Encrypted: i=1; AKwUvBxEj6KM5fQ9YfUi3xJS4cqrSICReHK9SxTeVZHex0lhXzDNsfpPHFAC5ngj+jTOa+LIvGE/uWz6I6fZpie5EJ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7LuaGRnMfcGTugBvHcZj6T2UkvQAasStL0yreMqANuD5gtNUa
	2c49eQLiKD46MWCx9c7AyrG9yWQ839+dj1Qhw5Cz7oUH5/USv11gGqygQI0/Ag5IfhWVXgAwMyg
	mCT3mSmNClPM98cwdEzk7WIVR2I8dhEM=
X-Gm-Gg: AYBFou15oXBEDJPIwr4Tdz7SY+tw+XpxlRrYPugvPj6KtZwoXHzFbrjzYQHiD9JRU2Y
	ObAZLY50s5UlM8EHlKPhUhbC9r9CuUt7Fru+9fTU5uf/yDybaqEAIarVp7QVOj6xFefRAz5ybCm
	S7gNUlYaxSGLbb8g1qSMBx1k5JFnhYp7qo3b4rVcIRFvRN5C+9ILRrcs35SeLReOeA/XyWXdzwW
	DOp86gZxgnAmp5OJiZdW3s8S5RU37MlYt3KIr7RPDAOIcOf0elFdw3fxnOtP3TE+ji5el59bSc8
	KUT58kAKzpHG2QkgN69NNx8hUTSbgnrdSCF5NbhxfomAA/z2M06+Vl9FLAqq5+fGXJfodFoRWqb
	98U12em90ARHcOVtblvP9lhZ3lB4Eh/CZQ/am6XFg3Nxx
X-Received: by 2002:a05:6512:6884:10b0:5b8:f472:2e66 with SMTP id
 2adb3069b0e04-5ba405e9177mr509267e87.25.1790777623133; Wed, 30 Sep 2026
 07:13:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930112842.21323-1-sigefriedhyy@gmail.com>
 <20260930112842.21323-3-sigefriedhyy@gmail.com> <235a33c2-7138-4815-820d-793568757d95@6wind.com>
 <CA+7S2v+VaVYksOpuUKzo+DoWZ97M_XKvnMr8cCcgwTkrOxsvEw@mail.gmail.com> <7d8f1378-d5a6-4a87-82cd-98eb794f85f2@6wind.com>
In-Reply-To: <7d8f1378-d5a6-4a87-82cd-98eb794f85f2@6wind.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 30 Sep 2026 23:13:39 +0900
X-Gm-Features: AclHuK-ds-pquglK1wdrfnVLrVe9lO-XLy96JgNFg8PNJqutvY6kezkk22pc8Pg
Message-ID: <CA+7S2v+hEK09FDv4jLrp3yGLxeFMde0j3FJ-TBytLxQ1Uoq=dQ@mail.gmail.com>
Subject: Re: [PATCH net-next v9 2/6] net: change netdev_hw_addr_list count
 through helpers
To: nicolas.dichtel@6wind.com
Cc: Ajay Singh <ajay.kathat@microchip.com>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Kees Cook <kees@kernel.org>, 
	Kory Maincent <kory.maincent@bootlin.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Thanks. FYI, please don't top post:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n336

Thanks for the reminder, will be more careful next time.
