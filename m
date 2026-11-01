Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793574947;
	b=Rs77ei/paYxtI+txN8JPWPrUQP68NTa3LHJjmnNbB022s8/Zo31ZEAMHPU1NF3iNlWD6
	 h00XTl1SfAQxeG6sqBP7iHVp+jdq03Mp57jdm7WB41ncwShKWyg5BEVrtMboi5KejYhTk
	 lZnbDU/rmLTs/OekbC/cxNc4yGw8XaVnNfJ6Nt19Ds811LPVbXZjxMwLHubwfCIVELKtx
	 Y63eZYUWPuPi8iYC/TYPQx39DJA27jKhhI9WUFPYjHUz702VtbiOnp8THK9H0Z3NBXpmt
	 PYvl797zfi2WjpE64ixlcuRNAdtgmSqBgQwZIHdM5dIpslb+avAyjFcbCAJOXFZjzog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793574947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b85SCZUlEMSxM24RW75vmTYnk/54bnSaR4ktiJzCCEI=;
	b=FG6aoCkGztWw3PFRKV0tx7Y04c/JuFxZTltVlosykK4m4Gvh9zy8l6NRcU+gNCZz2MD/
	 5DqUvFQ1FdOoR/tb+2JRzHf635AZ8xzDiYx4/1DlKwpm8eMbvQm+kXTempXKRW8875p3y
	 NYvZzzojJC+CErNO7j8T/uGwoa7HLLJ75PHalTvY7jbbkY/nIdlV9DzOAQP697bIwcapc
	 zvz6g+7DiVqePuQWNM206s/De+5cpOAGfW+jQ4S7C3Pc+FQ5F1B51BYDt5ALjTBaG//LF
	 Ms3/GhjLmDB8KPgNGjuvGY3n82A94vmFq5PaEbKltJc0V3Jg352Kl9Sgy6/KkY1lb6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hFbJtLRn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA123606A329
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Nov 2026 23:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA123606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hFbJtLRn
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so7167a12.1
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 15:15:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793574945; cv=none;
        d=google.com; s=arc-20260327;
        b=QX/t2CYybtgXch941UwxUbsGSBX0yvTP7XOf4Di4PyzYdwmo126FIiuszvKAkpjjr1
         mOha1WWdq6slh4aDDXPmmzaIS2EfMDTP0O99sEiWUeWcEDAZCu4qSBe1BNbF3AZNrvyu
         t10HijYSMvdGQfyzlHa38yizM0MRiFLFKVCGZ3+W+4BgACHM9qbluBhjg0zRCdeGGqH1
         s5Atp2IJ4Pk34W9m5Mkno1KMz1t9+ab6Jqr5zQU3eOBjt5lu04V1/r0XGFoRuIVvOfEW
         i4p9TkW6jULnnjhXwaNzhSDgGldXDpCNrXVfnxQGLpM+0iy5w6V/M/cqVNHeqol5aNQ+
         FrLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b85SCZUlEMSxM24RW75vmTYnk/54bnSaR4ktiJzCCEI=;
        fh=OXlFMiHxuOqiapHtY3EsXW2UeEvdOORI5sKev2DbsNY=;
        b=oHYb957xZu5nDaCQkY5jPnRMDn4Efni/6rCkbM2W5NAi/Os00YGjVj5lYwZ5yLm6CA
         LNdqyA08uGpu6qnAKZKg9umGLGXVgN8CZJYcmrUZUlD/0cQnGGK+pk9BbN74hdH5HVh+
         gp/Dmcq06GvX5jymvt1K8YQs6rIXhwPcxEVFbR1sbibURX5yu+w66nx6H+KCEdQ/xF8R
         +G7uPN+031vPXH1U2Q1dnC70kMmXzdA+SJm59V5k1YP6euuo+/unpjn+VHrz30dleurV
         d5IDUfN01EeH00+chTSRCZX7ZAbf/kIy4x+h59sdqlUmnrYYvyXLuD5pNKVfcctkNZkK
         KMFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793574945; x=1794179745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b85SCZUlEMSxM24RW75vmTYnk/54bnSaR4ktiJzCCEI=;
        b=hFbJtLRnNrWh9MczBVUqeHa6U6vBtL5Ropz9byKDoNLVHM87ltQr5NGlVo9+ozlqCE
         zCDbKcJYaT94e1dxw/Tl2UYTrALEmcu44Sdv+omfskaXW9uWk8l+BS5O+UYhaasoezsP
         QmUBkekyhVGcuiLRAHX2bsZXRHnGRLg08Qp+xKModUiXTfY2OCjYIvtANXAdTG0v4TNK
         zRLI7sKCdAUAyM0qQu3FA702xRVGzCQthGPmRzYyviVOrDfcPOzaWtJNM/ZhFIVN763t
         x+PQrfOvRfHZvM5mLxU1/1lHsxnJniaj65ghOzY5FFLgemheiUlWhWVkM5wETrQ0wSFo
         nFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793574945; x=1794179745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b85SCZUlEMSxM24RW75vmTYnk/54bnSaR4ktiJzCCEI=;
        b=OO3axuc3IP+RytNoyoYe0RtPhkjGXIFtHTQ8/tINaSiJ2WlQc49Oav6uPe4066UPgZ
         mo+7p0dRVShcLlcz++r5CrTn1DB2R4NysEX4hbNxn3uOKcpg5guH+IwIpiriE6xBZVAh
         lSuTLTH6qfHpAO3LhWVkDBA2PJjs+TbPubtgSyTFs3ilv86BNkOIBM57phNoIzFdONuR
         YCK0uyxko9ZVa4W2a9B1mpiSEzhrekutJ+eh4nd9xNCZCMMJLhsnlCc+yr9cLcY909jN
         l8j+3lV72uwBlVnCWn6rbdvL+RhHeU6QQoLoDYN5/cdjRvBZqNiTokrpMUc92S+6uaOZ
         hmjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpsltRXUQ09Ny5MIPaPF8dt/TGmKL5Z5+DXfDJ87EMiaiibWItxxq9ePJ/xOGZUghLWq0IeTmioIcL607pmw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/c1DWES3WWn5p9ohxfgjkaseUg/QoXckJ4Fe9ck4Y5uNRYvP+1
	guNaE/qIs1fzp+iahdGa1DbfWnJhcJ7nbP2UPG5trmxfVu6Od9R+LPDDUSyRzmeK6aEsIG/bi8A
	6GlalhVkhaMlkOE5yjGHKMUb5CwssQXhOtZtjPwdZ
X-Gm-Gg: AYBFou0hqUXPzWHWmbvSqxaWb+CnpvRFKKwhnJUHNTwt/SsAnV9MUsseSorvF8Ep31P
	WKA5YQrfmfOjv2nD2AffPSYcdbIsLyYwKxSz8P3tQWXNPP8u6cJ7PNgU8hAf3WSMR+IQwRHjH+9
	7PZQ39JuQ8urQlCzAjrOYH3lWgCeKlVwSK16x36y+TC0Ws6ZzyPweIl4kntfQDaw3fmHSSO6kNe
	Vg3+FWw4qF08o4s0ex5J/gM0nnS+dGof8cFyHeLgRjjyCQbveUV4JOirzkLdyOTXNbWv1benkp+
	Akwj0Z+j553zVg9tEXpWqx1njPRD+4e/D0qGpt2Qo8A6nXE9S4i0GDb4pQGNmg1nPaXpFxgutiW
	tbeE/twbXD9wZwKd7Cj0xKgOHLhPedZmKxnDszIM=
X-Received: by 2002:a05:6402:1a58:b0:6b4:880b:1b61 with SMTP id
 4fb4d7f45d1cf-6b4b3cd2861mr242904a12.12.1793574944562; Sun, 01 Nov 2026
 15:15:44 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030083539.777877-3-almasrymina@google.com> <179357408360.3131.16098294926514442303@kernel.org>
In-Reply-To: <179357408360.3131.16098294926514442303@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 1 Nov 2026 15:15:31 -0800
X-Gm-Features: AclHuK-UFMQ382VldDl9mQXawkR9RuLEX9lDNBBCTFPZuNPb5GUS05WDrMHtxpk
Message-ID: <CAHS8izO=-DZzaeFbczj=c5yGszo6parXeQNqqGV8oieZbmMW=w@mail.gmail.com>
Subject: Re: [PATCH net v5 2/4] net: devmem: detach TX bindings on NETDEV_UNREGISTER
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, pabeni@redhat.com, sdf@fomichev.me, 
	kaiyuanz@google.com, kuba@kernel.org, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, dw@davidwei.uk, ap420073@gmail.com, 
	davem@davemloft.net, edumazet@kernel.org, horms@kernel.org, shuah@kernel.org, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org, 
	andrew+netdev@lunn.ch, sdf.kernel@gmail.com, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, daniel@iogearbox.net, razor@blackwall.org, 
	tariqt@nvidia.com, kaifengw@google.com, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 3:01=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] This patch's TX detach is incomplete.

I know about the issues with leased devices. That needs a bit of a
rework, which I have done locally, and would like to send out as a
follow up fix so I don't hold back this series.

--=20
Thanks,
Mina
