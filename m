Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CC430AAD8
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 22:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785797322; cv=pass; b=YD/c1A+iUzy1zpgoFbUwbKMzRzACORdrZX9RkXAp6pJHeO3OgYe3DeCZ2iCRmas9FtSqF4dtPBYgXkH/seTtPqn6pSUNCWohU0/Mu0ZCzrwIpz4DHPNkQmzMWG9jZXi03PZh5O97KpzJS7gW3U37lKJTr1Kur/dLHEvXNaBI3qI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785797322; c=relaxed/simple;
	bh=m0g5xoqNpLM2qD/VcvL0hHvUgdZthTePopAKnMwVJX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTow9US28GxowlH32KO8d2+mkuphq+67kfMgI2LMM1v+OxqKk4v1cYtv5Ndz3ntC1e8NsEwYPRiBnvYFxCVgsIa9TTlDOplze4ZSoyNsfB4u7J5l4fIvKGaXZwFS4gWbnWrdm8NCZuriEXJzqkPrDBg0rdEAuF2cuHoEJXiagOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUSbP9aK; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUSbP9aK"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39f91ba1ef7so15269291fa.3
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 15:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785797319; cv=none;
        d=google.com; s=arc-20260327;
        b=V8jsfQ/NOKXtxPjxjYSeT/F/cHayLq1xbsyNBOiiyK82JHlcfVjr2keffySw8ERP+V
         wG4aiYxf9ETCtCN0mbA6uc8XUB8Afa3xMf5bMT4CGvEt44cBag9kAhpnkWMeWjJ4XUuL
         gMcrxhomac47Br+NC+1XR8RYRXzQHSevSSE6YjIxEHAfzxYSSIUcVBHzYDOLHMbmK+hw
         ag3AZPt6hFIF1DUO94HyaICVb6jHVS5m/7gJZzU0mZJ9SaMTNeIrcmE1WJa6FFWegF2K
         uUbj3LIiBO/LL/BOmybIFP8N+iGMVUiK98Csn1ZslKmobpe7UP0UjW2d19ntWhCVqg38
         +E8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SK+xt9c2t7Dz5MgpaRItEmQotjr7C5tngP8GEt7qorM=;
        fh=qAcY2dmPdIB5OFoiWzS1u2WPfjuO0LWJLnMr0efJf4Q=;
        b=lyqtykqpoA8BT34xXe/AIjjOXIGTU5jvOSwjuaHNyTf5KV0jCrj5tCPRPBbZQnFWdq
         W9ScyU+x80LJYQl6oNikMdoCE+V/nJbSQBj0C284QCdArfgVJHM0EZxXD/8cDzdX/BOb
         DbhGhEI34Cb0eYTxN02Rer7+GxyN3OvbDhzEVPbRC/HiE7WVxBL/AErZvrf5FQRuDTyt
         vN2TFxHunlx7j0zpzS9/xK2ayYQ4etXt9nliW8384NLs/aJ+YhT+XCfG0FAMEGzMftqe
         5nLZQNHGVHlg4ZUY7YZKiTcItuENFeJm4o3/SvKGxEKBc4r4iFzkr9SdQAh2piYTKueu
         2Dpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785797319; x=1786402119; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SK+xt9c2t7Dz5MgpaRItEmQotjr7C5tngP8GEt7qorM=;
        b=fUSbP9aKfhfo7LdFOuB2mDoTCxKQNcfTQOVgFoz0JlugT6T2hbID9Um+lBzrrELMnK
         0aEv+GnhKV5blnSc7RKIjjoTVEfx8a6MYmDVah7eHC4Ajm0tigMlJdVVr/jv+a9JzifN
         qiVi1reJSln7RkNx7HdTO8quxJmJp56qZLjwL9kDLJioA3osH2zWZp+giC3ciqwSs4V0
         RY7raRvS86rQSO4rbLNdZxUIZLigevKIRYqK2ElbGHLtTSqzylNLIkZVaASM/U9nEezO
         neyvSdGylHQWfP6K7E77NG2A5aadtUMpv8NBa4S6qJfA8DHSTpPCU5Mtsd8+n15EEk2G
         mqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785797319; x=1786402119;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SK+xt9c2t7Dz5MgpaRItEmQotjr7C5tngP8GEt7qorM=;
        b=UG6vLprvE3vIrmkGKw7SypuA5fQ4QiH2pGR+63vqYrge2I2djZqO0JQMMUdZJLb1W8
         OLaWz8AF98mT6O6CU1PZHJJdobkY/ZdHUK/LYpQCHSiT07kHqctxmmPjOBO1sj029ymD
         wqe9tSXHAcg6Wmv3YxGHoXUDJL8oAWbbMi/usMbIWzbwF4wUY13V90cxG9Tvy3BS1Gjp
         E/J9pT3UffF0XtL4lxbVKH789ujACDIZcEKI05HehwK5WatA1t9gtFVzzDcjx3xTTHGk
         yF/cbCuvgJ+ToY1IeriZZuRrv8JLvAYIDh/v+SyXkJORELXLofuTQiyri67eP8EpgfYO
         8VeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr3aDDPFM5JeKknw0Q1tynxrp3PF5isgk/rihEdlVlMK66tyqR12O6jWD5GfgJXN2lBZcgUSGBF+Ddar3Rh9e0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywytz/LfrA/LOgZ8GijGmMakw3KUckrDtfWNtPV8Z2SbjpY/F5T
	JCSzd2+tQCCKvScOYDyaGz0+7cmBCn8n07W7XmhphRgUeaw3RYnb+uC0rdskwL2COW+dSw2ynOo
	9Ygv/JUuIV1vE5SnQUgWNdcokVMyp0Gk=
X-Gm-Gg: AR+sD11R6XpfiF5gAvd5hGNbPb2oaPTa8PLp3zHfzBgMDsnh0XGKyw0OP40b7MskQsS
	YNus+t5dWc73ye8FXzZHKHsObdczSGpI/GReUtHswDPyh+1TnsxIkFW+aeSl5vzRclUac5QhKd4
	NzuOpr+vngqoRE9JZWBWyQNaZ86Zbyf+QLXfGOwkXrHFEVvMQuwUOEg8oYJLqbSViNAJXeAMSk/
	sWiudrheGg/0aefVmAommkKLKwxMrLb1LjQ7kNYYjZ1u+ETUnRcuAMWc3U8dtjx5fkVIE4V4O9r
	4wrqgdJJO7rLK60J3Vfon7ddQvUlPiWyQnHbpkCGJwmO3X4=
X-Received: by 2002:a2e:a802:0:b0:39e:b3b2:e95f with SMTP id
 38308e7fff4ca-39f861482e9mr26137401fa.18.1785797319098; Mon, 03 Aug 2026
 15:48:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803112218.3361213-1-dingning04@gmail.com>
 <20260803112218.3361213-3-dingning04@gmail.com> <CAMB2axOMcg8ZKPR8GOmeOuKUyDKZ9WVvAgJvRU5kuTm+_tOcvA@mail.gmail.com>
In-Reply-To: <CAMB2axOMcg8ZKPR8GOmeOuKUyDKZ9WVvAgJvRU5kuTm+_tOcvA@mail.gmail.com>
From: Ning Ding <dingning04@gmail.com>
Date: Mon, 3 Aug 2026 15:48:27 -0700
X-Gm-Features: AUfX_mzulvW4HccJVaxHXbapqhhPQNo_uODl-w5bhtXCwfU5ctgtBpzcTG-FPHE
Message-ID: <CAJP4iuvNNcaHgv4T-VmD7ugLkHo7V5nz3ibCdgg6C=jxrkOahA@mail.gmail.com>
Subject: Re: [PATCH bpf v3 2/4] selftests/bpf: Test refcount_acquire return nullability
To: Amery Hung <ameryhung@gmail.com>
Cc: bpf@vger.kernel.org, memxor@gmail.com, greg@kroah.com, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
	Viktor Malik <vmalik@redhat.com>, Justin Suess <utilityemal77@gmail.com>, 
	Leon Hwang <leon.hwang@linux.dev>, Kaitao Cheng <chengkaitao@kylinos.cn>, 
	Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +       tmp = bpf_obj_new(typeof(*tmp));
> > +       if (!tmp)
> > +               return 3;
> > +       bpf_obj_drop(tmp);

This dummy code creates a temporary node_refcount_only object and
immediately releases it, the actual bug test starts afterward. Its
purpose is compiler scaffolding for BTF: The dummy bpf_obj_new()
forces Clang to emit the complete BTF definition of that type,
including its bpf_refcount field. bpf_obj_drop() then releases the
temporary object so it won't affect the actual bug checking code.

If we remove the dummy block, Clang might not include the complete
node_refcount_only description in BTF. The program could then fail
during loading (e.g. while creating the map, since it can't validate
the kptr's complete type, or during verification, since the verifier
is not sure the object contains bpf_refcount field) before reaching
the actual test. (whether it still works depends on the clang version)
