Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6997157487
	for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 18:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154276; cv=none; b=KXLtBsC0ED+UR62faUPmLyPYiXvK6LpZQPOUtJMrjr6hrb8/PtHHJQ6EtDRADFbegeB+4TTdCOP19Ok8L1HBo9TpGg9H9JumFV7OiuxNeS29kQ6w59MOaW+muy6hVxE21L71rHVqe9f/y+eTqx3Tzd1R1wST6BEGAXZFyjdmVZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154276; c=relaxed/simple;
	bh=6UIQirELPadVMjM0vUy1/xS19vG9UcIUXiKx10fU0u0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gHZag58s0kQtLVXYvqtbSBTFMvgfqFFi4p9+jdX+7/LruAuvJZ64pgyCF8Plsr1cA7/gENumia5sU3YljScxyp4HPSkSzRpCUlY97aRIi6MaXqst3V9jOYZ1prphAgoRRCZUyf2sx7g/56N4NVSEesNHk168ze4JNqloQraTZrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeP4nh0L; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeP4nh0L"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-139a5f4ca15so3342921c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 11:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782154274; x=1782759074; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6UIQirELPadVMjM0vUy1/xS19vG9UcIUXiKx10fU0u0=;
        b=VeP4nh0LzHki/gljTQ5NRvRV5oYNZY61x2h6AXttAp4J8B3P8LqCh0VKTfwtfqPsc8
         hihRlFishlhVUoSB64AjJdJxiuugTTX53hplFbAvVkCDuM0COJZ9dpEH/wfuu2QthdjV
         24mrQuMsO6g/4oCwFuLZE3vmHZDy/gsHR/pIlUMMVPH4yk1RLE3yPgM7oaALGSNpHoy2
         5r1C5AW8Rn3Phh0vD7DEMC3ATlEw0UOdyI2gUn+W6NC6Ako4diXrCFU1WanVdlqhLyVg
         AmhnpNjchMZM1/Nqh9JtpRF1j6HVQAHj9fEm2+yGP3qdj00SUJ5+DubqoODzF99JYyNX
         ckWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154274; x=1782759074;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6UIQirELPadVMjM0vUy1/xS19vG9UcIUXiKx10fU0u0=;
        b=N0VkfCq33C8WZrzjSU1a6Tsc/EpXR84FQcaDveYIIgq/my00H0mJqytoHdm4u0jPs2
         7SoTpYeSCEaWEDBssQpoL2afPWL37vOtvnn+yBNN5Vr9h1zRFawGBNvUNv9Jd7GPjc/1
         WO1cZG9BcseMwhgpfi9uvohgKuy41UKIvrv9BCFx72SRu/kXzZ5I/vOIpU9WprGy/JSV
         +83FENsRdnSG5Msz6MM1ZUgEwPx70lmQUGKJKi/bxiWJun8EA+9iIDpqxSzpxtEO7dYW
         s4jYM36Dht/PJp1lfpkLjp0/IW4xXAmCSFOE2wQxkh7FrjChON4SSl0E0WPbHDtmbRWP
         ykEg==
X-Forwarded-Encrypted: i=1; AFNElJ+pHHTAWcGwPo3dnK9FMLde6pzQO1z/U0WV0AMnMUAH0JISa/tUm7KnPmh1ZTwy7x+wk4+DI3NvBX+TYPz+mqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtSDsrp9G9aQ4B9FKCecmS+/F4N7IGDZC8/7SGaNIeFQ3KFcFf
	50v4shMwNXKU/o85dD02btLQGJtwt4rEL2i2ZtQi1oo8Yqr3ONT9+nZh
X-Gm-Gg: AfdE7cnVX7QbB0/sboFxiqFInW/eP9i4xIw+G8bgvBc/fOc0oCE5l74Nmh8eG4BPWuZ
	kNnyY1CQE2qEOnka4YkWWq0cBiNOFHkunZR3P/jcjd6LyV5fs4mzhfVirTCeYDr61n9Yjdq39I2
	rl+gYCP7cNpaEYOTNEKHwBwha6ZmCdRlsu7YK92UhNgcyS6rTAWLyzjUcQ8ipO5W15ooqRXLLKy
	4rYhQvp0ApMXBEUCHmNBNlUxTS1YZcL7ztBtEmiZ0UwQ74WlM16LiJi1OiazBYcPuqLov7apc6x
	qVGTjhZtJbeAzI6LilFB8j20hbINp29C4QZSBRrmPbkA+Q0gdkijBldqpXKTXSHOY8t7tY1UCk/
	cv5MG2SbnnWQCaOMsm98hyM5qtU9HFjXOJ6l1peLu2kjpclLfgxkhFpzq1381duTHtLrwvwx2jd
	WDeOX6MFEpAvs3l+/ErnWvFJFHCNX7uu0FYEpmWOXVsW2xJQoSsqiWVD6f0m2jpyrN4As=
X-Received: by 2002:a05:7022:ff44:b0:136:5c88:d917 with SMTP id a92af1059eb24-139a34dbbaamr8472687c88.2.1782154274017;
        Mon, 22 Jun 2026 11:51:14 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:6e2:c699:67c:63fe? ([2620:10d:c090:500::1:5387])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139adcc5f14sm9247956c88.6.2026.06.22.11.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 11:51:13 -0700 (PDT)
Message-ID: <935a7c6dd40466aca387d270c233ce9a8fa4eea1.camel@gmail.com>
Subject: Re: [PATCH bpf-next 2/2] selftests/bpf: Cover flexible-array
 allocation rejection
From: Eduard Zingerman <eddyz87@gmail.com>
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>, Alexei Starovoitov
	 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	 <andrii@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau	
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis	
 <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org,
 	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 22 Jun 2026 11:51:11 -0700
In-Reply-To: <5b0ecdf774f8f5de5c1d8ecd56368720afb5a14d.1782100805.git.chenyy23@mails.tsinghua.edu.cn>
References: <cover.1782100805.git.chenyy23@mails.tsinghua.edu.cn>
	 <5b0ecdf774f8f5de5c1d8ecd56368720afb5a14d.1782100805.git.chenyy23@mails.tsinghua.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-06-22 at 04:56 +0000, Yiyang Chen wrote:
> Add a linked_list negative loader case for a program-BTF type whose last
> member is a zero-length flexible array. The program writes through the
> first flexible-array element so an incorrect allocation-time acceptance
> would leave the verifier to approve an access outside the allocated objec=
t.
>=20
> Use the explicit _impl kfunc forms in this negative test so the case is
> scoped to the allocation type check and not to implicit kfunc wrapper
> resolution.
>=20
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

[...]
