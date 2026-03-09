Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CA4240611
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 04:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.226
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773031313; cv=pass; b=alYRZjUGmjjoPC4/UN8Ab2vcyo9s16aQU9TXOjs8Vh01ia7XCQkbpkY4Lx7XBgMShUMs7Ta5ggIJHHl122J3giZcQA0lNKooM41BEUJVzD6STN7W6GCfIfbUvNXUcJtOadDOCBuBpwvPyRN0SIkj5p40d+X7LlOAiRUz0IERXM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773031313; c=relaxed/simple;
	bh=dD+UDejaipo+jZb/Gx+vkGIeEiWwU/0tGb3yJY6IrH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gU2+8I1mYjweYwIPuC75vV/XRL59YUoW+KoCPzvCKZEn+mGpF9nZwtB/Dclp8iIKE+zd+lUAJ3UNj/MIm8cyMLzX0m4UM5aR8+QJNXqjI5knkWwK/G3Ku04BUlFb5A73ORDvv7qkGox0KnfiTbyVyE/AEBMwSrin93mLg0IQyMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=IGCsLOHE; arc=pass smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="IGCsLOHE"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2ae43042ea7so88722795ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Mar 2026 21:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773031310; x=1773636110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOmmQizkqcAuTEDH1NLRmvQ5TNunoakSvkeee74hLRY=;
        b=GFfMm4w/3fqvFuqLQd4C7O5oAu4NoOiF6QENblcCDlrCYxOyBpJg8DreTl2nCOkO+F
         Om4wiw+TbHFRzd0ITvE1s9OIzVCBKLJ2IwkBH9N1XzhRUrMHebQZSRickbFXomseo5e+
         nchW50Og69FF7TqaeD1/EicMTTIXhszwLc8qGgipZ4DOCKhhOyzNfF89ChMqPoF7MWpZ
         1yuKHBWg8MD/iFLw1y80bb0PaM3H86coZSF8md0DXNTyHiihMTY2Chp9sIYEfYkeS3ZJ
         3f4LISfs/VhcV5Glh7R9zZkWyB2HA9CMiT9te18IZPkgejRopamTKC++qxu5Lv2+M3Of
         TvRg==
X-Forwarded-Encrypted: i=2; AJvYcCUWU9BkhCpCGIp6abfxOjBUuqCwe9xK/G+vCw8NFiROv14U7it4VM+FQeZ8X4vXAmlJ+OTSwRDFKemr+p/zq7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdwGeSHSH9aCNYGMb/dF+leKU2iusIwMGZvjJ+7TeXE/VlPfrw
	28Y4J57kWdLdEbWHVhPoYIET7ekdxA+QiJG0KBxqbL1JjLchNVdMWGuwFoG7vxrTLsz7G5d3HxT
	Fr0wFD+MjvcaNPxKin+EWs1CNdGea9gNvviY3owYlglu774W1bMuNX1opILmwpirXVEFSggZgy1
	9Ppc8T2Wxrsy2+7A2ROyvVdBDm4kXRaHl1wclodD6VLe6pFW6g3IMVChPqv76f3ftjt7FKelzp9
	CWJtbRGF7/N2VltbVd5Et4=
X-Gm-Gg: ATEYQzwsi2YEs2Wxpja7L0iV5Z2spyG5il6CgL3RpfSFPHsAR7p6YS/Df+RpK5LxUfb
	T/NIbup8G8aPP3GPFT9kVCnYvuoLMcxJuXUgrrGKynjToHgR5qSTU48qONrS8bJV4X8IC7vaEMc
	H7vy5mf8S2uYe32vcGyh/dMP2KFpJzqmURDzR0U7jVTehJrzPRPFTVt3g0XYf0MtqnlAGS1PEAO
	vk3o7KafwlL1Op8pSJHQEfHtpVu7GHWL/XNDyjls115zJseuwu8t2jWx4/hvHyMGiv2uaqMU1uU
	hPp1xr8C1slIkTkMSsfBl4KIxKlpju0TyWW69Q0Vs93I01Fu02HkkQ99o3Mgk5iJyx6vt87FvOk
	GarPb6u7qLG9tIaGqzZZhRC2yFomAeQfTx8EQpaZbWIMidFlEM4RHPC/a92yM6NEjx+6/+jrqze
	CO6iB5kxnEJDIbACOOekCSlXjurSdKy5vUcN0SVk7M1HzuOvJRi7F+zKyr
X-Received: by 2002:a17:903:8ce:b0:2ae:6133:d170 with SMTP id d9443c01a7336-2ae823a18afmr89441785ad.20.1773031310074;
        Sun, 08 Mar 2026 21:41:50 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ae83e7c5a2sm13088215ad.19.2026.03.08.21.41.49
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Mar 2026 21:41:50 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b8fa5744b82so1130840766b.3
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Mar 2026 21:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773031308; cv=none;
        d=google.com; s=arc-20240605;
        b=dMCaiBpojB2ThmMwpLfeOtTdNK8qNmWtJV6Q3qDSP0oEyMpCljXmancTXYs3vMI1vL
         PgK4kphPTX5PXQroWJzeskWCgojW838s4+tRd9H7iYlt9BpMOHPeR/JRSdr21lzN2wuR
         3D8ZfvgRd/hLAjaJ0QMna3m0W0RL6FK74LK/ddxHUzaa+FrYle3DMQ0shCwhLMq/Jf3/
         vpKGHdZkFimgzmHRScIowcbOvOj+eB4/15FABwJirGF4ivsoPqkTL+i+QcefwzEHMbaQ
         8Up9xnzh50YzYFIrn3szdWi46LaENtZhHD/6b7mtfnYrtax38nRCBRzSsyK8xwI6v5+n
         R6Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tOmmQizkqcAuTEDH1NLRmvQ5TNunoakSvkeee74hLRY=;
        fh=gMznQRVuxK1+yQcc1EJLNk1iNzNSk/ZWfF/K6PfO4VA=;
        b=ReCKFcZTX+1yZ1U9OqfiJGTK+y6r6srNf86ootlZIjLCK2ZVY4a8cenF9z7sooY/5/
         II2CdCn4YO0r3IQZ+tHpAArXqN/U8fu9mhG+yu6kd6N2XnIzLtibrKIm84Uw4mDs0GXX
         kHJTu3IwFKVCSMEqs2Q31UlnY778BON2tTNlFZz61YQFF6plZRbUOmSBweJhNAcMa1i2
         e0FxmVoBQWlq2Fi15QtBrpSv+yHnKxReMRnIHB05gy038i61SsdHGCNZmBvb/kGbrqqH
         FUGUfU7tFlrNW0aOhNqKtudsFtaaWWV+MM9cN2Q8GAVejw4pHDBPcabYWY1lCJVhprVN
         hrDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773031308; x=1773636108; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tOmmQizkqcAuTEDH1NLRmvQ5TNunoakSvkeee74hLRY=;
        b=IGCsLOHEp4SZ+M53WlsH5Eu8RHXO98xqyJuC2kPTe0pgUywF4cNKKRg6MfM7EP029v
         FseFu5NUr6LJNRn4D7MIoSGy5ApdNQT5oNM5+JXJ8R9lOkPrqc5PD683oJ1ovUIQwucL
         X4WlgApMMci2m2GPvIxtXI0RPG80vNZRWhSpc=
X-Forwarded-Encrypted: i=1; AJvYcCXWJO5dVwNRvS+g3FK0sP1LVQI+3LjGRZkBh7nRiiOsOdgdexFijZo3FzGZRwM0Pk4J8lyA+E89DHOJJl3GWVI=@vger.kernel.org
X-Received: by 2002:a17:907:9707:b0:b93:5fa8:d7f9 with SMTP id a640c23a62f3a-b942e00cf9emr541643966b.56.1773031307811;
        Sun, 08 Mar 2026 21:41:47 -0700 (PDT)
X-Received: by 2002:a17:907:9707:b0:b93:5fa8:d7f9 with SMTP id
 a640c23a62f3a-b942e00cf9emr541642266b.56.1773031307288; Sun, 08 Mar 2026
 21:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308131218.3172332-1-bjorn@kernel.org> <20260308131218.3172332-3-bjorn@kernel.org>
In-Reply-To: <20260308131218.3172332-3-bjorn@kernel.org>
From: Michael Chan <michael.chan@broadcom.com>
Date: Sun, 8 Mar 2026 21:41:35 -0700
X-Gm-Features: AaiRm503lfVLpZqfzxaAPrYnjOW6YNGPCNY-JemZHgI02Hdz3NgCY17c9t63DZE
Message-ID: <CACKFLim+0tUdjJxU=XXSKPMbVz7hn9uS2a7e1eySCZo6BJ76uA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/3] bnxt_en: Resize RSS contexts on channel
 count change
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Pavan Chebbi <pavan.chebbi@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Willem de Bruijn <willemb@google.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000004dafc1064c9005b0"

--0000000000004dafc1064c9005b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 6:12=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.=
org> wrote:
>
> bnxt_set_channels() rejects channel changes that alter the RSS table
> size when IFF_RXFH_CONFIGURED is set, because non-default context
> sizes were locked at creation.
>
> Replace the rejection with the new resize helpers. All validation runs
> before the device is closed; actual resize is deferred until after
> bnxt_close_nic():
>
>  1. ethtool_rxfh_can_resize() checks context 0.
>  2. ethtool_rxfh_ctxs_can_resize() validates all non-default contexts.
>  3. After bnxt_close_nic(), ethtool_rxfh_resize() applies context 0
>     changes, and ethtool_rxfh_ctxs_resize() resizes non-default
>     contexts.
>
> RSS table size only changes on P5 chips with older firmware; newer
> firmware always uses the largest table size.
>
> When context 0 uses defaults (!IFF_RXFH_CONFIGURED), steps 1 and 3 are
> skipped; the driver regenerates the table via
> bnxt_set_dflt_rss_indir_tbl().
>
> Tested-by: Pavan Chebbi <pavan.chebbi@broadcom.com>
> Signed-off-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>

Thanks.
Reviewed-by: Michael Chan <michael.chan@broadcom.com>

--0000000000004dafc1064c9005b0
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
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCCK6bEi
QJqaUf4mcLjB1IRaaK6bSIc47cMXXCWkWpE3ZDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjAzMDkwNDQxNDhaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBdbXudUpddczzrEPMf8SbJ7D58nwyVVkEMFlxTWnc+
lywHoniQu+4TQseepmSnUYQuIAP7L2FgKf7DQueVvDC1wSFykGTFRbBQHVVIur5Canr+T7BZ22hk
eBKvNiSSvRy7gwJ4bJh2X6PkPZqBRbJ2WIeeTipK0hj9iMad4DUBjRHwatoZdiDAH/tNUCZfQG0r
k4e2pw8GEBY8Z0yafgF5vNIE3d6jH3XskXj1GXhc0xVzV6PrLKMYJlfkjQY+I55gC7pKv2XXgTpi
lMFt7U4o3AvdoKleRO3gawafNRIA/pSJaTWdugpPQdOyGEPaVvs+mVV03L3R+NSqKcPY0EMY
--0000000000004dafc1064c9005b0--
