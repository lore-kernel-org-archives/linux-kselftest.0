Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853253451C8
	for <linux-kselftest@vger.kernel.org>; Sat, 22 Aug 2026 04:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787371378; cv=pass; b=Nmfr+OleUYHPM1RykGzfWLU0sh6o2s0ahrvDDlSJQiwCl7+2A6wM59xzLgr5prtjM3LqXoqlx5LVz8vSkoIT1SJLpD8CBxuRqrr0Td7yndC2j452aZDtpPLVGgGRVWfKNq5IdutrMjC6qPaZS777Sz7VSQRIHjr0r8y0lm4GbLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787371378; c=relaxed/simple;
	bh=Jm0QsIvOyFEtY0yZ3Z8DFSW1RbDxHfe3nBSWKOek2uA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4y1grVgpzH2bdfDbvD3n8CBAkD0tIUnuAH0Lx2Kr9yPhTFt0ZLnmu7JFNZOQC3uCLgEA/yoZDHgKxHI3xvmTwxcEPZUco15C6Dk/hsjQEgVzqbzkSG7OjGbmDY8t7r2SFq4MPFFePH89JdVWKPiEqU73q0kRs8F0LnginXK/uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=fgBBVPMR; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="fgBBVPMR"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a10d02ff43so3632843a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 21:02:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787371374; cv=none;
        d=google.com; s=arc-20260327;
        b=Bw+EM4uZHYtry/oIXce04D2Fy4aG68qnnsjDuk+AKWbzvTgGwfD089n9xNxqlzsYD/
         UimpuMPlu3L2OopKhIDfF3mnTWGq7ckS9a0MYvloeXMZ/hWrTOcY9rFRhk5w45Paz08k
         dnc5J/nhxeZ+4sXFI2/8F8U2RvkyNPRYGD4KJFkHhnlOySw7d1EvjvzhzZooBT8XzwWa
         F3+RWUvcqSwMi3HLicezcz5g0Yq7VFC2QImgx8O/m8NNpbiUmvbH4lt9+BuEz351b1LM
         LQfnrvLzqwDY2BlLrOkuCo+VwVEDQqXkB3zYao6EMz+Ini22f1ssTxNzNVk+libwcJlK
         9MAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3KcjaDy9kvf6pEFMnDiFeqRoRi5mZddMWsHyqJUm71k=;
        fh=sVCodnmIsMa6m4DsSGRu/PG2rI3Th6+GvimfzFyXSqg=;
        b=oIMJwNZReFNh20MR0M78q2TOEUPvcW+OO8SSLfPmViBj/mhpl8AI6/T0azNxejclIF
         +OxHJiTE5q7vAcNQqNao82PpwDn+tBF9rjDJO4rNGHQyWizIKeemppPqDY4ezYG9z7gk
         sNrxUr2TaBd7ptkRyoaYrhnH3ss+V40jnPJZi6rE5kRLk4j3PYadM+D55THlPdTcTr8t
         OcS6O1QH0VMA25K9d7nwo2MDMG6gOXT/2LeM+IhjEgYRT6lyvsM2gtGTeOedmdVq2NvK
         CCIsYRrjLYRRULXvEvEoOa8txqBz/UYqN0kwspwIaxYnQpKytwpTaGb47+V0p8hB12GB
         rxng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1787371374; x=1787976174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3KcjaDy9kvf6pEFMnDiFeqRoRi5mZddMWsHyqJUm71k=;
        b=fgBBVPMRcGA/HXTOPOJUthP4xUIaczX/qbILEaDUH5EFNCP+wDwL977KgjVXJ7WYxG
         VggwwLqRKxFHxtZj/fsysF48H8Mp/0aJ1cWiw5CzzyV/2WtW2xZvewhPcJ2iZV7ZEP5D
         QlSpHo61R+rbPd88/02DV1c+GuB50+eUxXxNRPNp87FVdUqrL/S9tDv2O95c6ZWroI2e
         tE/2z8nqarGam3WPfx2nP3qgh0I2I1gbyRUq2d2qUmiDYFxDkV2eK9ZwiHUX/DQDpGwI
         HpS6OcusAXPfk1R2ThtBovMihBm9TynwrVT+n7IjkyIsa2BJNkg3CioCCj09KLp2dQXD
         01Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787371374; x=1787976174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KcjaDy9kvf6pEFMnDiFeqRoRi5mZddMWsHyqJUm71k=;
        b=pIs+nhbEKcgYHuOQfrGaKLwB1iCnDkaiT3P7q/+QGjVN9qom3xi46BzhiEWfjT3cWp
         AQfXYMosgulS2dksbQM/rkvKnxOb12hNvF/mpCdxiUK2pvEjCaptUaOWJ8xtOcezur0O
         Nr6f/h6uYI4OXLL6TbsO1EEJw4+csWj1UjKMqwMrFOWpLYnYZWyvncXoMfq56zVDryx4
         HpzzhwYLimiEXfoLN//DxzqANtpMd9seD8wsr8OeKdLjqLhgIE8PD1g78LpkoZ0XnUTj
         NI4VCCzVYum7Fi/WLSTOrPbRZGAY9kVnEZK9N4KtIC33To2B+Y+OwZ168kTdrI6tRjR+
         AVEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpa/GjUN3FkgLYaGxhRlBDo8s2ibjRfI3ccjbWfwCigkMLg7KeNS987qgF37x7fjjBQOcBksoTEJ4EFGT9VHNY=@vger.kernel.org
X-Gm-Message-State: AFuF++k1MzBsfejiAi21WzUNgSmzjpZb7iaE3DkE3/yzR+OhjztkzUz9
	/rJi+lcl6HfDDB2ZDG+5Z82kGl2JSAJkmU/popFQYIjqRCMOPMRfRZp5yzj51iBLgExjDNTBsCx
	FTntaJhHGdqYcRIbeDJyOvf+dkzfrgSymXxB8mXYr
X-Gm-Gg: AR+sD12panKqkcWbMYw1n9Ipdg+8TU1O9sUzJZ3BScC/peDJPxNNqKF+JkM0upPQEF9
	mxZXdgtPs2NU99iYpHLoVVv/WvbIAxnZR1DtCrHrSKpoDJbIj1TcrkfKP1wUjtZvG9BjU6CzKcA
	f3l7x3Y6L152Cz5tVP7s5OvcNOaqRvRkr8jEgnrE1Wk5zFasHa4kSUGfVRyideJ9YwgKSkg4TaI
	kXU4LXhuQMkdtNFgEJebJN54uvctqmEIrks1vYUU1p59uJyzh8JlItv+tRkZrUudvPKwoM43HAO
	v3JVx7r9Yb+i2Z5grUffODiE8BluSNj9is0yW6clGn7r6HGDLEUYVr2SHRjcDB6SGOwL2HAqurc
	S7sCVe5DjBY0tqIbcXNURiU92
X-Received: by 2002:a05:6402:3647:b0:6a5:7aad:e75c with SMTP id
 4fb4d7f45d1cf-6a57aade7fdmr4551884a12.6.1787371374623; Fri, 21 Aug 2026
 21:02:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821153823.266343-1-rastislav.szabo@isovalent.com> <20260821153823.266343-2-rastislav.szabo@isovalent.com>
In-Reply-To: <20260821153823.266343-2-rastislav.szabo@isovalent.com>
From: Dmitry Safonov <dima@arista.com>
Date: Sat, 22 Aug 2026 05:02:42 +0100
X-Gm-Features: AcwNN1WphHWvD4doB2ysWPWhLkuSwRuYE9phwkfAYILoKfqyuQarCyxkw4m-t7Q
Message-ID: <CAGrbwDRwfGLmroWzEkVcFkNVWZQj9A+iUukF2qEQCn64M0axhQ@mail.gmail.com>
Subject: Re: [PATCH net 2/2] selftests: net: tcp_ao: test VRF-scoped key deletion
To: Rastislav Szabo <rastislav.szabo@isovalent.com>
Cc: netdev@vger.kernel.org, edumazet@google.com, davem@davemloft.net, 
	dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 4:39=E2=80=AFPM Rastislav Szabo
<rastislav.szabo@isovalent.com> wrote:
>
> Verify that TCP_AO_DEL_KEY can remove a TCP-AO key scoped to a VRF.
>
> Assisted-by: Codex:GPT-5
> Signed-off-by: Rastislav Szabo <rastislav.szabo@isovalent.com>

Thanks for adding/updating the selftest for VRF key deletion!

With David's comment addressed,
Acked-by: Dmitry Safonov <dima@arista.com>

Thanks,
            Dmitry
