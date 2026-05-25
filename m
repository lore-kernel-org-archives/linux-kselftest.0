Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC5C22CBD9
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 18:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779732486; cv=none; b=PZdsBU5RIUbx4qT04TZNQuMH/RqhmpxzzWWUdaIpmDkan5RasiV5KGISf/GLUz6ymJhQZ+jVXLHs/geYr6HU/lw/FhKIu3MArZWVMhwOvgT/xVQVYdctW6QpGCYeCrBTI1kTQFbpwFXz1iVNvB3zOH5/zqjPBuyCvvXgNesZys8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779732486; c=relaxed/simple;
	bh=PSciALuNvGrWs88r7F4K049CO3zBnkyID+QEXAs1Qgo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=oSfV5jM9Xc3SmDm+t98WwInmx14O13OzoAjXt5M/BLJS2xBCIEe3Gin17V5JLedGlHEUHPOUaU/vE4q8t6PG8rA2rSz9xUi6pgBGR9+NejjVHyaU085+pZilVmQ9anzz2EbBXXMCoLXfdEEHDqG6NkEuLskS7VJW7Mvb6wb7ePI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=01R8lJiz; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="01R8lJiz"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-132830d8281so209993c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 11:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1779732484; x=1780337284; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeKtJyL4qopbQdbdTa3wEz99vvwL45rCmc0Q/Ksb1lY=;
        b=01R8lJizKbHvKQ976TXzWmLaV3TwR1GwAVcuQs9ai0eXLu/cnnCt+1zcRkalsOABBt
         JHelCE6yT4GTQoQalUkkeKl6CfPQEWk50aBiVrQ3NLTqZiI7gkLqRbEj6zXMV7fooQk4
         MI7dQYGfgUDwbpL1vszBVRLqly14Z3ZcbDw0tSPGF1erHN5aJxaz3URH2xTMLDu3HbJ7
         bPZ0uB/F9XSmsV4/NJgm77bVbFv1Add/czaASebMLjvxtquyE3GSc6JaZojaqT9X1/Nk
         hq/wliTAKoptCPfSzdhDLQ53WHjdwjQjlYwjNtnU9kWclC8Nq29/MaRz64vPVjqyfqQe
         du4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779732484; x=1780337284;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XeKtJyL4qopbQdbdTa3wEz99vvwL45rCmc0Q/Ksb1lY=;
        b=IYC0wglLbfUn2ptQ6+0bVh1T3GUj7fog0EWy7t6BuC1RgOnHQUjZt5PnG9fWT3E+gI
         FUQdwr5k4mBsJhVGSLzKOjkVPjkY9b9m0ht5MAVqGqDD233tjERsgL9Bd6B/V+3IGA/h
         B4xrJDK9qko/Z8k2hdHpyPW2peGu13Gt+kM99TJ0pycVX34YQIL7kA+lnG0QF+ifeIQd
         gSqdj2dZAaQ9y+0D0C59gTR/fVJ4Wxzwn5USw32hq/QKI77UgfmuP5bU11dHAHJHDoqN
         68RXy1ejw3y94BWGwfaWZDEFZXogeSxKcA/W/Ou4pia8qglgLe8xLwKNta6XqZ8CLEI5
         PQuw==
X-Forwarded-Encrypted: i=1; AFNElJ9pP7JLNYideaMaThUgi8/FAshTDBWgqJkSnNP5orDPTZarcD15UUGvLZR+EGBMll62HehXfinlqaMEvhaRSjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIAUo/furz+cIexWsEuBTF/4Cg63/SZ3Q19tQzebpjybshuuYB
	AusFoG8ITKSFR1FRMYsbdlG8xG8Z0Sg2N1Xf23EO58XjsbeldZPE9k0rbC+Ks4Lzjsw=
X-Gm-Gg: Acq92OGyL4jyGqUE/jmS/x3IDDWYWWeisW0RIomAmaekk3ySIZBckXiwvUYtVh9LnDo
	abg2hC78RC9CzEqkR34kHVY73gjhblPphiT9J3JO9hD/5sWA0MYtGF+mbPLi2Tm8LasHjfZE58d
	n6INF+FDfnTmYoRbTgF7HEmdVLojC9AXuUW6/kEc6MmLbh4UCNXeYf/0lCslqnbCsuBAIXnfbuN
	oIUzijzYNQAWDedfR0vHQy7/3t6m+VY5sP1FgFCanecB0fCdZeBGyN4lDYj7+KtGxV2pwFDBEJn
	C1TSiaHBYnhL9axJjVv9+I/czRqWlXuv+ZjsTDz9w5Nwwh+d4s8GRFPcJc2DmHwWkvFs4gOKQFs
	mbI8qc20kSQ29BrEJ1el1N1XoviMd6ae1K2rNBcPzOyyppNteLepkSFTqEIOhLssalrCqjmZqTW
	6SQ1JjQnIUU4oJvQ==
X-Received: by 2002:a05:7022:781:b0:136:fabf:2ffe with SMTP id a92af1059eb24-136fabf7b8cmr1074469c88.22.1779732483712;
        Mon, 25 May 2026 11:08:03 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::cc2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366a2e672asm8079161c88.3.2026.05.25.11.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 11:08:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 May 2026 14:08:00 -0400
Message-Id: <DIRYIEOYQ7TB.2PJ67IVMPH1WI@etsalapatis.com>
Subject: Re: [PATCH] bpf: replace pop/push emptiness check with
 bpf_list_empty()
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Suchit Karunakaran" <suchitkarunakaran@gmail.com>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <ast@kernel.org>, <daniel@iogearbox.net>,
 <martin.lau@linux.dev>, <memxor@gmail.com>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260523183422.124105-1-suchitkarunakaran@gmail.com>
In-Reply-To: <20260523183422.124105-1-suchitkarunakaran@gmail.com>

On Sat May 23, 2026 at 2:34 PM EDT, Suchit Karunakaran wrote:
> Simplify fq_flows_is_empty() by replacing the pop/push based emptiness
> check with a direct call to bpf_list_empty().
> This avoids unnecessary list mutation and simplifies the code while
> preserving correctness.
>
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>

Imo the new code is way nicer, so even if this is a selftest the change
is worth it. After addressing the AI feedback feel free to add:

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c b/tools/tes=
ting/selftests/bpf/progs/bpf_qdisc_fq.c
> index 1a3233a275c7..3b05ac1d7c77 100644
> --- a/tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c
> +++ b/tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c
> @@ -197,17 +197,13 @@ static bool
>  fq_flows_is_empty(struct bpf_list_head *head, struct bpf_spin_lock *lock=
)
>  {
>  	struct bpf_list_node *node;
> +	bool empty;
> =20
>  	bpf_spin_lock(lock);
> -	node =3D bpf_list_pop_front(head);
> -	if (node) {
> -		bpf_list_push_front(head, node);
> -		bpf_spin_unlock(lock);
> -		return false;
> -	}
> +	empty =3D bpf_list_empty(head);
>  	bpf_spin_unlock(lock);
> =20
> -	return true;
> +	return empty;
>  }
> =20
>  /* flow->age is used to denote the state of the flow (not-detached, deta=
ched, throttled)

