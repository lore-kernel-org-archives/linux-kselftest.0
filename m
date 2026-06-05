Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728703D1CCD
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 09:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780652890; cv=none; b=NVzQ3gSehp8LbkqTT9z5/NgnrDp34P9OllbJ7ZgiacxgS8vu0Ahwxvr4neb4w8YsqoP3E3sYeMu6VhcTY1yjoMiPsbkibHHfwO8JAQD79aC04Wz5OBPLJ7+E9nzSly+oAItc7eKbo3eXSZ/MQaxkUPaUh7AsZTuH1dRIcFishxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780652890; c=relaxed/simple;
	bh=e7VbAl9oFSSHi9RGRYlzPyWnGK5liGS+StI66tcfe/4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XPxH3DT5DxywWsk06vwef/0uBW5uzM6mFFwMYM24oOvVn6fdb9ezlknxOMdNbvba5yUyA8RR4mMPitPthc/HEz1fkG6htOFXeCS5Km8p3Mr/6sF+F8OjY9Wz6ba5hR3/pQfWntMQ7MlI9eEftZ6aZALGdsTTShydIsihJ850jXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLcM5joj; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLcM5joj"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c85893bce34so680479a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 02:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780652888; x=1781257688; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e7VbAl9oFSSHi9RGRYlzPyWnGK5liGS+StI66tcfe/4=;
        b=dLcM5jojfJaEbZXANpiCxBrvbBOgq+JMhDYQaGvSbc1U7B3E/LqLGd6qbE/UPLyQc7
         u+XfRCQeh/NbCVGJDkrD5eNpo7WXhOzd0QKUrl3aY+aH4tRvTnEKLqShgTec9k6kghV9
         jNnYk3DqNsHHI60i990u67CIKBujemDouY9NmTD0erY55pLMJhmE2h7ShLJ19SvaAy6N
         fXYTz8Fs3YQVM5u8G9MDiSkhwtFWQSBOyp4CvLRWOMtfBlaw3/98oQTgn7Mvu8lcRNdf
         3UZbFCNaxHETnIOo+1qhixXpBVIrbtowdZaAQ72iTaNDNg7/0mZzBLhIYMOu0TjUKqh2
         Agkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780652888; x=1781257688;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7VbAl9oFSSHi9RGRYlzPyWnGK5liGS+StI66tcfe/4=;
        b=CNXNWmq5FPm5d9AGULde38YPNrwtetJViVEyxcF+MqVSwlr/Nu7XwB5woQIdxXO3Xq
         bxuALo/zuKiBlxb93W2V+GcLIB3Y1+pNxBDmRiVVQsUZgQ5V7/UIOA2DiD1JdUCzPFCY
         WCEwFfNDp+mQBVsyYWmiv44HDCJwuvv6p9QMUrIYLPXbefl8tu+t+icM5fG1RcnwZP2C
         yHuyF/BqQNPoEalJGrv2Cux8uGNBDeOpbw4oH8yVik5gMWVfUI3J5sI9PRdbSX1ZqXL3
         12D5/xacVFYuAhlwBmVD/Q/4yMVk8PGwi4BcyVGMS3dP0sVL8CBdKzcUGUrkns2BUUX4
         0arg==
X-Forwarded-Encrypted: i=1; AFNElJ8RW9tJX/wr6j9T938doSzKmQsMGMPU7ddRNNo8/mE+vkEJs/DhRzQroO1++1qJXSrxhxOHPHcXcfwQiMFH10w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Sk9AuBxhEZTCOClCqs9MhCcuJ5XrFHAFaRq79WRZO5IHBIZz
	cWYA9H602UrW17szZQ1//ejxUyWTpbBTuTaui8YYJNlR75NIdsl5+SRW
X-Gm-Gg: Acq92OFq1Xmda9y7LhLVSa4EKv3YD1ms/0jjV5q4tl0ciLcnJLjh6KyT3btSjRKgaZD
	IC98woF1K5hi4a/OMTFJ7inHfESNIAQQvimFlYDSWmesqubY4KnvGHi8CS8hXyRjB9C1UNTKBtW
	KjOxNZhDBtr8o+PhZ4m3rYFeFjrQNEXVujdRlMMlhdTHu52dBg0oSVmlSkg7KHy8qA/pecsV2BH
	tWAeTgCmgIrwWyGOsIdks35KVW08kDLtKHuTbHlBxB4+CuHJTNLk+J1xVXabUPGPuKoX8MeB7Dx
	17FiLVj3fKmzk0C3wi3qOWLCUOxBogPE7lwtxhKtulBjf9Meum7ADMvDM767dF0CX48pcMR9xCN
	JfereI1cyS2rvVPxygSgDSEOix86WX3K8oUT/VXgb7kfhsWeCN2YhkqdmaoWiIXGibwdY0z8xRz
	f2fxxzqx51U+y7AXhGbZuWlmbF6kwGxIia8dK/PQHZOOwxNtF4BXEHjhXz4wgB+g==
X-Received: by 2002:a05:6a00:b807:b0:842:74e3:48a9 with SMTP id d2e1a72fcca58-842b0e449c2mr2778426b3a.12.1780652888452;
        Fri, 05 Jun 2026 02:48:08 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221a7e9sm11214741b3a.11.2026.06.05.02.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 02:48:07 -0700 (PDT)
Message-ID: <70d13621ffcc36e3254ab78f8f1cf14c4c9b4f03.camel@gmail.com>
Subject: Re: [PATCH bpf 2/2] selftests/bpf: Cover dynamic inner array lookup
 nullability
From: Eduard Zingerman <eddyz87@gmail.com>
To: Nuiqi Gui <gnq25@mails.tsinghua.edu.cn>, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org
Cc: dxu@dxuuu.xyz, Martin KaFai Lau <martin.lau@linux.dev>, Kumar Kartikeya
 Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>,  Jiri Olsa <jolsa@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Ihor Solodrai <isolodrai@meta.com>, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 05 Jun 2026 02:48:05 -0700
In-Reply-To: <20260604151153.2488051-3-gnq25@mails.tsinghua.edu.cn>
References: <20260604151153.2488051-1-gnq25@mails.tsinghua.edu.cn>
	 <20260604151153.2488051-3-gnq25@mails.tsinghua.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-06-04 at 23:11 +0800, Nuiqi Gui wrote:
> Add a verifier regression test that looks up a constant key through a
> dynamic inner array template and dereferences the result without a NULL
> check.
>=20
> The verifier must reject the program because BPF_F_INNER_MAP allows the
> concrete runtime array to have fewer entries than the template.
>=20
> Signed-off-by: Nuiqi Gui <gnq25@mails.tsinghua.edu.cn>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>
