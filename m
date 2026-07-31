Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2768A2E7378;
	Fri, 31 Jul 2026 01:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785462066; cv=none; b=FQSMd+jWfd/j/Rpd36ut8Axm7psZOOHtPAA6l97ByU0I3G8AxESOHwGd8mV4fuBwwAkZZuQ9c6Li15DSEqIgyu4SKDA5NhI+ncAg0242ENvFwtFOdKbNMjXvBzov3JzhZTRXjc0BxCWEz6nB6Tw3hdjG04S0EYLfldeGmVUm/jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785462066; c=relaxed/simple;
	bh=eunME4NVuRZegw4HPrXE6Nm2SyD3Y3cJL/czwsjYnRA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SVEOJNLPOkxu6TAIWxknAvltfJ8hP6s493SuGnqhClH+ASi6WZXJ4xsHRgJ69uJcETjFZy3Lho180JH1pi6GIG+cHaYmeKdY559tFtHmJ3dYQV36efhdh34JAE5zH+ZYuLtPJPW0N3e7BLtnSyRqOrWgQs19ZNZtbwy1qXAcEco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C88n09T5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C88n09T5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859D31F00A3A;
	Fri, 31 Jul 2026 01:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785462064;
	bh=o0lhNhIehiS/JzAt0A3zWvHrVViqKQYQ3sNhBux+I/w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=C88n09T5oZqz45joBOZzXSnQsIRqDS38Gt7+dcKgg7klWkeaMtJPGV1XsN1PqMlrx
	 HHi7hdgc0QktwQx/A+dFqX7EommW95wFoJSruSyUphO9Ui7CNR+KZYKBYyU6ecmf1j
	 dNTdGpzDaPfas/DrCsISBb1eaOGhCv9l0F29WXFOVyZoeccgFeGOxH1pjyOtcliHxG
	 qvt8XD9IRPp6R1nKrxC9S6iKSfmSn5ztFbRKe1pPygvSz+0smPFSVYwKLzCZZEuXoa
	 H3IzHaIqLwMw2ugJ+Zw+q0P2RHyohFh6eC8sBj5CIuP/nMw+Fqa0ASVKPUiNFsBi15
	 XWOqQogYXp2+w==
Date: Thu, 30 Jul 2026 18:41:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, Marcelo Mendes
 Spessoto Junior <marcelospe@proton.me>
Subject: Re: [PATCH net-next 0/4] net: selftests: adjustments to
 ipv6_flowlabel_mgr
Message-ID: <20260730184103.0a5abf5b@kernel.org>
In-Reply-To: <20260727043516.93101-1-marcelospe@proton.me>
References: <20260727043516.93101-1-marcelospe@proton.me>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Jul 2026 01:25:06 -0300 Marcelo Mendes Spessoto Junior wrote:
> The ipv6_flowlabel_mgr test file was lacking coverage for the IPV6_FL_A_RENEW
> action, and the IPV6_FL_F_REMOTE and IPV6_FL_F_REFLECT flags. The first
> three patches from this set aim to add a proper test case for each.
> 
> The fourth patch proposes the adoption of "kselftest_harness.h" helpers,
> improving code readability and conforming to the implementation of the most
> recent selftests.

I sent out an AI generated review, please assume that around half of 
the comments are valid and worth addressing...
