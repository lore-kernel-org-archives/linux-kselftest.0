Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794834514;
	b=MRyzpllwvhcnTInDv2gNXgPeWGVphJfXmLeYb4fv1a+P4wt9Y6BxJt99vjkj2mP/gbvY
	 MujB9DfhaNkU8CKY9iD01Y12kysXMz4Q7uKhbA1cgMBizKY7+zMEWfzOkwVtzOYtB622r
	 rFGPjgpHI4jGfLsmfjG9AaC10PgKI6uUnpgO5HMvHtTBtGc7pftVE8PdO2FF57rYWapqM
	 a70e65jvzjAUA0thMESKffNrfcudYs9tkIwmNd7gEhwdCpzcJYKDQl1g58TVhguE6Kvvt
	 fV5R0McB1Julqf3V3yup45dMWpiVbrTZomXY0WpmPuKTiAkQszt+Dz2PT9SZVDf+LtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SJJ2qpANvyTR8K9yLqvEvSV/pVuGUPXCU9gwVqvlEl8=;
	b=q+m8N68nQ1/aOXEU+gTjjrJLKkeNU2eu0oBTXL5+IOr+MtIHf94fZEPGJ5orDBGPQaSN
	 LFd83a+Fr8IvWfzIfeI2ESSZXnrR3Z1U9e7VjMsjjiY1wNT6KpR80SzW2HnkK8drke6Bb
	 Fqrs/So1c0iYHttAeKoqYb6XhASeDlUklHdR8OT4Vh2QAvy4XQ3fv/GVl4iI28/QDpYvY
	 yYRiAZw30d+sXAIjk5UA3YJ6EewGra7Wh2OA5QLEsZjqb5EkFaC1eGwCKRH2djmK3+8vi
	 ra/WwMiufymdshGIH5sjCDsifIfF5QR1Nr3rP0k8AU/0xmoHlzQHkbZFSLMLags25BQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=PnAQWxel;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79CF606A32A
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 13:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C79CF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=PnAQWxel
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-717080a2d50so3659406eaf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 05:08:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794834513; cv=none;
        d=google.com; s=arc-20260327;
        b=plxFfi85GOpRcc3beMaIXmfDjlcHNIXuvM0kM8g+pE/uA/qSL5CuEKE1ImjxBp+Y11
         zz3zzSdkjCIbPxvsq9OdlSMTNO3+mf8bN1HuYTQ6yv+nUD+WSeBOP57OGeL9v9TEJ40m
         3jE4kwX0c/F/wrQez7+Z0ShXoJhLOfLeUbGvTC8V0vMVfSzywXDSTZrz/LseIT3/pGnh
         Spu4Cl8oy611/Hd2XsMK+3EJEeIifCwv6ktXY6Du9K8heQ911D6buDk24C8c3aGRmSYM
         bvqZhqtmtDgjKwdLrJ+Vm287i8X1n8C4orZSPuA4EnAWmervhWM0KgDy++3nYrTZtje/
         jd7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SJJ2qpANvyTR8K9yLqvEvSV/pVuGUPXCU9gwVqvlEl8=;
        fh=Jzi0khrmYgauJd7ObugNojvKVGHT2zOusJ5yDLTeN2A=;
        b=jI4pHPwq4ecqAecF3DnzIT+R0jpW55Z18cofQbYmz/u4TmSsJrPqPRMkzHJpFwBMnM
         GhSzJadpETAFWrrdVCAS3lx8QLhp3dvvoHjZsKV20yR5xi0PmYaflVie29alGJUBEKyM
         UYboT+0x8RwuRXWxQnf/YiZTrsESi66W8NHbxJM5dl7mh2HjSQTxGy7s/wmI7UbZEVXd
         FpDVSujxOqxBMkGyl7g35F8cmmiVNfN5W7r3ASzP+z0yEMlYKHIvEAwybV0SSaaKx9uY
         G464iE6v7GAelArs8/kFd/zQPsxjkRBqyFWFfxGSYQ1CNd5Cuu0TZlPBT1FGvAcEsX9b
         Utpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794834513; x=1795439313; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SJJ2qpANvyTR8K9yLqvEvSV/pVuGUPXCU9gwVqvlEl8=;
        b=PnAQWxelMKwpd/v8tbVyyOErhLwWUPNbTk2/4gueCFwPgYw6eHD6HmaM3cU08ZM+j6
         oa5z84SDbXbMpZF+YkdoogskH90WSyO2Rh4Sw54JrWdnYU2ENifHszT2VKQRClf/mV4k
         M6fLcrjpThvrZs59s+qKwl9uT9gWAo09lPVxe3keTMIesHftOhFOnMXBoTQoKklyIwpu
         8xcVN2djQ6sruVDJvP0WoKsKGqpL+A1PFZ6/qAdLf+9fyy2wE07uL2z2G2z+kbl/pSDX
         wohfgUgE3Wu4jCDfFixk85aNjSVvUrsuIr58jeTwo715+6AV7uFFgbcRxPM1CXiTWWqn
         AUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794834513; x=1795439313;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SJJ2qpANvyTR8K9yLqvEvSV/pVuGUPXCU9gwVqvlEl8=;
        b=VfXko31nKEB2bdRt0rHQPsyLmno2eBgR10k+Ya3cShsMJvmaHA9j+cDH64fWBaqCVw
         yYr7GhRCq2I7O7hp7LSI/E3A4Q0bq2yDmea7efk3HRySpw6AbjqhTdWC+k0SDhkYgsLN
         yoX6cN+Uk3EvR41j9gHAhAxOhoeRU8WJVF0Mia4QGhDLY7tOjlZHlDr+0h5M5Be4WVBd
         NQITlHM2ZSgwC4BQPy1fegN/AGcpQTdXXzFTWHAurpeBm5cle+HmFduzbeVoljxpdBwH
         OXCLd1Lp7yFxeoQ5c+7z78waxYFWvLGV1l1wvSmoO9mXJd+WDdL2DE2YDoyjJdPtivTt
         uAAQ==
X-Forwarded-Encrypted: i=1; AL+hErHUQbek/ZjXCrvFC0iXpB5FvIRIbeW4kiN3rAiFzlOOILAwGp/cBF4uFxbvVDk4tExVcMLpI7j7xONCy558R7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KZFMH76gPA/yHqXN4uzFLTvPiFtMpBx++XScsrv/66VjXPsig
	04hbqSmncebYq2yBT9IENk1knIQyXWYePe2ziLNZRFpdxM2Gg7+kF/W9liP9gR+THx83jkQ1up3
	AmLczI+nkWgGP+h02rLZ+F0bLZVLBNCr4WVh/oXCRSw==
X-Gm-Gg: AYBFou2NMgySMyIPhEdNeeMg3Uh3iVzpOwv10v+YwgtkYjEiuymYU4ukeZEC7G0C6Mc
	r0HF3K4ysrxqUFPArM6cDjmV783GxQw/6+0iKmbaucvK06fAQopWUqrMkfUw85NM76qLEI0GVrh
	WTYS6ZHu5Q1vOCjkGhUErRC3nXTOVB74DYJQaOE+9XfQHHOMfVLM0AQ7kHjCbrlMQIAOq0o935M
	0xu6I9UDY/gpQDLwq5lxhWQk4u/8a1cr2rQeN1QA58lCcVPKgsd6YzouMSC+qAnoXVsqFoK3L6Q
	K/DtYVDRAdQnwkCdz9/sL0GKd+KsfmBN+WOIOYNnmOrlr46Q4JedJzk2/9x1zqKrQOQzULPjcES
	iimpvYr5eTOUTb/mYvt6lzVMUlzRw11WdY//Nk7tzZKrAtbBowXH/vDxEnAFOzSqhXU1AlMw20C
	3TDo7MHNmRvw==
X-Received: by 2002:a05:6820:761a:b0:70e:78ba:1193 with SMTP id
 006d021491bc7-71ab4f10ec2mr6796326eaf.27.1794834512803; Mon, 16 Nov 2026
 05:08:32 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>
 <20261116084107.6675-1-emmaonana18@gmail.com>
In-Reply-To: <20261116084107.6675-1-emmaonana18@gmail.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Mon, 16 Nov 2026 13:08:20 +0000
X-Gm-Features: AclHuK8ATNHdUFf-g1l7OKHnDpIsGdknxqvgkzdQ5Cs4Ojj7SzQBhCC284Pvha0
Message-ID: <CAG4wq-fhK3Mav3vLFUVYZhiXy9oF4CdazxkbOK2NNy7-KoLyXQ@mail.gmail.com>
Subject: Re: [PATCH net v3 0/2] selftests: net: veth: propagate check failures
 to exit status
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, kuba@kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 09:41:05 +0100 Omokefe Emmanuel Onanaroghene wrote:
> Changes v2 -> v3:
> - Add Tianyi Gao's Tested-by to patch 1 (thanks!).
> - Add patch 2 fixing the remaining three checks.

Thanks for fixing all four checks.

Please be aware that it is recommended to wait at least 24 hours
between postings [1].

[1] https://docs.kernel.org/process/maintainer-netdev.html#resending-after-review

Cheers,
Tianyi
