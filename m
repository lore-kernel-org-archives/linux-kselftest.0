Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3072637F309
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 14:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814099; cv=pass; b=R9qATkXesXGa0EfYSQsAGSOwp7L165uiE9xZ+wrf9vxLklgP/oVs4vYkWsJSYLw/hBgF/ahx5Fh+ywP+hDr6xq1FfP1Tls5Qzbx7Qj06delkCY90xkzjkC7vW4dkUfu7QFWvaBOz0qgnNAZfNXtQQZzaFGt56woCQJos1hNLGwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814099; c=relaxed/simple;
	bh=Ds1RsGrXdYNa+VIUsNtvM0HHuJhu03SNmjfL4ZgCOaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7lr+hHLt4ChTeIOhs0VnnA8wo5XsU1hXNFbzYc5WN7bD8XMq0sEJXUAVZBFj7mQuBqzbyoIcF6FCdRATYPapvOze6h8WVnqlquGThXHE+b4Y12pQQqRqiOrPtJiWO0FKNGfdb/8GZ0IeIYueEvBzLLACMAL9uQkzsDO2fDGGOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SOe3VuQ/; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SOe3VuQ/"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-533202fe429so382201cf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 07:08:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791814097; cv=none;
        d=google.com; s=arc-20260327;
        b=oDSZLV/3mAyGLSW9vPLpVWJwj5m0xHgDn5JiAHoSdTw7DtJHt2JJa/e19WExT6cTK7
         h9+JtQyS4Uk93AgVOgb8JeNmhN/1cZcQRalgGbGUqv5W0BvhNFlGLow1buqbHpGbgBeK
         YNcOrZalDPYBPdsgtIHBGWnfDXtRiugydjdP2igo/BcWJfBWsy1Lu7pcPzxvtMqrcapX
         RdyWy/Ukls9Z8WYMG5XByYepNJer43NsX1lsWJInL8i/ar9VDuqdv/AolxP3f9yxuTcD
         7tjH5+tuKXeLHxK+miq27EP8hMkHY3B047AJg+AmAiH/N4KnRzlYzVMZljnIRR4jxpKa
         87Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ds1RsGrXdYNa+VIUsNtvM0HHuJhu03SNmjfL4ZgCOaA=;
        fh=8aKyTHkuTx9fOMymYlkYIWmpq7liIlr1ATDzVtC3lXU=;
        b=n9fEGnwqiNYLPHpb/Efhe49Qefbs2/qfAqpqflVWm0vhQCWTd9MaKrP9HUYsrRZT/Y
         85ZAVQBEtrcqQPkXQAWfAuIxBqvpNeKwpuUt1SkfGKR16XVDlo0qytwPWhjiH5r6T/qH
         F4Xb4v2nZ3RGJlub2J62daYprrFDeTPiMLmBSCloQPgCq0lzWJqoUygXl924sQnbDr2L
         MQZiqLW7CHlS/ZJDEp7RBosO+5f2BgegJHwdQWjbFhfX1APA0ccy6xRfy3TpHt5PQ3mJ
         fvXY+VvV+7bOa+VTNpaRSaGVu9RqD5xUI5Ot+ruMzvng1Xmn0DjE4lUEVCeyg9Uv6mkg
         VpgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791814097; x=1792418897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ds1RsGrXdYNa+VIUsNtvM0HHuJhu03SNmjfL4ZgCOaA=;
        b=SOe3VuQ/nn7YiaUb0PKqLKKjN9sZyt4t4cOp291Yt2mwIHZXCgpIlNhp5L34ENwPpX
         jzfDXRRZmuRVfI90CP9kR6OpchP43HLmIUp3MyrhPb4I5UovHxImoPfdo7WxeVb5qsHD
         DLiCG+995SFhVc8z+k6K0+63xVkTsnVfx7VUGP3L69swDmbQejKvS5tn0i5keUIFzhrt
         IjmnTOgIWm58c5aeBaV1FcjnqkxDNSWEdh5J9QUjbJ9zRuS+D9kJtzaiNvOOLlwJ8mzX
         6bVAho/U1SpULa5kQnk5PQKszWjT+K5K+LjD2ngEJ/3XB2omPaeLJXFuvKMVvA80FeyH
         7XRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814097; x=1792418897;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ds1RsGrXdYNa+VIUsNtvM0HHuJhu03SNmjfL4ZgCOaA=;
        b=yNCP3R4or+jkMZ3+ZTxGqPquDZ18lcRuWJrBZqMPeQECKi5Vdu9BIeCZkfZBg2cqDh
         H+RhEDcJfxI48RuEc6bzu7VcM2/IEWyYHwjrzz37oUHpYkam3v+QaFlJRwdCTQ32k9x5
         y+zTrPbECxxlvMmZ+/tPjQuwoqLGe8cdYeckvrxS3eCWseh83s9qq6UTtaKehVAHM1tK
         Z6/yIeeoKihMQwP5YFeaxNgAPm8UComM4Eaup7NN4mAxxDLKeA/7YqkJ3pM+slOjzd+9
         ClXwtKfMarN8zx+F9aTRqBKHKq7a3j+y6qU54YHMfp0Vs/f57o/aVPlNYPCwBL4seaSy
         Kwsw==
X-Forwarded-Encrypted: i=1; AKwUvBzheLI+aPEYoU7tooJXJ1NALgoUzWeBpMwZcKzqr+6qVQILaJn4b1BW55aiEqcXDRXjIKb2hZV7W8SA2oexYtE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKU5ZJv9yuiUzB0gcMmVzypRuLieBtw3oDi/BX0wdhHkntXDPaP
	J05HHrfjn2O3fTOcaxRD9fH1VVLjpD6SqYmBlPwMGUi05DOHOIhxqROU99Z6pg27qQNgtgwzea6
	zVkdicAWqFsuFK5qlmnOrDREU6UCC+X5sv/GDe5mK
X-Gm-Gg: AYBFou0LTGLZKK3pMmkTUkx0sNlRI7KUIvWJPOyQxkeLvpnf3gWsUm32YFF+FHtplwd
	0IoGzTXcpJb753IvLBA9ORJNu9gOoZ/59DcHGFx54myz4dZLUyxbA9+CuHATyiyMmM7vhoDKk0D
	HlJbWrFx73rFQDkM3uy+WoseZWCDLCe4qRyXZsWkTtBZMGVvsjwKmvekCBtvO6bOzTbFERDVVu0
	hH4lK6+51bClZ86F0UK+YJjW5t6xuLBd/4pPyJeUu/FFPMEmiRD71GTiGTHe8GPXrh5f3kQp4Wj
	Vt482SsJSbQK/BJmxhtbnuPTJqRtDgGRfzwyBR5hATFszKrtn83Hot7z62TqRM8FjfzkD0h7NB1
	8zxTWZpMZ9CM=
X-Received: by 2002:a05:622a:413:b0:533:9746:9a86 with SMTP id
 d75a77b69052e-535b325f8d9mr32241681cf.5.1791814096393; Mon, 12 Oct 2026
 07:08:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011223358.2327625-10-sashal@kernel.org>
In-Reply-To: <20261011223358.2327625-10-sashal@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 12 Oct 2026 07:08:02 -0700
X-Gm-Features: AclHuK84WqMsyxy-I57pRe8rAHj6B83pUNBHs476hJrJgTGppN2WMc_WLWeA8KM
Message-ID: <CABdmKX2D1obDASTm+exAtrZSfkLikUxmzKxjsj8avyfUbEcsFg@mail.gmail.com>
Subject: Re: [PATCH] selftests/cgroup: free the paths returned by cg_control()
To: Sasha Levin <sashal@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <shuah@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Amir Goldstein <amir73il@gmail.com>, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 3:34=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> cg_control() returns a path allocated with malloc(). The two callers
> that pass it straight to inotify_add_watch() never free it, and pass
> NULL to it if the allocation fails.
>
> Keep the path in a local variable, check it, and free it when done.
>
> Fixes: 5313bfe425c8a ("kselftests: cgroup: add freezer controller self-te=
sts")
> Fixes: 2de27980e1d46 ("selftests: memcg: Add tests for IN_DELETE_SELF and=
 IN_IGNORED")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
