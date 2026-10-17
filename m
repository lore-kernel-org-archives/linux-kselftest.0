Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28333A0E85
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 16:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792254956; cv=pass; b=qCmVgpbXnvjQA0CLipVKcVzneF0173/GekzL7WJS7UltCZcJ1TzbB7nddLwRTSRpGITOPx1W6IjF0Hfb2QSxF5MeSJ0/EuFYLTS0X033epQk0bH/ehIM+Ew6XpUBvvAlmnpZEoX0iiuXEeNIF2hmUdiiFNNe/k9JspwzFsPEQKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792254956; c=relaxed/simple;
	bh=K575d+X/T8zxf8IPb1Vxi4/BMBu6K4J9uKB9yZoQ32A=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cWpaQhc6UqEp8oiQK72bXNrjrgnMKvLMHFgOL672pvlvW1Ptd/skZYSwxafwHXBUi86m+OQetj004Qc/MCo/da+9jNVrWkSdvcARB0gHOm2N/qGUV0bPpFvBbsgAvOFFuJMfH/kqZl8uZ7nQ/q3+iMWo61EbZ8A+VSDLEym7mF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0KGGKWV; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0KGGKWV"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-530e75d1ba1so8240301cf.2
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 09:35:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792254955; cv=none;
        d=google.com; s=arc-20260327;
        b=PGEyoGkpTzNVwwfu+by1ucKUxEtjZK5wLn0p/SO64WfoW8pok0HOqqgUVY0PmYCUqY
         CZTMwYz7cZn9XFvo7uw/5teVa8LPZkj5kFsqwEymxNKlG0+Dhdr1gYDvUAhaAbIPOwSj
         JRwKeIkEJKXoErglYBupm4cwkFUgeOGm0Aivvo27MKRTBQ/fkX3mOPU0HtYWXgBxbCBi
         Fm5h22mAbp2gfVSk7gVk+vXEKEriFVdKGeoZ7ChcidPGcBKGHxrwomxU1gGhTZT7u7x7
         t6QyipmdsfzO9BBOTzEkqDXV6inOctjhpb45N5GxTEjsWOnNxzdUIEY622jF/Xjvel5d
         p3wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=K575d+X/T8zxf8IPb1Vxi4/BMBu6K4J9uKB9yZoQ32A=;
        fh=A4FtRLlPabxIAaIzHFg5BeONbO7xwDCVEWlCRRCS0ZQ=;
        b=sEoCDAEdtu2oKErw7YduJCMylK861MUyUi4my8c2iMJcaxHZp1HQgjUtqT8VKzkVz7
         0wreoyu363uCYcwUDK/qnkDZFro0JlJkgNvAuNZUqx5QIxxU2qr/2QbaiM+3PLuIgAT9
         nbZoJUt4Bs2Gf7otZw2WI9rhi24eWy1uLY2XnG5syxrXf8IRUxvneept+OR9Xr24YEEX
         fhuA4rwcEAyvQaEeOHuNhfDJjnnZnVYuUqYbtAAsWo9W2/MImQVcJL67PuEnAptWLSfL
         iNvTy20rjicP9XOA1Aopfsi3Ozbox64rx9gb/KOUoskGCgK1sAsum5iDIge87ybkzEvB
         SIww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792254955; x=1792859755; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K575d+X/T8zxf8IPb1Vxi4/BMBu6K4J9uKB9yZoQ32A=;
        b=P0KGGKWVcEkW4KG9ENXfXln/1TL0YjJPQuXbApexWo6H9NStRdr1hOEfHo50t5S1+T
         tzWfqQup2e2Gccu7ziPyIpNPRLt7MkZZHC0CRLC8+PfxP5OstguomdIxQbQhGKYzocZt
         2wbAqdmztclQihFvYP8zN9PYwDGB1YRH1hobn7p/21X2/1nZZ9xT1zHcRMd5K5Zw85Sn
         CcrpmuFZ5T5netF6CTw3k/baCOBHj1ipzo8GAUnrpURrX2+PYC66dKgz6e1OHCtBCXh9
         TXyuR7RuFvcVOdjNJ/U3WuEbXwRnA355Q0/7FIKQJA/eNiuHKu65lEvdOPiIv636FOSs
         yXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792254955; x=1792859755;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K575d+X/T8zxf8IPb1Vxi4/BMBu6K4J9uKB9yZoQ32A=;
        b=dQNZBjLQPLu4/XB6/4d5yeXe3HMOfHgMukBmMKNRel/2geq64Q2nRORdb96GAb/dzN
         0UL6ImHVib+vrgIOnYXPWxwyasrDTx0m182HvxwXNXt2X1MRCg4jk+f2o57YoYtOLs/1
         MuWaDur0vbvkl5Zrm0jrxNQGoiR2Xe5QIPTAPOe22A/CKErvGxm5X5o4OshQ+6Pz/N6m
         i/YDtPZhdjIdszJuyV30+P/TaHg0drUfR16tm9Ge6tesd80jq/zNjOPhg5pP0g6pLaZ1
         AcRTRDMj+vzXM0hdJOlDUK20Vs9MLgQVSiUAhsy8mbXXqZf/ogKpGho8v14J3v5whmF7
         7n6w==
X-Gm-Message-State: AFq9FYK8JaV6gzkr6U8iqZSO0Etbe10u14uCvflTe+QblDNmWQ6vvjV1
	lbXOZPVYlOFzt4mY77yT6TCWjILCbK0L1phKRb1Ik7fXNznpS4lEg/Dvu4Xusq0Y7ejN5I8u0MJ
	kn9Wd8Wg78gJepgOPKW/SYZ8NpmHJ7aIIkbEc
X-Gm-Gg: AYBFou3+NQkyLfGZqh0dwjtA3TZE6xFo6G27G2imxmn/2SDuPbopBtnSCw4TfW50Lqt
	f65FK+1Rna+l44MYUDPsq2LouBOutEhpXGkU9pIjBbLvHNjrbnIHddiU35I6MthiFG0hJ04UgGg
	xA95NEGhjx0BdM5BOPoPbvSbseN3imCZ4NXwlfZNisHHi+j80qnt1vsep8iEsyXgxqKwyyrs4BC
	o0Pw2sHt6jsfvWj2GV5khF6HJF3KFOEcfj6YV1fyaXlYvqOkTlRrYf3m162Qk5SwOnLZm+AAgrs
	5MfGcwxGW0vkHUKB5Bj/kGbuc5Ju6V3q4WGLBYc6WbeYii53eBsnHNhnUKS7Gy0vfNAxXiwH7bI
	EMBdCRY34zLZR8mOvHg0TINrRjdyEYu3xKvKycmunkfY+2kSm/UZwW4JhDRZTUrV33t5qn2VPu7
	o7H1h459mxy5u+CFPlCPe3ovuW8D+DX6z7szUGmCRV+etBUNkgUcFlOYpYbaRramSwgDYCeTU+7
	qCTBBImLOvLRiFyouGsCIsM
X-Received: by 2002:a05:622a:1244:b0:536:4482:2c5d with SMTP id
 d75a77b69052e-53645e074dfmr47949901cf.19.1792254954694; Sat, 17 Oct 2026
 09:35:54 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 17 Oct 2026 11:35:54 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 17 Oct 2026 11:35:54 -0500
In-Reply-To: <willemdebruijn.kernel.eb0f6ff37e8f@gmail.com>
References: <CAJPVW+=XcHDV4aoXt5oAHYh49kX7m5wUxf7TucrcBy+q6MdXFA@mail.gmail.com>
 <CAJPVW+nstfbagm9GxQ=i-5J6Xi_aZ52-YiQZeYrzmPD3OmDNiw@mail.gmail.com> <willemdebruijn.kernel.eb0f6ff37e8f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Megane Hebo <hebomegane@gmail.com>
Date: Sat, 17 Oct 2026 11:35:54 -0500
X-Gm-Features: AclHuK-g419mItqEZ0pdzSa8CH0A7yGLpafb0QAT-ug0oTfrYzft6MBGpXjOWuA
Message-ID: <CAJPVW+mYavbi3q8eacV4=V8Be0-_5RV8MnksXPhiEvin8XfGrg@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] selftests: net: exercise virtio checksum
 ingress outcomes
To: willemdebruijn.kernel@gmail.com, netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	mst@redhat.com, virtualization@lists.linux.dev, habte.yibelo@gmail.com, 
	jasowangio@gmail.com, eperezma@redhat.com, xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"

Thanks, understood.

I was optimizing for preserving the semantic contract, but I
underweighted the permanent upstream maintenance cost. I'll keep these
cases local unless a future regression shows they earn their place
upstream.

I'll use git send-email next time.

On Sat, 17 Oct 2026 11:55:26 -0400, Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
> Megane Hebo wrote:
> > Correction: Gmail Web rewrote tabs and wrapped some long lines in the
> > inline diff I just sent, so that copy is not suitable for applying.
> >
> > The attached format-patch file is the authoritative byte-exact patch.
> > Sorry for the transport noise.
> >
> > SHA256: cd11c3970f0a23ac039cdfcdc6338c20c79dbff3db8fdc93ea53b4b8996437b8
>
> This is not the way to send patches
>
> https://docs.kernel.org/process/submitting-patches.html
>
> More in-depth: with AI it is easy to generate testcases. We now have
> to consider which ones are important enough to submit. I think we all
> have reproducers for these specific fixes offline. If we had thought
> it worthwhile they would have been included in the feature series
> itself.
