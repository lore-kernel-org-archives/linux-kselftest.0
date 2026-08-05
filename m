Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD82837F005
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 14:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785939774; cv=pass; b=UNobfxcau8gX3teEyHlMtHUSfCmwQIzNQzM+wIdii4CAaous+fYJzuOSSMlckg5fOPS7ByE9RD4gswDBNXkcPKWNayzsm1cF7tqmiu83U0gF7tXnRt/0n9Q5TjaHPLgCFFOTozdjU4ratNr3vlXdl/ndfwOPprTMMvlXnCrZ1W0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785939774; c=relaxed/simple;
	bh=zoqyZIgm1EFWmYCKlkiSGKUErGHHlemelV0Nuq3FxEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r7uZLWtrAlfqPl4PrXus3FkykpM79dp7z+i3BIFaTEQdQBXaERZWHCVgLZ0td6gcPkFi2/Wz0oyPQgf/jEcTjr2HjB1S9OjMEfZJu/8/GCLVMa7rIdM+C1KmTVOSBgSauZ/HuaQ5SXsbniFNTYBPWzF5S8lpjSbBYKmGEn3pHYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQwVT5OR; arc=pass smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQwVT5OR"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-495e5f0f428so151663b6e.0
        for <linux-kselftest@vger.kernel.org>; Wed, 05 Aug 2026 07:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785939767; cv=none;
        d=google.com; s=arc-20260327;
        b=HyOwjnkGPJq5BFytu05yIcGYbu2DhLbLWPhqZKKP6KbNzX9VrqD1o+UPUq0dt2IvSe
         qNpGsnFbKoy/rytVLVmmnq97iTXN3zz95rSaXj26mJh43kqcRJZQwwvZSy98dNKIhW6C
         DqrooaLOJuX7uNoyMzyLKuZzXtjSfNU2jbotJ0fA0EZ8HQzvt3y/6OnirKa1ood5/2zN
         6O9ql9LV8XvNKdBVZ3TJxI8PVxzE8wQMjpuI8BSreano9FMpr34ODjdg77a/+9557w8N
         qKBmfWpSUbHnHyuxLMMi6LYNMqMkCuAOH0zcIxanYvvqvS/WEPe+MLR72lIRtQDe0pUu
         hbRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zoqyZIgm1EFWmYCKlkiSGKUErGHHlemelV0Nuq3FxEs=;
        fh=5fdgkD4GYZM/4CHLU+TN3bjNR59X9QuUdMOV9FLnq9M=;
        b=N87FX3uf7gBZQ5auCnTcFXhtJVDtMvI/OqL5Kj19BKaQattlAiu2ku2o+wh3/og2Y1
         g2Ac4CgTkkkN15Vaqjry8PLzUGVpPIiUfv1VCL/ntnWa2V2tpy1I6WcOTH9/DmUrBnra
         qo2S6ApBn4PBP6GpbrU9BLwcWRm5fTBGQ/0+cmNld/jP6LuCctqW1ZWX/SRwiBLkDdTS
         53dRxk6oTDMXeoYcPnX9wC3VR1M5BC/fmiTYfYXy9qRGpbKXBnoT0XLCZ9uqOQUyelWB
         tdINMMTRO/XIUS9v5MSPwO9fPB9wSvimec1/jzqSSHJG15UJtlTHFfFiPAzLViSfRJcP
         bkyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785939767; x=1786544567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zoqyZIgm1EFWmYCKlkiSGKUErGHHlemelV0Nuq3FxEs=;
        b=gQwVT5ORXPSasdlgoeUPyIFhbf+eZF8lXaJan2FaicbvLqcuboK8qE4gssjPxJjI9O
         dK6kNZFxTtq3MWxBdkFXqartCeMFBmAB2N1rlZ+OX6uY78AZN8BNwHsny+mOxzZZtSO7
         lkMYKDH6Ca9ERWSRn9JvEaTMqAn7tQBMWZ3KGNlNKcblDap2o3/oNa0a6oWrpc9a8xQR
         bx0wsPYswBin6EoKhcmxJ1/R928VYU+QsPcerXqNZ97xNAfWB6RytYLTiA+DX1NF4zTR
         ZIeLaywpQ2M+VcwH2NATK89hHccpfW32InmOTcWqdowrkXjCevY7o5asEawcK7WI9dbO
         XQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785939767; x=1786544567;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zoqyZIgm1EFWmYCKlkiSGKUErGHHlemelV0Nuq3FxEs=;
        b=NS9O8QNYr6A5mxKS1PfKmR9jBcEtSgyLCEk7tmCVmcd6cEoSBzI5fi8hU3D6CjKgSz
         rkFTjxDDeMeHJBYb7EAbZ0t0BI0zDLipSzgeeZqAxRsMw48rtWqKJLw2t7vxIyDzOcm3
         I9THBVpid5nponJtxe/gHCL08ppadQIdmskjp8se8/C8ve5oljZ48QNoKdnEzt6+CNhg
         WjYsIQuY5ouVdMj7WkVQgri0qE7P9/Bhtz/GJigQCyNvzSeJoiIJD4jyBKuors8VtcQ+
         9JINlwnQu5IbVN9TmT39s/1KSsaxE+S7MyXPUvw+34F6yivbA22y93S5RxmP9m+A05Ls
         A8Qw==
X-Forwarded-Encrypted: i=1; AHgh+RokWoTsGYCZRAqsPhpUhu1Um07Da+pwxCe6wnaYDVRyPwS44dTxgpbRp8bbXObr1+F9FVYY7MH5fQ8iWZp8tQE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2cneEEAqSEk8C33p+tSKoyq7t6HeLsbKP9wcSq9l0KZcQiLyS
	XYlI5I7Sb3cLzZYdtDzbSC7PVS21ABXlkpb+PPHwc0qdbVGBCe5d6+KNxqKu1yEUnIUCWsYIRqm
	7FNzgbiSZ0/dOeG1lGC2DIB+hi8QHMSE=
X-Gm-Gg: AR+sD136E53lUYfLpGiK7EJL7g/km5vcKXhlA+J1JbIJ84OwTZaK8ZUiQYWpBmIvJ9n
	2CWR6e2Q+jSLeGdV2S4h/NEqjROvZ+zs/vxJNO2w9XZMxCqFEHHl3SzVhMoN/0f+wPeFcIuhP0x
	lBCVer50sa5mvtNqRAdBeJ/DpZ8OhBgfFT/hXIzYQ9LloK5wtQFumVNKw6mLLDiHZBNV0HFKlsn
	iiGR+7B+GM5r0OAgx6y6S6yiwtJLK39g8FEcWSMM1UqQBldDDAvYsQLnCClt6/QYEMVk9ZHUC9E
	ZlqF5fQWjjFHiHxJk1bZ8YL8xadZnLIdWqkJyK9B6htNDmZSMOazTFZCB1HQ
X-Received: by 2002:a05:6808:50a7:b0:4a4:ade8:a27b with SMTP id
 5614622812f47-4afadf34316mr2545848b6e.1.1785939766818; Wed, 05 Aug 2026
 07:22:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-netcons-userdata-rcu-v2-0-c5e80f6a7a46@debian.org> <20260805-netcons-userdata-rcu-v2-2-c5e80f6a7a46@debian.org>
In-Reply-To: <20260805-netcons-userdata-rcu-v2-2-c5e80f6a7a46@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 5 Aug 2026 15:22:35 +0100
X-Gm-Features: AUfX_myvpD_v6B0dSVMW2yccuOyWTBeIMYT64tQPb_nOAiYzeDrWrNVWBqp2-jE
Message-ID: <CAGSyskUmNJQy=vSb5-zbMfsC5RdMp-P-CkEa3_kfRAHUsns81g@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/2] selftests: netconsole: add a userdata
 torture test
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, asantostc@gmail.com, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 11:59=E2=80=AFAM Breno Leitao <leitao@debian.org> wr=
ote:
>
> The userdata payload is rebuilt and republished on every configfs write,
> including while the target is enabled and messages are being sent.
>
> Add netcons_userdata.sh that runs random tests with userdata.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
