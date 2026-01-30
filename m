Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF0434CFA8
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 07:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769759045; cv=pass; b=qvoiU7T4MXUCA0CJLaBkFQe0vffjkZ3sk2fwwX0MO1SQ9DkMOVNbQspCrizR/oZfm2vWlVFTUNG7KNk7dcsWc/gCS8NQmDhPpGON0mI8AW0IQuxKta6NHemnnwdhjZHF6Y0iiEPuiEQLqlnr1Rsj/3wy8/pf0mS0TwKI2/8VfsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769759045; c=relaxed/simple;
	bh=OLdD721Km+sBGZdoPFxc/Kk6nSCDjpqCyDzAutbzxe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hqCFtDIQtzPXj85CkWlE6j67gNBuWkv762okmF4sdGxgN3KDKtlh27PGVqOQpo8P5Mpn+qCXhnBtL4IXbjYqFo2T/5BgfuD2PMJ07n2WaBIcTeVosDLp7Ic+nfEUBXwotBa6p/ODDK4FbOYEZNpjhueKicPYYYkQ8pskHeC//Ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uFlyPvdO; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uFlyPvdO"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fb5810d39so1219096f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 23:44:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769759042; cv=none;
        d=google.com; s=arc-20240605;
        b=N8tABxP7kqaw6WqudPNKFKXpkXPLlaOisIE6lD66sxJwBk3Hib7DLSIiQe96Kzl7sN
         RHuzEVJxuzbJyBglaTUqC5OJ6of7cg2Oj8xslSjZnTMkOZoM+NE3yczBMlE99zDj/ON9
         L8msSlkCkic7GBlo4GEn2PUEmqENjQxyuL5/qpzHvZuVoY/zZc6fjpIZUgCXGvhlfiL7
         k35UQqRcxOSZRaMdgeJ5JMOyshh1V+u9poas+kl1RHNCSGq//sBlOboweqEsoajJIaP5
         LAaBIjBPwWFtK+9egGOjkSBT7yMJz2CyuW7t4inHSgmhnGIn/MVdvfSeM23aPOnWvU4D
         z80A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OLdD721Km+sBGZdoPFxc/Kk6nSCDjpqCyDzAutbzxe0=;
        fh=pI5GRgQBVG/qJNkYtpwKz3ZjB7xaBfu8ZS25EOgCnAY=;
        b=jWAVWy7hKvr8kFfryCAlOykh1QGd0oVDZaGTXRqbStgJ86DT6YV0sPrb65kQ3mpOnX
         cy7V89TV1VgvBeHE1vXPVF+hot+0m2PM4I+iAtst6jMIrjExHuxoYsG0VM3N+lr81Hps
         4yeyPHT9sBtcUB3PD0tqXhOf8+c04M55BCflIR8ud4d+PnSEyXMbyeFDMzLMQZMgX85e
         t/HcvEVMnLglbGdlI/W80mwZR1GdXvFxBQ8amczHFrB7LEolb2WeJQiYviJIxlsaP93H
         3DWQjIfwLaE3rqTi0dFFKAkQingLUcl5dnGpk0iicYn62DwBvkbWCA9pTDRfTClHUfOB
         uHDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769759042; x=1770363842; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OLdD721Km+sBGZdoPFxc/Kk6nSCDjpqCyDzAutbzxe0=;
        b=uFlyPvdO9xgCuxe8zrQV6Bq0temUTBCpsT7YDYTNrAtVVMghS9Z698nwFjk5xlgBPj
         v/XJ8VTDcPDnu/O61Tkw21JW3V3PJty4WUjhrd+jGkIbTEMT5LIseeUruu6fWxPpWvbQ
         zf2S6NO/vUqvkq1IEBE6Lr0gYfxmEbfHaNc5PmpJNuokt6KxU5yplftFbxqmtgZmkFSh
         p4YiH5ohFDhxYJmuclhK1iu9ryOCZvtpOItGykIfaG0nJJV421Wf4r19Xe9T7hiWZ9Cp
         MLYQLYoM8z/YwqVeTq271kAtzDHNR4KGTBc7+wbywvHCRA5MY63nInivLZ4NiVHecbZe
         ccDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769759042; x=1770363842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLdD721Km+sBGZdoPFxc/Kk6nSCDjpqCyDzAutbzxe0=;
        b=dXGTGqXCq8NCwc8OO4p76UT6YOWEd7LmcSbu5eRGMdCc4LNH6JjtA/azggr3m4hDCT
         IvOQuhzynfOZf0GNEsj7Kdvs3BpE/bwEHeSPfAVK67EchZGz7kwqpt9FTumzms6Gr5Wa
         G/hhMIeOrTvGf4an8L+kHXwesM1xXyT6TWqjRJ4u7NcQTTYl384hc3n3PB4KSGx60i54
         K9NxjJTARj91YT6q7pjKVRlGFrmCS0XKt8Thyqs1r/Cb3VX8zdiGDCFqLfyJHew3kwDM
         YA3HUzZbZl2XoYuWYMYrZsvYJsC+fAmq7aCim6e+Osh7NIrR6CGKxUbzZUxitqa7gOTf
         SfgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+h4o+GQdoEjpz223w9AR5sHx4RR1NilQLHf0DhFqyeTgAUpjJ1yTZkjRmp/Up31zTZhtxsZcXlje6ta0/EzE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8BmB032nsQRDVo69O0OU8rT94fvC9sMi6rlgMc/KGKlhfFcbM
	Brztwmar9lJtsWsAm51jmbzJK/0DiJy6hlxXSBkF7Sy7+bVySfoNahXR/Zv8YowRq/1Fb4yrnJu
	VTHxvFNkai7D+qQLvOIbL63jBd1V9PKJuIXP2f8++
X-Gm-Gg: AZuq6aI0cQUoqH00ucDa4TzllnVbjIP+KG3xpdp1p3BJ8dp9hs3edmqOW9HnW+/Fe88
	Mv1bs3/0Vcco0kPnS2eYLSzAlMRRn2LfH1+4sX68npnc2TOggdCYpkanvXT0WqmWbDleRszCMpT
	9gKW7QoK6Ucj2+BOq56v/sY+8kZGZ+uJXlIY+BcadOIFVlYCXcNb00xNWc8dJ0kVxGUWDQdQDaB
	TAjoA/FnsqvsYxnCS3N8tWViUezdQvE2HDRrKgLFpYvfEQzzZfuFM0XSnTy3/q3MNuG0Q==
X-Received: by 2002:a5d:5f82:0:b0:431:266:d134 with SMTP id
 ffacd0b85a97d-435f3ab2f8bmr3170440f8f.53.1769759041535; Thu, 29 Jan 2026
 23:44:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124054134.71369-1-note351@hotmail.com>
In-Reply-To: <20260124054134.71369-1-note351@hotmail.com>
From: David Gow <davidgow@google.com>
Date: Fri, 30 Jan 2026 15:43:49 +0800
X-Gm-Features: AZwV_Qh9fGVkNfUiRvz-ASmJQ6vwlGAhram4n7UK29bp3f6E7zK0HOR_D-CwIOY
Message-ID: <CABVgOS=w3N2gKmJDZ5LTa3Eyqw1=+Yaedy-_mwDbBZWUR68a1Q@mail.gmail.com>
Subject: Re: [PATCH] lib/random32: convert selftest to KUnit
To: Kir Chou <note351@hotmail.com>
Cc: akpm@linux-foundation.org, geert@linux-m68k.org, visitorckw@gmail.com, 
	brendan.higgins@linux.dev, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"open list:S390 ARCHITECTURE" <linux-s390@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000000be75c0649962352"

--0000000000000be75c0649962352
Content-Type: text/plain; charset="UTF-8"

On Sat, 24 Jan 2026 at 13:41, Kir Chou <note351@hotmail.com> wrote:
>
> This patch converts the existing prandom selftest (lib/random32.c) to use
> the KUnit framework (lib/tests/random32_kunit.c). Unlike typical KUnit
> tests, this file is directly #included into lib/random32.c.
>
> Only the file name "random32_kunit.c" keeps random32, "prandom" is used
> for all other places for aligning with the API semantics and avoiding
> confusion with the cryptographically secure random.c,
>
> The new test:
> - Removes the legacy CONFIG_RANDOM32_SELFTEST.
> - Adds CONFIG_PRANDOM_KUNIT_TEST (defaulting to KUNIT_ALL_TESTS).
> - Moves the test logic to lib/tests/random32_kunit.c.
> - Updates arch/s390/configs/debug_defconfig to use the new KUnit symbol.
>
> This commit is verified by `./tools/testing/kunit/kunit.py run`
> with the .kunit/.kunitconfig:
>
> ```
> CONFIG_KUNIT=y
> CONFIG_PRANDOM_KUNIT_TEST=y
> ```
>
> Signed-off-by: Kir Chou <note351@hotmail.com>
> ---

Looks good to me. Thanks very much!

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

--0000000000000be75c0649962352
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUnQYJKoZIhvcNAQcCoIIUjjCCFIoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
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
Dxz3AgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFHZtY3XkWtC2
e2Idfk+0JyK7BLzzMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQBo
hqjbVaHxZoT6HHUuwQcTlbgXpuVi59bQPrSwb/6Pn1t3h3SLeuUCvOYpoQjxlWy/FexsPW+nWS0I
PUmWpt6sxbIRTKPfb7cPk32XezfnA0jexucybiXzkZKTrbI7zoMOzDIWpTKYZAonB9Zzi7Dso4An
ZOtz/E3yhdR/q1MK30d5fiCS0vorEd0Oy8Jzcc7TJ2HGMzEEXiFFvVrJYJHvfYOeXE4ywAG6YWO0
x78+bXeB9vkeWHhOYKyYXuAXrnHASddEICg1QlJCHDAISMC1Wn/tjqTMTt3sDAe+dhi9V1FEGTbG
g9PxPVP4huJEMIBu/MWNMzHfiW4E7eCHVPrmtX7CFDlMik7qsgQBbO5h6EcxBamhIflfMgoISsRJ
Vyll2E5BNVwkNstMgU3WMg5yIaQcuGFgFnMTrQcaLEEFPV3cCP9pgXovYDirnB7FKNdCZNHfeBY1
HEXJ2jIPDP6nWSbYoRry0TvPgxh5ZeM5+sc1L7kY75C8U4FV3t4qdC+p7rgqfAggdvDPa5BJbTRg
KAzwyf3z7XUrYp38pXybmDnsEcRNBIOEqBXoiBxZXaKQqaY921nWAroMM/6I6CVpTnu6JEeQkoi4
IgGIEaTFPcgAjvpDQ8waLJL84EP6rbLW6dop+97BXbeO9L/fFf40kBhve6IggpJSeU9RdCQ5czGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAYQLf/BIzLow9kWqD8My
PzANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgpSYem9nWBrQlpv5X0CSAF1Yga0+z
atPvIeH3mVZ+2BMwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYw
MTMwMDc0NDAyWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAn7r9VAUioa4XMdc0fJHLrRSYnq1Vnw3FkARqkTt/6x1DwDAvA1cTOkJ1ZDeIUPle
k4iOfhMPKrvq8F+3VYcwkOrbRwDRL9fXWv7SxgWWOk4tRK3i33S2C9bNTYbqg7S7hxKiruJuNiYG
IAlH1JZmdd1/aKs+20SvsFizjhi8mB/fjahpLnYqsQodikLlip1VbxSy4OCWLuWPRPDkFAjapnCB
hf5Z+tuaOjiZ4ZbRL9cMVi2P+qVkQPvYC6PeGtHLEej4RdTyRaqsWm9cktreuN497E4oFRT61nIe
/u07JdkHkEzPJVAtvsUDKAU95kOKl/RN1W8+GlphUdViuFe5/Q==
--0000000000000be75c0649962352--
