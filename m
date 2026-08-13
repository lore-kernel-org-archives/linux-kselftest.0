Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139A73242BA
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 22:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786659156; cv=none; b=Trruce5/a3ax2rBu6m0hQDGTaDVF+ZvOBZG5t6Qb++MfbHh118KuhS01wGAkB0TPYQ1r2pt2S0mHVvFPCATQGkgBFZFv6cStiTJvqWasUgjbm/so46Lx5hyM/YKBJCfQTJSrBdkofiiLIRjR2TjS1sCmRJcKfHBTHn6+j3QgeZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786659156; c=relaxed/simple;
	bh=3CLsfbiIgtOoLOgVIe6+RET4gbjRHXqrpuKI1ctgShY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O299athScHWNITfqk0mFZ9bEyQH5guvWt6CDOa+HncRi9JhCbqHgu0WvSWPnra3Wn6TITeT/2nYju2zs95bqO5IlheHIDR83P9+ssuq8ru8mfTVWOw1UQ8NPu5PDtgCAI7Th1P8M1QI86IZhX+Cv5Ul9npoep+QdFPaAkjTC07w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4LtyT/F; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4LtyT/F"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so192303a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 15:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786659154; x=1787263954; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3CLsfbiIgtOoLOgVIe6+RET4gbjRHXqrpuKI1ctgShY=;
        b=h4LtyT/Fctb15OWiK7hGa81iLnrt/UiT6sbVDIHbhSIjxxgXurVYCxqtBT+MXoafwF
         vRwHwY/F0txOpV938gGi/Lv7oUOdQ+Ls9MIucap6cOlYTsQfPHh7ysLYeGKycuQdaXxh
         9iPOmZh+R9YXT9cE6Dkx2sV/snDaJqEWCEaFKkcImxOUkUbBQZlcWZy1E4UES23ue1lz
         k52pwIuHhm4a+bUNYZZoU1KMQEmp0FXwYZjQev8idSeM0zU+09I2SRiVJtfPvZoNKQ2V
         pkRK2K1pT7Al38Q4jVdKXYqBXR2XRSa0amPsq9ZpEwT1jnrb8UpVmLHvjDSTxAEw74eP
         0dSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786659154; x=1787263954;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3CLsfbiIgtOoLOgVIe6+RET4gbjRHXqrpuKI1ctgShY=;
        b=DryzuR4Yjy1fO8hTpa2xJlhDKr2NQwu/5b4j42c0V4mvjr1xOrkJPdviGIaNIzfbIU
         y3gCe3W8Yfa6LvNWOXXK0kPoytVAwsB1dBgZuD9Z87OwtY1mtvRoQa316yWnAOBKIHcz
         J9wHlt1y4ANJSrFc9jf5KQd58matFqzJFv2Jz4KDCN6F1DcWDhZyaSmWM+usicypmxzh
         2VdIwLLmMAojg2Lhc8y0CUzRJNMQk4PFtuVfpfiK2WjL581w94VeQLpN6dd1z1Lm2GYz
         gO83v6rfXQDS8OyhBkACCE2Sp3RT/DFw0N30usIhG7enmW9ogvp+riyBymyTUDTtXtWn
         twsA==
X-Forwarded-Encrypted: i=1; AHgh+Rqdyiw/3yxtlkI/lXrj0NjIZhjLv1AwUJBuVhXKH/Jb9TJKV39z1Y1NL2QZCAzKHBLJrT7pmeBETV+/kukwz2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW5Wv4hjK2PbI4s6h+4FufGXEW0x8iKQrNAsZVy/oLC/n+Lydt
	F+mu4uzIkVlFRZoYcvTCDWX0sZHhtDsbFlnBD+A+o0g6BrGAR7TdbR7u
X-Gm-Gg: AR+sD11eVx3rqiu6R21p81TJl4zjfRmd1tJJ74ogZeXN1FT8IxaGjLmj8WlyuN8s/+H
	m4rx/HCNfWT+2dqEYcpunR/qs1ckFDC1FkeDrYhjmtAHykxsGCzTHjE398rD6IKkmiUWyQR44/Q
	s9an1xzaY3wGh1bIDN5MfzXA1X5BKOcjb87adzi3vpb4X1jSf5ZxKsSBB0pdjrozqrbrR5Axp1I
	k3hMA+iMslUAY7DLoHq9sZQ85hCrvYRK/GAWsSAdsrbovD8CwcSFzfrMRMlkZPejoKC4iwKWS+N
	FMQGymNQ6TzCE88XFiJANhJX9i0IuEgyJZloNdFqNgMf+CEsuOMswQ6NDRJju1igj5wR4qRDPWF
	dyFOaGO2dR7rH6Btusj3DBePRX1UjMvQSjD6TNjZa4eZAeR5oTRFnyzjbpfVwjfwmDf0nbDOrUA
	irKXUp38QSakVx6tWldrRh/V8bcK5GABo4Ii2nHJQtUOfDwcn9EAg/094kUhEn0zC4jxLOeZNPH
	a40JnGbNnH8ZjOysC8/i4+kDlIpNxC6ROdusqQ0JEVqxg==
X-Received: by 2002:a05:6a21:6e8e:b0:3c6:61c6:8970 with SMTP id adf61e73a8af0-3cc71a89da7mr1174469637.14.1786659154308;
        Thu, 13 Aug 2026 15:12:34 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:2cae:4c28:2903:b6f9? ([2620:10d:c090:500::7:1c5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31f7c8018cdsm5251871eec.13.2026.08.13.15.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 15:12:33 -0700 (PDT)
Message-ID: <36504bb7f4ab5a4a6c24252afe316ac393ea5e3e.camel@gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Check pointer type for all atomic RMW
 paths
From: Eduard Zingerman <eddyz87@gmail.com>
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>, Alexei Starovoitov
	 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, John Fastabend
	 <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, Kumar
 Kartikeya Dwivedi
	 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
	 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
	 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai
	 <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Date: Thu, 13 Aug 2026 15:12:30 -0700
In-Reply-To: <20260813-bpf-next-038-mixed-atomic-v1-v1-1-e79aadb46a8a@mails.tsinghua.edu.cn>
References: 
	<20260813-bpf-next-038-mixed-atomic-v1-v1-0-e79aadb46a8a@mails.tsinghua.edu.cn>
	 <20260813-bpf-next-038-mixed-atomic-v1-v1-1-e79aadb46a8a@mails.tsinghua.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-08-13 at 12:01 +0000, Yiyang Chen wrote:
> Atomic RMW verification records an instruction pointer type only when the
> current destination is PTR_TO_ARENA. A second path can therefore reach th=
e
> same instruction with an ordinary pointer without comparing it against th=
e
> saved arena type.
>=20
> The post-verification fixup uses the saved type to rewrite the instructio=
n
> to BPF_PROBE_ATOMIC for every path. Record the actual destination type fo=
r
> all atomic RMW paths so the existing mismatch check rejects incompatible
> uses of one instruction.
>=20
> Fixes: d503a04f8bc0 ("bpf: Add support for certain atomics in bpf_arena t=
o x86 JIT")
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

Looks like this was the only missing case for save_aux_ptr_type().
I wonder if we should pull the save_aux_ptr_type() call from
it's current positions to do_check_insn() itself.

...
