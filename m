Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1245317161
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 00:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789604809; cv=pass; b=njr8bvKrODEM2gxvn6hTfCjEAG7XnxElmZ9bmyH8uqEhg0nqSnG46LiJFfRu2s3Loacz8UVxNZzLx+GA1xwB+DRlFG8TinH6KvVx9s2TDa9JO1Pc0Uj6svsCuxW2qzSitnpTZhGltUG1h9ESw4VE9NWl0acAKaOOUNVoczAwG9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789604809; c=relaxed/simple;
	bh=TSVKi+8VuQ9HAj+OFANA6kyNZpknRB6POVRr7Paq/fA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DeB1tbnGghGHcbTEaFcC7YXfAAsr8sR/JonfXZKDplIvGq4u9x41FMWtqo1VPUKjGj8Hasbx4iFGReM1ymcBkLiIm6ptaBF5/W/ioZQ8iw3HnabSS09V/4gy6gUqFqFRA7JWPrzOqv6L1olNUnWZVPoh07Lgi/A3Esg44rj1ye8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7zbMB0u; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7zbMB0u"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab22370so211827d50.3
        for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 17:26:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789604805; cv=none;
        d=google.com; s=arc-20260327;
        b=CwesTDKUzrVKwyLWkNV+jlp7Z2JiXYtauxZc261s0Uh8vY0odZkfZg3BBswGHUn0NA
         y2biC3oUuZkjVk1N8rUNY0T85SPyC85w47J51rcDN9wvt/CdC3XqmOPik0fkUT0W3iIu
         d2p63QhwXCMEXufYkeMq7yMhAWi66gf0EarFKqQeIZviM8Iy6Df+Zoy2T+rLMQvodadS
         FmSOQtlm5HQDXyLvNemdsZYh/0lRRykdDUBo/SLYmj7Fla+Q42S+fDxUksfI0vNxBky2
         5aTmeJ3iF75zpaeehK71eDn7xg64KbPAUj4tpraWbt5h1b8tGHosuFlMdsTookXUgQ3+
         6OTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TSVKi+8VuQ9HAj+OFANA6kyNZpknRB6POVRr7Paq/fA=;
        fh=UKM0SZcqeYI8unrdX6Y6SciTO5CIkEXmQBlroFi6sCc=;
        b=o2FdGRjuFGae4vr8e9RJar6CmUbN5CndLm4EKVerclx4xSrr/Z7C2JFM03DvJjysr+
         Ky3JuT9SNL31ozRPxPdhzj1w9J7dV0pTpJnM6i8hmy9ntTHnf+TCKHkDA/nJ0k8cHNDD
         pA38hHIaEBKR+PqpKM1CV6d6093ixQc+AYy+jsOZMDm6OFyjGK/JdKeVqdOrRkskUTcn
         Zc6+2sqqNmBeE5lJrQ4cbE84WnueAFXdLiIwmE7A8Fb/ZEIOOa73swgDmg25LEhfST32
         +LqdwIw5Zb1SbRY3fXHGW5BrJyrp1cG+D3AImF3SPmQYPVLN2trBtakWoXv1dg9Dmh8S
         AE3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789604805; x=1790209605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TSVKi+8VuQ9HAj+OFANA6kyNZpknRB6POVRr7Paq/fA=;
        b=R7zbMB0ukOrSvm+sSvkK6bhpdf3R9H7NBii9uuxLZDvFXffAEMUy2HvZQA5d5aNWfH
         DZKXIUU0zO2MQ8c5WKPJE1XKVF9wbdzgOsEH6QE5asqErD7a5JoENZLx4CnTrgsvuzRr
         vcmZ8bKuexAuAp/fJiidb0W6zHP1eml9tWMRR0rn/rynjPM0qpYEJh5L+9sDtJH7JFSC
         /BLd1QJcfSXsd1xNLLBk3vLEWcxkOCqPxpVCX54SNCF6tEOlJ8VpyEBRyTsTd4G80SH9
         7XL1C5DKgvL9P3dZmz2VpvgEpzoV70a1v6mdIuwwH5zR/2pNu0pHoZfDhRJzJ1Tj89Ch
         0VbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789604805; x=1790209605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSVKi+8VuQ9HAj+OFANA6kyNZpknRB6POVRr7Paq/fA=;
        b=U2d6uo7i4muYijqZAcejRXawLVXxFEGzMxT95oghlfrqCx4IVsM1EUKe8PQkklrKEn
         a3W66AVAhz0eBphBwq7q4WQKjEoayD1D5xPyy9hf3l8opGrnT6yQpSZpBUHScFYtaJZS
         29lEsd6LX1ebm6UsDN7HS7SRdjY2b6Q7lfh/WcUpL9AkQohss931INGqtx4gaW4awrkX
         SWDq904R7tsriV95RnUWih6FeTH7UmcXWhOUGyxOXzIJg18NoAhZqZuP/OvroyuRnZaS
         Htoa4+lX8bnNyNfAQMxTcLD0E5q0jpjtkBODtI1lFm7nDNYBYJplaoVuB9oxkYKOHkHh
         Aqow==
X-Forwarded-Encrypted: i=1; AKwUvBwbvIOTvhDi/hvJvPDw2AlxytCstqvWm1DBKVq/Akp9ZoAuoyKNIczm0rnAUKxA/wiLGMuBcustkq491Iv4APc=@vger.kernel.org
X-Gm-Message-State: AFuF++nooCC5dIUHisxaJ3WCv/9XUeBQxLny498TUNsyyKV57i4QdX58
	oOPzMzyNZBasYiZJ6WyRVgrz2vluJ5Rmpb9hj9Ut1exJ1A2dGfiuB/kffisDxtL395dfKpJ9Dfi
	jciJH4cFYZB3J/TI4GOJrN44lUKunNOs=
X-Gm-Gg: AYBFou2GIotugp5x/S7H2IzTEx1GUXZxN6dOntVbVcetH6TFjhUQICVZ7QpDM7KFRVp
	788H1wutsTqm6nsjBv2+VwwHbv46EvtvjL8rY7O+7Y1D1fJfdaDlU6IwO7aTJU0BL2QIghlXt5T
	AhV7WarbzwB8BIxRlQ6VLYUitT/c1r50C+vm0CPll2vduHsYi50Qwpl6XgelxHz7jJD8X5WaUbw
	lzOQEn6/nMB9XSmnDvdEAC8q6JMDgR34SlA2E/Dz8ISUi4ipWH1AcoTjyzn7fC/jHTRhhYu4fpx
	mc02eLZv/xe8xee1JuyUp5BPP1RiFJsNJU4tM+GAZCDK8vYQNIjLgUsOS7fv3jlgwro=
X-Received: by 2002:a05:690e:1c08:b0:66f:c1be:3160 with SMTP id
 956f58d0204a3-6716329371cmr1669803d50.55.1789604804788; Wed, 16 Sep 2026
 17:26:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-psp-ktls-fix-v2-0-0eedc3b148ec@gmail.com> <20260915-psp-ktls-fix-v2-2-0eedc3b148ec@gmail.com>
In-Reply-To: <20260915-psp-ktls-fix-v2-2-0eedc3b148ec@gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Wed, 16 Sep 2026 20:26:03 -0400
X-Gm-Features: AcwNN1UJ2iJTwgwlT9180M0OEUFsX3crsB8-LF7eHYBnlBr14UoftWKUxJaOO4E
Message-ID: <CAF=yD-K5AJwgGEzmdAe=kwp0DuVX5pT=aM_hR9-hc-Jsv8L1Fg@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] selftests: drv-net: psp: test PSP and TCP ULP
 mutual exclusion
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 7:11=E2=80=AFPM Daniel Zahka <daniel.zahka@gmail.co=
m> wrote:
>
> Test both setting PSP after TLS ULP, and TLS ULP after PSP.
>
> Add CONFIG_TLS=3Dy to the drivers/net/config.
>
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
