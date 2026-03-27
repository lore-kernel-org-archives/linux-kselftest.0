Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5FD4A02
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 00:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774573046; cv=none; b=li2y4tfJexqUbyJhxoqlNSVqwh/7rJJx1cjdYeSOcS096xY4ypdPDFeT0lKQ7rtQNociMHy4z0kxYw/VngVXCuZD3KKV4ttH2lJ2zzBKjcRgN8CYXQia+l+8ldFbw59y0Gcw4BY9nhEFiQCj3HctOLT4eNDeVGbO3aNAf/kYffo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774573046; c=relaxed/simple;
	bh=4EwYoLRLNmMXBOrvB8Evm6LeapyLTQgqJcCP0fTHgOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ekv9k3QuaUrStuqfSOZvKafy6x1nimTO22UDl7QKbHoXq6oDaUpz5XkT+HeByCwfii1gcTD1wGRqpo4Mz6Rsv+cVTVI6RWn8v+WM9oPrYOV3wlzBUt28O6W1WglcHbCd9wFmLJoiarLR/N1KhzVljYkAihgGiXxG6S83PUg7K0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bSmG2Prz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fivqMNM4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bSmG2Prz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fivqMNM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774573043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zBn0Qd0IPSXF9U6X9Wlo0FxebI498QdZ8z3o4BFj7ZE=;
	b=bSmG2PrzXqwNefs129gfYtqhcoYQ93GdXK7vIcFm37ikRi9zrPhdda2+ic4SJ7PrVi4Rdt
	4zCppTVQVJaImrwFcCVh6dV3gzOBlexXk1Ago+3ZZ7X/GD3nSTQn8oJEFTABY4ejpJQf9a
	VFUXlvps+Dxi3J5wBnSbYbPYM/XU+n4=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-LNEW2TQrMcinjs_kgXybfg-1; Thu, 26 Mar 2026 20:57:22 -0400
X-MC-Unique: LNEW2TQrMcinjs_kgXybfg-1
X-Mimecast-MFC-AGG-ID: LNEW2TQrMcinjs_kgXybfg_1774573041
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a6c70f1f8so1418683b3a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 17:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774573041; x=1775177841; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zBn0Qd0IPSXF9U6X9Wlo0FxebI498QdZ8z3o4BFj7ZE=;
        b=fivqMNM4qaGf2lOb2Sab1b+1UwDRFIfm5W1YRIU35+I0aNDsbCOk2Ns4FW2ybyxB6p
         5spm3qLh8VqcgZ7G93H0s0cwdTXF934QNWNpPfb08fovM6BcCUKnhfGLLMcLiy0IfqyQ
         wwPbxpb/43Y6sFfWX9pDRx9ckWCsUJ1Dytx6JSVpBKsYeX2YHRwbxCrEi2UVySAITc/M
         cgR6UNXRffHTameajUIDfoZcITxfl+i6Vi2GT8fSJKMdUy1S+bQ2qtXyJSzSd9Cmm7kk
         UhW/chPqE3rVTbKq4BLQjeQ1585UdznzhSeWaXgLLdJBAx29+vBuuqKdD1dgBlExlkM8
         aQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774573041; x=1775177841;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBn0Qd0IPSXF9U6X9Wlo0FxebI498QdZ8z3o4BFj7ZE=;
        b=rpp6w2juMGkjOemcTDSAdBElg8JvuAzavXiFajkL4t8PyHfJr8mZNLLCMd1hZTyfAr
         /+T1ZchJVnWSNfFdDpH7oJRO9dt1cOzzIzEX//LgsXsuXaItOWDu6w/7DXWRv0GfAFzI
         v6qx5jVw6G+b1tM1r6ukdo1eG0gWvKfCbM0OzFz/HBUqX5OaPizcXxBRYq7wPTbzZJZL
         dQO5oVDGwQG38lKAHgx28zTHp6KKhJT/1dfUA0fU0frxOJBDEal3S4J5iYDhNcVAnP9Y
         LUyrW6bbKkQcT2fW+XDUcUpgTuTwXgRuo+E5zUiCLwjKj8EAQETsZSRam+4dR72Nsf+H
         tuFA==
X-Forwarded-Encrypted: i=1; AJvYcCUWtLd8d0VVj0yl4wfGp8g16as4OMe7LBOeVNmJd6hK6vvngFx++6HCNxGhJF0ZbZvTEZnQdPZbI3OeiZAQVMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSAM933T70abkJPcUIyKQqYuI0f33/vuAqHnpAS+wSMWnVC6Ln
	I2/YCquMRi49LTYwKkfDbc8ipkm0i1G0Po6mN+CoaoTdudyJy1c7wX2KCkpq8FHVHkA5ipMR0Bm
	IZHOlNBnWZxdFvwwiuG1n6gLPXLVFGcrMELM2yKfS20bnIDKXd5Ukw+x72jvhRN3nKz2Vhw==
X-Gm-Gg: ATEYQzxk6QDlbEtL0fbalHKTNeiObwOYxYENdfHe+6hazZqBsJ2PlXIhZY9a3IiH5yS
	+IC35WG+pjL8lOddaZQVCAhiQYmYE0Yu/LG348L6ptuDfkB2wziocdZ7Duj+9afJS841rDd4tDU
	nsPA4JHabloSlVd504jXzKGqLn/+C/rTMJm9O+5sXt+uO438kec5lcJpYjWd4q1hdYsfIPWxf9h
	I+Zs2d552QNWNCEu0eSuUd00Rqo7WBTfxdCvcnT5LB/ggrWyu8oWYSBTk+x+atVlp3p6CwdLLrU
	iyd4Dz+S0GOoSO7iWas8hOyp5A95NbgR6C7puGngDDeaUbuq4z89sZXmJBd19MRJRS0MPX5pTsk
	/x9qwR2E03sbupRFE/g==
X-Received: by 2002:a05:6a00:1495:b0:829:8942:2ca1 with SMTP id d2e1a72fcca58-82c96037189mr557110b3a.44.1774573041038;
        Thu, 26 Mar 2026 17:57:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:1495:b0:829:8942:2ca1 with SMTP id d2e1a72fcca58-82c96037189mr557083b3a.44.1774573040550;
        Thu, 26 Mar 2026 17:57:20 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d22c8e8sm3525446b3a.24.2026.03.26.17.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:57:19 -0700 (PDT)
Date: Fri, 27 Mar 2026 08:57:16 +0800
From: Li Wang <liwang@redhat.com>
To: Yosry Ahmed <yosry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: nphamcs@gmail.com, hannes@cmpxchg.org, mhocko@kernel.org,
	mkoutny@suse.com, muchun.song@linux.dev, tj@kernel.org,
	roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	longman@redhat.com, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v5 0/8] selftests/cgroup: improve zswap tests robustness
 and support large page sizes
Message-ID: <acXV7LhE0z5seCEA@redhat.com>
References: <20260326032658.96819-1-liwang@redhat.com>
 <acTSQFxTs4-t7P5t@redhat.com>
 <20260326160618.18a20227b606bc95f3c3cfa6@linux-foundation.org>
 <CAO9r8zPMtNaRuGSrHnfh6AX3DKVoR6d90X7O9UTjxbushssyuA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO9r8zPMtNaRuGSrHnfh6AX3DKVoR6d90X7O9UTjxbushssyuA@mail.gmail.com>

On Thu, Mar 26, 2026 at 04:10:42PM -0700, Yosry Ahmed wrote:
> On Thu, Mar 26, 2026 at 4:06 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Thu, 26 Mar 2026 14:29:20 +0800 Li Wang <liwang@redhat.com> wrote:
> >
> > > > Test all passed on:
> > > >   x86_64(4k), aarch64(4K, 64K), ppc64le(64K).
> > >
> > > Hi Andrew, All,
> > >
> > > I see that Sashiko still points out minor issues in this patchset,
> > > That seems very tiny in selftest programming.
> > >
> > > I can correct all that in a new version if you'd like a perfect patchset.
> > >
> > > Sashiko comments:
> > >   https://sashiko.dev/#/patchset/20260326032658.96819-1-liwang%40redhat.com
> >
> > Ah, OK, you already looked.
> >
> > If you say they're too minor then I'm OK with that.  If there are any
> > you feel you'd like to address then go for it.  That's my opinion,
> > others might differ!
> >
> > I suggest you leave things as-is for a while (a week?), give the memcg
> > maintainers time to take a look (please).

Sounds reasonable!

> I think some of the comments are worth addressing, especially:

+1

> Patch 4:
> Using BUF_SIZE in the allocation helpers is wrong, we should use the
> actual page size.
> 
> Patch 6:
> Zero initialization of zw_allocation.

Thanks, and plus:

 Patch 7:
   Adjust the code comments.

 Patch 8:
   Declear long type for elapsed and count variables

> But yeah as Andrew said, it may be worth waiting for memcg maintainers
> to take a look before sending a new version.

Sure, I will allow a week for others to review it.

-- 
Regards,
Li Wang

