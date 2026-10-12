Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F09E470E89
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 14:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814179; cv=pass; b=Yjp8j6/0T+PyIyfpIOi8Ssq03XKmSNEsfHr+kvL2FF5HDCLJYDmTLhenUDqNDtsENEf0a+iGgGuqvSJCwmnURCWG7qM5XwCoi580Try/8JCVIbZ3rSxHNM9sWyjNVHb0UkQn9e8L8IvXQyuHKI0QhT4A4ugOgV1QOziSMe1yjqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814179; c=relaxed/simple;
	bh=f//bn3Au1jT6Q43njaKS85w9HYMFtsLKrhgAT3zEK20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AlKi2Tq3WFFFN4fGmCk73g8fFv5fodMBQqG3EvnzL3ef88s7UfFM7hBp0H1AkSocN0NcmBIwtdlh5n4uGIRxVhUEKNVqYqY8n1ey5eKKWu6PoQzblq/0I8HAVtU3IC7kLY5h17BzHFhAcl4k7n7UX21zqiG/DRXTl/Qzt0ZBIDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D3xm7Npa; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D3xm7Npa"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5337fa12431so388911cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 07:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791814177; cv=none;
        d=google.com; s=arc-20260327;
        b=Lo3lpDor7g7cC8xxjvRgmhxW+YRnYSSOQO2YMAf3VjQTnq7mVtyaDpzR0yW4IzscZ0
         GCi7D4Zz6cEM1W7hcVGUG9/L4zgU3n8JhAgXv6xONjhNtEq2DHwlFcn9/TyaU6oS2wSH
         fJb7sfjIyNY1SaSoXxaFyPmHEi6UACjv3OXLdmZ5HAAY5Ws0kNyJz44Hda0HwBLH6jhL
         DCEMPqCxR/1cpzubi1azgN3dFQEapoYiGFYEIib5p2aVFlHk5eM4vjbCIxIRJHHc0VX1
         JxsSU/hy/9yAyr12i51SydB9FnpGZPRK1S7WooOipUd0ffU0WPMCh5e4anJCexnzsCV1
         R9jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=234EAT9IzNiTaPSt/Xe9A57JM4OoTLyfezE2eXJPMhQ=;
        fh=pnNu5kJl0OFxdG90GJ/02fLYyf6Rbi9ucfnYZO05URE=;
        b=aPipB5ZvbZHk7s3tYx7QKKteh89boisUBVTMyqhPhGGwLOVsi0B/425xihJvfmgozJ
         bJUzT5Maukrca4tpUak03+jhlPhEcifB6MO453BnJuJDHaoPK/Jmbqry+ZEuUjKyrFy6
         d1UxVyUhvsm/6SywNyOwEkeLcC/5Lagk2VyVpXkRtxoKRJekKUK+OYqgv1mMISeNGZ6z
         U0VgNOhBiOXndkV7Bk7P5dYigIu/Nvf7fdJ9zOws1c7IOuFARK1bQFywiUXs1PuzFaaa
         68qljc4x1K5HG0FRLH7Ay53MR3ubHr01zwq4YNA250pHOi4cfKKWXs6+BnyuMZCk8C3v
         ZWtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791814177; x=1792418977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=234EAT9IzNiTaPSt/Xe9A57JM4OoTLyfezE2eXJPMhQ=;
        b=D3xm7NpaDHEtO/HB6QtEhOfS8W3GYYV+LWrxBdJTRlqjfjvC9BOx9iVpOm0xqTcSZP
         ncmbpWNbE1WESg0H6jnfDM8j7to+0oOuz+Ojjd/TtA1pwBJ97Trft86WWjkamOIA/fHn
         szx7pBQcqETdY+YhDQhIlycPFxdqsIqpdp9EATqRtMY+wscNOOG9EtPZa1AUukXLQHBz
         04VES/X+BBT2Kbpk9hoeyn+ppqqrAsi6kH46VseaBWm2jHGnErjl73K0OfBJmnfHWsiL
         TlLkws8hMUoF0oDldlrfJIrtth5dxGR0z2KEtwZlpO+YgzN5Vjr7NVcjZnjoH/4koi22
         /QGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814177; x=1792418977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=234EAT9IzNiTaPSt/Xe9A57JM4OoTLyfezE2eXJPMhQ=;
        b=vU0gblB8wXuIhlxhVelAJn4ABm4Y/0jRWpemePJEkWtjd5ZIGRnJf3+hAp6WYevJlK
         TyKmfuPOI0yL3P2hMRPY2IfxJAg9w4HBFGxqIZWxIcXD8xrDtWS1XrPQyUrNWXWeStjn
         +dL+MZt8svlJW+oIXMMD7yN+kjBmm1sjf2ckYVB9WiaFcodTUSpIF147WtxRKpItyumi
         yyTyl1uBT690uHMuyD1XCpikaCB8JExNzyLkUoKr9mgZ09SdLsu4FrxNREEWmdlU2J5D
         aoPvXLH7QWrCCzmMrAvBqr6JYwrhtrdgSLmNYJwv5/j6/D3DZOHtTn+Av1kcg2b3TlIa
         x8Sg==
X-Forwarded-Encrypted: i=1; AKwUvBw2R++WIh8AiS3BAunigLwbaQZSz+aCd/b6ozYRRQv+H7mbv98mTlSC2SUxtQA1kpLBs/jQ0rufPsYCXZ8g9Lg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQuWFzsiVdgdhyZQ1/in3gaDrH4sTPyw2G/p5laJVQz8Ke6rmA
	2EGQ87qbWrSXtkKMtEN/IRYq1BHmiLI0Dv8x/gdO8aN/krX9CIqygEvRE3Iam1ZMbSUwgZenM86
	JKilqFmw3c2AaaoAo1uIkFsYHQvygKf8KTop0gNvg
X-Gm-Gg: AYBFou1fYNHlrfdoVGEQSgD191TxAYTiBhnTz6DS8OG1L3Hm7cWkZp7EFI1ZA0Hv1Qc
	kcHW0MkV2PEqi+yn/1MUOLbXVxTHDTHuKrI1VeQ2DCnEDFiP55jCm3ENo/dEHgGm1z/ou4lwgU8
	VI/kuEeTNYpnQIKu5h3vHMYgTjqdN2JaC+mAUxl7lTSn0OeZ5Mqt4od5ygrNgVBZcHIuQEzvrdW
	gpl+dOPYbYi7hlLSCzRqESdQpp8s3yuIKdzxs6dj/dvdCYU+Yb2E4GeBf3uZrcNgLZxIYRXBv7r
	I06MjsiS2smLOIyQrC2mLvSD9w0RA8Tbj/n1n3GQHwtMO745vVbJPzmx/i4tJPZgnzyTDlo8Lzv
	YEsT3/aFfRIQ=
X-Received: by 2002:a05:622a:580c:b0:531:282:6560 with SMTP id
 d75a77b69052e-535b4fbbfa8mr31251691cf.15.1791814176455; Mon, 12 Oct 2026
 07:09:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011223358.2327625-9-sashal@kernel.org>
In-Reply-To: <20261011223358.2327625-9-sashal@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 12 Oct 2026 07:09:21 -0700
X-Gm-Features: AclHuK_P4xsv10L2lCkSOtMkvWLnLa5t9EHv_n5RaY8Tn_1YY4noJVhURld5zAc
Message-ID: <CABdmKX3+V+kqgC8H3MHHsawkTYFb7ebJe8pO7uRS6-i4rijwNA@mail.gmail.com>
Subject: Re: [PATCH] selftests: memcg: don't close an uninitialized fd
To: Sasha Levin <sashal@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Amir Goldstein <amir73il@gmail.com>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 3:34=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> test_memcg_inotify_delete_file() and test_memcg_inotify_delete_dir()
> jump to cleanup before the inotify fd is created when cg_name() or
> cg_create() fails, and cleanup then closes whatever fd holds:
>
>   test_memcontrol.c:1685:6: warning: variable 'fd' is used uninitialized =
whenever 'if' condition is true [-Wsometimes-uninitialized]
>
> Initialize fd to -1.
>
> Fixes: 2de27980e1d46 ("selftests: memcg: Add tests for IN_DELETE_SELF and=
 IN_IGNORED")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
