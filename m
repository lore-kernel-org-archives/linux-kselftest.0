Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7934A9D58
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164773; cv=none; b=i4DnL3cFMvNpCwYa0R+h8893oqic+mBL6o9iK3tZWVOrnahIAGlpKMWksSyu/XHkmibnVLfFhoCTOO2ylmxMDXTxDq2cG8ZZ6/Y/tmbEkRhMnDm979kXQC6p3qirfoau12heOLGZYHzqwpvaVdyfZhNHNKI38lWBy3BSdv9yepI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164773; c=relaxed/simple;
	bh=lyThp7bIz6kj168zSwcpYX6Pcr2CQbMqDAwt8ob+z70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IevIcO5NMpjW6LcokevJvYfb3vsFLHxTVrHtdpDPCySUHPOIsGN1Y4dm5SoBecytWRp298kzJAhrr1Y2xodD+qcAqOQp6N8A+P20LftXEQH77LoScWHrvDAZaE/oU1XP3STZaWTNWZEdr2oLnJ9fPDDfh2bPyi6dd2vKF0jzlj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBXnmgxe; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBXnmgxe"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc7641d03a5so91753a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 04:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790164767; x=1790769567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BrzXSXvlSZQsoju04uUevcVwnOSzbxdAq6pl8JZzW5k=;
        b=DBXnmgxegbZBUmOsq3ltZ7SoonG/vyLROHa14W3bPLY0yEqB1VWFo7NC0gPqLMMy/K
         zj/ZBWFLkXNK8uDFTkFYUjWgOGvceYykGRnILOhe9wtj2T564r+wCaDHyGEzOkyX3sQX
         lvnSNeaEHXbtWqhkMleUt0NePUoJjQ/exLHhmx0BGBMEZVMd05F45669JGghJWgvLcYQ
         tusInSmiEsXb/dpfKyzy45GxPaM5YyJnEZ/y8+IuSacGQW4T+SPAK7VaL60wmcrN//L3
         hbzcGzpnlEzriwWqAp312asfccBF1q9rs2k2Eu//HzgJOTcT/89FUG8otdn05cIkCo0J
         Blhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164767; x=1790769567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BrzXSXvlSZQsoju04uUevcVwnOSzbxdAq6pl8JZzW5k=;
        b=hfkQbs+Q85Ooc02JLwE3JgV9KL660KQh5ZNYaUzfpvBwC+5Jnl0QaueExyUJHD/agY
         UaOeCh+MdVSYOKXmHtcAKJbA0iPnmNWs93sUpGMvvD1pYrUjLzlt0lVi7wNWSwF/lA9i
         6ypX+BWwS8uOrAUVexuGiBPXtqPdx6ukPXpw+TID/ipDM5TbGS9+AfQbNaBU8/rKATIK
         jTrae2QfG+Y9NRp1mDxuDOTXxbw3gbkoxFg7Eh4gHzwtNCV1/12rqU9jDHWvHxt3eNSJ
         cJzshGDUJCtOPX3Hg+iqamx3jV3KOXBsesRFqkgnAGuN30y0efp1ENXNI5grqviy3Ebo
         xejw==
X-Forwarded-Encrypted: i=1; AKwUvBytvdJ3eMqbW7+TPjvSbdnrRGZ8vfWKumPA4/0YlSSSC1UGRJ3J/3bsEBxvPYFqJhONNrJ/BKJtdqG9ACKodws=@vger.kernel.org
X-Gm-Message-State: AFuF++mLMgx89ZcP/LwwEqkrJbzn3wYcqYjEnfwxLz1L2pGrMGFFCPo6
	yHK1T7DmashFvFp1jWbX4NV1xY/N/3lpuRDho46i/Mwere+p/0rutAIo
X-Gm-Gg: AYBFou0JWw5/OW+P7zsgz0b67DJur65S3WE4iCcfudns+iZySqU2T7ZRN17d14GaRZM
	1u4FDx9EfHzl1e2io+aZE5etEvodfSWL1SRSoPLcudFadNMwC/aJ9qkdLGXqKGlAahmNTb0l+I0
	ZBSL4gvyBZ4LN1XHIuR7xpKX61ZwR6ru9tuUCzYRnlcEH7g7i1V/xyJ2Pt54LAJQgZ2ctMjBYmn
	6XxTlnnNo1tqE3iSiTmFs5c7AqQs/WiYhRh1WGqE9yW5M52vDQOpNzbra3qIk8L0Cuor2ykBzzy
	Gz8byq7AFPZZ4i+c5EFWXSELiizbyqY6e7pm3rbq4wAwujX75Z2V+AKkLJK93jXPaSMwbxjqhY7
	0X27yy8nyaY00/u1twpZXMNi4e4UEWGw7tKIbTjm6/7acT6da/rLG1kdJF4Qr0QiF/NibAF29mx
	vtswAdFVBLfEEQtLWJuyTVV1Hyy8m8PsemyoXP9/akwPBbwNA2VwYEmS9DCtYnD2M=
X-Received: by 2002:a17:90b:4a45:b0:39e:2530:2102 with SMTP id 98e67ed59e1d1-3a07e56552cmr2048640a91.11.1790164766974;
        Wed, 23 Sep 2026 04:59:26 -0700 (PDT)
Received: from dev ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddae66asm5970635a91.3.2026.09.23.04.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:59:26 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
To: idosch@nvidia.com
Cc: dsahern@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	justin.iurman@gmail.com,
	alex.aring@gmail.com,
	steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	razor@blackwall.org,
	eyal.birger@gmail.com,
	nicolas.dichtel@6wind.com,
	lucien.xin@gmail.com,
	shuah@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 0/4] net: lwtunnel: accept encap attributes without NLA_F_NESTED
Date: Wed, 23 Sep 2026 20:59:14 +0900
Message-ID: <20260923115914.70760-1-yuya.kusakabe@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923112917.GA2749166@shredder>
References: <20260923-lwt-encap-noflag-v1-0-8de7ab6c86e9@gmail.com> <20260923112917.GA2749166@shredder>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 23, 2026 at 02:29:17PM +0300, Ido Schimmel wrote:
> If this never worked, then why target these patches at net and blaming
> up to 7 years old commits? I try to follow [1] when deciding between net
> and net-next.
You are right, it is not a regression.  If there is a v2 it will go to
net-next without the Fixes tags.

> Also, did you hit this in practice or was this flagged by AI? If nobody
> is using save/restore and hitting this in practice, then maybe it's not
> worth to loosen the validation performed by the kernel.
It was flagged by an AI review of a new encap I am working on (SRv6
Mobile User Plane, still RFC).  I reproduced it there, and checking the
existing encaps showed rpl, ioam6, xfrm and the ip tunnel options behave
the same.  I have no report from their users.

My motivation was that a feature which exists should not silently fail,
and the series only drops the flag check on the container; everything
nested inside is still validated strictly.  But if nobody relies on
save/restore for these encaps, I am fine dropping the series, and the
new encap will keep nla_parse_nested() like rpl, ioam6 and xfrm.

Thanks
