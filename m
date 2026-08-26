Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05F03B1B3;
	Wed, 26 Aug 2026 00:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787703799; cv=none; b=kHQ/HHWOeRdwFvYBqvxDLItziHiwN84YB5JJyfVNXdSEpd1AVacjThqh/fDi6PLeeEg9D2HwZFmPYZmm7dFLP9G80Uo5izhpyXViipf5UsYmQorcRRYRRYC8Zx2L73bNONeCF6TDx8ilrPP8/+X5YX4Yp+YikqCUgJ7qGSDZtWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787703799; c=relaxed/simple;
	bh=b7I5Rga9IuEgM+h1nrky1/MNGJJ1xMIZHM9xQNrmKOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tryp/4Be9vSnPWOcJ0k0vc9KdEv3aK36Qsd29tcjwKZzfawnBGl5tsryRpO25W/dqQtud97I0aLWkkrV4Y2b/Yb2mhRx19e+DiyzkZDBnYfyVA2xo08T/Q1g2AmHZFGBs0SB0tDimD8B8aMYO7EZZGJjeYO+eCpoSv7cXh1oMqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EuAyhuPF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EuAyhuPF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8711F000E9;
	Wed, 26 Aug 2026 00:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787703798;
	bh=lgWwbnB1tbcT7QJFwjzuHzhW6jP4Q/k/RcKQYtR/3Lc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EuAyhuPFJ1MeUnV6Ra557VZNexUICiXt40eRNhw+W6jzwQxYRI4ivcpcVzw1LsEJT
	 +N8CUkMxtghi3z2aU1mAbfYqfC7RAc7hGXreIrfY5Vdk/eHb6V4Wnpgd8S4JyCWD+P
	 yNF6xzNaXhQm3ht8+jpNeWB3kkBqZ15IdtGNqx0Hx+FYWDC6VE7yxdr3ea7bmc+Ro9
	 avZYsrM9Io7GmP2aKpu7AEbWQSvi6Evkm2ydCcQuU8gCnjPTuBJ56nAnR3N2gPqWjT
	 B2uKw9nbg2agz2Qq64oXdN9qWSfF1eUGkUJH6GnHYXwd2FyQW/9jUKDvg16ndrFPO1
	 ZENYUIzDVvhFg==
From: SJ Park <sj@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: SJ Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	david@kernel.org,
	shuah@kernel.org,
	ljs@kernel.org,
	yury.khrustalev@arm.com,
	kevin.brodsky@arm.com,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] selftests/mm: remove the local PKEY_UNRESTRICTED fallback
Date: Tue, 25 Aug 2026 17:23:09 -0700
Message-ID: <20260826002310.64811-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825161715.2807297-1-hemanth.selam@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 25 Aug 2026 21:47:15 +0530 Hemanth Selam <hemanth.selam@gmail.com> wrote:

> pkey-helpers.h defines PKEY_UNRESTRICTED itself when the macro is not
> already known, a stopgap from when the generic definition was still
> under review.  It has been merged since, commit 6d61527d931b ("mm/pkey:
> Add PKEY_UNRESTRICTED macro"), so the guard is never taken and the FIXME
> can be honoured.
> 
> The definition comes from tools/include/uapi/asm-generic/mman-common.h
> via TOOLS_INCLUDES, which commit e076eaca5906 ("selftests: break the
> dependency upon local header files") added so that the mm selftests
> build without "make headers".  It is reached through the
> <asm-generic/mman.h> that the system <asm/mman.h> includes.  Building
> the pkey tests with KHDR_INCLUDES pointing at an empty directory
> confirms that; emptying TOOLS_INCLUDES as well is what makes the macro
> go missing.
> 
> No functional change intended.

Makes sense to me.

> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
