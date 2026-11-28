Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795830019;
	b=HLKeBETYoQ2efaRkqSjfcQIDAPfpQwKDtScCPOHG3HVnwRDXkObFBlMz1ofZmZzJkgsS
	 Y0HoR3Of4JoSzZEfPWMqTDv0IKiL0CWk1EIZ+xB8VwS1a97tIhGwiZECOYR7AnoF+3log
	 SoozRvw3Vn/GErRPH/blPT8qN9Jmuyi1DvhBXDQbmNRVr0hezYff5fcHUoRoluCDX8M/u
	 XOCiVlmFMGTv+09ovCNd3r6+ns+GVaLjsim8eiRT6UsdgkigCUhVxHiksfTayrwFIuBx/
	 m0tzYwARHGSZedvPV5DeLyfbBDovYmWQtmFyt9hcap3TaXhNyrrbYKdsxWv/++8QQ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795830019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=nHzuwXTeUvCdPppRHxMn98Th6DR4G6YORPkOyi+dvbo=;
	b=QQBSpKKQI58+faVf5vyasJQ/4Rdcpk5Dc2Hm0Hnc95vBuLh67+/fDykn3Eoq9irTZEx5
	 e1sW7fN8gQSfELdSPFabQLvHpnObQFirA+NvO4Mq5WDk9OXqCPXBr8uOPgGQ0k+TvZwDX
	 SvuvwnqQ3JdKu35kveIjV/J/4HcF01V+UdhdM+v4YtpFu/GlwH4CRtBob07v0sa3PLR5z
	 XEdnfRJirwDMY8ZppK+AO0c23mXDIJ3cwwWv4M86p+FFPVH9Q4TSUxNyVuq4lkQtVcaCn
	 3kt4wlAQgv4KDpl85wLpscGTwgjF1pIdh5x518WDt8bsEsfWfLQc7GMiXA77ymhSYKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q+j29iSJ;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5C0606A31F
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 01:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D5C0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q+j29iSJ
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b49a6e8212so3703342a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 17:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795830019; x=1796434819; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nHzuwXTeUvCdPppRHxMn98Th6DR4G6YORPkOyi+dvbo=;
        b=q+j29iSJxxoGRSE7F1BSeZcwvPI2mVgZdsm7x/iBZmNEPXFEggoUPsany6GgqPf49N
         /WCfN6WWWcsv78zTqQFJw+6S4CNLeaGaCBRB9fJpCLiXasH2KydEsCWgbxRG0xLDDxp6
         R0abfDF6sPKD1k3vrcfRenL3is4HryeHnzsb+0WNeuw5ybnn5mJOkxw/Z+xZpNvmkOXx
         a2MWyrzJxnQqJjEbJ83Z7fgtgGTnx7iclNLHAevNJwBwt+jzKKWRSQZ2RChsV9JzzBXV
         APdCwTcI4b06cCuyG5Yz3gEXqd64yFqH8/jRVSK3u1ny8aOBh6wF07CNuf8cZMVpFbwb
         UGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795830019; x=1796434819;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nHzuwXTeUvCdPppRHxMn98Th6DR4G6YORPkOyi+dvbo=;
        b=OnUDxQpLmzO5+QU7lrxSsj7zB6eT7N+h0Zg3U3TQRCjTF8C2BlisFTYRu+uixNXZ05
         FlE3bKen9K4Q0l4nDaLpZALIV+3hccK3ouaIstXZPjbkvqyGb2wUewSwcjm+k9qxEQn8
         WKZeQMTqe+dgelUjBb8cj47w5rkhxAwHvs6jZ971s5DlnsqGABnOrsHz49vtYb+Cx/RY
         ojpBLRfxaRejPsE2OvhRuKa+AbDMpY17bxLkwAh2lLqNRWkY9gbLs6c4FU3Cg9+iFFZe
         ob778mIbDPaVXluEC2GHdNh4GW9TfTYcFNXi2kh2baEOVuzb0+zUsnahmO306Pmm7Ohv
         HhCg==
X-Forwarded-Encrypted: i=1; AL+hErENMnx4OYgDlawEOr9AFxmZjC1ash0Lc8lmXW4H+JPLutbrOtSYVhAE65QXm47wd2t2DCUsMU9jTJmfiYZynWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VCKCgA+S32r/h65Uu95C3YNmmQtexuBQDHISWcNW3zRMb0iPe
	wbqVakI5j44En2w0m/em61UdWkoh6PEd7bDqnRD2rx7Dwu224NCdnleWFIZtIg==
X-Gm-Gg: AZFdTZfo3/H1fkJw2b960fyan6am8bTPlAXvJdc7Nb8pANN7+aylP/pLdZpVXrOR52v
	xYExe/0bEhrgQ9M/dhoz6jJ5vnjo8Z9tqDFreDSKAqIfNmka5b3c1dJn8Q6cV1113rdvlDTS7Wp
	EyhLlAJ4qEllrEG3Seim33gB1iscF61wtZaS/okCmj2+riNZC9Iqpz48Ickj5o4kHIa5WwtGhoD
	XuczJQN8Ui9F4oxh7q7R5GKfA4gLW3e4XLoIPMiHkCt8aoGrw1LzA1ugebSw5cGKB3qbiKtHPMD
	pyx13RPrpPjorPAf2DlOK5XNGLY3wNem2plZii8T+9WdMXNu9EPZAjHWMY7LFL57mYa+dA9p5AV
	iqhwckadG6obg0irwtD8+fKH/VqniXud8gX7MldZQ/w5ISax5n4eGWFkRY4rfJ+a8FH9z9/C7Eb
	y84MgpoEV0Mn+twNd4yloDmRTf1Zce9pAKuSUyq8qf5RRajtCvUtD4+nkat5dFRd1D5uD93UbmT
	oBHl1+eI7WW/4ygXSx6t2l2qnUXtk4aaZG64rsibbcGodNOv3aVyo+N3C/ioaoru8NjzvFZoqK4
	1R87PCcXDEELdS2r4Ej39oZtTQrjXIAgVYbdvmRgU0Z8C7ngq08+/maT6ObQS0kaOQPLi17gJRR
	kYizVRH1DONJIrB2cI0Ckzi7dqAWXG9d5QQ==
X-Received: by 2002:a17:90b:3ecd:b0:3a4:adea:50ad with SMTP id 98e67ed59e1d1-3b41c9e46c6mr27425363a91.27.1795830018596;
        Fri, 27 Nov 2026 17:40:18 -0800 (PST)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm40440119a91.4.2026.11.27.17.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 17:40:18 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 01:40:17 +0000
Message-Id: <DN6GM0YTCXII.2LIEDQV0KFDM1@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?= <ricardo@marliere.net>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH] selftests/bpf: Drop conflicting DWARF choice from
 config.x86_64
In-Reply-To: <20261127-selftests-bpf-config_dwarf-v1-1-46ef5b492f41@marliere.net>
References: <20261127-selftests-bpf-config_dwarf-v1-1-46ef5b492f41@marliere.net>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Nov 27, 2026 at 10:03 AM Ricardo B. Marlière (SUSE) <ricardo@marliere.net> wrote:
>  CONFIG_DEBUG_ATOMIC_SLEEP=y
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y

gcc 11+ and clang 14+ default to DWARF5.
This moves x86-64 from DWARF5 to DWARF4:

  arch                              today              with the patch
  --------------------------------  -----------------  --------------
  x86_64                            toolchain default  DWARF4
  aarch64, s390x, riscv64, ppc64el  DWARF4             DWARF4


If you care about cleaning up configs then drop
CONFIG_DEBUG_INFO_DWARF4=y
instead.

pw-bot: cr
