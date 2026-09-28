Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF031434E35
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594121; cv=pass; b=OYZbYRtls+R9eGKfhDIdKiOM1Qh16430fKZfVRPQePSD4nuKwemmuo8gv96jTpC45eDIGr2sWh+QQGrxcqk1FwkdpreyeLSThYR6iPvWCBRCsUTlQh3UwWqTel1clRFrwwuHryffEVdMT8GWGuoB5doBbk1pxY8PYyIF3/eMcYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594121; c=relaxed/simple;
	bh=996CJFGuNyyYmh+etTTKX/Yy7liiXJyv4mmrH7M/AkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRiE6BV0cMJ+xSL8Akjjvwcgr2zV5Dee6XIWx0AC/5KOMMWCm2y8n4JlpdV+etQxS3YITYPF/8R36zRBXfx/Xt7vdg9MblHpd15fEqblxLMU8VFUsMnPHWXYUbP6ptE1Bf3bDOArSqKE49ZzPY23jU5VwAu66IFf3BkcLBWY4lI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsr3Y6Rh; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsr3Y6Rh"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a49bc59559so21620931fa.2
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 04:15:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790594117; cv=none;
        d=google.com; s=arc-20260327;
        b=bnKiwaA4c6NKkkwm/0ilkhpH7bhJjlNpQanZFLcOAgAajV2YHq1duidB43l8+mgiD2
         0qii6J7RTFI0UWJ/uW02n2f7E+ZOnGa/HjjyG8nGoMr++VyfD+PB9AnL2OA0ANsY/mVn
         ZYpxcUI/l1K1O8R5wm4eeme2xqzRgRxtRXhqTd641XaEAmPBFh9wzy+VPxGihTtzOEIK
         +ORDoaJPwIoZ+IE0VKlIEYSVuYPKfZT04rOFtpzXJ6ALTYGc9EF4Vxa92YHXFQN+GOKh
         F9e5Q8Qs8HGHUfkz39cZ+bEYXDdTmF8URpljSokGNOpCD+2osu3IXfA6jbclxlF1xShT
         Xj2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f5LqEIqTiSCGzIitZ1w2oEpzfNZEyI+MHlv8nCt0Pvc=;
        fh=RFXcJ5gAkmCiYJCBvYkQJWceA49Qwy83dIkt1N18QPM=;
        b=PSugs1MSYi4+yFtHWDjfKnMbhzFCQwRkxB4pti6EU+kSTOFGSrEN9LkE1kY84GB5BX
         lZhBA1cNBitR5pnomlfu6qH5Bnd1mmKdHTTceEiKju8L1+skMXWs5cLbIO9SPw978Dko
         g6fVfzeMhLV0fWI1div0SIovSy8dcYwNbu5MM+A3Svyy6JKUO3pM9Rv+pzY8FkaK9HBw
         gRgj22uZWquh+5sZ2Od7KUIPdA2bBmViUvyGZc550W8uKsQ1Z+UvBZzw1qar0wguZZ+9
         lwalGr1SU9tE4lFsqgmaoIdz+SGvNqL4qbGw6wwoUzJzPwxkwpFy/Rajb6w6AVEwvsH9
         zVAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790594117; x=1791198917; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5LqEIqTiSCGzIitZ1w2oEpzfNZEyI+MHlv8nCt0Pvc=;
        b=dsr3Y6RhGt5ckmJWs18u/WIlDPBUOG+qdLYQlzy/Tuxl5qPDtGrxaFVPme/xMH1Sz3
         /QJgssQakPA+CwyHRgfG+koUgrgGZ30gkzYKnGGSx5FCu30vd4+gsiPZrKCenSEwpht4
         CdBXU9uMXMe5vS4So656J1/Ej5VS1pg+TBujLVgQqcWhjtvKAzKLtgXVblofHzNdO38x
         tOTcNn+9AYCB4KiHUaayJVqNWX5mNK9tKgqzqYbf13wTQjogkaoCRJlppidUHSNge2ub
         w5ybfg7jng3cq3AOhQmeCRvrhy6nDYwlFHadSf1ldsL/uUKU+jPzfWtR39nOH4r8jH5n
         7fig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790594117; x=1791198917;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f5LqEIqTiSCGzIitZ1w2oEpzfNZEyI+MHlv8nCt0Pvc=;
        b=XsCwxgIoFOLj9kJ0dhVwqowsGH3kSopq/FebCzfGN1pTuqTpiVkwLCbr5+IMJJYHU1
         y79P2AjWpP3LdbB9XtWilAGDMyO9IX+JoSSIgpK6JB0sE9Cyzgwq9HnvEW8oRalvWYmN
         yHlfDeN8mNlw9etjb78crZEuykToYqGuRtg9+xWbuLTSB1Xl4pUQgBrjBZFge48+7wmD
         5uQ1o617RypFQYNYe1D5o/KwjN66/Qs0oemXi7W01UQg2ZL1mXhziT/roifKJNJ/YnI+
         VgeZl2vLbDUIAGDnV+CZxLDX86ncxwUXkhHRlgXAuRWcID4xPiY6VYJg3YO4TedlelQ2
         YnRw==
X-Forwarded-Encrypted: i=1; AKwUvBxjanBYnJSQdQ7h6hxt3qIxsxZH5ZSqmj/Vl2dps5CIRm16ebfqFNIP/WPxHME2JmBcMCSTPf7i6d5r5bqRgJQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKsHzSu4yvCbMxUwtXcIPmm1pW3AzchqLPqH9o/ZF9+OWGXgwZ
	vevPXGXpORLNwjWzB4Gh7nuA2oMQ0TUGXVziVB0HtPI/nK7fcKTfX2nWmKx1nuVo0ovBmdoyEks
	UVJQmnLH5V9ya39H92lMh4bcx2Pj9pAI=
X-Gm-Gg: AYBFou17rRl3o05sPodP3iTVoojRyqr2gYsPpPqvG/TGXEezQ4af77ionMpyV6gVOyp
	g3jfMAvgzlrXyzQBh+ymhBwrbdGiYX+JvdFo+ec/WpCXdBXRDyeE9o3ynCkXOSZHvlvtHiyATvQ
	35Es2/VJjOFXVVbs0CbFiGsH8fUWmp/Zt6yyylrpE8NqfzamC2olGHr/BNN2D0gLJvHfojNMRuu
	/kAE3e5GGd5Qs5JGfNbZkuaWbWXpKX9ENswb76WPFbYIYB00muUdF+XJsWshjt1NpZCASuz2jhw
	YNQUrOk8IXtphSw1lG6m8fc0ELZjheajDoCOg4YqzlZx1orZCnuUa+zCAO7Ls9wgIKr9B4GM2Gt
	vlFMCcLeIO4qhkb49IW55ZwI0l5baV7iSGb3+jm6LAQ==
X-Received: by 2002:a05:6512:acb:b0:5b8:f0c6:1fc9 with SMTP id
 2adb3069b0e04-5b8f0c61fd6mr2364641e87.31.1790594116310; Mon, 28 Sep 2026
 04:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927002427.4519-1-sigefriedhyy@gmail.com> <20260927002427.4519-3-sigefriedhyy@gmail.com>
 <cd00e6e7-aa2d-4f98-8a79-083b64b3376a@6wind.com>
In-Reply-To: <cd00e6e7-aa2d-4f98-8a79-083b64b3376a@6wind.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Mon, 28 Sep 2026 20:15:07 +0900
X-Gm-Features: AclHuK9zsH1UrBsZg6xhnYP09aN47Nn_F68KRxkDz53E_55Atdfu33i4Naok4Ag
Message-ID: <CA+7S2v+kVVANjV4y5+YUBiRPcOfqhTXDxd8czaOY_cYYJYzfAQ@mail.gmail.com>
Subject: Re: [PATCH net-next v8 2/5] net: add a generation counter for dev->mc changes
To: nicolas.dichtel@6wind.com
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>, 
	Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> If another version is needed, you can rename counter to _counter to highlight
> that the helpers should be used.
> static void __hw_addr_count_add(struct netdev_hw_addr_list *list, int value)
> Renaming  struct netdev_hw_addr_list->count to _count would help to check all
> users and highlight that modifying _count should be done with helpers.

Thanks, those suggestions make sense. I will adjust these in v9 if
another version is needed.
