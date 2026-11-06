Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.203
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793926981;
	b=V+u60luH5T+/v6JFlodE3aOT9+9UzbIQLERDSFT8kTh3bURYOzyyXc3+rNvbIk8d3mad
	 GmvNm7X4L1GABDty+TPplTZ7dmoXfIASAA+VOc+N5vUugsew3BhBmWRompn5YHKS+vQez
	 kbyRPyY3Inev0TnpYmaWTtxrgRWJXsEcBYOfLDNF/MsL6iLTOkNnAP+kQeVkhD5iAgCzm
	 kb1mkWV6/us+BpcvUS2GQv3iyS7lRJx/t/uaTR5so7UkdBwoyuCAYSY03qv5mgxyzS0WP
	 6mpPTpAr2rP+V+GOuQjX1dd4BE5+BYsXLxo7QbA6lpRLo5iVBTaH187E9O0ErmwFZyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793926981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Y0u4IXihur+VBeVt1te8fOm9nT/EPcQisrR3rXoEPKw=;
	b=Wicw9PZetm2wEIPMMVOyyrsToOZ9N5ENuPccKrlSkp6k2HkDHiWIdIad5gBkjMS3IVEd
	 43Q16mxeReD8HchsLjpQhrqsBk/ex6BHcO0mi3JprPB+RDctnmpJBCEhxaO6UoPRnNif2
	 E/BdYRcXHkOJzoCICkxJFEpMBjWU2WuyicMiLtqvFhcU4vnTltC8m4KbH2hfJo1eDjPEX
	 YTyIksU0YXaJHj2awjmpo+lTNa/9SFbP4YWEI9OB6u1AxxN/DigpVkfJilnyzWJR3CpJp
	 uC1k/bj+SPQGauYt1fw+TetnDmeLyDjj+LUl+SllyVqQT9RxKrTmVWMFo6bcr40X4DQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l1yXf6B+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.203
Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B86606A328
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 01:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6B86606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l1yXf6B+
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-567d0212e7cso31053b6e.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 17:03:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793926980; cv=none;
        d=google.com; s=arc-20260327;
        b=YY81CPeRs65p+W0i1hYu0CPY2+LSkXWuf15awYzhD71dDIJuMoWKJoPYkMfg7WhCc+
         ULzjNTC0D7guqWDP3olmY3LtkUxb12L80qWzzazkWaR3Hz9M+lIRdDkP8uTbzP9xDIPu
         u5HzN2w7WXJNPLwhd2pkiFiCE/C0xr5jQxPkIZ/Bjcz7TszSsqIaukQJ5g8T0Sb7DWQm
         gI34Og3jfP+u8a5o2FZEBS7TLK6jLg8YDyJASInazj32Icbk+r50XAggc8gqkdYR6sX8
         MMggvEsIbclTi5h6o4gyA10owl6wihh88xK3uaM9Yw1YuDmHzUWFU3T63q7oYVMA1EXQ
         Jt7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Y0u4IXihur+VBeVt1te8fOm9nT/EPcQisrR3rXoEPKw=;
        fh=pEHF4ecf4AW9s63uGHplxDCgl9NUzGrEkrxq4PlOmJI=;
        b=ZqxIbbYzPeV8jZjn9I6FBeeNf33v4EmEDQc8bRc8sUbvY7Lqy6TNS8wiX5TEfydRXn
         yrPyj9CN9DKV604LfjmBB+f0yAvrzQO1ECh1Z89eZSyBNgvoRLJh+f2SM9tf4iA+KSHH
         JAsQsmHPsgaKLnDubDakHRQcRNMowkMKPse6Y1uYBG81y1l5RGegfKYja5xwciwAb4wM
         4CIh5GewgKQ0gMKrIohA4go4NIGYmdCxoPGh3DppAp31kkad7j/1nU3Pl0oMlC92jaZc
         kvl9Ne6F42d0RxeTooUzV58eHNvXdhgnZh+WYZoPoqmfX5pdxXGYjf+GmmsP+KxhCU5x
         cjJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793926980; x=1794531780; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0u4IXihur+VBeVt1te8fOm9nT/EPcQisrR3rXoEPKw=;
        b=l1yXf6B+BJVkocvHAW+3ubMtTVR1zzGaHTvpopNwPZSww6m6rQb5ZHR5IzxfQE1vwx
         A4GP1blH726DVC1ucFjS9HpRpluTwCpoIKosHMcQlnPwbVlS0IOUB36q0oDR1xTiIbyV
         conH6bULw93qo+4G2TLuNNiHliTfZBdlvS/0v3An/U1gYnd6ieD4pPFrG9OLqbl01e2i
         h89mmK+AgZqxph2sS4OAJ+/oUj2cb3yerLGNZ9wcWMZgvt5J6nDag6yhfYEe1L+7JIe+
         lI9s800eCgaFRewL69/RYqmF2LlQUhl+K8LsagJ8LLUz1ZWzziMJdGxvD2Dw3Ds/7G83
         h5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793926980; x=1794531780;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y0u4IXihur+VBeVt1te8fOm9nT/EPcQisrR3rXoEPKw=;
        b=EeFEAf1d4yd/bIOcnRjimvwSEEiNz9cPJPEN9lJKjxGiwRVFrlM/GQfwJgLLh89XMP
         QGjhJlWyEyw68l3ujG0XBV2Fft+vwZ7DPwT4I/XLJOo25D+e8HQjozGhsSTZc6iZPgtG
         vOnc9PNyjv5YkWKTK6zvo9pny2/+XAYzoee6bx4HbuOjw14yxfUcbvuw/0y/yEN2MjvB
         JySwtkfQjqWzugQOuhMifcCcJgTPhe1hvgudqmTevUM3r+xBXt4R7zjThMHYbnCBV/8c
         zAjeyfFXWV46l2hQ21nfp4zOpJF+FxbL+xDXvaWU09ESx0nhdqQDEj6AEuJ7uBx7EpiJ
         bqXA==
X-Forwarded-Encrypted: i=1; AKwUvBwVzY8Lua9GNHSY6jtwxwe54waoRBaRQACyBNlDOYQBrFDEGerzuOl3gpVtr130zrMIXt7BjbLYFcgqS2ubRAY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JPc3XJoAUOn08Hg57lpWepbI97L+TemyySvWFlbM1fgw9mGMn
	Uk2LR5Zgp9LjaEegtnzI+dYDBYcSnlHPHpLkWcVyaCpRq3YoA520EHZIPJziJRgdpu0M5haXE4n
	JhefP77/SN3+0xjrmbiRTSyu8XFMQkzw=
X-Gm-Gg: AYBFou3lozkpoYaYIHSckSFJ5IBxy17SVzA3MgwvH+NiTOPmPpPwt38/E0VVJZeQVdA
	HljPJwqS+oE9sP9j9Rb1jpSbxoJ2of9vCQsMkRGFUvBgaYL19mb4RKXFSVNsbZKWyGkHcxFqrW4
	cIlVsfzm/slyebrEsXKLlNX9cDB60dmyyZXnpp0OlpVXH8W2pN3mdFZw8/mNVSeZu4dRygEgSYr
	eRUUXf9kQXasYG870+km0hJK6O3h/0gQvi4eo4vr7yY9NmsU+bRZ/Q0QYHQkjSgS0UXZDl/Qt3E
	PJtVL9fQq5hs18gpoVUtqHDorTg8kiE4pBQtcV5qay5HBnBk+oJTqQ4ikx+BK6tTbRefaR0t8yk
	ENJak6rjOoe4vrjCotJ44VhI0J008G8p+Xuw72F67hFsHaO2zUPCluhBl66Ky3fcvzPml0vlfVO
	Qp7SV0nxDCrnL/GAXIcM2D9McpSEzodk7QtpwwlpOHngIRTFgRoor3T3Tp5Kdy7bseuJrl/a3x9
	w==
X-Received: by 2002:a05:6808:508a:b0:524:867f:641e with SMTP id
 5614622812f47-567e14c90f4mr843803b6e.13.1793926979673; Thu, 05 Nov 2026
 17:02:59 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101103221.51534-1-dennylin0707@gmail.com>
 <20261101103221.51534-3-dennylin0707@gmail.com> <CAEf4BzaES0KDyhHhk7UguLmRKVWxGoiEXhNvp7QHpeJSZSjbYA@mail.gmail.com>
In-Reply-To: <CAEf4BzaES0KDyhHhk7UguLmRKVWxGoiEXhNvp7QHpeJSZSjbYA@mail.gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Thu, 5 Nov 2026 17:02:48 -0800
X-Gm-Features: AclHuK8tdnhaPwz3Y54kZitME7BnT6URzVYL1boyOfhhSrmlCGq8Mz92SAE1VKY
Message-ID: <CAGEkeHf9d6BuQWsaqiresmbPNWAVZRbzZv03kfJisT6SQD8aAg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/3] bpftool: Preserve unsigned enum values in
 data dumps
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: ast@kernel.org, bpf@vger.kernel.org, andrii@kernel.org, qmo@kernel.org, 
	daniel@iogearbox.net, yonghong.song@linux.dev, eddyz87@gmail.com, 
	ihor.solodrai@linux.dev, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> how old by now are those btf produces that do not emit kflag=1 for
> signed enums? should we even care at this point or just assume that
> kflag is set correctly?

LLVM 14 and earlier, and pahole before 1.24, for example. Signed
enum kflag support was added in pahole 1.24 (August 2022) and
LLVM 15 (September 2022), about four years ago.

libbpf still clears enum kflag when loading BTF into kernels without
enum64 support, though. bpftool map dump reads that BTF back from
the kernel, so this also happens with newer compilers.

Dropping the legacy comparison would lose existing negative-enumerator
name matches for 1-, 2- and 8-byte ENUMs in bpftool, and the 8-byte
case in libbpf. In the proposed code, 4-byte ENUMs match through the
helper with or without the legacy comparison.

I'd keep the legacy comparison to preserve those existing name
matches. Would you prefer to drop it and rely on kflag alone?

Thanks,
Hungyu
