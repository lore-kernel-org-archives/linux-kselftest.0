Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDB3383C9C
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 07:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.228
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772437390; cv=pass; b=kGwzo5b1uksqhqbeJOx5B06Y4uGDzu9xojIzqKYPKMOXNaQTQ8HODOCVV1lLHvz4brHEApVMkR9Yrbl+FIBKhHyTbefYTIwUlusAUw1S00q8po9DRCSQsKC3bVF997NZgW/06DwI3AjLMPIHZ3mWQcf0Drba0sLc7I2hAZWV0rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772437390; c=relaxed/simple;
	bh=DLkzi8NwSiF0NiZvor2wOfHLnmefM5oTHOYzQPFrUUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T863a7i39oVNmacPmRydsF4BaWnMXE9WrLgNSHww8c6KV0OZQIoMR0RgDLMew1Nmucd9rVBgy17Uhs6X/WP1q/Z21XYUCEaa9JRPRfnplSmJBrmanPCOysdLScyEPwgNrg+VU8e26KTOZDUFzuBBmi9qXD+/Or3ZALIJKroUfOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=N+o59RNw; arc=pass smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="N+o59RNw"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2ad4d639db3so18625565ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Mar 2026 23:43:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772437389; x=1773042189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9FmTnZRFP7rj4UOIkGTcN4t2gEKzRveLCf95qCJPro=;
        b=aAuwMxzWTsjqowIdT5cB6X08zsv5+h8LGBmz5N5roUcc11/NZDCDsKOeLaJ6kqT4ae
         2bagGbz8EtUkyHUtwJ8ge0x5r3ZNasvpYmiRAlKYs5XmNbrmes8caEQJKzp53/znJfNA
         6RVlxsxB4G2YYQtnbu9chFo9IZYiJBhap1UNG09DEWus3PzeraSRf5BopfnHo0CMQfLe
         Q2pbNKZao/iTyrLOUDAkDNcYJYU8yzeJ/1MggSJvgAIzdFT3pFgWQE4g5WtiJIluzxud
         kuFUAEpULMgvMfCVBwVHqs65wyS4rtZZKMZ7wNzGiAOlbKveyw8IbNduNJROocFVIlH0
         60sA==
X-Forwarded-Encrypted: i=2; AJvYcCWCajCPEIjcIWnz/ZzddAy9/z2BGhzpbUDCuNkJpw3FEi9UDLFmTnSK9ii2YlRKaGs0gRT/VJCmdtAZ8CVvO00=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPWhau+IkiOdzFfQshgTuYM5cq18zXUHmr3jFFHY4nQgfDrcQx
	TXLI5cZVF3156M+fCq9QLTYiA39otxwKOtogFZ3+2Gz03DQnCp443+wgOMrj/UcdxGYBpnN9S1a
	ast6j3O2laK9sM7FDrFWuXDAXLlKS3xvpqBU7lv3IBD1DhFDudBxc4H8vsyF+PdCZGLlNAPUJvv
	+HxXgcAHhmc+3qIWZAEpqjMBcCoVPr7fkzVaq3jknz729hchLaEp0QCS0udAh0kzkDm2d+jJBui
	mo4NqV+vvZajdqdApnzLA==
X-Gm-Gg: ATEYQzwqn4zqupIXK3/hC0UC5n3kfJhcKkq53LBJSS5wCU8g/EbGw2y/2GCiFKFTZdp
	523ZiA/FjFYF+pHc/g/QZyqGw3DbJOdLcYpiGr8Yuci8XM/yv3eUIMOCZD1WHbo/c8PyLU6HT1u
	lNL5IsnM+PytGOklkRHDHkmhCi3GGWMuTzGkgc+T7ZE/FF4qzF4LL2si5gv5B0OmjnQ6KraOBbP
	Hgel3CT1y0uwSELnIvvQk/V28YqxM/XZiQuP2p+Dkf49h3T6t0ckI862X+ooxBEHV0wMAGZ4p3b
	qyzG3jzyaQneVQfmyti4hEFr7tzbPqnqUlqZvYGUlO75mIkB8SHXf4mxXDfPu+oe0n0j33cD57h
	FJCelW/MlAXM1vpfZspJyTbVlN7bP3dHOduL/c/5jmdUahTKwdQnkKrdJ2ZIr+Q87UY15XE4N23
	5uG782UJFjsPHOZlDnoCRGS+qjY2xvDxOQm0laQcUAISpj4lugZWLgJ3caAg==
X-Received: by 2002:a17:902:cf08:b0:2ae:48a2:1c3e with SMTP id d9443c01a7336-2ae48a21d86mr32334125ad.27.1772437388556;
        Sun, 01 Mar 2026 23:43:08 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2adfb5ddcd3sm15613185ad.37.2026.03.01.23.43.08
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Mar 2026 23:43:08 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354c44bf176so3962595a91.0
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Mar 2026 23:43:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772437387; cv=none;
        d=google.com; s=arc-20240605;
        b=Z//4TKbLOmyIASGZJ40OtfMzQDoIxejJZlqilVNIOtGLOMzQsLa/PAMECXjdQGMUDM
         XNaNmlDIJfGeuo3d80s7b0L5y//DEcNeG2zHe7u+RDR6ZwDxOXREJdeMRa/dRkWDl/bd
         vUJO2qpmBIxVO3rgferBRxT9x6jvJANxLt/1E8qdb+pbm3cBxuxzY/n6okwKqMkq6wes
         HuEx6AUNgSrn95LXt3jssyBhrJzIbWU2P0KLUAUVY1vInykelvNOpQl8Bd00F/qLMENt
         XkdC83HboYrqnpEPrVwH8Oo1HLVY6aToA1DXreZC2jqDeyf3tiP5bdkXnFPVFRx/Gn1H
         lyGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j9FmTnZRFP7rj4UOIkGTcN4t2gEKzRveLCf95qCJPro=;
        fh=TyiaWsIcgmNbaSnXhfwIcUzHBWDxgB1c+z4e01pes6A=;
        b=hYXrAlTCuK5tmLA4pJQOp9FHVVO5h/1B7NCtSYkqpGeNUXiLN8H5QjWhLM7Cp7nuT8
         qvu/gdYvCYjfEORk7er/D1XzG9FlVR7+krOvtWgz+PxJAodgdsnmuu80iRgcvN4+0oBS
         mBsBUwYAeJblqGwJskxAhWfx+8GflHPeyZjCpSEkQxhAiyIlRYL2iG6ldIKkl/MuRJD3
         jJQP2BUm6iMoyLLEu+YTyp5txA4BUtCednPTj6ikgHzCsVGjLoGrplI2osXWU41AZ3O+
         zV8TYobx+2CeID3MKCXGkyqw7R3yRVGfwiy7cVIoqCbjq5QWHGo0oolb60a3KnjN+Q3R
         mViA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772437387; x=1773042187; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j9FmTnZRFP7rj4UOIkGTcN4t2gEKzRveLCf95qCJPro=;
        b=N+o59RNwcrHtvhbTevvzXVs5vdNcf2GWusqwbQomf6LjMUgfNmgi4qMHS6mzPrwA8i
         RKkfVaZ2pU7vVRAoOCUIppwMvfmsYgFvrMcMn8Ynu8c9AqKk/i2+cvUU0hj8tdXuUWma
         wIVraRDZETVNivgdlqA5W9AlF0J+6VAxEEmRs=
X-Forwarded-Encrypted: i=1; AJvYcCWtMwK0wQlGGAOjQYQQ41HoBllX4uzll5Qk/Qi3aFlpaIJNFhzmw7Kmhu3CNxa6jJyqxAcA4UZk7OmWJ/H97LM=@vger.kernel.org
X-Received: by 2002:a17:90a:fc47:b0:354:9dcb:1941 with SMTP id 98e67ed59e1d1-35965cec515mr11384420a91.33.1772437386812;
        Sun, 01 Mar 2026 23:43:06 -0800 (PST)
X-Received: by 2002:a17:90a:fc47:b0:354:9dcb:1941 with SMTP id
 98e67ed59e1d1-35965cec515mr11384401a91.33.1772437386383; Sun, 01 Mar 2026
 23:43:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226184654.3180648-1-kiran.kella@broadcom.com>
 <20260226184654.3180648-2-kiran.kella@broadcom.com> <20260228100449.19f6ef13@kernel.org>
In-Reply-To: <20260228100449.19f6ef13@kernel.org>
From: Kiran Kella <kiran.kella@broadcom.com>
Date: Mon, 2 Mar 2026 13:12:29 +0530
X-Gm-Features: AaiRm51zwcsaZx4v8fOaIZ6nN1QBFqhOEJ-Qbkvad1L0XJHVWh22G8JW2C-MRKo
Message-ID: <CAPHeo3cHcUs7n7iDDDDs+iu70uMtMTbWKtqCbXcrpUR0x1YEpA@mail.gmail.com>
Subject: Re: [net-next, v3 1/2] psp: Support for transmit on logical device
 when the underlying transport device supports PSP.
To: Jakub Kicinski <kuba@kernel.org>
Cc: willemb@google.com, davem@davemloft.net, edumazet@google.com, 
	daniel.zahka@gmail.com, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jayakrishnan.udayavarma@broadcom.com, ajit.khaparde@broadcom.com, 
	akhilesh.samineni@broadcom.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000d875a3064c05bcb9"

--000000000000d875a3064c05bcb9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2026 at 11:34=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Thu, 26 Feb 2026 10:46:53 -0800 Kiran Kella wrote:
> > This is achieved by propagating the psp_dev from the lower device
> > to the upper devices in the device stack via a netdevice notifier.
> > The lowest device owns the psp_dev pointer while the upper devices
> > just borrow the pointer. When the lower device is unlinked, the
> > borrowed pointer is cleared in the upper device.
> > Assumption being that psp_dev is set on the lowest device before
> > any upper devices are stacked on that lowest device.
>
> As I mentioned in the other thread I'd like to establish some clear
> expectation on where psd propagates automatically and where it doesn't.
> I don't want to see a stream of patches that say "fix propagating PSP
> onto X upper". And conversely report saying "PSP got propagated but
> it doesn't actually work" (macvlan in bridge mode etc).
>
> Hence my preference was to require the user who created the device
> to propagate PSP. Willem, WDYT?

I too prefer to go with the single approach where the user has to
propagate the PSP.

>
> > +/**
> > + * psp_clear_upper_dev_psp_dev() - Clear borrowed psp_dev pointer on u=
pper
> > + *                              device
> > + * @upper_dev:       Upper device that may have borrowed psp_dev point=
er
> > + * @priv:    netdev_nested_priv containing the psp_dev being unregiste=
red
> > + *
> > + * Callback for netdev_walk_all_upper_dev_rcu() to clear borrowed psp_=
dev
> > + * pointers on upper devices when the underlying psp_dev is being unre=
gistered.
> > + *
> > + * Return: 0 to continue walking, non-zero to stop.
>
> Please (tell your LLM) to avoid adding kdoc which restates what the
> code does. For static function really kdoc is only useful if there's
> something not-obvious to say.

Ack

>
> > +static int psp_clear_upper_dev_psp_dev(struct net_device *upper_dev,
> > +                                    struct netdev_nested_priv *priv)
>
> Please (tell your LLM) that the action goes after the object / noun.
> psp_upper_psp_dev_clear() or some such.

Ack

>
> > +{
> > +     struct psp_dev *psd =3D priv->data;
> > +     struct psp_dev *upper_psd;
> > +
> > +     upper_psd =3D rcu_dereference(upper_dev->psp_dev);
> > +     if (upper_psd =3D=3D psd)
> > +             rcu_assign_pointer(upper_dev->psp_dev, NULL);
> > +
> > +     return 0;
> > +}
> > +
> >  /**
> >   * psp_dev_unregister() - unregister PSP device
> >   * @psd:     PSP device structure
> > + *
> > + * Unregisters a PSP device and clears all borrowed psp_dev pointers o=
n
> > + * upper devices (e.g., VLAN subinterfaces) that reference this device=
.
> > + * This prevents use-after-free if upper devices still have borrowed
> > + * pointers when the psp_dev structure is freed.
> >   */
> >  void psp_dev_unregister(struct psp_dev *psd)
> >  {
> >       struct psp_assoc *pas, *next;
> > +     struct netdev_nested_priv priv =3D {
> > +             .data =3D psd,
> > +     };
>
> reverse xmas tree

Ack

> --
> pw-bot: cr

--000000000000d875a3064c05bcb9
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
ksPFF8lRQaSHMJFFWI2usTUpS9gKxRAuJyHc0xlNKy4vK2ZEic8RWs34T6LcL98JR51RaKtE0Dw9
7F/uUf87z+/74aOyyxrTl58LlkxL/+1yMEHZhyn6z30LHQuA52TSp7uD3au8gu0YN+hKIsPBKVbs
dzf/bW6eDpGSwgwRzqF2BcDBOUA9U2mB2cxinBxOxCVbYRy//Q46OuAx0pXw8trIkPDdp8kHAoWD
7JxJ70nrdMy8VRmC02NQp185/6szeMFYLA0CAwEAAaOCAdwwggHYMA4GA1UdDwEB/wQEAwIFoDAM
BgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3Vy
ZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcw
AYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIARe
MFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZo
dHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBo
dHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIwYDVR0RBBww
GoEYa2lyYW4ua2VsbGFAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8GA1UdIwQY
MBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBS/iTArBeV9hFyyktvkwzGbaKne3zAN
BgkqhkiG9w0BAQsFAAOCAgEAdavxLwcm6Kj3S7/bA/IO6B6MTHIndKyB630T3CTPeOeuHV7ZS4wr
rDZbrSjERD36308lnaXSESlcu8LX2SKJ0KqNM3VQNTawSKS4wMXlyTzOBfaslsjtFiT4jQW9Py6u
6nf1EVoQ6YTCGJ+htyKqFgIljJIdBBOvXY+gECh/DC+VbLUVK9CgZLKkFJ5udhYvw1tOc3zOXGOd
kwaK7AtwRSLgNt5RSAaikL6bvU1kUWgITNKKhBK5F3CNUbR0hD/i7yG6Afdh27V1T7FEdV07fBbu
3+AVnAdbZmHfnB2T8lHTaR9GbgkF6lG/a8I+eUG5NPrDEM+afXT7/+zOTjf799qoyhMdfgp90DEW
9ukfyqfUq37ctBG4TdnDlxtkwy9XYw0Avotf2lrYy+6MYjt3cZFF+AF/F6ANk+Gx9zH5gyeUlruJ
+aqmP1U1lX/n2YEXAfiLJulbb3Jfi8lvyYzHXpHLIFtLfyVOzUXdGdj3dVxxFSPJ4uXmpk2SLExM
W7+cvJ+PxSJyWK723U609whQmqbVRz5B49CjNt/exjWtBGGjCwLPMGNWbHbwtDVWcoZzE0KoL7EK
VPB0t6uom5ElZ+qieZghO80tR/MW2eL8i+EiVMwq5GF1Ni3D6uypwZYqgdicI0YGj7JCgrIzr1kC
xwtQkw5ij2CCUWXxadt/C9gxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBH
bG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIz
AgxbhXTUwXZ3dIWSpigwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIM20bGdnI7C0
XZza6ooovYfqPOF3/MmadtwqgFmaq9TAMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTI2MDMwMjA3NDMwN1owXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJ
YIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUD
BAIBMA0GCSqGSIb3DQEBAQUABIIBAJQMaKgtk+hEdtpB1XeqSiIixozVsqQfybMoQBXXFT1CoSQN
He02HFPGtY8yKgQ3eJcOpMcbm3qVJ5bjaRMxFC/sxUu2iaVvXVjpR05B4soaTYPq+7gK+MFZOAeK
jqxQH0L4JIoNrR+/4OBGgCwKLVAq2Ztpyd8BsSRJgeijYLT/rKraUU/yu/T+rjxx/md4tyoxQ2YS
UiHKVejvM7/lbhazC1nAl+Z0KX8mqR2LkvgmySHgke+os88pEB0kxsmYEyRpE6QheAXSotVIE5BS
fIE/Ujv+1+FvcaN4/KQlbGFguagAREhKFGnI2vvoCmat3RxmeL1itUqtBwgWiQBfmk0=
--000000000000d875a3064c05bcb9--
