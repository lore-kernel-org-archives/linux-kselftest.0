Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F234435511
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 18:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784228389; cv=none; b=on8BpqxSxkTgdxB6cmUZPAmmmrdINcvPev3u9qSNPq9UpAvI1J/V0dr2FETBeEmGaDnx9wZ+jFVV5EuReRtziTQiG2dorUQekAygFf0W4bR1G1j/fJCWzLC1p1R2mM+2KFPj3lOfrSbKTR15f4zViPZ6ce5OhpMIt5n6Z9OXQVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784228389; c=relaxed/simple;
	bh=+vx12DnbrH1jEO3hyC82AQB3qS5V7/xSoVL7LiHkQ68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/fAXEkyjlsRW6X21Dyt83mnh6FDm9cu0XEH4A0IQfQHjoA/PA8T+sT4OJlWa4d2NAQeFCfJ+v6fT7odkMNDjQqrzC4OjiurpgszOGSwEm3LzlTaJ3PGRCyFOI36lPGPlYtmnjTTto3HVjgkyMg0LC+z5ajdvfjnPBGPQCFyi00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GeuEGCcQ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GeuEGCcQ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1601d552a8so735698766b.2
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 11:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784228386; x=1784833186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bpwBCMUqOktawB/a/lGWrgRdo+N7QGVrFJhgBZS8dP4=;
        b=GeuEGCcQH3ItJLJJTIj/+a1WALF+NjLPuhoIZJL8l5/Euwiksom+cCq6BnzZ+qP+Dw
         IOeN5tP5J4BLyEtQqRBr38NG8S7E35jnjjT/NU8xuJd9z80PraCDdlrB0w4CEdwYrSEJ
         Q7CpjyvH7ttp4Z2wm64U4i0+ghDUkhiyhHv+t9EnYsEywcjYug08ryPiqNsHt257pofb
         1dU/9JxR+IQGaZUVxyMBejvvnyNKwnmhlFxk7MT7Vpnn+sNLaTI0f8CI0OBsR5pZBAGW
         UsElyW7awjPGXMSa1+2coHfDjunNo6gpqT8gZA3aqStcvcWzQ/Jo/WNUO2pjGN3iTNVF
         wQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784228386; x=1784833186;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpwBCMUqOktawB/a/lGWrgRdo+N7QGVrFJhgBZS8dP4=;
        b=W3igvsqt32E08sb0vM7RND/M91aAnoli3KrSTD2hMb3ygCXwT/VTyENuv5eUF/3+Xp
         Vsf+tYzkwL81eCyqekc3+irv/VHi/B6IcksNCFQg204Cp5SE/jzkSlCzL+6ebe12w5Gq
         R4yXXeP3sKFdZxmBua5ws5Y198obpcKlwnWqQOA/6omc+iq34tqp0nAxCipjK6b4DU4o
         iGN7eew4E/O0zAYFxAYg0IQFd57y21q2lYR5dfry/1gTYaV9TUpZNiYXB0mEUttX9jBY
         8amL31OFYaSGdsUhifPfjMqrmM7z1kb1q+wxkToxOzUMLmjbWZoOaXQCe9Vj8sazj8SK
         t9kg==
X-Forwarded-Encrypted: i=1; AHgh+Roepwa0v7xrBlCVb+ykyHmNcUlxBYFG1kmCaydoVcdVKQgNaGHbIWOc1MY4MsSDufPm+ZXsWO2uz6jq4qPGqFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj5LdZ6gceYiq2dRnvE9P2/LdHs5Xqnw1Od03rM81tRUKwh+gI
	hA5Xc1gFCYHIDBYhodEdwYw0dS7KLiVbF+OMQTI8hUcg3oXUZhsjyRhZ
X-Gm-Gg: AfdE7cm9S/Fs4qcZZ+VfShHjaIel8+8t8luE+1c1JL89nEZ6vYUhmuMmCLD8u96OEjL
	LeHYOux/iyRv/KTq+astIYNEMH2W5tyDy2Mllid3Q/a+Mh5e+k1/1A+sytMA+KCAPr0wXXJBP0H
	YpXTU/QIv8V0G6G/zLfI8SPToTQE2Rllr17UvcE6EY8wBVZVlW4VVy+P7hsRsR1fX3l6L605bUw
	Nql7zIs4KMbkSf/6osQT0JbIBIZ4+XbQAZ8Bp60nevgwm8VX8TlOyolxRthkC3jmfZ+UOzlHaaz
	yPh4iCsgobLyEfYVlCzG+lI21YGpt/XR3eHxDqFeH63xXIpjDwHeeh3t1veoAocX+LaTr0VVxS/
	eK9WsJYswiq0FtrS2r2V79Idks6SQze9an1lyVJVs6Gv6fdBE/+fvOYMicgTr9BuCFIzgHdhdzJ
	AXXYTTtzwXOFPGBZvWVU9UHaTwgemFKIPRAmP65+vuYPsyse9NmTQ8hNlcB5ptNjU=
X-Received: by 2002:a17:907:9485:b0:c16:5867:e098 with SMTP id a640c23a62f3a-c1667ad9fe4mr699209666b.40.1784228385516;
        Thu, 16 Jul 2026 11:59:45 -0700 (PDT)
Received: from localhost (226.55.classcom.pl. [195.150.55.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687126353sm269375566b.13.2026.07.16.11.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:59:44 -0700 (PDT)
Date: Thu, 16 Jul 2026 21:00:13 +0200
From: Piotr Zarycki <piotr.zarycki@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	vkuznets@redhat.com, shuah@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] selftests: add swap() macro to kselftest.h
Message-ID: <alkp6pv1Z-zHTka6@arch-piotr>
References: <20260528154003.3594107-1-piotr.zarycki@gmail.com>
 <20260625070914.2175124-1-piotr.zarycki@gmail.com>
 <ak-2To4F5tNjyolt@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak-2To4F5tNjyolt@google.com>

O Thu, Jul 09, 2026 at 07:55:10AM -0700, Sean Christopherson wrote:
> On Thu, Jun 25, 2026, Piotr Zarycki wrote:
> > Add swap() to tools/testing/selftests/kselftest.h with an #ifndef guard.
> > 
> > Guard the local swap() definition in mm/uffd-stress.c with #ifndef to
> > prevent a redefinition warning.
> > 
> > Use swap() in hyperv_tlb_flush.c to replace the open-coded PTE swap and
> > remove the TODO comment.
> > 
> > Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>
> > ---
> > Changes in v3:
> > - Add #ifndef guard to mm/uffd-stress.c to fix a redefinition warning;
> >   uffd-stress.c defines its own swap() without a guard, which conflicts
> >   when kselftest.h is included first via uffd-common.h.
> 
> Why not explicitly include kselftest.h in mm/uffd-stress.c and drop uffd-stress.c's
> version of swap()?

Dropped the local definition entirely. Sending v4.
