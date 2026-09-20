Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF893E557C
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789899673; cv=none; b=rRUpbomRV1AYghGpxg3GRbOIsL4ZWv09EaapkyHcq938IxEdyHldFnb5ZAwwXRnla/C6qcsEgoKl7DkSwdM0cat7ivWD0P8zoyQlELbqOu6sqtUhjM1XjNfeiDOODCb3z+oE4rnqvabNe85p2K74gv2HSnmoao9FOO2pVQ0cX04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789899673; c=relaxed/simple;
	bh=DXs70q+uj0fOTubAL/yj2nRY1q+Sd8JFHOY3sHHBGhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IKQN4uR8Oc+WN5E1XTNGSN+nl5gjeVpVzEheNNRzEPghKGvtrkQa3IVinnljQZfYnzEkBU9gB4DHQsBp/n9tXjeVzEG/SV1bBFKqFHS290YAjlMkv0ezFSte7GDYQAnq9iQdqu48Ak8NpBFdIz7wSNgzdfv3mXJGP4B++pCSkHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9m/wlJc; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9m/wlJc"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso2094817a91.2
        for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 03:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789899671; x=1790504471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXs70q+uj0fOTubAL/yj2nRY1q+Sd8JFHOY3sHHBGhE=;
        b=R9m/wlJcx2ZyuYnkIdwDaRDO8ThzohwKv7zrxAqJNj+JDAdHYoApbOWFMPXc0SvQMb
         z+A5maB1IKu6z94MXl+r0cO3h8Cpfz+1m7u6aMaoIcC384ffE8ZfJaw4f7Eq0NYDbbY3
         ARJKpWu1J+8CM9g5YhG0t05S4n0Q5Iu0e0QrR+6/1Hi50LZPjpPCQcNDQ4u1dm3wsrIy
         Euo3zuVgRV8KyvNlUJvLF60El9U0HYYIK38QR+9z3w7/3o1ZQYswleml0bs8KDxnZBTy
         +33mVF9dFIucWCD1UGhM3fnETViUvmXBTqIrKvt4ijx/NOtUrLyAAOINWOqg/CwqzOTk
         HlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789899671; x=1790504471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DXs70q+uj0fOTubAL/yj2nRY1q+Sd8JFHOY3sHHBGhE=;
        b=QmMDLUcKAVBgmkoIPL6R6BvLJwUe46+zDTgu7YaZUheuSMvU4RT7DelfCWgafmnFU+
         1PMl2z7qTJoUfM8ioLtogaBq9YLgk7prNFmiKGFtIDD4lZduYTNLmwWbkKPHZPFDAay3
         gUI0S5L7v6A4PhqGKK31v63kSR0DLgRcmHglE2W5ZpMOJkBA1BDEtbOs6iy5d1eZZSgY
         QGau5v6RE8SCEKh7p1jWax9KaOXWsBLUCGJ4t1qw7EVJHWwsCOtHaYhRAF1dlet+E4et
         EUsFFJN/Kj/UXin9n69pEo3PMHpbrBT5mkuLXxs8/WiMXnvHjKL9m4pvrTbaPXROJSUI
         cqnw==
X-Forwarded-Encrypted: i=1; AKwUvByV1vqlMHVwlOh+wJ3uAevPphydHzKBOo07HBoT+XtmLM3mn1LicBdZ1D4oR3cz/NRJT2M092+v9wTsXl310cY=@vger.kernel.org
X-Gm-Message-State: AFuF++l8UBzG6xSKP5L0qs988EOOqKg1Mu33W+osH9TIUmEkToqflCko
	GQS24gDkE1MOhqpyLv7VuT7MWx9BtpHCZv1PdqAs5laMU7uV/4Vr2b8=
X-Gm-Gg: AYBFou2ewV1gFYWUlIE4zvVS/MLpYPS6Dgcr5B8mHEZC4Cq0XE65M4LMEh1+VRZdN1i
	8/yLseqDjppYyzgTB7gh0Y9GN8l+Levsgek8zMYpVHDMkVa1vkfmOHT37pPpVhLClFVfJM0Dy44
	7S0x/8hhsb2y+pcOpZ8QFvOguaVckLqdK5pi9CWe1fMxyhi9j3zpOYL+bH5l6yp5OKfBonE3e66
	74R5SjOmky5v52X6ytpK3ENXaIKHa3im9psEP1CVFcPEWUiJ27W1M93XJ5I3oUB1R66AgETlZ63
	Fe+BxMsev7kJ0gW8GnRFLhTY9p940Uhl43F51Azpwo3fKeO11KSvTY6MO4qe0VcCIzAlo3ErDtp
	Aj9dvPFZRsqBb6EbbgSoauk6Y/SRb179ELZplBUuzMZKrDRRSMO/9ea2dMKTI15NbDOJgLklcNg
	xBFa+0VYo86oEB/DXg+cKb57xPG4caIuTojOoz42C7NyCHqja+1oP2ruhpFuTxV5gke46+/6skH
	AyXO2nKqcfhOK1zMGGFYE2S5Z4=
X-Received: by 2002:a17:90b:3a43:b0:39e:6c68:c778 with SMTP id 98e67ed59e1d1-39e6c68ca12mr6544339a91.46.1789899671224;
        Sun, 20 Sep 2026 03:21:11 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:e0d6:4b87:c472:c9ae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c37a88csm8550850a91.8.2026.09.20.03.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 03:21:10 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH bpf 2/2] selftests/bpf: Test per-cpu initialization of a BPF_F_CPU created element
Date: Sun, 20 Sep 2026 19:21:05 +0900
Message-ID: <20260920102105.445051-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920095859.635921F000FF@smtp.kernel.org>
References: <20260920093153.439743-1-donggeunyoo.kernel@gmail.com> <20260920093153.439743-3-donggeunyoo.kernel@gmail.com> <20260920095859.635921F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 20 Sep 2026 09:58:58 +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Does this force a hard failure on uniprocessor systems instead of correctly
> skipping the test?
>
> Since UP is a valid hardware configuration for running selftests, if a test
> requires multiple CPUs, shouldn't it gracefully skip using test__skip()
> rather than asserting a failure?

Right, that is a bug in the test. With one possible CPU there is no second
CPU that could hold a stale value, so the case this subtest exists for
cannot occur; booted with -smp 1, all three of the new subtests fail rather
than skip. I will use test__skip() in v2.

> [Severity: Low]
> This isn't a bug, but the BPF subsystem strictly requires multi-line comments
> to have the opening /* on its own line. Could this be reformatted to match
> the required style?

It is not a requirement, but it is the documented preference, so I will
follow it. Commit 82b8000c28b5 ("net: drop special comment style") removed
the netdev comment rule, which leaves the general preference in
Documentation/process/coding-style.rst, and that is the form you describe.
checkpatch checks neither form. I will reformat the comment in v2.

Thanks,
Donggeun
