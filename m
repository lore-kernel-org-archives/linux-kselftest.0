Received: from mail-qt1-f226.google.com (mail-qt1-f226.google.com [209.85.160.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE2EC8F0
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 04:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.226
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773116628; cv=pass; b=ltHsqsWW9kOLcpgum28mhhCAgC8JjgwtXNWFBOAhUQcxXmC+/kqBOERA8f2+nW1QtiLzoCktX6WjRHqkVK2nwgjLtSjtFjJGrl0xVSlQ310AtGuk+LhlxMtsSplG97h6ElelJCC59IwLvCo5OjfUE3CDa6xCdhLb0KjvJsTxf1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773116628; c=relaxed/simple;
	bh=hUF3250RMpNT+QuQ5TvCjPXhGAR5VZmvWLL/VgMK8/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RL4CEk0i5y9QsoduiY+hwcVKVlGiWm+AzvGSdZw0GrTsLFjfo7cz5k1f0ykvO071Y3wWSa1TFCQeaj8S+UlBY8chfsMHRD/CVZxvbf9wvr5AYGtaQgBsJjg13hk3MOmuigWid3umNidv2igZ20P+0NHcN10uteeZAIJDdLru5zU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=OJo9gjGG; arc=pass smtp.client-ip=209.85.160.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="OJo9gjGG"
Received: by mail-qt1-f226.google.com with SMTP id d75a77b69052e-509006c070eso26771231cf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 21:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773116626; x=1773721426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZJS73aGgTi1Ae0ndaPZ4k0nup/KIn7saRl5+h+UuHE=;
        b=RR9OfqyKOHlgXJE8FlubII9C7VpKgSPcbpq80FOB/aA3n5bZgt0Ey58gzS9WKaIDdM
         fEaPHAWpAKamvkbgGJDgpES2zextdPabIX7RWGtNXlmO6uLFJ7xkRPWfMm5bTt4KzB3e
         ofSjhDyayjcOu+vzPJkBKK3RQCD05tkTLO0eedhdZh+eLLFiu5ga3NsLo7ecZ2jEeVlN
         oy0kAzFbAn8SVUrLvu7ecfjBCNO7dExQrhzZEJtLvcTF96YN06tk6748O+hKwun++hLh
         JxY90Cq4TbsF02zTmg4uJzKCsPjVYMRYJZbmbuoBDCuPxcuh91gETvW0MLsr5ycb2B22
         NXCA==
X-Forwarded-Encrypted: i=2; AJvYcCULxo8hENua1gdPxKvGmflr9jTgQsQwcW0sqz6R8WzOhK/quy1Xoob/g0+Q6VxBBevGb2NfE7bO3eR4mVj9xzk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl/JmDxffjGOyPk8JzMuFzYFhcP5NoF+bsePZnr22UvEcwykde
	4647Ve2DpRnzMs+jj6SKlys7/H23etMxg9acT/rSYPdpcnCymnrVv1ei4Cgl06qlM4Fp1NyjjG1
	H2vOuZeKzJizJ2HOFTWBwYkCxzEUyjMVIns9t0cJji//WX8S/vor+1urZMOmxIdZI4uB7EX+RBn
	RJ2LbkxH+vtpmX3sY850fVEdnBChYRiks+qIdCJu2pH+T55hjxgh/YTcWYKze0BC79212gDSUiw
	M6lAE9lSq61KbTvl8f7FVA=
X-Gm-Gg: ATEYQzzk1V2H0KswHSJ6yPY9z8bdPDdGuf9u+OP2+Rh2oMe40l8N5JmL5JdwFuUdf4I
	7VsSUZArIMm6H6iNFkKUNuxKIJVvO9yQObHVyhV3ZMg2eG2FIobaiQFOZj3JU2zNEclbE90JqzU
	whiGaD5CdzphIi/ycWCwqk3ad6FETIEoSN9WKAT4RTY20bvSPDBOpwFxvGxJ68p8hmmHS1aN9XE
	mPV7lWkIcCLULtMgQblq7W2241Qki3rnK9A2fyU1LuAnmNUHlGKtnJY6kA2/pplmBgc6P4Q933h
	BZ4I5941sIorlA/m5ciQ8vW5vt4FBEcIJ5vCF2xShm8Z/x901u0q1Jv+nkfxriBUXdTUzi8+CnA
	NQIN2TI95YVl2WE6xL1JLH3xG8IbGTpxiC32ofIQXUPLTOWeBg9evFqGNEkmRdHgmS74UB2Pw+t
	llyOsQLnkzf8jmviIE2gX+RMATnQtGp1XHUfALPJHbhKczMmQjL7KW9dd2omg=
X-Received: by 2002:a05:622a:1308:b0:4f1:b714:5864 with SMTP id d75a77b69052e-508f43d9864mr174406821cf.0.1773116626367;
        Mon, 09 Mar 2026 21:23:46 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-509272c31ddsm1284931cf.2.2026.03.09.21.23.46
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Mar 2026 21:23:46 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b630753cc38so56566960a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 21:23:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773116625; cv=none;
        d=google.com; s=arc-20240605;
        b=DMXa0vk3M8Et9wFiO13EPY/4c8EogBunGtZHvPPggkLgZtuJvc9pYdnRTZ+lvgxjaJ
         B8raky54fFCZj0un/W08I7rFX1VmLaALn9aoqyfk9bpf+LwqBxL9fmcKO77UrWfCtPSP
         tgY6Pi4mrPf2ilm7gPmJm6ZDVrs/ZO7ejZ93u0OWiS3/Nzl+rKjsd0TMPvkP/Vqhnd2L
         Ag2ExIylcz2M86mbQViWVI/GLCK3hfsvBv1BwI2AisB+Oz4MC34GVbTO++xs8iH6KFfX
         IJoFqcHJiXGMM+KxXVpBQ1OMBUSIVZXmKIjbbh2/nAqI+6Ma8yIRbn0IpvEK/N6Jy9R1
         U3Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7ZJS73aGgTi1Ae0ndaPZ4k0nup/KIn7saRl5+h+UuHE=;
        fh=CVwdu8mAkI30MH3qycLIuCpaoNtGTbsnIXvEQfVoJT8=;
        b=C3wF/8ph2uA69+kRouD7BaFQ27Ij1c2DU7qGACU/PwgzsZbyQALpvTVF7jxV1BJAKe
         +ELsp0HEPDLM0wIXjjC1cGCxJceA8yl+bfx9HZ2WI7UX8NYFwe3dNIdwACmD68f4jl5T
         aiUn++bP9HMXQfqSDb/2gC39z4mX+J29aN1DANm/l5+DvT0liATr7T1Y6botQ34wmrpp
         uUZAkF2iiGNlTDtk18eJPceE6/hwIxBC+bZfjhy6Kdd+LoFepMHvaJLg+MOhauvD44Wt
         eVmVwPni9HLS+SapOnN/aG0z8j7PTcwTkx5yP5IiV7UNkr983F1RZDJ6pw+Me6uJAsM3
         6biA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773116625; x=1773721425; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZJS73aGgTi1Ae0ndaPZ4k0nup/KIn7saRl5+h+UuHE=;
        b=OJo9gjGGLvDRS1Ws/UrpQv4Q0T1Mj9C2dl66tfWSBHgk3eNRiQKyQci1rKHB5IqfU1
         omEA3kHW00nOT083gUdHtJKsjKmlxb7sW8nwHNLa1KTnPl2Ihz9mBNGhLiwC5rMnAenu
         gH81eGpHg0ZJrrUNV61CvrtTyeu8orQy+U7fg=
X-Forwarded-Encrypted: i=1; AJvYcCUrXKygSGM//8fWF/t2s2SbXmGpsFqehXWFccO4wMwjPYuJ0amBdt1ICoqaYEOiaTFyukPrlbqAlWJPwt+pjr0=@vger.kernel.org
X-Received: by 2002:a05:6a00:3d98:b0:823:998:95b0 with SMTP id d2e1a72fcca58-829a2eaed3cmr9703330b3a.35.1773116625104;
        Mon, 09 Mar 2026 21:23:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d98:b0:823:998:95b0 with SMTP id
 d2e1a72fcca58-829a2eaed3cmr9703314b3a.35.1773116624708; Mon, 09 Mar 2026
 21:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309204215.2110486-1-dimitri.daskalakis1@gmail.com>
In-Reply-To: <20260309204215.2110486-1-dimitri.daskalakis1@gmail.com>
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
Date: Tue, 10 Mar 2026 09:53:33 +0530
X-Gm-Features: AaiRm52FYCIyREK6MESWfjDO3-RMjQbILdCDgd1YRxseZc-VMmCMM3-Kz6DIc-A
Message-ID: <CALs4sv2ZPHvmBcwitb0NRVxtbnQtf7742QH2nOOjowYWTF2eZA@mail.gmail.com>
Subject: Re: [PATCH net-next] selftests: drv-net: rss: Add retries to
 test_rss_key_indir to reduce flakes
To: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Nimrod Oren <noren@nvidia.com>, Gal Pressman <gal@nvidia.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000009ae7b7064ca3e203"

--0000000000009ae7b7064ca3e203
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 2:12=E2=80=AFAM Dimitri Daskalakis
<dimitri.daskalakis1@gmail.com> wrote:
>
> The test generates 16 flows, and verifies that traffic is distributed
> across two queues via the NICs RSS indirection table. The likelihood of t=
he
> flows skewing to a single queue is high, so we retry sending traffic up t=
o
> 3 times.
>
> Alternatively, we could increase the number of generated flows. But
> debug kernels may struggle to ramp this many flows.
>
> During manual testing, the test passed for 10,000 consecutive runs.
>
> Signed-off-by: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  .../selftests/drivers/net/hw/rss_ctx.py       | 29 +++++++++++++++----
>  1 file changed, 23 insertions(+), 6 deletions(-)
>

LGTM.
Reviewed-by: Pavan Chebbi <pavan.chebbi@broadcom.com>

> diff --git a/tools/testing/selftests/drivers/net/hw/rss_ctx.py b/tools/te=
sting/selftests/drivers/net/hw/rss_ctx.py
> index d7cb30306368..51f4e7bc3e5d 100755
> --- a/tools/testing/selftests/drivers/net/hw/rss_ctx.py
> +++ b/tools/testing/selftests/drivers/net/hw/rss_ctx.py
> @@ -166,9 +166,17 @@ def test_rss_key_indir(cfg):
>      ksft_eq(1, max(data['rss-indirection-table']))
>
>      # Check we only get traffic on the first 2 queues
> -    cnts =3D _get_rx_cnts(cfg)
> -    GenerateTraffic(cfg).wait_pkts_and_stop(20000)
> -    cnts =3D _get_rx_cnts(cfg, prev=3Dcnts)
> +
> +    # Retry a few times in case the flows skew to a single queue.
> +    attempts =3D 3
> +    for attempt in range(attempts):
> +        cnts =3D _get_rx_cnts(cfg)
> +        GenerateTraffic(cfg).wait_pkts_and_stop(20000)
> +        cnts =3D _get_rx_cnts(cfg, prev=3Dcnts)
> +        if cnts[0] >=3D 5000 and cnts[1] >=3D 5000:
> +            break
> +        ksft_pr(f"Skewed queue distribution, attempt {attempt + 1}/{atte=
mpts}: " + str(cnts))
> +
>      # 2 queues, 20k packets, must be at least 5k per queue
>      ksft_ge(cnts[0], 5000, "traffic on main context (1/2): " + str(cnts)=
)
>      ksft_ge(cnts[1], 5000, "traffic on main context (2/2): " + str(cnts)=
)
> @@ -178,9 +186,18 @@ def test_rss_key_indir(cfg):
>      # Restore, and check traffic gets spread again
>      reset_indir.exec()
>
> -    cnts =3D _get_rx_cnts(cfg)
> -    GenerateTraffic(cfg).wait_pkts_and_stop(20000)
> -    cnts =3D _get_rx_cnts(cfg, prev=3Dcnts)
> +    for attempt in range(attempts):
> +        cnts =3D _get_rx_cnts(cfg)
> +        GenerateTraffic(cfg).wait_pkts_and_stop(20000)
> +        cnts =3D _get_rx_cnts(cfg, prev=3Dcnts)
> +        if qcnt > 4:
> +            if sum(cnts[:2]) < sum(cnts[2:]):
> +                break
> +        else:
> +            if cnts[2] >=3D 3500:
> +                break
> +        ksft_pr(f"Skewed queue distribution, attempt {attempt + 1}/{atte=
mpts}: " + str(cnts))
> +
>      if qcnt > 4:
>          # First two queues get less traffic than all the rest
>          ksft_lt(sum(cnts[:2]), sum(cnts[2:]),
> --
> 2.52.0
>

--0000000000009ae7b7064ca3e203
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
MjAyMwIMClwVCDIzIfrgd31IMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCDqJ11L
ZMpczRHmDGCoHumh/0Pq8w7nV4zwIz0hj1Vf4TAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjAzMTAwNDIzNDVaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCJyWsMDkcDtm/MLGpk14n+VjnVvNh8ZKfOkJdFJ9Tj
4STY8sI/1eKHmvNmGALNW52HayZDfqSVqe/9n+FVHF17ESFGOBUCWrimOd06HhmNJrgUxql+/Tv8
5UXAtPD00ApAW+bSPX0aksHUYoHjf54NlF1aoePVMrEb3qDl4uGfils7mwMlcJ37dl6NNyAzo5t+
1m+/bHUfn9w+AZKBt0jY2cY5ImqaUhVHQxMnAjuuwBKjGQWYrXgt89FeI98FuUCkfvqWpW08yAad
O89A7tOCGEY75okJBN4yyCbToSoYJEnEX/JhJve38vfl2xFl3mgaR3w1DK0/coUoyc+D405K
--0000000000009ae7b7064ca3e203--
