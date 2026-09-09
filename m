Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD4F53359E
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 11:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952559; cv=pass; b=VGWD0EURhhKoAhr1MBctsl1oNHR1vCPjnbpcYwVeyGXB1Hs+urIEWcx8d/MtI4Fr28IaJ8H9ELCdTaRCpEaO3psCqwi8szUsdGGKoRMDbN4r6TjHlEwXdwmBlHluGxmxP3qD0rHYq48ahjcQfG73h0mKvmZC9G5dkBQMlpBdlAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952559; c=relaxed/simple;
	bh=+j50wNv2r3xNtSsPdNlvPp69DU3jj8cq2MKhSUhc5Cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HeiqONMYKQu4Jw/0vkI/uq8psuWsVLF7f9f1R5mdV4aVBh6fjvuBny5sMeviEBE5vm1Js/dSIG6abRxieelb3Jue1+pc4RUoZwS53r8GqUj6KJQaOPJLF6GLJZwlT/3EHeuutd7KpipqT7kdcF/xPHwx7ZGfOJQKMDHjP/nc9AM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C63zya/L; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C63zya/L"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b4ae3e201cso4999036e87.2
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 04:15:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788952553; cv=none;
        d=google.com; s=arc-20260327;
        b=eDjPJEdRwJnsSoYkdifbNToB4s128s5Q1XNJMWfa6GetVEd5wdLqkqVWyt57XyIapk
         1uK2KXaEpG/nnKE4ZolOp9kuwKuHG5S1hIkHhKc5l+nwN2yXRKBsdhSzPn0O9mY4FvNJ
         bg1rvyzxfBNTz4MDVSGayQGCr35uIEVWAeNYV01eQoKRGlytQfxeL8zfBZzxECraQEZ4
         WJw5pZ1eNv1BEn4jAInL8XYWXfgQiTTVDgGXApXZzNuNUnlT+QQ2wwmWH5t7LUhn4IJN
         EiqTOcHwMam5xBZscuYdbXFGLlogGsHmtGmU6CSOTLfcSpSBQiJJVzJOnmoiRxYccGwN
         bQBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y4cdUU4wdLJreuRLma15s70p7885T7zuEzvFUDm+iJY=;
        fh=yYj8LZfN5ZyVm2VZm9xPLHgC1UbdvzmQopBNJAJsk0g=;
        b=rFN7vTuTNWq5RsbadV4pblFu24IrOJBlKt6KjbJbr6iu5LQQm3ZwM+x4Rk01EUousg
         eNWQnvsbir5nFOdGZiLaEKnwV+WPoEOtD9cxIgplmtVoPgA1WD1oNFMJ9FIixof2wx2T
         S/KkRrH2AX+BUZP4lettashYvtMR/6obvBimBTCLD6zHMrfUVqAMlxFKWScu0/5H1TbI
         tQiI1YVWWw96Zk1N+IQMNPEFaiVU/RJJwObjzRbYFXKaAdM7g85ezgIy2JaylP+BioGM
         B7wO5hcJU0CT4xLzI5rV13a7fV7dG2ZksNNRwxBdA7KHm+8q3YJySFxL1Z9VAuiN/sjS
         jgkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788952553; x=1789557353; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4cdUU4wdLJreuRLma15s70p7885T7zuEzvFUDm+iJY=;
        b=C63zya/LpWmCGXJ1ydVUM8LXgdoY+CC82am8T57E8i3/V5F9xluwuc2hR1pjWzQEs2
         F8u00psAJXRgzh7vjx61DAZtcnQNVcqbOxSuWdJPkIbMeV4z2NVb8OTpY+dyDVv/TkBS
         tUV15Gxh9lmoN3RwMUP8O0OY0n4460nL+qIigFIboYrsBiwBRvR0uZ0JKJ8uEb8eeJnm
         qdqPQkvstuB8WAElfpkMca/EHjnoGLOl+e6Nw41snfE0Sw171BS9GQ0mUJvDUvXd1Bom
         d5uB4V3GTcnnhg8yTkOUTgWfBhQGzq4EtQrA/9okQ6uuOmc5NlG4liq0/acgJy3xHrTQ
         3jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952553; x=1789557353;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y4cdUU4wdLJreuRLma15s70p7885T7zuEzvFUDm+iJY=;
        b=QzWRa3K9qCmVulp6J6dQfvKxcMOge9ql538BEQ/ihoc1ndlUBTMK2he80Dr4+sOG2E
         OkXRHhhY0NjzK9A6UG+6MTCalUkVmcY0EGWaRI4vWcCm74sBXzwZUZgrxZxp5sF6Kuna
         XNdOjEgrKqlnYfTOP1m33uB0T2/xuoQSZJdzslBAVS5VHObhOPVrpjWQ93pPeS3pK1Nb
         dExUBXY4VJLJnTWsp9SrKm3WREGOabvF4l6X4dQp09OQIMQQiiHHz9CT/HHm+nA20Jhv
         UvtrTxrYvVONntE7ERfWRVRFMnsXezdeHQN0mqRQB5D5aX/puW8wH1Nzxa+FxLCSfYq/
         PJCQ==
X-Forwarded-Encrypted: i=1; AKwUvBx57hwT3T3ULsVaYJgq/V24Oj98sQUJtb00ksvrHFF4QjtrQ5ty14JYTM9SxI+91sRlfw3DSuxOYXI6pvAKVuI=@vger.kernel.org
X-Gm-Message-State: AFuF++nAdiOB5FwKhr5CZyIEaeBGyfTn6jZCQBWgyiAihNLciU7a9krO
	L+gWyWuJVMHFrnRHsocVX9TAkZJzpOrq7C0W7a3frpdDcMiHgmjbRFR54Y1l/wprJw7gIDdTK1f
	Sz/RM0SPuNCLJd7q9mI7PKvtuvK2i92A=
X-Gm-Gg: AYBFou3tSrz239Mxl4p+TadriG/+9u/4NANiHc8GCBSBpnc/xP5kRl+QvjCoUtcSQGw
	h14aLEjU6IcKb3jIqOdzfQYx0El9pDk/9D2g1OyTfacf09sLh85KNnJxEQTkOdzlerbp820TDE8
	wdmYClOfAg4Ubp6FgTuoKwsSKhxs8EnqFSXgslus2nrPvSNmd1oJnAvJPyh4zwzIAhqiZtFV4iL
	OhlcB4df4uJfx6hFeWv9K5wHNIepiLzjSJqZ1KwvmpOzwkjZsvZustI1XtcDO+7K6plN/1qDB6g
	+YA9XPaIatXIRAHE5/lXbraFETqXA2zGhVTOaBUc96pARc/aQAMb58iHRrfSvGFnJXrkgWPADwO
	X6DnlVesGmMHJz5hMAAWfpxLvFjU9hPeSQOngDwp94v0=
X-Received: by 2002:a05:6512:108e:b0:5b4:a9e1:b8a4 with SMTP id
 2adb3069b0e04-5b616f4a238mr5849435e87.25.1788952553103; Wed, 09 Sep 2026
 04:15:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909013401.14408-1-sigefriedhyy@gmail.com>
 <20260909013401.14408-2-sigefriedhyy@gmail.com> <175b6b01-2f8e-4b77-8504-6f26d9f8df98@6wind.com>
In-Reply-To: <175b6b01-2f8e-4b77-8504-6f26d9f8df98@6wind.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 9 Sep 2026 20:15:42 +0900
X-Gm-Features: AcwNN1UbxNJzD9rsLIr-ful2KYX9yromNjRe3aj1Ks5MUzUlvT_D5TZcbmgqvTo
Message-ID: <CA+7S2vKm=4_JBocQPq7OCZ6ZSaVOVS7UUzQN5Rd_+ABAFBkQ_Q@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/3] rtnetlink: add AF_PACKET multicast dumps
To: nicolas.dichtel@6wind.com
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Ido Schimmel <idosch@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Nikolaos Gkarlis <nickgarlis@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +  - IFA_F_PERMANENT marks entries added with SIOCADDMULTI
> > +    (netdev_hw_addr::global_use, "static" in "ip maddr")
> The global flag is also set for addresses added via dev_mc_add_excl(), ie by
> some drivers.

Thanks for the reminder, will fix the comment in patchset v3

> > +     ifm->ifa_flags = ha->global_use ? IFA_F_PERMANENT : 0;
> I wonder if adding a new attribute IFA_F_GLOBAL would not make the API more
> understandable.

Good point, IFA_F_GLOBAL is indeed a better API that will fixed in patchset v3.

> > +     struct net *net = sock_net(skb->sk);
> For consistency with ipv4/ipv6, it would be nice to handle IFA_TARGET_NETNSID.

Will do in v3.

Thanks,

Yuyang
