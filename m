Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD1537F339
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 03:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134621; cv=pass; b=pp8f322MAgJr8n0GNMHJecmwml/qnBrveEhDVBEf47eB8EqUcNCMTa/3oCSSlAWZKMSLpcYH2Tt8/M8lmESOIZzNiVxl4oBxEE/Bt7p9Zxz7ZxYHshT/TwO76uaUGVsNUWC8Dyj9Us3XfB+jib8qDTwxMfNW9WVX137Sv6asa3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134621; c=relaxed/simple;
	bh=/qxBJcYhlELi+GidH3qhbk7cum0tkPI9mCj4Z/HQ8Ac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=stAxUe06ElBcqIQ0rypKqAAqNJ74BKNpw52gI18pheuvxbph8Ab8Gxe53vfOvdfPcNiVF4ztmLiIIy/Q0loNx5nMUm1u9IjQHHMXirEnWzmozKym7JlO9ghPWB9nL7dkxJ/wesJ9fF6OCbeARe7cK4rtbb7LEc4oWcez2ZpZx4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8gnLMZG; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8gnLMZG"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a49a10ee5aso3108571fa.3
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 20:36:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790134618; cv=none;
        d=google.com; s=arc-20260327;
        b=mHet1z7C4CW4kolIRakbGe4EYPomwyxChBnWlso/kr5PY6mhWUGY++zhXLAM6oE1GG
         AUCrDemPARBBYbjm8bbI2XhfL1nnVrexGW1Wddtl4nxkvOagBCXApEX22GgJHpJYdFKi
         dRhyUUu/qUb08E7R6MqLWtut7d2G+SOOjda5oj2GDQWWMdSixKr1v0D6KxKRRam/H/0n
         OxL7nCpWVmO0HSMhQjYTKnyPkJcKDYwalAWF4sjN6MCCJvyvlaYMObCjRt/cGyNUJV9A
         RcBKehZQI7EsxbW7ljfwkALwtrsAD+zhzh147lZZN/cz8eUkvZ74Qas9DQu+9ZYBYc4t
         GS7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KKLo74+Yco7BdhiMxFzPPDsZ4m2F2BSHmO+5yWtfCh0=;
        fh=TLi+QxwgeOD8AejGZKCG9mwM3qj+jGnlBKt4Orwentg=;
        b=W0pixnReOzQ1fA/eEx3XnoEwtYCKbKIwdXnjnGMmY658wq5WeRPScQJJr90dRwq468
         IOn3zqKCH/4kPMnfUx/ky574rnjEx9ka0kEBb+9LHMq3d6ncuM0ffw9+Otv28l4VGMq0
         EVAr+qcS68t9XkBh+ky3oQ7T0Zp7LR5VwvlMxTWSuyRDSc42v5jM0BGpYr+fgRfVLbmm
         aUx8MElY+o6ymeMabW7RMnknoCBzXmHSgcJKPPyrLUcrxnRUamx6w2JfWHaKS7V/q9F1
         MMsoFnGxup0NVxqmDSwLFAxhR/4pNr58FCuKAwGtTVqNw/xUQja+zI0liHMuFjoeUtsN
         Q2SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790134618; x=1790739418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KKLo74+Yco7BdhiMxFzPPDsZ4m2F2BSHmO+5yWtfCh0=;
        b=J8gnLMZGJSzKKxfrP0xLJQh1ke+4QeZ+Bi94U9xYJRnFywKkssyoZi6LgEfSsuLrUt
         bSuRJhmsSYR5kMiTGxrihAZMNALUqhgDIGpiecEwcfZtzLLTvEq+wvCwiUjsmwRMmAS+
         PPoDb0XVuQGrVKHeMTyLJtsifoauw7drtuijA47NsCfOZY+pL0/02g0eA1V6dl8O+r2q
         nLm79EQPnuaCeDEIC3MRnF6oJqfZ8uDQWsakrUlYE9ZRQ2K2nX79V6RKoObBtsA5+dju
         b1e8ePaL6/G0UBsxXWKA8IhcQ2OmQ8F2IZvLj/CvBm26x6xrGPXAkOvKrKEZ0L4gdXt3
         me9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134618; x=1790739418;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKLo74+Yco7BdhiMxFzPPDsZ4m2F2BSHmO+5yWtfCh0=;
        b=qzNdDVQgJ/b8PUuGZ5dzODymubLBtKHX+Ouglz69F8VFzKrCVA+Fbm5PhEzdSDs6Xl
         tvPtUgT3yYNDynlukVK7CucSI14l+i2GbxPc1eWeVcl1IIPg8RbQDSKYI/9er/hCvXt6
         xTq1UIKRoeeID90mpeAxpD7xTLsVo6KYuKDP8A/75GI7vLSgwG/5X6DHKICvSLxrPmXk
         dyzxmMcTbbi8EaDiGpoGhaMwvAbOT7tmvNXE6vRdvSIlyzoflCyd+Pj3f8CgTEnsaNc+
         l5IvitJv+JmkLKMs8LsXtXTNZuv7mr7XXjz/bXiuBJtCsa/kBfqprCpGN+eu1LZ8wcRe
         QSWA==
X-Forwarded-Encrypted: i=1; AKwUvBzg9mc7DLo486M+mAw6quPR/QUXY43cdEAK+5a7rhqYOmGLLx6X3L4F0qU2NuShvlm4gqeZs//DZoAp6woTzuE=@vger.kernel.org
X-Gm-Message-State: AFuF++kEWklWX/ZLVnfCAHW/uV/gZMnlGjtbKCZhy8t3O04gj3Iohmls
	yTsWkL2+zcDC3irOsOsSv8/waQQ6/+BHlUrbl6Y2Rum5rXr2RDMOuuK2mrHqgiJC0JbAMqiwa//
	gMRGhNhj/TY5UUtB7p9R8FJiOmJrJ8gQ=
X-Gm-Gg: AYBFou29gy7AAZktnvDx1gMfX96Kc06qt65bMKd6V+yC9jlix5cUJwFQEG4G87/h6/A
	7lMaq0j8XnDKkyyf+c3MV8F6OUE/JYZKF7n5zBqdh+7ap91Fp0RTaT64g31XHtFYPF9tYHl3Vq5
	mzW2U2cFknTIYqgYECFNAVrnQT5KnqlJRi7tsUT7giOHhYfWrvlHueNU2KIGuy5ZHAipmHGFYn6
	jrKid3U40Lk9md991xtGhq+kEd2QOBEQrhdXvnl8kTtccTLsToMOPIq5iPFstZ6Xf8vcjhw42/J
	T0n4j9zzj8vSeAcCKiyqO7m0nUdRBZefxX5R58lwsv9SHTFPiD+B7mMEIeaMdQx4dUtli6H47Wr
	kXklBQTTcNtHgSFmm2yUbOhEb5yDMsw9+WNALs7Zo+OO/0g==
X-Received: by 2002:a2e:a551:0:b0:3a6:1694:821c with SMTP id
 38308e7fff4ca-3a63058afafmr2505641fa.10.1790134617663; Tue, 22 Sep 2026
 20:36:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921235951.3214-3-sigefriedhyy@gmail.com> <179012275019.2160803.2891956767256297440@kernel.org>
In-Reply-To: <179012275019.2160803.2891956767256297440@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 23 Sep 2026 12:36:45 +0900
X-Gm-Features: AclHuK-zDvybSnCH8-kv7q6WcLVB5cerfLjhFVuKxLvzAY4a2aHZ-j22ZbzjjFM
Message-ID: <CA+7S2vLXOO7+KJUnBFK9++TxKBtHgVdBtEaqx6sQpuqS5ZYsQw@mail.gmail.com>
Subject: Re: [PATCH net-next v6 2/4] net: add AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, dsahern@kernel.org, 
	donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com, 
	jacob.e.keller@intel.com, kuba@kernel.org, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com, 
	sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> - [Medium] dev_mc_dump()/dev_mc_dump_dev() resume a paused dump with a
>   bare positional index into dev->mc (ctx->addr_idx / *s_addr_idx) and=E2=
=80=A6

Same point Nicolas raised. I will fix it in patchset v7.

> - [Low] uAPI vs netlink YAML spec out of sync: the patch adds
>   IFA_F_GLOBAL (0x1000), emits IFA_FLAGS/IFA_TARGET_NETNSID in=E2=80=A6

The spec update is the next patch of the series.
