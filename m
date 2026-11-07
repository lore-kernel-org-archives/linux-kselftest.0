Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=104.207.68.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057187;
	b=Bo+41NF85rS3C4HBGIYZT6208DLHU/axr6L4c3iuFVkWzTQbslDPmhDVV9PfmtgnpU7j
	 3tMcD3ssBE+kNi4CXooeW1DjDh3V1zrUhqy6uRGLz1sXmcqwu0efOTU9LPOpiLT1PVnVi
	 +CKpU5tF6UGTSGkXKcaVoKE6X0EDjrRVhHCSMiSZp1qloSxN3VYO+01R3rPGW6sag8Z0r
	 5MR3RIstUTFPRS7x8AJ9l/Gjsy483/faqnEU9MTj+c9o05cai3zUnytDftlS48k6soeMj
	 MWS3NnLk1jxLzwANc7no77A+sqRypGRuXuTHLkhneX7Zs7Lk5aez0456wSatXiHamKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057187;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Envelope-From;
	bh=8eYCv6BK5RvT4W8fjZT8lKb3F197VD0DZTz3XVRDtgM=;
	b=ERipHCawwh2sLMBBcCd1bzaVi3GhQYwVh4aL+fUa99GAe4R6o03uG149CKZfH79TUHAd
	 f8hIsWPUAMqvUR8lYdqYv1rQiO7EJADStyZND3HhSRrQaYHnLCIAy8pZXbS4pRaTvTmnC
	 S51AJlBkgE60/uspk7RqgR3Wl1DjMww86RBWaO3S4bMWzAKKi7EdpfVtCzkFiC4v91mmg
	 0+BUJZio4E1aD/O4kutTyEuzobEtamsclRFCLtyGHeuCKck9ffOZ8/UalpqprBJ2/3yiQ
	 51MDpiHtSVp7mYIcB7A0Li9q+CwLR1ScOPMrRZNUEM35zW4XcWsbFuTeq0x+O4ZKnnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tychen.cc;
	spf=pass smtp.mailfrom=tychen.cc;
	dkim=pass header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b="WmZmfS/E";
	arc=none smtp.remote-ip=104.207.68.21
Received: from out-93wp-a21.jellyfish.systems (out-93wp-a21.jellyfish.systems [104.207.68.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347CC606A326
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 13:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 347CC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=WmZmfS/E
Received: from [10.18.116.108] (ec2-52-197-241-54.ap-northeast-1.compute.amazonaws.com [52.197.241.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4jMGgG0tBcz2x99;
	Sat, 07 Nov 2026 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1794057165;
	bh=8eYCv6BK5RvT4W8fjZT8lKb3F197VD0DZTz3XVRDtgM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WmZmfS/Efi59PKXICsPFIg61izwlVwGRjDyiJ+7INGktvuU8J/b+vb+ubkdMFkfpW
	 zXoLr4ZQdcXHbBRDAqstEt9XYmjMfKIMiV6y+3eVITDru14q7vSdD8emdvFI/tZ6J6
	 CRWp6ab0HtN+6kb4XxVzutzg8X8ciDEeo5UXDEemA0aNc41eZy9tUQjhM1twZkmIm2
	 DBf+WscKQgXy8zmPVDtRef922vbf/djG+PvHFOpqdnQK+YHvZlXBxQ/RmIdAp8tgtC
	 uB+mF7ndcygp+yf+ccr67kzuhEPrLiMS7b8uLKumltl/O45/VmB61R2blOgP5xpRlZ
	 NYsmmbDrtsKxQ==
From: Tianyi Chen <hi@tychen.cc>
To: bot+bpf-ci@kernel.org
Cc: hi@tychen.cc, bpf@vger.kernel.org, qmo@kernel.org, andrii@kernel.org,
 eddyz87@gmail.com, ihor.solodrai@linux.dev, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, daniel@iogearbox.net, ast@kernel.org,
 alexei.starovoitov@gmail.com, martin.lau@kernel.org, yonghong.song@linux.dev,
 mason@kernel.org
Subject: Re: [PATCH bpf-next v9 1/2] bpftool: Use batch lookups for map dumps
Date: Sat, 07 Nov 2026 22:12:40 +0900
Message-ID:
 <179405716056.245416.10251936908462372924.rhash-batch-review@tychen.cc>
In-Reply-To: <33b057d852c258c157f6aa31e45083418944efe0efaad1d72bcb5513205a67f6@mail.kernel.org>
References:
 <7a728136ad18840c94836ec1ce988f8bc2fcfb35.1793821981.git.hi@tychen.cc> <33b057d852c258c157f6aa31e45083418944efe0efaad1d72bcb5513205a67f6@mail.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Envelope-From: hi@tychen.cc

Hi,

> For BPF_MAP_TYPE_RHASH, can the kernel return -ENOENT before the real end
> of the map, so that this code silently produces a short dump?

Yes, I reproduced it with a thread deleting and reinserting the first
key. The dump returned success after printing one entry while the other
63 keys were still present.

I've sent a separate RHASH fix to return -EAGAIN for this case:
https://lore.kernel.org/r/cover.1794056839.git.hi@tychen.cc

With that fix, the existing bpftool fallback handles the race, so I've
left the batch series unchanged.

Thanks,
Tianyi
