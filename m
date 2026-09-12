Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0421D4BEE49
	for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 00:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789174044; cv=none; b=o9D2e6YWCVuOidcNg6L8HNZLG4lEWHgdUAQgsRX207h9cTly9qFqFUdyLjQr4uRWGJTpOzK6sGAai3kSuLqiEu12/Brot9SFnUtz2y3dTQ9uPpY14ZnjjaOy/R69I64t4NDpZ2ITAwxgTtq5ojCWhENF8C5r+qKJU2doSdwEr9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789174044; c=relaxed/simple;
	bh=UM4owinUOMoIRCg48l083DCebXwOaCZOmO/zB8KlSow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KBLzX/JS94Sz5xJArzGCDKX/lzPrxm3utvmb0p9U/e5vSvV5DTK1dYTljoagSxrRsF6I+2nL+pxGqXkf+w98dsbVwSWi9ePTYqlQVXs9kn2ohosKS0tGD4vU8P91L8qzIfrdqBaylnY8q5/yBt8Hist1pqERaopf0nHR59Qduy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ov/kTBvT; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ov/kTBvT"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469a34908so125215b3a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 17:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789174042; x=1789778842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UM4owinUOMoIRCg48l083DCebXwOaCZOmO/zB8KlSow=;
        b=ov/kTBvTRbUOzEiD3AWH57jR2+uQNkFZwi9cfNCEDAbM4Oc48yrHxgyxsMgR84Dj1m
         M7shOwQF55+gomRpEsO4MTW5w5S2pnHwH6uGeRB8EG0zDLCiCSsDp67bnDXH1L81rKy4
         uP0nQd2D32OelNPh9su6lME7237aD5RVTtl0ucgpF8oAwkdjr07eszs2oI5lpbuaPhu/
         xU8R6KXv3QH/h1sXflKIlSGzjLYHPAVvy980A5jcpcjlczojs0L4J3BmuIFuVyW/NqOP
         calXwUbqqc4rvwCa6DHmSYMjbxcdVnHzBl/6wCVADMNrGnTRYKcqnCQuVIE1K/JOIorD
         PwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789174042; x=1789778842;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UM4owinUOMoIRCg48l083DCebXwOaCZOmO/zB8KlSow=;
        b=aoJkX0ZRiwWQN9XCsuN9MHReuJ53nCHmHWYnPwEk/iHi34LXB5gIAJ7ZsYNEu25fp6
         +JuC6MB0mwBgEHbwg0ZrfR6FSE+lodPw2bW53N1ClFV4MWBLGV+7Y5cZP6fDBiJDakqH
         bQ2FjMsJdZDkP5FltbJf5/yEwYNwi/C2/DCDE5c/uK2oHgMmDBxk+BYOUrB0TYOnaOx0
         a8puia9yKPSky5Qvku8UzpRzSssNE7NJl8xSxXgcfA0C75V7tzXHHY9vyU1xaPx0N7nF
         jwvXPx+2dPhXbarPI3kuGRfyBeK1DwEUIZNkesjzhLDqqr0mmlzuEQk/qNr8ns4EjFFD
         S5eQ==
X-Forwarded-Encrypted: i=1; AKwUvByWn5XrW3SMOpat3bqiYPZCqU+8/Jy7OUwkSCeth3pDx/w+jj6TWuCEsmeh7xfH2C9W/sjdAks0IzXNhLVc6QM=@vger.kernel.org
X-Gm-Message-State: AFuF++lY87Lj8A3DXJusH1FPLcLJxcWsnwH38Ji6bRHmKuvFZKevf6ia
	cTVeu5/pAvVTRFjl9YB3gGjaRqIeV12kSSZDv/dTOx7wR74NfgRhjVab
X-Gm-Gg: AYBFou0PKDqi34TtzGvFgyGbiYj9tmxWIhJvjwDY1lXEH50m37B154pdy6WjzjBorb9
	lVJm8m/k3mRBTG++ftNXfRumJYmItF1bLqnJNamkvyzcnEODSavBF+dDHHVKjnVGrO2StQKmRK7
	6mDtTORd9+vxkJ0z0SJ4WDSI/LJEnKCnbIItimI3DgUkN1nzOa6zNQk/DWPuWFq4RHHiJw3grH/
	oMEUP8MWLjYzi27Ceqgw0im6t+COy1Y5l/XfjAj/Ehp5iJ3+rNmr0GXFFtWlbTi1/8gwFUD3Dse
	TBK9CUgvI7gC47EYpylH2R2jJeUyo2prDV+agRNXotgXndqvWK0jXwMKYShnDXCn5CweTs+Zp6/
	2l7n14POhJ6TLkMU7s9iV6cab7EDYaNZh9sOcUcVLfq0zy+BnClT5CiTZAZLFxh1Y5kxaJdfB7s
	RXRnm1Bi8KMdRQ02x28LbWNjjY9a9+6V9EShDR5HBm8P+QgUuq5xI+Pm3Zt5F8O7Kn39ShVYsT/
	QLCRhXk1REIrCZMc6wx+HSOyREcTen6723hVSZOHZwr4NSJV3VMKAqNvyd+aPdp/MBlvQkeYfIT
	yDrfmbC2U+s=
X-Received: by 2002:a05:6300:220c:b0:3d0:57c3:65f4 with SMTP id adf61e73a8af0-3db0e0ad192mr1140052637.5.1789174042271;
        Fri, 11 Sep 2026 17:47:22 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6572ecasm1800565a12.22.2026.09.11.17.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:47:21 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: =?UTF-8?q?Ricardo=20B=20=2E=20Marli=C3=A8re?= <ricardo@marliere.net>
Cc: bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Mykola Lysenko <nickolay.lysenko@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] selftests/bpf: Tolerate libarena skeleton failures under BPF_STRICT_BUILD=0
Date: Sat, 12 Sep 2026 09:47:15 +0900
Message-ID: <20260912004716.2042864-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DLCONMRV8YJN.2JBF36K590AXX@marliere.net>
References: <DLCONMRV8YJN.2JBF36K590AXX@marliere.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri Sep 11, 2026 at 03:02:35PM -0300, Ricardo B. Marlière (SUSE) wrote:

> Under which circumstances does this happen to you? I missed this because I
> was using defconfig + DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT + DEBUG_INFO_BTF +
> BPF_SYSCALL + BPF_JIT

Building against the distro kernel's BTF rather than one from the tree.
On Ubuntu 6.17, /sys/kernel/btf/vmlinux carries no bpf_kfunc DECL_TAGs,
so the vmlinux.h generated from it has 5 __ksym declarations where a
tree-built kernel gives 269, and all six libarena BPF sources fail on
undeclared bpf_preempt_disable, bpf_preempt_enable and
bpf_stream_vprintk. It seems that is why you did not run into it with a
kernel you built yourself.

Thanks for the ack. I checked what the two bots raised and they are both
right, including the Fixes: tag, so the patch needs more work than this.

HyeongJun
