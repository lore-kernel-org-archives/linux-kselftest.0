Received: from mail-yw1-f226.google.com (mail-yw1-f226.google.com [209.85.128.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82598E573
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Feb 2026 00:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.226
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770509368; cv=pass; b=eVtJXBhM5QErDUSBwabEkmjiR8o+XrHp9XX6jlK623vyz2+jVgP+qyiW4lq2I6fTOw2/HangqONpH2JE4Ynh3zdyGA57jPqxrCovSeYZTTeB97fQAjPVHN6++YRGNoGpT9z9DkJ/woBcVsFgCEwFM68ZlN1Hhij7qeztXMkArWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770509368; c=relaxed/simple;
	bh=qtpM+W/CJIpK/TuTOagq4pSjBwJKz2rlLlywNo4lJGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tf4DdCAoMKVvuVWvPgCvhCv+eWnVyYdyeaFTsvvoNQm+U8my8frDvWmEFUz3i91ZWJlJy4XOs+pO/wMWHEVQ92VwmsUJtfF7SkE9k1+70zgSdDupmcC5l2LIqYoUfuF6tbchZkzUR0E37IAmGVD57fyYzEIAYu45qBYiObLt1Lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=aZ72TWEk; arc=pass smtp.client-ip=209.85.128.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="aZ72TWEk"
Received: by mail-yw1-f226.google.com with SMTP id 00721157ae682-79627af6349so13900027b3.0
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Feb 2026 16:09:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770509367; x=1771114167;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73fbfdq0A0ZmJyG3JD0Nheb/mioyIACzOO+cKJ6Kv7k=;
        b=BE8DMSAlANux+2rT4WG0YsQi0gxJj7IyubTYk1JmjoBAjY1/aUpTpPxahuM6mUUySE
         Z3t0rJeQid0DIKGIF6ZPHwT2fhm/qtITOsB5H6V9nxsLQ9b9l+2foMyRb1/vDvLvDbaU
         hN9hS/CA1QzkSTj7R2ZrmVEQbiQ6YVMkI7rkrM0m3wHqPaGNRT4JbZPkcCdj2WQe3dY8
         5ca2U9NlLo0/gEN/FUAlCXub0f0FLtWvtn/4T0EkfswBMWauKxVi1OV+X+PLeZvUxxxd
         gf2pe0FgkVVztdLp4InVh/HuUEdaYraxGnc1Pn9NqcP+0X0oCJQ5z5jAtpzV8u8qZJGK
         i/lg==
X-Forwarded-Encrypted: i=2; AJvYcCVLkRAhd2N14iSeZ+Ak/7yMVJHjLjKtZTqFGVn/hSBTh8KM3WnSFXqbTnWRIE27OEcdEIruojSbdkE+8uQ2lGM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4zfsEfBT/sorwiLQ6fesSD1ZgUZrvP1ljgvz8VaQQPOB70nlw
	fdzKjg/R1TJ+v7M+KOv02U2YyjnKnvYf7e+lkXj5NBE51ywQ1mM8+IzdIZW6/2e8hIvlQgIS1YL
	g7lvouo8ld+F/wdRLtBqp8SoMYnL0mpgs4l19HgjWgxpPm1CUVmVKlowmp/nyaHMMLF6KdKmugo
	JXBMdCMmO7FOmrcSRbu79DHNr3OwIoIEZviVNDnG6QXEqd8osVfJQt2OGIQiYtUIU/tpUMzG12K
	XnnwmE+7MmMIfUbuyZttOU=
X-Gm-Gg: AZuq6aLNEWtydHw24lOP112vPqmRE7Ykq1v1bhj2sv5TKqpWKNrtTrBCQD7n4oIYh7d
	kDY6lLCmfEX2skyCUbsckTK+zVUA9Vup95AXbmdSK7MIwgNsiCtws0vs/3Kcm3hsNekEKT77T/o
	cHBOoF3kmW7HJ+4QVGYYG7x3lu+mMTt04ug+gB3ZUBqtVeSN6bVTdojHNvVFFXz3S6CbughQpX7
	/7D47a2mtIdIISUJosMv+J1cyV45DXeJTP6QcpWI2ShlV5y8T/Tt7n3r3YKUayoGebeoXviRQvg
	1tXoy/moBELNgUuQK8Q9eRQcSnR+c5w1wDYMWpcI7gthbu8bHBQ5n9Q0NgIERrOrCeHap9KmrRw
	1NA/9v5LplvBRMWO6di2klI3w9q+EPeSqMuu5mCB2yjauYKmIaS49sh/OJL/zqqva3RGqwOW8fv
	4KlhWwUMCRDjzkMWoZqBYpBckkWXg0uwa9kATkthqAFJ0M
X-Received: by 2002:a05:690c:6604:b0:794:ed66:86a8 with SMTP id 00721157ae682-7952ab250b3mr147626717b3.35.1770509367302;
        Sat, 07 Feb 2026 16:09:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-63.dlp.protect.broadcom.com. [144.49.247.63])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-649f2550b56sm596096d50.8.2026.02.07.16.09.26
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 07 Feb 2026 16:09:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b8720608e53so412783766b.1
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Feb 2026 16:09:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770509366; cv=none;
        d=google.com; s=arc-20240605;
        b=khRTkkgH3hYYv4t99cTVogztNJZP0J4bQPd/VhvRCXKPiRDQEayQjx4OxuzRii327L
         coD9pc5Oz0gjCWMOi8PSHQk4oVe0k9ISYtl2641tKVRbyszynDsVjA2ckG2PtsS8QLtP
         1MtztTrJpz2BEfP9Uk1Vj3CNWjZ8Y0cGQ+2eEHpyVXsU/kOamGGe1SSMxA7VwcWDanzo
         9hLzb8+YaLcnzr1TRSxaVXwnxpqfZKU6IS4ZlinC0vVX2UTpJt/romyyJhnbWrL37LGo
         jLi58FLTnB0pfn8gGktw/MrYCB6/7TyxVMXaI9HgbXuxQLZ38ypaSyxL21wL27783vpZ
         ioFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=73fbfdq0A0ZmJyG3JD0Nheb/mioyIACzOO+cKJ6Kv7k=;
        fh=NTJqE+HoOXHdemZuaPV+EUNh3+IBiRDUqUbHFmz/Ke8=;
        b=ORc7v/wytGnGi0hPTTOhcChVtDqksKGHPR4kPobsiDtLdVtDL4dMzfajW0UdEn+lvY
         iM4idiG90ytOb/T5zgdRLjYIdcB1fEgqeYyQg8Ak3kUhlePgL8cD8lJNIgYdF0e/HdBu
         BIsbXcJ8Aul6J8GzxbQACAVDTV/Unl/zOR4dYz4QRJAbx0bz+hvVOoJOy4gY5mubpMN8
         CRGDz38bI8EhFPM5Lk3owfk/h1DjQo+vZhmspj31MHBBK5tz/Q5cuLagvQ30omKdkO6M
         M6ueBG9yrS9qg57NGYETkST+3xSt+fwzKPsHn+bKxmhb1xpZlUjbvKNtjoF6e4PS8/2J
         D5Ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1770509366; x=1771114166; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=73fbfdq0A0ZmJyG3JD0Nheb/mioyIACzOO+cKJ6Kv7k=;
        b=aZ72TWEkJ+Qra7ypWuKcfBgVDS+rGLVu057ybRyyqhr6V9gFwBfGd34o2UNvel8jjJ
         F7K+XYVRh3T8P+KMVwFYqwjXRShHtKBby5b+w2lxg8u1mnE4dTPom9Xdvz9Kto3qhkBJ
         fZHoF7zcGLBjyUTIWJuj/XoIFPBPasANIiA94=
X-Forwarded-Encrypted: i=1; AJvYcCV1a8F0oNKwYyuCG1xYfAlGX3Jg2Um6yoTKqbjtNKSUJKvg1Zxn5pHM0DIkjcUT7LDOKS5KNnLQ3tb3OA+dsZ0=@vger.kernel.org
X-Received: by 2002:a17:907:e110:b0:b8e:6d3:ecf9 with SMTP id a640c23a62f3a-b8edf378304mr348557866b.40.1770509365680;
        Sat, 07 Feb 2026 16:09:25 -0800 (PST)
X-Received: by 2002:a17:907:e110:b0:b8e:6d3:ecf9 with SMTP id
 a640c23a62f3a-b8edf378304mr348556666b.40.1770509365086; Sat, 07 Feb 2026
 16:09:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260207003509.3927744-1-kuba@kernel.org> <20260207003509.3927744-2-kuba@kernel.org>
In-Reply-To: <20260207003509.3927744-2-kuba@kernel.org>
From: Michael Chan <michael.chan@broadcom.com>
Date: Sat, 7 Feb 2026 16:09:13 -0800
X-Gm-Features: AZwV_QiVnDOczpDbKbBAc6A5JSDdEF-0VRVdTxHPGf70ETh5DGzzFcZF4Dj2bU8
Message-ID: <CACKFLimgibJ0qkM1AacZVh8MKKy-pE_AAc4KPKZ7GUqebmXW9A@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/9] eth: bnxt: gather and report HW-GRO stats
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org, 
	willemb@google.com, petrm@nvidia.com, donald.hunter@gmail.com, 
	pavan.chebbi@broadcom.com, linux-kselftest@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000d57739064a44d56b"

--000000000000d57739064a44d56b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2026 at 4:35=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> Count and report HW-GRO stats as seen by the kernel.
> The device stats for GRO seem to not reflect the reality,
> perhaps they count sessions which did not actually result
> in any aggregation. Also they count wire packets, so we
> have to count super-frames, anyway.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Michael Chan <michael.chan@broadcom.com>

I'm suggesting a minor naming change below if you need to do v3.

> @@ -13492,6 +13497,8 @@ static void bnxt_get_one_ring_err_stats(struct bn=
xt *bp,

With the new GRO counters, this function is no longer limited to error
stats.  So maybe rename it to something like
bnxt_get_one_ring_misc_stats()?

>         stats->rx_total_netpoll_discards +=3D sw_stats->rx.rx_netpoll_dis=
cards;
>         stats->rx_total_ring_discards +=3D
>                 BNXT_GET_RING_STATS64(hw_stats, rx_discard_pkts);
> +       stats->rx_total_hw_gro_packets +=3D sw_stats->rx.rx_hw_gro_packet=
s;
> +       stats->rx_total_hw_gro_wire_packets +=3D sw_stats->rx.rx_hw_gro_w=
ire_packets;
>         stats->tx_total_resets +=3D sw_stats->tx.tx_resets;
>         stats->tx_total_ring_discards +=3D
>                 BNXT_GET_RING_STATS64(hw_stats, tx_discard_pkts);

--000000000000d57739064a44d56b
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
DPVtLUtep/P3evQuAtTQRaKedjamBcUpJ7qUhBuv/Z07LlLIlB/vfNSPWe1V+njTezc8m3VfvNEC
qEpXasPSfDgfcuUhcPR+7++oUDaTt9iqGFOjwiURxx08pL6ogSuiT41O4Xu7msabnUE6RY0O0xR5
5UGwbpC1QSmnBq7TAy8oQg/nNw4vowEh3S2lmjdHCOdR270Ygd7jet8WQKa5ia4ZK4QdkS8+5uLt
rMMRyM3QurndiZZJBipjPvEWJR/+jod8867f3n0CAwEAAaOCAd0wggHZMA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3Nl
Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEF
BQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1Ud
IAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAy
hjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJAYDVR0R
BB0wG4EZbWljaGFlbC5jaGFuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNVHQ4EFgQUJbO/Fi7RhZHYmATVQf6NlAH2
qUcwDQYJKoZIhvcNAQELBQADggIBABcLQEF8mPE9o6GHJd52vmHFsKsf8vRmdMEouFxrW+GhXXzg
2/AqqhXeeFZki82D6/5VAPkeVcgDeGZ43Bv89GHnjh/Vv0iCUGHgClZezpWdKCAXkn698xoh1+Wx
K/c/SHMqGWfBSVm1ygKAWkmzJLF/rd4vUE0pjvZVBpNSVkjXgc80dTZcs7OvoFnt14UgvjuYe+Ia
H/ux6819kbi0Tmmj5LwSZW8GXw3zcPmAyEYc0ZDCZk9QckL5yPzMlTAsy0Q+NMVpJ8onLj/mHgTk
Ev8zt1OUE8MlXZj2+wgVY+az2T8rGmqRU2iOzRlJnc86qVwuwjL9AA9v4R13Yt8zYyA7jL0NiBNP
WaOSajKBB5Z/4ZVtcvOMILD1+G+CVZX7GUWERT9NRXw/SyIEMU59lFbuvy4zxe3+RbOleCgp3pze
q8HE2p9rkOJT3MkCNLxe+ij4RytIvPQXACsZeLdfTDUnjeXCDDJ9KugVhuqMelAZc4NissPz8FOn
2NK++r5/QamlFqYRhsFxSBIvhkh2Q/hD3/zy4j17Yf/FUje5uyg03FblSBOk2WYpRpXEuCpyn5pb
bYVIzfhQJgwGfO+L8BAeZIFjO1QL3s/zzn+RBlTl4wdDzh8L9eS+QEDhMcSsqb4fFRDbsoVuRjpx
R5MunSUzk4GcmmM19m7oHhPGeKwIMYICVzCCAlMCAQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UE
ChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0Eg
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCCxl8eN
HjL6zTRwphkj5TnP7mRocRQrc36nB1N79W0vvjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjAyMDgwMDA5MjZaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAESspiC20R2Ru3CE/ERDKXs+PbCtNdXTRpHFW4OvUY
xd3BSn/hvCZZ99Y7WkOd3zQU2lv5Yz5wY54wZyNm5UDnt8QVqvxBZ9/yvwPWx56nSbHFB3JZDtAG
QNvXfveZggMotL7zEXmyEOOJRCxDIphMUDVlmIJAWP4VWTGNtsj/tZ3Y6w4q6q253g/gD9e9pcsm
JHOm68no9HU/oCZMnW4XE7FhUPFvQLwMpAIOWh6yzW11iaMemtZs2gqlSVcpPaqsg3qnc3d2Z/gd
KeV7EIbEv+Sq6dH+x/MvJoCUwkUeSUza+tFTODxMFN6mCXhpVBhvp0FntWZQJ1uRjR2tWQDG
--000000000000d57739064a44d56b--
