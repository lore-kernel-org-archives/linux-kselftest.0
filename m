Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900139;
	b=nPg/6jP+ClS+xn7BohJR4zB4ByjHQ741dYDHBmo89pqYKJEmTJ9GPDprT7LVIzv3hFsu
	 3qCNlryxL0FCSGrk/YR1qjIg1R+s1XGotfSXKzlb30WRcfkMoDtrfaT8dzKXsV1HZbUzD
	 tbhRBb6J87f4f6xTPaw2nGVLhhrNkgkRDMmvqjRRIFRaqWt6fDXQbEuO1cjdOYnsrSrC2
	 Atyun4XrG7mJ00A4IGe9ni5J/tJ9TBH/a1SZ1XhXHDc2kdTNMPNhD4c2J+tZOXNWC0XZn
	 HNw/HBCXNZRkpku+Pz6XLrxUWJVNy5/KNiB2bUV+i1ikA6+yDGp4+4C3o9GfhBbAKgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jbBB2AggVWN99JYUC8jE6NqBElHdygyw3qN7Wg/49mI=;
	b=HnufDiUrQFCHuAzPg19ewXWvMg/LaR1GhvdM+gtXp2pY2f7lLp+owG2gnzQGZluIGL3B
	 AyHF4yjlwCcXbHe5EAcslwcqKTRA9cKE6QZNeNYNlfw9kGZfOLeMBQK33Yh3R8FSVL3ab
	 BcB44Y/yMxrdGm6/ZPubKksLd3t/hI+qQk303hN3oQiNvK3UOu94vtUkHXnK4Y6j9p9+a
	 HmdcmNEUOsIX5A75cupWHYs9Ex4r81ESCgq8FYvDtXK1rYQugizpT1mXQ1zr8dd891FWH
	 Z2ciOq4vOxEK8DSMDl2LtldTC4CZIfwVwA1jaurt1qHEHnTQpOSp8vp/zVt74xiNW1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n5nnzc4H;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95664606A32C
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 17:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95664606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n5nnzc4H
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4919a880834so536747f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 09:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793900137; x=1794504937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbBB2AggVWN99JYUC8jE6NqBElHdygyw3qN7Wg/49mI=;
        b=n5nnzc4HTVp02Yi1ph9LI3YnM5HgC8uVW2GeiUQadCxo9704l1ZItXkY2QP8kGf6zA
         RqFyfyJy1E18YMDvobl4Go0N7g+M584NANE5uRPqDy6ZHSuCIgGVuoWB0KpsRZ653T8n
         a5C5EESnUWETubsdG+44Hlt/6S9KfppEo7u6nYwCk4l9Ji1EjAInZcWrXJ5y0f08zeut
         HzKxEEqdje8USHdD4N69MdSZoZnK4VlcMWlx344bfnaRvsYQ5EGHMr8xXmClNsHYF2ED
         ILAnNX4cyeheq3XoraKYYPoDJ3nNCNfmf9kCZ6X87IXyjdgOoq4dIErCr23Ok/1ngK5Z
         57vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900137; x=1794504937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jbBB2AggVWN99JYUC8jE6NqBElHdygyw3qN7Wg/49mI=;
        b=OkUCfQ9u7TAwi9jJ07SOuAiyh6YNChmIBnlEl6NmSYxO2901MIRGZoKv89OGsQPqjU
         brsKgnRpd+GECtA0G4HU4gOykDuqPssQfsRYD7psLnxqncPwWp1JtMuoNna7C7LosbTC
         DffZuN2QOH2VjdS3dLDCsTaX5WmRT7ywZT1my1iSI8BFUcl9sC8Hrf3a+vG/jy9snt6Q
         SYLLh675AI+vUX+cXi5E5aqI8YWn/E2KhW5ScYen9TCUSEai5sN2t7LSgd7kaRz1ywtX
         VWDGkJKhdtBS33FCHcUv/eyPvoTU/BWEx8vi+0t1lWGEAPgT3tMXm9zc5kaB+s1//fM7
         cBvw==
X-Forwarded-Encrypted: i=1; AKwUvBx+NP/ZTZTbIimD7+SEbT6KcaXXHxiwgm004Egyr9+XPeW5w9obaJoboirlhG9XW6xU43DQeOEc0KybJ2yvgfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+j0RBuE0QYWei0ZOBrDPY35RscFVKpGqwVUj9CwiUCGcnN7aGJ
	iW8NsoI9BTD+tw3SS5bE7+nBxs9JiuVjYNXhvpGnQKVQ3CDA6BG1pUeK
X-Gm-Gg: AYBFou3gns+xfyFuyBGrP0V2wu9dsOd7GLAzhp6/273F+/PnIt5g55m5zekkNvL1l5G
	qPJjO54A5Wc6vFCsGJ68LTbkRGIiquPsHJ7LRRkhRsWZnwwF2+v/kRMk2bR50N0vCPdfgdxd2GO
	fnC1Hctv3sZzH1st9VRsxzb1hB9D/tsecAchIzEJEXNUzKoGlsrDrN7ZoNLijm9UmcYAbcRE2Kf
	CMGLTeky30WANONrGubRw0mm83mUgt405Fv7IBRV/ggH7RP1Us5T7346P+cympJKCQUbVVNCgRy
	z9/boyGGTIhrISM5HfNh4xCGRyLV7qOLnPCc5U/elvwDpzNpy3lG/umFTzGPZwdwH58GBlsUyoz
	H8RB6myeRxGY4inTRvJz7RJ/1bH3tqnOCh6dXP0mTQw6QuF5UJ7gNs/LYJtCxZtQNbGkDHIMTQT
	Fi4NZB4t4PFlCAWL8Tw617dbwITkwy4eib60Y/9I4aQiJ0Rr1AVuNgWkeFlrpy8+X/MTY1rbGXe
	jPyhfQRkmp52pTwQ6hFheprHLpnvVRop1TE9HC49v45g2n3+UDkOqvZACk6LwO0lHMBqcCzbFkL
	Tr6OkQaG3TTgMTticP6SlvHtfSrO+MWvSLvsa0cqN6JaONtUvHX65Npw0K38iBd85bQOE2DPSsT
	FVh38VVCXwoNnmFF+1Ei7Xq7UsRC+
X-Received: by 2002:a05:6000:2484:b0:491:4ab7:fe9f with SMTP id ffacd0b85a97d-49276f3801cmr659303f8f.57.1793900136939;
        Thu, 05 Nov 2026 09:35:36 -0800 (PST)
Received: from andreayoga.localdomain ([151.43.242.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed552aaesm11722895f8f.40.2026.11.05.09.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:35:36 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Tycho Andersen <tycho@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Sargun Dhillon <sargun@sargun.me>,
	Hui Peng <benquike@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	Cong Wang <cwang@multikernel.io>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH 1/4] seccomp: wake poll waiters after failed addfd send
Date: Thu,  5 Nov 2026 18:35:28 +0100
Message-ID: <20261105173530.39081-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <auysN9YTg8Ih8QLZ@tycho.pizza>
References: <20261104103736.71956-1-parri.andrea@gmail.com> <20261104103736.71956-2-parri.andrea@gmail.com> <autZ5kL0S5MkX_8l@tycho.pizza> <20261105153735.5368-1-parri.andrea@gmail.com> <auysN9YTg8Ih8QLZ@tycho.pizza>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Nov 05, 2026 at 09:25:17AM -0700, Tycho Andersen wrote:
> Seems like a solution in search of a problem to me.
>
> Is there a sane action a supervisor can take on failure here besides
> killing the thread that made the syscall? If so, perhaps it's
> worthwhile. Or maybe it's worth it "for completeness" and I'm just
> being grumpy :)

There is: seccomp_handle_addfd() puts the notification back in SENT on
failure, so the supervisor can still reply.

For example, if injecting a descriptor for an emulated open() fails with
EMFILE, the supervisor can reply with error = -EMFILE, and the target
sees an ordinary syscall failure.  After an interrupted request, it can
simply retry.

But the issuing thread does that from the ioctl result, without an
additional poll wakeup, so patches 1-3 would only add completeness.

I'll drop them and send v2 with just the RECV fix (patch 4 here), unless
Kees would rather keep them.

Thanks,
  Andrea
