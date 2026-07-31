Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8DF3451CD
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 06:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480382; cv=pass; b=T1+ongP6dCzGy4kSrxbIDkAaJ2GGZja9hrb7qK08WkG8RtuCPV7iN+OkNj6bJe2kiF6iVa5JZQYGveJd5x39/aBlMj1oeUYKkYBoO76srYQcCgjEvo+u/DsjrMAyjIUWrlcLQaw3oDNar1naO19X6m6y9SCd25zm+cVtBHZ2dCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480382; c=relaxed/simple;
	bh=qSWRSbOj71BNGeOr+HBxtLFfbntXDiooltzuw+HXglM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hcg1xjDOhmkPt8msz+vLPOA4eeZugodliLLSInkMZke0ig42/j3lJ6CVqOrD7fPlcHGyb8hczWVxkrdbyFkL1bMbcp3vW42npoRu3IJwBmidz+BXakeScipaA+M4gZGXrndZPTfxGLnIT8vFZchJ6ur/KYvd+P2naYdDMKiR+zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHnR1d8I; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHnR1d8I"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8484a24ccf8so60318b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 23:46:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785480380; cv=none;
        d=google.com; s=arc-20260327;
        b=cpUyx9p9AbBTdczuOzMR9BBwTPyEPk8o+3PHItcxqr9S4Bs6sTlWRVl+Vq/XJwuJtM
         fUu1tGmRmq0AmgAgH6FMAuIJA4Z5DGSCoaPbILiuSWVD83pggo42qLWFG3gtjtvy4v2b
         mwsGZyjXfCqcB0sEmKtGL0rSNY2twyNguCWePouRTV9yLYMIrXtOoc7N0e2jdiQPu6xJ
         vGO5XGPB3RhxncugLpgCRxerYM1+Ux2eqq9baH6jIlJfceJkUhDuTLwLgL5KFXn75mDx
         k9GP4teCXgwEQ2NJAmxj1W/3LmL+kwiZdsQ9D47gWL0U0otPsOdaVFeJiRcYpt4VDJOp
         +6AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qSWRSbOj71BNGeOr+HBxtLFfbntXDiooltzuw+HXglM=;
        fh=h/ULibNlMDUQ8vXCTC5phuUArUqD7H4RRQDRVfU/1rQ=;
        b=XyHv1HkFUO15u4XUWZtQOembP1GdLJBjOiHw/7oagu0e0UKU8v2zP5lNJmYMo41toB
         xdBTlaaq3Y1IzAniraaxzWiuomMujNMSSEdxg0tjGV1vVuifuG6TU+cWkus55rQyf9bh
         W8rIZofuanKyNjNcdn4qgW7sqITTgxDSfntfAbcVd8XdzF2wFDpADyx1XvaWfOioq8jo
         Jgn8GRH63IHg8FvHTWFXxf/fqAdbOAkDLmQdnPBywMuFZjwfVvgFnrULf34Fn2+I1e7h
         N0wCe9YOWrqKuV9c4oLK8v88Ny5uy5AU5dsk0+NQF6dk6Gun0OkO6YAx1RAtledVzFB5
         uyGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785480380; x=1786085180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qSWRSbOj71BNGeOr+HBxtLFfbntXDiooltzuw+HXglM=;
        b=QHnR1d8I/TMMKJbGJJ3aw8izZ7RG5URa+aA4KhAZbDqkJRLAM5u4XN+gTfEheCPRqB
         2KMZipuxAp4b/k4FTiHsqZKYgtPVQyY5mBzOSij4/2JFMQyMisjb8doiJWaGsIkBKgOu
         svJaHDM83vcM4tByZM0OZxbgwcmf1awtATooPE03M8/RPgJGUd4Lj2eT14WW2vHwl8uJ
         54X3B3SOEB9R7nncrk8sPxZC9BeDLB4h2nFts0jSJTlrjZa3D+Deu3V+97jE4J1CfZ/K
         YZFqt1ZbXILwW6MbA2Z2rvJxKWwpkWpyYduUHgls1FbIhiNDInIIo0WBGPyiY8nRozVO
         4VKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480380; x=1786085180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSWRSbOj71BNGeOr+HBxtLFfbntXDiooltzuw+HXglM=;
        b=OPsdzYRZ3Is2/Du6TPDccNykbCYzKt+viZ2KqLG7WDD26dDsdm2Q+gMbEU+g0BJU0e
         pBJwM4yOSFq3MVm5MwaLB4F3W27Rm45STTSwJG/BZ9KPLsp31KRDuNd/kJitdyEzeJYQ
         zaMdsjCAG3gMEwHdMpWy2RHE60y9ljIaQ/Seazdxx+HYZcqyJyNsrFzFHnI5991jrvSP
         noxxNdBq5iwOnVsOYoX4/hX/YsPtEen9/FZtHA8QUGKt0PQjzRw+S5u7cWnlvnbqWKKl
         HMlKab2Cv2gxcCvOwelAQAtOuwJK/2PI7/TvM7qMZUek/+pyOL91CvF7bDuMpFC9ceDz
         3ETQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpkfq0svYXn8eLXxRYrj+s9V8lmHnO5CFpABMMj4fcdkiLMnd75w+2Ua58M5A7ldBBJTqXqq/nN4TRzVq34o0I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc0vks65UtkiLQrW835xp8zyzlcHGfJYZBhsaFIr0iah2FiQgg
	pH8DsjjLX8F/VWZ3Q/SEr1dUQJtJG7UwE0aoDF+291hW3voK/nx6rZiXbVGKUWzT2C6TWsaEbDJ
	ldELSczkvnG8lhIgCAQKCAcPSllv3Y2w=
X-Gm-Gg: AR+sD12ijK6hfPvNjMsWslVLG0WyUb/9Z2mXu9lgyS83FhKgqe9Pdt9s66eYh3KXr8G
	v7keh5tgDOPwKUORAomqIf2QViroEKdn2OGGEXZnyGlhT4CXF00PGyFImpX3ietblfZuSjlgBFD
	9wumZxpjesoUsYIgrs3LRlIxcWR9YCHoxvel9/LV2Y3r4PbOpqnakuMu+vENztseWOLFwdGivk3
	fiXEVbbeC9JO9B3xa5GMvLwsuM/5FgzDpOHoURnpKLZ+ekjp2E4trCkWydBSA4yaFUz0NqU4lSg
	rsgG+i31HPTeJDAAuxgU93TxaH4JYxnp1G/GZkenpRodFHX8hIVxmQBSBFa+H6wwIiY5AiJ45G2
	eeWHhJ11T+0H1fMYoyouACRzY2annOZaPHEzDfgb2AfoQ3PAlwB9qfeSgWnZA
X-Received: by 2002:a17:902:ce08:b0:2c9:b96a:2855 with SMTP id
 d9443c01a7336-2d046b459b3mr15748155ad.0.1785480380480; Thu, 30 Jul 2026
 23:46:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723-fix-fops-owner-v9-0-c1c3af7f7bcb@linux.dev>
In-Reply-To: <20260723-fix-fops-owner-v9-0-c1c3af7f7bcb@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 31 Jul 2026 08:46:07 +0200
X-Gm-Features: AUfX_my5gmBTyBxP6uEcBbaVDtTCrtAGlQbEryzjfR6FoeX2UBUc_vHFPgNtGlo
Message-ID: <CANiq72m59O-ruHUvUcZC7yCvu0KV0w_m5vMO4e0rxyHdRmihJw@mail.gmail.com>
Subject: Re: [PATCH v9 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Alvin Sun <alvin.sun@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 4:11=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wro=
te:
>
> base-commit: b7e5ac83cb16f7ffd11dc23736f84276602100ed

Was this old tag used for some reason?

> prerequisite-change-id: 20260519-miscdev-use-format-9ab7e83b1c11:v3
> prerequisite-patch-id: 405b334ff0d48ad350014f05a2321bdbaa025400
> prerequisite-patch-id: 604b631c81d5423f4ebb2e12ba2d22e9ce371bfc
> prerequisite-patch-id: cb550d94cefe01920e0d3ced2b2bcbecd76f3907
> prerequisite-patch-id: 3bc830839742591460cb86d9472c04f4686dc600
> prerequisite-patch-id: 571058244bc8c7088638d2e3225713011246c7e9
> prerequisite-patch-id: 347c5a3c6dbef9832bfce8419fc23e6e08ba477f
> prerequisite-patch-id: 3e202d988b56b88446f7535e90d3f00cf5f15701

Are all these actually needed? Some seem unrelated (some were already
applied too). The only one that seems needed has Andreas' Acked-by, so
I guess it is fine.

(By the way, I will use this second message to take this chance to
move the modules maintainers in the To: in case it helps, since I
didn't do it in my previous message)

Thanks!

Cheers,
Miguel
