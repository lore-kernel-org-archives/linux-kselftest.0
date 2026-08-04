Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C73146C4A4
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 17:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785863409; cv=pass; b=IK31+qpu6pqYCelWCmJA4wag6Gw6/I0WMJK7Rdl6L6nRd9tTNXnDamw7AG8HQEnu7b5gKPV3vyyukTzlEDcHDpEssqmDzAG9akfoxWnMeS5CCYmlj2YJAZmfP3u4Qdfa6Ze/SCdzQaPLjW9shQUhFDJtJvRYglY6yv9mNDjB6Ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785863409; c=relaxed/simple;
	bh=qlNVDBjLr3ZY4uqSXXboWV38S/5DYsKm7VLU/yyEiVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gaHC3WZ89wumyK8RDL1ItgMQiC6ETaDu7t5cEByK13X/SCCImX5K+B5JJ35oPeSJFXl1h62XsVCoQETy/IXoQyqGJTDlf1PZqLZva0beoYTEFtJefMsLMBMMnJdqzsTOi3ciyiOtZZ9nVm0wlCauVIzASukg5tbTQGVxY7QStnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eec1unJ6; arc=pass smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eec1unJ6"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4ab246dfc90so12769b6e.0
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 10:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785863396; cv=none;
        d=google.com; s=arc-20260327;
        b=pSdRHebSi4H94ypZPXt1CJo1PoBIFDK6MlJjPrTpSoJv09t5tIjqKAao7yCvkT3s4r
         jFdrjHvfaJyXtrjH9BPB9k+J3rRgfJHPrbC8IWi1rauAxFOIHpZDQKxvqwHczDvR+IjP
         qE1tLT+B3d9fnZRokzgBBslmvpUMhG+iJHUP583ldypM2Ytgp65nQTmfe3KVcs+ggLdv
         88T/uzGzYi633OQkO/T5J7VIHCBI+wtKzqvEKswdGnerZHgLO9TZ5cUMgha7IXS3KBcE
         p3RGAhu5DsvmTn9vAgfsJ1XweHyTZw03XzDylOTmNQ7I9f0IbWRcItzooc8auuOt93Rd
         oTbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=resBrknXGwVF7We6VuEyfyRafwvNfm4i3nwr4XTNczA=;
        fh=uq9L28xrLu2r6o3xjPv869kEMS40nXGAC75mbbUFq0c=;
        b=Hp2pUWIpPbsymqIFMZ6NS6FExZEp0xun2ojaPz0JWeyRHD6kb5GRjBHCUEAe7C93dh
         +WCXuzy/Vjs7WqMD4qiWdnKHL3BgVsipGe65WZWlEMDDMmVLbMybb+m30b7dzKqJi8kj
         rc3t1JSQvzIC5KRv5T+YiYtCVeiO/QIZnrlPKD3kk2M4XpP1qkao1rObSGFcDjpxo945
         OLiCXnWnT3toueS1KSFaKwQVolwUM9l02GuyLU3YImkcUQ4si/bWDwENnX59qrQlGaBJ
         q5zxwxqDWllpZTh9KqBd44fAL6ovNEAQSLdUPspMetCZBrws4uoYkKfBRu7nQTIPuOke
         Rvyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785863396; x=1786468196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=resBrknXGwVF7We6VuEyfyRafwvNfm4i3nwr4XTNczA=;
        b=Eec1unJ6cD7LiZ9slbnIkpRWrNbwfEC/YTyz1oEmhdvtahTquI45v4epsnMbw3lXfn
         EPTxtz/GUVHEYa4ZRwCXhPzIkEfTnszpKNTzD9DygYLn12naCvsRt6kt+mGwMFBigKpo
         JGuuDDsC2xrttmQiK8YBNpKMxw8OAVUF3V6wT3Qcirh/VjIXKli5WqYNX4s9hIpYF0+T
         nkg4z+MqEZzLDJuYxGWc2lE1+PhaaZ1Va2ArKgGb+zZkzIMEn0F+hWaB+c/V0Od1c5qB
         3vNniq2GXYXpSOS/F1UZ9/faz9m3JuX8sEl0vsP+1uG3mDd3Y2ld1Wi/NzxrCdAO17Zp
         mGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785863396; x=1786468196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=resBrknXGwVF7We6VuEyfyRafwvNfm4i3nwr4XTNczA=;
        b=Rj/zc6sorg8Dl2/GTs2liuLOhDDU+6uvCLJqcTkw9RY/7IVsfmlr1Jn1uvDbnqCk+T
         ge2O+uA8zwGC7a0tsi/6m5AnWJoX1kYRhh4fIwEZwT69VK77EToH5poY+bAkOJy25nYJ
         u9JIHcclW68dHftQXPAPVTanV+cT7GzHS8folyT1XlfZGly43AfJ5gUr7WzPiLrJGXAv
         4rpgr0qdjO6dFi0gWA7NDc0ZJZCyHoSXsm76GUbT9+eQD4HaDCZ4Mrw7jZjFuGrJyYJ7
         p+Xssi8MNDY6pTR7P2eWmdDNeh5qJe/NusfRTRPk1dnn0yQ2/h3b5hGryMaNe/sdPp3M
         h6TA==
X-Forwarded-Encrypted: i=1; AHgh+RoOckO0drW6pVAiahZtdflrpHEQUYBDgF3ERCvKXhMv1/yjQ/qqrS/LSxuEwabXDcy9b3mJH+xjn22aEcoPFlE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycw6xNJYsNX53GESozwRpBuED/GIvC0Ji6l8JOCGbZcPn9k7u5
	bGxKwNEfFPbz4PIIPbbjhvwlPNKbNycXVPOisFTwdAZdBH0a5i2hxVpGNlb/IvwwSv3PKvOL8wK
	2eoXDDTUMrjwYHgOKd0ak1Es5XegafrAemcIBU20=
X-Gm-Gg: AR+sD133JYOC5/kdwyDWHdW/eX+dMi2Wk8g15necNYpR7pUA5YLvO7oBSiCbpt5z/ke
	ddYHRvxVQGYNBBt36qJP59mAY14Jb8aBYsX8PsNyL9B1XAMQKJLYHy5qLO4I/uABMYlOogAW0Eu
	v0ckvmuGzLWbfVhqiKB56yII74m4HIWUKPUT5BAy4QOaoBaloBoNNMUKyIiahMoWimsGzhx8l63
	QGeOsjQdD5o0MvKcUHOx/6SFz1l42na/Mq8iDHMEjEkk334yZh3OCGr5VbsK0EMH7aTT/Pbw5Y8
	PoVd6U+WVo7MNZE/TWeQO5C1CIYIn0h7/JKk94b87SAWCzI134VZfP4P7A9E3TGsRwMF2zmD
X-Received: by 2002:a05:6808:1588:b0:4af:5d69:1cb8 with SMTP id
 5614622812f47-4afadbf4d3amr100488b6e.0.1785863395341; Tue, 04 Aug 2026
 10:09:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-netcons-userdata-rcu-v1-0-1e5e6b62b75d@debian.org> <20260803-netcons-userdata-rcu-v1-1-1e5e6b62b75d@debian.org>
In-Reply-To: <20260803-netcons-userdata-rcu-v1-1-1e5e6b62b75d@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Tue, 4 Aug 2026 18:09:44 +0100
X-Gm-Features: AUfX_mz0x1sNnb8P41S_VG9EDQAZvd5FxVLF-LnA8kzMUMUHAspc7VDEE8Ne7Fs
Message-ID: <CAGSyskVKAwf8nb_3uFDbYUugR+dtO-cwSef8C9nSEgKZt_K=CQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] netconsole: publish the userdata payload
 with RCU
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, asantostc@gmail.com, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 12:30=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> update_userdata() takes target_list_lock to swap nt->userdata and
> nt->userdata_length, then frees the old buffer. Since commit
> 7eab73b18630 ("netconsole: convert to NBCON console infrastructure")
> that lock is also the console's device_lock, so writing a userdata value
> from configfs serialises against the printk core emitting messages.
>
> The buffer is immutable once published, which is what RCU is for. Move
> the string and its length into a single netconsole_userdata object and
> publish it with rcu_replace_pointer(), freeing the old one with
> kfree_rcu().
>
> New userdata design:
>
> 0) Unify the userdata fields into a struct netcons_userdata
> 1) update_userdata() no longer needs target_list_lock.
> 2) writers stay serialised by dynamic_netconsole_mutex.
> 3) reading userdata needs an RCU read lock.
>
> No functional change intended.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  drivers/net/netconsole.c | 88 +++++++++++++++++++++++++++++-------------=
------
>  1 file changed, 54 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
> index 862001d09aa84..c88c82f2136cb 100644
> --- a/drivers/net/netconsole.c
> +++ b/drivers/net/netconsole.c
> @@ -135,13 +135,27 @@ enum target_state {
>         STATE_DEACTIVATED,
>  };
>
> +/**
> + * struct netcons_userdata - Formatted userdata payload of a target.
> + * @rcu:       Used to free the payload after a grace period.
> + * @length:    Length of @data, excluding the NUL terminator.
> + * @data:      Formatted " key=3Dvalue\n" entries, NUL terminated.
> + *
> + * Immutable once published, so the transmit path never observes @data a=
nd
> + * @length disagreeing.
> + */
> +struct netcons_userdata {
> +       struct rcu_head         rcu;
> +       size_t                  length;
> +       char                    data[];
> +};
> +
>  /**
>   * struct netconsole_target - Represents a configured netconsole target.
>   * @list:      Links this target into the target_list.
>   * @group:     Links us into the configfs subsystem hierarchy.
>   * @userdata_group:    Links to the userdata configfs hierarchy
> - * @userdata:          Cached, formatted string of append
> - * @userdata_length:   String length of userdata.
> + * @userdata:          Cached, formatted userdata payload. RCU protected=
.
>   * @sysdata:           Cached, formatted string of append
>   * @sysdata_fields:    Sysdata features enabled.
>   * @msgcounter:        Message sent counter.
> @@ -176,8 +190,7 @@ struct netconsole_target {
>  #ifdef CONFIG_NETCONSOLE_DYNAMIC
>         struct config_group     group;
>         struct config_group     userdata_group;
> -       char                    *userdata;
> -       size_t                  userdata_length;
> +       struct netcons_userdata __rcu *userdata;

With userdata now annotated with __rcu, it should be freed with
kfree(rcu_access_pointer(nt->userdata)) to avoid a sparse warning:

$ make C=3D1 drivers/net/netconsole.o
  DESCEND objtool
  DESCEND bpf/resolve_btfids
  INSTALL libsubcmd_headers
  CC      drivers/net/netconsole.o
  CHECK   drivers/net/netconsole.c
drivers/net/netconsole.c:1702:17:    expected void const *objp
drivers/net/netconsole.c:1702:17:    got struct netcons_userdata
[noderef] __rcu *userdata
drivers/net/netconsole.c:2689:17:    expected void const *objp
drivers/net/netconsole.c:2689:17:    got struct netcons_userdata
[noderef] __rcu *userdata
