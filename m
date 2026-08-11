Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FED25B0A4
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786454956; cv=pass; b=LBFwB3zgT4Y+6O8SgbwevzXCe9weuS/nnA+0Cm9TcaghJ+wu6oOSl3KEIvKcqWZSstxkyVSMnteHBrBteZ43wciqMjhtAbz1ddtvfzjDKhn7JGf8UtT+NWAVXbUhAIfTc0vwMeB7tgQzpw3q2yTqJ0h5NvqZ6Bt8if12uYIl5lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786454956; c=relaxed/simple;
	bh=eXKKt0bULLINK8Io6u6FH9ijgQntZY+ARM1XH7mV7ZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tt4JdjvOtw7A4B+9bNAIKaaL03NFqdcu61NikTem39VrlN6N91XLWXmLAW+U3piZ1ecf+ydqkbxrwE30fp9NOE65G33HP3PwWMvOddraae6rJk28t+K+5MVWOENnzk1753s+0QbrmCfqGIIkHcGmARRuL9mz0WRBjYIgvn7Vl0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NFV0nybA; arc=pass smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFV0nybA"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4a475bd9ff7so401745b6e.3
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 06:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786454954; cv=none;
        d=google.com; s=arc-20260327;
        b=fc0gEFJotBBLwyIqRigg0NzBg4F8rdfDIsJ2bD5m1GSeftOB3sle4GEEpHIF+6ptv0
         uT/65gjevoStA7DTy2hSAabybxRZhQgug8gPiUfwIjZJ6AfPFsM+muketAJ8SqJQ2uij
         HaYufwpc6bEwi+S/xEUZ79LwWAmgQuDe07WPm0sJ7my/6dVnTQI7m/TIGuF2h8jnwz76
         WY+brKRRpVRs8W0QJkNi1YUL7bIJVBm4SR9JPvBoxtjvh1oo1Sv/7eHHoRB8H1znfviN
         gwhByQzBkPXx0wvOPs/5x2zQsUMs7Cc7oEt2gF3Y6f77YdTVbT7qAzpXaXrvuWU2gr70
         Irqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eXKKt0bULLINK8Io6u6FH9ijgQntZY+ARM1XH7mV7ZQ=;
        fh=tqbyM02lHpOGDDekYOABR/zblf00PZCW4AIHl5CADFk=;
        b=MWvQc7bbEJ/oVbk9vKEVpeyPD39HMtDYEi7nCgt/nHN9CfjODSL+E9vC6E1WSUI2qJ
         0PB2KJVUwDRIxJfZ8hoGRyyjOHkYxl8UqdjAwIo/ySuy8Zt4MCiLu01H03I1UBuZy+nj
         ynbS2wWByalGGPP0LcheAp2Az0xlghPHI0wTOsC5/oH4orkUC6LDICK0aRJVt3xpyVgN
         mdfy4kOx+n99rDqUFzYrQxzzzIw5RpfrZB3GTXcoj1zlBB+Iqre9RICqaxp/FScNtotC
         vB3XcsSPybWjJ4cvRG14P34wxCC9s1QytrOVReJIEGU03fljC4Z63qcnJhk88+WaEQg7
         VpaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786454954; x=1787059754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eXKKt0bULLINK8Io6u6FH9ijgQntZY+ARM1XH7mV7ZQ=;
        b=NFV0nybAjzmMXsOcliDCEa5jkL2W5tMQZbsCj2ozGoyqan1bokEQoz6WCvOr0iboip
         WlT2/wTZVX0/TtUWu8EpAyA5A0tej4meHndhXohpHWqoigZgqatqGxVJO8KEwEhX8hW7
         W5gl3gXK/4pRXx1Lb7y2zkK9X79L1UByQL8qXRMkPcS0Jqk6ycmpXg1KJdkTNkBxt0xT
         RkkjAftgIK1jMwJkZC12iUEx5JgaNozFafgrjJ3yl49GSfQUNLj7sw/apBOyLM1ZqIdX
         i3DrmMbW5fV6Un5jXsFKqQpp7koLUP82zL6CeP+WgefWlQOANKbnhyn9NE39D+k9HhpZ
         xwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786454954; x=1787059754;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eXKKt0bULLINK8Io6u6FH9ijgQntZY+ARM1XH7mV7ZQ=;
        b=Go1rZQRTngSrnYFBvZ+9BVBL+JhF8bPbc1nXY7y13uU40DQo/BEmFmC017e94szViv
         1NoRU/IWrlnaETy8r1XW80Kg4gN5c4/qZqojsSnJZrJ4x7MpY61fWezn6KL47fVfkg6v
         63wMPU9tbG9KVxIv2aLqp3eRIi80MG4YDCQ7DldU9eX1NQTV09cilIdKinYYLbn17877
         0UXG6PDdM5RdAcBJz7OPfEpWN6q99Cqoig6Qofgcc8xLnz1dyvB3ml5jaTrYjA7bv+y2
         Hn7T47fr70LPsmK0gzYxU7UZJBLxsogeA++4HPRAAiERnzfj4E0KIXV2HenR2vKuRpLX
         7EbA==
X-Forwarded-Encrypted: i=1; AHgh+RrKeyIhr1+IUBaNQ5PoixxRjqE7SBsOKMm2O5kGe+1uDsAw8R/+Lj9wvV1AD7EDGkGjInkzFV6NAiUpkNPFeF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoIVB4xeZC8BEc6tQMgSiQygeBuLRxAOX19jBQ488lWnsuAfrP
	xRts3KSwFtMO6Cd6YwvezSye3HYtRM9+CmLnQbD03vvcKA8PxTec6OwFdOzqQVOcUX7erFOfLSr
	McpvQ7qMVtruYCmeKiLgUhJJfc4/6koM=
X-Gm-Gg: AR+sD12AQQnGowyorzvuvH7djlPZ76yI8MLvZtRQTOt0So2gwOuntxw9bchLC0zpZf9
	xXtL8OyWaTKWpqO5RZry9B9waSNKLO/rkvJMke3zoxl32a2dkRUd7NR3BacoquG2S+3PhmPHL8m
	dD/FDZYQr3ROER4thzqQnP4UnnIZWOrCcZlC4zs1JpWfmd3DnBDk74UOV1PmHaV9w78hL1r65BB
	i0f4weNpiyPieZSHSTca8tiJcU6u11bfqiwGV4mIBg0kEpYyZvyfY5ufTZOXon/ZzdXEynbU+tU
	vyFoIt2mBLy4uzuejk7kSSEPWadt7MCWpEIjU/1f3NpHgo2fYOuGqQI1eQyY
X-Received: by 2002:a05:6808:690c:b0:46a:7ab9:c338 with SMTP id
 5614622812f47-4b1fd8dbd08mr1113850b6e.4.1786454954091; Tue, 11 Aug 2026
 06:29:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810-netcons-userdata-rcu-v3-0-f65557f769ce@debian.org> <20260810-netcons-userdata-rcu-v3-1-f65557f769ce@debian.org>
In-Reply-To: <20260810-netcons-userdata-rcu-v3-1-f65557f769ce@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Tue, 11 Aug 2026 14:29:02 +0100
X-Gm-Features: AUfX_mz_hulfx3Os9esMFs-N99crPeFdflUFMh7MJO-oYPdFh_lNeKJ_7E69zcw
Message-ID: <CAGSyskV0naEEDZ1oYKz5S_2mLnwODATLy4Ej1OpE7XKcnag+ew@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/2] netconsole: publish the userdata payload
 with RCU
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, asantostc@gmail.com, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 10:36=E2=80=AFAM Breno Leitao <leitao@debian.org> w=
rote:
>
> update_userdata() takes target_list_lock to swap nt->userdata and
> nt->userdata_length, then frees the old buffer. Since commit
> 7eab73b18630 ("netconsole: convert to NBCON console infrastructure")
> that lock is also the console's device_lock, so writing a userdata value
> from configfs serialises against the printk core emitting messages.
>
> The buffer is immutable once published, which is what RCU is for. Move
> the string and its length into a single netcons_userdata object and
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

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
