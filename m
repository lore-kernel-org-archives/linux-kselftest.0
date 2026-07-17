Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A4842A158
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 16:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784305795; cv=pass; b=Jmg2Oh+JAXNovZL3dE3kzRyErY6iHNhmgK4NDGcKaYfRCRz7E5T3w7K9l7tk8LQp0tY+D2v4gIteMnKG0FhrgekJWTmP+0gJuY5ZKf01WtomF2tYhNwqTgPvtGPjRYnxg0M9kT9SaxlXR+/6hMU8P5mjjE93Q0GRzEOKZZRfexY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784305795; c=relaxed/simple;
	bh=KEIvrRuiVrT7+dBXuaA0uQ4mV0n5hVwt+9ry5LaCeWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YWhuWdBlss0WAnzugK0fjqQHexTLl1w83CZqi6blD/9CAwHDUpbkqOW5lpVq/Y7J0eUM/RQ3lydMt7R7lr5iIAAh3OGL81fll1u7fbgIOQbQKZAeGfZ6pBLd4/OLfasn9RDG1m7kBBRWk0UPVVV+6wWiTWCRpgx+K3fUsCNLeeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S8MJnQKN; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S8MJnQKN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b8d99342so69855e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 09:29:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784305792; cv=none;
        d=google.com; s=arc-20260327;
        b=lfr2Vk6fhUlIHEb8/lJ4JzvNpZFwod25aupoSWt0EQeGIOZ/NIcE0dQFl+uSAEfKg+
         x3Vgh042MmMANKTS0MMKlRZgn3C+N4TMZqC3mcATZSRb4Wxr+5VNmjgi64gYHataebmz
         N193vVUgk65ijWSGeSKfBoXlgu6oj16oy6R/hbXkRCVesKSh9tE9MJYDEYfnbzCeZ5wg
         OyXf5p9tGm/FR6ND7R0KovqX437Kcr1VqcFDULcQuzj1nlGgukGGyWiEqt/OqSJmpgNq
         OvkatMK4JNLL/wMwkPfXP0MErvozXPzP2v6eWyiZ7m277FIhMKjz0DUER6yuOiHGDgxm
         HZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J1fiEC3LJWgMWiE+exeLjiuwsjKxQMa3Wx9AO5yvpjU=;
        fh=ffb4VIMuTPnTAI8m5olGOBAyJ5OTgPCaDFiqhbEtdfY=;
        b=C4hx7Au48QRtcadgDeZtLk7ROwNcTZfkgUjF80lX2jAIAx2vrXtoD1cl2xddLD6HqK
         ni5hIevGLHlFwapcJuB1Ctoi68EV/WOleQh6Bn+1O7Osld2atQqE98KGLEfwb2hZEMn6
         6+wEryd5No73UMSZl46SV3YEDN9z5D8L1ygMx4geP+eFfUvN6vOqk66z0IuzMWJJ8scd
         +QJIm+Lb3CXCZdQ4kU4JJUCvggzYLCh+AHWdK9ksNMBAlRWWvz86b6OxYLZ5tjiuPPIC
         LUfY1IGctrjgOe3ly0XrMLRKbGgItoRZzA325TzCRLdqzmNxUJ1UYjTTEuMsZXUjwh5P
         jvbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784305792; x=1784910592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J1fiEC3LJWgMWiE+exeLjiuwsjKxQMa3Wx9AO5yvpjU=;
        b=S8MJnQKNYccXw4Y5Od/y+J2pCzhZWqz9sVLvf9yEL0ufe56syjqkrFUKdAXq7WlSiZ
         gukEMrb9o58yk60AdcKxVpT/dXWyWCWZU/uH0TQbQNiAmWBeFOyErWjaisWEhNyDjSFm
         mPmr2BsCGS5HVCAINBA9fyVBXgDlC5aPBJaMVxqT0QID5rjScWiyvCOQliIT61nugJR2
         jLQmmK7ytITgts+XDdTH9EgtUvUEhVkg4LSouOc5ki+0Hxl7Ub5btdpXEOWH3EhqInQ/
         Gj4IB4vQOEK2V57FIS8Y/DNMDXGazxDGkhWCfq96xiAwBPHmOhVPe8vAGaR9wI+HVu5K
         HRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784305792; x=1784910592;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1fiEC3LJWgMWiE+exeLjiuwsjKxQMa3Wx9AO5yvpjU=;
        b=q7O3YCnVk1c/XZqm/hDofRd2Q0Gla5L1S8vlJt7Aiz1sRx4ZuTY0lahg0NVi1uJtcG
         5qLm0s90qf8Hncbd8Mb0qQHt4e85unH+AnJwvtM17X3NbcMbOS+HlFbXn+ol3rBQXuKx
         M9sJGRiWlb3HK3WaKNaUWq1WHZsezT4AggFQqik6HChLLH5BYbsvexQ2NjGq3Q6TvMUc
         VKegGy0nzXHbSIgtFWup6N5PDtQ2uPyAN7Ihdx7Yp4Nr/BLX/vKoWxrB7ButjZxTjATw
         Cq/adwgpypyfCuex5Sjo/2avouW6nl+h3ksZbQsImIxFDO1q0fAS4CD9ldXqOm7CJveA
         GjMw==
X-Forwarded-Encrypted: i=1; AHgh+Rr7AhpFKA3Yu0liF602iqvZxqYTI2Cs3sjPaIyB7C1uT6bppBYE2ryjSIbDi/B5awSoKaauKHRu2vhKDo532PM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEzy3sLTTj0OakpNkrZ6LQzva8DybiVCLiNv3z5LAPXz6l3nNq
	s+bg4dHisyvCBmHh/K83mh6oWJ7H7t8ylD8zQ7OSPosEOWvTe/yahERRJ8DYSLRWYu6jQ8tz3aZ
	C3vlXpWZ0z3rM5ioDO+g/0VYKT/bF39zkRm82RDJ1
X-Gm-Gg: AfdE7cnqWFPw/u0Axor5FbQTUclqHA50CSDYvsTs4DvuY/e44fP8F/NzlGXS3vy6VGB
	RXLUbYEBUjrABjr1zuo38dwPLA91f7smlYZ2jdWipkL4s/9GQUjn95oNQk2L27BZVm6QSf1jO0b
	n9FPMKr228nHtHvuH7B/HPMx0CL3HfXjh5ilkN9KIH5EixkJdpuUFuWF0eisQMBElpHLbo/AqJN
	+3uixO9Bs+gcoiTuW1SnE8GYHjLlMeWZqolWub2/hs/O1KG6HjGWkO7TcF8/5Y4foPO4Gn1ZcHl
	kMJkrkdoUFL5IvtwH0FbfSKvP8Q=
X-Received: by 2002:a05:600c:41c5:b0:493:aed4:8d03 with SMTP id
 5b1f17b1804b1-4954f623a21mr164335e9.9.1784305792127; Fri, 17 Jul 2026
 09:29:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701192210.2997769-1-tjmercier@google.com> <akbPrI67h5btdI44@devvm29614.prn0.facebook.com>
In-Reply-To: <akbPrI67h5btdI44@devvm29614.prn0.facebook.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 17 Jul 2026 09:29:40 -0700
X-Gm-Features: AUfX_mwkE9srLqf9jV3ClopD-np-tcerODpRpCcyM1eqJKlhjubKKS2HeTkHP3I
Message-ID: <CABdmKX0-tubji_pBiaZbePrxVLA9qkw5ez61wyzjDz8-pko9SQ@mail.gmail.com>
Subject: Re: [PATCH v2] selftests: Open /dev/udmabuf O_RDONLY
To: Shuah Khan <shuah@kernel.org>
Cc: kraxel@redhat.com, vivek.kasireddy@intel.com, kuba@kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	Bobby Eshleman <bobbyeshleman@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 1:53=E2=80=AFPM Bobby Eshleman <bobbyeshleman@gmail.=
com> wrote:
>
> On Wed, Jul 01, 2026 at 12:22:08PM -0700, T.J. Mercier wrote:
> > Write permissions on the /dev/udmabuf device file are not required to
> > issue ioctls and allocate udmabufs. Applications should be opening this
> > file as O_RDONLY. The BPF dmabuf_iter selftest already does this. [1]
> >
> > Users are pointing to these selftests as examples of how use udmabuf,
> > and encountering permission errors on systems where write permissions
> > are not available on /dev/udmabuf. Apply the principle of least
> > privilege to selftests which use udmabuf by removing the write access
> > mode from drivers/dma-buf/udmabuf.c and drivers/net/hw/ncdevmem.c.
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c?h=3Dv7.1#n49
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > ---
> >  tools/testing/selftests/drivers/dma-buf/udmabuf.c | 2 +-
> >  tools/testing/selftests/drivers/net/hw/ncdevmem.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/testing/selftests/drivers/dma-buf/udmabuf.c b/tools/=
testing/selftests/drivers/dma-buf/udmabuf.c
> > index d78aec662586..ced0b95c876c 100644
> > --- a/tools/testing/selftests/drivers/dma-buf/udmabuf.c
> > +++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
> > @@ -140,7 +140,7 @@ int main(int argc, char *argv[])
> >       ksft_print_header();
> >       ksft_set_plan(7);
> >
> > -     devfd =3D open("/dev/udmabuf", O_RDWR);
> > +     devfd =3D open("/dev/udmabuf", O_RDONLY);
> >       if (devfd < 0) {
> >               ksft_print_msg(
> >                       "%s: [skip,no-udmabuf: Unable to access DMA buffe=
r device file]\n",
> > diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/=
testing/selftests/drivers/net/hw/ncdevmem.c
> > index e098d6534c3c..8114a29692fd 100644
> > --- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> > +++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> > @@ -149,7 +149,7 @@ static struct memory_buffer *udmabuf_alloc(size_t s=
ize)
> >
> >       ctx->size =3D size;
> >
> > -     ctx->devfd =3D open("/dev/udmabuf", O_RDWR);
> > +     ctx->devfd =3D open("/dev/udmabuf", O_RDONLY);
> >       if (ctx->devfd < 0) {
> >               pr_err("[skip,no-udmabuf: Unable to access DMA buffer dev=
ice file]");
> >               goto err_free_ctx;
> >
> > base-commit: fbb7ad31ab376c5101b2ac7205fad0344fd2de60
> > --
> > 2.55.0.rc0.799.gd6f94ed593-goog
> >
>
> Reviewed-by: Bobby Eshleman <bobbyeshleman@meta.com>

Thanks Bobby.

Shuah, would you mind picking this up?
