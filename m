Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125D93DDDCB;
	Fri,  4 Sep 2026 08:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509666; cv=none; b=S4sY/SoHG8Qpxp7e3GvKhI4/OxWHodqdfiHPXAGTYcfG4n4rI2vE6TZlj7RxmDjezZ+bPsGBkoWxgao/2bzu+GON2hswDYaz1WSk8V492TMRjz1/e+CT43zajQf25TmrenCj8xBRU/TjLd6BmzbbVIpSMi87j4Mym7qd/YDb/wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509666; c=relaxed/simple;
	bh=Pei3AQKbV/8mZPIhqlEsfH56hZdpkbaH3xKuasIlxdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qGGrpBKcUIsaus3l9EvrC8oiPKXWrdf7ywWxwzGERUL5xfIfNtfjkGR/AtWqW0mX/D6rPyk3diqe6pZf6fdHn1Eci/ZDWxGssfHrmU75UI8zlZGHbZIo5qgd8volMlHS62juIsKu2CK5+S6QAf6BZlPUTgHqJe9t9p7QomOtIwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EXddcMwH; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EXddcMwH"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 189C14E41502;
	Fri,  4 Sep 2026 08:14:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD78A6057F;
	Fri,  4 Sep 2026 08:14:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7DC1411C7A463;
	Fri,  4 Sep 2026 10:14:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788509659; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=A/YUapB0XqTHWiFgZm2Y5luuW3ulfbFhmj5mkJkslv0=;
	b=EXddcMwHej/eVzgfd6wa7/YXUsgWwktnpwOdzEdlUayRgZcOua1NyTFXUdNOw+x3+NGbfW
	KQ4AynvTEzCFuIQVFb/DjgU/5Yr6poms+XC1N+sto0A5GEZgx5n6aXTIh8yFIw7O5cp/us
	HCiXEHaDhtSKRN7dvREaC6U8jvCdoaYt9r2B2IX1f5zJ2OuKsRrMor546t2bYzLQecYhwa
	xLt0u9pou+N6uaK0pZanHpFiyWIgOHR01aWjRgV/eufe0zggc+odZY0AEYvuVFdeV2C4Xe
	pjIZLp4/R5PLbhULxbQrscI0l+DgIkr+pzYZ64B2BrMfsd+uOZmetlA8lvo/lw==
Message-ID: <249f530e-fb9d-42ae-98d8-1f6190f650b6@bootlin.com>
Date: Fri, 4 Sep 2026 10:14:15 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] selftests/bpf: test_xsk: Fix spelling mistake
 "conigure" -> "configure"
To: Colin Ian King <colin.i.king@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260903150351.12725-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <20260903150351.12725-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

I think your mail subject should have started with [PATCH bpf-next] (cf
https://elixir.bootlin.com/linux/v7.2.2/source/Documentation/bpf/bpf_devel_QA.rst#L157-L166)

Also other commits to this file start with selftests/xsk, but that's a 
nit pick.


On 9/3/26 5:03 PM, Colin Ian King wrote:
> There is a spelling mistake in an assert message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
Reviewed-by: Bastien Curutchet <bastien.curutchet@bootlin.com>


Regards,
Bastien
