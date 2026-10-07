Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B3848F84A
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 12:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377144; cv=none; b=RddVjXKLedk4VtAtCSoFz5VHLhs7QzIZoq6gC2GAQkBoNaTzkG9nfBfUSUnvODJToAjA+aDjm+jJ/UZ2Eb3pV2GcTAAc+pFsoi+NvIzpmCEBhcwyfpVVKcoxvH1uU9Zkvfi8COC3BKCWw4HgmC1iH3Uh99nJyi5fRCSS+YC1kQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377144; c=relaxed/simple;
	bh=8qplGZOWb19L6x3ArL0rwzyHQs9CghQkkFlHEuRzQRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IekG0qHUBjms45njg6kRtEVgyJML/2qBuQDhO4JACe36aIZPoXahyR8zwbeUEKXzZboy39ssCjqZlktCly+YQdSqb+aF8mY4fwtqt4k1KF85sjCU5hM8NCQr1yUA4DR7O6B/RrZ5R26DVtg5ilFXc8d4t8NvXt2Wk3QgYKFF9qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ww0GtaIL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SxjVnWEe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ww0GtaIL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SxjVnWEe"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVKgL3463140
	for <linux-kselftest@vger.kernel.org>; Wed, 7 Oct 2026 12:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wDKHbexpFw/5dh0l0ZtSxW1a
	xHuzuCQ9/xmJsjlfp4o=; b=Ww0GtaIL4KayrDqac+L9OrMKXZrBTwJdgFwWYeuG
	5hDgHXs3L/3v8OzJNfbOg7jfhMvok5hT2QiDt05Gr2QJ2MAd4wM34+YYWFRSJFN5
	SbMpzW2EFuFVaFd5+ZnqAyLBwDPV0Zbcds/Ccm3svBLy/JqWtOd10O9kFAsPyCM8
	TB2Z1IeiPtGQT61m2anf5kWz7bbfWfwFlcsi0rerrVpBpksZV/vLZ4xZDYO9PC8F
	uOat22mhA83FPaeF5Ym7ZqHCTwVb2muzsx91z0tyV9mnHGqkau/ADJiRC1EpOovh
	KV1o7bM7kFqsmykYwB7kfNXe0GIsIAGCYrkCkpjnDHmetQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c67a3n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 12:45:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc7a6e4e1so1095143185a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 05:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791377133; x=1791981933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wDKHbexpFw/5dh0l0ZtSxW1axHuzuCQ9/xmJsjlfp4o=;
        b=SxjVnWEeWt36LoL6Fhk/AHTLWjaTuCOJaZ/xQrwEDwNix2E2nxH75Vs3JqZXs+wEjA
         4eYmM1J6KnurCcE/gB+u3PKAI51g3d6mcKL1Dubw01G3L9dC3C0Y+01t88QDFI38ix2d
         sBYqijOYN6QHVgWtSfmPK9lBSXZh4WklJux120kGBicA+VzSuqMbCYayilzehnWn9F/p
         jh08xSb7DjPaZtzKmpYffyJP5+jhU7WMlm36g1YD58dV8B1q6BI177NtOUrBd+fWPssl
         ictVz4bWAQv+jRLO7h08NFfuFsiY0uXOKT9CxCmBrRexU1ZAgDsi9Rq3t1fNNP1Eaiuu
         uCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377133; x=1791981933;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wDKHbexpFw/5dh0l0ZtSxW1axHuzuCQ9/xmJsjlfp4o=;
        b=Cr9v8hURzGY2WBy9m4d3gT5z81upeUv1/2diJVGiTsZJV/W2mC1JgEL56b65TDV7l6
         C2b/fOk8AADkKe9gkmQdIzoP51Cpze/XY5zQGNYqyx82Gub6jEKQHdxeb0dGKWH1GYoa
         Flt1hc1gtuqsJyREFeG1Gcr+AuatPNQy1tKj2+xKPHHbYmUa1FeS2WBQ31pNXKrGlxY9
         9Lm8ckAdFxJ84uE5sXMsdTKVSLTPRgbRjof7G7UTcKPgfoQV0ZnjzoQYUelmQxQdaKJL
         puP0RS4omtA2G0A0NJs2P4CehOc39v2fDj7m9dXXpx7XPCqgZnsAKYXsGM+KeEcoTCp5
         Aqnw==
X-Forwarded-Encrypted: i=1; AKwUvByyLAFJUiR8vn36qkRlPC6xpomCgdNFkqj5oa5KvaPtq+Fy58XQ3aBmVKupQzx/2MupoePtWrb+p8XhyaBuXmg=@vger.kernel.org
X-Gm-Message-State: AFuF++n+ZeWMXxL6ghtvCKca2319T70uiO8oqZqG2VRrv+1xUJVyPpPM
	kUrB24EIZCgXddMmBe1gghwfDG+BSpPV+MMcY6zZSUwEtqvgRgFUjBbKCEP3IW0ggonix/bvh44
	O78KEwlZNe6rD0F9Y4OzZZqKlzgQzhjAy52qLpncIG3p4K8oKDEz5xvOH/+tNgIt7irGhlUw=
X-Gm-Gg: AYBFou1FTbWv0c1EUJKmTvR+Kzt3Y6zgCFjwN3v5FsS54xx+CvdYP9EwE2CtrtMjY0R
	7bGh2oo5m/3QaJLuoHeJ20Y5ig2/7KUnmIKGOhlpEqL0rnJG5gZ5iA6QMiY7wT+DN/z/53KDiL2
	aqmC0uvmVKkCmRh5KtR1OZEm0zodxH0DUHkUHqRz92ca6PMgfNmakzM/1XnHNGdtq0RA4KAXvK4
	zrmPEP3m5BRzTalpQtsB8LDrBby+1accIigVC2eD4yHzJ9FyDAeeIKAPiF+l0NfxRvfa4iqIP6C
	wJ5SDb2RtRWLlYur4HiDR1KWnus2RmXSl3hG7jB7s7TZJEcU0RZBY1F/Yw0YAXaLVTr4tbWD32w
	5shyF6jg4k4Ttyw==
X-Received: by 2002:a05:620a:2841:b0:93e:9292:1b96 with SMTP id af79cd13be357-93e9b0f2bc1mr403461485a.3.1791377132847;
        Wed, 07 Oct 2026 05:45:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2841:b0:93e:9292:1b96 with SMTP id af79cd13be357-93e9b0f2bc1mr403455085a.3.1791377132184;
        Wed, 07 Oct 2026 05:45:32 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f4480a4sm51221405e9.0.2026.10.07.05.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:45:30 -0700 (PDT)
Date: Wed, 7 Oct 2026 14:45:30 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Tianyi Gao <tianyi@cloudflare.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        toke@redhat.com, lorenzo@kernel.org, horms@kernel.org,
        bpf@vger.kernel.org, shuah@kernel.org, hawk@kernel.org,
        kernel-team@cloudflare.com, ast@kernel.org, daniel@iogearbox.net,
        john.fastabend@gmail.com, sdf@fomichev.me,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 1/2] veth: fix peer NETDEV_XDP_ACT_NDO_XMIT after GRO
 is toggled while down
Message-ID: <asY-6venW_HXIXv3@lore-desk>
References: <20261006173241.65945-1-tianyi@cloudflare.com>
 <20261006173241.65945-2-tianyi@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4xEDG4xH1wxBdFf8"
Content-Disposition: inline
In-Reply-To: <20261006173241.65945-2-tianyi@cloudflare.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MCBTYWx0ZWRfXzA9YV4usXDXV
 ha/3pBuB2gZwwur2KaGbCLmVZ4KVND1KXuehWnbDFwg5rqfRrd8bvOqZ/m+l/ZKldi1xojK96kc
 h72Z/6ny4Skvq0rE7gW0Aqidvep4lvk=
X-Proofpoint-ORIG-GUID: 3egmiV6EYoHkn2Hblja2PqTOD2fN4x7t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MCBTYWx0ZWRfX78NMRPa1mlWO
 OxCDiPatkaNVNMYPFBtk4ic9c32nwAcY1xZT26fEETEV1toM7sqg0RIJd3Mu7wKsU0sWBf+LPnS
 4mSJLmIRrSak4rpts2BG3ekCERCL9TxlpEe7JmGvFMYklhHN6Q9KuNFKqAiffySXHs/gVIKhfg2
 5Wn1Jkghg72qavEZfjHdOSyOK9ytihcZvb2jDabo+ehArNlVtcaOuadVNln/Cenj3DbDKiU5hxK
 T095D9dFL0NDw2Cfz0IWEDEV7VM6krTbcq3kwBtxJ/z5RKZAFgY5MzQf+U0h4MLB/wiEAFS5Ggx
 iznFMbB8x7EPTc5UsvUsPCVlBojAvfBBptOzykzuT/AztaeGM/x1fj8XSUuvw2Q4tWKcRb9KvK1
 7tNce/XiG5ngzj6G0I/8+Hjjk6Aj9zf8D6FUg2CpoBfcumbKXzGrxls1Lc3klBGE5cH72OYxMRK
 SBcNRKGLIIIF8qo8ZtA==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac63eed cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EG7W4yiQAAAA:8
 a=EUspDBNiAAAA:8 a=i-1Ti26mAgIR2IkWSe4A:9 a=CjuIK1q_8ugA:10
 a=8rg98RGK6hDbJEFrGYMA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 3egmiV6EYoHkn2Hblja2PqTOD2fN4x7t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070050

--4xEDG4xH1wxBdFf8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> A veth device advertises NETDEV_XDP_ACT_NDO_XMIT only if its peer has an
> XDP program attached or GRO enabled, that is, only if the peer will have
> NAPI to receive the frames.
>=20
> veth_set_features() updates the peer's flag when GRO is toggled, but
> returns early if the device is down, and veth_open() only refreshes the
> flags of the device being opened. Toggling GRO while the device is down
> therefore leaves the peer's flag stale after the device comes up.
>=20
> If GRO was enabled while down, the device comes up with NAPI but the
> peer does not advertise NDO_XMIT, and devmap rejects redirects to the
> peer with -EOPNOTSUPP. If GRO was disabled while down, the device comes
> up without NAPI but the peer still advertises NDO_XMIT, so redirects are
> accepted and then dropped in veth_xdp_xmit() with -ENXIO.
>=20
> Commit 7a6102aa6df0 ("veth: Update XDP feature set when bringing up
> device") made veth_open() refresh the device's own flags. Refresh the
> peer's flags there too. The peer's flag depends on this device's XDP
> program and GRO setting, not on whether the peer is up, so it is
> correct to set it even if the peer is down.
>=20
> Fixes: 8267fc71abb2 ("veth: take into account peer device for NETDEV_XDP_=
ACT_NDO_XMIT xdp_features flag")
> Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/veth.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/net/veth.c b/drivers/net/veth.c
> index 71227d0389aa..643b97dc5245 100644
> --- a/drivers/net/veth.c
> +++ b/drivers/net/veth.c
> @@ -1415,6 +1415,7 @@ static int veth_open(struct net_device *dev)
>  	}
> =20
>  	veth_set_xdp_features(dev);
> +	veth_set_xdp_features(peer);
> =20
>  	return 0;
>  }
> --=20
> 2.55.0
>=20

--4xEDG4xH1wxBdFf8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCasY+6gAKCRA6cBh0uS2t
rBUQAP92l+vMlvnh0tOci6HtUud+Pwzz8ZGMxlLmTUfmad5FhAEAzMyc2EiQGSGP
qwTW1ydbnj8xCFo1XTjODTC/8FY3FAE=
=MCcS
-----END PGP SIGNATURE-----

--4xEDG4xH1wxBdFf8--
