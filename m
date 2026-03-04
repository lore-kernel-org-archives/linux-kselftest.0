Received: from mail-ot1-f98.google.com (mail-ot1-f98.google.com [209.85.210.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7B4390211
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 08:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772612609; cv=pass; b=KtF5IlG5S2GWJ/EYAwbaodkT5eEgeoftlJ2z94Q2fzr7skm4gkpMn79L6anxNoez4dJM9L3UsbQvEigP9IF0GmFrecNmKiHr9QK3GkkAlS4zomu3LnUnl6yocvbADqEtZv1QOkF30YEH7dMxbSksjUYcNgW5GK+dwynpz6efz1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772612609; c=relaxed/simple;
	bh=s5e+kgwFBjgzEPBswOTxaYQlbAK+qEtZFL3ejgdTEl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=frCqI5TnbkDOojNk+p+poGQu+vYW+h4adUdBpZ65zAfTHfVXBxC2OVq2SnztC9UBHGY0/8RaH8lGbBh4T8Pk2Th53jrCBCPOcemB3LWqO8Rnu+dlYV3nCMJhtPuXbHa4q1FXyQ6xiUXFPiTyAgBW3ezeC4JuXrlHK++Zk5O2LrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ox2fQ45m; arc=pass smtp.client-ip=209.85.210.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ox2fQ45m"
Received: by mail-ot1-f98.google.com with SMTP id 46e09a7af769-7d596ab0917so4043863a34.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 00:23:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772612606; x=1773217406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYi7hpIYqArL0rRrhi5ydhRomOthhV0glciTaQQzT50=;
        b=OyOgGT3TJCXm4EKFMEpuQWb+ggisyWxJMrjWZbAO/Rh+vcp8gGNl1fkvPgBbCsiSkD
         xuM9AOZGo3jR0qS62TInYdlB2vGGfiHoOaLBW1oi/bwlEL9qqexO1p6yDiHEE/zUcDQ5
         /T5aOQBK1d7jfP+FPrphvpsr1RbeqCJnsEVEiDqmRniSosQq0DyenJefo58/oVa53NDL
         AyWbepFi5r54fUgxz0/HrE1Qcnl4ZN2ZEsgUc06ldZUwyL/KOsNMg33YvZOTbcspS91m
         Z9cwY6+xOcN9qs+bxKarJ5uRzqa62Ep3sDHrUDYTHgYN3a2UfMNRfOz/xMDlN976ArZl
         mBlw==
X-Forwarded-Encrypted: i=2; AJvYcCUvGXpfBbJllk5plYgWeNkSqell5lDlnK5E3sdZ6buEZjtSYTrIwE+w/jpwj7zZd5V3IqYw58f4dvON6GPMYX8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfk2q4EP0SFhdDVJ9UOiq4w9ROv/0cI/qDJ4jUO49AubEYfSC3
	SY21iabTwuD3vw3sATLHKQCR3LaZRVJT4a9qRLu3N8Aj51qc4OJesVPcOEiuLIPpdfbf2QEozYl
	1c1gsaDHFq9d7baZ+UE1LlMm3d76ay3wmPzbFjsapF8hpvuHuxylR87EB4G8av1hKZKXtl8Dn2v
	9jRfAq3Q0ruY2J7SHeLkV8NDoXMyZJp8NItX37O6mZRPGSbYnCATeI8JtrQdiDaZTXcPd+UZSVE
	xh61AgYvgbJR9MLt00HHf8=
X-Gm-Gg: ATEYQzy+bvPeFqdq/QLksOuzi87xvbWOasLu2Kp247Qsx6+H87+/lZp1j+D6z+HyGqY
	WyWNm4vHIwipGT+o80VrAZBiLjIRvndciAzHlBTRjCky70nsHfj641NbFS6asIIB5N5fowGdlS1
	RXx36oxlPdB/Y1LcrrjR/jWp0+tcnf+jn8Ts0V4nx1R7OLlZPvdAIk9VzQQrR2IZK8XU58SpWWR
	RuSb9j5sP+Ew7ThJNeE3TJEBJeACKZOkvxUgR9Ia2neEYRADltu6ChtjvtiNSW3aHfwknwAX0hY
	gfqX0qW11JhZ3/cikShUDJH7Id2gZ32WoZEz4X0w+7ijuSmIDvybr9IrdicrBuOh9AQFNedTFnP
	6ToYlqg2NhTQoPkzWof3+mE+56ivnsroc+a8v8GZas8h6l7a1dPuEHqdSE5yfMTx66xUqZfoILJ
	UwGoTccXzDY2IaRiUkvB8b67PQApXudiNJp8waAR1QEFZGahtpeS/GFSCp
X-Received: by 2002:a05:6830:70cc:10b0:7ce:5139:301b with SMTP id 46e09a7af769-7d5be361cfamr1889169a34.8.1772612606176;
        Wed, 04 Mar 2026 00:23:26 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-11.dlp.protect.broadcom.com. [144.49.247.11])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7d58661c821sm2240530a34.6.2026.03.04.00.23.25
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Mar 2026 00:23:26 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae50386da7so19014055ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 00:23:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772612605; cv=none;
        d=google.com; s=arc-20240605;
        b=l2U3KSZafr4QqItOw7cW6a+kjxCh+DvmAAiHcaCVsftyUq3wiWIUN4wSl3FVg5oMGF
         PBInXmTl3Aq6Rt9qlmkKkC6yaS3TMpn0uydix4b17sxFVem8cY3ooeGQy4hYK8NoP/2f
         r968ICibFG/q6k1ENJA9dAb2P61b8Q73lVEUCxQ5yRhLwVFrU4XUpgQTkNnujV4zSvX6
         BalS98/9/1Ix59W/ArmMO5XQgDppsO/PvCS1q660u212kTNzLbKM3APSkHwUN+0D8kck
         ZSJL/0wX8G1devlQ+xpTk4Cc7m3IZRuB3EcpGeo8eEqM2MU7YxAq61DqIz0nW1EP8HHP
         5G0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mYi7hpIYqArL0rRrhi5ydhRomOthhV0glciTaQQzT50=;
        fh=ieLOgJg3l9uv7uhy4+FVnrX6gapgdVDJmHQ5nzHKh+o=;
        b=bV4X+opqHSRoN68v0Z4CaEDB3HrXB1lYEljXve75OnomDB1Bz4kfP6yrcH+bIIqgTa
         I+wpLIA/FxfunI/O5bUeF+xLB7cvoz4MVn0kRLOOP8G2RXtgYJwOYUE0uOu1MbcmcMsb
         QEdZApx1jlRNpR82z0Z0aMMfz5ADbbskfB3mRQ76vgXrUOER+Uk0tpD3lWL0BpLK9AXl
         lD4u6L945XUqQHrS6r1lzrz4IlLs6112bHXSyL9UB3L5PlPCllX+7JJcjzmhu7BBbSlj
         WliAqnc9NnoeHVc5PlUrjIFGupFS3GB/Bp+IrSV/LDgaQ1sKzbVMhkb9k7qp2ywqVuGc
         UZ9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772612605; x=1773217405; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mYi7hpIYqArL0rRrhi5ydhRomOthhV0glciTaQQzT50=;
        b=Ox2fQ45m2mYfvjiJgiE3tXIsgZPRHJRMmTMAYqm1J7m6F2Dq0c+AO0IoUtWq4vFftI
         oa5vXiqOfJr45QKuT3ytEWollgNL3roFfUjxfxuyW0QhKAKE8kOnfbFHTfBO9F1A29Mr
         LIlcKaYrygCB1tQ9pTijHVil+/6lUuyImpXXg=
X-Forwarded-Encrypted: i=1; AJvYcCWRq3lkJ1EKcm6ebyE94zpXwEuuP5JWvJ3he660xrjjPfNk3bAes7TyMKMCEMmngaSx3t7elmbuiyGlcI4YYjU=@vger.kernel.org
X-Received: by 2002:a17:902:fc8f:b0:2ae:478f:2ef with SMTP id d9443c01a7336-2ae6af3ca00mr11423635ad.28.1772612604768;
        Wed, 04 Mar 2026 00:23:24 -0800 (PST)
X-Received: by 2002:a17:902:fc8f:b0:2ae:478f:2ef with SMTP id
 d9443c01a7336-2ae6af3ca00mr11423405ad.28.1772612604339; Wed, 04 Mar 2026
 00:23:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303181535.2671734-1-bjorn@kernel.org>
In-Reply-To: <20260303181535.2671734-1-bjorn@kernel.org>
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
Date: Wed, 4 Mar 2026 13:53:12 +0530
X-Gm-Features: AaiRm52xhRFeluJa04ipSYZlAEEXkV2lyi_Fzn6dEMW4S-pykDswd5iE369Bj08
Message-ID: <CALs4sv3kt-yrL7MP1mPtMx_ktRRVXANRo9ZQPfA-yDeGM4_Ghw@mail.gmail.com>
Subject: Re: [PATCH net-next 0/5] ethtool: Dynamic RSS context indirection
 table resizing
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Michael Chan <michael.chan@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Willem de Bruijn <willemb@google.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000a7276c064c2e88bf"

--000000000000a7276c064c2e88bf
Content-Type: text/plain; charset="UTF-8"

>
> Open items:
>
>  - Pre-existing bug in bnxt: the IFF_RXFH_CONFIGURED guard in
>    bnxt_set_channels() only protects context 0. If context 0 uses
>    defaults but non-default contexts exist, channel changes that
>    change the table size succeed without updating ctx->indir_size for
>    those contexts. The core's ethtool_check_max_channel() prevents
>    invalid queue references but not the size mismatch itself. This
>    series fixes it by resizing all contexts. Should a separate fix be
>    sent to net for the existing bug?

You are right. Our re-size requirement check should include checking
of presence of any additional contexts and fail the channel change.
So the net effect is that ring 0 would get included/overburdened for
the additional contexts and that's an issue for sure though its not
catastrophic.
So IMO we could have a fix for net..

--000000000000a7276c064c2e88bf
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
MjAyMwIMClwVCDIzIfrgd31IMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCCpU4bS
ijwwiGsjD46tzZ6wLead60l7GWjx3y/lyKJ/JTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjAzMDQwODIzMjVaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBZe6GRB9d46IZr7eDY6QIpyndOVjX5ccamuXAiSnVw
pfIXOsYWI6Hbje8MNT2ePYBYijMINL8Nz7F3d4VaEZcjE5zFpx/YGk3ZiBy5UxAI5K6wZHCjjux8
ShvDplVwo3J1qmADR1DsOzjnmFnY/u6Ql65P6QB/06vc092KBC74xmd5Xfjxjs/Rnfny2LdotVgb
gENsI823zvS/sjiITQVWZpKsxzPxZn76s/tGiGt+W+iP4Gk9u9LCb13bW1nOka4AYAT6LmcDJS6o
1LASXJUkxUacTiKHKaxTj6Rt7om0HGiSqruSs9MqaPnGmSNfMYuYF3B9QOxRHzVDzkfkU4ok
--000000000000a7276c064c2e88bf--
