Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B1036B907
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 11:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409741; cv=pass; b=O9dXpxxAePAoi7SQT3+Zh1mqecgRvHLQCqNi1uiwMkA5EO5rVYTvJ6cvRo66Q2vWLjjJ18qmnsYWlIPD9wip3yNVi0V3nczPbJ5X5JWVcwR7eCgpAASlPWb4BLTvbw4HTNmP9d7njetYoaBfNbjwW2qvD7Hf0L5v0AX2lnJStTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409741; c=relaxed/simple;
	bh=y392TKxI9NxK+HxZju6721gEDX3uifjte7V1FDxyHUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ObBygXtNK6x9RKoaohZxWjML6l8FHFjnjK260P2B93KXFmcEQeitG/VnrHHPdJ5+df4Eudk8b3dygFuTAPTHkQvnn7mbJezjAANK+rC2SnfF3oew2KyuPyZTcmu+Bxjz0auznalsKhPkngvM84QYs5HT6ZSTO5y5J1+YI1ch7qA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjnXzv+T; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjnXzv+T"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ba357a1929so2051463e87.0
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 04:35:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792409738; cv=none;
        d=google.com; s=arc-20260327;
        b=Ok20s66XLckVqBn2YtYAu9E2r7qJZT7gBzULSj2I424j4OecJ7rVROdrj7lFdT1Jxc
         h8tfA7p2nF3CnFYAyHl5EgbaDTsKpZgAxn3DRX9lA7YdEfaWW4+024RGfajUIY3KhJSu
         tX6zBLHCP3F7gtES+a7OfTBFnNe85ntC5Tem8ZAjZb5ti30WWx7tLT8uJYtq+ApUzoWY
         hl2t6oEzbZ6t3iCmdljuJk14dTL8APXecovpA/r8XGq8/DPNt7bclrAVtLx8D7554q3w
         s2GmXfkcpvNuC8Z3wx9JSl+k8W6GQPollb0fvcbTRr95+oQcg6G+Yg9OJy8j76BcYP1Z
         sZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=koS0XoT+3CWL8eMG9x4Bhcq/7nCXU3LWxtlSg2MxqiU=;
        fh=rQbaoEYPkqdAMyBM0UeeQLDPAcXASVYYMJ1ochlyvfU=;
        b=cOXXaarEfap2D4l12BT4qys/v0B2c5tHznqdRimFyQfC3wwRc8LQZ6HACMLk+zZI5k
         lfeBvMMYO2EyB/V8rVdqsbntJ6RORqWF67nXcsYz07tLVX4w3Y9UZTY8izHgrvTq/0EY
         v/hPX+90MqfNw1WKLA3JWOGWkp7UyH3xY6vvPxTNHkKUF9s9g8THEvxR1wI/fjmQmN3T
         7akzxCi8xd7Y07iL2APJq5YHWA5UUY6cAQxzrjt/xVbemdgZ/eK8Q86462JybVBaseV7
         EC6ZrsIq7eEfpIQQR0zx0G42GSnkSSjeGUzgjX1VN8RyIa17KtaWXzMswuGWYTtbziND
         YcaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792409738; x=1793014538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=koS0XoT+3CWL8eMG9x4Bhcq/7nCXU3LWxtlSg2MxqiU=;
        b=bjnXzv+TBUQuypXXr0s8Nh4syaUK6AQxcOxTbgcpzk7eY4BtTmAcds4PU7QzhjgPqT
         Oq5R+pnwdzNJZVd7xKhnflqX0RQkJXppWnZtyvfxYY91IEz3iYhH9BM8/Dxn+RhKEJnT
         E1f4AO4RVLsdQJotpERt8Md6niem22wiuEtBwnmVmvRFMmkDtTzELzSjB4TjOJ4KMeB+
         88yViLIXuTh+6wvB+ba97qNcppNg8zaojFswZ2cXu+gSZdpXBDYe51JjzdzOrQgSfpkQ
         gTt6mrC23J5SYBP8QEol9BHPA6JBaQWK4fxODLsfR5b8r6omutWNtP6Vdq+tPLWCZ3RC
         7Hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409738; x=1793014538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=koS0XoT+3CWL8eMG9x4Bhcq/7nCXU3LWxtlSg2MxqiU=;
        b=USADS66BLBVs1N8BxEDu4mJ83/X7+BXfpR/4zMHjPzAHGWk5C7CrhoJt20hPLnPMp4
         t8dlycsGUnwPrHgTGWsfKraV8+ZOfmbuSrleNSM0htuZvX0g7RjWF6WK/VKcnBViHhrK
         zI3cJIKMWB/6Pm/d1up0MEl+DkMaWwnpngRntfSs79diUuVbZhnRNKWj1ZhznD0gwYWX
         rdpj/w4uXKb1YIDfDe2we7TwCev1dkVTq6NeRlBSwH1ItaCBIbzQJmNteiz22BjhzPmk
         qetKmaAcaFje8xhcwwdBwYKnls3IyC79KO+8Lh3xEWx/O4X5ThLiwg/Vj54UluETf/ur
         UiYw==
X-Forwarded-Encrypted: i=1; AKwUvByp4YchHS3ELZK492h6zmNc4TWQdCSari+vhO8cvJOjVmyIw5yKIMYFvZFbkif2CXQChqnE3XYW4zB0Hoccw1E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlshF16lAWfibNrd/olaqWxkw5jmbiwFGhCX9RJmyHM2AonMnb
	o2mKEU89eXgbFev3Fy6ssOJ8zIZ6QzuN2LFbSS33LD4vpQFrLqgxCcvlzVEk7GI+osZD9/BpFAO
	xAsmCn7ahsHL9buYS9VhacnEFNn1k+FU=
X-Gm-Gg: AYBFou0lLLx2GtwPJNDGSCiuT43eYMf4GmCBSCV0OFn/NlhQ/CvnJCe3bIeUIWaYS8r
	KqvNAavWji3S/7Y/C+5K8lEBbdFVpxyU34tPRzy3HoBiLQAKG+zvSIUHiWWz02wW1I4AvMwj0o/
	YZTXg+ewj7LI0J4X4aR1cBLaeoahJ5IwmQh9i8K5bsvUouEExbhqBNQGYbwoJS6dTnCRgF0Hb9k
	QEWJqsxsz6IOhekBZj3fmYNPHGPkRQdNbroIElIH8pl7WjHvcTloWHg/dWP33NvyfF2LKMG1gPB
	nK7He3hLl3BHqLorXmDMSSEIf+hd3wBqlphSinF+lKY88Nz406JYcl5TRIpTQY1LSvnnq4WHrmY
	mzgYTWL2GIIk=
X-Received: by 2002:a05:6512:10c9:b0:5b8:f3b2:429b with SMTP id
 2adb3069b0e04-5be50a96f8amr2627956e87.52.1792409738088; Mon, 19 Oct 2026
 04:35:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012011707.3378-4-sigefriedhyy@gmail.com> <179185709988.434549.15422498299449004512@kernel.org>
 <CA+7S2v+LHUWXQMD-cYPEzT5-f3Qhw_vz+LEssQH_A_oqDKtnnA@mail.gmail.com> <8dcd9564-e9a3-4b00-93b8-3cb023d68047@redhat.com>
In-Reply-To: <8dcd9564-e9a3-4b00-93b8-3cb023d68047@redhat.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Mon, 19 Oct 2026 20:35:27 +0900
X-Gm-Features: AclHuK9hdAIJx_qrpjOoKdOt12iq2yhV7pVdW2_mKKi8adHB_hqpyRSgWNesDcc
Message-ID: <CA+7S2v+rWYvz9xKPEeM6=3HPz3o7TbX2uRfRKk95f9Y60HnEiA@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 8:19=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> I agree this is not a blocker, but I think it would be nice if you could
> follow-up on this one.
>
> The solution proposed by the LLM LGTM.
>
> Same here.
>
> Also, still speaking of possible follow-up,  I think it would be nice if
> you could change the addr list lifecycle to RCU (no idea of how much
> complex would be that).
>

Thanks for the review. Since we're already at v12 I'd rather not respin
just for these, but I agree both are worth fixing, so I'll handle them as
follow ups.

The first one is a simple fix, so if v13 ends up being needed
for other reasons I'll fold it in there, otherwise I'll send it as a
separate patch.

The RCU conversion needs more thought and will probably
cause quite a bit of churn, so I'll try it if there's a v13, and if it
gets too messy. I'll post it separately later.

Thanks,
Yuyang
