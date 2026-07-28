Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EF03B47F3
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 06:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785219265; cv=pass; b=kiy2nuOrdia5bYl518DeTXtUhYXIN07RHYev8VUe2yE5SnplUHNnbb/HMgMI9ZfGpyKcrKfrXZGvIuWyC0jlHOU1X5Ji9R/RQg/akViS5z1Rbo4TQRR+NXy24aiEcc+D12w/unJmV/E6ZdOvjjfvyRcXOEEa48mrLKbGQ44WR3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785219265; c=relaxed/simple;
	bh=T9emucQeZo8TGHwKdlSTbVZSHcqzzCT/Oq7w5042AWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TDsciEHCUM4quz20TawsNLINmpqGxxN4OUQiDR0SD1SfMwDxf/wUWZAne1ITf1/vZeNuTgBGA84pv9jMrow/1YVZToZF0DQZcs+Zy/hXUL65T44csxrO8oaeqRiAmQCEDrx+Es1q++CSlAXWkemXjD1WkWIJAcZGrPDe1RTjwr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=HhxwjmrI; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="HhxwjmrI"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e08baf860so3651211a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 23:14:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785219263; cv=none;
        d=google.com; s=arc-20260327;
        b=niol3A+Jnl5AxVTDS0TKkEAY1JZHSLGyDQFbvmg9FXZ6dvDc1aOHjurKTAgpUp0LB0
         zyIppPTiKgRwUIyVCRuddPYYxsK5zO+8VVgBhQaamsJ7rgOKWldElAfeaeAixWu+Ve3C
         j5Fi646y+EPV4nAse5bJwxMDFiXVWmwIYnQDkEWIsqNpE4VZ8MxK10vAwLZDsD1BX714
         5lLmZUp8RVPcoRQGajMxb2FEiY3bvagkJGLgg2/CUS7BxEPF4gSxWos4eJ186qacf8yQ
         jXs4W/IorkyTCXzPTx/3ABRM9RjitpysX5Rm4K7B8XfSsAvQdBMp2j852Q9kUt1P5IcM
         P36w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T9emucQeZo8TGHwKdlSTbVZSHcqzzCT/Oq7w5042AWE=;
        fh=pVDC3loRU9cFA6IXQ2zoMd7lJ9HZDe5MHbV72KKaYFw=;
        b=li0OSaNNeWiTdNAuhblGmqn6fTTJAc27swrVNCz8kLUhIvjoLIjW1Y2e/he05CqehB
         Cl3Fq/xKz8ooyYb0up4xZWTVjM8DsFaZkWHpyRABCgczCYQl4k+Oi/op6ENBLvUDsFXq
         MehisNXpTO7aGkX8OAcYqhcF9r9PwtEXyDdu/4GUftwGGeZjqVxDlUPcodIXVYHC9mQh
         5YwD0k2E5eRr8w+Duxh4MDUUfjfJiVhJYixSWdqb8evN6028yi8tBp0UgmyZaOFE6qqO
         scZNblwLtHzlqy7GbWsk2EwjK1krAsZepgGF3VFNG+jB2xRZj5GKAnItihpF3m+Ui+uw
         iumQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785219263; x=1785824063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T9emucQeZo8TGHwKdlSTbVZSHcqzzCT/Oq7w5042AWE=;
        b=HhxwjmrIUxQXqeHtqeI9D2lpSxRSiAFBetSb/p5XZp+rzxVd9rOx9bBUz6CCRgcYoC
         ybEpO1WvNFfTBzlDrOe6cWF3XGLB2+sLLTz6aOxwwzjEDBECotDHj7O42VCVEXLKkOzy
         hGvof5C0kKi+fNNilKoOJwAjWg9yBQ3pkaS7CuMfuRhkukW3XFp1MlBED1v5XjvyVSzx
         yGCs1xrVBrcVn6fq6eHYltzb8AfHmKOZFYOu+Ad/Pb6gismZYx8v6MfaZkIwp6OklIAA
         icR6BWDtUOkeemM6GPCUTo0UFCBlB7P/QMF+ZfcrlpWQfPISgXwE21FUiicIY4KTcmvl
         2tyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785219263; x=1785824063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9emucQeZo8TGHwKdlSTbVZSHcqzzCT/Oq7w5042AWE=;
        b=Gf5LeLm0teM54l/YaJkJHwXV3tiUjsHnrkHbDxM8NlJoAdM2OplPy62Psftxp3QpC4
         gmGZj9I8zEfa/TkKsGPQk67bfTNZWv6svonOH4RTFqHUhqmTSfI4QYJHB3TwKADQHAJ8
         aCXG1S3Qd4TVAiYcj7AqjmUC37ZD3tjQx45sTw/8gX51t/R4KonvwlLHgHdVywk5B3vG
         q2NVZQaZIpq0YGZhVzlMjjUJhgWALe2EMrl4Ln4kh3xShXqIkI8tET6Ba7GzePgJx8rz
         GufRclCfgvSbZvhKuCwFVx1Zqi/xkPyzXa5gjOS0abOpk6OmUGncD4ixbetSkVR1lS6j
         E89w==
X-Forwarded-Encrypted: i=1; AHgh+Rr4nXxAVKdpTKp3Q2Vlo1IKOdi+Pg4093B+u3SC3IF24ldr1mLU4iS+j1wltK2fN05XWwFN7eZphH2+yWv8npI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrn3JtxvohUSDXa/ecZX5HCi92ait3p5YyoNgBOeJlZL8+FhKG
	YDnBHitpmSATSrNiVFeDGMTpcV08EaY4ZD65v5j1sKhF9NjhiNWMN6bwVi8PN1HKU2+G6OG2Sub
	c8TIDG/dqT/No53FoFoDph4O5Ln1ksqZx2Dp2VW9o39Z79BXgeb8CtFvYrg==
X-Gm-Gg: AR+sD11x4bEfqSw1qQryWYHJuxMe07Z7wPJXc8C73uvE/6kr1CyVt1Kd6JP1vomXpnD
	L2aq/9uYlgDcTGXlQxoMuk/1pCGLDvpWXZlKOTjn09BaOUQrkg7u++Z8SVHHuM4WS5+6EMCqV+c
	3tOv+MCX+1Ib41eu9dG1eobeWmsBhWwvG4MJ3YbpViOw3v7PYiFqIGZApREPsgFZ+JsGOzuW1W5
	fvGTwoBcZxy77nVf+PESGZhiycXdiEXDpgWj7mHj593xQvyTDLclWDmbQqUJi1wvOOrQcKnA2+s
	yoDmGKKXW7BOeqgZWvzxGCngC1hLGTE=
X-Received: by 2002:a17:90a:e7ce:b0:381:cef1:11b0 with SMTP id
 98e67ed59e1d1-38f6a54400bmr1094669a91.33.1785219263585; Mon, 27 Jul 2026
 23:14:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-4-ammarfaizi2@openresty.com> <8bdacaf3-7f93-4095-8875-4c13a273fe3d@t-8ch.de>
 <6a5f7481-124f-48ad-ab44-577b12d33592@openresty.com> <4e22086c-8a60-4965-8d78-a946dc54eaa3@openresty.com>
 <625278ef-06fc-466f-8b69-9a37d5097b18@t-8ch.de>
In-Reply-To: <625278ef-06fc-466f-8b69-9a37d5097b18@t-8ch.de>
From: Ammar Faizi <ammarfaizi2@openresty.com>
Date: Tue, 28 Jul 2026 13:14:11 +0700
X-Gm-Features: AUfX_myLYoIJCIgc0mPggQI10oPJrc_4hFq4UqwvYtZQeCyZIllsnLCigd4kxHw
Message-ID: <CA+KFgX7vVA8sUBz_ngVCnA_DW11eC4r=EDatKBP0QUQYcC62Bg@mail.gmail.com>
Subject: Re: [PATCH 3/4] selftests/nolibc: add abs() range test
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Willy Tarreau <w@1wt.eu>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>, LLVM Mailing List <llvm@lists.linux.dev>, 
	Yichun Zhang <yichun@openresty.com>, 
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 11:13=E2=80=AFPM Thomas Wei=C3=9Fschuh wrote:
> Do we need to hide the variables for a regular libc?
> If not, we can have a dummy definition of _NOLIBC_OPTIMIZER_HIDE_VAR().

I think not; I'll go with a dummy definition of _NOLIBC_OPTIMIZER_HIDE_VAR(=
).

--=20
Ammar Faizi
