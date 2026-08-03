Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A487042E8F1
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 18:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781748; cv=pass; b=oZLj3yTFPCpuMbPLyF96V89e9eClzRvo3cVI/ZFjUn43cHmnrYETlZwK1AhiIlcMB7ZZSXFGQRdYTAcq2HsmHsDwju1SiLQESQbqZ5ngMaooI2UPA51BBlaSahbMV5AeZFKbWXVOdznM0i4B6r2AUp0Bk6xjlmaDsTFEiDnpjqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781748; c=relaxed/simple;
	bh=E1TyiApiS5bm5Tut4IctQMM+vsxnN5fZtwjU08KtTEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NClzofcaTwB0r26OI5Z5eRy6HSXFsfdHyPfmsWG6iznjNSzhnQUCIw4yAYoqfZ2Gl9xQ4r7cvxFG9HdoKWRHn1cFX8eXFbmrB+ORhE6/gYcSuCoaUprHsfdAwa09AjQyuiTEO/j8YL+JrFtqtSgNunWAabygUWRCHvNAZJBN2VU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UOsysA/m; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UOsysA/m"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cacef7d299so19485ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 11:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785781745; cv=none;
        d=google.com; s=arc-20260327;
        b=RbE26X9iY1Np/foTr856s3T5oqa4mp5h8xRz+oOvjicqiE1UapKxan9rbOxp8hxZjJ
         6BDLqkJ/3/hqVp0df80pZrwGg69WhwF/nUGmsXm2CQzqYtvIOR5tFXoucPQa+dfuk90D
         2B91j8kbrMkSHyr0GAcXWOzSqeaULnlhfh1TbxiXh3sUggJOZNVS1Pg0LCg3EzoPFo11
         8tI1OXN0jJXTLtMR4X3hPZFj0e3/XeMx7zuvyGMF6cqPGB/DPTMyo1vJymQQ3HgkWxli
         RMrywtVTeN52AlZghSJlZN8J4/PK81y/mmnKS00nULvveI9lGxTz7QNOja8UEK33s8aj
         3NUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iaNYqJr1zGl3zigrxrLoyTzIuzipTS2HMILZRq0rjdQ=;
        fh=PQOoitOVVKLhntM62TP5WiDXtZ0lgR3iT/ozI0XXE+c=;
        b=BFnM+k3eenu5M3kpbzQQIcG0Kiab4Q5ZiShCiyUixEdIxBSfFStJj1xCcBogDkTORA
         M0Jr9DcXU6zbEJLDVOVlXPHRtb+LSgLWZ3hv9MrgGlQcL7a4b5sNE+cPzZNbBDED/j5p
         TNGPdBhNRnyK2EZCTIixjng6D1x3+j4RdlQELmYVz3DVg4geDPWSi4oNS+xD9jfPnj+k
         giBjQO88aHoGnwzw9ZimdAmnRD7i8Sgt2LNe0zFiCbS72fCVP3tIICrmSMcswvofVQ11
         oCix2NnxZa8q5TIdZF907OEeG0lsNav7ep6pQncFlHwz6R5XzvFMO0/0MFHMojKKC08b
         hCsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785781745; x=1786386545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iaNYqJr1zGl3zigrxrLoyTzIuzipTS2HMILZRq0rjdQ=;
        b=UOsysA/m4xzaSv9EmCuqqFCmJelENK5zKJe2RX6RS42YGe+KbxDIShwX5dqhg6sr9K
         TF8Ct766bgV3bvSGm8EefCGQRQvxn5c8+7Eixq0FZRUyCZs9HSrhOsCeFFmDXM5S/hCX
         y4R7gOnZO4BCnoDyjuHKjNKMW7qR+kI5TpBu2+eGzh8D1WZ/XCxBr7nJSxctVmzVZO0T
         mCIgaExokwYUFjfir8cZo811MR2292sr4QaiNcXlSEqHLbbDBfAlaVgr5eKogUspEGR0
         nZaMeDofiRUJN53oWzRil26492UG+3U1R8iepQYLB29xdulr4VVMsC2DLG9gZ7/AHl24
         Xwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785781745; x=1786386545;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iaNYqJr1zGl3zigrxrLoyTzIuzipTS2HMILZRq0rjdQ=;
        b=AeOVOu9xipBpT6adgMihmFT4kbH64UdDbwGrA6bSq7eyHaHdhvMiESgide7G0pXDG1
         8M82fPt4iiNQ0Sja547Yd3y9E5/eoeSS9DbvDZQoZAgjPg1fr6jsa/I2dBW8EVP0zKY4
         NzaTuvQH2ZDxs9sKBg3GjeoRx1wyT6jA/39xjepHwnLMEaBfzmZgmxDeNtrENwwrvCRr
         yIpCGf641eZgRYM9sr4XBU9BS3gAW98PfvO/hNFEu41BK/1wV9L+xyAKVYZzaMnCg5cr
         WK8RaO3EVcbpmhQnEJPugra1tVNbJVteLj53VPUpQ4Rc7mS5MVzRBIAwwgB88hIejiRh
         S+BQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnR7V6gMDAqPoMBIdbhah3OYyfINCKx2whuK5GO//DwwjUkJOuvuBmyqTgj1nspgniEMFvRKubVJIqy4kS5Vs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpEeV68APpd1re5TJtQMD0VknTyttatoa0SuIJ+3TL2xN8bc7b
	FHjfZrpFKi8cHTyrB4r6qiqfJ7wcS65QCYjtrHOOdAsAL66uIJqlWvVNofxaWyG7BPvec69KkdQ
	OYokjjlDWyq6+8xhi/pzPzi6U8NU3eW0ve+KALjy0
X-Gm-Gg: AR+sD10Fo197DKBLJ9bl1J3jIdTff5qc0Gwz8g/SoYqFSpeU7Sy9tKea8C9qfY1AhFG
	hcn9+Raa8JPZNDSpML239LO+JFeMsfOZCBIXIvzk+YMbGK2cgFcKRfQsu4alU6fTU4CIxVNDCFv
	UOQPQ4wu6iFriAe/8Qi4KkRVE6YalzQKgUdCWkxMAjg/BycZh6JYtf2tVSXR0s2DpkVqJvoGPrD
	go4rHKRaEI2pRyA5eSBe/RGXRia3UuxANmy81gJX8Fs2yU/198laR2fl03O8lknzPFYWUy1IcJn
	Qwwf2os9KtxLKVaiMCt84V9z+j9yxazGrk3OXqPKuusg
X-Received: by 2002:a17:903:1aa6:b0:2c7:b1e7:501e with SMTP id
 d9443c01a7336-2d08cbbfdc2mr1235065ad.3.1785781744793; Mon, 03 Aug 2026
 11:29:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731-selftests-devmem-config-v1-1-098014348d9d@meta.com>
In-Reply-To: <20260731-selftests-devmem-config-v1-1-098014348d9d@meta.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 3 Aug 2026 11:28:52 -0700
X-Gm-Features: AUfX_mywewkX4aY3CNMFdzMOYyTmV4cVRuojkSA4Tcxx7W5h3VoMAU_1bnR2eHw
Message-ID: <CAHS8izN2q1n4VEoTQ9PcMRCwBrekQx=hXXZ0QK53U9xzXfxhSA@mail.gmail.com>
Subject: Re: [PATCH net-next] selftests: drv-net: enable devmem TCP in the
 test config
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 4:38=E2=80=AFPM Bobby Eshleman <bobbyeshleman@gmail=
.com> wrote:
>
> From: Bobby Eshleman <bobbyeshleman@meta.com>
>
> The config fragment already sets CONFIG_UDMABUF=3Dy, but kconfig silently
> drops it. UDMABUF/NET_DEVMEM both depend on DMA_SHARED_BUFFER, which we
> can't enable directly, so we need to enable a config that selects it. We
> use SYNC_FILE for that purpose here.
>
> Additionally, we flip on CONFIG_NET_DEVMEM as well.
>
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>

While hacky, I think it's okay to find something that enables
DMA_SHARED_BUFFER for us here.

Reviewed-by: Mina Almasry <almasrymina@google.com>

> ---
>  tools/testing/selftests/drivers/net/hw/config | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/testing/selftests/drivers/net/hw/config b/tools/testin=
g/selftests/drivers/net/hw/config
> index ed8642b68094..d89a9ba17655 100644
> --- a/tools/testing/selftests/drivers/net/hw/config
> +++ b/tools/testing/selftests/drivers/net/hw/config
> @@ -15,11 +15,13 @@ CONFIG_IPV6_SIT=3Dy
>  CONFIG_IPV6_TUNNEL=3Dy
>  CONFIG_NET_CLS_ACT=3Dy
>  CONFIG_NET_CLS_BPF=3Dy
> +CONFIG_NET_DEVMEM=3Dy
>  CONFIG_NET_IPGRE=3Dy
>  CONFIG_NET_IPGRE_DEMUX=3Dy
>  CONFIG_NET_IPIP=3Dy
>  CONFIG_NETKIT=3Dy
>  CONFIG_NET_SCH_INGRESS=3Dy
> +CONFIG_SYNC_FILE=3Dy
>  CONFIG_UDMABUF=3Dy
>  CONFIG_USER_NS=3Dy
>  CONFIG_VXLAN=3Dy
>
> ---
> base-commit: 2fbade66245059c78daeaccfce13ecf499fffb51
> change-id: 20260731-selftests-devmem-config-f4f843f0f0ad
>
> Best regards,
> --
> Bobby Eshleman <bobbyeshleman@meta.com>
>
>


--=20
Thanks,
Mina
