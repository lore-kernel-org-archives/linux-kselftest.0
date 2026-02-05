Received: from mail-oi1-f226.google.com (mail-oi1-f226.google.com [209.85.167.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892B713D638
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Feb 2026 22:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.226
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770331518; cv=pass; b=Biw7JIBRS972+OF7/TYuxz2LZXeWmdUdZyAkwpn32yLDc1rKcc+saRHn3zxm1y3HD4OtgmGoHGMs4KkJQIOhb6eji1mjEnwO2jQSaNLMeIrO01X57NyHgxlbSa7xbV1cZ8IYavm/wGb2tj59ZrF9u+2uVrQF1JwGuxNrGCYFZqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770331518; c=relaxed/simple;
	bh=JSX5plZ8jyji+do6QkbhlJs8OAIi4Es7QEUmVdske7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LHnl+svPlHtgh4Tx9hUcGA7NSN52JqwWVAaDWfpSJJ+uam7bEaGsl02G/GZd48hS/3xU/YnXY1SfpLyDp7pr0d8Z1oOvRWZQnxposkW+ts3jtnEHluvwKmWSL0VX1z0E16+UFxJpcmc9H2XR76SvwfAIWpPEVynJFhn8YiA/kk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=E3z4yK/Q; arc=pass smtp.client-ip=209.85.167.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="E3z4yK/Q"
Received: by mail-oi1-f226.google.com with SMTP id 5614622812f47-45eabce608dso1049839b6e.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Feb 2026 14:45:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770331517; x=1770936317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hv3mt7wqhxJOwTsggnA549GTsI8MDD1YWYDdB4Q460s=;
        b=qKs/Qlqu06TH98YmeCcpVCphwS66EG7lQf/319qsvDpN9cVk0ksk+Zyusto7XBGKHZ
         ys9f1VDw2OzOAu6uEdHBvQLNDNvKL31yqzc4ebyIsmbwUaFsmw5jA4IyvReXGJmCqkGB
         LcgCB+J56QyJr+MvGl3Hdn/5ygVU3Fmbx/WRgR5xSPTGkYAR4zvEr6KM4Sc1f4zBzHa5
         3xs6o+hXUFigiAqUvIgiAMCpOv7kaQkqWENY4uqTtPkZEECDc5bmIK9XKWAR8Sye3sFb
         2SiAzgfTycgyVY5sSytD6XBcRGPzR+8RIyFyxiAmjH6dIziQTZjytWnqlrBGuE5BisiP
         Sn0Q==
X-Forwarded-Encrypted: i=2; AJvYcCV3YNJRfPyZWMEvHbTWOrU3SefCBY1WP9xA5bH8ezsAS7sufB8WrZ3BwlnSpuhlk7fCzmaMnb4pkr1dFe5ffWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzblxFgpRfnsEDHrOA26HSjdszZDtob7c4lwu4InmjByqH2hC9T
	/mVWe0hnU9B9XWDFjGzcOPQhFhJJmwLfVBHSrdZlRBvFk2kxGCA5MtLajfCcY2ynyko7I76njGJ
	MhkRsoPnT8LCPwuT8EppGD9c5TvH+aNU786rJV4Q9f00wOc5PowmOlsrVj2VR1vnM3wdZ8iOAQv
	1kt3OJbf3+ZxJ4lqojcR/zLCM0PC3tJYuNldrIUBlQohajOuwFZiAqyPa6UErvy6j5wZu9nvYAw
	ZazVQLlyNMUiuw9xv5Jf9U=
X-Gm-Gg: AZuq6aL54CwcO52QD5YGi4m80p6ltLTZG5dl+6Szk0A5vGQr5/0kmS6/qFPY+IJebk8
	oCAWrqmCRTi6iiEM11xflOrW6yjejPTNnGSD+Nta5CqB0xRWe2CNIaGuyrkVKVTx0d7ZktdVq+B
	0ZOy9tmRW/oqOsHjIDfSra5IKQeKSthIGaAK5YOG9gY3VRnIC6UMCS0EfzBzbazLxBEuQfF0o1F
	5xPyJQ9m/kAMKupmAQ+6LphCdx+RDbg9PInydtPrK26QCqLZL4cN5eO14TQyfBiQVVy9i04owaD
	LbCE+uhQXWJQFMEvr7CQvbkQjqalvYdnTAmw08YGM3NmmkE9m9vjW4f+vPVF89RmwGYSgOM0qEO
	HzouQy/v3fwI4wmuyfOvJKLgea/H5mv1FirVUHqrc9cPSy4ug2p4mIgccbyN8k+3jPcQa5rGKPg
	5G9+xQQf6E48IM0mU0myHYwQgbNe0In9jsK7CRCuBPxw==
X-Received: by 2002:a05:6808:1707:b0:451:4c6d:a635 with SMTP id 5614622812f47-462fca626b9mr420960b6e.19.1770331517364;
        Thu, 05 Feb 2026 14:45:17 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7d464784e35sm71423a34.6.2026.02.05.14.45.16
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Feb 2026 14:45:17 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6580e793380so1809993a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Feb 2026 14:45:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770331515; cv=none;
        d=google.com; s=arc-20240605;
        b=blNSGKCCj0CdclRH6Osgqs+lg7fJymN1DqKnEj8lR0kV4sIP6DnaJRAEabB6YdiybG
         /+qNQzASmnkkKwQoe9zYqm54yc/Ds11+r4Y/jdi3DzCdtTVjakrw6LLCl2krsHM56KvB
         MjT3K1m1kHsfCl3hv3XDq9JOKVI8Vk31lDAYl/fQcjfNMvfxRN8Kh3vqGkwD8FB0uwog
         Qf/5g9plwT/u/rxn4TAHC4RTmBT/PA4L9HYlQpveOIARw86mJ3m3ve+JTFp/GfBP+LNY
         2Yog3/L7XvB+o8Q1IflgO5nY/tcVNWtjB9KtVPkPeWeWS6eyb8KvkqKsKc0/ghUP3sAY
         5KKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hv3mt7wqhxJOwTsggnA549GTsI8MDD1YWYDdB4Q460s=;
        fh=iHsP84R1Px57OzFXjYbD1asBzhVtzXJzf5OwXH/4CaE=;
        b=k6r4OiVygu9DZAxGeZyIM/ZRCnRvGM+Y1k7k01UsfbtWhR2nmdJ0eYo8LjXmxhuOzH
         b653d6UjqswWrzcB4sETLRu1X/ft+MvPzH+Dls7niHYyzm6oJRk6EM67jpZ0lXc2RtMw
         MwKnapB64dc+2L4ebhXbIYqSvOoLktkF21RnDx4LFvzabmERRSXSa4P9LWX282UtF1Wh
         cm6oihPgWMS1gu9cG3wgRFnHoDlJbObS1Nc+yBY22zLTvp1l8Uqm2F0r+A8ISm8alTyB
         yty84MkPumfzSoWojYYo3wb7QDP27fwPZ6428x/KdmJ1kR7X1k03rtcPKr4rjYhWekwg
         MeWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1770331515; x=1770936315; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hv3mt7wqhxJOwTsggnA549GTsI8MDD1YWYDdB4Q460s=;
        b=E3z4yK/Qvq95JvPgk7olYAo3VUSUJAv/dkP5jbP7bYuKpXIaSCNfVR4qEHRr4CbnqX
         6TufXPxNKUK8+pU1Y659YqZDnQ+mmuClWDJmM0niofEhDoYmAAOXyeKdzy9Ru8YeLL8k
         c9mCOve88IyiXXv7iq8ZRRn5H06ZF5OnlBNw0=
X-Forwarded-Encrypted: i=1; AJvYcCVgXLw3jQXjM1trH6bQxCo2ypTbLaCCvOB6PYqcWD4DXbBRkRYQcCkS7kmeLHijDO1445zH8Fb3xplPqx4B9IY=@vger.kernel.org
X-Received: by 2002:a17:907:7f8a:b0:b80:3738:2f11 with SMTP id a640c23a62f3a-b8edf1782ddmr33592166b.13.1770331515528;
        Thu, 05 Feb 2026 14:45:15 -0800 (PST)
X-Received: by 2002:a17:907:7f8a:b0:b80:3738:2f11 with SMTP id
 a640c23a62f3a-b8edf1782ddmr33590966b.13.1770331514991; Thu, 05 Feb 2026
 14:45:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205220541.2992807-1-kuba@kernel.org> <20260205220541.2992807-2-kuba@kernel.org>
In-Reply-To: <20260205220541.2992807-2-kuba@kernel.org>
From: Michael Chan <michael.chan@broadcom.com>
Date: Thu, 5 Feb 2026 14:44:53 -0800
X-Gm-Features: AZwV_QimaC23pTcmSmt1ce0IYHGrRHclQwJRgHzSmLFxDhodjo-7112kLG9KJ_w
Message-ID: <CACKFLinY4qNTf-pPQZ4R3efm8F4EnAiZsOqPknLcc32qTaiHUw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/9] eth: bnxt: gather and report HW-GRO stats
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org, 
	willemb@google.com, petrm@nvidia.com, donald.hunter@gmail.com, 
	pavan.chebbi@broadcom.com, linux-kselftest@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000247563064a1b6dd6"

--000000000000247563064a1b6dd6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 2:07=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> Count and report HW-GRO stats as seen by the kernel.
> The device stats for GRO seem to not reflect the reality,
> perhaps they count sessions which did not actually result
> in any aggregation.

Yes, the HW count includes single packets without additional
aggregations.  In the driver, when we see only 1 segment, we treat it
as a non GRO packet.  That's likely the discrepancy you're seeing.

Also, for completeness, should we count LRO packets as well?

> Also they count wire packets, so we
> have to count super-frames, anyway.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---

> @@ -1804,7 +1804,8 @@ static inline struct sk_buff *bnxt_gro_skb(struct b=
nxt *bp,
>                                            struct bnxt_tpa_info *tpa_info=
,
>                                            struct rx_tpa_end_cmp *tpa_end=
,
>                                            struct rx_tpa_end_cmp_ext *tpa=
_end1,
> -                                          struct sk_buff *skb)
> +                                          struct sk_buff *skb,
> +                                          struct bnxt_rx_sw_stats *rx_st=
ats)
>  {
>  #ifdef CONFIG_INET
>         int payload_off;
> @@ -1814,6 +1815,11 @@ static inline struct sk_buff *bnxt_gro_skb(struct =
bnxt *bp,
>         if (segs =3D=3D 1)
>                 return skb;
>
> +       if (bp->dev->features & NETIF_F_GRO_HW) {

If we enter this function, NETIF_F_GRO_HW should always be true.

> +               rx_stats->rx_hw_gro_packets++;
> +               rx_stats->rx_hw_gro_wire_packets +=3D segs;
> +       }
> +
>         NAPI_GRO_CB(skb)->count =3D segs;
>         skb_shinfo(skb)->gso_size =3D
>                 le32_to_cpu(tpa_end1->rx_tpa_end_cmp_seg_len);

--000000000000247563064a1b6dd6
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
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCC+lkX2
skH3fubBx2WMC1HPy2tO8J7ESm2i3NEqGAegoTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjAyMDUyMjQ1MTVaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQClLUyorbpEoX5OCxB8gFxy/UNS42ZuEkzQxQW3Cm04
bnIZjKCd2UEr9hppb/mox5EPVbb0pS3xo7qU7kX0Go95E7jbEHz5hTMPeYH2nlUCtgYvGg67Yb8H
+GHK8fHJ3OEEnTmHLGv+CqnxAypqudB9vOHbABmGJd1W4ZxwoKkHh0YdpzRQdssRphTatA2OkDRF
KoWpjLYz/GZAS/x+r9RMc4JvCFJMHc3w7sxP06OIn9AH73uEx+NsM3WAGSbYPQj6MY8pbXcqUSYI
0AqY0VzzLQq5td+hBYlG51eTfN79pcOwM2qdETz6IXJweItOhnoBbfQ/OgHpobULxAswPc6Z
--000000000000247563064a1b6dd6--
