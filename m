Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C29239F174
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 18:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782932011; cv=pass; b=D/cjTFq/BL18NKhX6oZBK7MUJ5POmD5bZepJBe0cS9nuZtrcMS5sBZM7nuzFQ8feE2Ds1ZAIH3SxIqO5oXjwSLV4m7bKhaAtnP5OhuMLTRbePrCA/QKxAdLoJD1GAyNoWMhsZxH04OSwCY8w3Zjx9cwn8fyuPAqWzU+kc792rFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782932011; c=relaxed/simple;
	bh=H/aIKbCL+2IFonNeWBah0r+NuQqayuH9uK7OeGzGDhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKp1uECYRcL9D6WAdEZRWhoIz4iwWPRKoTmQAkEl9uCKEwxv89wXDh+pT1c5/0j9L5t9eevj9T2wrBZuetFfunvMC2zcaW+kxSXjYTfW85bSdSAQm4Mk11MYH318bsd2d0UJJu3THK6BXVAwVCPcJG45QJScgTWZ4XI5Y+rav+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C+FhZm/s; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C+FhZm/s"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493bed621acso83785e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 11:53:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782932008; cv=none;
        d=google.com; s=arc-20260327;
        b=dEDcrKIXFxjesZ80rAS28xQSIPZjNb4P7M5oCIoLolF9yzu70Lu1Joxwog5BSll+SS
         0ZatnkMdbPz6Mtbx+hGdcBfEbRwBqob9nr8JM7ipzWt/fBujPNcFGlMiKrSAlfF0xmUG
         MT4YU4VTuU4ABBHekl+L2407bkppeM+IRugn1hdc+9LnNEXWkYV8wqEAgQ5gGHWzROAO
         wibsf4xfdFBo1va9s4a5HG8yj3hE4eB3PJaUkQZIF5SPWno7ZnzgWr6rW7MDHGkcLIZA
         RXBk5Tv/smbAkgJT55OfblR+OQQ4QJNnV2Tg62YTWMk1DHE6c1ZW2LqMOh4FuLwqReeS
         csKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H/aIKbCL+2IFonNeWBah0r+NuQqayuH9uK7OeGzGDhE=;
        fh=PfSrbO9ctwE94Ro6A8p+Ekxc1Nl52DSSw4BSuNZp+h8=;
        b=DJ+6P2yuE7czS2rEY8Zd8aFRtKNktf3JWF3q1i+jd/W9xeQ3kZBXSPGiL4QUJ8Pp6Z
         DOhS2BwnH3n82LkveIKx0KYnIFuwNTSwXa6SFEdhHUOd5i1VFbOHuNquWOM3Cm7dPBcZ
         41zxbAW2oHDJU4ImG7n11+k70d1Dvq8A6js7V23I00h9Ecy1En0lexE9UNz6qXDybWtv
         2h0/FtxBY8syh4X5vTv8v8C7jlv7ropTFulpPSW7POF8zARUiMQT28IaxaCOArKT5cCl
         mOy5QaBl8pNCCcyL2MQwSpyqiOQRu/w5tR51WjdFjawPlCq8RF1kGRjjVkqwySYfvLFw
         vOuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782932008; x=1783536808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H/aIKbCL+2IFonNeWBah0r+NuQqayuH9uK7OeGzGDhE=;
        b=C+FhZm/sDu3GUp4bC5TqcMGKjddW8eSQJplmgr3gWh/oA6HT2H3Sbzbd1PdnWx/Ldz
         7kFy9oQtdmlZgXSMz3XbxUv1AlYPe6ApGHQzeV3OMSku2GiY+hLjS0le5Xn2abg0ir4K
         EkURVa95OgERswqcs+CtdezlzPyD3P5DgFopT40L34ASks2HuajkrlhjzPsgQf6eltqg
         mDwHyYFbE57qrhYh0ba6Lo6OZTkMqQBvDFml/Zutls/h5rh064CzabJ2jkx3ndjM7VVi
         QhSNO8rHRx4NMA3YnYQGtIKJu7G9c70QUziBeDuoOxdNu7KAHMgG0gyr9m2Raocbu0m7
         1zBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782932008; x=1783536808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H/aIKbCL+2IFonNeWBah0r+NuQqayuH9uK7OeGzGDhE=;
        b=QzR1vooeiIBvLjRBCHP/1euEpECR0D9lavIvEdm0cdnD8f1w+u6EP136EQ7OreiUmB
         vdwiMcjiNRUqARKfX9xOsWunBiDlyYD7QMit27t39tjCfkZHovmszyR517dl/NANerMn
         aYvfmrvLl0GAP2YfIixEHdGSMZ6lV8+xJr3r3UZzWBqviVAxTKdXIRPnN2LbmOz/ly4/
         05UybdUp6pBEcMQxdYt9Zp7HlGCXrQDem16fz7TO02VAdsSAU+8pJIIBurGdjhM93W2v
         OE4Voqb8nG32soIbU0nvK3AROX8FY9eNQhctbad/ck1yddrKH2J7SarRHQpU21jGWJgZ
         BIZA==
X-Forwarded-Encrypted: i=1; AFNElJ+f/FZCnjQwFxc9Tc0H3SySCJTy/I7pWJqqBRYqwGyF2PahQxU4jGCywvVDHMFhHqpuI8SvpdpqFntU7sss6xY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXzpkSP9oLRiogzugHNv0yUvMzyfptvP27e+eYmDIGnnhs+CsR
	8nDnX4Q9i2i/ilREctr9F3smqUTt+O1hYecZwygdvB8SU39RgYbnSL9e/YsoZV+I6tCbHW3/oOm
	0U7L8TW7GfAJfsywS7Hkpu1kDn/gz6r+T2RmO54IP
X-Gm-Gg: AfdE7cneLKfw5d5ZKlkAGb2PelYLoF2Ftf6wPCwUYTK97lQOD4/gbN9ERc9RtudZ1sm
	Pq5YrqAhFwC+vPEuzdC5wd+O8921g7kq5hO/JvCuEZcTDzHweqHxjzIGVqvx8EVuCBakttN5prt
	Y3SnLmm0DRXlf8XBJ2X4BAAeW0YJRWyEQ8uPW0YNBsuRv/ousuCG2I7389q/R0gP1Wq2aejXU3k
	dwGVQdtKz+XAvffDmb1hGzQy5NxyolXwh1SW+6sX2fz+xSooWapvn6BYNXThMGXS/b3fXHPTrEJ
	TldwqGEeXrzbsg7h3Of2vMr1PsvDiw==
X-Received: by 2002:a05:600c:4c23:b0:493:b169:784d with SMTP id
 5b1f17b1804b1-493c0bca5fdmr869295e9.8.1782932007620; Wed, 01 Jul 2026
 11:53:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625181557.1086105-1-tjmercier@google.com> <20260626180941.45158025@kernel.org>
In-Reply-To: <20260626180941.45158025@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 1 Jul 2026 11:53:15 -0700
X-Gm-Features: AVVi8CdF5Yb3z_aT9Z2kMSch_xL019u4GW2x7IgXTq3gEFLOWfvUzwhUO6mpfb4
Message-ID: <CABdmKX2oG9m316hiJpSXbujrT3vgE5hUpzH_WHfjNxBJ1_+BdA@mail.gmail.com>
Subject: Re: [PATCH] selftests: Open /dev/udmabuf O_RDONLY
To: Jakub Kicinski <kuba@kernel.org>
Cc: kraxel@redhat.com, vivek.kasireddy@intel.com, 
	Shuah Khan <shuah@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 6:09=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 25 Jun 2026 11:15:55 -0700 T.J. Mercier wrote:
> > Write permissions on the /dev/udmabuf device file are not required to
> > issue ioctls and allocate udmabufs. Applications should be opening this
> > file as O_RDONLY. The BPF dmabuf_iter selftest already does this. [1]
> >
> > Remove the write access mode from the drivers/dma-buf/udmabuf.c and
> > drivers/net/hw/ncdevmem.c selftests.
>
> You need to explain "why", too. Why change it if it clearly
> worked for everyone running this test until now.
> --
> pw-bot: cr

Principle of least privilege. Folks use or point to these selftests as
examples, and then wonder why O_RDWR doesn't work on systems where
write permissions are not available on /dev/udmabuf.
