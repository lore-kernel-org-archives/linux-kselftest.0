Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CADC51614A
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 21:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026942; cv=none; b=bqMaQ5cHql4t9kzUHgXUsbTKx+L6fkjcjrmRktsxXZOFLtNkVUWtPuAEWuun1hA3EcPHr5I68XGwfKZMfFvVcOYU8lE7hcbThVUewE8N0QGToq+mk3MGxRTU5GAWqMEuz/YJZhfR3pPs75Ua8cx4hrz9DoAh8xit3gyXz9TufxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026942; c=relaxed/simple;
	bh=S0F59O00IfudgmumFPj+8WjSRuyfC/75f3Pd4lPfDxg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=X3++Zr22UgwZ4R/Je+EcoKDrKW6GSv5hRfP8SuobczZ9NyVGqAVBII1qwquq6wJO2fZaoV/pkILJQFIvCAVAwDOuJxIiLq5zjIDoOR+DrlzEUKOjtwEiVWCF2ZTbxA0DzAJ12334RAftWaY/W1Ggo9aFIa+lHM96G8dPi1TKN4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNk1vVLv; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNk1vVLv"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso3155870a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 14:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790026940; x=1790631740; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S0F59O00IfudgmumFPj+8WjSRuyfC/75f3Pd4lPfDxg=;
        b=gNk1vVLv5a52+Z3Uh1/tiWwAS3QtjG52Zn+lC0xQd/EGBiwwEUyV3IpZPUOoN8+I8L
         stCzQYnbtOehg4r++Bl6Gl8cM3tYuLCLCWXDEMYzKJVdfjBtwD/C/ODG/mdOBnx99y2F
         OCtiREtVFDn+oQts1L1li0UILk83745P48oab8Kz7lCiB9Xn6/Q1TeuxPdcvxjArKUf1
         tVizfrkNHQt2cOZvwOFurYQNfmpMPGSPCPxsz9Of57fDzb1Z5bEQs/p8YD9M+JD/Fn5Z
         uazoO6yzXO2fYC7RRlQ9j6+aeT+5pdutaHXzBNCRs49cRrk9s7G1UPlS7c/AD93mWeXs
         K0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026940; x=1790631740;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0F59O00IfudgmumFPj+8WjSRuyfC/75f3Pd4lPfDxg=;
        b=DcDbj28Irfko79pOaDbTUPjHHjCFD4shKJu7k/BScjNPAyKy2lJA04Lgel+abfoUlX
         qZZ8FdZdPTlLCsgNMoq5YCc2lsH2rKtf7KwU1iYXgiopjq6u702BapjzKjjO6pjZ4D7I
         gBp6IcLB9VSF6fVsjTJJjcPybONpGvbTDNe4UEcWpprZdDCAQTjMaitD4IzkODmm+8lU
         Dcn/gz3HDtOt172/rnFQbnnyxGIyYIGtBnuJW8vJpgFYzDDwkqvWF16uQjBjEtyMqEXD
         /V9DOxEJyMr1zVGiaCRnZHN3u6DyekD3y9e0P4imWQzJPpwwr1WtnHp1yN7i10whxVh4
         /gEA==
X-Forwarded-Encrypted: i=1; AKwUvByJHVUEHnYt73Qjg/euNdLX0wjP/hToWqMO9o6rJ4AO3MpFk40yRIchr4n7ZCL2SlupLguQtWWn8UyIBFXzins=@vger.kernel.org
X-Gm-Message-State: AFuF++m/QpC3iRcRlGg5Zk0JkusJkPAMvmjaV4TihXznzrFEkpQ84BQY
	VEITnmpSUyCmrr79JyPDaci9uNvmthHvb8t7NpPBtmCu/qygV9T72yXW
X-Gm-Gg: AYBFou3/XL9Ph36MxU2ot2UyhGNCvtIGWmD6wJRQGaDmYlOpWkkRMUuekgldQLF4+Vg
	86BXU9Ziv2rvKU1DfSDxOSwU32KgqaU286BBLDwffS1NRWC+H6z2kh0jncG1YWg7f0NgYo25R20
	BqWnL3jKKwZtWVODp4nILZ2m8C/qzwIaqnLSUVNUFVyn6+NxLQs68uutFKDq4U4V2TCxK7s/Ofd
	XBGxe2LlUQeKlXx0V7XJDZTXuc+T88AdeJTxH+i6vSLG486/pckAr/lH6JC4x6ld0BYiODSN5JE
	qbhcz4pAzOKUKxl8ZAnx9boQZkZgVX8uUlj8LwlYvFzsRlW2VoPavYo302JUctpCBTfMZ59HB+7
	50ppzfpf0Tgc8kXf3SDxaqUeVVN8QwaupJy3t+J8ENCURncwA5ZW77+fdL1hxvwcdsLx0XXkJkM
	eeM3IQwLzxtQD/iBoIpRyZMQKsFpmTmU8UDbdeKKMx11iSvPUpoTp2ekf75QmYTwaUepH0vBf9d
	jKX3czRtsFPOKQb7UUfjugW+Z47L6i9ESaV4XNMm8dtrvWXpNCC2H5pMotn954RQ031xOKBvXHt
	4/Q=
X-Received: by 2002:a17:90b:4ace:b0:3a0:4023:bb00 with SMTP id 98e67ed59e1d1-3a04023bca4mr6180002a91.46.1790026939659;
        Mon, 21 Sep 2026 14:42:19 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a03bcecdd2sm4134180a91.1.2026.09.21.14.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 14:42:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 21:42:18 +0000
Message-Id: <DLLBLB8VWMGJ.1YXGT94V6NJ5G@gmail.com>
Subject: Re: [PATCH 0/3] selftests/bpf: Fixes for out-of-tree builds
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Eduard Zingerman" <eddyz87@gmail.com>, "Nico Pache (Red Hat)"
 <nico.pache@linux.dev>, =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>, <ihor.solodrai@linux.dev>,
 <nickolay.lysenko@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Jiri Olsa" <jolsa@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Song Liu" <song@kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kernel@vger.kernel.org>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Alexei Starovoitov" <ast@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Martin KaFai Lau" <martin.lau@linux.dev>
X-Mailer: aerc 0.17.0
References: <20260728-selftests-bpf_oot-v1-0-05feb15d94db@marliere.net>
 <6f95ec90-194a-4304-9673-c7bb50065223@linux.dev>
 <d3a251acf5131bea732e23bbd135a5fdebec9ad6.camel@gmail.com>
In-Reply-To: <d3a251acf5131bea732e23bbd135a5fdebec9ad6.camel@gmail.com>

On Mon Sep 21, 2026 at 9:04 PM UTC, Eduard Zingerman wrote:
> The "PERMISSIVE" change done enough damage already.

Pls do a partial revert of it.

