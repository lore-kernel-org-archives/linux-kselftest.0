Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168353DE421;
	Tue, 30 Jun 2026 17:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782842229; cv=none; b=cWUcgqhCimwPiiJDI5MAUQ0stTkP/btgeEFlvkipY9bo9mARvhW1ugwGUJcwVYboi5s0SOCO837cDRI3piGRMjxoWCsmJpt0lGkXii1qtiDGjl9nWQftHk/R8gX//sfu58LOW5T5lorPwgosaoBTle2jo15YA8f7UtbUQynEyuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782842229; c=relaxed/simple;
	bh=ijlhaFpjVXfdeJ7dktwH/b2mvPfCuj27FM/h4/1WQps=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=icoawVKoma3zuL2jevxdz91LGMXQupZEh4WV5HEB1//KeDrnuIWnqBgmVpfAJklU/TgAYm+N1WSk5VvM000XSNi4RlK1gCr09UBqRWwTLMSU1jlPvGAmFevxj0JitHrO40CXFjvYCFTprmnlHfx7Ih5Bv0yFQchFkA1dGRop5vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5+VtVYo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5+VtVYo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113EC1F000E9;
	Tue, 30 Jun 2026 17:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782842227;
	bh=IeLcavi7+C47UiyNVjxiH3+XvcthVRlneDG4R02Z5UU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=T5+VtVYoHgNKPKYInKQGaNlTZqH30N+6nGAnDXzg+udBxvZMp0T3c1pgTB+jLrDQA
	 /MhtPSoxrAoYrs8XDhmAPOZRE8E+d2bg6pTHhHry4MakeJOVTvqbFPAzndAkFq/UX8
	 eZBwydAcUX2DkQyXXBuqwdrLUI/uzsj/2sxZlZ5wCaX55LyT/yzQsxDHYWAI76ZDKb
	 5IYmq50jjECPLovS3ny6Xnsl0AAZXTb3zvNharrhuJu2KNs7sRywaaws17Pnu22lnO
	 ik8OunmXxDb0rMjrzoFBWFrc/Q2aGmXZGRTqYojAUPVVKc3PxNETmfMoLrd7sKVtcN
	 61SteYKIa2upg==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 0/5] selftests/mm: refactor pkey helpers and fix
 mmap error handling
From: Mike Rapoport <rppt@kernel.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
 mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 keith.lucas@oracle.com, kevin.brodsky@arm.com, maddy@linux.ibm.com, 
 usama.anjum@collabora.com, yury.khrustalev@arm.com, jhubbard@nvidia.com, 
 joey.gouly@arm.com, zwisler@google.com, hongfu.li@linux.dev
In-Reply-To: <20260630073235.3802271-1-lihongfu@kylinos.cn>
References: <20260630073235.3802271-1-lihongfu@kylinos.cn>
Date: Tue, 30 Jun 2026 20:56:59 +0300
Message-Id: <178284221941.1178528.16877203101562630238.b4-review@b4>
X-Mailer: b4 0.15.2

On Tue, 30 Jun 2026 15:32:30 +0800, Hongfu Li <lihongfu@kylinos.cn> wrote:
> selftests/mm: refactor pkey helpers and fix mmap error handling
> 
> The main changes in this series are to refactor shared tracing and assertion
> helpers into a common file, unify both pkey selftests on pkey_assert() and
> per-test tracing for consistent diagnostics, and add missing mmap() return
> checks with MAP_FAILED used throughout for readability and consistency.
> 
> [...]

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

