Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1E419E98D
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 05:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772775041; cv=pass; b=es5pNaAazJZH9mE34hI06uCHb6FvLTQJSz5rjFXeVf45BRqqCcV1S7TLrQlp3weLlgTWekveLZ3hS0sLGwf1ibfornojSMlWMWF2u14tp50oYUrSkeuWAgV8QtPvaoK2fBR4uvWXCJX2xr2NiXK4QmINPtKFd61hbl0RzF+QsbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772775041; c=relaxed/simple;
	bh=AWGhhnxNa8/lqkUCLrnUcXuM6cvCw6BkFJLMfMuM34I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJ8LdI2M8W0hO/JV5sxZ60Tc9luz28D2iODf7O4qZneVhxsaxxpCTjS5a7qeHt0Qxw8YwcFAHispNbEJNmoWRCAzAPOrGfeIL2B354hibadPzD9S5pdA34u43yOBqRJs1dwyFwLLT6t7SRu476IDzLzMCPl4JhyZ2T80MxwWUrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n7rY+qlj; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n7rY+qlj"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1273349c56bso10980540c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 21:30:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772775040; cv=none;
        d=google.com; s=arc-20240605;
        b=gYV95n6pNIbZCoD1vXjVXqgF87KFD90j4jl8CqqUGVrixJ8tOvxVlGVfETB2Yy5G8n
         tFTlfXWlVujeZs9T5diVCO327dqD46OGI5Lry8HIm+HxZrdBr51fCGbx+yKJ/A5T/gLu
         T4u+mUDFDkKCBWp+iNR6LZdw6/VG7bvPOyQlegvp8uMiHvsD9egOsAdRlZqi26wq8JcK
         6T8UOT85I41H3d/hLo7KsNq+3BLxathB71+tNYjlxjWbltocJXJgYd2SzBBt1AZfjnrK
         rirRuXd9FhfJDUWHznKqn6eAh5LG0qLShMguCPa+wxn/aalLatu3UmFSbwE796iHxrPb
         LSEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AWGhhnxNa8/lqkUCLrnUcXuM6cvCw6BkFJLMfMuM34I=;
        fh=r4hswzgkPM+tv8obpRijqF+BK+AqSN7tRm447wQj79o=;
        b=kbdodDbsRWc1kRUoULO2ZyitUVCq+bjLM0SQvG/DP4HiZOmdEK0UMLhZRx4pDoLtki
         B18Y43lqSXXiR0U0POoTMY0j5ShVGftk6kvUg6oPxudS0QMpzXIbmeCsmcoZVzkrXkjz
         5FWCzwgb1GqCCwIAOUtdouV6fZtwOD8OIrlgF1Nl6qwd/i3zF0DdE0c1Y0UqLgjqMWg5
         4tTHemlG03M80sZeG9LMLC3QPgTja+L5x1yp+tHrljTyiaI6AfJWuZD6L5gGVTOLf2aG
         AVSa/Pvw343lIxIipjamrz/rW9hCpEv0uYiU87GzK4318WJpbYxPDlq/4/sEbwAB2JSb
         kpBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772775040; x=1773379840; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWGhhnxNa8/lqkUCLrnUcXuM6cvCw6BkFJLMfMuM34I=;
        b=n7rY+qljZu+gNr/jg8/Xf2rAwcD38K7KWMkjDOY+RyPTxUKzGTHBhKiw11Xdv31VOq
         de9fBXhEYmuVnQsPfzfit3y+2Ao239L1mpxl3Pyzfa5sQY+E0HrwawSUQJSLyz43ZzTA
         PhafU+MBwH7mQZRjUY9KUuzxx1r49YnP1p+qNz86ABaW/kV8YFAtaRyQOgLE1FLvbDOS
         uqb2DZtK+G7qre7uB2XWIV66VPYOop490DRPlL12n62dVDSZqPlfQht3hizjVB5rBTj2
         j7+brbfpqyTGMwUN8BiGRuXfetXTnrb2rX1Gjrpk/ztHA09+r1WkN7LYVUEgzILyTnLk
         ZrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772775040; x=1773379840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AWGhhnxNa8/lqkUCLrnUcXuM6cvCw6BkFJLMfMuM34I=;
        b=JEJ6XacHAIxKCgeY1MnMwRDgY4PHyRIXADEXPSdOac8orsQxf0x5ITE3aqVTZ0JXKf
         Ks+Hr3KZwGXPKDyiaWwG5SI2yyg4DYEJEw9apgXC0Jc9a6F5jFN5C4DtpV7mGkMrKIj8
         yApzwWWQOOprRNFHhBgdLabBuzanHh5NADHpwrEN0tOnjixM5sm+lAHu8ycf3T7H/hkO
         Rv8rqd+WZEP5cH3lN9csvNW3tH6XrpIXUAAItnqk/mYERw3Y3X8H+QdaJ95Vo7BAJmBJ
         Dzhc9lK7QljzxFlHboVpa+hDBgj0jBzI6JBePY4pNIb08rw6w6miPIS0NfY+qC/VeGNM
         1Nmw==
X-Forwarded-Encrypted: i=1; AJvYcCUtHl2CepjvcTggE8VWWCXbHUdRGFI33Moia/io1HAlrlOPY9DCAKO2+lrTv6IMk/gacTgPkDOB0FEgFpam9NQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXfSoZQimkubvNOlIEMR8xPH4SXa105ThoetFxsOn97m5bz2lG
	ZFdqC4G7aySGnKUKTtHpjPHUVrXc4vZmC00lqD4W8OgY9p2sG4K0j/i8r5aOB8is1K/tZfmeIOu
	rOsibLIDAdxRKEih2ec38W0Z3Rsq69iGKNegSQSGB
X-Gm-Gg: ATEYQzwg7dSfdzef60T4+kZm3QhgbgWK9EcbANiBW5f/u/ZnsoUjFDCCDrQk8LNZgQj
	uQVut09ey8kKmzROQ6k6nr7Y4UZC3NoaSnLO+CrulzfzWF1SpOv/VgFxcJG+nx0iLSLNTzKFb7A
	s4Cto4JnWhQYAh3E7T3KCgdc//IhtXCG8k83YE0+ogTg0sZRF0ebgPHPquB2iJbRRtPKy3NC4Du
	EL51B/rBuMBrGpFWAXurNf5D/s9YpapvLsI9kKB9QrqPQjFkjtqQRq6OY+9EH/3iE5itKZaovJD
	zZEu8LVINVgbhnkeO6fXPlQVK53gh8jBHd6PGgnlegqbOAYufbr1QmYwrBx9NFlIo0Zl3NyaPGE
	2iQNHTIM=
X-Received: by 2002:a05:7022:6b86:b0:119:e569:f60d with SMTP id
 a92af1059eb24-128c2d8fe00mr474098c88.6.1772775039009; Thu, 05 Mar 2026
 21:30:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-unix-proto-update-null-ptr-deref-v3-0-2f0c7410c523@rbox.co>
 <20260306-unix-proto-update-null-ptr-deref-v3-1-2f0c7410c523@rbox.co>
In-Reply-To: <20260306-unix-proto-update-null-ptr-deref-v3-1-2f0c7410c523@rbox.co>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 5 Mar 2026 21:30:28 -0800
X-Gm-Features: AaiRm50jkjo2D8__HZfvwOMuhiWP6gML_uFOzVrw-NUHlbujLc2OhzKbo6rD-x0
Message-ID: <CAAVpQUDmSyxGHuyZNGbsbadXBO3yG0qffaeA0y4AzQiSg4v17g@mail.gmail.com>
Subject: Re: [PATCH bpf v3 1/5] bpf, sockmap: Annotate af_unix sock::sk_state data-races
To: Michal Luczaj <mhal@rbox.co>
Cc: John Fastabend <john.fastabend@gmail.com>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Yonghong Song <yhs@fb.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Cong Wang <cong.wang@bytedance.com>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 3:31=E2=80=AFPM Michal Luczaj <mhal@rbox.co> wrote:
>
> sock_map_sk_state_allowed() and sock_map_redirect_allowed() read af_unix
> socket sk_state locklessly.
>
> Use READ_ONCE(). Note that for sock_map_redirect_allowed() change affects
> not only af_unix, but all non-TCP sockets (UDP, af_vsock).
>
> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> Suggested-by: Martin KaFai Lau <martin.lau@linux.dev>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Actually TCP path also needs READ_ONCE(), but I think
it's okay for now since this series focuses on AF_UNIX.
