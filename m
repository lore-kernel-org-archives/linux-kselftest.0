Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25BA4F55DA;
	Thu, 17 Sep 2026 12:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646914; cv=none; b=Ym4+hydWRpQXWE8Z1TfFDgZ/sYQ5VhEwEjd839f2bSLJLXRzYpJhtt4lrJJhhl64c24Ya4XzoEJNzNzftGMkt2oGxXPh3H+mO+XwbQirfO5PP8Z9UWc66S/v9LkqjMNYscf29uxTfQ2+FBCTnd4R6YMK8tbLXkBAF4iyYlqgUSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646914; c=relaxed/simple;
	bh=FZsdvWQFJ1GgHIyPu07rN60LuIicHhed3AlRLarvfxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1pFZyt91SrZrKSnaWxaMDjNJ41KfKV/3/KLa23eCztICN/tFwqJKtzkrgQxCD6vy4zJr1eBjd07Bzsjg4+iL4CQtLVmgb7RecmMK6kmtw31FLrrnI3+EvPQuoQom0XuAkxJB+cRQP+8jrHz7w8AbOtvRTsfAtr9iIoAV4pCDbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mj7/Xadm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mj7/Xadm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B50C1F000FF;
	Thu, 17 Sep 2026 12:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789646899;
	bh=KuzN7+adFVVihVcZ1qWllq0YX4TYIzhAkBl9u1gApZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mj7/XadmTyOjQj+jXV9nDdv42Nx0WNrWaoGcBK9G1mutdVCe7CFpkys/fYhHRoh+z
	 AAt4PrTVq11PNSP7O4y7WAlOOQFdiW84bnOvfEEpNUAlShH7FSa2tqLj14GaPZWgIg
	 MvZbJYIAmjSyPJSUXq2o42wUjrZo2e2qdvHa5X9iK6uUfObv80kbSBfWCY7bYA+Rgf
	 81vr3zwZVaq0yk3wwjFK7lbf1GCDdgZXqgj5NsFu9af4pCRzYzHH6n7xFZZzdrcEcY
	 XQLz03wtpsyuce4i9SARSBZCQRGdZwCoxogelX8Rc8XXbZ83rfYOislvRmIs62Dgvw
	 znHKmaiTqJ3Zw==
Date: Thu, 17 Sep 2026 13:08:14 +0100
From: Simon Horman <horms@kernel.org>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: netdev@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	Victor Nogueira <victor@mojatatu.com>, hybris <hybris@mojatatu.ai>
Subject: Re: [PATCH net 2/2] selftests/tc-testing: add u32 manual table
 handle IDR tests
Message-ID: <20260917120814.GB51261@horms.kernel.org>
References: <QDISC-LQFE.v1.20260911041746.1@mojatatu.com>
 <QDISC-LQFE.v1.20260911041746.2@mojatatu.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <QDISC-LQFE.v1.20260911041746.2@mojatatu.com>

On Wed, Sep 16, 2026 at 06:01:15AM -0400, Jamal Hadi Salim wrote:
> 35fc: create a manual table with handle 801:, then add an auto-allocated
> table. Before the fix, the auto allocation reuses id 1 and hands out the
> same handle 0x80100000, aliasing the manual table; the test requires the
> manual 801: handle to keep exactly one entry in the dump.
> 
> a6e8: with a live u32 table keeping the tc_u_common alive, add and delete
> a manual table with handle 901:, then re-add it. Unpatched, the delete
> leaks the raw-keyed IDR entry and the re-add fails with -ENOSPC; the
> test requires the re-add to succeed.
> 
> Reviewed-by: Victor Nogueira <victor@mojatatu.com>
> Tested-by: hybris <hybris@mojatatu.ai>
> Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>

Reviewed-by: Simon Horman <horms@kernel.org>

