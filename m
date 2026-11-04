Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813530;
	b=wl1b5ANgwdNHubrJfw9gfXlqs8rhZBxysEQo/dOSkNtnZJowydtYhDtJlaColOlJZVPq
	 qxovW6RaB3UxFSOfkhK9gihsUITNYoNpSp+j50Oz1TlMOwgEgYypHpSpx9at3unCuegRn
	 vsCAPvCjZxLAM0ccFGCIS4XR2jzTgYFcrz0SIj8CRs69kEF0RsRIyLKEpZbHJx8Y8tsb5
	 CHRat+DSKdC7efdDRU/+qOGu1dkiU90KQEJ+du0pM2H5/XX5s9N1KY+1uEpDu7Am0V6jz
	 3npIM0qG+RVK/gxuzZDng2kGEiOlHd2ekVUnilzx0FAMwGckha6UdevWLellPGARSCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813530;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=+1ncrwsT1tf9ZWkkHoZyIzTqzNpXPvaJacWlIGcHnWQ=;
	b=JuK0UNS+LPAJGfuenHKjVOcCXP9mjPlrXLsxtcrliFMtcjpso8SERJvuCRAB1vbWVXa9
	 ykhIRmsTL7vG3FsbMPqJ3cNSu9KtSQukOh+hDBK/b+9K0A5GphUsrYwqDPw0Ap6r2bvxL
	 9zxPd0NvgiohQHOwPplqgWQL+nycaF2iBNt2rUHwVdOHQnTfYmg6UBUhwd0wBpAEGQRb9
	 KZtcTzl5dv9lImOby96JLTQwH64YdycDrElFb7gLRJbq79E8nbBgTcjwgxPhqzd8HE1WN
	 u2jO5/JLkq9o7DIME5J5r33paA/adanwwTJjxEbWZQkzIQThRwPjL8gZcq+FSTGsq6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KpxfvQ9P;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A12606D819
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 17:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01A12606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KpxfvQ9P
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1349489a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 09:32:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793813529; x=1794418329;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1ncrwsT1tf9ZWkkHoZyIzTqzNpXPvaJacWlIGcHnWQ=;
        b=MdUMXT7cBSfRok3sdXhCet00jZCW/DsnW5IilP7nf0CNLqZsqUpBEp6hBiH1FuHKdF
         N+7+kazVztuzWFvaLQ9rItcrJWz+ClBfLyoBlCIYtpSHgpqzzsV/tRdeW/lE74ClT15N
         H5+7hUnNhQtzR+SEJYQrPsUmWZabeP1yzJsa6Ad/CvA0w3Q0yMXaTEEdzlYjw8nc+OGz
         VwpZGgmEarVMTMCGdFWoil+PTZRTn2u1Sdn+bPrPs0XAtmxkdn1gFbeKf843DB3GpkZC
         o3wB86Rkn5GExq1FSEYvoLXQLUy7OulcNk9hqLIPAfrz7kXI583S28gbwrFulfcRQAg8
         s4yA==
X-Forwarded-Encrypted: i=1; AKwUvBzqNFQTtEtqOU5sBhd7KKTbR2FN+S1vkl49PRRoVZwzOVhhvtxdMqJBhflYvcopq9UGdYhy75j1s6Rosv3l58E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9H6DvLeoRmeIsPdNr9mH5xOtJyHd+PHgbERwiAoAp2x05G0U24
	0uVpoeCumMDlmi6FUBF4j97EEiZhv+RjQtBTYdgc0GkiQvopAuNrRYAImQbxId+XZR6p6HKySVo
	l1yeuA6ce6WkuDlz09v2+bfRyrKVCnQ/dAgPRmPHj20KsSHZ3gl09v3MFeD06cae+IVwFnFd+UL
	/mH5uQk+1CMdgzjnFlTQeB0SAEY7SqK0TuBokty2zHyYtKLUHsd27qHOAAC+qIb9cOsIzQVCByV
	154CTWZWxnptikm0o2uilk=
X-Gm-Gg: AYBFou2gVLcNwgfucHKTYYW2a5+H7cO0Dsr2tlPkBoTS/G6K35qNAJGf0iljbWBIfOW
	IHMpagxOMqPnSQm972QEJFdwX7cd/Ugzp2ls6ItG3ZnpPtGkddC8dBh0G3NB5r1TtENzYCibUil
	AB/+dVWYBKZQ5OVTYB16+1l1Jz3xqE0odBeNc9Q1Z6Qmj+vOVggrIQ9iZDCULRoSUIGwYwT5vFp
	EURRMAhlotjJKqrt33w/2AGSutAPZgenV9pdBEJvCI+6Lxx0nu/kd2OlvWTFeiR4UtE3JVIXJV6
	IuhO6+4yIoiz/wMvwIHWN9hzoEo5fj/ZqH7oo0NsSySy8qFWloco2xD69SZHRcosuF48nh/IYPT
	x2xZmMMsQ7c6gtB6tpWq0ImmTJRiyDJiVJ9cNnXaN8z2yyZ8wYY5b6TqpRUAH08zs6ifcTeITHk
	BhS2ZTxWRPXj0A66smtbXtNmX/s1alJA9ZBmM=
X-Received: by 2002:a17:90b:17cb:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3b0afc1479cmr93771a91.10.1793813529162;
        Wed, 04 Nov 2026 09:32:09 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07c7ae5besm4497262a91.2.2026.11.04.09.32.08
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 09:32:09 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c25501f4aa2so127060266b.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 09:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793813527; x=1794418327; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1ncrwsT1tf9ZWkkHoZyIzTqzNpXPvaJacWlIGcHnWQ=;
        b=KpxfvQ9PuxPg3RzfiA23rOCPwEX+6IMKYC98GhJ7lL+Da2s6jwIDjTqM8BSj7y6wtx
         lCEUJU6WvZqnDTZr6wwjkk8utHAZwqzAlX6uEcgK8vFwxxctDaTuI7U+cQH+Nlbpgspn
         cIxTPC/aN1ZUNYqRxsIgkTonCFURpKpjTgwdY=
X-Forwarded-Encrypted: i=1; AKwUvByT31vHSzBzA1PDyvX11Hq9KmgLU83puVqQtkFWQLZ4wL7/A2szlnyHivb33Z+o4+yXUSAZZ0+Eb+f+MAuAEho=@vger.kernel.org
X-Received: by 2002:a17:907:9801:b0:c2e:4397:7c82 with SMTP id a640c23a62f3a-c4d20526692mr17467166b.6.1793813527263;
        Wed, 04 Nov 2026 09:32:07 -0800 (PST)
X-Received: by 2002:a17:907:9801:b0:c2e:4397:7c82 with SMTP id
 a640c23a62f3a-c4d20526692mr17464566b.6.1793813526840; Wed, 04 Nov 2026
 09:32:06 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103235152.1904727-1-sdf@fomichev.me> <20261103235152.1904727-2-sdf@fomichev.me>
In-Reply-To: <20261103235152.1904727-2-sdf@fomichev.me>
From: Michael Chan <michael.chan@broadcom.com>
Date: Wed, 4 Nov 2026 09:31:54 -0800
X-Gm-Features: AclHuK8YtVOL3myvdL2uYnlIyQ_gv4m4kts5k3isZHopKsJcxVZbscgjL0rPZXY
Message-ID: <CACKFLimMMzsegdRkdjoWrOSYazeAC7Cjef8f9nUXA5vsERrRoQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/7] bnxt_en: let the stack segment GSO skbs
 with too many frags
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, pavan.chebbi@broadcom.com, 
	sdf@fomichev.me, almasrymina@google.com, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, razor@blackwall.org, daniel@iogearbox.net, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000001a3d9a065f76c22e"

--0000000000001a3d9a065f76c22e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 3:51=E2=80=AFPM Stanislav Fomichev <sdf.kernel@gmail=
.com> wrote:
>
> With MAX_SKB_FRAGS > TX_MAX_FRAGS, the xmit path linearizes skbs with
> more frags than a packet can have BDs. For GSO skbs, linearizing needs a
> large allocation, can produce a head which doesn't fit in a BD with BIG
> TCP, and always fails for unreadable skbs. Clear the GSO features of
> such skbs in ndo_features_check instead, so that the stack segments
> them. Non-GSO skbs are still linearized.
>
> Suggested-by: Eric Dumazet <edumazet@google.com>
> Link: https://lore.kernel.org/all/CANn89i+ps_CozfOyRnKav0_LUmSekJ9ExB5JkD=
bTAVf_ss_98g@mail.gmail.com/
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Reviewed-by: Michael Chan <michael.chan@broadcom.com>

--0000000000001a3d9a065f76c22e
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
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCB/yA9N
ZwZU4itAbRr0FoEH6SuqGjX1X+kYgFnsARy9VDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjExMDQxNzMyMDdaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBDnB4CB3BGkTb10sSCqoaHfqJAsYs/gps5ftughMo2
F0P12XYm1Fvdm0JJcbGu1ZKmdv4OaI02CIIt/pTr0YkDxHQKdTOJ6aXo+8Rlz3CHm5c91DImOlRz
BrnfsOauCddB9HxP9qcr42nu3D2H9up9++YOzDfTAliS4/V+r10KbaMd/m/xhaNzHRCHtR8EcyGX
vW3eAmZnmi41MsMpf/jC+SpqelrRxHIAkrZPUcqOAte0x09JHONAxpUYu+zIQLHZ5sNE6CbN0tDP
H+qOja40RiWKceUEUuDKnNbzUJXY0FWbM+VaJTZPmugqCiEs1rQNSglMTR/hYxcE3Ue8aXdL
--0000000000001a3d9a065f76c22e--
