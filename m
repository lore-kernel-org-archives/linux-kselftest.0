Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ACE378813
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Mar 2026 09:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.225
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772702744; cv=pass; b=qVSO0Lc6FhbAuJkTxkih+vc0SMIdCnKUHSy8cTt5YWR9zVvTIY3oP7aoEvbJRXA3Guc0ICZgM6wHJ30k/XirqZNyh7eA/l3sS7gWCxaOTdVpq2XEpEriC+Dd8XSyDRm37JSU9lnQlTJA1x7C6RY5ICH576QP+fn2m8lKYk+c1xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772702744; c=relaxed/simple;
	bh=1R+bT2mAP8akTVIlTZGnfxShBzl+PjG5w+9lrOKC7J0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ACwTDrJ/oknpkM94vTxRtQtFN6WZa4aNuRmrNnWtFRR8rIcGch5GdjHj6JQfAHK9PjC3+dZxwB9t5eMaf35OPvK2O8+H+AE3RFXoM2YyVGpUBa1WHCRzeYR2bcCXt2JISsSGRNzJ+tcclOP4YF3RI/1X0eFNBSR0qI2YsPMZZTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=VCSn5OsJ; arc=pass smtp.client-ip=209.85.128.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="VCSn5OsJ"
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-7986fb839f5so67988917b3.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 01:25:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702742; x=1773307542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4GFPGghPqcpUSTQPs7OqkiOqW/UBKhlteCAwfVchP8=;
        b=fFH5okD+UgGueue9Qu+KmMFESkrwBYjtec/EX4bC89kDvmx6txfg+JaSxuAtalZku3
         T6nzJxIqccky9wTj6xFHEqsSMyB6AbJePjuBD7Sqjm/CbWrwfvnN3ZVggb3vmFejI+wK
         XmwZ4awNYgOfapE7KsWyhSlBqAcaNYITNQ/0nPBdmXOeGK92k0bkTadFToWH1TSv3PQd
         t9IPAJYTxDXznObblXxNWGo1uOkiIj8kpJvhSBNRex407HMWu2iarWUQHV+xBsDNIrWD
         FE8usM+cSrOzCAkObzdcXa2YSKryd5W0ottqpfKA85PzG1UK+HYxTGfVppn1I+6CZaGB
         4LDA==
X-Forwarded-Encrypted: i=2; AJvYcCVQ0EoQYO8a3TSDfoKyqTNLxu9ZqodcpqH2ED/Win8Yeu++QuRXdGheyO3VlHaqyBsIFOfCH4atCoY5BPA3i7I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz95wOeaQjae3sND2SvHkdvfhF9Acw/8e5uWymuuovH9wiIvNee
	DdXEuSA+4FlyxS0v1K537eKImM3p4wsc4n4ZGltg2AgU5R+woRXQqKCu8TibnHTlP0TdKZDQIfK
	MOrkhvkF8rt/ED56++ppLjt/7sAUMVeR4Fa8wIf7j9do8gvRbeSTiwJW4dSD8TMScIRqYtcBZ1b
	e6Sbmq4SaV4GGw5Imu/hTE3ozsIICK3yVS0CSgDS+uP+ERRTY8JxGxT2huRW8YXMqerTFjHJilL
	yZLEwhderOVT6A/f0Sg8Ew=
X-Gm-Gg: ATEYQzxSAhEN1f1kaiPdyxwritOP9/bPuQU3t5PgizDp6XnGnUmBZE1CtDH00mZ0B2L
	dFqhO/mHc3d8dSbERzTg+hfYO4h5mmfaMaBPMVNhYZJife2QFUiHxLVyw2cEwdlWexRDXZ/U6/H
	kep2GpOjmV1hYFurBvg3j2vIdkv+vEUM42qs2LjMi6DqAt+bRaFYYdDeVzn3AJplbErzDqI+od8
	ONfMWJkaOLA6X7EZkagUi5EP0oTiLt7JxSuonpKmCWboSfTuIqqtcMmKHnaphmBgI+SSmv6/Kz+
	wkHKmfoLZ5y0zM9FgIYVu1EPc8niYeNGup0PDPli+rymEd40F3CNTaL2aCILgg/y8Gvd713aYgM
	5HbXjOxy+n5HSiB0b2DX1S28VE6RMadeOIHJpWxy9AjRnNFISuz98Lz0+gVgtQrZZotvTUCy/7l
	4ojLIJIFLbqh0zWBOlwTaqgRNVLeOPPAe9hrhI2OpSszM5xnkdfApL/EwPq3c=
X-Received: by 2002:a05:690c:630a:b0:797:bd3e:1feb with SMTP id 00721157ae682-798c6cc786dmr44073087b3.35.1772702741523;
        Thu, 05 Mar 2026 01:25:41 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-79876bf333esm29117767b3.16.2026.03.05.01.25.41
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:25:41 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8295eba7de1so1276846b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 01:25:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772702740; cv=none;
        d=google.com; s=arc-20240605;
        b=SEcDkRxIoxWuC5TZdUfA6nmnWt+rpgpjwFpPJ6iZGpLt72xF9FtY1YWkerKx1AvA9F
         S8qif/AKo2012JL3IbaD9mViJGyrv26V9EJfi39GPYYgsqgAkRw91vn2vV1td2bQyviF
         Fh/KGR7f9HVYq1wAsJW7gEpETQnGcjyT6DA1En2BQiKr2UqkI9/YwLAI4llDCCvl9bw+
         H1ny/n51ogyxSCiWKWXuPB9uzjr+lab2ZO8hVd3iJv7sjEXxbBk2ySufB/wWxCl+YoBP
         LyAaO6DbBlTay/FZ0GwrrYq4JqzpWb+VtBP2pJq7bRCTBSkIl9umWxkBanTYcFi/uDih
         bjsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=r4GFPGghPqcpUSTQPs7OqkiOqW/UBKhlteCAwfVchP8=;
        fh=WCQOODuTctZ7QSr0qNdw6gUTfUB0JZEGWx0XL5iTiYo=;
        b=PpCCU98sIxV7ApTgIa7LPqBfSKWPUzpNuVO1LsTlLMX3ZOVejW7VcU9ffoWO2CNyRf
         ZrrgbaZ/aWvOtiOMBZaFj2IYVi71qakooay4Q1nYYLtOCmrawBGMAblqXPJUC7hTIpRs
         N3fiZkqhrqTr0G/whsXLDHmpE7RI0NFbfcpb+Kfi64WGsnA8A6kWQfbCMS8sjMv50BjG
         XIzT1nSBNjqId7RQX8W9Me8T0x5InW5H3hEHHVpjaJ8G1ulHdOjSI5K5BOZI6ySytPwc
         wmmUQ4cOHeXjDCHidg3WiYtNS7NuIFooUeWFOTUUAOQQ3QotO56V4wD48CkAGBe3yrM3
         B1yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772702740; x=1773307540; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r4GFPGghPqcpUSTQPs7OqkiOqW/UBKhlteCAwfVchP8=;
        b=VCSn5OsJ7tl2brZCPRgZWO8RW3ZwWTlp+Dky8THAUzVAAqe2sPvyl6oSddejEY/2w2
         az8XMhBrYhYBvoMVxJTEmWH3SrC/qT3i8H3OlG0fETgXhgXLQpX+02ACZDBM35ORYz4d
         tVdZLFPPczK8PNEKOiReFDhycWgOQCba7mPo0=
X-Forwarded-Encrypted: i=1; AJvYcCXBQxKMn7VHsfdxkaZWh/1ptafHKfnZlySp/gj4XF1JRGvcBc8il6gs83aqKuPIBdmv0fY9LYNC2nScQKQpE8A=@vger.kernel.org
X-Received: by 2002:a05:6a00:2e1f:b0:7fb:cf05:93cb with SMTP id d2e1a72fcca58-82972b7df71mr4082449b3a.1.1772702740290;
        Thu, 05 Mar 2026 01:25:40 -0800 (PST)
X-Received: by 2002:a05:6a00:2e1f:b0:7fb:cf05:93cb with SMTP id
 d2e1a72fcca58-82972b7df71mr4082439b3a.1.1772702739818; Thu, 05 Mar 2026
 01:25:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304131855.3225539-1-bjorn@kernel.org>
In-Reply-To: <20260304131855.3225539-1-bjorn@kernel.org>
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
Date: Thu, 5 Mar 2026 14:55:27 +0530
X-Gm-Features: AaiRm52Y89lYHjruwmeefdiVUQxLjY5nBghjtlkES1yuGch-T7ZOXwwZ_yXSG7w
Message-ID: <CALs4sv1ndtPm0bu9hZ5tNHQYUDG63V_A61zAFOiqW1eR5+3_qg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/3] ethtool: Dynamic RSS context indirection
 table resizing
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Michael Chan <michael.chan@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Willem de Bruijn <willemb@google.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000261fca064c4385c1"

--000000000000261fca064c4385c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 6:49=E2=80=AFPM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.=
org> wrote:
>
> Hi!
>
> Some NICs (e.g. bnxt) change their RSS indirection table size based on
> the queue count, because the hardware table is a shared resource. The
> ethtool core locks ctx->indir_size at context creation, so drivers
> have to reject channel changes when RSS contexts exist.
>
> This series adds resize helpers and wires them up in bnxt.

Tested-by: Pavan Chebbi <pavan.chebbi@broadcom.com>


>
> Patch 1 adds core helpers:
>   ethtool_rxfh_can_resize() - read-only validation
>   ethtool_rxfh_resize() - fold/unfold a raw table in place
>   ethtool_rxfh_ctxs_can_resize() - validate all non-default contexts
>   ethtool_rxfh_ctxs_resize() - resize all non-default contexts,
>     with locking and RSS_NTF notifications
>
> Patch 2 uses them in bnxt_set_channels(). Validation runs before
> bnxt_close_nic(); actual resize is deferred until after. RSS table
> size only changes on P5 chips with older firmware.
>
> Patch 3 adds HW tests in rss_drv.py (devices without dynamic table
> sizing are skipped):
>   resize_periodic - fold/unfold with a non-default [3,2,1,0]xN
>     pattern, verifying exact content preservation (main + ctx)
>   resize_nonperiodic_reject - non-periodic table blocks channel
>     reduction, with an extra periodic context to exercise
>     multi-context validation (main + ctx)
>   resize_nonperiodic_no_corruption - failed resize leaves table
>     contents and channel count unchanged (main + ctx)
>
> Running the tests:
>
>   # On real hardware
>   sudo NETIF=3Deth0 ./rss_drv.py
>
> Changes v1 -> v2:
>
>  - Dropped netdevsim support and netdevsim selftest (Jakub)
>  - Split ethtool_rxfh_contexts_resize_all() into separate validate
>    (ethtool_rxfh_ctxs_can_resize) and apply (ethtool_rxfh_ctxs_resize)
>    so drivers can validate before closing the device (Jakub)
>  - Shortened helper names (Jakub)
>  - Replaced scoped_guard(mutex) with explicit mutex_lock/unlock
>    (Jakub)
>  - Removed defensive zero-size check, bare expressions instead of !=3D 0
>    comparisons, ! instead of =3D=3D 0 (Jakub)
>  - In bnxt, moved bnxt_check_rings() before RSS validation and
>    deferred actual resize to after bnxt_close_nic() (Jakub, Michael)
>  - Added comment that RSS table size only changes on P5 chips with
>    older firmware (Michael)
>  - Use non-default [3,2,1,0]xN pattern set via netlink to distinguish
>    correct fold from driver resetting to defaults (Jakub)
>  - Check exact indirection table pattern, not just set(indir) (Jakub)
>  - Use ksft_raises() instead of try/except/else (Jakub)
>  - Removed queue_count=3D8 from NetDrvEnv (Jakub)
>  - Added ksft_variants to resize_nonperiodic_reject for ctx coverage
>  - Added extra periodic context in reject test for multi-context
>    validation coverage
>  - Added resize_nonperiodic_no_corruption test
>
> Open items:
>
>  - No user-controlled minimum table size yet. The plan is to record
>    the user-provided indirection table length in the context (e.g.
>    ctx->user_indir_size) and use it as a floor when folding: reject if
>    new_size < user_indir_size. This way the user's original table size
>    serves as an implicit minimum, preventing the driver from shrinking
>    below what the user intended. Left for a follow-up.
>
>
> Bj=C3=B6rn T=C3=B6pel (3):
>   ethtool: Add RSS indirection table resize helpers
>   bnxt_en: Resize RSS contexts on channel count change
>   selftests: rss_drv: Add RSS indirection table resize tests
>
>  .../net/ethernet/broadcom/bnxt/bnxt_ethtool.c |  36 +++-
>  include/linux/ethtool.h                       |   4 +
>  net/ethtool/common.c                          | 146 ++++++++++++++++
>  .../selftests/drivers/net/hw/rss_drv.py       | 163 +++++++++++++++++-
>  4 files changed, 338 insertions(+), 11 deletions(-)
>
>
> base-commit: ed0abfe93fd135dac223e87a3c945017b1fa8bfc
> --
> 2.53.0
>

--000000000000261fca064c4385c1
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
MjAyMwIMClwVCDIzIfrgd31IMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCAiesSE
ZRmQQYIkNATb8cMxa5Dnqk0gDKq2ueJE1i/W5zAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjAzMDUwOTI1NDBaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCg2z1wKPzXxwcA60IkqsNdSS36leg8HPknWz8EwNTD
+poaKT/s2wcCiSGWPwsj0nZVACg/ER4PUW6nVIy64xzUVHzEZpOJ5CGx/y1Q7DV+YFuWV855e/wk
rKx570WT4LTsw8RooRmROHEM38ejpEYUeW7I5S4Z1FQhORdGcSyevAmm6xyvOAAXjMiMVPy10Uqi
/tOYHiCaEzIx39o4M+bAwFaRLelgTSVYSEgdJVZ+/ARPbLxAwv5ceBO0Nmsm1N4WzG00QoNN8MvL
lfONerXuk6w4bRI540uFYbJNle9RUWDu5bMIJ95k+u6El2aRyUKukJDcuhxKlzhS816pOIBv
--000000000000261fca064c4385c1--
