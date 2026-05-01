Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1273DCDBE
	for <linux-kselftest@vger.kernel.org>; Fri,  1 May 2026 16:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777651911; cv=pass; b=PVxlMqKDETlhyKxaScEcEdRmidljkFAZcaseCZj5xDB8/WU/6y0NmuM/VGiuo2WQ+veOao+/L+W9Q1/ApDSh0jCMw83eU/vy4ZX0YBl5NYlyH5sN5OCxkY3gBmgQyv+Rw5weQ16Wsa9aA1MpKyIIQN/cjq2e9jkOcK07ZcoM6Go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777651911; c=relaxed/simple;
	bh=Lg3I4a5CVSLmEfFpzSrc+IJ6RbdpOOFMUy6frdtkKdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cd3LyxnBnolhtxiP+MgUaVi1i23dPOFrVeLSSy8QXQJLmmqrGwHvbhrHwnCOdXSTWEE7l2i5/zP8V3bJBz9itYvG1PpAdN/xlLlleapUwsxQRQLYskXHLFbcHsXzftn5eBLPMd+QIxj7usm6LR/wMRuLsuyFSfO3FfVEbMi6Yb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iuDKym33; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iuDKym33"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c565dd3a7so2914419c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 09:11:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777651899; cv=none;
        d=google.com; s=arc-20240605;
        b=Ni6KszBoWmZ7a2/ts0al6lnq5HNWgdrJg79M1dOWHP4fkkp3E56pCMNpWybMJ28Vi2
         /bSxHw2newJV82x5NM3yZmTBNwGHuzfJYEtYv9x7KXYz8ppVIY/CnaN3dZu7y1FYaR1g
         OM4saqN7Bh5gOiUCT8gKXBGK9LLwNv0xLNVr3i8uEHz0PzUra52D75lk53ZN/nMg/3fL
         4QgOQebzcCOvqPWdjGGDqHmww1QAivibeaRGPhTDUW47OSBeUvB+JOyQv3doscGXApJ/
         rBf+P1dWAEcfxKeWyxTJhfrFoCZFXMFILo8ruA7Rg9p7rmC5mU3ZaejkpHWRDlptGXeI
         I0JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qUtLnk45BiKrXHINpVcyMQeBwCn16A0KrBFa2QFTWtI=;
        fh=ksWM6LRN6NKxSea6MU/JRFas6i0XbDloxNKWWLIdlZo=;
        b=ABJ5t99gUsxgjAHPBu1qDGbIHIzutTGFvsHVNHb/S7s15al9wXi99SmwMZcwDzo7ie
         wPVe2dKsL3wwo5MR8OWybQIch2ITbMgB8kXnn/bhpBG0SFaQQAKp5UwL5eALo7OJ1tEK
         QS16dCd8/GzlQBWPKbhBseTSUxJ3Jv9EfnDrWx0I9GfkfZUVRHrK5Tf2/KGM+olu+M5Z
         GMKc4S3OQZAKCzqIK4l18cU5gs+B8CQyeg+U1Sbu8R+bpurwEPvPbE1TE/LOVGmgQZP8
         58POuPxCJhi8LuBSX5jtLNhFQqABNC0dMLhUtTS1sd+3rjO+yTss/fmQYwCpZOovhlSl
         bwZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777651899; x=1778256699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUtLnk45BiKrXHINpVcyMQeBwCn16A0KrBFa2QFTWtI=;
        b=iuDKym332S3y8j2Dh8gx5+R6x5q9ow83jxo2eSebtwLzoL7A08OmajBfhFzWCdKifv
         tSC2/qCqb0EUCeKQDXArWwsFbvxZshdj6+YxZkOwWJCHAlm9NTkqeDbUD5DhrBf+uT8b
         7OVSxiC+3KhCsYvtennSRH1IZs6NYrEzCC0WKMmPy12hYAmghoqQEMvJSKgRc/MER5jp
         SdoEm9F7/eDVT3mm6gVwb+36REfhqT1KtcCZSynk5T8jlVrrv2iHBADepDV4W4Fny6Ce
         VqcOd4HzKiBmsbe9OdD/EaQKN8No8kqjD+EfMrTpOxVlFahLEr+8c0miMiEYERdd7FJz
         H1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777651899; x=1778256699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qUtLnk45BiKrXHINpVcyMQeBwCn16A0KrBFa2QFTWtI=;
        b=efbcDIgBDrUEVcT6QwPUVcKv+Z6pdOZ1RAxaWRgAacND6/7vcY004eOPAUYcW7HEep
         M1cuVrTI+cX0F1VBcfUjzL+FQpOOvThhdQYJABTwfzpDKETT4bfxxy6QTi1sSfpRQjPV
         NWAG49UhrnLxXg0qL9rl5X02S9MAI1K3vaGU4wyPOIe4OytdTER84ASwvapia8OsM1Gj
         SerB/FEpuY46nuFjBisWlm+1L7ogK2omMfuGWwVUBEqve8QzM4Cv8RTHX0aR2ET0Covn
         21fx4nLpBu6g9b9iTuz5nYlw+/ZOvgwFlED0JNKG4QFgKvSC6blQZgnwgqje7RromSpL
         GZaA==
X-Forwarded-Encrypted: i=1; AFNElJ/fgXQwOnakxpX8qb356MtQkCku5tdvSoaYzQzULc68hUlPMxdvuXkawRDsEd09elIe60SAm0oYlkEzNrcmix8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOJ2w1mwJFx4ZKGmLheyhbf6KI3Q+OQOOi9rr1A2V0XrfzOc5N
	+S5/65L1s9yxTGPBkmIowY4UA4RKYca2ua+V6wU+Saqj4aidwwvVYn0vTvdM7OVGmZhGfY6qVLM
	RsAczYiuIOG4zdukSXYmUhRE7nzsM2Gen9Uqa/Ocu
X-Gm-Gg: AeBDiet0Lu4gdiWemWh36COk7+ExUM4o5AMHvQSJCLuQTInT9wnlMfEFh5gW19WdhVY
	Zkj0dOCd61uiOq6g2A1VfHpPNQEwYfKO9PuJZPZUSiBamdXM4GBD0Qe7Ms9Z1Qiyg7sSxdQlEik
	ugkoUOCzEgrTXrDmsTP0k4iYrEsGRViXFvaTCnxmCjXvUy7IGEU0rzewUasj/36mfFFFAgtG930
	lCj1iHzqOtyGRfYGJDy22TgRp1Ep8I1q8tMhmxHT8ILpMpS9YDwB1T8i9yANiUZ127e7icRU2/d
	M4RxOw++MkAh82AE8+PY0vG1h0zO6L/UY6KFoxFV
X-Received: by 2002:a05:7022:423:b0:12d:e126:b7c8 with SMTP id
 a92af1059eb24-12deac411demr3607716c88.13.1777651898369; Fri, 01 May 2026
 09:11:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0-v1-dc5fa250ca1d+3213-mlx5st_jgg@nvidia.com>
In-Reply-To: <0-v1-dc5fa250ca1d+3213-mlx5st_jgg@nvidia.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 1 May 2026 09:11:11 -0700
X-Gm-Features: AVHnY4IcOZBEwRDeFauz0p7wo2ItTFGZpUDr4nDVbee6fBs6NBQ1Q0W5r-m7yp8
Message-ID: <CALzav=ci8bi3=sY+F3HJTB5sOQ_pJ8Lm+kz0CDBBWVXry5P98w@mail.gmail.com>
Subject: Re: [PATCH 00/11] mlx5 support for VFIO self test
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>, netdev@vger.kernel.org, 
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, 
	patches@lists.linux.dev, Josh Hilke <jrhilke@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 5:08=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> Add an mlx5 driver to VFIO self test. This is largely a remix of the
> existing VFIO mlx5 driver in rdma-core. It uses an RDMA loopback QP
> to issue RDMA WRITE operations which effectively perform memory
> copies using DMA. Since mlx5 has a stable programming ABI this
> should work on devices from CX5 to current HW. The device FW must
> support the QP loopback configuration.

> This entire series was coded by Claude Code in about 4 days.

Very exciting. Josh Hilke from Google is also working on using AI to
create a selftest driver for Intel IGB NICs so VFIO selftests can run
in QEMU [1]. So it's encouraging to see you were able to do it with
mlx5.

[1] https://www.qemu.org/docs/master/system/devices/igb.html

> For those interested, the flow I used was broadly a prompt sequence
> sort of like:
>
>  - Hey Claude, go look at the falcon series, VFIO self test, the
>    mlx5 driver, rdma-core and some PDF documentation and make a
>    plan to put mlx5 under the selftest.
>  - Write an rdma-core application using the built-in VFIO provider
>    that can do the required memcpy operations that vfio selftests
>    wants.
>    (This resulted in a 1k loc C file that compiled and ran the
>     first time but had a few bugs related to device programming
>     that the AI resolved.)
>  - Replace the rdma-core components with open-coded versions to
>    create a fully stand-alone program that does the DMA memcpy.
>  - Review and audit the thing.
>  [Pause and de-slop it]
>  - Make it work on a PF too (this is surprisingly hard!).

Can it work on CX VFs? We're interested in continuously performing
memory copies across a Live Update using a VF via selftests to
demonstrate SR-IOV preservation (when we eventually get there).

>  [Move to a kernel tree and copy all the .md files and .c program
>   it made]
>  - Hey Claude, look at all this stuff and make a broad plan to
>    actually build a VFIO self test.
>  - Here is my 1 sentence advice on what each patch should look
>    like, make a detailed plan to make a patch for every one.
>  [Pause and polish the patch plans]
>  - Execute plan X then commit it [pause and de-slop each patch,
>    repeat].
>  [Review and final polish]
>
> It is based on a tree with the falcon series applied.

Thanks for sending, I look forward to reviewing!
