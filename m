Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A8F3FBEB9
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 09:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725921; cv=pass; b=VnT/aS9GkioZr/oS7Gg8iVN0nwUS/HFCrdlkjNoTc+/KEYFjr6xPv8iT7wr+9i8hvoeYlmowddcm9cQH57zyUG6Y6/Cz8kvbFs8yoBmjvdpyr5cfjkHTXq4uprw7rT8pqSVS41MC0CPWQJhakp09YMTTZKS0v8xKynKZzd64O8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725921; c=relaxed/simple;
	bh=0baEcWrjmejXzOJCA9gRgLFh8qlYszDa3Bn+Q3mqPvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xdzd33+yD3M5M979Hdw6GzwEvqeIVu5R7IJSom07m1UYa4no0rmBgz3QDGRVNHEu4LeWY2Blzff3ssrCPRJ/IIiNdFHv4BIzGK8Bk30HYF92npz6kh6ux93SmhaA6g3GIlShHtke+jMeelMnlqIrZOWcdwPbJpf0FgvRgp9/otk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSdqn9b4; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSdqn9b4"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30bb87c90deso361327eec.3
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 02:38:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782725916; cv=none;
        d=google.com; s=arc-20260327;
        b=CIPhxBzFyrBjc1f/HQgiqRPLHtB9gzl3DFIXpfthFCGofksFZThuXABdakL5/uxOOn
         RwazDEwokYRHVft9fhyS4zZx0K0Vg70LBPf4RbJsunESQKwbNkU82rOhuqpvprWEhP46
         mlWn3F1/Vy3nYScnIs958iVOrsS/iGcIjo3HTqYX17izq/rCrJchrzGYjERUy1WrkKvL
         mT514MIV8VR6SZslfxP8VjA47LgVjTNgSrYt5vE1EPWIKLOBwAOJ50MrHRS9lqWDWLbu
         GyDv+dxQn8cQ3qQNzOhZNfyqLN22g6zXSn3ve6udpF+Y+5LSYo1fGDj/hqb363Rcvv3i
         stBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0baEcWrjmejXzOJCA9gRgLFh8qlYszDa3Bn+Q3mqPvw=;
        fh=c71SG/7euX3pnfNJawJY91s1dFbx1Kz4UPnwVJyOhUk=;
        b=JXr50+e3LE1/WUNSk+ot9zDfCJ5MMqXcBtQzautjTO4Qh597OzNUwgVXpFl5Ao6fGm
         54Jvx0X2SDAEt3W5TJYcIWBOqze12NiBKN+QHqB5jEgSlS1bOcjVq2335v2veabEldLS
         F+Av9qNvsdyNHSutz+cE1o+IybRYi9we2xHIDaKGYVK2lL2UfRdz4Uh4ZyzcOC/d39K4
         DWXPL7IiN4HCD1lG+jsy61Q/hK0QIE9R9K9fk1t6D3rnMgWUQdSnEv+WkqvvfOKBjtGy
         QWuKL/f2kD2ZXSoLqbd1azcmVxVN5ssKTqP1CvmCaP+YsmF4zDgN4Hr8gNBydS6BTUTn
         ePCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782725916; x=1783330716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0baEcWrjmejXzOJCA9gRgLFh8qlYszDa3Bn+Q3mqPvw=;
        b=kSdqn9b4JmJ4IRxHrStSsXzVwe2mceTc8YgXVXf1I67WQkWfSPD7fb3JljLJSyGju+
         775KuywlCGlVYCe55vHRhdZYyiF+n5diwAyItuH1h8rTpMusOhe3cTObHA7N/KZaQXkm
         qOF9H8QCnDLuslT/H/cfd/KiuC5LTGWsBkk3++KqZ1rZN0FOSuRLvNDw6k3zPgfIHbCE
         zgT5AaBn3xOyZ3YNDqEuyzDFCCro/xdgNcQeHl16rbzc4uonWs5Sk96ZcRALVTB7EZsG
         7IFRxX23Iqk682c1xCuK1S7j3PGJQQiOBaBCCVXKD3TXxn7ggz5k1qtOsNQfaf2Z6ViE
         s0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725916; x=1783330716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0baEcWrjmejXzOJCA9gRgLFh8qlYszDa3Bn+Q3mqPvw=;
        b=pWtrJiU7P/q0wSMcTBzbGH3khYvGb/jSqQGPdUPqPs0nXiU1hgZGCxAH+U+ufn0ho0
         ouH4FQs58IRXCFJIgcJUafeHhXxSvqhJJaNNulGwmGPLKvJXSU7G3moBcMAUJK6I4w97
         q8WP/OXQ4any2l27oL6trOMcwXy6LUe88wUlV7YyWQ1X4G4IFGUsS7wkqspEoFoHKfp2
         ArL4lhCcgpNXAzzqVbl5p9AvfamHOrKX0HeyDsfSSJKTp+Z6kACqa6H0MItiG5wcQSs0
         /V2MQN45SeZjpJIfMazwboNEGFzeaLEHbsP5kydgDOLnYTHEzMlwsOCzzxr7J82N8sIQ
         uK3w==
X-Forwarded-Encrypted: i=1; AHgh+Rp6GN2I9bnxt2xexWk+WtZPpGxpawSBm3t7uuUWkdN933Q9m+dqfzsp1wy98JM+BJzsIwacmdRwqK6y9hBw3QM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWOejQNVUImTckczP3qENuGk7DyGgTvqA1vnTpRHXbHOwVuTLQ
	AZMYRKFTfWfEMgLRhe/Bwi6DUPTeAxWtymMhNJfW/4vpqfBQMGKvwoQI1VuUkgdaHBVuyMS4b66
	T2ueuM9jkxQZBcBJl6DNuukhnBsWIlSM=
X-Gm-Gg: AfdE7cnVJR8SUbj+TlfOz9uagmrq9lSN5AkyNPSFzwaGC6XHNeVXB+mA5lU1JKm0F6L
	ZpPZO9rVISkCNPeBiayk6HB6XYaGrRWPFGH4/DyNURGgVaLCCMpNmhvE9L+Wsq8SfkG7VwoDRdk
	+rO1PswxyLPlaIRFC11tDwLdR8fE3zCAw+G7CRd1qPKjLgC1MTNerjZmakOwBkSCw1KC6Zv2jao
	1toECfeQunS5Cqg8jU7mEPJwEmc14AUU82/QPsPEIUkIcNFuFqwmtE3Qo2B7RaJISVzPzeaZhWA
	DAaoJixWuSarTyvlV/+sJqPs5V68MUKENhW85M+clEhTR8WoTLzatM21CaY3dGmY/g/wNa4olGE
	ehFhocdvzecqS
X-Received: by 2002:a05:7300:e6c6:b0:2d5:9438:2a02 with SMTP id
 5a478bee46e88-30c84ad9f55mr7563457eec.1.1782725915854; Mon, 29 Jun 2026
 02:38:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-backport-cfg_select-v1-0-388d5d31d9d4@nikableh.moe>
In-Reply-To: <20260629-backport-cfg_select-v1-0-388d5d31d9d4@nikableh.moe>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jun 2026 11:38:22 +0200
X-Gm-Features: AVVi8Cd-mNVCE6A1aYsBrPZBgzhwLBfrMS9qm0R8xBziILhTrnWvbaBviPHRvC8
Message-ID: <CANiq72kG8k3mk+Xjr6q7aKg212QUNtZk5w4rxV=UGR5UXKE_ng@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: kernel: add cfg_select! and use it for
 config-based selection
To: Nika Krasnova <nika@nikableh.moe>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Yury Norov <yury.norov@gmail.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 5:52=E2=80=AFAM Nika Krasnova <nika@nikableh.moe> w=
rote:
>
> The standard library gained core::cfg_select! for exactly this (stable
> since Rust 1.95.0): one macro that emits the first arm whose cfg
> predicate holds. The kernel's MSRV is 1.85.0, so it is not yet
> available.

We can use unstable features before the are stable -- from a quick
look, `cfg_match!` (its previous name) has been there since Rust
1.74.0, with the new name since Rust 1.89.0, and with the latest
behavior change since Rust 1.91.0. (I didn't take a close look, just
going by the tracking issue).

When something like this happens, we typically want to consider
whether it makes sense to reuse (internally) the original (if it makes
sense -- probably not here) or "forward"/re-export to the upstream one
when behavior matches.

For instance, instead of waiting for the MSRV bump, could we already
use the upstream one since Rust 1.91.0? That means that we are already
sure we are using the upstream one as-is.

Or is there a reason to avoid that?

Thanks!

Cheers,
Miguel
