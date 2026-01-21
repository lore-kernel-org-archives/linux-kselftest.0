Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD833ACA47
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 21:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769031441; cv=pass; b=Cm+tu6IjWF97DS0L7KO8WyILsnOERjFWaNrnoTB4Wj/+3NIMm/KzU8McEPzPrRopliAjVyl8sGRd3i8259m+ZtwYn7aUozJfIbzA09dkRJrBei/gHZba6LNmPT93LS8Vot1lmDNGrr6Ec4kFLdKzgTRq2/BaoVoZ5pNxxZMDo5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769031441; c=relaxed/simple;
	bh=8BuAgZxAafKQAQjZdQ8lCCP0+fbooluWmWp/sP3ZGtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQerVdstgs+Kxyhp7uHrgKJ4Iy0rOE/bmjcMAa9L+ICtQRyHVlOhaeP9ADO5slxB3LGseqvUe/dueOrM2U15gAswYfkvij0SGilDa1ZF+rsWHO7RtqlSn6Sj8U/ICcspd+SHpMWGh1f1xbvPmIHmQf3upEwubtxUabNzvEmdgOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DskuzJPJ; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DskuzJPJ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b872f1c31f1so38449966b.0
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 13:37:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769031438; cv=none;
        d=google.com; s=arc-20240605;
        b=HoR3FADNy9YOXzj2qfc3BQ7iZaosomJJZVJRsUeFh2Nn6vIwODqFoUbAedrP2ellwe
         7KjYQEnO3Ame8qhLaC90ysz5CeAuq3LhFZXMvdwBBwOiOKg09OUVHypy/wj60gZTX8b7
         saAbL+PKAb5S9Df/UCXG4K3rtpywHJhiVI5leG+MrITe2k8qY20xoDTffToI4m0WsOIa
         XRNpAr5YhdlY5nokJUw+uUIFWzZt59AxF3k4Ulepi3joWNibIxVPIS3IxOPNDQls9JBE
         eBw1Y/j2HYrYYGU5D4fEsDcBg0roR3FMh65zEY/6Bj8Y1fBQgTz5rUgJgY1vB/3R+dQL
         Bxtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8BuAgZxAafKQAQjZdQ8lCCP0+fbooluWmWp/sP3ZGtU=;
        fh=pPcuLB7lao6ovee0cK8ihmhA1ZTxaqQHlH7YtAg4ytw=;
        b=KvExcRsyPe4IwC7wEnTfsX3DJIED0ibtpuem2af9Zm/wwY7lLvyVtt9u4NX63KV6v1
         odRO29hmQiRoXw4EhQFW0FXfm+FeTSL/B3Dn6ocas9s4DOmdCCdWRiwXyb8eBvzidgJY
         Vpt1+1PgXo8tAnbdLn6+pBoTCm7LJ8P84OHOEB3yiOFYbhF78gS0dWZskeTQENvtBpT/
         NkQmanf5H7Ey6rBgAUeBbG3mOS67+kOg9ZCJ3e1VSw68Gl6Le3K5VOUs9OWWVq6WiQm2
         Ewt41tsW+mESh0CCi5oXvqn6ZUqcxSN6iKz83mcts/bJwumwN266oYY5Vox/IT4S8KAT
         VoJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769031438; x=1769636238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BuAgZxAafKQAQjZdQ8lCCP0+fbooluWmWp/sP3ZGtU=;
        b=DskuzJPJpOiOG6qD9pZIpl3mAZKIbFFDX4ebaqTMDV/S2hJJmyCtQ7NY9eBHSYKSeM
         21cldJHRmFk+dO+bRGyfGsZPR7Gei1PUG1gRCHygY3UtKCD5+czgKTXOWvWY1asedMtU
         3IWF6prr4a7HGr2naDXPhQ6Lj3WwFYPF6DKZ1/gjQvjUoK1oaBpO4K661hBVOOqlZhWx
         wmLFBNsMJg7gJdNlQPbQmLjxGEz6+DHTuuvw8xrkFJ2VTVUGNkO3RJSIRo2zx+P75Yea
         fEiPzvBsS/AWIgnhU5PriRHA1ncqHvafMOGHgwZ+Mng9E5/EVCK7VF3PLFcb5ZTta8RN
         T5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769031438; x=1769636238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8BuAgZxAafKQAQjZdQ8lCCP0+fbooluWmWp/sP3ZGtU=;
        b=u7biza/wUq+UAZeYTc2hU1jEUaiD+6JEMeIHkPquj6hfAIJ8UWmEnDEXAA/Tz4Lm3+
         5FUfAvKm5Xi/gAC6YAMueAjFAyE5mGtjjZEzesfn0FvVxWBYs/2hZRZIOyna5T47pOmc
         h61OsgVTtmhCgELW/B5+VYv/m/VS04kdWYkh2m6y+vCHJRnFpIBLC8+NYv0DF/845DED
         lsqEY38bb7T1fM0NEemG9iDzKlbyxufGJYtgA2fy8yG4fyio/wVu+mW6Z1qA0UbwucYR
         0qPvsWkRLAfNset963tg2yJWnQ6YYSAM27e4RAUv8+ppvOO5HXl64FCT9uRkfS8y2qLH
         JJMA==
X-Forwarded-Encrypted: i=1; AJvYcCUAFqZGv8bfgyrq8rjUC2l1747G56NURR+xOomtqz9vrQ05fPo+AoukRPCraK8eyLBYHiFFHHkAAQQpP4Q0tlI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUmOcjO1uefdhMO1ISzdydzeZuzkotxJm2w/dBY8RQ3/hPgeJ+
	1w1HtcLvzEXJAnxL5TenaL1360la869ZJd/nmh2EXSAUiwCZnZVIx16m7emtY5+P82H2xjrgYg/
	ibwOOP4OAdyULwals8OeknQLsqBH2OdrkTLv2Yek=
X-Gm-Gg: AZuq6aIEVTUDgz/32NR6LMxJ/VSNrjAvAYSkVtlHswwJlBvYn1rgKkMBgelCo2KzdiX
	ESGw/MKW+xzsur3ExVdFcCiLUX28tKoSDiSve55PEys9z9cmJ9Pk+2Mqg1jf9W2ai2sUs0B1e//
	yVoUgzYcEiWrWdL98LM7Cgj/nM09yYvC3lbPspn6b+4kUBraBiCldYYNz4ooi5+NdrkpENlIxEX
	BVWrfjzLAEkSCAcDI8elV277/s53r2cmdEyA3lS4Xg8JOVTjNWj6QPbHzFGtgEROqCgOTxJp06V
	c9g=
X-Received: by 2002:a17:907:1c17:b0:b88:3665:74ca with SMTP id
 a640c23a62f3a-b883665a7bcmr9859066b.34.1769031437830; Wed, 21 Jan 2026
 13:37:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251214163537.1054292-1-geomatsi@gmail.com> <20251214163537.1054292-8-geomatsi@gmail.com>
In-Reply-To: <20251214163537.1054292-8-geomatsi@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 21 Jan 2026 15:37:05 -0600
X-Gm-Features: AZwV_QieYTZwjY2bYVtnrpCLc7UXxcKQyb4yI4hidBODn8DPsYh3TVbZ0S59xj4
Message-ID: <CAFTtA3MCNeB6yMKquy=7WsovQO9RJRFb8Ph-eP3W_QiRQJYTEQ@mail.gmail.com>
Subject: Re: [PATCH v5 7/9] selftests: riscv: verify syscalls discard vector context
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Joel Granados <joel.granados@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 14, 2025 at 10:35=E2=80=AFAM Sergey Matyukevich <geomatsi@gmail=
.com> wrote:
>
> Add a test to v_ptrace test suite to verify that vector csr registers
> are clobbered on syscalls.
>
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Reviewed-by: Andy Chiu <andybnac@gmail.com>

Thanks,
Andy
