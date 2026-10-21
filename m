Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792579491;
	b=5KnV0jRKEDLSj1ozOWfM/2NrtZyu9CcOuvM2Cqj/2TQO6vaX5xY3RnADfXDjwqj99ksp
	 lYuG4UdcgfeZOw0F93wjuTsEXkDV8rhb8jcH+KxfZO9jap3KqDOw4ypKUz0Jzvcy8RSr1
	 YBHf0YvhZgVtfzx66LIDhNSYOIAC1x+5hpRf2QoaCfrhEX36EK3J3Dauz3/7Wtw3zCKQC
	 GZ8KjrtbKT/jI8Y7sWdfbK8dMwd3XgKa3Wraws0muI+qZEIGK5FJ4PpIisDQwFiLOJ2eQ
	 vAGm6jc4bx0882lA5gfgJJrfl7qUS7eOAdemL5RQWnEKJpUuEdf81jaQrSXFXljFQAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3+Zu9D+KgKA9DXJq7rrfhDe7h3krW5LnH7aKJrVEA3Y=;
	b=KOWnm/a5G4GZoawW5guLFTuuTSZhxsmb66UsMyhd1rjZizmF1l7vvYvL78jgFjJuvybi
	 VmgKhK8IktlAXZu9rcFqerSwyG+w6qqp2Xwhf+XSW9sqDAnTRfX/awtJlYpF0jq5U0HSI
	 FPSHIWhzyxxEYCJPwCLq4Hbli4pOyljGpnI14oz5JFGDk8bTRlkR1o1QaLhXTp2RxP1An
	 tM1N1Hzo8xURXP/C60LfRUuLGKmBFSIPjelWp0bZp51wlOYSJLEkE4uf2twzZUojBxuii
	 ILtcvRNwBwV3WUw8V09ifLObfjKhD3lTt0vtpXp7nUqwg3KgnjY8Gf1zCxRldYgqTmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FD7606A31A
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 10:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86FD7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bc18f54abbso449442e87.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 03:44:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792579484; cv=none;
        d=google.com; s=arc-20260327;
        b=aDRoURY5k8GqsQMr8rOMkmIhEW43z68VJRnvqckFNUjFbK6pU8hSEGzf/5DwMhWNFZ
         F66MWEj7Tn/A9/GuHLfyy+WFADiogKTFJScagYT812Hs2BIfgRyQEx0IZQGYhFs2xci2
         /ZCk6777VcKggUlaK6/kzjxg8QdWZY8IWXq4DBwHdeuPficpQM94jbnguNyoUXA9fWiF
         oCjspr+BZWji3jsyY0Of4mLjBcJDlUOpFfkSl3M28jfhFruJzNJclATvwl7vfTjyKsZY
         YrIJ8ViiPwNnGj05boZYnaAcYQc+lJ3gsqaWUPNZwpwTiJVcyQfb+OAgniZhyB6Q8rgs
         h3Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3+Zu9D+KgKA9DXJq7rrfhDe7h3krW5LnH7aKJrVEA3Y=;
        fh=zuH6g2HHRk0KrvotdTo62efuKVRi94uk8pKNdNv2vDE=;
        b=OPh0kbMuSq2uaEdVbc9724gQDzIWYa6FfizR7UJgRoGyXZ4ghIbSYyzqSYfy16oKYw
         n6CTsg3xAGyjBWDkO2X4DwFHE+Ii3JrXYMnDWsMnZd8iKKBe4mvHb33mwI5KzqVseI8X
         pTZOmVjBOVBlEhjXsjrKt+GXnDW7Ejxap3KcJtzhkSe9W6Uv2MOQpWj4Tz2lyAphdMHJ
         3uFg1mMwrVjQpC3Xdb00lj/pt4ZpltfPM/QUhc9ZHU9aBSgZ8vzTjbWigCcPkRIVKPSZ
         cJYADMdoERupK4vm8lL9IgHNCJIVEDSI+hee1bad8v2ciE9VGiYl/CxqBvjNHnFyo8om
         Tmsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792579484; x=1793184284; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+Zu9D+KgKA9DXJq7rrfhDe7h3krW5LnH7aKJrVEA3Y=;
        b=EMJ2b1Mfsr3z531uo4PbTQcnTiI1V6QP2j5RPccaDPxAHktd9HynIpimNpp3Seb44d
         dsnZSu24RsiD1Ks8D84LeNAS6pJL8bWtjZerKwun5BXvUwNGyxGGXot1ISBjBaelgNWb
         +LsiBG3i+1rd2dbFbheMbr8XhypCxbMgaV6YqM7xJmr0A6EhAAIIaRAWbMN/NPY/BODc
         BCFbyAj3A1UEcGi6L+CouAWi/U+85lD9TRk45mfBdIk4o2Hk6O3GAD0V/DT6h5+fMwhB
         HDu/WXCbJOx9fw8q3qCmbhmO4OLj0UJdhHDMNfw0tSpNpbOvILJCArJ7ODv+AMQ9ddWI
         UNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579484; x=1793184284;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3+Zu9D+KgKA9DXJq7rrfhDe7h3krW5LnH7aKJrVEA3Y=;
        b=UN1Bu2afLRoNCp59SYqaoBVsnnWrCGbEqUv5SK0jZIDOnMVtugLFTuyMZ9vE/X8g4A
         NKoxSh6HEEYRlWXRCyJKe2u+0eOGstkGmMVLTLxbo/SmpeUlHDHVDyGRhmfH/oXvA3uf
         tbfO5YhsG4bOV3/8lObEP0KOiVMQcxAavDkufxqfVlrY9UYYcsPyzhSFsCQcJSo1EWqy
         aLeGNGkruRHm1j3ZgzyLbILZk/l5frdWW8KL/k4FlccNrK6djyW4roLcqxEcdHOQ7IhZ
         FMPbfY0F21rHhQL1zcmrXVb3RovvSoJKJl8d7Py68zCK8W5sv8l0oWu+I7NSoP47qAr2
         +Xdw==
X-Forwarded-Encrypted: i=1; AKwUvBz//Wfaekq7A8QhUPlSK6lm60PwQSj4iVO94h9ZrhwtXy1pqmG/pdKnJPk9G3qIbE9sOXuZbeMuvFe1o30s0Wg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJi/QkJuzY40wrnK9M7dJi5FCVXgEO6A8VgfYI7sTmEBj/LtkcA
	6spwU6LWLfXuz7n8niG/otozcvtmRyWdK5A6wiUAkaRE8NNTw62aaWxc/HM5fl23Iv0S8lhROpm
	dFF7rD3b2Kn8ZYvHzp2OLMSZk+5LExy0=
X-Gm-Gg: AYBFou3I6OutEwSgKi9qN0U97h85UVv1d1SLR7Zc6CLPpT6EP1pIPo9I6Qh3nq+MBFy
	GUcEVfkuZE+Ah4+W51PdlMwIbbKVpKMj9sm9lAj4pMo6yGQQwVD7xsSz93m+a/EqICro4Gh4Pmh
	tCX69/uxVjklKkEwqQaHQM/xeJPkBkpRTfk8V4NLp87hjmhQOKKuE6gtK0I1b1bWI0RO89aX2YY
	kEk95J8EgTkp5Y4XOIEnFI/50TYtEpKhN3jhiq+SjQOle/3LwVKWOGplZFaDVVSozAI0N8v+rkg
	Z0NJ+OSmuSCDcJZrVBEwBvADJLv8jxAU20t+kfhhEfTaS08B/cUArBXUShB0XInpUbKtjlLrurJ
	Wk+CxuNH5K50LTL8yX+bpfowe//VFwdsz/ozZu3JAsjKIj2Qqra23xXHnV/NfsvxIweE2
X-Received: by 2002:a05:6512:158b:b0:5be:50d6:af8a with SMTP id
 2adb3069b0e04-5bfa1ceb37cmr564734e87.33.1792579483402; Wed, 21 Oct 2026
 03:44:43 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012011707.3378-4-sigefriedhyy@gmail.com> <179185709988.434549.15422498299449004512@kernel.org>
 <CA+7S2v+LHUWXQMD-cYPEzT5-f3Qhw_vz+LEssQH_A_oqDKtnnA@mail.gmail.com>
 <8dcd9564-e9a3-4b00-93b8-3cb023d68047@redhat.com> <CA+7S2v+rWYvz9xKPEeM6=3HPz3o7TbX2uRfRKk95f9Y60HnEiA@mail.gmail.com>
 <976d815d-a9ec-4fa0-9b16-8e55695706c2@redhat.com> <CA+7S2vLWvQd7GrnwB+B+DiqAgST8EjfWwBKzJXtjGRBPVgmOBg@mail.gmail.com>
 <d3a1b219-84da-4ed8-9d87-5619e74bd1f5@redhat.com>
In-Reply-To: <d3a1b219-84da-4ed8-9d87-5619e74bd1f5@redhat.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 21 Oct 2026 19:44:35 +0900
X-Gm-Features: AclHuK-rJH5v9EVEYVeh2aYcnbIBH6iiXDeQCmZP7VNDudjBotFAAvZQy4bP1zQ
Message-ID: <CA+7S2vKt_n5MyyiG0wf01wyzTW-SUzyyRSw+eui3CL5rx0Zavw@mail.gmail.com>
Subject: Re: [PATCH net-next v11 3/6] net: add a generation counter for
 dev->mc changes
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev-bot+sashiko@kernel.org, ajay.kathat@microchip.com, 
	aleksandr.loktionov@intel.com, andrew+netdev@lunn.ch, 
	claudiu.beznea@tuxon.dev, davem@davemloft.net, dsahern@kernel.org, 
	donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com, 
	jacob.e.keller@intel.com, kuba@kernel.org, johannes@sipsolutions.net, 
	kees@kernel.org, kory.maincent@bootlin.com, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, sd@queasysnail.net, 
	shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	vadim.fedorenko@linux.dev, willemb@google.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> TL;DR: please include the relevant information in later revisions, at
> least as a reference link.

Understood, thanks for mentioning the background, next time I will
make sure to include all relevant information in the cover-letter.

Thanks,
Yuyang
