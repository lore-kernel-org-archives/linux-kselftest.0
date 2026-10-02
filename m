Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C45248F64
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 00:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790900362; cv=none; b=Ye/+8yC6PZjYG4i86UkXRBu5gpRb40J3vU9hmJPDy7hTDGWgXVwGglXqijfJZcdJEAbNhSVMbmhYG7seVn1MPPIbm1g4MI6ZvGDl2jxEo3a9vGS1u3i7iEX/3zoqO1cKe7rZ3P61DVYWaFlK3qXHZLnE1GMj0/Jerk+fxqEKmm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790900362; c=relaxed/simple;
	bh=DD+PbZOcOM6sepZnP/mE8B57grk05o5jXUbfsi0gFZ0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Cqj4MWlGIuc+EC7DmaeEogwzmxJOM/o5Dl3y56sBLfsllnlhCviaibxxUGMwz2F65MSZdFII4xbvAuc1uQG661D080kuaDXjL4N+3URf+2hLTL2xXmjod40q0pg1t7wOlO76sC2ZkVFCXjBrWSnpY1HRnZiOm6oOfnVkJktQ1rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cri0sqUK; arc=none smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cri0sqUK"
Received: by mail-yx2-f39.google.com with SMTP id 00721157ae682-8ab3694b2acso46652827b3.1
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 17:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790900359; x=1791505159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nF/bpEyAJLHrYgSp1W7lB/si839SdmIfrx3CzMfz4dQ=;
        b=Cri0sqUK8TK+nyisKYS9TvQs7p8C4Bs98ld7gLSTuVj2jstnv/GYq8sPqw8fPIcr3t
         CauV1mjTMH98SBj/NSRQAz3RUIOd5/kAYm/Rp7Gu3rQ34NEeSkDFTKj0frX4iKoT/lu9
         dRV/Z/KrNN8vcKIa85R21duRxSuDMKqGmk2ISaXVv/PBGKYFuoyrRqPANaYFaQ52ruto
         rzXecq2HEAvXVFglbTUyBLrbh32utxXD3fnFdbKloKjUrTFEKFFBaehJDuEg8sA53y/l
         JzzRlFuHOf9OWSI5U457EbV+wct7AYN9oYVya/HqFtos/iLpahoxf5SL+vjAIQnXYsXy
         OPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790900359; x=1791505159;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nF/bpEyAJLHrYgSp1W7lB/si839SdmIfrx3CzMfz4dQ=;
        b=rvTNXpgGGqujvlO/sgE6ZJwH/EIzfx+YKW+nHhnkeXgKC2PrecIDhRMiKs7lvTQcLX
         y4Le+wz/tQ87YsMDH6GIQU5unpcrmWA8yJADBWZvxz72Up5nZ/teBqJ+HbGkOi2jVGES
         qhhcXpXnJeAAprDujbi+Stg89EhN4CqQppfQff9xOVscvBre3ltf2ayusp3RBqbmcc/R
         UEhpPA50Uu+4/kAtjky8a/r3RBu52SinGaUtcT7BrAamCzuGZwuRI3RTXEsZW+FnYEdX
         QdymClS9fyMa4pjSspIJpYzH4GrjB1Fhy5zORXtKm1/8GcdgMxtmdFH9Rf5vURS4xwxp
         NrPQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/xWo/4BcZyf30ccOyE6zeBgCX5sJZC09IKq6s58dsVleG1GE1Bkbtt7+Xlcq8UaKrlAqHpJkLyr99piFObaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKbqxyQ5/Xx7J8UgY6/laE9NgcKHWZgkbtKHlIod8tNrNyMxC/
	uYdrDsqWPsgYoJAaRhQQYDvBn760L/lhANruU0DRNg+KpOuvP5lY1I8p
X-Gm-Gg: AYBFou0uM+73WxI6bW4tcVT38GHSfm4Nw+AOsvOZNR/GyJZbCQP2CDpw59njZNMNXGj
	2jLKdE6VjZIDUVdwk72Z8BDWtsLtRk+byONHsT5afYyShM1vu/KX9G3mh8Ns15rcP4xv++Av/A4
	h8YCTD8BaVPSjgUpP6pZTLnq5PLJglTU+G06ihxR6h/1Ue7Kcue/vEy938Z6c/ruqcce0V825np
	J6jRPh6eM1jGc/N8wUCdnnhmtsuEzr3Ko1Bdb2h12L7nPEy+bSYaJFVPM1mcl6n4SoNhlIrqHRc
	PUjnuZJBpwqWz5GAtlwTUsqGtgMhmxSLIICywFiSgbv0sYRgStZom672ZX+33WM28Ed1L3y/0O/
	qiyRMsjqtPNqlut+chuyYGbti0bZ11gxx8/vRrfTaw158914QY9bw75tcTJ58KecJDMZoo0nbf5
	alUo1AI2RB0XKBiLC120U3szlhuqE3OSevVFzYIoGQKRt4hESUwLDAMrclWql55lxmiOcC8RAm5
	vcUe8pzNqTQ/Tcrjzmffdtb9F/ZqJ2OmSTxsOAff4nM5lZ+u6bk
X-Received: by 2002:a05:690c:f08:b0:865:b26a:8e30 with SMTP id 00721157ae682-8ae39be12c2mr4052777b3.34.1790900359541;
        Thu, 01 Oct 2026 17:19:19 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae32ef445fsm3311477b3.28.2026.10.01.17.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 17:19:18 -0700 (PDT)
Date: Thu, 01 Oct 2026 20:19:18 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org
Message-ID: <willemdebruijn.kernel.149ec551960a3@gmail.com>
In-Reply-To: <20260930-psp-defeat-v2-3-f266e7447129@gmail.com>
References: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
 <20260930-psp-defeat-v2-3-f266e7447129@gmail.com>
Subject: Re: [PATCH net-next v2 3/4] net: psp: drop psp assoc clear in
 sk_clone()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Daniel Zahka wrote:
> Unwind the change from commit 1d2929d0850f ("net: psp: do not inherit
> the Rx association on clone"), now that assoc state cannot exist on
> listen sockets.
> 
> With commit 8cc3aef0cb19 ("tcp: Do not allow buggy transitions between
> ehash and lhash2."), and the change in this series restricting PSP assoc
> operations to established sockets, this state should be unreachable.
> 
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
