Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F87483807
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 13:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528305; cv=none; b=Nv1FTuf0XUa/UcrORJRkgIuMz7qL5Cbk7SiuICQtGLIILCjPtVrIHuT2HNizjYTdlX2WzfW2GxjAiATdBuQQKqvBEoUImHuKCGSCQTQQHHZ9ow74vtbvoF0oGcQj6QxrbZysj37YLC6LLnEBK4simqGA1cPleXcsfatOdmyMg4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528305; c=relaxed/simple;
	bh=7IrgWckgLXmOp+bSbt2l3lsAkLznjIprg/+l63INEHk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SfV86MwC+xebKXXLWFBIOZeVKof1SRwtqV+2Z9f9ZfLkgLgOgr12ii+MGcMB6JFXL/+Y9F1QKvtMazCA2X7ykiHQbXLQ0901D6qMjaLuy20WeDDHuwH8ofz59bA+RFOi/l7To+sUpaVA4yADfCU7mon7qFtuPJkPTgqohdbilc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Io5VVGDp; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Io5VVGDp"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8200b55dc47so12010797b3.3
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 06:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788528301; x=1789133101; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EUxRc34t0qU8FOfG0VqqQu2j6hNUb8g29gyCmIO8xCk=;
        b=Io5VVGDp+CZ4sCDGBJWKIvbBPJiL7wXPujE8eqUiy2X6aLrwI6V0GFNbQXCRooi4W6
         Qv5uZ/hg1BMjSoax92jJEjOcRy92hppD5AEQHcoe/O5Dq7KBu2k9c2pZ8B3Bpld8afcE
         wuM87A8bwdwP1lgwmI1ZktnAli1WGSTI5YNC7TlPLXUc2ymBT0EMQ9jwa9V29vtMZBq5
         wJa7XJTZO8ERQw1jeQYt5PEVEsdK2bRNFCQFlFJSEYDaA4lHUPIEP7y58oqzk1qd1APh
         UWHvjbNVibFz9VdcOa8UaxbWYmof45ePAT9TcR2qwvsIZOnD7LXS48aPU7YLQImIFvXy
         4eCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788528301; x=1789133101;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EUxRc34t0qU8FOfG0VqqQu2j6hNUb8g29gyCmIO8xCk=;
        b=LACUPVgoEci4uRXFCJGJpB/q5FlQgqPavSyHvCCrkMjNHSvbvci1OKNGn17nw8zHEr
         R7B8L26m/Ze4Yr5tEDYKl+5Xi6CahSXDE6oPwRYbiNGfAprdMEanbsXGz0hf0sYODLGi
         yIvfU6E//VRqLbZX/36GzcY6ON7I2BYyLNYeV9OELwQ7IP7r8+A51uCzMMEyJXN4vCEB
         opFJmCPmtK1qfTcrSKAa7jZ61jusSqlXS8cQEs1xlv2KMbBQPiUEVWqfS0IDpgIzLaZH
         lUpeZZ03oaab25bNRjjE6OcgP4wJwjp3OlejS/ObSpewM3yntIkqx007IBQdDPvDLLSO
         9EHg==
X-Forwarded-Encrypted: i=1; AKwUvBwVSIcXKMUBbI75ygM8KegQmaaStgTd4+7lbpB5FH6GyrFJJb9oP7SPTIURER0DPyby2Y6LeULdMAYyYvohlVE=@vger.kernel.org
X-Gm-Message-State: AFuF++mQU+TNfSdp4dQhOlgCCbmx6BuGqh6QiyYlZLvYL8y6TIS9DXlM
	R4PbIOmIoGZcINM4K8WA3FQG5YoDfymwo9gJhQXNH77mMkSAgL6ohgio
X-Gm-Gg: AYBFou2HTw4r30LsbjjLPV7cegacYDeUkv3z8VuCut4zvrbEJCOrx0y9YcReNK/X65N
	QUfsjO20UxI4aAE0I3za8thGPSlpumJqgmdNAh/xP/AaQfaCvTVOQja/HfLrKgzvUY14nEN4RFc
	W4enq0qzbRWlM61xk9e5BuFB0g2f1deplFohCCc0ZMP2QvOWnSfNXwfJNFuCMWAYKnXQYRYsQ0u
	XqpdN5j7z2kzfzpS6KVthEoUxo+9g4S9e+nOXbX+lCJR1QsLFlKVYPSkMqySjg5va6uknuHsLP0
	4AmTldGqrBHtilB+OvJDOqdW+IJVAA149fwz0myi++GUq9gfh5B+wkmGY2ANBoR4DlImLkkbuZO
	o9J3xS6HrgUr9hF1j8t2G4RyY/xcOVjROscFVgg5bN8ygZNv7+kAGfYnMkQ0kY8Q9kQm76gmxNU
	fTzm4GNfV2z13Ovr/QkStVw/rdGPRtgT8DxL3OtC6dJVGS/OwXQuqASQA8pBbntobJcQ==
X-Received: by 2002:a05:690c:dd3:b0:873:5c6b:a2ff with SMTP id 00721157ae682-8735c6ba63bmr2923997b3.45.1788528301340;
        Fri, 04 Sep 2026 06:25:01 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406bbb79sm20079006d6.47.2026.09.04.06.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 09:24:58 -0400
Message-Id: <DL6KD9FKLYQ8.1HD909WP9YA21@gmail.com>
Cc: "Aleksandr Loktionov" <aleksandr.loktionov@intel.com>, "Alexei Lazar"
 <alazar@nvidia.com>, "Alexei Starovoitov" <ast@kernel.org>, "Allison
 Henderson" <allison.henderson@oracle.com>, "Antonio Quartulli"
 <antonio@openvpn.net>, "Anubhav Singh" <anubhavsinggh@google.com>, "Bobby
 Eshleman" <bobbyeshleman@meta.com>, "Boris Pismenny" <borisp@nvidia.com>,
 <bpf@vger.kernel.org>, "Carolina Jubran" <cjubran@nvidia.com>, "Chris Mi"
 <cmi@nvidia.com>, "Cosmin Ratiu" <cratiu@nvidia.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Daniel Zahka" <daniel.zahka@gmail.com>, "David
 Wei" <dw@davidwei.uk>, "Doruk Tan Ozturk" <doruk@0sec.ai>, "Dragos Tatulea"
 <dtatulea@nvidia.com>, "Gal Pressman" <gal@nvidia.com>, "Jacob Keller"
 <Jacob.e.keller@intel.com>, "Jesper Dangaard Brouer" <hawk@kernel.org>,
 "Jianbo Liu" <jianbol@nvidia.com>, "John Fastabend"
 <john.fastabend@gmail.com>, "Kees Cook" <kees@kernel.org>, "Lama Kayal"
 <lkayal@nvidia.com>, "Leon Romanovsky" <leon@kernel.org>, "open list"
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, "Mark Bloch" <mbloch@nvidia.com>, "Matthieu
 Baerts (NGI0)" <matttbe@kernel.org>, "Patrisious Haddad"
 <phaddad@nvidia.com>, "Petr Machata" <petrm@nvidia.com>, "Raed Salem"
 <raeds@nvidia.com>, "Rahul Rameshbabu" <rrameshbabu@nvidia.com>, "Richard
 Gobert" <richardbgobert@gmail.com>, "Saeed Mahameed" <saeedm@nvidia.com>,
 "Shuah Khan" <shuah@kernel.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Simon Horman" <horms@kernel.org>, "Stanislav Fomichev" <sdf@fomichev.me>,
 "Stanislav Fomichev" <sdf.kernel@gmail.com>, "Willem de Bruijn"
 <willemb@google.com>, "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH net-next V3 01/15] net/mlx5e: Generalize TC <-> IPsec
 mutual exclusion
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Tariq Toukan" <tariqt@nvidia.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 <netdev@vger.kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Sabrina
 Dubroca" <sd@queasysnail.net>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260903085215.3691657-1-tariqt@nvidia.com>
 <20260903085215.3691657-2-tariqt@nvidia.com>
In-Reply-To: <20260903085215.3691657-2-tariqt@nvidia.com>

On Thu Sep 3, 2026 at 4:52 AM EDT, Tariq Toukan wrote:
> -#ifdef CONFIG_MLX5_ESWITCH
> -static int mlx5e_ipsec_block_tc_offload(struct mlx5_core_dev *mdev)
> -{
> -	struct mlx5_eswitch *esw =3D mdev->priv.eswitch;
> -	int err =3D 0;
> -
> -	if (esw) {
> -		err =3D mlx5_esw_lock(esw);

This appears to the last caller of mlx5_esw_lock(), so the function will
be dead code after this patch.

> -		if (err)
> -			return err;
> -	}
> -
> -	if (mdev->num_block_ipsec) {
> -		err =3D -EBUSY;
> -		goto unlock;
> -	}
> -
> -	mdev->num_block_tc++;
> -
> -unlock:
> -	if (esw)
> -		mlx5_esw_unlock(esw);
> -
> -	return err;
> -}
