Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCBD2E7BD9;
	Tue, 19 May 2026 01:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779154009; cv=none; b=a408VPprd914DcPgyQ/Vc+DwO9bik0SmabuuGJQnl9bQ1M6S+qYhL38ERP3a9Z4adAvnNUbcVKW3SdYvCRuLm6zelRDuPAZQp+VUiqrxV+Sh1r/AEQcnUG4t8hFSlQyip8t2s0z9E2MUTTKRa2zbNU5FI7BHVnRanMsnRZkmoyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779154009; c=relaxed/simple;
	bh=+l74kpIxRIZSWW9DekDNq4BQ0b1ooy/O7j/kcQo9Vuo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nKoi9hHpwqXjm3vXQs+XfNAFUiubaLDkVHVd3SvNZn7XGsK0S5gZ0Ie9kdaKOqu/4JE9gKjOkz1xT/yFoZYPepSZBXesykR1npFux98o2NgYjggGSGYBWtNLwA5E5zE+ArVmZXTb0cEvQc1ez5uvqJHWbl7KPEE7c/sQg10Rhgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPYbsofR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPYbsofR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF73CC2BCB8;
	Tue, 19 May 2026 01:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779154009;
	bh=+l74kpIxRIZSWW9DekDNq4BQ0b1ooy/O7j/kcQo9Vuo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EPYbsofRubkgTMJsukLa8Uyvz7/ls4Rc4NEHJc3cfYJzDaYT6JNDB7VCi5dJljP/R
	 d/ZJESGGaUauzxVJBQ/pgGqbRc/nnNEuwduN7OquwiqM0jfAFMuK9mSEXUhbHGvl3B
	 zfpIaP93hBpzin9lNhMc/f2iULzNZ/6cWSrwOwaf9ZgeqCJ1gUy7tEQ+9JhzN5FMY4
	 Q9oSPDba9DMS74xg+Vi0vqAs1ZWLk97uEWNuGo3ENzyzVHspUB0yWTOMrNGB6N1jO8
	 nPRSGuWZOp0TZeC89Fyd7tbX1EZ2pE0XMQuZfZxGwnX62svxfON+YcvILs7rJwcZCw
	 Fu3pK2MQ8HnAQ==
Date: Mon, 18 May 2026 18:26:46 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Arthur Kiyanovski <akiyano@amazon.com>
Cc: David Miller <davem@davemloft.net>, <netdev@vger.kernel.org>, Richard
 Cochran <richardcochran@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Miroslav Lichvar
 <mlichvar@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Wen Gu
 <guwen@linux.alibaba.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, David
 Woodhouse <dwmw@amazon.com>, "Yonatan Sarna" <ysarna@amazon.com>, Zorik
 Machulsky <zorik@amazon.com>, "Alexander Matushevsky" <matua@amazon.com>,
 Saeed Bshara <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>, Anthony
 Liguori <aliguori@amazon.com>, Nafea Bshara <nafea@amazon.com>, Evgeny
 Schmeilin <evgenys@amazon.com>, Netanel Belgazal <netanel@amazon.com>, Ali
 Saidi <alisaidi@amazon.com>, Benjamin Herrenschmidt <benh@amazon.com>, Noam
 Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>, Evgeny
 Ostrovsky <evostrov@amazon.com>, Ofir Tabachnik <ofirt@amazon.com>, Amit
 Bernstein <amitbern@amazon.com>, <linux-kselftest@vger.kernel.org>,
 <shuah@kernel.org>, <vadim.fedorenko@linux.dev>
Subject: Re: [PATCH v3 net-next 0/7] ptp: Add PHC timestamp quality
 attributes
Message-ID: <20260518182646.2d1337d4@kernel.org>
In-Reply-To: <20260515164033.6403-1-akiyano@amazon.com>
References: <20260515164033.6403-1-akiyano@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 15 May 2026 16:40:20 +0000 Arthur Kiyanovski wrote:
> This series adds quality attributes to PTP Hardware Clock (PHC)
> timestamps, allowing userspace to obtain error bound, clock status,
> timescale, and raw counter values alongside timestamps in a single
> call.

How does this proposal relate to:

https://lore.kernel.org/all/20260517220326.4625-9-dwmw2@infradead.org/

?
