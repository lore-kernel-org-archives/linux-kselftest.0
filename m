Received: from mail-qv1-f97.google.com (mail-qv1-f97.google.com [209.85.219.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DF7349AEA
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Mar 2026 08:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774080106; cv=pass; b=SB+ozm5U2Ms93TpT2mTG/bp++eWNhlMMEZmtK5IYWE2pC/QfFZWft4scoynLi9yMNRjwjtj5k109ZdXwl0mDxtEYrWAOK1aw/M6GTvnTqKMsUCqxUFg5YvJgl+34EMNus4guWb1x+WlwwLSv7g9U6ftNG6UXAQZ860Uj6sCle8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774080106; c=relaxed/simple;
	bh=fpfllOy9XWjzboviiy+ExuGIijNiebuskzBDmwcoCZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eH1zRND6Qa8o4elFoJAVU15Hce8BxmP1s9HLknTe1qE8Dg5dcEv38vh4C3jFN7ZIXOmJQGHqzzOO4orWSmN2ODOCZLLwlVyy2AoUb6G/cT5AiYiRx8FLq6YWIZWFWj9R4FU+u54qs5JF8Hsj0VJfLN4qkVECCaSM2LW3k/TO9EQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=e452Vh1N; arc=pass smtp.client-ip=209.85.219.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="e452Vh1N"
Received: by mail-qv1-f97.google.com with SMTP id 6a1803df08f44-899fac9caabso35932196d6.1
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Mar 2026 01:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774080103; x=1774684903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZvVSOa8rAboQIO9/xn+cKlul739vkD60xVx7MkctyY=;
        b=RgkvsiCfAsv7Ekiz6f7Dojrc6y/MfxOD+gshULvrqmAB0tOm2PRCdHXOYiI893JSI6
         obxroms65zRWdzScmfXLU11hURyTpbG4HLyJqna+K2lJDpAOyOcvFGgvgfQRDBPOD5Rg
         o7kihGplODrpcZpft28fO3DDhZI16C/QIKHXG61Se0CFKpQpEdOuEB7bazvoDLtzIjHE
         XZPZ+XM/pebg8pUeFmrtZf2wwJlkAi2Rlu7+7D4p9j7tJwAgtAKKsW3v4t/Eqj59jrgh
         jn4FgelIHrC4Ckv5vn3LDjhcITgDy5Y2CrH9Kq3dGchHaibnK52+mOufwGayXWrClKsJ
         +LcA==
X-Forwarded-Encrypted: i=2; AJvYcCXHyMV3yLL0DcQtfx40gI5wTWvEPNlp/gQr77MlQcpmPNbuHhgMs3mA76Pa2+A6ywrnmcRGKxiiH0plGQEgo/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDWm6OkLWsEiJD/3mj1D21MHaMxtlSlbvJxUa06LQQVOC5c6S4
	nAU+Ofwg3qbjHTpQwTOC1W//z1R2Oxf3YNex5o/jpnxOjgYKshlYH9zE2Z1eMTFh/k9858pajB2
	w9mFUgdRN9drytFKPxuPFnIq6beMwgn3iClHa5eh8bKNgeY5QG6dhPppOl5QpUKNx39u0ODf6rt
	YtUnjhpQMg491OBqpANQXfC5vmXQq8whN5N81ihPKHKX8u7whk3xMDhe4DC3mv7B58FRmffMv0a
	8srAUixSOcOfaYrt+pRefk=
X-Gm-Gg: ATEYQzxXalIPgYDZ8g9pLloSj6InvOmuEfL+9cTz3Eb59ekenX34foM5m0PZmIRu44k
	z7prvfj31te8ysd2xU1NLIMCVENII+Wfq0AX9YNZIbEvo/96QqedboBu48RATFbPLAwNP1i0roZ
	7e0Y/lzQdCPRpYzs1V20b/HYKj9AQjJwmbYRhwEIS/zFyH8r9uZpPohFReeI8i0xIWuGXT7zqoc
	K11AaAXFLGfttZ/91WWMntrM7H7rLpWD+E45wT70ukoOeH1EGyRo9IMFnwrgpBGE51aujagX4zw
	pvyg6BSdrPEUHUAIMfViLypp6y8vr73NRBbgC5VHTGsU8oJCklKsPzCT+Xf91fnXlzvxDERfweC
	XcAD58YjY4JqYgHNIJeA20bDxYlQNtW8MMQJ304RxG5XEhLG6+LUR1IM8CW8hu+1AqGVZ+fe1g0
	bnCi3kgwj+J03zIbqWEnVrJDZ1HzfY5RIYij8gyOH6DkL3vAG3zduc80/4I/4=
X-Received: by 2002:a05:6214:529a:b0:89a:1364:1027 with SMTP id 6a1803df08f44-89c859e9424mr96987206d6.14.1774080103372;
        Sat, 21 Mar 2026 01:01:43 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-89c852dedadsm4629136d6.14.2026.03.21.01.01.42
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Mar 2026 01:01:43 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829a535ad50so1725546b3a.2
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Mar 2026 01:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774080102; cv=none;
        d=google.com; s=arc-20240605;
        b=hHr2fPk4NnoDf32pmTVUH2BLqi6LM1M+6nH4+p1iAKpD406Yfn7UB1mIqrEsU7aixK
         ejqQO9jEc1tmwXh3KlX8NKtN8p+mjPv0Rn28P9bGsKwtK7AkhUmfNz5WlgcHAXiLYwF1
         qn5ylqMk/rvYFpJfv/jtgs2Y7OlWSF3dxy9UGsCCnWst0qAtwztYzrxJus8txW6Kfx31
         8oKASAzzqoQbz2YxfaDVu4worF/KEXuD9q6Qk6izTz1nLUiwHeDIaPG0oLEAMv8MDaa1
         yp9le9qVxrTVeZI2h/AW5O5XRUTjunGjEGNeT4yMQmy2mjQuWRoFWjCghjxDCr4JiGxK
         XtXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AZvVSOa8rAboQIO9/xn+cKlul739vkD60xVx7MkctyY=;
        fh=fqeg/og4PKO2hUIBxJlErK63wqc+ruCY7rv99hEI0ak=;
        b=CADJU9apAOP8WYKvJ2TwLpLWolQezfxP7mxMT99pBu5sJ+Ajad5hbueVAvMu+YfAgB
         dqoV2o+nzRnZU8aEjWgbOY/wMad6NU3pYxLhgi1hciv3ERsuzkfd1VlwM14GQNb83Ilg
         /EHWFYwGfePMkjJ21XZMxhO5GTRWiKqnlGO+6aQdH+6UCcZZQQAnIV7ygwE0eSWBdrxM
         601xEo9kjOMIVTX7lUqmkGdBC0ftcmev7SopkUW5DgEXm62+W1pQrcnH7ZDL+KBdGjU3
         LwwWm+COVRoW8GdIFJirXcrxj13CNCtVMVRZmOngiSc/+P6ggx1cnC7sVVzHEWSbrv9T
         nW/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774080102; x=1774684902; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AZvVSOa8rAboQIO9/xn+cKlul739vkD60xVx7MkctyY=;
        b=e452Vh1NYVwruGhQK0yi+9ZBKgLKvJA7jE8eG8RnuhlP3XBmo6ptp1xEpiAx7qpyhr
         3RjU8SGIAYKR5YFlzBGEyX9mY7koBoJVQzkKudYQApsbpUzGPKqc40ITibwfdSl/0F7G
         4RfLGaoedYhA8nQU6+og08T9xCX4JkjMon2IM=
X-Forwarded-Encrypted: i=1; AJvYcCXEWQW97GewX9pWdlkLcwwDSSf+lF4EuHFTlY2wDf/i4xG7SoIieS4STj1MKMjexvFPbxuOiOkzGPcr12l6OQ4=@vger.kernel.org
X-Received: by 2002:a05:6a00:368b:b0:81f:17b:c70f with SMTP id d2e1a72fcca58-82a8c35ddefmr4974967b3a.29.1774080101628;
        Sat, 21 Mar 2026 01:01:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:368b:b0:81f:17b:c70f with SMTP id
 d2e1a72fcca58-82a8c35ddefmr4974935b3a.29.1774080101121; Sat, 21 Mar 2026
 01:01:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320144141.260246-1-joe@dama.to> <20260320144141.260246-13-joe@dama.to>
In-Reply-To: <20260320144141.260246-13-joe@dama.to>
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
Date: Sat, 21 Mar 2026 13:31:29 +0530
X-Gm-Features: AaiRm51S_XlZZIGLgoOSpSAY9m1T-8iETPm7TxU4TZECq1lYTfDv2HgwSavZxbY
Message-ID: <CALs4sv3+Fs=rwhKBGGxAU0fc+Hi1x00-occLwObxq=sqxOFNJA@mail.gmail.com>
Subject: Re: [net-next v4 12/12] selftests: drv-net: Add USO test
To: Joe Damato <joe@dama.to>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	horms@kernel.org, michael.chan@broadcom.com, linux-kernel@vger.kernel.org, 
	leon@kernel.org, linux-kselftest@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000489a8c064d843613"

--000000000000489a8c064d843613
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 8:12=E2=80=AFPM Joe Damato <joe@dama.to> wrote:
>
> Add a simple test for USO. Can be used with netdevsim or real hardware.
> Tests both ipv4 and ipv6 with several full segments and a partial
> segment.
>
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Joe Damato <joe@dama.to>
> ---
>  v4:
>    - Fix python linter issues (unused imports, docstring, etc).
>
>  rfcv2:
>    - new in rfcv2
>
>  tools/testing/selftests/drivers/net/Makefile |  1 +
>  tools/testing/selftests/drivers/net/uso.py   | 96 ++++++++++++++++++++
>  2 files changed, 97 insertions(+)
>  create mode 100755 tools/testing/selftests/drivers/net/uso.py
>

LGTM.
Reviewed-by: Pavan Chebbi <pavan.chebbi@broadcom.com>

--000000000000489a8c064d843613
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
MjAyMwIMClwVCDIzIfrgd31IMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCBnqR+m
sH++0J27IsFUud/IBRgIIza5pkqaOosRtLSk/DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjAzMjEwODAxNDJaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAyim2+JVJUIfHnBB7p10+LKUaJqIUtBQcJ6xIOWjc6
fv0zzo8c7hTM5qacIsjWgp38n21s3mi+EpZFU9GdmKF/8Xah44LQui8zWQelo/dSpvPlle/Id4fg
RUY3gytYy3a6+pYyWxxQA+lgczo65ymgsntWMtmTSEdNHTC96m7Zzc03XLtQVCQqLl04Pqb35kpi
0saVmOdFyNFlsSzk+U6SGg/LcaCapYyB0ndcTsx2oVTjuGFBxs6KYWwoJkSLhL3VVzKcExeZ5sKc
BgPnO5aBYMjE2UdelcdDT0lvnAGI9ZwKxr9HjE30/DCrO1U5WNVEQpmpZ3OeDkUGcMv3K6x2
--000000000000489a8c064d843613--
