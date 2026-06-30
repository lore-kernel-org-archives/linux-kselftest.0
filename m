Received: from mail-yx1-f97.google.com (mail-yx1-f97.google.com [74.125.224.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCD840D598
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 04:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782794054; cv=none; b=Mktx9z2TtiHVJciaD1a3hY1Ac8I2PQRMRFyv6gT0zJy+ZpBFJys+aRgC73Svk9LspFWaSTAhzWC20PjzBXmGf63iFdNGknrBQnzBVti3+e9aFyoymjhspHIdBY7JgM+onydDUT2TD3j/jVe/2jCce5RCQSNlTBFnyG4ropT9qCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782794054; c=relaxed/simple;
	bh=fQHHZE49QKgAeEmAstbvFJU9E+T1jEFe2+bQlMGvlLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KkPFDIlU74m51Siq7MUXjjsXulGfh16vsDd4mS8XqNhyz6tuHQNM7p0atK2BYfNpxEDWla1gmHKDROBF7Ysc/bcCqnxZgupKagFMNKmwEYMM2aLukPi/3q7b/j50nXQkzPAQO+3G4xUX1Ec1p37Pj3XUUy5XgkHxpYtaOLXmK9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=QRBV41I1; arc=none smtp.client-ip=74.125.224.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QRBV41I1"
Received: by mail-yx1-f97.google.com with SMTP id 956f58d0204a3-6611669cd16so3956367d50.0
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 21:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782794052; x=1783398852;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o5cNTRqJ0clBsWgIuHd/cdck4foFg+PQ6dcUXIV3b6w=;
        b=d2aTDFPaPS+AUux7HzKXOLhHeY6n0NAfMpVTc64xiPqikI636P4Zg8GHwgHAU/VUnR
         MAYO1mlbgtzT20YK6mpQVgSNLxz+KkrMn1Js6sz6JQkuYvbZjxQM9nGMR/GplxjGdF7y
         dfU2srf4pzuRR0p86JbYYl72LKFnKy+R+n9mJq5fQ9OoJdKPivLUwZHLw2R5SVXQxoYz
         HqAuH4GWtW3Xu9dA4u3rCWWvMgEXUBaykpyWU722U38K45iGw53S+Clj/iERuCrUv9b7
         XWwwVcw9+3Ivsi5pQDZ3Z7q9s/nRdagvTQfKp+DaMMljE7xvaX/0LDOMp/6g/BwzNEaD
         QODQ==
X-Forwarded-Encrypted: i=1; AHgh+RqD+ayXjsXXlvplu3/m1HTLaV3N6bAtpM45bLXpcXVwSVwLR3ZtcU3K+7gB8S04/ZNFQbNd4eIUcBfyj+dTJ68=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDep2i0lRyir+NEZuTNyvkjTPzbVwg/SbaMdXATVsqBOksGhwV
	6XVV4AhrW3SS+IcIlQnpj2auyjac1dBRL4y9Uvjs7X1aUeUq41Y2LLuNm2HMJuRxk09bBIrdFy8
	HimWGu4U0Wd9zrkLVwqt1Rh5+14p10zBgw2HtdHYrtCB+d5uEyu/3MaNBePfShY44PTYV4RMMMg
	uojFmdgUxuAAQy4U53AK3N/ohWAxoSeBG0sNm5RRJEAV1eg/Mjqs0Dx2w3pAwsYAek47FYf+WaZ
	E4Roi4088+85I8EE2q/BvE=
X-Gm-Gg: AfdE7cmpoAX7exyaq2OscJ52Fo1R0NP9Z8g7HvGR6PntCsnk7uWu5YKwlk6wVLxp+kJ
	y4pIvOGLvUqjGxMKvVUmKI+ibq1gNtrLbyqzTsbuaT4vsNekh/SHu1CYRuG5SvzxBcz+xE6czXz
	RrykHvEHtNlKqI4ro98LguxjdgFZMXifw2ldzj9b99RGPE0BLG/hIDWbXR3+2LU3P29HT4oBBxQ
	Bpuv9bESdi6p/5Fnacz+3JaBkUYUHT5a7yC/Aa5N7NTfJoPSEdDrw2xRdNeGtkdq1ZpV85o7MCX
	RdivKsq1YW7Twv7Hb3zmSR/6YUEsOoJwLS5zEreNbQDlLiXhnnahgUOkhTxLiKaMiYjo3uyJ9ZJ
	6Yu0YBA6tC5pBc16LfIpgeoH1RCkOnyrpRlsdSQZXp5JtTqf4M1H1ckp2z1s/lydoS1lDcRgQ9L
	GnGKYJjeE+CJKotQNkuABZDlV9ST1x1UPM6/XJeJjKdEUZ0w12
X-Received: by 2002:a05:690e:150f:b0:664:e8ac:21ce with SMTP id 956f58d0204a3-664f97871cfmr2131398d50.24.1782794051869;
        Mon, 29 Jun 2026 21:34:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-6650080c556sm69092d50.12.2026.06.29.21.34.11
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2026 21:34:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c126f7ef83cso127720366b.3
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 21:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1782794050; x=1783398850; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o5cNTRqJ0clBsWgIuHd/cdck4foFg+PQ6dcUXIV3b6w=;
        b=QRBV41I1giBrucUOAleztJoIpgzpuguSgHTkHNSIGjTfLNViDf/CZn84nSOQmOEiKE
         vmuvtwSBFgqmhMYK7dWkqA+byXSOlShCo2ivPLhO2TRTN52x6up9oBHv71sbN74nFia2
         IvrjkBl0R18KuUrVQpLJfUagezRallwT4PGks=
X-Forwarded-Encrypted: i=1; AHgh+RqswEEWvV4g+Ie4J77E83d5x8n/ZSrVZOQKFyx2DOrY6tolk3zktFJJGDtFV9cdmEh6gGAg0ZEbyMjC9eZiVds=@vger.kernel.org
X-Received: by 2002:a05:6402:3554:b0:695:37ba:fa00 with SMTP id 4fb4d7f45d1cf-69879ddc6bemr871899a12.4.1782794050327;
        Mon, 29 Jun 2026 21:34:10 -0700 (PDT)
X-Received: by 2002:a05:6402:3554:b0:695:37ba:fa00 with SMTP id
 4fb4d7f45d1cf-69879ddc6bemr871886a12.4.1782794049862; Mon, 29 Jun 2026
 21:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629233923.2151144-1-kuba@kernel.org>
In-Reply-To: <20260629233923.2151144-1-kuba@kernel.org>
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
Date: Tue, 30 Jun 2026 10:03:56 +0530
X-Gm-Features: AVVi8CdaTG8DcY244quaSXOxLzZEBauFt2oOewRjBu63KDfCbnKZXcMJCWxqn70
Message-ID: <CALs4sv05Ba54QXZuHqQAk2-2sVpp4zfjGX-czkQCRj2D0Td3vA@mail.gmail.com>
Subject: Re: [PATCH net] selftests: drv-net: tso: don't touch dangerous
 feature bits
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org, 
	daniel.zahka@gmail.com, linux-kselftest@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000185cb506557116cb"

--000000000000185cb506557116cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 5:09=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> query_nic_features() detects which offloads depend on tx-gso-partial
> by enabling everything, turning tx-gso-partial off, and seeing which
> active features drop out. Enabling all hw features is dangerous:
> we may end up enabling rx-fcs and loopback for example. For the
> ice driver we end up getting into problems with feature dependencies
> so the cleanup isn't successful either, and the test exits with
> rx-fcs and loopback enabled.
>
> Scope the feature probing just to segmentation bits.
>
> Fixes: 266b835e5e84 ("selftests: drv-net: tso: enable test cases based on=
 hw_features")
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: shuah@kernel.org
> CC: daniel.zahka@gmail.com
> CC: linux-kselftest@vger.kernel.org
> ---
>  tools/testing/selftests/drivers/net/hw/tso.py | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>

Reviewed-by: Pavan Chebbi <pavan.chebbi@broadcom.com>

--000000000000185cb506557116cb
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
/HTPxpDrr4vzZL0yoc9XefyCbdiwfyFl99oBekp+1ZxXc5bZsVhRPVyEWFtCys66nqu5cU2GPT3a
ySQEHOtIKyGGgzMVvitOzO2suQkoMvu/swsftfgCY/PObdlBZhv0BD97+WwR6CQJh/YEuDDEHYCy
NDeiVtF3/jwT04bHB7lR9n+AiCSLr9wlgBHGdBFIOmT/XMX3K8fuMMGLq9PpGQEMvYa9QTkE9+zc
MddiNNh1xtCTG0+kC7KIttdXTnffisXKsX44B8ECAwEAAaOCAd0wggHZMA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3Nl
Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEF
BQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1Ud
IAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAy
hjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJAYDVR0R
BB0wG4EZcGF2YW4uY2hlYmJpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNVHQ4EFgQUxJ6fps/yOGneJRYDWUKPuLPk
miYwDQYJKoZIhvcNAQELBQADggIBAI2j2qBMKYV8SLK1ysjOOS54Lpm3geezjBYrWor/BAKGP7kT
QN61VWg3QlZqiX21KLNeBWzJH7r+zWiS8ykHApTnBlTjfNGF8ihZz7GkpBTa3xDW5rT/oLfyVQ5k
Wr2OZ268FfZPyAgHYnrfhmojupPS4c7bT9fQyep3P0sAm6TQxmhLDh/HcsloIn7w1QywGRyesbRw
CFkRbTnhhTS9Tz3pYs5kHbphHY5oF3HNdKgFPrfpF9ei6dL4LlwvQgNlRB6PhdUBL80CJ0UlY2Oz
jIAKPusiSluFH+NvwqsI8VuId34ug+B5VOM2dWXR/jY0as0Va5Fpjpn1G+jG2pzr1FQu2OHR5GAh
6Uw50Yh3H77mYK67fCzQVcHrl0qdOLSZVsz/T3qjRGjAZlIDyFRjewxLNunJl/TGtu1jk1ij7Uzh
PtF4nfZaVnWJowp/gE+Hr21BXA1nj+wBINHA0eufDHd/Y0/MLK+++i3gPTermGBIfadXUj8NGCGe
eIj4fd2b29HwMCvfX78QR4JQM9dkDoD1ZFClV17bxRPtxhwEU8DzzcGlLfKJhj8IxkLoww9hqNul
Md+LwA5kUTLPBBl9irP7Rn3jfftdK1MgrNyomyZUZSI1pisbv0Zn/ru3KD3QZLE17esvHAqCfXAZ
a2vE+o+ZbomB5XkihtQpb/DYrfjAMYICVzCCAlMCAQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UE
ChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0Eg
MjAyMwIMClwVCDIzIfrgd31IMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCCEEDIH
6YPjhN1FXUNC2TbRr4ynTuhivD8TNFB2kN0nYDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjA2MzAwNDM0MTBaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBA0cmubYNOFUT8m9AC0sMvLRz6xqWK1BqNuWHK6x4s
hESkMrfIPxCojSMPcihUkPPCuleyUrEvRiQz+du2jQzzhCLiklvP45OXAUfxtsIhi6JfXoTAP/iw
EJts9uay6U3EiviOiFcSjO7zlay+aJRzLM2x+7ybHFKD5wTU5VrSYSmr0c+tmxlFoRLRumDu73s8
O/4j4mwdpedR4P7Av6iN2O6oGMh6hmfdxWkJEte8XOBEupWcWpq5aP+cj2LNrrUj5TGwbkI1VAPk
wyFchEk76H5lAB3hi2fSsUiT+Ye8t/2ygcGg14Sq7B1oVjkj4cpXOgVQMtiJPGZ18BG82jYo
--000000000000185cb506557116cb--
