Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD6821CA13
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Mar 2026 00:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772671777; cv=pass; b=PyDOS8lnvCclWhDejJnPAzm9otO7Nv4Ei+VXkrQi6ddvD6nRxTMC4530FF+Sj6sqemHoKpBoVLtmmnzeosHkM8EQuyXHTwYr32ZvVdc72F3A/6F59HJU5dLf4eB0kxU538Kzwq5ZgLGJfuAATLZblxUFsHIT+4Amob9+q9KO43s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772671777; c=relaxed/simple;
	bh=GdTjpZtbBVQmtxycqSdR+cBuzBwSfmy+9xEj5bqcZPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EumU1Y0MSsxMpcIcqMX/tkIE750M0X7GEnp2VPsr3yqhLZrQTKnceZsg504hVmxiuEF1vhzOKqMUH4YwHnc2l/ZD91JOP0HvvbXEd5jpycLi4BQLxfuZm6Ep1X23OnTzFTL5HYRXjnnI+B/LeZEthv/0I12mAgv0Z40MSASjR4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROKqOScZ; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROKqOScZ"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-793fdbb8d3aso92124847b3.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 16:49:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772671774; cv=none;
        d=google.com; s=arc-20240605;
        b=SPgJgMgBYbJWbB3CI24bFGUoglGrIhK563gEbjzL4JLFZEWMHW1p2V42hv5BhI3HND
         Dh7aYYebSYmB/4CBacnNDvbNi4wZFdBhG9b4hmM44Tp305oU2szd3GMkJcwcnpmPBp7O
         EyZ7ePo6SKEQiKoay0TI8HXVTD0NSr0nz7IDfB4bowfCVOVt73kZc5eFUFhdROS/PGFD
         X9h3PZsgUdoHexm9dKjZJ7eWlxNNUgZipKxBtYmnstAOeK+KQHgUQsyeTnTfDxFH7wBR
         l1csUsGqQp7qo2o+IDk4kxqYgVU2psIr4AmucR8ta2E2xtP5xpE0z2jc73Om2IKC6y9m
         TYxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GdTjpZtbBVQmtxycqSdR+cBuzBwSfmy+9xEj5bqcZPA=;
        fh=qxf525Ezcpzeb/a1bBIPxw5AvaRRLlbiRPO5e6EL2Ng=;
        b=cURweM5qxxKAVKcRwgPmCx9UwmbAxwu+sBwu1uOBwJBgMjfeoIYfAXxIiNXbT/VmLp
         VHDhvUYwbSgZTcWb+260/5/mht8BhbQB3xFb9MGM8LQzMIYRQ+QptFAlaYw834B7ecEx
         7Y+InwdBQXE90xdJNAYitl/ntd6/MGwbgDtwMa7ZeX6jOYXQUAjh32kFIxWIf5Q+cQ7N
         14QWuRKH+r5OU8EpOz76ZIDL77jzDODdLnFxpzxZTWM4JODre10NprQpcDc4gcYKfc/w
         KWmaXW9eZWhwXcUEvohGJCE1CojM3HBcdhDsT784OTefLNgJJUJZ2ZIHOHJI3rasnT03
         sK0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772671774; x=1773276574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdTjpZtbBVQmtxycqSdR+cBuzBwSfmy+9xEj5bqcZPA=;
        b=ROKqOScZiwPAK8Xh1mmL1v1vQHnhoOjOgB93hB3EpjUUT8Rv0yhnylBfIM1KJlhuBK
         yAzSsaduv2loBNP1fFEaDzHMBTq3aFd3mZqGMQZ50LDV/bBTPWgT+0mmaEyCw2OwdUtL
         oEYefllBeZMTrs+l8lfWWeXbc6MGWCpUCFj2qmeB+NIkvDKb51NxuN3gNifxfJnkw84Z
         WvoRvQhSeBr24iBv+hq9tHiAADFMNecibufRVGr3FNPe+yqqL1xr+LkkTSYObxiU6TNF
         7VB46qXMgJyOOYlB62NBujBZB5+XMXluvk4HBFHpi5qKMTdJBg8GmGqYa34/PweBBo/b
         BBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772671774; x=1773276574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GdTjpZtbBVQmtxycqSdR+cBuzBwSfmy+9xEj5bqcZPA=;
        b=jiB0kiSnpi/u29RhryZguWUj6XBSS/7Ef/W7veRUsUJ4DKJf7tH6kliBk9w0hMrhDY
         q/Y5uQHPeqQHx/HU/byzSTle2EqoqiL1NK3E6cyeJaphlzKKX4T7srKOIrgT6QMqtWd2
         23yzHQFfW6qAaiFO59pJ5sj4zDVN5HuFbjjbeayJ5vjBugJSqTs4xpT3AxCGiGaeuwRw
         D0SZVIG9JedgebR3mYiSb1owZ4CAPw4qNaY4O95gy9uTf3NdS1KX87AWne46FDQW7A9J
         3P1+cSGWxY/SHsCncQyC7RsUi/6nhyD7NKC9WawQQ79ij/BK0pF4RxGrv6It/ZMZrJLW
         Fj2g==
X-Forwarded-Encrypted: i=1; AJvYcCW7f6A81kZtUrbuGQjurVivR/MK96/CIKlwCBeTtPJYmYNiYEaYu+6+MfgzBlfBhK3knNhWAx7WBfzfSvGVtZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0OC8pzRhZyCwfsuvCNATFMLDxzJu5gSpbttafPSLcibbFotKS
	6jmyyvwtjvhpm0Xs/kWRmURdiS9/bc0y2844VSb6TsUeIG1c2SVbohic4JapgWfMSGkTX+oTxIz
	IvE3mahDc2cbZjBIveN4pl3UKzuQKO1g=
X-Gm-Gg: ATEYQzwiQG6mxdRyD5W9vhIxGaMzk4ZOyKOZsnWcI9quYOIGsgkLJs8mxNtBuaLYUKp
	D3akYqtaJO4Op4WG+Odw2sBeFePWTQSBckvXjyWbcuZxbwTNEYdRf8CbGXoO1lGJjxMWUIub+py
	YH5WgmlOYSa1NAbx0K/WEW36XJj/izhGmrnw78mRQ12JN/8585ZdqPZ9S7sm8YcQu40Y++k2ESI
	S64dzgoPVJcWkt2BFaXyHGV5CkkMyfHvSqKuYCcNLcPatJeDPPfra4vCmqshaoXcyFBh1QXDwwj
	5AO/Yg==
X-Received: by 2002:a05:690e:b4d:b0:64c:9f87:ffc8 with SMTP id
 956f58d0204a3-64cf9b502f8mr2926055d50.27.1772671774394; Wed, 04 Mar 2026
 16:49:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302071434.311395-1-sun.jian.kdev@gmail.com> <aagWYyrrwUt-poL1@mail.gmail.com>
In-Reply-To: <aagWYyrrwUt-poL1@mail.gmail.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Thu, 5 Mar 2026 08:49:24 +0800
X-Gm-Features: AaiRm52CcrFpcHu1btFE-2CrSqBTFC7iJEHky54hbkfEP45VEUCw4H3dKOIHjiQ
Message-ID: <CABFUUZEdbCMrNyp4kEO7A4KZPn5TKi48+tQvaaYaYuJj5FQ7gA@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: skip verif_scale_pyperf600 on -E2BIG jump
 complexity limit
To: Paul Chaignon <paul.chaignon@gmail.com>
Cc: andrii@kernel.org, eddyz87@gmail.com, ast@kernel.org, daniel@iogearbox.net, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 7:24=E2=80=AFPM Paul Chaignon <paul.chaignon@gmail.c=
om> wrote:
>
> On Mon, Mar 02, 2026 at 03:14:34PM +0800, Sun Jian wrote:
> > verif_scale_pyperf600 loads pyperf600.bpf.o, a large scale case produce=
d
> > by partial LLVM unrolling.
>
> This is a known issue with LLVM 19+ [1] and this test is already
> skipped in CI [2, 3]. I don't think ignoring the error is the proper
> fix here.
>
 Thanks for the pointers. Agreed =E2=80=94 since this is a known LLVM issue=
, I'll drop
this patch.
