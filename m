Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EEE3AD52D
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 19:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784749994; cv=none; b=T3SbPrkk/fjGKhlwC02m+znFmU1gOGYkaBfzgow9SwAKc+NmftMPwy+IZcSx1IzUrjF4OiwsrJ2Ny6A2uOQc9dot2iOvVWJ/L0ibj4gmFtbrZI8Anixue3ko3H61AtJTmC+CqsL9tEPephlEuhcGX1cOa1L2tu0rNhIc+xNR+oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784749994; c=relaxed/simple;
	bh=ZOzjNe33N6WOv/F+Vqi9XJcIXpySIpqWA7L9PackUP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pwo8TxvHDiFiFe8KvcocK1PpiGzgjAfP5vSHo8z+noqTbhC2NKx39sGptMsh8NNhq2/3Ds9kbuQeIdjSf3KyAKrx0pl5drcpO8/QLxIy10ImwX0oTSdKsnMCPIs7gIMyyn+zvkNLGZtKjxwGh7pyEftb8pzX0+INAQ75/Zqkxsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W03tfNtE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W03tfNtE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD73B1F00ACA
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 19:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784749991;
	bh=jX3keiGfASMpUfc6WbdXTYn8yg/AOKhNn+GCulK3FjY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W03tfNtERQIKHqZKLT4oU2vmZvmUD36xDPWTIhyrXDd8U4L+o23awH6lNsGpfeAgR
	 CT5nBn1wK/oRYw062O/lJrmxAWQhZrX/7nArBKiAMNuusG29pUPCyckDtjjkUC6a6k
	 1hDo3v7mTkiZrPmMs+vhv1BiRbUnWcieCaUuCWa6frKhBR8rK9NxATH8wTIVRhL/fQ
	 p9N3ukyjoAE5I88Elw/ppSE3zPLfeC95p5H08nayZFEpQunbBgcAViftrBtzvxCWP5
	 fJmAa/K8dh4m8DtFS6bjWGeC3wdpLgFNlReRpJPdVKhqocUtSg6VpmxynwYh75kBB3
	 H61qr6nk8n39w==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c8e65e3f5so110065161fa.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 12:53:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqoDotihwV/kut27+l/ZTPLLFCnSgxwWDb9jtm+FgBcv0z89ScuPOOq+ZKJScD0WZIYaPg6HHEENQJ8EUw48tg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIw/EHvYRVQmVpUf52jxERJuk5kE2r/Oh7IN2f5x7mrTxpbmFP
	EhHs+MkausbZw9UhMTevU2adesd7i9fPLiCO5Xfx5PtH9x6ZaoW4AN3DME31QEDKAmcuFUy/s08
	M5Hx1UJwox8CjySIpK0EadVhn8xqNBDo=
X-Received: by 2002:a05:651c:43c8:10b0:39d:b717:622 with SMTP id
 38308e7fff4ca-39f07c806eamr193201fa.12.1784749990308; Wed, 22 Jul 2026
 12:53:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706143857.3306-1-always.starving0@gmail.com> <oz7lhcfan7rpy5ixlqlaea7rqjhagepqqzpssueai4qcwe357y@ilky5ez6eyd4>
In-Reply-To: <oz7lhcfan7rpy5ixlqlaea7rqjhagepqqzpssueai4qcwe357y@ilky5ez6eyd4>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 22 Jul 2026 21:52:56 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iVzb_w46mPfSZ9rXC2rVSXJ6K4cxM5w7aWGH4i+CP1RA@mail.gmail.com>
X-Gm-Features: AUfX_my4pB0trjcAkBTns0MfbQQLw9BYF62nfqgc8l1ImV90LQEvqv_HA_yIhps
Message-ID: <CAJZ5v0iVzb_w46mPfSZ9rXC2rVSXJ6K4cxM5w7aWGH4i+CP1RA@mail.gmail.com>
Subject: Re: [PATCH 1/2] selftests/cpufreq: Remove unused local variables from switch_show_governor()
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Jinseok Kim <always.starving0@gmail.com>, rafael@kernel.org, shuah@kernel.org, 
	linux-pm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 7:10=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.or=
g> wrote:
>
> On 06-07-26, 23:38, Jinseok Kim wrote:
> > switch_show_governor() assigns the current governor and frequency
> > to local variables before switching governors.
> >
> > However, these variables are never referenced afterwards. The function
> > does not restore the previous governor or use the saved frequency, as
> > backup_governor() and restore_governor() already handle state preservat=
ion
> > elsewhere.
> >
> > Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
> > ---
> >  tools/testing/selftests/cpufreq/governor.sh | 5 -----
> >  1 file changed, 5 deletions(-)
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Applied as 7.3 material along with the [2/2], thanks!
