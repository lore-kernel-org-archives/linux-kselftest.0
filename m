Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621E03C2761;
	Tue,  2 Jun 2026 08:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388027; cv=none; b=AalH43MTkPf9LPC8aoe9BNtXwacfU9WAnJavS7EHrL2uNEY9uYfeK6FJlRsnL2WWDeX54LuVEx3K0HM4J7DXaHhJFAEIenGOk2bRY8fabUOem9u5bAPU1xI9wGnw43WndbC/OwIOaAszHI0MPi/8J8aZoFKINfc5FkURtsCxQXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388027; c=relaxed/simple;
	bh=23B3Nacq6F0PdZwEoRJ8juB0iVGL7fVaHC/fRT5w2n0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=PBjThQowKBgmbd1zwGeFXQUCab+gAy3JTyYwwOOlCv0ll4sLXRpPbTI11VTOV3WNxEcFU9WbzyAvK7HQgd8QhDwH815UcIElPZRQ3eyaq1lC+kM8DMT0dXQXxIl1jJXNnMMTqy8qWZfpj7UOU4npwL8EXMLWgVwHaWbcyscideA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5l423uq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5l423uq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34C81F00899;
	Tue,  2 Jun 2026 08:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780388026;
	bh=BW1Jb2lq0jvXU9cqHaR15Ee40aqegmEDFgHV902Wtbg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=a5l423uqgUs0EnF17yDerxYDPl7bPFNzxgCv8msMDTwa01f/VlMfU7kcbBQbByAy+
	 ZwI32LGnWXeITmWZegZCxOgODqaUVPz/jW5kTsJQ2Mnli0wa9y01znNa3fQc6+MtMa
	 zyfgkW4jmI8FrFU7tn7XpS0RJqn1PJwZslDYp8Y4vSxwhG6RZOdHq5U2lArsPGX5GN
	 324Jl+5rfjq8um7r0h3M+aVRP3yd4xZMwbTIsWCuZJ6VGUmWUv4PAmIXFTK0zM/NoM
	 s4nstGFOtfzqOBMk0+1o8FxKpOqXV6yrrJpj2Ooj63CKKnDAgMnjfOBMY28ISAEI7E
	 JXXV591Qj/DFg==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 02/13] liveupdate: avoid mixing cleanup guards with
 goto in luo_session_retrieve_fd
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
 akpm@linux-foundation.org, linux-mm@kvack.org, skhan@linuxfoundation.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net, 
 dmatlack@google.com, kexec@lists.infradead.org, pratyush@kernel.org, 
 skhawaja@google.com, graf@amazon.com
In-Reply-To: <20260530221938.115978-3-pasha.tatashin@soleen.com>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
 <20260530221938.115978-3-pasha.tatashin@soleen.com>
Date: Tue, 02 Jun 2026 11:13:34 +0300
Message-Id: <178038801485.119771.9514973100282773342.b4-review@b4>
X-Mailer: b4 0.15.2

On Sat, 30 May 2026 22:19:27 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
> index 146414933977..8d9201c25412 100644
> --- a/kernel/liveupdate/luo_session.c
> +++ b/kernel/liveupdate/luo_session.c
> @@ -291,25 +291,24 @@ static int luo_session_retrieve_fd(struct luo_session *session,
>  	if (argp->fd < 0)
>  		return argp->fd;
>  
> -	guard(mutex)(&session->mutex);
> -	err = luo_retrieve_file(&session->file_set, argp->token, &file);
> -	if (err < 0)
> -		goto  err_put_fd;
> +	scoped_guard(mutex, &session->mutex) {
> +		err = luo_retrieve_file(&session->file_set, argp->token, &file);
> +		if (err < 0) {
> +			put_unused_fd(argp->fd);
> +			return err;

I don't like piling up error handling inside if (err) statements.

As we only need the lock only for luo_retrieve_file() I think it's better
drop the guard and use goto:


	mutex_lock(&session->mutex);
	err = luo_retrieve_file(&session->file_set, argp->token, &file);
	mutex_unlock(&session->mutex);
	if (err)
		...

-- 
Sincerely yours,
Mike.

