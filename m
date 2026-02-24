Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8489721638D;
	Tue, 24 Feb 2026 23:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771976689; cv=none; b=eFWx1n2ZNnbmSpzUTH8guV3wjiabBeRZzPAiCNQyMkElhjv+t5DVfP4dhWwQHoTJgEsb9EbQMQ/nUvDe/SwTn+XnZnwECh0+vDqwml480JgWq8p7K+sz06RCyPexuxKma2h08eLN94oTvdBXuL+BgQj8JR1tZrIsz9AO0SmD9Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771976689; c=relaxed/simple;
	bh=Te9Sf434ncdnfzDw9exdh64Guu6TGx9lSLSzoDo6dxk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iu3UnLE+hzHbukniljuqHduo4AY+ZkU5iZ+S729xfWQMGzCk3ggVhYFbp45ClCOCkjGwHfOXNXPZQP0laHA7jj68AIUi0vOWnhHsNiYQ14qU/G9ZqWWBU/1Q+6L2tRKETK0WLL6Ey4qtl+V5OnCB4ilhHe6UL9CO+FsKI3ZA24c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N0sfX/HQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N0sfX/HQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E6EC116D0;
	Tue, 24 Feb 2026 23:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771976689;
	bh=Te9Sf434ncdnfzDw9exdh64Guu6TGx9lSLSzoDo6dxk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=N0sfX/HQPZZm/5dIbvJN9WmvSMdgFLV3+BggJukbhaVUT1VBNxaltJyCJctKN/Ql3
	 /FPPl8Le13kdRHYUMxoNCtm90AL1CdoQIzsyGZ5nNIiD9Mg3snvzBGaO6S/WTE+yJ3
	 CQSz0jxcuOxfAH2KA6oDKrUolyQvj3NKw/lKtR7ermp0tePh8ypf/5uriiBVvT9sOH
	 pxJFCZTsjs5yRt/rjMjeZIRU08DAo9wqr8K5Om1yNXyv2u3GZ8aOY0j9zIhmf0OiCT
	 zg8Rm/6/SC/6oI1GWwPSCTEZBujz2KJYQpy7q+PWB+9XiWfU8EPtPCS2Sks+S2zX1H
	 POHDLZmPRfoCQ==
Date: Tue, 24 Feb 2026 15:44:47 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, pabeni@redhat.com, edumazet@google.com,
 davem@davemloft.net, horms@kernel.org, shuah@kernel.org, kees@kernel.org,
 luto@amacapital.net, wad@chromium.org
Subject: Re: [PATCH v2 1/2] selftests/harness: order TEST_F and XFAIL_ADD
 constructors
Message-ID: <20260224154447.61be24de@kernel.org>
In-Reply-To: <20260224113900.3331-1-sun.jian.kdev@gmail.com>
References: <20260222111847.692325-1-sun.jian.kdev@gmail.com>
	<20260224113900.3331-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Feb 2026 19:38:59 +0800 Sun Jian wrote:
>   *
>   * EXPECT_* and ASSERT_* are valid in a TEST() { } context.
>   */
> +#define KSELFTEST_PRIO_TEST_F  20000
> +#define KSELFTEST_PRIO_XFAIL   20001
> +
>  #define TEST_SIGNAL(test_name, signal) __TEST_IMPL(test_name, signal)

You inserted these defines between the kdoc for TEST_SIGNAL() and its
definition.

When you respin, two notes:
 - please wait 24h after the previous version before sending a new one,
   to allow people in all timezones to comment and avoid splintering
   the discussion
 - please start a new thread for each submission, and refer to the
   previous one with a link in the changelog:

 v2:
  - bla
  - bla
 v1: https://lore.kernel.org/20260224104434.14912-1-sun.jian.kdev@gmail.com
-- 
pw-bot: cr
