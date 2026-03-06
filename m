Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F802DF3DA
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 00:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772758062; cv=pass; b=EB6B91bifPhvKvzRnIIGOg9OPKMZMtyCo7o1aGYNGOnQNyXFwPQ+WwISCwKj0EDsz2mhQgZxwPVFw+5N/GvwmW3mIRONN8RQ2HLjXeqGi0mmoI4CXm9HBjVsDyxbO5j2DdZ0KBbwd1oUFIuBY/GmTrlj8lsC9zFUsQHgVWTo3hI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772758062; c=relaxed/simple;
	bh=UJZ12x9GiVv/K2vWGadcerZQQaLPYPRDZhTmIJ8jXQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r7ljOImJ9LVONH/vNLOaHf3Al6IRByhivGJ1EHrYlXcEB1P+sNg0uWyjsyqTv1S4pavk4sT6UKK3vb+EwPL+kMJp/L2cQYJuDz4k9HrdDahUBhNn9U7mmUWwUpJf940/I7lubjM/i2UeJ1LkEIHwX847yWD5O+mUjI8tJ+fwWT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZasK4PNz; arc=pass smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZasK4PNz"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-439bcec8613so3564681f8f.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 16:47:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772758060; cv=none;
        d=google.com; s=arc-20240605;
        b=VGREgKlF4g0zr5UgwUsdG3Dbrj+q1F1WIByJBosfvpIlZnIASXZIR1jfSOKBqEvta8
         XXtSfsbkrBdDIpI3/j6k5r9aSlkzcjeHreaJn1s3Wv4IydTfunUENIYePTjrQgGa0gY2
         ru4w3x6ygP/haWKZef+hskpw9WwPpL1iqepBAhxD0ebTydsbWX4K00YOW8C8dSL1BJ1x
         fAGC0+e4svyey77M9c+p/9ksiEVB5TU9cEzuMk7Q+KI9YeoFJjy2bIV1Vqz66AS0I156
         RiF49LsqxPA0KBCB2fvs1aILz2RCOji571TnNw6gj1mjyMqaiBWmJz5AfvcBtnXcsnz2
         LfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lagd7MB1KvufeUD4xhoUK3YGUYLuUQaZ4KqBVowVLoA=;
        fh=ZSoz3oj6roTxUcrfhx4P5Jy4dkap/702Ny+eLH6rAD4=;
        b=RSnyKHXJPZs+mF86q76eBBf2ZnB4rke/oTVPFoLV/uzUUP0CyhBWcxAwx39VE8Z61M
         OrDTdnca0lGHh5Wh6jgDCX8DZFA7vnOa9xbIjGAqADLOscGW2jgoZqvN8Uhdml1+M+K1
         RKvC6My3WEmphsQU+uajIU4AYVbH8u3GckISGgHtVjTPiTpHN26J+UGVZHYIcJ+JqsrP
         oxSDlqA27zrVDs192SqMNdPhW2YkS0t4FJ270eh3FuCX7QAty3LHjTkh4f9SycLh6jnh
         4AhKbAmnLtDjiALGwlPP38lIxYAoYVpSiO+RUAccIXMCdCC+qt6splT96bcCKC+EJhPk
         +ydQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772758060; x=1773362860; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lagd7MB1KvufeUD4xhoUK3YGUYLuUQaZ4KqBVowVLoA=;
        b=ZasK4PNzkbObL5sMJYmRsgdbjrodHIUjX4DWhvv4lOsqrDEnHxS6cxsx/3Len413Ys
         Hd/CFY9hKMP4bv7ZVcrEKNSsaNKqfVuPv8keA32HfvgoOPOWYmy3nVH170Je1QKHDJR+
         7qpIAgPhuVaX4JMnDo4kUxTWF/O+HrTxWTwhMrD27ACBkEmvH/X5yfEyF+o2TgCRjyaP
         xRghEpBr+i8XhmGaz0kNUlfpbeq/ePdPM1QJq1sTuGILQhJztU2x2g9GBt3AJ5jjlj7C
         642GsUn+e7gMnYBUq8cGQdhCyzU0miBJutgdzpgtU1dp2SdTd4uvyDtKgAxsEcTo8tsI
         +7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772758060; x=1773362860;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lagd7MB1KvufeUD4xhoUK3YGUYLuUQaZ4KqBVowVLoA=;
        b=Kv7OF/VPAtW9YCceQaSezvwKeDiGZIZJBDuSLiP2dqENXQ+pML/G+ac32AYiRkSOAV
         w/6ygmqWvMZSvLVOtXv95m9c5Njg1eD19SoAHYw4QRtTSVie+3R9YdUbD/qC9wGase+7
         DRTMziBQD5ILjkSahqt4OYXO8JEUvdnXlV93f4nG6a8qQ7JFUvS4rZ797jp2n3/IU+13
         RGp/OpCAXWbnvFKXB5pB7rrmmQ24Lk+jY2kWCnFv3pRqbrwEpxuPL+iG0j8Vr0VNGDvL
         qBpuHFyZ7A/ijVdxzsY0QnoZxDuvim080kJCaeTIy9Q/McgKfzsMpRx9ZEHD+8XdNIJ1
         3sag==
X-Forwarded-Encrypted: i=1; AJvYcCWKv0CZgLPdSIrnfU2kFtDwueKxHeOvPv6fL9O+Zsrshdjg89j1IUMJvnrPjutgfgK33uyypgoytOpr7Ef50qA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYNSz2ZUsord9Nt6j6DU3lahd6CiNwvv4t9hYqM4GWAAahoXiN
	2Zo3U2o8MPrEj4EFhPZRxubOInPXbT32fu9RhizIznOZj1qe5vKjGVp31KH+97HPkaJJ4dO7DKZ
	LkTG5nF7ybiko6wXlz2bB5i4369gUTu4=
X-Gm-Gg: ATEYQzyeoKzzG+/ZnoN97n2NekhlxM9CT7cUszxoYjUi5xKaSMN7y90LrJxC1l0trvi
	i5nB92r4uUwjiChlQkZXWEllpy9ahmNs9PFpZTZCAeDFh8rs+lkke84IUaIlcGGvssTuJ9wrkOp
	qZFj20qTRDSQfM74zfGwHs6AAc2nuGwbXHXq1mm9TeoNwkzgo9CdOtw+r20pkc5ZXiziWsFtVnv
	ErKXI+Ch2LAMUPiY2bOlh2ZYHhCx4QOxH4ptkieWKgQD499s7LHNXyU36MEICA1atMux+01Pd2/
	3hq8oUGGZEOvYAVqaowzW61Q6iav2OMecrDNBkrX/6LG643JyGsBuOOc+rA=
X-Received: by 2002:a05:6000:2913:b0:439:af0e:57a8 with SMTP id
 ffacd0b85a97d-439da669bcdmr391532f8f.33.1772758059440; Thu, 05 Mar 2026
 16:47:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304143459.78059-4-pilgrimtao@gmail.com> <39625108dc3e179cd05df6e35a9e83717b1066376ab0f1aa868ced89abf1d677@mail.kernel.org>
In-Reply-To: <39625108dc3e179cd05df6e35a9e83717b1066376ab0f1aa868ced89abf1d677@mail.kernel.org>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 6 Mar 2026 01:47:03 +0100
X-Gm-Features: AaiRm52K2SnCCvu3F1bjHCaR6zL_rvQ-CHHGfyb4rF8Vhl8qRhUMghDts9u1PFw
Message-ID: <CAP01T77d-qS7xTUbNf=dtyi5458DR4cmG6s9u2pbmSOdEYocww@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] bpf: Add bpf_list_is_edge/empty kfuncs
To: bot+bpf-ci@kernel.org
Cc: pilgrimtao@gmail.com, martin.lau@linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, 
	chengkaitao@kylinos.cn, linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@kernel.org, clm@meta.com, 
	ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Mar 2026 at 16:34, <bot+bpf-ci@kernel.org> wrote:
>
> > Add three kfuncs for BPF linked list queries:
> > - bpf_list_node_is_edge(head, node, is_first): true if node is the first
> >   (when is_first is true) or the last (when is_first is false) in the list.
> > - bpf_list_empty(head): true if the list has no entries.
>
> The commit message says "three kfuncs" but the description lists two
> and the patch adds two (bpf_list_node_is_edge and bpf_list_empty).
> It looks like this is a leftover from v5 where there were three
> separate functions (bpf_list_is_first, bpf_list_is_last,
> bpf_list_empty) before they were consolidated into two. Should this
> say "two kfuncs"?
>

I have no idea why you decided to combine this, there isn't any
indication in the changelog, but it looked fine in previous versions.
It pairs well with bpf_list_{first,last}. I would prefer going with
separate kfuncs (is_first, is_last). Please also don't skip addressing
feedback from previous versions.
E.g. https://lore.kernel.org/all/875x7bzkz2.fsf@gmail.com suggested
using list_is_first/list_is_last.

>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/22674350640
