Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3B0361DA2
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 06:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775802824; cv=pass; b=uYGiGU4g/GbuJtU3Uaa6PDuwC68djGl9a21PbmKP7flRbex0fcMEnbB5AU+TF5gmsjabxe6qrMuVsz4tDrOV13L/tWkrNHkLzjf7A6saukqJPt5hCY1/TootmKk7uoig/edvXuhdlEu5nBjNMRNCYffNOljhn1BBnzylvuR8XaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775802824; c=relaxed/simple;
	bh=+eMA8St/KaE5nhFAtGv0hj0vtG/KMVkRHJ30gMSjV7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QwosIe1AER5AtAL202Y1MKAvi5WI5UJh3JtQgOdrABzh49N07pRWScaYUQO84TIr65MesFN8YXvbBQEeD8BHsugo7mw4Ckpn32Y5n1zi8D5wmjxjhP2iTvQEWgkIKC2E/VMrSJ2AsWLXaREbTagpzaVlE8P/aXGzZg5BcSI4INM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FheR/kIM; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FheR/kIM"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-126ea4b77adso9772941c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 23:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775802823; cv=none;
        d=google.com; s=arc-20240605;
        b=h4R4EKr0kt6x6Jp2xq1YXImAU8c/RrLAEOwXdTsoKqXfzEXFL9hvner75QgRnbK0y0
         4YxFwSmAxS17wCcwOMRS/DynZXYMRk0Hwep29vLuUXQf/xKzzSJr2MnVSPXqxKBrfsdp
         9r/izbRSZLrfRGSSTweSCHJsgoWdU1m8FqI9BNeg/ukMqdu0Eb78WvnSDDgf9y1TPpFn
         i/ERpnZ2SkH8Sw22gq3peWDQPg+piuBc8vKSOSZHY+oUECMDdrIl4y6oj8upUOJpLC1w
         uoOu/V6OfNl/d6HaSJXdmayr3ayqsn33crxNjQ+JUs5egfY/ovgnA9KU683mbv0DJ9EB
         oMuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+eMA8St/KaE5nhFAtGv0hj0vtG/KMVkRHJ30gMSjV7c=;
        fh=dsWbQ6eDFL3PfvAQbC4gzsR1eHY912DHGbd5A3M67bE=;
        b=DsaYDgV063pFvIXMFoKp5+/940HsQc4iBWfd3sz6QxOcYgEmdY2rtOzhH/P2k9Ml/2
         L6seaf4QxmNasj+1BbFosu4EUIj5r5Fh/n3/T+d22hc1kp3v7c5RQ1C2hdUt9pImkFrv
         JrYc4iorKtJMvmpIabOABGZxOsWr8RNOm73TuhX3EGTjenZxkZJWmCUPl/i4ZjGlITDX
         V9Ak+pIRHNvjSbPSD1WkfCVG55JgPI94rfijfYLWk6Avb2DcYhdEP9HJ+NJEHJ0Yx3fy
         naIjEImVRNaT82Ax5rw67t6sMnxNiDhUggL3eIOIP6g2MCCtHfVDBBeW4R82bsqP1+KG
         w7Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775802823; x=1776407623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+eMA8St/KaE5nhFAtGv0hj0vtG/KMVkRHJ30gMSjV7c=;
        b=FheR/kIMoTH+ExRglsdqhiqC1TFbkWjjRcr2eWQ90UOURVEh4zzaehOPjw13H1ZPgt
         csJIR7EO7evXD6UkxE8d33sD/mMCMCsGM1wMpKGcFqDNyz3iSUdi8qd3cyc0ZVQ5EToD
         nzB52wgc4CPaizNC54Z3SVNH5SEl1EJvf59d5sz3jO9pTLj6ofGAv7bYV/SoBCdkAKYh
         TNoIU0oX3GYa3eqdwvi/tKCZNqBer3BtNAki0dQ1/WdOKzRJe9v4WDOUL9GB+SimOQ7g
         oRt/JpgIe/IYr4F3HWO+rSVsJPhL4zkf6cUH/nJcn9EggNEZndL6WE74hjWsrd7V+jrY
         SAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775802823; x=1776407623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+eMA8St/KaE5nhFAtGv0hj0vtG/KMVkRHJ30gMSjV7c=;
        b=eFBcZ2MLKFtIk/ler5410XYIaDVINbIUD1gXqpaYAPy6XBF1q+WmdzCGJZSOyRjqaM
         yVOUA0QVT+XEdMokDIDyL8sOrNjeqvMXmtN4o9cXX8GhbRKLlsrAqQL154i+GaWmQ0Ol
         PBClHIGcE8QM6BCVMeYlQsaoGK1+TNVJ1Z8YLpUWLiuKTnX2Et5DUR4IMOmpugg0K2Ji
         2XLOoQ2vqY6uMJDMkBmZXMIY6SMW9QTljBT+Rp+obl+rWIiw/LifNbTnag0fIEM/k0E3
         867wgZ/ZhC/4LBKuOIN5hZVocqsboG/HrV+ssxZLJJcCDfYlL5TnZOolHf4gqxhtSMbS
         dndA==
X-Forwarded-Encrypted: i=1; AJvYcCXTqGtacDpecrbCcA2EH6zlXTYS3f3kwTkQgK0G03+U5uyFUtab6xE7EsKA8zsjMsQa8GFFESAZRjeHvZDubQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDhX+b1bJp9hDUXiFXNU0N4fZy4Isn4lwGNnQKCu3SuLF21Lrs
	6TRRGHjd4RdzC35ZpWUMuLLGJABJsKWK78sb3Cc8938ibNxa3xXk5+bJqwu0ikXV3BsXMpS3s/W
	3/PsduSmkXbrbILsRv8nLNETTI+KwMJjM6IaG7vfv
X-Gm-Gg: AeBDiev34r9NZW/i9NAYX2wzOg1xv9Az2CxJz6Yx+YLuCnfqEhH8wpKBWpYjR/LrNzN
	GcLqUDB5JPW83HUpwJvm7E52j3r7wT4PgGrvs46a7oobebDYtDZISXZT3mEQXE/DwTY+Eye0WZW
	HVgDvNLmV9zgYI5awQfqYmxhhpU9wk5VunqUqbC/yCV+VANgiR8UV/6flPGgVsFHKoBz5ACF6ro
	FAFOMOw7W+4Pe28iPsTm3A6wbKtfkAl67ApBIEqJEC5VyWGvTsG1yC8JlVsRQqfFlfqNUvL9V/2
	fu0uwsED8dyMwLE7vm3qNHPLYIt6zQ/YERZoBRShmolFhk64RFfshTGPRHnsjWyiYMoMy60zGeT
	WxTN2Adc=
X-Received: by 2002:a05:7022:23a2:b0:128:cc34:35fc with SMTP id
 a92af1059eb24-12c34ea5acfmr1232751c88.16.1775802822276; Thu, 09 Apr 2026
 23:33:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409-teaming-driver-internal-v7-0-f47e7589685d@google.com> <20260409-teaming-driver-internal-v7-8-f47e7589685d@google.com>
In-Reply-To: <20260409-teaming-driver-internal-v7-8-f47e7589685d@google.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 9 Apr 2026 23:33:29 -0700
X-Gm-Features: AQROBzASXHaWSXdNwjuGGPzAUgyVMWGp4TJ77-CX_MDIH4j4gv4uMo7rYS_xeA4
Message-ID: <CAAVpQUDD_+yprfOX26xshF337ZTvUELeB55rUvZS6J08S6D4Yg@mail.gmail.com>
Subject: Re: [PATCH net-next v7 08/10] net: team: Add new rx_enabled team port option
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
> Allow independent control over rx enablement via the rx_enabled option
> without affecting tx enablement. This affects the normal enabled
> option since a port is only considered enabled if both tx and rx are
> enabled.
>
> If this option is not used, then the enabled option will continue to
> behave exactly as it did before.
>
> Tested in a follow-up patch with a new selftest.
>
> Reviewed-by: Jiri Pirko <jiri@nvidia.com>
> Signed-off-by: Marc Harvey <marcharvey@google.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
