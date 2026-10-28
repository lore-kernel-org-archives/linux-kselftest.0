Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793169426;
	b=KcNORNJO/mvJSubPFmDhWhND3mYI7j16z6il6tegKb3XhUXurymHMae/JgayI4TkBofK
	 jsFD5mH3oZHhdxFz/ECsfzgL3qKSQjHORJkLt8pwiFRkGPR7CW4kzpB6kpqRms55oiA+M
	 frpEynbH4vz4Or38JM934jaHQfr+rfsg6lJCP22mAN9zk+rEBJ4/YEgt53F6sRzS5fAAr
	 wjltDDkUzZb0qrr58+1vxhs6D6g3zkxDIvYULT9gZlDOs1DiZ0p6siEm79CK1IB9UAcbZ
	 GWEbNx4g4jX2W5RQ7Ds6rkpVydJ/p03Wm1U3tSJQT/iMrY240Gjx3VTMdp/hyNX2HtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793169426;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=SeYlOquqDLQBH9Y16GXDkKjl3m8NYJwfUOszgy0yDfc=;
	b=borT+3q2WSmCxuKXMkv5b0IMehBJE6tkOI74X4Btjxcqam23kjTptAhWAJgGCXseQgkv
	 70nLnxXfUz3PPRThZeRSMJ9jbttjDZl7q5u5qrxwB1YU1vvUccLwVmTAogxYSVmGKrkaH
	 yh5VhdBDroy0GheO9/gOrw5CK/oBrQu+zRCXEAlohnR9tDs4lcc+2hEGE9FdTCBUzlAGr
	 0IPrXG4ZkzXozTX0gPeHc+16CGhqbKAFLP84kz42fCfPBPdmZNflHHPm7ov/UaPWU/a+d
	 ovHwG2by3QIplzPyXYNhu0Oz+eNrihJO0rXylu0jeG8NXaQrer3vCpNfTl1ISso1ZVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Huek2mJD;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E84606A31F
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 06:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E84606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Huek2mJD
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so374141a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 23:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793169425; x=1793774225;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SeYlOquqDLQBH9Y16GXDkKjl3m8NYJwfUOszgy0yDfc=;
        b=de31N57UlO8hwh/H6lgVQjuF5TmHXyZkDvJ90rYQjCGt9eRLYdM6K4iX1eJUSdPjRs
         72y04BXc13qaje3NTN4BrFR+xct+80LKsaQzQ+hYqGYI320hYdeanNpTNGQj/27vOhDy
         WXcOPXdSRH2P+bUJi+LsnG8EmbGbQ8AFPYGDuhh7t61abm7ibEuBYfaULuaGmkJf8U6+
         YnCUCtTdWqa+NJMZYu+56EHdccXau5wsIYxyqeB24GQGxVZyogj8MwUB2mWacCNFsBLT
         KxP7+iB+s0nergfMJZIMIlQXft4hpcYcwGRX7tsRN91OyY2oP00tnR1s8JzU4PGUVIBH
         r0rQ==
X-Forwarded-Encrypted: i=1; AKwUvBxO37AUepiI55PTuOg9azDiibzKKcOR1QBDOvzjKl9Yf46B/2huvb/LpAHqvNTHz3uv7De4IeOjNSZk7wbRy3g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKZwVyUB7tX7DsCC8I+BH/VsgcgNZHSG6TOelgfH4X9ySef752
	7dtU9ZPnw1lNf+naMocFU9C6JF0bdFSaHpGnomOyi0KeJVIY154PeNcnfKNP1UGteZsFLsJFoeM
	VZpGNbn7n6qIUQkU4JSljEg29BUvXvdQBJJ6juoWOVB4gND6k7RCAOep//5Cxj9uLue9Xp3OGzB
	CJteJs+f+lJHuMQCu2KhMTmoqUyuq4+tgO+i/9QzRgpcQl46xbMlIpbuq66h7fhdpjBZ2HDA7g5
	yGLkvVSxKmoBh5rdhfI5Q==
X-Gm-Gg: AYBFou3xhPt0VImhgQMQf5i2dKFEtoQYzn86d+MW3Pc8d7R1rGzK+hVSj9Xv3tUJPGU
	BZxXPQdH21luJjbJpfLjV0fw9MiqRKXwvVp8Rtv1tJfOzTyBh1BXSl5Cy17YWX1FZu51KVgxqWQ
	vXlki7dZWKMkpc5xD5wQw779CrJxgXUKKjuYdHF7fXdCWxj+WbxqoTC9snucgkZBBAI4Svk1TCk
	zNdLZ0ERZSuKOaCFAR3XWDn21fpItgFGqUI/Q7+fKn48qogo0Lpqx6tlt0JXad4vrURzGi1d3Bu
	mo6+6SFYEQT9JnKIC/H1KX8paWhsa+V3ahT3vcc97mR2wG3zbLKXoFSUc9brMxmw66RNjBhRW/r
	OBhnVM5Yuk7lCDswQxzfKAxhZw4VfHLldkFwhT/c3Ngl/WO4SotvRNRXJ2P5dxlxQFupT8MJ+iw
	nRJS54hQ7RZQQF/9anfWNlE7dAH/jvIxOQ3Q==
X-Received: by 2002:a17:90b:3f86:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3ae5c8ab399mr315821a91.33.1793169424832;
        Tue, 27 Oct 2026 23:37:04 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae5a655d30sm908300a91.7.2026.10.27.23.37.04
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 23:37:04 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a05b68f851so1673077b3a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 23:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793169423; x=1793774223; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SeYlOquqDLQBH9Y16GXDkKjl3m8NYJwfUOszgy0yDfc=;
        b=Huek2mJD19KDl/zybgyV6NmRGjAPNxEc1ZErVt/nhca/d3QBvxdkjHCc0hkgmLf73e
         4hUPjCN1AK37LGF1M0wFdcgjIR7sw0R/NVG99dnHrDqAxoDJJ7jhwSNhR1BFVprtJOl+
         dTmZTd2XvV3FRY/VaOKZyUrg/AvgNLGhGMhFY=
X-Forwarded-Encrypted: i=1; AKwUvBwxv00ZILmKQ3S4JAg7mgW04U13068z1RdtI/49VifaziPv90DRO6/N2qej0RquYWItFRJbLc4Yd+lgHhQQSAU=@vger.kernel.org
X-Received: by 2002:a05:6a00:2ea8:b0:8a0:2882:852c with SMTP id d2e1a72fcca58-8a5a61ebd1bmr2630263b3a.51.1793169423206;
        Tue, 27 Oct 2026 23:37:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:2ea8:b0:8a0:2882:852c with SMTP id
 d2e1a72fcca58-8a5a61ebd1bmr2630256b3a.51.1793169422838; Tue, 27 Oct 2026
 23:37:02 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025040523.678027-1-weiwan@google.com> <20261025040523.678027-2-weiwan@google.com>
In-Reply-To: <20261025040523.678027-2-weiwan@google.com>
From: Kiran Kella <kiran.kella@broadcom.com>
Date: Wed, 28 Oct 2026 12:06:23 +0530
X-Gm-Features: AclHuK-xiaLaTaJffCEzdjnvnAHPfm-GS44uQy8U-8XXD_ERkLiZ6X7YePgcL9w
Message-ID: <CAPHeo3e4aySBroVOr9WeScb=nc_NR8dmjc-mhmCYvVNOqQPV5Q@mail.gmail.com>
Subject: Re: [PATCH net 1/2] net: Make PSP skb extension survive packet scrubbing
To: Wei Wang <weiwan@google.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Daniel Zahka <daniel.zahka@gmail.com>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000848598065ee0ca74"

--000000000000848598065ee0ca74
Content-Type: text/plain; charset="UTF-8"

> +void skb_ext_scrub(struct sk_buff *skb)
> +{
> +       unsigned int id;
> +
> +       if (likely(!skb->active_extensions))
> +               return;
> +
> +       for (id = 0; id < SKB_EXT_NUM; id++) {
> +#if IS_ENABLED(CONFIG_INET_PSP)
> +               if (id == SKB_EXT_PSP)
> +                       continue;
> +#endif
> +               skb_ext_del(skb, id);
> +       }
> +}

Thanks for the fix.
We saw the same issue with skb extension reset when testing with
vxlans associated to a psp device.

> +EXPORT_SYMBOL(skb_ext_scrub);
>  #endif /* CONFIG_SKB_EXTENSIONS */
>
>  static void kfree_skb_napi_cache(struct sk_buff *skb)
> --
> 2.56.0.257.gf7497c7d27-goog
>
>

--000000000000848598065ee0ca74
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
ksPFF8lRQaSHMJFFWI2usTUpS9gKxRAuJyHc0xlNKy4vK2ZEic8RWs34T6LcL98JR51RaKtE0Dw9
7F/uUf87z+/74aOyyxrTl58LlkxL/+1yMEHZhyn6z30LHQuA52TSp7uD3au8gu0YN+hKIsPBKVbs
dzf/bW6eDpGSwgwRzqF2BcDBOUA9U2mB2cxinBxOxCVbYRy//Q46OuAx0pXw8trIkPDdp8kHAoWD
7JxJ70nrdMy8VRmC02NQp185/6szeMFYLA0CAwEAAaOCAdwwggHYMA4GA1UdDwEB/wQEAwIFoDAM
BgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3Vy
ZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcw
AYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIARe
MFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZo
dHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBo
dHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIwYDVR0RBBww
GoEYa2lyYW4ua2VsbGFAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8GA1UdIwQY
MBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBS/iTArBeV9hFyyktvkwzGbaKne3zAN
BgkqhkiG9w0BAQsFAAOCAgEAdavxLwcm6Kj3S7/bA/IO6B6MTHIndKyB630T3CTPeOeuHV7ZS4wr
rDZbrSjERD36308lnaXSESlcu8LX2SKJ0KqNM3VQNTawSKS4wMXlyTzOBfaslsjtFiT4jQW9Py6u
6nf1EVoQ6YTCGJ+htyKqFgIljJIdBBOvXY+gECh/DC+VbLUVK9CgZLKkFJ5udhYvw1tOc3zOXGOd
kwaK7AtwRSLgNt5RSAaikL6bvU1kUWgITNKKhBK5F3CNUbR0hD/i7yG6Afdh27V1T7FEdV07fBbu
3+AVnAdbZmHfnB2T8lHTaR9GbgkF6lG/a8I+eUG5NPrDEM+afXT7/+zOTjf799qoyhMdfgp90DEW
9ukfyqfUq37ctBG4TdnDlxtkwy9XYw0Avotf2lrYy+6MYjt3cZFF+AF/F6ANk+Gx9zH5gyeUlruJ
+aqmP1U1lX/n2YEXAfiLJulbb3Jfi8lvyYzHXpHLIFtLfyVOzUXdGdj3dVxxFSPJ4uXmpk2SLExM
W7+cvJ+PxSJyWK723U609whQmqbVRz5B49CjNt/exjWtBGGjCwLPMGNWbHbwtDVWcoZzE0KoL7EK
VPB0t6uom5ElZ+qieZghO80tR/MW2eL8i+EiVMwq5GF1Ni3D6uypwZYqgdicI0YGj7JCgrIzr1kC
xwtQkw5ij2CCUWXxadt/C9gxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBH
bG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIz
AgxbhXTUwXZ3dIWSpigwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIA9Oc71jdteu
Q7Ubx187XkZx1ZNJDDpO0N0E6LFZsz7ZMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTI2MTAyODA2MzcwM1owXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJ
YIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUD
BAIBMA0GCSqGSIb3DQEBAQUABIIBAMDMtL6KInmrnKkQe7mvzgNdLrVIAEcXL2YSXiMEsXeE720k
pWossB2D7FT4J3bYYsKUKJUMllJP6eL1N8fsdxtuMSNita0TpyEMD0wd108JQiqOjNc5KgXhIkG5
oF55YHw6OtwhYPbcL8RHgTfCUoPkR0KKdUz5MxyzY2Phx6gU4etlfaurCQmXbGBxmJPR8TNvCK8e
LsaEStPyKJPz1cnUW5hNi5ZS0648RiZU70o0HzTU4m1PHa5qi+2mdga5f0NMH6d71/P0bwt91c/J
on8GtbKo/IpLomU3lcEHdN0CxmpHA3t1/oJ7QVB/GEVt/ymHXtf060/grL9Tveua01E=
--000000000000848598065ee0ca74--
