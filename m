Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E919A36309D
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 20:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775075706; cv=none; b=YT+IwNN3+VrALLLOjmC3xZDj0+xqI0ZCKqMaQ+OsdxGKD1VfEU5wy9w2ZTCRBJXoHAFW99i/Or2bCSAEeUzvpCx4d7XMNs9Byy2HZXMgTHzwpSTP8TLgYmHzO8HAGP/yRUyXt6dM/sZDpzoyJm6su/suTThGHAOwQ84p4xxY8TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775075706; c=relaxed/simple;
	bh=x0XSS4GLxq5DIa5FkZ/KX4e9Y6XyXmAPA1awtx/68hw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ArjiNbXanNjz2zD0lfjTG0r+MR4vJXOvmP9kVlXQtfzFJ1KQLh0k1eB9K7cNcstyMgAIdQu4mO1lhEinwE3bZPaQYEcj129fbXi3ljycwk6EdfGnaQcG/Qbq2gTcHBkKuPQ79i//An5jl9k5oZQuYgzyLaaQlqQf2hDOBiV+FMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kZ1JldFq; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kZ1JldFq"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775075702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x0XSS4GLxq5DIa5FkZ/KX4e9Y6XyXmAPA1awtx/68hw=;
	b=kZ1JldFq4RHVMrUZDfxNUImz0xuAmRoARAqhMRLSTP3hlZV5a7vjj13QVgGmFaeeEKb0nO
	nnsmJ27g8HUUtr8hHb5mLHHxF6RohE/Dq43L0/7ctwHOKXUuNw4p/hrGHgHLJiDJeZxQN1
	89VeNwnG8qbyaHxTM/s9/VVhQyf9B2g=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Shuah <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, sashiko@lists.linux.dev
Subject: Re: Sashiko.dev for kselftest
In-Reply-To: <d0dc7caa-052b-4d50-aeb8-60d3327d1130@kernel.org>
	(shuah@kernel.org's message of "Wed, 1 Apr 2026 13:51:30 -0600")
References: <d0dc7caa-052b-4d50-aeb8-60d3327d1130@kernel.org>
Date: Wed, 01 Apr 2026 13:34:49 -0700
Message-ID: <877bqqh11y.fsf@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

Shuah <shuah@kernel.org> writes:

Hi Shuah,

Sure, will add later today.

> Hi Roman,
>
> Please add linux-kselftest list to sashiko.dev for reviews.
>
> There might be double coverage for patches cc'ed to lkml
> and other lists such as mm, net, bpf etc. Hope that won't
> cause problems.

It's not a problem at all.

What I believe might be a problem: kselftests are mostly userspace
code and at least some parts are written somewhat loosely (which
is totally fine for tests), so Sashiko will report a ton of issues,
many of them are not worth fixing.

So I guess it will be good to put down a kselftest-specific prompt with
some guidance what we believe is acceptable in tests code and what's not.

Thanks
