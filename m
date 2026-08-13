Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEADB27A91D
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 03:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786592466; cv=pass; b=cNz8aH1ngnLYYZa9P5fu54VEiJeDZXjOVDzAnDK0FkOTAjvAaW6p7PBH3WVMpyEI9TT2i2imZPhCPGnQOCGmXSykhpeXlaUOPo2afReJ227zlvClmw3zFHX00wPd5IDleMTOL+il8cAVySoVxdKim5pG2/QkbaQPkMkUX6nYfSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786592466; c=relaxed/simple;
	bh=KGNqgcuWPSyLSxhZ6HvJxhNYRieQ49SCRyUh0hq1fDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTRGCZwK09d2n+lJyCALsbnzWjgFpSbNSf8RaOxG6wD2TU5i1yJDVBt11dVt8+HjCeP/NMluYdQa3fxp0Ig7s8Rpumj3cdKlLc3LF50xniQ9cZfIoPPaC9bKeWCx7cGDTYzIBSQjaFOfMbaQFkqDdMYOr1lWSGbsm+ZllauVnWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzJe6LdD; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzJe6LdD"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so1656012e87.2
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 20:41:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786592463; cv=none;
        d=google.com; s=arc-20260327;
        b=oGO70RZYkD4usxxDUil6SkxkzFJy51JDzONioAoy8xVTDGoYmxAJa/2N1ilOSEotze
         C1Nr53UBmmvCxj1cz4C5380v5ZUh6N11B8fdnAyWN/eKac6LCfhi0tw6WhfQd+qN3+X6
         onDfot3Ps6qFFteqUZ0+zancVq8xDG6hyzkWjIjCWzOPFnbKSGUci0CTVVdgdMeWZFrl
         kD/A+WHGPuoILYsDKK3Ulr9cEt4sLJ17rbrxvzBM/kCJ6E7MMTxre2C+x9eH/Nh+luOW
         BZ2yf0MR/nx9rWcdrsHLl0lsEB0WQceua6JCXGiVNL4hccHBYuq5XgyzJ9QgpfE1EGqs
         zSMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KGNqgcuWPSyLSxhZ6HvJxhNYRieQ49SCRyUh0hq1fDw=;
        fh=xExRCByijPHKO1nayPjJs/wC6lN0g5nK86hlvswSG1g=;
        b=Uy/rNV3W/cLqF75dGRwDIcPVnL+zCFwf//nSJ04+VGrcg3dc1zkzYC1YWz7V1KjrTU
         1LkRoyQ3N8S318n7ha77T9SEE0rwZIapYXuzkG1sh7mrffstxE13jriPr0eV19RzBXEU
         2O11psDky+Ql29clg6aUd3zRmuQPnsR4f6JaRCr6SIYt++YFXYgAaVIAnBQUK3+C8KNb
         V26Qaz6GIzzjl6HWltmmJNDEqFmPsNfcNSeqjCPjX5cW2ldrGQS6/iptJdgzok2AqkP+
         5ZSfXg8Bb7hr1F2ds/LPDT0j+JXOfOIGsgSz/1P+BdhaWpy/krqNFHH8/hpK1F8ggK0N
         hhlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786592463; x=1787197263; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGNqgcuWPSyLSxhZ6HvJxhNYRieQ49SCRyUh0hq1fDw=;
        b=fzJe6LdDAHCuOOen4AkfHRsMy3EwDZfFW0QIGdze8sdEzctJHbmxFalbj80Y8dleWX
         3UUmVust8DHJrCtnFWl1GnVC4d7POz9pyspy2EUGTixNoIlZWyk6Pv/iHNYU6nTr/cWp
         29VhdtucWlR24q94AmhvclmBvl97Z5BI1KEd1tdzsxnvKu2LVn/K9GRi5qkhFDSIz/sP
         9i9s3UVPeA7SK9vboCTKSNQ+oUxVidBp6CFwHbCBm3/bJrE4kKeryNRt+U4mtZQrFkLO
         M6F24OmEcjYHZ9nugjXpwCx+TpzuOr6ErsRwmWoJnibtqt8umwWBD2eY1+tgWY4pIPc/
         LREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786592463; x=1787197263;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KGNqgcuWPSyLSxhZ6HvJxhNYRieQ49SCRyUh0hq1fDw=;
        b=BsAZRsGRJBRin71gYp6qGMdSE99dy2zeCXaNN9nxutsU6U8/E3e+FoB0e+XZvBsylh
         VFS8QssZIcjV/vRwmz4OBZCWEk/G0kxo20EkghCCs71nCIoIs51TvjrLG8ISrf/L/J9A
         pqPC569vOS+leLU+dnoM309+WIsFjbUkUXtTMPlyGpfjdZghUwSIUwvLlYmjVm+DArDu
         YypLDmeXXuOnZsf9mysZyQdDkvILUFu4PGQEoTA/F5JQjwIB2ynmc6P+aml2KtjmMmY2
         35Bx5Sc9U5/U49n6l1LGqZHrhIYKMJQRv35LTd/YpsB1HCsElOqY7UiRxco8mwwKjxlR
         dN0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrtr/MYfKvPRaN8fKbu2wDDNa3qQ7gKHHVml/fJMEyARhERNSeAaONXDig34uTFm0HQI0FfIZuoQYWDJQk2cRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeeJMMnQAi55ieaJFrayIVy9p6PZraEIe9l7vvSx1a4Jk+QpCm
	roh9GsRoSAQTIJF2zYXhJBujJcic3Zokg7tTfG2XVDScCNIr6z+JCfLjtj/TJFviWa2EJ71pYgA
	Cat7Fbk79bwdk37UeXLZgjfL/Gmml6i0=
X-Gm-Gg: AR+sD12Kq70QnqVPBcGg+tZplsepdv6egyz6LYr+OrvdLp7exLFO3GjAxOFGDM0h1MR
	Jyg0+7abO9E4+wr7SjP7LBW3kiF7Vop8UgPAnLzABDtc6wmtzRM1Cw/ypq5g3nA5Z8aGycyPBCa
	QSwZ7PlKoyUoRRkbD7aBQnBYd+Xpc45lmG/NWzVMrYmElTfaBLxG1IsqSQN3IXnEHpNm+6pdDZ2
	ZqjLLmIbqcQFph4acvqo3d4JGJnU3+r2MYqNPi+gyQMT17pVcSGT/o+P5VgasRw16hTNeb4HbAY
	BsI8pzwf1+Ig+XxgyLyl1QWuL/sbC+OC4XHwBaaUF3g=
X-Received: by 2002:a05:6512:65c9:10b0:5aa:671d:9960 with SMTP id
 2adb3069b0e04-5b453f3a290mr198295e87.6.1786592462622; Wed, 12 Aug 2026
 20:41:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803112218.3361213-1-dingning04@gmail.com>
 <20260803112218.3361213-5-dingning04@gmail.com> <DKNGPMSHGC89.1WT6CHDFCPRJR@gmail.com>
In-Reply-To: <DKNGPMSHGC89.1WT6CHDFCPRJR@gmail.com>
From: Ning Ding <dingning04@gmail.com>
Date: Wed, 12 Aug 2026 20:40:51 -0700
X-Gm-Features: AUfX_mzFUfYUhn8CtVXH-132owRD1GihhiMHZXa7_zmjDSR98AiJaHY2mSy0pJI
Message-ID: <CAJP4iutYA3fcAb5V0Hmc_MDu1=Tk9NuRzDy+NuD9k4N3L8OoQg@mail.gmail.com>
Subject: Re: [PATCH bpf v3 4/4] selftests/bpf: Test untrusted allocated-object pointers
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org, greg@kroah.com, sashiko-bot@kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
	Viktor Malik <vmalik@redhat.com>, Justin Suess <utilityemal77@gmail.com>, 
	Kaitao Cheng <chengkaitao@kylinos.cn>, Leon Hwang <leon.hwang@linux.dev>, 
	Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Please respin and only send patches after you have tested them properly.
>
> The right fix might be to use fentry.s for these tests to trigger untrusted
> marking of pointers. The fixes themselves do make sense.
>
> For the next version, target bpf-next and drop Cc: stable.

Ah I see, I forgot that tc programs are non-sleepable. Will apply the
fixes soon, thanks!
