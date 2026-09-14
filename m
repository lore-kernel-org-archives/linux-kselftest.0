Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF2946F497
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 12:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390792; cv=none; b=F5vMtL72uCki01ZwhddXyRD5yswzawez1oTbOt+Csh0iH8HJBOe/I1s6AY4I0SuJFHeKIewDn+k6jVUwuhKgstEM++lMZ+xEKJaxl9zqf6ESJu5zhj5+5daD3FQpiZY66DJ3/DQmrO7PNHBQRPFk/ad9I+LGhuaE8HXGEjd1IeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390792; c=relaxed/simple;
	bh=zRGOZLwME3uVs3/LSukmzMmM709P9OpJ9sZ/msp4w6Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dubq9LxufAonKeuN9xN3+lKUEtQ7+BGDsIYrYThjms0A8Ci+N9MfjkXVcvDezibh8SbnxLbzoQlNcKKeN6Jpv8HcH/F1+WzCM2b7o5s2AF+vXBwkp7Ydb1e+H53RAJsOSRxNzvXxUPjdQeQ5dQ2KzFxHsNoTjHm6k+0weYHGdMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvRs+4um; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvRs+4um"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a0fd41a7bso172007985a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 05:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789390789; x=1789995589; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zRGOZLwME3uVs3/LSukmzMmM709P9OpJ9sZ/msp4w6Q=;
        b=FvRs+4um54LzYMPhqvJ96gPoPWkHMh9QpGTc2EtxKK3jt7eURJSzbXTjLuXTc/oGWx
         NC+KAVfC/bVFNxssMX9aFBLBV91pAiKyckYmlaypELAstWEMTQ9iCzt78U26TXH/yjC7
         X/gBS6yP2xMGyVkQz041u9nmmJ8c83Mu2+nr+FrXJTYUZ+wsmHWGhXycg3ty5WuOcSpV
         kxOCGulXAdLY+DBFjNsCzr1PVWN7U0aDKpNb9iN7ljGQEitNactNv7RrjxO91cUD6jhU
         jih1o0e+bBEBt+ccSQC92Hu9N76F6n1A+iZFLJeoyYZIdaNemePrgrkhxhP1v+madxw8
         Atfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390789; x=1789995589;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zRGOZLwME3uVs3/LSukmzMmM709P9OpJ9sZ/msp4w6Q=;
        b=Kq+du/pKVhNFbDzMNZ4gZyCCJdT2xmkGgH408RlFsR44ZXVjfMd1p22NPKi6MU54b1
         YiHwKSBieZje2UwSJNY4ug5u7qlVCZt7/39m0cofx7A6SJS/7jfbS/SdRteT0ORlYosp
         M3co1vbZBMc1nmtQAirWAGjw2zD9HTpQdHfmCHwbyrGlL7yerAKaxorS4wu8RpLEfuOR
         SMRuBwNIZEnpDXk02XCNoCgscIHvu6rKE99yBaCLozr6/qw4YP3tjUlb1dK6PBAWCoqW
         FzCa3IDXT+IgYJgBsUjr71bwpcfJ+7CqhQ2D0I1sNgV7hdFu27lUqfGnA729xv4sCpg5
         bs0A==
X-Forwarded-Encrypted: i=1; AKwUvBwVFd+4UfT7XsnI757y2/WpTagazy9A84Lf8wIUZDFbl1XePygUfIWcslsGqxiFKmbMat21Jv5wOjSZJvZCJlk=@vger.kernel.org
X-Gm-Message-State: AFuF++lJ0aoeHJbh7s8JmmNwG5gh7wqmXCKSZ4+Jthtx8ZYCqfSUl1FM
	iT5wWgw5lDCpVEIVoh/hq+Zv/TX+bOFid5ooH2ctdfusGAh/9hnEEPPqDnGFgw==
X-Gm-Gg: AYBFou0qcsakUELSoN1wSojnSdric4789kPHhgJex0wHYqvsTchN28EqsXLfG2u5Z0f
	8oyvkWX80tUw1BgGbBPWTrSnEhl5qEVCRqRFuuOLgB0Kh/qJzDKDjQqQQikrfSSUWAbpP/M3eGD
	YvQ9lSHKWb3AsMBTtFWCkk3pPyXHpWlp2EtOdkgnKYzFI6xaAvmqc2/b13zCg/Xf7ZUzMskvqUp
	C2Ndo20mUHZDbG9bsd0YffWCezmDMZiRWIby0lFfYc/xqbkaa/hB/Mr3kppUCIKzwh7B0HiOI5J
	rAREx1lbesiSp2Zk7OGUxiKhgN1ZzkHDhe6K80OIv6Pzjroz4vH+z86cRI+u3a3JH72s3NoQ4jB
	P5R9kj/vOdX2TwiziB/bzBSfwzoy2hYS1jmaN5HWnVYke1ULuMSFDhxx0weix901ZjD12wElSjx
	PiLiLrAOyT7y2wP4ZU5IMlgswG7/pvJLaDKon+MUnHGOTeBQ8wqinxE1NcN53nk4LqPOl11VU1w
	v19
X-Received: by 2002:a05:620a:170a:b0:939:1864:343e with SMTP id af79cd13be357-93a29a92de9mr317219085a.40.1789390788770;
        Mon, 14 Sep 2026 05:59:48 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939fc4a9455sm776097085a.31.2026.09.14.05.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 08:59:47 -0400
Message-Id: <DLF23FHH1IS2.50ZFYP7679BL@gmail.com>
Cc: <netdev@vger.kernel.org>, <edumazet@google.com>, <pabeni@redhat.com>,
 <andrew+netdev@lunn.ch>, <horms@kernel.org>, <daniel.zahka@gmail.com>,
 <willemdebruijn.kernel@gmail.com>, <donald.hunter@gmail.com>,
 <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next 5/6] selftests: drv-net: psp: factor out
 creating a netkit in the test netns
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Jakub Kicinski" <kuba@kernel.org>, <davem@davemloft.net>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260912200426.121025-1-kuba@kernel.org>
 <20260912200426.121025-6-kuba@kernel.org>
In-Reply-To: <20260912200426.121025-6-kuba@kernel.org>

On Sat Sep 12, 2026 at 4:04 PM EDT, Jakub Kicinski wrote:
> The netkit removal test builds a disposable netkit pair and moves its
> peer into the test namespace. The next commit needs a second associated
> device there, so move that to a helper. No functional change, other
> than looking the new peer up among all netkit devices rather than the
> two the environment created, which is what makes it reusable.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---

Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>
