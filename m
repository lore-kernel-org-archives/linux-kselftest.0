Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD04131E830;
	Thu,  3 Sep 2026 01:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788399953; cv=none; b=k62oGkSEx/vVt1pbX9/JzgxhY/66c4z8GBZdqTR9SY2GY+Qc/qeZnI2zxGNmT/zXxQM7ai3v4846sdT3hCQ4h+iPwtAFM7l9HDxe34a+v833rQn9JvqPSXx4oN2C+KhL4+wkn/er7CwAW72ekSXDPg3BnLbsT0WllQ8Bg+ZCjzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788399953; c=relaxed/simple;
	bh=hMM+TBEHcnBre5dg+Yr2OSyOZ9ZbWW/qh/0KBxmyEUw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EC3ktFLJ5vug/jHFkW890DTkBvgJ7SThVifh/DfmHb8gwSeH4Z236btOgQVD498PW/c4xjz3pNj07SsD0E32PmshAXUIBVMdo0TGN0imL3xWH4tXzwZjXARMoS+JSNc7tRW1zTy7yKmDakXtht7933griYCo3sF3TVwJg3bv3Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJoBK866; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJoBK866"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905151F000E9;
	Thu,  3 Sep 2026 01:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788399950;
	bh=T3bWndPvQMBrVk3NSMFmQKO0bPsTLXpuK9CF2De+G2Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iJoBK866kRsMhWoxwUWv/UhlCrHsV5b2Foor01mI09h8CFgFzmIsKnR6E+7atnTFO
	 0a8iE8nZoF4jSL2gfS3yeaaRm1U62nYFYWPMVBxOb1+NYJFctI2N3Aghm02VJjqJq+
	 aA6XSoA9EX4TTNd/Js/pgb7JV4jojeH2KBT19Kr0pgCk7hKEna9oXMtp4HSwgmgp4Y
	 5RXLcZyqrj6myx2uRHYwtgQVKo9I+tLhcVm1coi4NFnQXve7SNzgXV7Bo0kLb/v7Uh
	 ElS5coRuPzMednuJU7KtfAeJfOOFI79Xg2jK+cwxBNyCor+YzxRZpDcNcigM6GZVr8
	 tadp9hz9w1hMA==
Date: Wed, 2 Sep 2026 18:45:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, David Ahern
 <dsahern@kernel.org>, Simon Horman <horms@kernel.org>, Shuah Khan
 <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 03/11] selftests: net: add a test for the
 tunnel RX drop reasons
Message-ID: <20260902184549.63f37d04@kernel.org>
In-Reply-To: <20260831215137.549324-4-littlesmilingcloud@gmail.com>
References: <20260831215137.549324-1-littlesmilingcloud@gmail.com>
	<20260831215137.549324-4-littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  1 Sep 2026 00:51:29 +0300 Anton Danilov wrote:
> Subject: [PATCH net-next 03/11] selftests: net: add a test for the tunnel RX drop reasons

Completely unclear to me what the value of the tests you're adding is.
Please look judiciously at the generated code
