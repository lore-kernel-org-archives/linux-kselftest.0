Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AE03164B4
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 06:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775801949; cv=pass; b=EkdLwfzGqna78gKOYHtudlgFyE1nIe54RQOoWF5PDIPfh0eeGK45/Xt5Br98cJRy8twrrYjbmh52NA4u9HFByI5WiX+LO7aWUIYWmHYS8xqxtpZTOzEDZkKqlnSNpXGkE1bJoujj838VVkdMc5kbGQHW/SAqzYd7UqLnnsPB1Yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775801949; c=relaxed/simple;
	bh=4Dr6sYNZceBCVgxbM6yHz0k1xaiduPlyLu0a0CKYOSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WZqrqk/OSCgd9TYX5L4rNGzcdJG4uMojVN08qzzhsTr6N78VNnOIFNHs2lV+khCHkejoBMNqkao5bn3yLXKC9ZTnoIQJ8VLHQiBPeDloPFkC5G9Lfxd4xKoHtBUvuJBb1aQuc//aHL8EVxafYkYVi7Yu2ng9+rqS06UVJ35NBB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iHMIr2hT; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iHMIr2hT"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b6b0500e06so2545782eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 23:19:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775801946; cv=none;
        d=google.com; s=arc-20240605;
        b=goXULhu7GrtzMfnWI2CSQHJExWXiVpOhUFblN8U/BiMjcTY53eCsGDfIkyhnwq4kKQ
         hXPnpAwa5VCTGJ82TCfNdwMtOVFlYDCOLZHlrMKszeGGb/xoH3snfuXkiks78Gzd8mv+
         Y83Ac4o9mn+V0lWvQxHQuc+qJcvl5VpMELkFx429lP/8YmFlvnAzFYzACE0Ng/JZbR2q
         EP1sXvKKtAslllqqsaL1G1mStZkALtRzyc7WTWF5RaiCBAizKsf5HKUCm3N6qGLInM+N
         n6q/kNYWzh+Ynxko3PhBu8zf0yRTIBlKlMdPhYQwOourgC3u/BjoAV45ml1+dyFbYpFZ
         Ve5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Dr6sYNZceBCVgxbM6yHz0k1xaiduPlyLu0a0CKYOSQ=;
        fh=fvc9uTKSTCya465Ar/xAzwYNBe+LUbghCGCYm+u4Rr4=;
        b=WmtXFa1dbxgQ2nuRY/v3jZmxslEPBngRj+rhAh8XISQ+feTR1wmas4+Z9mGPrvwpo+
         XJ3KNM8RVoGFGhDs20uRlLQYJfchm0jhIqCXKPS2turoDXsGFaofMWwSfpmzhZT3Evzj
         iY6Or2b0dWfQTy2If3cgbBaCAQFByePko3b/v/0nhZbYnSXf3t7yMDqQClM+R0wbzd6U
         K94NyoDLW2s+dVqSQzWWGKcSrDgVsKq0YDvBkl6fqiFAsKaIoHxeBkm1qXlHn6RwkeGZ
         xxUoax8ZDnllZ8IGpQibE6ax5nHAYMY1a+uSWSkXBtzJer3wCA4Sp7ECzcpfYfsjtAZh
         lVXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775801946; x=1776406746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Dr6sYNZceBCVgxbM6yHz0k1xaiduPlyLu0a0CKYOSQ=;
        b=iHMIr2hTtNs8uP2DmAsVJFlensObWX/EWmlE20wp7Y6TOF/GKjZg1VMmpGR6YAKtR0
         aKEFOdZ/l5Fw5dTYQo3JZGfVPITjCwtmKMdKVrWz5g67lWnNR4nZXilRF1PsPSuk+8Lw
         0P95hk44l8SjUtyvixN1SsSufn8MicszCzI0F/6yw4HtLm52Z/tPplQEbNJX3YKaWcYW
         kNTUzAoCyGgDEKIkbSFZc+bEug9AJ5yuByv8gIkueJS8TNWA9igRV2FYH/aREBZrDSHX
         Nic6dg59o0oiHHWYX/rAVj/7BxclIH5acgQp1z+62QIKSYoEC4p8R2Q7DmTZywsm/U0b
         bjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775801946; x=1776406746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Dr6sYNZceBCVgxbM6yHz0k1xaiduPlyLu0a0CKYOSQ=;
        b=N7OZ4rZLbH2oZvAH77HWOCkwTuopCiZDn7/MUttITNRBCdYqgM1pMpvE+rML3ZTEVa
         EcHP4byq0+LjyeyeFr9F0N/hqGU5FAAzoxkxj8ww2bJu3hXpKkvdqZ//iyiSLKshnc/p
         pMCdYB6+f/fpvxCtH8JHbSGA0ofDrUgxEe2jvYwnbOjMIbWRI5dvtuVJoR8OIar2xuPp
         DTzU6ueHHkcYuUJ9x75/v9u0uZUAGF0/1md0dNydUZX/NcRmCCv5JUBiABkxcqhXgCOy
         V8Se5Zp8NYyV+TcIbCv1zHlfZ4nXyvqEwGlO5L1yq9y44oqNF8Nbw6hgRX3EhfF7bqpM
         NrbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJpCfrwS1Fc5FcAJ03UFEHs6Bn01ys4j5Efy5ixuRwPgDTOEPZBjqb4XZBOrqbg+dAqXo3JfMnp4bIXxV2DFM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7T7gigV5XQYdG1CWi0BZ3wHm3Gl3YVl/fLYQCElt54K0d+QRv
	wiOdloXKGBcXUdanLL5gIyBLW60TFJ8hxpR4B/cfbNvs1kqDIvq+/VatN0vaZeS5ZEkkB2Z/nBy
	MeWrzDLPMqgMoorVIypzPKpbHXP471aug+y3PxAuH
X-Gm-Gg: AeBDievzdshyREPnJ3bGrDvO68blijQUlgxKUf9XcSwpw4ZLWe9snuMBboIqZGDxWqW
	TgOpEXE1wAjcRdh7C0BN+2XUqDl1cz826siGcWrjBpA1nzAqOStBGIywMxahPVWHr9youGEmoZ3
	7yww7CSaOodW0O9h9/Nv3rV3ZGX3T0NS5UH//KLvatm8o2AdSSYsaBZtf1hkD29bKJ7FzZoDWea
	n2VaBzQHhnlb+ksCh0Ka2cowcyIybDlSKGq4UNUgagSgQrUKwKd7anW4c06XWmEuQEKHaubcPwE
	mkd18Jmd8Hcvuv0lrDiynjpy/R2MccHGlwPzqWJtj0ui+Grm8H0TvptInk6pm6RmJUuoOuCBdDn
	1SIBZt1I=
X-Received: by 2002:a05:7022:6982:b0:12a:7181:2f1a with SMTP id
 a92af1059eb24-12c34e6913amr1222598c88.5.1775801945276; Thu, 09 Apr 2026
 23:19:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409-teaming-driver-internal-v7-0-f47e7589685d@google.com> <20260409-teaming-driver-internal-v7-5-f47e7589685d@google.com>
In-Reply-To: <20260409-teaming-driver-internal-v7-5-f47e7589685d@google.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 9 Apr 2026 23:18:53 -0700
X-Gm-Features: AQROBzBRPpJZPgQjpBAv368-aREu6smb9ZCYu5m57L8QwgeDzwSfvGQkv9qZv94
Message-ID: <CAAVpQUBvXC9TfmZOSNc-+aBBQVxJMw9q48Hchgumrp5FK2g8+g@mail.gmail.com>
Subject: Re: [PATCH net-next v7 05/10] selftests: net: Add test for enablement
 of ports with teamd
To: Marc Harvey <marcharvey@google.com>
Cc: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 7:59=E2=80=AFPM Marc Harvey <marcharvey@google.com> =
wrote:
>
> There are no tests that verify enablement and disablement of team driver
> ports with teamd. This should work even with changes to the enablement
> option, so it is important to test.
>
> This test sets up an active-backup network configuration across two
> network namespaces, and tries to send traffic while changing which
> link is the active one.
>
> Also increase the team test timeout to 300 seconds, because gracefully
> killing teamd can take 30 seconds for each instance.
>
> Signed-off-by: Marc Harvey <marcharvey@google.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
