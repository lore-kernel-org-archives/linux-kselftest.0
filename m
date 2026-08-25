Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E363A191F94
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 03:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787626840; cv=pass; b=FJEeBLRugt7Z9T8sTO5eR2E76tb+FNbecZPnbuYh9HXjGZmYYIob9sQ9m7VGBmCqcVaGMqn4NjgFKDUgC3oMORXabG58epybbNHEtiCbcg6P5ZUaVSknXtlX4Yk+QXBcbCq0WZ+gbsNAv+sRhrnbeJ7zerAyMrrwLWVFRjjl6OA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787626840; c=relaxed/simple;
	bh=nhMkF/QWneMML0jVXBtRpMi/87xYOZBsFTKpWsBsOrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N1vF8xpgnq7mCN9V+f6JIG6PmPtlN7SBZISKYL50j8TSJd6uYFQbAcDX7+GKr7s9VZJNyMzBUGP/xN5fJMICEXLQv4+pWJ1T/R9KNnOqbhpn076JEPDw2jjAiFuD9qjnMQ3qRzn10Lkfc6aLSA2RuGyr3y7IO49pT0Nr/FZZkow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kU8+Mecs; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kU8+Mecs"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f7027ca11so2157800f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 20:00:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787626837; cv=none;
        d=google.com; s=arc-20260327;
        b=UGhpfmgmjlJlM9CMuF6LbQxtLeTEkJwo71r+CEen7q7SfToJo85g75th43eoHIJt77
         mY3IEcuISmKKgizit5uxQNp5dnE8+sUCtmO8k6osQ/I4XJFocr5aRXJ3HlrH1C9DHZnt
         rbXrertlavbPJ6Lv3lxENfkW4Uy3nm4bMXiwKfunZqHV46T4Gpe/F/YY2QCqBQd+7PdA
         ARdwlpTAjX8W55etv+AYS6U0aBTP7c027RHdUfzUyWu4BKi4E5bS4aObXpszayL1b7OD
         tSoWcAFSM5/lPz+2jnFDonpSdQFtWg8KWTblTsns+U6HR2mW943CTlDeab9Da6GJ0vqo
         IFrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nhMkF/QWneMML0jVXBtRpMi/87xYOZBsFTKpWsBsOrE=;
        fh=y43XanBiOzTBRfviItKJtZ/itR/nb3tR6MPxqEdt9w8=;
        b=p4jMXBkwSyBB4aK+v/PUZWmJ5ONHlPpsBtjOoD3YyXJ4sqDzMRJ7fmQezFWQck4i1t
         z8iYcNE9NCqW0L8JdyzRvY/n3hPry+eeesod+nSibQPKQqIwHjXfky1l2n8aawMv+n4I
         FX5dDFbT1WU/AjvvydphavespWpx4GvV703sd22RLq1sMCqMIdkSoeHxR38inyblgDAL
         R+TGQZU0of6zwj3KjV/6efVoOUI+y8J0sG9YsxflTMC3sD1UWTNjeympKAxC/P7tUmhq
         TFFshLSp2dpfZA+fld34kZyLDUn5jp276A5/1HcMDv0epodRjIH1vwtUmmL+V6OfG4GH
         bESg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787626837; x=1788231637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nhMkF/QWneMML0jVXBtRpMi/87xYOZBsFTKpWsBsOrE=;
        b=kU8+MecsgMVyGPz2bjR8P0FvKR0VH2/VXoiSmOf97qw5AwjfjrI0jAZ8H40c8G1jiH
         sOBBqAyaUfrqhqKnO6C9gGAS37HnYtABCbhWy6Whox5ys92C156UbMSCTA9xJ6eRlqAp
         67txzrXi/T+Om6D4Jh0dDxZY8O3KD1Tuq0qD1xkfamAWNQqqpwMvBv64OVaRGDC4cY7I
         JEHkSHll67qQtEyGKS2FwCo5ANtpALiTTkBtJBboUi6KiNx4wW4GCbWM4/IFJ32L0HYg
         UCdUCz2svR6S677uVvBqCYFFrZCz7gwuVux33Aww8eeDz5/XTSqNc1btqmUgdnsITag3
         54GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787626837; x=1788231637;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nhMkF/QWneMML0jVXBtRpMi/87xYOZBsFTKpWsBsOrE=;
        b=njkAMHFjs02Fz8sqUCKL7Mtrh2RwNGjXNoMXr4hdYAURJNcI8JlaTtdEfpWMEUjS4u
         xBBk1qNrBPJd0N/bPiRdJv5P3oXoQ9g/3PlVMB3OuEonubDw7VUKBCLGcw8HApsjWp8o
         HEhBknTBQGPy7pWFSOL2PveAYTUUtIWzPUGrBerBYTQn98Z0xl0Ud2h+xHkfxhsM07M2
         WqbObaF0jUdsPuFpCreevztgD4tv2bkv1qECiyq7F32t6USfkiMHx9gcb13UKbtkDB5k
         XiNpFu62mvgy0FD94J8Xy7c1ARx/B76uCW9YlWDOGKjUbJebSEoa2/KYnwAJzdqy/MuM
         z2qQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXJFHp5Y3e6VCXRWqlWdlPjVAWC3cm2ECRbcq37mz5+weOFALVAHE8gy2P7NoqLYo3Nf/V1/LJHmR30n8mluM=@vger.kernel.org
X-Gm-Message-State: AFuF++mo+StXTYFWdO4SMT1gI3Pe7M9wLcM+x+hXd0zfdiWxsZWf5Xwb
	hPJn/vhGNPCAK/c82ccbhRV8iBSc2W2S3Q9/AOy7tP1GmGUPKoJ16ISKzXbyLeQxMmlFtJYh1YC
	OdpYWXR1XTnYl4vPut/eXFK3qRmwtqKw=
X-Gm-Gg: AR+sD116Yt3GlZlHjV4oqpuHkDumwUrEJotm5Bq7JMW4JK/GEtlS0seawk5luktBNT8
	9GLrg21GDI0O2ciBE04M9EsWqq4xnR0JyQq1Xn2SE0sl3qBcUbay6gSFZaT3k30dMPYhN0IXk/V
	MjMoFPPpM7hxM2WeeJ7cvvBBDZuSGxQYEgayMSfvRt5mvo19awiu4joJIWNJaiahuC3FSXo5Se9
	nFawQFH4Bq90Zntku9BSvx2lbdrjcGojlFiosuVTR/SijFDyX/eXOGZBV57Rd6aQmOR+l6Hm//4
	75G+p6RXQt/3dOWWgkirrK2nERSFTdGief8CoU8FkbV5kgKbvxu5/RVxLVqwG4RhB1aXVF34pmK
	LN5JuDarKKfaA+KXD3EGFkZ80ScuCvi3k6esL
X-Received: by 2002:a5d:5e85:0:b0:47f:5369:bba with SMTP id
 ffacd0b85a97d-482d9f61289mr2952793f8f.15.1787626836920; Mon, 24 Aug 2026
 20:00:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824103502.3154292-1-falakreyaz@gmail.com> <0285c6bf-43d9-4664-b4a4-38f6fd2dc500@gmail.com>
In-Reply-To: <0285c6bf-43d9-4664-b4a4-38f6fd2dc500@gmail.com>
From: Muhammad Falak Reyaz <falakreyaz@gmail.com>
Date: Tue, 25 Aug 2026 08:30:23 +0530
X-Gm-Features: AcwNN1U6elyCCt5E4KUxzbgDz-OHmACKn9PurWhx5aMx4gTQpdhtTF6YXVWs-R0
Message-ID: <CAOmbKqmiaRNqjdcOCk7bKfLYx0CO0igz3ED1pm1tV0qpLBLZ6Q@mail.gmail.com>
Subject: Re: [PATCH] bpf: Cancel special fields on rhashtab value recycle
 instead of freeing
To: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, Mykyta Yatsenko <yatsenko@meta.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 9:21=E2=80=AFPM Mykyta Yatsenko
<mykyta.yatsenko5@gmail.com> wrote:

> I suggest we review those patches, instead of creating new.
>

Sure, Thanks Mykyta.

Humbly,
-mfrw
