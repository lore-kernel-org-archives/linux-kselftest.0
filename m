Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2880D355F22
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 01:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782177509; cv=none; b=QZD0yLYlfxfGxuMVBY22apfxqzrxGz/3U1mCuWhNsFBZX7WVkK70TWjX1AiRdidVwzA1PvPn0pUYpqX1j+VQ24WA/nxEDmAMgYY2FJG1BTXfZQnx4K9/4mJ8urQmTgYfLfQ/EuE4u2BxnGGxyhqJ4W9i7Ze83yOTL16wyu/Ycvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782177509; c=relaxed/simple;
	bh=DmoUeLjpNfEfiOYCdY3qAp15oMfmxTnq7Cv/R8buu1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tXqLZ/KUMfenUhnSiThDmPdQJb4QJI3M4BsJdoQz9TnBSNXJctvZis9SMm+Un2/RApYcCM/zwESzR1907M5SkU3KZ/iea29mCrZTgtpnOKwTOgR+GiWv2eQk8y3qD+iBddiiPhigt9GYzcO1qXMPsd3tcansUDNIQ4beQcR91ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdFiLo25; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdFiLo25"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c6c101aeafso32175245ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 18:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782177507; x=1782782307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmoUeLjpNfEfiOYCdY3qAp15oMfmxTnq7Cv/R8buu1U=;
        b=PdFiLo25252QNfZVhdQm/Xiqrm9NTmt01kT5Sy0wqjgU47zKkTF/jEkZDaxEwNwHiG
         tfMGxHJyYDyp/zdQ7RPHakyfCftikdhG1/9NRinzj5W0Qm2FzlluXMccgn/h+rEM0HOM
         KPOCuNsPPrdSkZtdLdmyyEr2KJ81jmFl1/sJ4jUAzE9QMiWS6xqwD9FPIBs6cUf/7u53
         pswUxcOxcBsLrPydH8WRLt9mgwjPC9QOaCe1jmFRTlp1yZTInIdFzgS7zYBiGhD6MI7t
         T2tqQKtWpvHsRrlUFhNSlGfjsZxIGnHS7v5i4eNU9ERwF+5fKWoved/oxqYpbbb3LWpA
         IjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782177507; x=1782782307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DmoUeLjpNfEfiOYCdY3qAp15oMfmxTnq7Cv/R8buu1U=;
        b=MShVudlYYkGSvoePvcQTmdc9J7oygMSvrm6Lk2xbzgIvksFNfCy6m/3PyAFlfnnYRi
         TvHHdNlo8YCuTUVMfgnHqpcRhq+29SFz5mizHbvSeOojZRSKHX/EcUs1f2OjI3H/ypVP
         eyU55fWh/g3xRzEl4e4B0OGhPkiJuGtNr06klVpoAF+24WH99mJZY6YrZNQB8gUWN9lh
         O4u+Tiz+3FTW+WoHzh1jR2irP2jnkYJRPs9xCBtI7WX5N6sivLL0IFTUxm4JHFzbxirc
         xcnavltCAN21alSKgFVE0xUAu+SM8iCB3i2uWVxcNJQZMEDgVji1yl8m3DX4zBVFAusu
         z1Lg==
X-Forwarded-Encrypted: i=1; AHgh+RqPv9w3qnEtkyJFEwAMBscKoiqhbgAjhknGk0EvTJda8ZI7UDANM+7xJZuEOkXvx9oPQqyw5LvrAqOBDVoUlBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMNMYfLYBgHi1NWnLxt/qXdNlfMPL83D+ysX/W8EbxXuiCoQbj
	3TKvmy9Eaed9djNLGWXxbkgqGNyB6J01z6oowxj6Tb6TpZOJ273zJeJwOdUM6/ZI
X-Gm-Gg: AfdE7ckQB4I+4W1LBwHTC5sZMztSuxnKGtveyDuZiHLrpQHED/imuQo7ihn7zT6KJZm
	Y0HIXPcwhACnwPlNQPyid6wK97zaiFjkk9JyeVf2Hko1EtobqwU47ksctoWPhW1Z82YZW4KT0Fi
	+iYIJE+7r6eIO3wpDMaNDnOiR5g6S3aljoWziIQJGvuvLbU8+xJiWuadBUHiTZ+Bik1PTqfYeD0
	QICA9hIgVFhTHsvJBODtFbplVUHZwZki+dcY6hZghiDSlOUW01NVQd4HG5k/vm4GLHcfK3TUGbM
	Na5anLMflzfwisDRKniGzNewlgaHLRKviKFncSHFu6+mL1pQS26WsDUH0u2CbkeLGAI9mFA1ox7
	U74tJJasK/k1CF1Xp7H2LqIdQzkza+t+gTjLzaxYMLNgoyrE4eioE8oZZLnHWrwqpAppcBIWFpJ
	sHZyrHkg==
X-Received: by 2002:a17:902:e892:b0:2b2:5503:1b8c with SMTP id d9443c01a7336-2c7c99734famr1897205ad.11.1782177507312;
        Mon, 22 Jun 2026 18:18:27 -0700 (PDT)
Received: from dev ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c799749cb3sm45863395ad.72.2026.06.22.18.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 18:18:26 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
To: andrea@common-net.org
Cc: Yuya Kusakabe <yuya.kusakabe@gmail.com>,
	andrea.mayer@uniroma2.it,
	davem@davemloft.net,
	edumazet@google.com,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	justin.iurman@gmail.com,
	shuah@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	stefano.salsano@uniroma2.it,
	ahabdels@cisco.com
Subject: Re: [PATCH v2 0/7] seg6: add SRv6 Mobile User Plane (RFC 9433) behaviors
Date: Tue, 23 Jun 2026 10:18:14 +0900
Message-ID: <20260612032313.28921-05-yuya.kusakabe@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260608023951.ccd278890d7c489dbfe21113@common-net.org>
References: <20260608023951.ccd278890d7c489dbfe21113@common-net.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrea,

Thank you for the answers.

> On the placement, the new lwtunnel encap type you propose could be a way to
> implement the seg6_mobile.c separation. Since this touches UAPI in
> include/uapi/linux/lwtunnel.h beyond the SRv6 subsystem and cannot be
> undone once merged, it needs careful design.
[...]
> As far as I can see, RFC 9433 has only one Headend behavior, and no L2 or
> reduced variants. So a single LWTUNNEL_ENCAP_SEG6_MOBILE handling both
> End.M.* and H.M.GTP4.D could be viable if accepting both input families
> (ETH_P_IPV6 for End.M.*, ETH_P_IP for H.M.GTP4.D) is treated as a design
> choice of the new encap type, not a stretching of the seg6_local endpoint
> processing model.
>
> These trade-offs are worth weighing in the final design. [...] I think the
> lwtunnel direction will need feedback and comments from its community and
> maintainers.

Agreed. The first per-behavior RFC series (End.MAP) will introduce the
LWTUNNEL_ENCAP_SEG6_MOBILE encap type and the SEG6_MOBILE_* attribute
namespace, and explain in its cover letter that this is the shared
container for the RFC 9433 Section 6 behaviors, so the lwtunnel and
routing folks can weigh in early. The dual input family (ETH_P_IPV6
for End.M.*, ETH_P_IP for H.M.GTP4.D) is specific to H.M.GTP4.D, so I
will lay that out in the H.M.GTP4.D cover letter; keeping it last in
the posting order gives that discussion time to converge.

> If LWTUNNEL_ENCAP_SEG6_MOBILE is added, using SEG6_MOBILE_* attributes
> instead of SEG6_LOCAL_* removes the NH6/SRH/OIF overload raised in v2.
> After solving the above, additional issues remain in the patchset,
> for example src is overloaded across MUP behaviors, and v4_mask_len
> needs revision. These are independent of the lwtunnel decision.

Both will be addressed in the rework; the details are in my replies to
your patch 2 and patch 3 reviews. In short: v4_mask_len and the src
template will be removed from End.M.GTP4.E entirely (full 32-bit IPv4
DA/SA recovery only), src will mean the verbatim outer IPv6 SA for the
IPv6-emitting behaviors, and the H.M.GTP4.D "Source UPF Prefix"
template can get its own attribute name in that series if you prefer.

> I can lead it. I have been evaluating the SRv6 drop reasons with my
> research group, alongside other pending SRv6 patches.
>
> We can sync offline on which SRv6 reasons fit your MUP behaviors, which
> v2 MUP-specific reasons would fit better as SRv6 or generic, and what
> stays MUP-specific.

Thanks for taking the lead; happy to sync offline. Until the prep
series lands, the per-behavior series will carry no MUP-specific drop
reasons.

> Thanks. Maybe also worth covering bad packets, like fragmented input or
> malformed GTP-U extensions.

Will do; the C-helper selftests will cover malformed and truncated
GTP-U extension chains, a duplicated PDU Session Container, and
fragmented outer input (which the behaviors will reject explicitly).

> Works for me. What matters is that the upcoming patches are well structured
> so NF_HOOK can be wired in cleanly in the follow-up.
>
> I am already working on the fix.

Understood. Each behavior will keep a single strip / transform / push
flow in its input handler, so the hook can later slot between strip
and push without reintroducing the skb->cb context pattern.

Thanks,
Yuya
