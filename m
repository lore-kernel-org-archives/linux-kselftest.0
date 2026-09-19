Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A651A325495;
	Sat, 19 Sep 2026 21:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853591; cv=none; b=MxkJEagAvvgLyMgTq/wOsyPDZKagqZawRH/suraZcYe+IRyBvP8Gs27DsSDXUYaG22xwcSgqoOUI1KhkxeCebRbH4kuQTLIODOrinhDQOBcJlG3Hsx1kHgRSJw+d8iDbEDh+5GNIgvNJiNVqO0P6HyyUtKm205iuwhQBknPkLI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853591; c=relaxed/simple;
	bh=5AUe9pR5+LIYnFyHHPPntJsuVAxz88FPBfhlX1IxENo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FhbxEL26+92e4zDH/LW+FdT9rBqm67NtrcZNl0K5yZnaEwd12EzzfXEGCvAmtDYta6eXoaN2UXxB+oht31LZZAzFAJPcl9Dvh4ksjTewTdU2ju0L21oTVvNbKuaQ39ZKtHUiAV9C8J827KaQ5mYDrvpk5QXzxDwrDz4yaeUVlaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldhJehX7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldhJehX7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0481F000FF;
	Sat, 19 Sep 2026 21:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789853590;
	bh=5AUe9pR5+LIYnFyHHPPntJsuVAxz88FPBfhlX1IxENo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ldhJehX7WOFzseiMKJvpcsWG0rbdXrwAAJ4OLQ8itqXbzME2HT/g+jbWAdJB3wLvV
	 MgqGX5nV5PLZEqnI+es03Ixi0QHNGLRIfD0J5Tcav91NGMXjDYE/hrojDXuUaF4nM+
	 foligc8srf8rJ5X1paHHAhC46Ux4HySO7RRKPS6ghE55ZgmuQFfMkjK1RG70T2IdgX
	 zk7388aR0mX13+yZlNLV7SR+RiNL2DETIuPvJa2EwiJRGA4IFXaA82rlajqB6VRr5r
	 jPmlpv8PlixH3T8ptI1oKAPu5IRWIuWV+W2GJ2rCt2kJ2ImVdBQjrvds5Fr9KNn9u2
	 9WHQSuuHRYnow==
Date: Sat, 19 Sep 2026 14:33:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
 "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Mohsin Bashir
 <mohsin.bashr@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Bobby
 Eshleman <bobbyeshleman@meta.com>, Dimitri Daskalakis <daskald@meta.com>,
 Weiming Shi <bestswngs@gmail.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Breno Leitao <leitao@debian.org>, Tao Cui <cuitao@kylinos.cn>, Pavel
 Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>
Subject: Re: [PATCH net-next v3 0/5] fbnic: Support larger RX pages
Message-ID: <20260919143308.078da03b@kernel.org>
In-Reply-To: <20260915182105.4162425-1-bjorn@kernel.org>
References: <20260915182105.4162425-1-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Sep 2026 20:20:58 +0200 Bj=C3=B6rn T=C3=B6pel wrote:
> This series adds support for large io_uring zero-copy RX buffers to
> fbnic.

Good sir, this series conflicts with some net/main material,
please circle back after the Thursday merge.
