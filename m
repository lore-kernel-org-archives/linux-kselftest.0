Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3473B0AED
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 18:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783364023; cv=none; b=FZUjOCgBr9CVSkDSCBgr3IMtxo57qvzhwD5I3PyEknUM8Unh27UrtrU8LHoGLLIz9IgwDatHB9ukqNV28AKjUW5OAMBxJXOmOkicbLi5xiNLRwu43NV6GgDveIp5TTkgTfA01WRHE9n4fqjQ6bYQNIytQwqFH3wS6EZT7c08VuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783364023; c=relaxed/simple;
	bh=MpET7ucvY4RWt7XBea563Uf8ggta6J1m9GSdG8sZ3u0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PM6t3CTev9b21zumDYUIZR8A1fs9NhpJ7ZLch4JeXntC9uz4EqCXD7ayXYEHvhcJcoSuq0w5VQPQB/OJGhQie+/PekA+L2pd4JkbB2pK4W+UIkZocFAv46xb9Waw94/kFzbkF/ZjF21+Zr3fBf+bZpkiIt3y6tSgHyN1K0TLU1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/0RCBdt; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/0RCBdt"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c999f162c9aso2201164a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 11:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783364022; x=1783968822; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MpET7ucvY4RWt7XBea563Uf8ggta6J1m9GSdG8sZ3u0=;
        b=i/0RCBdtJ0qlQSZ3fzUQRQfH1E2VYbfmlaUGReShXRuN9ngYfEHReVF1Uc5QD7X1EC
         Nv3hgHsa9Mh2xLAqMj0Z/Ut7SynKgz6Fj8JqGClX9GAPzYiptrKz59NPskRLivkhrosw
         d7TDP8HfLNooOFZH18V6YRTev9N1sXz84qhDySJKEBbiRvjhYeyx4cFMVcxxG8wB4oPs
         5sVWw0r8k57IFs4cbiqFvkt619Nn1ZU0oyPZaD1JQU/gKrktfAfyLm7lS28BRtWqFSfd
         y+mpimF8V1uCamyKQhiNm0vu030tGl+oUlDOD/YYYrFYtJoyQGuQkD73B/jCoH+TK5WV
         eevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783364022; x=1783968822;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MpET7ucvY4RWt7XBea563Uf8ggta6J1m9GSdG8sZ3u0=;
        b=r29L4p1auhGI7F7+jPwwJIK4PeD0RdljA9epTLpdHeqVYGkwwmV4QFZyuj3ou4iKVC
         v4/7kk1wyz+RQEt9wu1zeNWYnZmWZrSIAFO07GPdI8JFCmlB8OGHixrqdB15VSJX96l/
         1yMmXw3DvB37HZURzVzDCSC/IKgAPT+rruWcOKEJ783vXYZJDqYauAv2kalumJ9gTRD/
         FaBGMz5RcUcBUR6hVD3w50nAH1SskVE07b4Dvu0/glTK0O+AVAxnuI1wxckbFadiv/Yc
         j8ud3AXIdVaQrhdEfD6OmN0Sug2k99/gZLdAGgv4jGd2I2S0jniBu1ITZ3YkRc/JEuYg
         CvBw==
X-Forwarded-Encrypted: i=1; AHgh+Rov6vGN5XFf/jLHSulUFvxHR9HKG9DYPfdgPXvUt2bApWyEiOjK48TXg4+wwye7uE8vtm+Zv9/P4fKFv6YTu8M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3oTtfUjhucdmHvZkY8NER8xkNy9dngy8IWeokizQ7iKKAivwY
	GedGGIO2SjOVG3SDCXYo7WHskWFdQo6w7GKZzq0tq8fpL6eTWKpkvXye
X-Gm-Gg: AfdE7cn/nL01U9oE3ZquEiexlL4gC20+gfgikiusDS20d2sDGgIjlKSY2GpCxEKlxdC
	c46qRheDYblbJGOnRv5sjCGempZxXyOAPpurh9frylEkVK+9CKl33MkufYF8tGVNccezZN8fLXD
	YiVJOxOVut/eRKVH7gi2XLuEm8nHYscS0L3VPIr42UeQjjS0qXe5324R9CVxmLVoJZ4VdGlBmV2
	VPq0O4NzyIPADTwUc9AL/FAuCE+mvqWZWCHv4nk/OM/zPTnCAWCOwRsnwL6+KvnqUsb4ye+7KIL
	5V0u+SGxSgGNBe7wztvOU9mRXRjKQA05VJ7gmk7HAp45EPIYPreneoP8KvXVU8uXtXtY1/AatK/
	s3oGKQ06Gy2/ZJ21H3mfnkEupE1AD1SzZisJUB6SxnrY59A0D7rmL1MzkMP//my/TCFqezvIucB
	zATlPRK2jhw/na79rJDXl2jSadFC/b7zCji33jp7+qMkc5x9QgiDOcZais4QkvJnVuPmbPiTGP2
	DJmWT0H
X-Received: by 2002:a05:6a20:e290:b0:3bf:6c05:a6 with SMTP id adf61e73a8af0-3c08efd986dmr2263676637.53.1783364021670;
        Mon, 06 Jul 2026 11:53:41 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:612f:7084:be32:532a? ([2620:10d:c090:500::1:55b9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b816a42sm89531831eec.9.2026.07.06.11.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:53:41 -0700 (PDT)
Message-ID: <9fb4401c0ea5e68b86fcc499bf23c6a7872ce5cf.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 1/2] bpf: Reject MEM_ALLOC BTF accesses past
 object bounds
From: Eduard Zingerman <eddyz87@gmail.com>
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>, Alexei Starovoitov
	 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	 <andrii@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau	
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis	
 <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org,
 	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 06 Jul 2026 11:53:39 -0700
In-Reply-To: <4b8c8a81102ba4b595011434c881194f264ddc59.1782807039.git.chenyy23@mails.tsinghua.edu.cn>
References: <cover.1782807039.git.chenyy23@mails.tsinghua.edu.cn>
	 <4b8c8a81102ba4b595011434c881194f264ddc59.1782807039.git.chenyy23@mails.tsinghua.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-06-30 at 08:41 +0000, Yiyang Chen wrote:
> BTF struct walks relax the struct-size check for accesses through a
> trailing flexible array. That is valid for ordinary BTF type walking, but
> PTR_TO_BTF_ID | MEM_ALLOC values point to objects allocated with the stat=
ic
> BTF type size.
>=20
> When walking a MEM_ALLOC object, reject the access before applying the
> flexible-array relaxation if the access range extends past the struct siz=
e.
> Apply the same policy to struct ID matching so kfunc and kptr type checks
> do not walk past the allocated object bounds either.
>=20
> Fixes: 958cf2e273f0 ("bpf: Introduce bpf_obj_new")
> Fixes: 36d8bdf75a93 ("bpf: Add alloc/xchg/direct_access support for local=
 percpu kptr")
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

(Please keep acks from revision to revision if the changes are minor).

[...]
