Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA443DB31E
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 11:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785153461; cv=pass; b=iIFwYH2Kv4SAot0Faz2wMXXGpnIV5LhsdNt4GnUI1SBJnJDJOsx8cS7XfPm8eGplnlYM5tQIm5TI9C3E7aXUXkuLIix0/lwi5vX5Ub8O2d4i5djyQ5ni6s115eGzrJXHf6sO5AnvLJjGFHnVdeOPuQso8XnZqVn9zx7Ikis69U8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785153461; c=relaxed/simple;
	bh=2k5B3idJmT6bC8h+ilrKx0XVLWjKGNXuCUQ2oqNbk3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S881Q98/JmrfvMUiPOuSXWM6EaBfxbZpxgPk+cmdsRlkc8peMpXlI42M1bNha+3TWqeHbnI9J1EllpGq0asues7BUPzq8oFv/kausW8XLZME0Na+aTTLAPctUbs98Mjt/i+N6a1dCmatem8JqQQMry4RtOgaMNZDxzjLTC8py6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZtIpfPX; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZtIpfPX"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15dd4b9132so385296266b.1
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 04:57:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785153458; cv=none;
        d=google.com; s=arc-20260327;
        b=otYdVSOlD8db8Z/vb0fBXN2yNwmAv5ANDo4OJ4/QELqc/TBYhuZZp3jFAITrRetv+7
         c9uVODGOou33pI0pkOAKVCj1gU8emb67WLk3VWGvRsYPWmxsaKPSfEiDnoGAPtGOyJGX
         FfQ1mG3CE8AE/uv/Z+xDDuUlBK5L1fmsbKENKoHgcIDuJeYU0ZmJpI91v225ngrVkze0
         wo5tw1OvD0H4rJUV6uIBVOayHpnHhkPnujO6loWZwLwxv9O1EOYiLJG9co6M+KXj8Udy
         f7yhnHA7pp5BmJpJ1D1JBi43Ssg5hb3LukMR+UxJtZu1t0fRzDaZ2ZUSNL2v1ouMshS/
         gJOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2k5B3idJmT6bC8h+ilrKx0XVLWjKGNXuCUQ2oqNbk3I=;
        fh=vKC8XWEqu0l4ideou/rmA4X+ULiA9k9m+Vz8xYEreYU=;
        b=jE6gIhjt5/U/tuh9MXdeefUVV6Jf7d660KoqeRMsmbPwK00Uki3IuYu1BeTnLMvRSi
         ImIR+ir1qXLZzmsQNgQMLpj92S0nGXP7bygyxnJsXYboyzbWrj2EgCtdjQx9Syl06UVe
         xTOmzLjt2A0nQfJTIXbjVDVNXwbnTTfjf8oWDsiGWC+kwGZNCxoWAoC5vFTmikfwDHrR
         X7ypEm2NJHPGZU/mMPpGqcBPBicJcJZY3lsNyZQRismsqBsZDlY3GTGdT95aQBUp6MpR
         pFHFCxx4VAhQhgPm+Ruc0xZew9xR5NTyHIUZaKzL8Wh88fjgXI9CYXKJ5pD352CIoz4n
         dHKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785153458; x=1785758258; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2k5B3idJmT6bC8h+ilrKx0XVLWjKGNXuCUQ2oqNbk3I=;
        b=OZtIpfPXTTcaHnGhkDxSZFynofniA5nD8GoqxxI9N6LieHRLhnYkhl1h+62wg1zYXO
         1CNEhOdxBBsIpFaGd+cQxgm+7attBl0knRJ0a6IoNWcmP9tpy7Lh5UWy8i8CVT4iqhoJ
         2VadF7Ww1aMJK0JPQ0dUuRkru5DGuldDq4VwDsgOKMtgQ+HqHw/8lIRevyi5w4nZKa58
         a+CPrKZujkAykRFbCyYjM/N17g8Tzqu1UzMQNqmCqMP2zgncjLH32tidtuP7hMYJxTNk
         goeswJLhtRWJC2rVTcSEVT2RfRhjSG5BMcUz2s8g1Vh32q4Ki62TdriB3gdm7bpu3Gjt
         zOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785153458; x=1785758258;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2k5B3idJmT6bC8h+ilrKx0XVLWjKGNXuCUQ2oqNbk3I=;
        b=bZXu348BqUVqKhCtMyQQiF/YLV92dhwcSndeTTUIQnfxr16ivqYbU2BHw2Brb0cm/7
         DgQInCFBeKE4KKtWeBPEUziRH9mvFEfx3Y3o7gzlh6Uk0vEZdF7e7dJjUxBvhf+GmuYL
         3O7S+GSZeaGOBVJCqHAk9wODfAxtg73LOYRuhe1ZGlIYqI8vAasxmHWolPIubwm1pwdM
         Jc8KLFSpukoAgBYgDdv5aI06pX4gPH763q3i4o7wgc5olp4hRdIiQyLMnpClLYFAphGk
         wOVFYK763v6FRi4fEY4ILTX9IOkyaznjIVBmEQNsyEdT9t/+gllc2qOi0fLw2nei0ROU
         901w==
X-Forwarded-Encrypted: i=1; AHgh+RrPu2vqgqPYJws/p1VWopPPV/1SaXPKadHnKlYhXB2KK4I/Dz/ikUpOZx1n6Vibopern9uijtIwVWf0cXlvwEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRppbegew1fBnSjGJB92keU6QUrPAp2hwG1WUFDLBdfMuO8fYy
	EtUOEO/Iad/oRrq6jLKHUvVT6RTBPg+ZUf17Ub59a/85SxIRG2OihAlH7i2ToOP0XIhkKA5MTv7
	pyINjdv334tkzx6+roqDPzAYTK+03XkY=
X-Gm-Gg: AR+sD13JdbxicESRFAkNUo3xkCEcRKogEJNLvcvtrt/IusgdWoHnadBQQBBckLT60EM
	FHYJOcywzQpTrg5JLiPyEXib1vSs/Xy/pKXadRHn1gQvElgmyu/YbFIpiLqfXQ1enbBR2ZhZUFp
	5arrqrfvlGcgHlck50am55VMfQgm5UZeeAX6cn5nKi9wfa36qeB1dZlaWbrTquHiPD0q+FcBLVt
	9spnTqzFp/16PZ4HRjO8FlXHv4rIw2FnO7k44hRk3GQ9WmwkVSRWIBdmKUP
X-Received: by 2002:a17:907:d641:b0:c15:ca27:5818 with SMTP id
 a640c23a62f3a-c1f1eeaa320mr395955766b.28.1785153458189; Mon, 27 Jul 2026
 04:57:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2026070925-delay-gauntlet-bc7c@gregkh> <CAE2MWk=mm8_bkd54Gv1mdox6rfvx85Dd3AjOCxPz0fPAfyuWYA@mail.gmail.com>
 <2026070954-activist-left-8303@gregkh> <CAE2MWkmcQdhGp3LTMtpgAse3AFcfKcAcpQe89+iijfP5e0w_QQ@mail.gmail.com>
 <2026070948-lively-exchange-a458@gregkh> <CAE2MWkn3L7V3x8i0F-soGLxsBBo_Umgs1pJ3FwCw1OW7=U55zg@mail.gmail.com>
 <14350a31-ffc7-41fd-84d3-6cfb2cb96841@lunn.ch> <CAE2MWknt86W6yCtuS_RupiuwiDqXT8wZqENM2DjiW1R=eY8qdg@mail.gmail.com>
 <797773e2-b155-451b-ae97-e8a005fd2d86@lunn.ch> <CAE2MWkmbdDrCw1HUKm17QG7dyihuxg_1VGTUNeBq9v8NVwJV3Q@mail.gmail.com>
 <20260719082223.GA1899043@shredder>
In-Reply-To: <20260719082223.GA1899043@shredder>
From: Ujjal Roy <royujjal@gmail.com>
Date: Mon, 27 Jul 2026 17:27:22 +0530
X-Gm-Features: AUfX_myN8vMPcj0vJcxFKIYLNoX74G7CTQydU2TzsiEAmJ7bTFLP5Hg7T5Y7VYE
Message-ID: <CAE2MWkmE3N6q=_bOv7AaMFS15+SizkzVQV-SCMumc-D1rWcv3A@mail.gmail.com>
Subject: Re: Please backport bridge multicast exponential field encoding fix
 series to 6.1.y/6.6.y/6.12.y/6.18.y/7.0.y
To: Ido Schimmel <idosch@nvidia.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg KH <gregkh@linuxfoundation.org>, 
	Linux Stable <stable@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Nikolay Aleksandrov <razor@blackwall.org>, David Ahern <dsahern@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Andy Roulin <aroulin@nvidia.com>, Yong Wang <yongwang@nvidia.com>, 
	Petr Machata <petrm@nvidia.com>, Ujjal Roy <ujjal@alumnux.com>, bridge@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> We asked to target these patches at net-next because they don't fix a
> regression (the encoding never worked correctly), so they are not
> relevant for stable. Users that require this functionality should
> upgrade to a new kernel that contains the patches.
>
Hmm, understood!

> Regarding the stable-specific patch, in my experience, stable
> maintainers don't accept such patches and prefer to backport patches
> from upstream, even if it results in more changes.

Then I feel we can skip the changes for stable now. Hi Greg, skip this
thread and the changes from it. Will be in touch!
